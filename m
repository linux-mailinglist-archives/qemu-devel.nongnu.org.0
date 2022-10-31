Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516BB613507
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:56:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTNR-0005Ft-Ph; Mon, 31 Oct 2022 07:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNM-00056t-9G
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNH-0005Dh-Eo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id v1so15592456wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYVFA4SdMsanc8gPQeu65EoQCeO4p7z8sr2O1U80+4s=;
 b=bk+h0ypSbH5+uV44P25t82lWkWiVMjRITgKhCADIORghg40CB+7ynvKV5CcsCFq288
 FD5jCEosUaK7i+kwpmd2JB4q1jaqUPEFU5c0WeGCb2OwePRND+Xk912lWwGVtcijhNsW
 lXsXoxzBqllngHHiES++Oa1Uxa5VOzgQQcXil43B+Xx685v+gt0sLm1v9dpG8qoKL6A+
 y+QJqcVz+AgteBwJSRJYZN1Jfi6kIhwQj/5ZgycWUJSm2W6RAm3fM5BhGZHmY1BkscsQ
 134P23EUxk83snPxzJ4lvduWNqkpRpmj/3fSkdGiZU5BCpiCNn3bfRwIqv7URs3BwADK
 fGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYVFA4SdMsanc8gPQeu65EoQCeO4p7z8sr2O1U80+4s=;
 b=cJ6zOGpb7S/sjCZecfApJTmBugGPg1lOFQnkrg/6UXjW1O+Lslw03CZemIzmTFu1WR
 VRxY0N2m2ZOp+eB+Ec5kVheFncTlm/TBvy4BLhJELzgO3hxY70wIo5zSKYSCE3wHFuzO
 NSW3UlpqLltjAvwE2P/aP+a5f/mpMTVQbf7PF2A52lLRF7bXM4lPEi/x7iZU8dJndFaF
 CQkOykakgc8l4KqHU1e6bp64e5Aszshjbt7sPJAMm7ouX+SVXbs69/WDDb9uxZQO9JFE
 uMIYO0BulozVzpgyuw060+BDdCr93Om37rwn4dcJpVVDp0UkY9gcaJk/ysC6k7ptXHGu
 BiMA==
X-Gm-Message-State: ACrzQf03m3Zi87bz4Bt3MGIhUfQPKa50xywbH04tY96tC95PUYAc1tvd
 sQy2UfkJjAkBJcR5RyY8YU//Y8nrFcnPUA==
X-Google-Smtp-Source: AMsMyM79z+MWjfmotPbG2TfElaYc3Sv8dgB2vUBxXZHB29Gcvb43a9jD2ZLETVXQJSW2IdGwgDS6PA==
X-Received: by 2002:a05:6000:1f8b:b0:236:7766:4b32 with SMTP id
 bw11-20020a0560001f8b00b0023677664b32mr7442524wrb.683.1667217277997; 
 Mon, 31 Oct 2022 04:54:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b003a5f3f5883dsm7429867wmq.17.2022.10.31.04.54.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 6/6] hw/ppc/e500: Add Freescale eSDHC to e500plat
Date: Mon, 31 Oct 2022 12:54:02 +0100
Message-Id: <20221031115402.91912-7-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Adds missing functionality to e500plat machine which increases the
chance of given "real" firmware images to access SD cards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221018210146.193159-8-shentey@gmail.com>
[PMD: Simplify using create_unimplemented_device("esdhc")]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/ppc/ppce500.rst | 12 ++++++++++
 hw/ppc/Kconfig              |  2 ++
 hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 5 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 38f8ceb0cf..c9fe0915dc 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
 * Power-off functionality via one GPIO pin
 * 1 Freescale MPC8xxx PCI host controller
 * VirtIO devices via PCI bus
+* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
 * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
 
 Hardware configuration information
@@ -181,3 +182,14 @@ as follows:
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
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 769a1ead1c..c48aaaa9dc 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -129,10 +129,12 @@ config E500
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
index 84bcc25526..80e4c4c4ca 100644
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
+        uint64_t sdhci_regsize;
+
+        dev = qdev_new(TYPE_SYSBUS_SDHCI);
+        /*
+         * Compatible with:
+         * - SD Host Controller Specification Version 2.0 Part A2
+         */
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
+        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
+        sdhci_regsize = memory_region_size(sysbus_mmio_get_region(s, 0));
+        create_unimplemented_device("esdhc",
+                                    pmc->ccsrbar_base
+                                    + MPC85XX_ESDHC_REGS_OFFSET + sdhci_regsize,
+                                    MPC85XX_ESDHC_REGS_SIZE - sdhci_regsize);
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
2.37.3


