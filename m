Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A129345570
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:18:50 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWd7-0003lA-FK
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWL2-0003EX-IO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKz-0006u2-8a
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464805; x=1648000805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JqAr5E9Kwf9A6+nylYqrMWH8g9p+Y3TFjSNQCa1EmAo=;
 b=al4gd1Wk6MbLYjgmPDxHnnXSQKFjEnMJZit4ahctradt4ZonaeVNJllB
 GSYjHtPvqQozX3Had4zxMNzxz4PfkxcdgEqZ/dvdGxUrC752qICRRqM0N
 DN+eXbZ9CH4fRcTBejemXtt/db8qw0jwBs+NSQDJUELQIHjzx5j7R+YW1
 31aGf8k7T0jyimDdJLHeDQIVFybY1+caZRuJQ1s7si3nXpz3V+Anfy6NH
 YNraH+VbUPXv56Rg6yessX+VqckZDmuMPo3Di3KXRLfNit3YpqmEw0jpI
 hnsqxNEPNUJKTmBsU1PHY0WoxM4QrAeT5HkStzfOWjxY8KZPsCPA+uxTS Q==;
IronPort-SDR: MntLIENEdwFVjd+7NhIRnzkGcCQbrBA468mGLhT+QNMzsSYasx1PaLHGB0yWATmPKfJedvMczb
 6+9toCiPlT02gEJu6VbQqYvYxDzG507AqJLo9M6dU8sC8JPC7ghcMARcBbtbypCQ5JETgJa9e4
 NqlBFvIBiG8gfWdV5kkO7l4jTPtXb+0FBvtTxcjHsQCsBFOBflkcJj0Qs1as9r3AB05jxVCU0i
 N4+1J1GfRZjpy/7t1Jum4TQ3LV30QN0Wubt4HOlCh1L7Cg5MhFwD/sSRINd5c6xaT58dqbVlDa
 Ltc=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707650"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:42 +0800
IronPort-SDR: MnJb9HruOKJAMy9RcL+E5IqcEpYj0rUAavJvXsIPJomRP/w0WWy7OpAyDTDBZqaq0TYANGGWxM
 THh20k0JZ/kyTSXK7VIhV6sqWZK8fqs79Mgegf439bQk61EFnW8pflUh2nqnwCNv7EQE2iSZvy
 DUtnyi5x0fgQZuDqKa8Va5ozHf0nRBJgrcZQNntBpwo/dLqib/zvMbREBj39qlhEp8IISMzvFk
 hz9cfCpm20eXMOxApSyAWWEHCXAVQecudw2cdWB69BX/T9mQpUiXmc12ne6x7TgFJPqD441tUm
 /4OVmMY7nmIfkgJk2BWDBqwy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:50 -0700
IronPort-SDR: B0Gd8fC891gWF4dOh5u0A+xQzxijc3PKZv6/PjowsFkm8AJ8ilawgabd9rQhT0m0AfY6Zi4anj
 s2jIZUYec0Fl1BueEH7VX0yIAeMGhZnrgfdYUhu4AxR9pwDdOV1mcopCqrquVZ5zr8KKHzMpVs
 MJvdszvDbdOyD6Nf0ndsr0dfMfGiD722W99g1Ngd614lXvyc37zpUbiTIDTTVWnTobUCDjxaD/
 Z+UwsBl7bQDhMFMEolV3Os0wVrQISlDtcwfVaw5zJq2d6FL7RN2RrNmAVIYxOKsrmgFYxEKSr+
 az4=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 15/16] docs/system: riscv: Add documentation for
 'microchip-icicle-kit' machine
Date: Mon, 22 Mar 2021 21:57:55 -0400
Message-Id: <20210323015756.3168650-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds the documentation to describe what is supported for the
'microchip-icicle-kit' machine, and how to boot the machine in QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210322075248.136255-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/microchip-icicle-kit.rst | 89 ++++++++++++++++++++++
 docs/system/target-riscv.rst               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 docs/system/riscv/microchip-icicle-kit.rst

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
new file mode 100644
index 0000000000..4fe97bce3f
--- /dev/null
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -0,0 +1,89 @@
+Microchip PolarFire SoC Icicle Kit (``microchip-icicle-kit``)
+=============================================================
+
+Microchip PolarFire SoC Icicle Kit integrates a PolarFire SoC, with one
+SiFive's E51 plus four U54 cores and many on-chip peripherals and an FPGA.
+
+For more details about Microchip PolarFire SoC, please see:
+https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga
+
+The Icicle Kit board information can be found here:
+https://www.microsemi.com/existing-parts/parts/152514
+
+Supported devices
+-----------------
+
+The ``microchip-icicle-kit`` machine supports the following devices:
+
+ * 1 E51 core
+ * 4 U54 cores
+ * Core Level Interruptor (CLINT)
+ * Platform-Level Interrupt Controller (PLIC)
+ * L2 Loosely Integrated Memory (L2-LIM)
+ * DDR memory controller
+ * 5 MMUARTs
+ * 1 DMA controller
+ * 2 GEM Ethernet controllers
+ * 1 SDHC storage controller
+
+Boot options
+------------
+
+The ``microchip-icicle-kit`` machine can start using the standard -bios
+functionality for loading its BIOS image, aka Hart Software Services (HSS_).
+HSS loads the second stage bootloader U-Boot from an SD card. It does not
+support direct kernel loading via the -kernel option. One has to load kernel
+from U-Boot.
+
+The memory is set to 1537 MiB by default which is the minimum required high
+memory size by HSS. A sanity check on ram size is performed in the machine
+init routine to prompt user to increase the RAM size to > 1537 MiB when less
+than 1537 MiB ram is detected.
+
+Boot the machine
+----------------
+
+HSS 2020.12 release is tested at the time of writing. To build an HSS image
+that can be booted by the ``microchip-icicle-kit`` machine, type the following
+in the HSS source tree:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ cp boards/mpfs-icicle-kit-es/def_config .config
+  $ make BOARD=mpfs-icicle-kit-es
+
+Download the official SD card image released by Microchip and prepare it for
+QEMU usage:
+
+.. code-block:: bash
+
+  $ wget ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
+  $ gunzip core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
+  $ qemu-img resize core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic 4G
+
+Then we can boot the machine by:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
+      -bios path/to/hss.bin -sd path/to/sdcard.img \
+      -nic user,model=cadence_gem \
+      -nic tap,ifname=tap,model=cadence_gem,script=no \
+      -display none -serial stdio \
+      -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
+      -serial chardev:serial1
+
+With above command line, current terminal session will be used for the first
+serial port. Open another terminal window, and use `minicom` to connect the
+second serial port.
+
+.. code-block:: bash
+
+  $ minicom -D unix\#serial1.sock
+
+HSS output is on the first serial port (stdio) and U-Boot outputs on the
+second serial port. U-Boot will automatically load the Linux kernel from
+the SD card image.
+
+.. _HSS: https://github.com/polarfire-soc/hart-software-services
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 94d99c4c82..8d5946fbbb 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -66,6 +66,7 @@ undocumented; you can get a complete list by running
 .. toctree::
    :maxdepth: 1
 
+   riscv/microchip-icicle-kit
    riscv/sifive_u
 
 RISC-V CPU features
-- 
2.30.1


