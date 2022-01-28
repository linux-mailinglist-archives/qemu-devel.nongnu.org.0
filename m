Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E6A49FDA4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:09:24 +0100 (CET)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDToR-0002Ke-Lm
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDB-0002Ay-IS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::32a] (port=44986
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD1-0006Ns-2P
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4287411wms.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FXZTXesqZyKuKDZawiHNQrJkdeY3IP9KlA8IiCeAN5M=;
 b=TQLtQ/8yLVGwwqGEEmNrxaH+LK6yDch7ndn/GXD62qKKC9Kn679/ZHcyZD56TMvKGa
 tUULIdiMIFEafIaGKNMU/YlLqWwX1KFvyCLnxwzhLkJfD8o2H+gz1TqrsZmKV+7LPeGx
 jyKWX+cr5zB9TtIsscQDbToJHAk66rKGGGo1YsSLKcd7RkGHO5u80VItZWPcbi270Rqa
 b6a0y66Gn+2Uyv5pBII0PvUKasoVb1fAWKkgdnOsdgHNO1ug++14weZX6NN2S7zHXlFf
 NfRUtTAt3rtdCS6b9lo3gtUk2iYulRHJ9ywYrkfC9RD+Yg4f+qlANcUNV+5G7+u6cWeH
 lnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXZTXesqZyKuKDZawiHNQrJkdeY3IP9KlA8IiCeAN5M=;
 b=zawNRtAo6jTc2tVHzvs5C3SBrKTClSkm0iyNqvzHktoe4H311gqDnuvHLPQ4/ULaOc
 wEacHoB8yO3kpkVbLxx+y58cU+OqJFWnaLJKoL1hMguvS/A50zzzHtn75nJPO+SYuQ6c
 HLqzWLJiCXIbcOHWhNHX0io1yFCYxgwX+n7zDt5fGt7gVrzBSfLodRKkf9Hy8FsWKqS5
 xMyzoEj2A3cKDnKDFZpNMkClzyEwQsNUJ7nxqZr/sBl2frjARtVDfi7W9KKKKhspYK1i
 erW6eNQbdY92dqRpIDsIRtXibGTizQcuS8juQIQbFGF5lZPlp6Mb2TryTVS8T2UvBbPh
 virg==
X-Gm-Message-State: AOAM533ipMLpMDe73fuU5n409zkMPfiQVk5B3mXOMCYArOQcsMZp3qUH
 9Kt3OhGnv0z4UR4crFEc11tmN81uGtap+Q==
X-Google-Smtp-Source: ABdhPJyw4SASwy62lwKo3gBMp/0NHGSvP+gVqgHgnmHi4tY+uJ/gfLTHVvpumfNgW+igsfimmYR+aA==
X-Received: by 2002:a7b:c40a:: with SMTP id k10mr7816692wmi.179.1643383822626; 
 Fri, 28 Jan 2022 07:30:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/32] hw/arm/xlnx-versal: 'Or' the interrupts from the BBRAM
 and RTC models
Date: Fri, 28 Jan 2022 15:29:43 +0000
Message-Id: <20220128153009.2467560-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Francisco Iglesias <francisco.iglesias@xilinx.com>

Add an orgate and 'or' the interrupts from the BBRAM and RTC models.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220121161141.14389-3-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h |  5 +++--
 hw/arm/xlnx-versal-virt.c    |  2 +-
 hw/arm/xlnx-versal.c         | 28 ++++++++++++++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 895ba12c61e..62fb6f0a688 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -85,6 +85,8 @@ struct Versal {
         XlnxEFuse efuse;
         XlnxVersalEFuseCtrl efuse_ctrl;
         XlnxVersalEFuseCache efuse_cache;
+
+        qemu_or_irq apb_irq_orgate;
     } pmc;
 
     struct {
@@ -111,8 +113,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
-#define VERSAL_BBRAM_APB_IRQ_0     121
-#define VERSAL_RTC_APB_ERR_IRQ     121
+#define VERSAL_PMC_APB_IRQ         121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 0c5edc898e1..8ea9979710f 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -365,7 +365,7 @@ static void fdt_add_bbram_node(VersalVirt *s)
     qemu_fdt_add_subnode(s->fdt, name);
 
     qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_PMC_APB_IRQ,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop(s->fdt, name, "interrupt-names",
                      interrupt_names, sizeof(interrupt_names));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b2705b6925e..fefd00b57c5 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -25,6 +25,8 @@
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
 
+#define VERSAL_NUM_PMC_APB_IRQS 2
+
 static void versal_create_apu_cpus(Versal *s)
 {
     int i;
@@ -260,6 +262,25 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
+{
+    DeviceState *orgate;
+
+    /*
+     * The VERSAL_PMC_APB_IRQ is an 'or' of the interrupts from the following
+     * models:
+     *  - RTC
+     *  - BBRAM
+     */
+    object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
+                            &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
+    orgate = DEVICE(&s->pmc.apb_irq_orgate);
+    object_property_set_int(OBJECT(orgate),
+                            "num-lines", VERSAL_NUM_PMC_APB_IRQS, &error_fatal);
+    qdev_realize(orgate, NULL, &error_fatal);
+    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_PMC_APB_IRQ]);
+}
+
 static void versal_create_rtc(Versal *s, qemu_irq *pic)
 {
     SysBusDevice *sbd;
@@ -277,7 +298,8 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
      * TODO: Connect the ALARM and SECONDS interrupts once our RTC model
      * supports them.
      */
-    sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
+    sysbus_connect_irq(sbd, 1,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 0));
 }
 
 static void versal_create_xrams(Versal *s, qemu_irq *pic)
@@ -328,7 +350,8 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_realize(sbd, &error_fatal);
     memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
                                 sysbus_mmio_get_region(sbd, 0));
-    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+    sysbus_connect_irq(sbd, 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 1));
 }
 
 static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
@@ -455,6 +478,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
+    versal_create_pmc_apb_irq_orgate(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
-- 
2.25.1


