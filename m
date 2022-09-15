Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519945B9EFB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:36:28 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYquh-00063N-AU
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkk-0008Sm-EO; Thu, 15 Sep 2022 11:26:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqki-0007Ht-IY; Thu, 15 Sep 2022 11:26:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id q21so27490269edc.9;
 Thu, 15 Sep 2022 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZOHolczObwu4dNmKQ7ZeXwvmm4Fhtb0e+sU9U5JkvSI=;
 b=UvvFEQUv1Meq/3qCdH7Ua7tfPyzGGSXlI0ncF0sl6gfFHQx0Uhk8D6yl4/hWsILX+V
 SWKbcbqNs1xrhtSx4uHvPpMZzJvBFba3x3p+d9b6kEgJYlSQFKYxDwSuLhb0fliR3HjD
 jz27C+kpPlR1Y46ly2/KFTd99Q0hZpELTqkBhffDurl5HCCi+pPfzSagXNvxb7Dtdef7
 57bNCIpEfGiUcwWVGOjQhPbQjNpHei5+CRleGQR7gE1z7csTVVjI+my4fTOwUe248OoU
 +6BAuIhbbh37OFX0Nl+cKghrz9iZsBwZsZDDC0/k2nlMCFfGkf49tG6mz3kRwj3tzsyx
 gKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZOHolczObwu4dNmKQ7ZeXwvmm4Fhtb0e+sU9U5JkvSI=;
 b=zcu5uTPlfnDsMTRgfxyvkoDAdwPniQRbqn912nW1cdzf0DsccUPbx1M6l8QT+X2jOn
 zOqwzBM/BqFyXMXlT5zqWD4huS7j8X+4Wss8LiVlewwNRCw05Eu4LrocIb16OlZy8h8T
 jW9SrTPTUGHsovD9e01qJMkbJCepEA1SovdSukXS/T75C3PyFJaMSxFma802b1JnD+5x
 56igQEvZPkDThtvHj+abQ+wcdjIYxi4ETzMBKTT6eOTypwJHHB4zYq3+AycxBJ4lx5GB
 U3WxqYXEGHJ7euLva+zxn2wA5mhaC+o/DhTVp6ShMC/ifqXfmxFmy0BSa/xZBDFuvoGM
 jhFw==
X-Gm-Message-State: ACrzQf2fKcgL0NpYz4OHH9kJn/Cpmpa+amnAjkryQ26FLQYus2n1e3MX
 8LEwvP46XCA9n1Q7P4ThlOUXsFLtiZk=
X-Google-Smtp-Source: AMsMyM6fowGSZeJGjiXUc8COOpJnOhWuf2LDRX2RalHtLlMJGFInoWHN8sh7cZY7uHiT55FzpgYydg==
X-Received: by 2002:aa7:dc13:0:b0:443:3f15:8440 with SMTP id
 b19-20020aa7dc13000000b004433f158440mr346840edu.274.1663255566925; 
 Thu, 15 Sep 2022 08:26:06 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:26:06 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/11] hw/ppc/e500: Add Freescale eSDHC to e500 boards
Date: Thu, 15 Sep 2022 17:25:20 +0200
Message-Id: <20220915152520.21948-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds missing functionality to emulated e500 SOCs which increases the
chance of given "real" firmware images to access SD cards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 13 +++++++++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index c3f55c6f3d..50b199c8f3 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
 * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
@@ -131,6 +132,18 @@ be used as follows:
       -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
       -append "rootwait root=/dev/mtdblock0"
 
+Alternatively, the root file system can also reside on an emulated SD card
+whose size must again be a power of two:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -device sd-card,drive=mydrive \
+      -drive id=mydrive,if=none,file=/path/to/rootfs.ext2,format=raw \
+      -append "rootwait root=/dev/mmcblk0"
+
 Running U-Boot
 --------------
 
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 769a1ead1c..6e31f568ba 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -129,6 +129,7 @@ config E500
     select PFLASH_CFI01
     select PLATFORM_BUS
     select PPCE500_PCI
+    select SDHCI
     select SERIAL
     select MPC_I2C
     select FDT_PPC
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7843a4e04b..87a03fd4a9 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -48,6 +48,7 @@
 #include "hw/net/fsl_etsec/etsec.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
+#include "hw/sd/sdhci.h"
 
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
@@ -66,11 +67,14 @@
 #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL
 #define MPC8544_PCI_REGS_OFFSET    0x8000ULL
 #define MPC8544_PCI_REGS_SIZE      0x1000ULL
+#define MPC85XX_ESDHC_REGS_OFFSET  0x2e000ULL
+#define MPC85XX_ESDHC_REGS_SIZE    0x1000ULL
 #define MPC8544_UTIL_OFFSET        0xe0000ULL
 #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
 #define MPC8544_I2C_REGS_OFFSET    0x3000ULL
 #define MPC8XXX_GPIO_IRQ           47
 #define MPC8544_I2C_IRQ            43
+#define MPC85XX_ESDHC_IRQ          72
 #define RTC_REGS_OFFSET            0x68
 
 #define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
@@ -203,6 +207,25 @@ static void dt_i2c_create(void *fdt, const char *soc, const char *mpic,
     g_free(i2c);
 }
 
+static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
+{
+    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
+    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
+    int irq = MPC85XX_ESDHC_IRQ;
+    char *name;
+
+    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
+    qemu_fdt_add_subnode(fdt, name);
+    /* qemu_fdt_setprop_cells(fdt, name, "voltage-ranges", 3300, 3300); */
+    qemu_fdt_setprop_cells(fdt, name, "clock-frequency", 167000000);
+    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
+    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
+    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
+    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
+    g_free(name);
+}
 
 typedef struct PlatformDevtreeData {
     void *fdt;
@@ -556,6 +579,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
 
     dt_rtc_create(fdt, "i2c", "rtc");
 
+    /* sdhc */
+    dt_sdhc_create(fdt, soc, mpic);
 
     gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
                             MPC8544_UTIL_OFFSET);
@@ -996,6 +1021,13 @@ void ppce500_init(MachineState *machine)
     i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
 
 
+    /* eSDHC */
+    dev = qdev_new(TYPE_FSL_ESDHC);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
+
     /* General Utility device */
     dev = qdev_new("mpc8544-guts");
     s = SYS_BUS_DEVICE(dev);
-- 
2.37.3


