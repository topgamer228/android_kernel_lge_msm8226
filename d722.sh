#!/bin/bash

echo "What version?"
read ver

rm ./arch/arm/boot/*.dtb
rm ./arch/arm/boot/dtb*
rm ./arch/arm/boot/zImage*

make mrproper
make jagnm_cyanogenmod_defconfig
make -j4
./dtbToolCM -2 -s 2048 -p ./scripts/dtc/ -o ./arch/arm/boot/dtb.jagnm ./arch/arm/boot/
mv ./arch/arm/boot/zImage ./anykernel/zImage.jagnm

cd ./anykernel

zip -r BreadandButterKernel_CM13#$ver.zip . -x ".*"

echo "Moving zipped file to output folder."

mv *.zip  ../Release
