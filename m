Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BD6154FC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzlk-0002QU-JM; Tue, 01 Nov 2022 18:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlh-0002ON-WF
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:30:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzle-0007hg-Hu
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:30:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so196223wmq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OapHUN7NM7ztViS+JnW0wmguW1VcoZqNijXfU4twEVE=;
 b=c8cioBfnhALv4XsTohc7NONcXOk1PogF/3nDzk+3XkgniyfRp/upBEOkl0EWG7+v6l
 6KpgJ7O6mHdLoGThImBpl93IwjCUgnPPBESaKNJ6gudnwibQiTSj2U64l+aS5ZNjp/Xx
 7Z4ULYEjT967WpBPESNoVwnI0d8HADK7ThzQUAdXIkafM+Omu8Otu655Y6z25xmGboSz
 T0h/N+A+nYBF7r3eU4lw1L9Mu8xbK1iw/RNnm3euYHFadGF2dlxdvJyJ+qxlRHymgNRh
 yRQCskwIEu441WzoUQdo5j9jxmWg+AFBgTHgAVtOyMFY3Nyq9SgAIC50/4fvzv2JkLRk
 I3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OapHUN7NM7ztViS+JnW0wmguW1VcoZqNijXfU4twEVE=;
 b=W1tO0gmUENbwX9OLpg2sazvHtwPDzCh5s5A8dEyrHD8SR4KPCRMTeCe7yEOQ9iMrK5
 CXAZUqmE3rUCD+92NNiqVm0s77XGuZZfmr7yA24c1YgFgVd790f8VWVuqMVZLR2LxxIt
 gWpx2stpfIEbEEt4cEmgIe0VEpEWftYpvRb/UU7PbhdfaisitsBjz4W9a1qU1Ch2Y5Cn
 m1r/RuV/bCNAffd2fEOobFv7clC4vJlCBqNAmi0UCrsYA/+UY7E1IfLWbpsMw7mk31LD
 zyXpGEjuEfje2NeDfEcVryBQ+qLEXimQiyI8Up0aerkI04k2pvx6WxyPtVX3maQ9pxsr
 ej1A==
X-Gm-Message-State: ACrzQf3ihUVLzjCeaVkAInhkn45fl9TLl2lKOOxUVCn8z+442dX42hMS
 LdAF9sOSo2ZNVR8TGwEu/o76xybky8r9NQ==
X-Google-Smtp-Source: AMsMyM78dgA/B7ZMEby6gn3uuvPGE/FtWzwn1a+xW+6ujU8q2wka0rNNLIJ4Fs27s7gLgSYXsjNCjw==
X-Received: by 2002:a05:600c:6885:b0:3bd:d782:623c with SMTP id
 fn5-20020a05600c688500b003bdd782623cmr13200436wmb.102.1667341792950; 
 Tue, 01 Nov 2022 15:29:52 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk17-20020a0560001d9100b0022cdb687bf9sm13637676wrb.0.2022.11.01.15.29.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 15:29:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v6 3/3] hw/ppc/e500: Add Freescale eSDHC to e500plat
Date: Tue,  1 Nov 2022 23:29:34 +0100
Message-Id: <20221101222934.52444-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101222934.52444-1-philmd@linaro.org>
References: <20221101222934.52444-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adds missing functionality to e500plat machine which increases the
chance of given "real" firmware images to access SD cards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221018210146.193159-8-shentey@gmail.com>
[PMD: Simplify using create_unimplemented_device("esdhc")]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/ppc/ppce500.rst | 13 ++++++++++
 hw/ppc/Kconfig              |  2 ++
 hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 5 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index fa40e57d18..c9fe0915dc 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
 * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
@@ -180,3 +181,15 @@ as follows:
       -kernel vmlinux \
       -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
       -append "rootwait root=/dev/mtdblock0"
+
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
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index b8d2522f45..72a311edcb 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -128,10 +128,12 @@ config E500
     select PFLASH_CFI01
     select PLATFORM_BUS
     select PPCE500_PCI
+    select SDHCI
     select SERIAL
     select MPC_I2C
     select FDT_PPC
     select DS1338
+    select UNIMP
 
 config E500PLAT
     bool
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2fe496677c..2bef2f01cb 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -48,6 +48,8 @@
 #include "hw/net/fsl_etsec/etsec.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
+#include "hw/sd/sdhci.h"
+#include "hw/misc/unimp.h"
 
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
@@ -66,11 +68,14 @@
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
@@ -203,6 +208,22 @@ static void dt_i2c_create(void *fdt, const char *soc, const char *mpic,
     g_free(i2c);
 }
 
+static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
+{
+    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
+    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
+    int irq = MPC85XX_ESDHC_IRQ;
+    g_autofree char *name = NULL;
+
+    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
+    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
+    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
+    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
+}
 
 typedef struct PlatformDevtreeData {
     void *fdt;
@@ -553,6 +574,10 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
 
     dt_rtc_create(fdt, "i2c", "rtc");
 
+    /* sdhc */
+    if (pmc->has_esdhc) {
+        dt_sdhc_create(fdt, soc, mpic);
+    }
 
     gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
                             MPC8544_UTIL_OFFSET);
@@ -982,7 +1007,8 @@ void ppce500_init(MachineState *machine)
                        0, qdev_get_gpio_in(mpicdev, 42), 399193,
                        serial_hd(1), DEVICE_BIG_ENDIAN);
     }
-        /* I2C */
+
+    /* I2C */
     dev = qdev_new("mpc-i2c");
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -992,6 +1018,26 @@ void ppce500_init(MachineState *machine)
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
 
+    /* eSDHC */
+    if (pmc->has_esdhc) {
+        create_unimplemented_device("esdhc",
+                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
+                                    MPC85XX_ESDHC_REGS_SIZE);
+
+        /*
+         * Compatible with:
+         * - SD Host Controller Specification Version 2.0 Part A2
+         * (See MPC8569E Reference Manual)
+         */
+        dev = qdev_new(TYPE_SYSBUS_SDHCI);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_uint8(dev, "endianness", DEVICE_BIG_ENDIAN);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
+        memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
+                                    sysbus_mmio_get_region(s, 0));
+    }
 
     /* General Utility device */
     dev = qdev_new("mpc8544-guts");
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 68f754ce50..8c09ef92e4 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -27,6 +27,7 @@ struct PPCE500MachineClass {
 
     int mpic_version;
     bool has_mpc8xxx_gpio;
+    bool has_esdhc;
     hwaddr platform_bus_base;
     hwaddr platform_bus_size;
     int platform_bus_first_irq;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 5bb1c603da..44bf874b0f 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -86,6 +86,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->fixup_devtree = e500plat_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_42;
     pmc->has_mpc8xxx_gpio = true;
+    pmc->has_esdhc = true;
     pmc->platform_bus_base = 0xf00000000ULL;
     pmc->platform_bus_size = 128 * MiB;
     pmc->platform_bus_first_irq = 5;
-- 
2.38.1


