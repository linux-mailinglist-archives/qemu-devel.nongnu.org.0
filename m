Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92FE4411CF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:21:09 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhM0a-00019l-Vv
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mhLz1-0000Aw-5c
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 21:19:31 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mhLyw-000616-Lk
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 21:19:29 -0400
Received: by mail-il1-x133.google.com with SMTP id b10so7457511ilj.10
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 18:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wU4zKL3L6mrVr16IHiFlQlQlTzFsZpPK8x7ZBfXSvwo=;
 b=AskQjE9OclyNj/vfaP5hO/IaFuXXtU24ksepShhEQncyq5PbLVFmEC36SwG2OBUH0+
 W/MRAa5UNdWDrY8IoHoB8TeeIgXyF1tI8x0Z65TDLCwi8kvS1PZzncrIahYUl0N7Qh9V
 6JiulsNNsoLVYTSO0xzpkQfQQ8zStLMKhfT5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wU4zKL3L6mrVr16IHiFlQlQlTzFsZpPK8x7ZBfXSvwo=;
 b=LBv4JFMd20lFS79xJHoCZmP5PlYzFp+rkWf9p6PbktFuf0FHA/No3Mj5pmwUDxrSSH
 cX9H3SkXcf4klnqNGK9E6XekCZPfINjB2kOlC1UTNTRVTTydKYVYiqqtp6q7JTtrlKNb
 tfw5W6Q3y33NVxreA6y55d2GmbgdhKh2oAxvyseNqy6+fqgNkszqJe1dMC8LRKlrS9TV
 mHsDA1Vr/GubOwyf6AgoP8uA1+q6VojQ4KqhW+E+/ivfwnimJxFFgo83Jwp1bja9QrBv
 f1rkYJr9tKY5u64XNet6cae5kHPkbXRBY6kepp/VyQPmaoGFNQei+/pinsDapkiWzN+/
 O5ig==
X-Gm-Message-State: AOAM531W42gpVFFeLZFW8w6HQu9Y6Cj7yttDG3G1sCXZUKhZ8nhbPc+2
 wNHkJbGo0uYDIer5Hm/4RSSBcw==
X-Google-Smtp-Source: ABdhPJyt9TjWa5ZqkpM+XwM8aQ4QT+W9y7PygPf0NFXU/HeavftUlgaq8I6/HoB1Iiz5OoM5zg1cRg==
X-Received: by 2002:a92:cb12:: with SMTP id s18mr10187213ilo.321.1635729564533; 
 Sun, 31 Oct 2021 18:19:24 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id f11sm4351109ilu.82.2021.10.31.18.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 18:19:24 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 14/31] arm: qemu: Add an SPL build
Date: Sun, 31 Oct 2021 19:17:16 -0600
Message-Id: <20211101011734.1614781-15-sjg@chromium.org>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
In-Reply-To: <20211101011734.1614781-1-sjg@chromium.org>
References: <20211101011734.1614781-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=sjg@chromium.org; helo=mail-il1-x133.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 =?UTF-8?q?Fran=C3=A7ois=20Ozog?= <francois.ozog@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Simon Glass <sjg@chromium.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an SPL build for qemu so we can test the standard passage feature.

Include a binman definition so that SPL and U-Boot are in the same image.

For now this just boots to a prompt.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/dts/qemu-arm-u-boot.dtsi    | 22 +++++++++
 arch/arm/mach-qemu/Kconfig           |  9 ++++
 board/emulation/qemu-arm/Kconfig     | 23 +++++++--
 board/emulation/qemu-arm/MAINTAINERS |  1 +
 board/emulation/qemu-arm/Makefile    |  1 +
 board/emulation/qemu-arm/spl.c       | 27 +++++++++++
 configs/qemu_arm_spl_defconfig       | 72 ++++++++++++++++++++++++++++
 doc/board/emulation/qemu-arm.rst     | 38 +++++++++++++++
 8 files changed, 189 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi
 create mode 100644 board/emulation/qemu-arm/spl.c
 create mode 100644 configs/qemu_arm_spl_defconfig

diff --git a/arch/arm/dts/qemu-arm-u-boot.dtsi b/arch/arm/dts/qemu-arm-u-boot.dtsi
new file mode 100644
index 00000000000..2c5c7df62b4
--- /dev/null
+++ b/arch/arm/dts/qemu-arm-u-boot.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Sample device tree for qemu_arm
+
+ * Copyright 2021 Google LLC
+ */
+
+/ {
+	binman {
+		u-boot-spl {
+			size = <0x10000>;
+		};
+
+		u-boot {
+		};
+	};
+
+	pl011@9000000 {
+		u-boot,dm-spl;
+	};
+
+};
diff --git a/arch/arm/mach-qemu/Kconfig b/arch/arm/mach-qemu/Kconfig
index 186c3582ebf..ab0651ce0b1 100644
--- a/arch/arm/mach-qemu/Kconfig
+++ b/arch/arm/mach-qemu/Kconfig
@@ -20,6 +20,15 @@ config TARGET_QEMU_ARM_32BIT
 	select CPU_V7A
 	select SYS_ARCH_TIMER
 
