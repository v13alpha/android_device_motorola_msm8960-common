#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

-include device/motorola/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/motorola/msm8960-common

BOARD_VENDOR := motorola-msm8960

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Inline kernel building
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8
TARGET_KERNEL_SOURCE := kernel/motorola/msm8960-common
TARGET_KERNEL_CONFIG := msm8960_mmi_defconfig
TARGET_KERNEL_SELINUX_CONFIG := msm8960_mmi_selinux_defconfig
BOARD_KERNEL_CMDLINE := console=/dev/null androidboot.hardware=qcom user_debug=31 loglevel=1 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000
#backwards compat for 4.1 (making recoveries)
#BOARD_FORCE_RAMDISK_ADDRESS := 0x81600000

# Telephony
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril/MotorolaQualcommRIL.java
BOARD_RIL_NO_CELLINFOLIST:=true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DCAMERA_POWERMODE -DQCOM_BSP_CAMERA_ABI_HACK -DDISABLE_HW_ID_MATCH_CHECK
#camera abi compatiblily
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# assert
TARGET_OTA_ASSERT_DEVICE := xt925,xt926,xt907,vanquish_u,vanquish,scorpion_mini,mb886,qinara,asanti,asanti_c,xt897,xt897c

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom

#TWRP
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_USERIMAGES_USE_EXT4 := true
