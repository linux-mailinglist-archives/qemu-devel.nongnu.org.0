Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2F2EBA26
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:43:57 +0100 (CET)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2Y0-0006Zr-4F
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pq-0000Xo-S3; Wed, 06 Jan 2021 01:35:30 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Po-0006QT-MS; Wed, 06 Jan 2021 01:35:30 -0500
Received: by mail-pf1-x429.google.com with SMTP id t8so1144491pfg.8;
 Tue, 05 Jan 2021 22:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zirkRo36lTO4K/qI+C44rWOQIVLw5skxXSXDCk/pUuk=;
 b=EKu+6UpcBy1Tv9H8dQ/07rW4qzuces4VX5DmsfSS/aQ5+lztA9W1QbWL83suPklalP
 cfFTwnMQtNkctSyasKiX9WRrSJst3U/W19PSC3YousmrA1xXkEg9s6pdX/EzgGmkNqMi
 o/4fNoT3SZf+jztYOIthh4GRTuf8uxUHAZIsAPA/wBPeggHiIuKLC5hA5zP8iuGU/aH0
 8WtXFYO28Jm+lqxzTQUaAViWW1h9xaCxiEg3nuJBfVZI6MKFbXp4SnmaRhQsUpq2p4Gm
 CPxKykRT+JcXq8vC4AeUs3pvJ/TGypSCbGP1QrH/zT/pjnGXGdE6aTyzkiHJhRw9HCqK
 UrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zirkRo36lTO4K/qI+C44rWOQIVLw5skxXSXDCk/pUuk=;
 b=co9F07M6cADR0XOTbaICXLb4IEY5I+WihKIwNxiXKPzTncZeEYsUhAK5vt0mnzgi2q
 O3QfEBaLPiGg98mSeenwl59I+I2IzgpV1nSr/Ob6lkaYDT82ZmQfOmZcHX1lTxh2VlQU
 jKSjBcsw2N0/ufYTnKh17DDXnAnwAkS0/nXKsnz1CUxPwgcgmHaYe/qTIyHlZoVqztXQ
 H493grx4GA99vYtrcgH1rWEItSw+jJLziOklkKukRCPzwaFRglyYNsMWBq/fs5e+JU2Y
 iCfTVbMTZcvc2zFTApAcCFrGr8ImYOYRpagxCfN7kZ4Fl3E1Go4yj5Xx/XA9tONDEdZf
 Z0/w==
X-Gm-Message-State: AOAM530OaKUU/jt+ti/zp3/wH3YhIPk/KUtewXSYRNu+3nw5I/vwDe1L
 b3w3lAbGWgLp5YqKWLYQ/hrqTi4v9aQ=
X-Google-Smtp-Source: ABdhPJwDtFD+iIX78m2ia0TKjGvnyCfpqy/giSENGmC5vcQFgoS/JJ5oHvP/iN7Q7sFXaEUW2CdNqw==
X-Received: by 2002:a63:d141:: with SMTP id c1mr2939779pgj.75.1609914927117;
 Tue, 05 Jan 2021 22:35:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 22:35:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] docs/system: arm: Add sabrelite board description
Date: Wed,  6 Jan 2021 14:35:04 +0800
Message-Id: <20210106063504.10841-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds the target guide for SABRE Lite board, and documents how
to boot a Linux kernel and U-Boot bootloader.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

---

Changes in v3:
- correct 2 typos in sabrelite.rst

Changes in v2:
- new patch: add sabrelite target guide

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 docs/system/arm/sabrelite.rst

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
new file mode 100644
index 0000000000..71713310e3
--- /dev/null
+++ b/docs/system/arm/sabrelite.rst
@@ -0,0 +1,119 @@
+Boundary Devices SABRE Lite (``sabrelite``)
+===========================================
+
+Boundary Devices SABRE Lite i.MX6 Development Board is a low-cost development
+platform featuring the powerful Freescale / NXP Semiconductor's i.MX 6 Quad
+Applications Processor.
+
+Supported devices
+-----------------
+
+The SABRE Lite machine supports the following devices:
+
+ * Up to 4 Cortex A9 cores
+ * Generic Interrupt Controller
+ * 1 Clock Controller Module
+ * 1 System Reset Controller
+ * 5 UARTs
+ * 2 EPIC timers
+ * 1 GPT timer
+ * 2 Watchdog timers
+ * 1 FEC Ethernet controller
+ * 3 I2C controllers
+ * 7 GPIO controllers
+ * 4 SDHC storage controllers
+ * 4 USB 2.0 host controllers
+ * 5 ECSPI controllers
+ * 1 SST 25VF016B flash
+
+Please note above list is a complete superset the QEMU SABRE Lite machine can
+support. For a normal use case, a device tree blob that represents a real world
+SABRE Lite board, only exposes a subset of devices to the guest software.
+
+Boot options
+------------
+
+The SABRE Lite machine can start using the standard -kernel functionality
+for loading a Linux kernel, U-Boot bootloader or ELF executable.
+
+Running Linux kernel
+--------------------
+
+Linux mainline v5.10 release is tested at the time of writing. To build a Linux
+mainline kernel that can be booted by the SABRE Lite machine, simply configure
+the kernel using the imx_v6_v7_defconfig configuration:
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make imx_v6_v7_defconfig
+  $ make
+
+To boot the newly built Linux kernel in QEMU with the SABRE Lite machine, use:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel arch/arm/boot/zImage \
+      -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
+      -initrd /path/to/rootfs.ext4 \
+      -append "root=/dev/ram"
+
+Running U-Boot
+--------------
+
+U-Boot mainline v2020.10 release is tested at the time of writing. To build a
+U-Boot mainline bootloader that can be booted by the SABRE Lite machine, use
+the mx6qsabrelite_defconfig with similar commands as described above for Linux:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make mx6qsabrelite_defconfig
+
+Note we need to adjust settings by:
+
+.. code-block:: bash
+
+  $ make menuconfig
+
+then manually select the following configuration in U-Boot:
+
+  Device Tree Control > Provider of DTB for DT Control > Embedded DTB
+
+To start U-Boot using the SABRE Lite machine, provide the u-boot binary to
+the -kernel argument, along with an SD card image with rootfs:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+      -display none -serial null -serial stdio \
+      -kernel u-boot
+
+The following example shows booting Linux kernel from dhcp, and uses the
+rootfs on an SD card. This requires some additional command line parameters
+for QEMU:
+
+.. code-block:: none
+
+  -nic user,tftp=/path/to/kernel/zImage \
+  -drive file=sdcard.img,id=rootfs -device sd-card,drive=rootfs
+
+The directory for the built-in TFTP server should also contain the device tree
+blob of the SABRE Lite board. The sample SD card image was populated with the
+root file system with one single partition. You may adjust the kernel "root="
+boot parameter accordingly.
+
+After U-Boot boots, type the following commands in the U-Boot command shell to
+boot the Linux kernel:
+
+.. code-block:: none
+
+  => setenv ethaddr 00:11:22:33:44:55
+  => setenv bootfile zImage
+  => dhcp
+  => tftpboot 14000000 imx6q-sabrelite.dtb
+  => setenv bootargs root=/dev/mmcblk3p1
+  => bootz 12000000 - 14000000
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index bde4b8e044..edd013c7bb 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
    arm/versatile
    arm/vexpress
    arm/aspeed
+   arm/sabrelite
    arm/digic
    arm/musicpal
    arm/gumstix
-- 
2.25.1