+config TARGET_QEMU_ARM_32BIT_SPL
+	bool "ARMv7-A, 32bit with SPL"
+	select ARCH_SUPPORT_PSCI
+	select BOARD_LATE_INIT
+	select CPU_V7A
+	select SYS_ARCH_TIMER
+	select SPL
+	select BINMAN
+
 config TARGET_QEMU_ARM_64BIT
 	bool "ARMv8, 64bit"
 	select ARM64
diff --git a/board/emulation/qemu-arm/Kconfig b/board/emulation/qemu-arm/Kconfig
index 95dbefa78ba..85fbe7a9a35 100644
--- a/board/emulation/qemu-arm/Kconfig
+++ b/board/emulation/qemu-arm/Kconfig
@@ -1,12 +1,10 @@
-if TARGET_QEMU_ARM_32BIT || TARGET_QEMU_ARM_64BIT
-
-config SYS_TEXT_BASE
-	default 0x00000000
+if ARCH_QEMU
 
 config BOARD_SPECIFIC_OPTIONS # dummy
 	def_bool y
 	select CMD_QFW
 	select QFW_MMIO
+	select SUPPORT_SPL
 	imply VIRTIO_MMIO
 	imply VIRTIO_PCI
 	imply VIRTIO_NET
@@ -14,6 +12,13 @@ config BOARD_SPECIFIC_OPTIONS # dummy
 
 endif
 
+if TARGET_QEMU_ARM_32BIT || TARGET_QEMU_ARM_64BIT
+
+config SYS_TEXT_BASE
+	default 0x00000000
+
+endif
+
 if TARGET_QEMU_ARM_64BIT && !TFABOOT
 config BOARD_SPECIFIC_OPTIONS
 	imply SYS_MTDPARTS_RUNTIME
@@ -21,3 +26,13 @@ config BOARD_SPECIFIC_OPTIONS
 
 source "board/emulation/common/Kconfig"
 endif
+
+if TARGET_QEMU_ARM_32BIT_SPL
+
+config SPL_TEXT_BASE
+	default 0x00000000
+
+config SYS_TEXT_BASE
+	default 0x00010000
+
+endif
diff --git a/board/emulation/qemu-arm/MAINTAINERS b/board/emulation/qemu-arm/MAINTAINERS
index e757ffc64f1..b79d4ab85b2 100644
--- a/board/emulation/qemu-arm/MAINTAINERS
+++ b/board/emulation/qemu-arm/MAINTAINERS
@@ -4,4 +4,5 @@ S:	Maintained
 F:	board/emulation/qemu-arm/
 F:	include/configs/qemu-arm.h
 F:	configs/qemu_arm_defconfig
+F:	configs/qemu_arm_spl_defconfig
 F:	configs/qemu_arm64_defconfig
diff --git a/board/emulation/qemu-arm/Makefile b/board/emulation/qemu-arm/Makefile
index a22d1237ff4..54635646e07 100644
--- a/board/emulation/qemu-arm/Makefile
+++ b/board/emulation/qemu-arm/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0+
 
 obj-y	+= qemu-arm.o
