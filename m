Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA441DD6C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:27:15 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxxq-0005IR-6p
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjL-0000Eh-PN
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjI-0003zG-SZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so4627563wme.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E3kt++M6qm+//4TVEnDCmggaulDZDKOvhIh/GerLN3c=;
 b=HgRZiyIUNem9/KtZRXSK8ez7xsGMgqstfOMrD/TCKXnz7SN1yQqMywhLufvnsoupdI
 n/jfoUMmH5oXZG5Mt71RVGlOb65Vk2gQWCKm9k5WyiM0F/WTKmfRCWgWoQlV/f6rJ8TA
 d2WdFxQwbvwQZ5rV71qN8BICo6wv9zcqN+gQ7fe8nFXl0FCHQPbVZJe7h1iVxZygA6bM
 x41+Qdq9UPMmm8OMhexADlMnuhExeDgvnrv3GwwGghI1ZRU0XFrq2EreX62YxHd/9sQu
 7dBYeq5FXCVkhW5jiKE43584DWLzCZXmEkszQT/D/Nr1k1emu4ePIjT47UPFXewlBYs7
 QJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3kt++M6qm+//4TVEnDCmggaulDZDKOvhIh/GerLN3c=;
 b=b7xNpRSAlsjgrpTunjvf/RgEbuodLtLOUB5W9+89bFqJjLsapPK9oKkXRxjVc4tTdR
 EZz9ItLU4lXura+HS3CKNUKuJnFiyxPfSeAyX+1GUdtFB1HuHRGWaORNwYBLVRtYJOcw
 8DxfVyWnr78/3CpiCcKVlqCaObmey6UgscuMoZ0eFjsRyUnM59zfVX2WdTGccnyKMAuG
 Mf6fKeS5cbzIv5vI1llFOae0Gi8q9yBS7CsL6iZ1KYWRhOVG8w8xrxXiNkncs8JCdcig
 nRc8KMVvHrzomfYrs+CkeZ60/zboougxDSFo0hIYLdcWO/3wPtL34ipqPROE6UAxUALR
 7lBw==
X-Gm-Message-State: AOAM532hzN3AD25uDqNcq0rtwiZUd4i9tRxKkggT44OrtN5jCEKZF30q
 QVAvw671D5AHEQE9qgUqw3L2GJ0y9kIlzQ==
X-Google-Smtp-Source: ABdhPJwpNvJcVDpxSt2XPr72caQcoEITkSq1OixhiYdKw3VCct2eHG9G3EMcbq7FKJZeF3EKtNzYiQ==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr16989770wms.12.1633014731371; 
 Thu, 30 Sep 2021 08:12:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] hw/arm: xlnx-versal-virt: Add Xilinx eFUSE device
Date: Thu, 30 Sep 2021 16:11:47 +0100
Message-Id: <20210930151201.9407-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Connect the support for Versal eFUSE one-time field-programmable
bit array.

The command argument:
  -drive if=pflash,index=1,...
Can be used to optionally connect the bit array to a
backend storage, such that field-programmed values
in one invocation can be made available to next
invocation.

The backend storage must be a seekable binary file, and
its size must be 3072 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210917052400.1249094-7-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 10 +++++++
 hw/arm/xlnx-versal-virt.c    | 52 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 39 +++++++++++++++++++++++++++
 hw/arm/Kconfig               |  1 +
 4 files changed, 102 insertions(+)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 1cac6133383..895ba12c61e 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -25,6 +25,7 @@
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-versal-efuse.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -81,6 +82,9 @@ struct Versal {
 
         XlnxZynqMPRTC rtc;
         XlnxBBRam bbram;
+        XlnxEFuse efuse;
+        XlnxVersalEFuseCtrl efuse_ctrl;
+        XlnxVersalEFuseCache efuse_cache;
     } pmc;
 
     struct {
@@ -110,6 +114,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
+#define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
 #define VERSAL_RTC_SECONDS_IRQ     143
 
@@ -177,6 +182,11 @@ struct Versal {
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
 #define MM_PMC_BBRAM_CTRL_SIZE      0x00050
+#define MM_PMC_EFUSE_CTRL           0xf1240000
+#define MM_PMC_EFUSE_CTRL_SIZE      0x00104
+#define MM_PMC_EFUSE_CACHE          0xf1250000
+#define MM_PMC_EFUSE_CACHE_SIZE     0x00C00
+
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index e1c5ead475a..d2f55e29b64 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -376,6 +376,41 @@ static void fdt_add_bbram_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_efuse_ctrl_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CTRL;
+    const char interrupt_names[] = "pmc_efuse";
+    char *name = g_strdup_printf("/pmc_efuse@%x", MM_PMC_EFUSE_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_EFUSE_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CTRL,
+                                 2, MM_PMC_EFUSE_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
+static void fdt_add_efuse_cache_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CACHE;
+    char *name = g_strdup_printf("/xlnx_pmc_efuse_cache@%x",
+                                 MM_PMC_EFUSE_CACHE);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CACHE,
+                                 2, MM_PMC_EFUSE_CACHE_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -542,6 +577,18 @@ static void bbram_attach_drive(XlnxBBRam *dev)
     }
 }
 
+static void efuse_attach_drive(XlnxEFuse *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 1);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
@@ -603,6 +650,8 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_bbram_node(s);
+    fdt_add_efuse_ctrl_node(s);
+    fdt_add_efuse_cache_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
@@ -615,6 +664,9 @@ static void versal_virt_init(MachineState *machine)
     /* Attach bbram backend, if given */
     bbram_attach_drive(&s->soc.pmc.bbram);
 
+    /* Attach efuse backend, if given */
+    efuse_attach_drive(&s->soc.pmc.efuse);
+
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
         sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 23451ae0126..b2705b6925e 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -331,6 +331,44 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
 }
 
+static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
+{
+    SysBusDevice *part = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(part), "efuse",
+                             OBJECT(&s->pmc.efuse), &error_abort);
+
+    sysbus_realize(part, &error_abort);
+    memory_region_add_subregion(&s->mr_ps, base,
+                                sysbus_mmio_get_region(part, 0));
+}
+
+static void versal_create_efuse(Versal *s, qemu_irq *pic)
+{
+    Object *bits = OBJECT(&s->pmc.efuse);
+    Object *ctrl = OBJECT(&s->pmc.efuse_ctrl);
+    Object *cache = OBJECT(&s->pmc.efuse_cache);
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->pmc.efuse_ctrl,
+                            TYPE_XLNX_VERSAL_EFUSE_CTRL);
+
+    object_initialize_child(OBJECT(s), "efuse-cache", &s->pmc.efuse_cache,
+                            TYPE_XLNX_VERSAL_EFUSE_CACHE);
+
+    object_initialize_child_with_props(ctrl, "xlnx-efuse@0", bits,
+                                       sizeof(s->pmc.efuse),
+                                       TYPE_XLNX_EFUSE, &error_abort,
+                                       "efuse-nr", "3",
+                                       "efuse-size", "8192",
+                                       NULL);
+
+    qdev_realize(DEVICE(bits), NULL, &error_abort);
+    versal_realize_efuse_part(s, ctrl, MM_PMC_EFUSE_CTRL);
+    versal_realize_efuse_part(s, cache, MM_PMC_EFUSE_CACHE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -420,6 +458,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
+    versal_create_efuse(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d35ded9b241..2d37d29f02b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -382,6 +382,7 @@ config XLNX_VERSAL
     select XLNX_ZYNQMP
     select OR_IRQ
     select XLNX_BBRAM
+    select XLNX_EFUSE_VERSAL
 
 config NPCM7XX
     bool
-- 
2.20.1


