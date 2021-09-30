Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D761841DD5E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:24:59 +0200 (CEST)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxve-0002Zd-Sr
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjL-0000Eg-OY
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjH-0003yI-LP
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id w29so10652475wra.8
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BVVGQaFtY+zcuvVCpwrCcg36mAkrFaMBGiBzIwrFBNo=;
 b=P8W+QqzjS4Da6b12wEA7XTCl0xFS0NPxyV3aaa3VsvzRbLt9bhcUknf3jcDOfqW5ad
 +KsU/FBiWcRUdqq1gBqmwUQkd6JRmg+SIwlkzR3A2ogykRk8jx+rpO0c31yzIBtoY1g9
 wx1y5ihg+VY5yDxgCLcaJPgLeZ6dQ7OH/1HTilSzjw6wNt5iSB5o5ht3av6wJyx18gie
 5o5M6Xl+IP6ihymyiQIgzqSZyYC8iEAfqgqqdf5+xdcDLSQeJ8tzv+mX7mP24t2/L1Br
 NUW67bRiJUV/zYaFxESWG3DoLWGY+Y3R1RgW8aDbzoGpkoHfJDifMW6B2oCB94LmJA+r
 nQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVVGQaFtY+zcuvVCpwrCcg36mAkrFaMBGiBzIwrFBNo=;
 b=bxmhGuDNfk3queU1dAsu6dAqPIT+TEx8CmXNi2lJqqiq2Px3h+Y0Rb/Brc5GrzFw/1
 pBvn5VHLRNezrKyDlxW6y+x/ogQeOTSFIxCyM/WewoFVUuiMqBtq0feXNNWVQqJZ5ZTW
 BSAM2B+MKWlL4+TCNie/N4WFNIpzEg/9P1Y0FAx7XGW3gg/w+LAH3R9czngqR+4MvVRF
 37pr+vbFpDX4t7J10Y+/PRda/5rVRcKBkz6DeHkFCbXyr+YXrzkMMuctsTgEd6cj3QcR
 cHwoICEZWoXrOx90NSei600qiscA0/idFcewe8qev7bMfGhuxEW/yYDHFRa+9tcViM7G
 v7Ow==
X-Gm-Message-State: AOAM530fAyjLQh9z/w0R9UOuigshPhmA0vHSduNOMwcK5FfwfJbV9r+6
 fZoGAwNV4GXERnfFlKfUMQtfrZSgmGkfOg==
X-Google-Smtp-Source: ABdhPJxWJGqJ3/2EocsNCtw1RjZwbVbOTL/tj4iJxUo3+VJu9X4CncKFMXUkHBraOlwExmqAW7ABmA==
X-Received: by 2002:adf:f946:: with SMTP id q6mr6829432wrr.437.1633014730353; 
 Thu, 30 Sep 2021 08:12:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/22] hw/arm: xlnx-versal-virt: Add Xilinx BBRAM device
Date: Thu, 30 Sep 2021 16:11:46 +0100
Message-Id: <20210930151201.9407-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

Connect the support for Versal Battery-Backed RAM (BBRAM)

The command argument:
  -drive if=pflash,index=0,...
Can be used to optionally connect the bbram to a backend
storage, such that field-programmed values in one
invocation can be made available to next invocation.

The backend storage must be a seekable binary file, and
its size must be 36 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210917052400.1249094-6-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h |  5 +++++
 hw/arm/xlnx-versal-virt.c    | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
 hw/arm/Kconfig               |  1 +
 4 files changed, 60 insertions(+)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 9b790517478..1cac6133383 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -24,6 +24,7 @@
 #include "qom/object.h"
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -79,6 +80,7 @@ struct Versal {
         } iou;
 
         XlnxZynqMPRTC rtc;
+        XlnxBBRam bbram;
     } pmc;
 
     struct {
@@ -105,6 +107,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
+#define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -172,6 +175,8 @@ struct Versal {
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
+#define MM_PMC_BBRAM_CTRL           0xf11f0000
+#define MM_PMC_BBRAM_CTRL_SIZE      0x00050
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 5bca360dcec..e1c5ead475a 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -356,6 +356,26 @@ static void fdt_add_rtc_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_bbram_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_BBRAM;
+    const char interrupt_names[] = "bbram-error";
+    char *name = g_strdup_printf("/bbram@%x", MM_PMC_BBRAM_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_BBRAM_CTRL,
+                                 2, MM_PMC_BBRAM_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -510,6 +530,18 @@ static void create_virtio_regions(VersalVirt *s)
     }
 }
 
+static void bbram_attach_drive(XlnxBBRam *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 0);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
@@ -570,6 +602,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
+    fdt_add_bbram_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
@@ -579,6 +612,9 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
+    /* Attach bbram backend, if given */
+    bbram_attach_drive(&s->soc.pmc.bbram);
+
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
         sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 547a26603a3..23451ae0126 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -314,6 +314,23 @@ static void versal_create_xrams(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_bbram(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child_with_props(OBJECT(s), "bbram", &s->pmc.bbram,
+                                       sizeof(s->pmc.bbram), TYPE_XLNX_BBRAM,
+                                       &error_fatal,
+                                       "crc-zpads", "0",
+                                       NULL);
+    sbd = SYS_BUS_DEVICE(&s->pmc.bbram);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -402,6 +419,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_sds(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
+    versal_create_bbram(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 18832abf7d1..d35ded9b241 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -381,6 +381,7 @@ config XLNX_VERSAL
     select XLNX_ZDMA
     select XLNX_ZYNQMP
     select OR_IRQ
+    select XLNX_BBRAM
 
 config NPCM7XX
     bool
-- 
2.20.1