+obj-$(CONFIG_SPL_BUILD)	+= spl.o
diff --git a/board/emulation/qemu-arm/spl.c b/board/emulation/qemu-arm/spl.c
new file mode 100644
index 00000000000..785177a6c8d
--- /dev/null
+++ b/board/emulation/qemu-arm/spl.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 Google LLC
+ * Written by Simon Glass <sjg@chromium.org>
+ */
+
+#include <common.h>
+#include <cpu_func.h>
+#include <spl.h>
+#include <asm/spl.h>
+
+u32 spl_boot_device(void)
+{
+	return BOOT_DEVICE_BOARD;
+}
+
+static int spl_qemu_load_image(struct spl_image_info *spl_image,
+			       struct spl_boot_device *bootdev)
+{
+	spl_image->name = "U-Boot";
+	spl_image->load_addr = spl_get_image_pos();
+	spl_image->entry_point = spl_get_image_pos();
+	flush_cache(spl_image->load_addr, spl_get_image_size());
+
+	return 0;
+}
+SPL_LOAD_IMAGE_METHOD("QEMU", 0, BOOT_DEVICE_BOARD, spl_qemu_load_image);
diff --git a/configs/qemu_arm_spl_defconfig b/configs/qemu_arm_spl_defconfig
new file mode 100644
index 00000000000..a6950584542
--- /dev/null
+++ b/configs/qemu_arm_spl_defconfig
@@ -0,0 +1,72 @@
+CONFIG_ARM=y
+CONFIG_SYS_ICACHE_OFF=y
+CONFIG_SYS_DCACHE_OFF=y
+CONFIG_ARM_SMCCC=y
+CONFIG_ARCH_QEMU=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_SYS_MALLOC_LEN=0x1000000
+CONFIG_DEFAULT_DEVICE_TREE="qemu-arm"
+CONFIG_TARGET_QEMU_ARM_32BIT_SPL=y
+CONFIG_SPL_SERIAL=y
+CONFIG_DEBUG_UART_BASE=0x9000000
+CONFIG_DEBUG_UART_CLOCK=0
+CONFIG_ARMV7_LPAE=y
+CONFIG_DEBUG_UART=y
+CONFIG_AHCI=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_SYS_LOAD_ADDR=0x40200000
+CONFIG_FIT=y
+CONFIG_FIT_SIGNATURE=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_FIT_BEST_MATCH=y
+CONFIG_LEGACY_IMAGE_FORMAT=y
+CONFIG_USE_PREBOOT=y
+# CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_DISPLAY_BOARDINFO is not set
+CONFIG_PCI_INIT_R=y
+CONFIG_SPL_FRAMEWORK_BOARD_INIT_F=y
+CONFIG_CMD_BOOTEFI_SELFTEST=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_DFU=y
+CONFIG_CMD_MTD=y
+CONFIG_CMD_PCI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_MTDPARTS=y
+CONFIG_SPL_OF_CONTROL=y
+CONFIG_OF_BOARD=y
+CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4000000
+CONFIG_SPL_DM=y
+CONFIG_SCSI_AHCI=y
+CONFIG_AHCI_PCI=y
+CONFIG_DFU_TFTP=y
+CONFIG_DFU_MTD=y
+CONFIG_DFU_RAM=y
+# CONFIG_MMC is not set
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_MTD_NOR_FLASH=y
+CONFIG_CFI_FLASH=y
+CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
+CONFIG_FLASH_CFI_MTD=y
+CONFIG_SYS_FLASH_CFI=y
+CONFIG_DM_ETH=y
+CONFIG_E1000=y
+CONFIG_NVME=y
+CONFIG_PCI=y
+CONFIG_PCIE_ECAM_GENERIC=y
+CONFIG_SCSI=y
+CONFIG_DM_SCSI=y
+CONFIG_DEBUG_UART_PL011=y
+CONFIG_DEBUG_UART_SHIFT=2
+CONFIG_SYSRESET=y
+CONFIG_SPL_SYSRESET=y
+CONFIG_SYSRESET_PSCI=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_PCI=y
+# CONFIG_BINMAN_FDT is not set
diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu-arm.rst
index a39df046fc3..aa05d0a5afe 100644
--- a/doc/board/emulation/qemu-arm.rst
+++ b/doc/board/emulation/qemu-arm.rst
@@ -38,6 +38,11 @@ Set the CROSS_COMPILE environment variable as usual, and run:
     make qemu_arm64_defconfig
     make
 
+- for ARM with SPL::
+
+    make qemu_arm_spl_defconfig
+    make
+
 Running U-Boot
 --------------
 The minimal QEMU command line to get U-Boot up and running is:
@@ -50,6 +55,10 @@ The minimal QEMU command line to get U-Boot up and running is:
 
     qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57 -bios u-boot.bin
 
+- For ARM with SPL::
+
+    qemu-system-arm -machine virt -nographic -bios image.bin
+
 Note that for some odd reason qemu-system-aarch64 needs to be explicitly
 told to use a 64-bit CPU or it will boot in 32-bit mode. The -nographic argument
 ensures that output appears on the terminal. Use Ctrl-A X to quit.
@@ -85,6 +94,35 @@ can be enabled with the following command line parameters:
 
 These have been tested in QEMU 2.9.0 but should work in at least 2.5.0 as well.
 
+SPL Description
+---------------
+
+As you see above, running the SPL build is a little different, since there are
+two binaries to load into memory: SPL and U-Boot proper. Binman is used to
+produce the combined `image.bin` containing these. See
+`arch/arm/dts/qemu-arm-u-boot.dtsi` for the definition. A custom loader called
+`spl_qemu_load_image()` is used to access the U-Boot binary from within SPL.
+
+A sample run is shown below::
+
+    U-Boot SPL 2021.10 (Oct 28 2021 - 20:57:27 -0600)
+    Trying to boot from QEMU
+
+
+    U-Boot 2021.10 (Oct 28 2021 - 20:57:27 -0600)
+
+    DRAM:  128 MiB
+    Flash: 64 MiB
+    Loading Environment from Flash... *** Warning - bad CRC, using default environment
+
+    In:    pl011@9000000
+    Out:   pl011@9000000
+    Err:   pl011@9000000
+    Net:   eth0: virtio-net#32
+    Hit any key to stop autoboot:  0
+    =>
+
+
 Debug UART
 ----------
 
-- 
2.33.1.1089.g2158813163f-goog


