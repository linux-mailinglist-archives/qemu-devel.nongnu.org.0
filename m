Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457F4A3AED
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:19:00 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJTH-0002w2-NM
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMr-00039j-NV; Sun, 30 Jan 2022 18:12:21 -0500
Received: from [2a00:1450:4864:20::132] (port=36861
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000wM-Dv; Sun, 30 Jan 2022 18:12:21 -0500
Received: by mail-lf1-x132.google.com with SMTP id z4so23240250lft.3;
 Sun, 30 Jan 2022 15:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1F3+puTZr1DZ4kBGSmpA1htM6Qaj/R8hFIUIKtKfaE=;
 b=pqeHBodZSH4dS3zZIDc5IuI6ylBDlkyaKE9M0YDnFKaXr1wFgcENGaOGggVd3lVkhE
 7qgyEGX1DCvkEaKiNpt/PWcR+cXsdIsmv8jDKgv4Cg7uuVS8kOLE2B7nYRfY9RsMfxri
 KIe7j/vInjR5EttHSh07e2FnALc1hRysjrG0ZnYsyTYenzJaDkZrYrOum1eLNppSIIs9
 OBMGD1vy5y8w1EnQq/GaSmthP30eX+KhqD1Zua1MBXz3PZBAsroeXW4CoqUzEjpeDzR2
 dqQNSWbYpdg3qCp7SjErJYALHMnyMwz952Xo2Moif/ygSgGCA3Q6LnT2mvou1mVlbknu
 NfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1F3+puTZr1DZ4kBGSmpA1htM6Qaj/R8hFIUIKtKfaE=;
 b=tPbjg4V49o99u1UgpQdW1C2PzJVJRYveSo20ET88kaYwqDx8CTR5jAvlj4+b8d5gLW
 UqsNk6Y13HPb8kxRcaYyTOLwGaPf8Rx/7G2kQyT5y0mOpkqGHqGjFZIC/zB5Y8loUYEw
 wAC9bXJSaciyjVHy9pw4oI8cUVDJop6apUNfmeHPBsiQI77oEqPQDcfceMSAlixIoAP0
 FxtbiWy0nxIZ+/QdN2QrC7WP8Sgz3Ag5raJVrvxEYngDmracLe/n0yF4UZMTRihATy1p
 uz7CxpyiBIkRAVEMCHGEISLFKycl0s7Ti84q/3P56Bwjsc/tlYoo+SAjnalmfMlPlMxt
 jnlA==
X-Gm-Message-State: AOAM531FTHd5Fti+M354vLoKgemapwgjf15s2ku0uTMgauuEUXSXdK1k
 8ffgHHnJVIEDH62MBXMF4/e5iJF9dKj9Kw==
X-Google-Smtp-Source: ABdhPJy13HwhAfIQ6JTnXdQtrrns09oLSHntzECtLliMZm0QctPXBudsvew/uhAwTAyogftG+06bYA==
X-Received: by 2002:a05:6512:2386:: with SMTP id
 c6mr14116923lfv.299.1643584333683; 
 Sun, 30 Jan 2022 15:12:13 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q6sm2986300lfr.171.2022.01.30.15.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:13 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Date: Mon, 31 Jan 2022 00:12:06 +0100
Message-Id: <20220130231206.34035-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130231206.34035-1-edgar.iglesias@gmail.com>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP APU Control device.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  4 +++-
 hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d5a3ad3df2..05cd2128f3 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -38,6 +38,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
+#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
@@ -85,7 +86,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
 
 struct XlnxZynqMPState {
     /*< private >*/
@@ -123,6 +124,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
+    XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
 
     char *boot_cpu;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 857d3c9636..21c411cd77 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -64,7 +64,7 @@
 #define DPDMA_IRQ           116
 
 #define APU_ADDR            0xfd5c0000
-#define APU_SIZE            0x100
+#define APU_IRQ             153
 
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
@@ -282,6 +282,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
 }
 
+static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i;
+
+    object_initialize_child(OBJECT(s), "apu-ctrl", &s->apu_ctrl,
+                            TYPE_XLNX_ZYNQMP_APU_CTRL);
+    sbd = SYS_BUS_DEVICE(&s->apu_ctrl);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+        g_autofree gchar *name = g_strdup_printf("cpu%d", i);
+
+        object_property_set_link(OBJECT(&s->apu_ctrl), name,
+                                 OBJECT(&s->apu_cpu[i]), &error_abort);
+    }
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, APU_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[APU_IRQ]);
+}
+
 static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
 {
     SysBusDevice *sbd;
@@ -301,7 +322,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr base;
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
-        { .name = "apu", APU_ADDR, APU_SIZE },
         { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
@@ -697,6 +717,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
-- 
2.25.1


