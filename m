Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAE509E98
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:34:42 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV58-00009p-1o
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpv-0002vR-2h
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUps-0003Sb-6Y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id m14so6214439wrb.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ReWbTkMl4DXESP2NpUgeKJbFF10+7aoUcCCjIOL5Pg0=;
 b=cnXwucAX4ita/RXYBwOjjTX1ucS1P+1bWQByMWzDSrnjqWGFPedrryYLAbm985FRjL
 MQNoahUKBKUKVDIEfobInWrcfVnAf2L5g7Fxs+48/7Ve6mDZvdYaAZmdUkksYjYONxt8
 MlHvDEliVM0kqU2P+kEqx0RSmHHcZ1y0wTBlNYRl7T3+CAvVJKJwJtiyweDUJyRbZN8I
 rVTpaKUTPymYV9m5YFxw30VXciVj4aDbrWeY4x53Joqb7L7MxtNmZHjeAiu/iCPksI4f
 aXoQ+sflE4f7cS+rN1lFDR3WPq6lztDwGHSFvEFTBX/XgR9LSANj47B305qAefCtJAfx
 UTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReWbTkMl4DXESP2NpUgeKJbFF10+7aoUcCCjIOL5Pg0=;
 b=lwU71gZmNQhcj9mFDCO6uGIq2Qd/GQ4USxSq0FSo4oyjPJDlueqqZOsJLgBkzBwl8O
 acsr2hq4s5/nVpRr2aLAMKCcEahscSyCjRfnUso29pRU/Jd62D+fATFs/KTC+rdLLlP8
 uUN0paUQ6ZyRU17k29FajELj7MZzSSMLvjRloSYaO3IcxIw+itHkY2z1Z2nDsyenhSvl
 8Y159IvFwRNGr/5BiIrHSg3Pqv4SyTORRarXRrflP1WstaJyxro39K45/mG92DZqxrUV
 NT5cjHeBJCRT+sO8g5yakUTGML9Q2FFcrTAPP/Lhm0ngc5SEMIadRlBu8JcrtDHjn7fz
 zRHw==
X-Gm-Message-State: AOAM533YbCrtWMdHhENwiI/I8+pVRM038cNw4QEpOPH1DsFkqOiwa+RD
 6S/dkEorBHudsFcXAqZvdGcGVyngBcYIZg==
X-Google-Smtp-Source: ABdhPJzK0UPgKImE4KiKikblbSEvd1qxdJKlNuJlWclh3/2Cxj0Bv+gcbXAbMtosuHMl7prBdjwYJw==
X-Received: by 2002:a05:6000:18c5:b0:207:ac0d:f32 with SMTP id
 w5-20020a05600018c500b00207ac0d0f32mr18555079wrq.574.1650539934888; 
 Thu, 21 Apr 2022 04:18:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/31] hw/arm: versal: Connect the CRL
Date: Thu, 21 Apr 2022 12:18:22 +0100
Message-Id: <20220421111846.2011565-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Connect the CRL (Clock Reset LPD) to the Versal SoC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Message-id: 20220406174303.2022038-5-edgar.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h |  4 +++
 hw/arm/xlnx-versal.c         | 54 ++++++++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 155e8c4b8cd..cbe8a19c10f 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -29,6 +29,7 @@
 #include "hw/nvram/xlnx-versal-efuse.h"
 #include "hw/ssi/xlnx-versal-ospi.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/misc/xlnx-versal-crl.h"
 #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
@@ -87,6 +88,8 @@ struct Versal {
             qemu_or_irq irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
         } xram;
+
+        XlnxVersalCRL crl;
     } lpd;
 
     /* The Platform Management Controller subsystem.  */
@@ -127,6 +130,7 @@ struct Versal {
 #define VERSAL_TIMER_NS_EL1_IRQ     14
 #define VERSAL_TIMER_NS_EL2_IRQ     10
 
+#define VERSAL_CRL_IRQ             10
 #define VERSAL_UART0_IRQ_0         18
 #define VERSAL_UART1_IRQ_0         19
 #define VERSAL_USB0_IRQ_0          22
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index ebad8dbb6d8..57276e1506f 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -539,6 +539,57 @@ static void versal_create_ospi(Versal *s, qemu_irq *pic)
     qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
 }
 
+static void versal_create_crl(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    int i;
+
+    object_initialize_child(OBJECT(s), "crl", &s->lpd.crl,
+                            TYPE_XLNX_VERSAL_CRL);
+    sbd = SYS_BUS_DEVICE(&s->lpd.crl);
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
+        g_autofree gchar *name = g_strdup_printf("cpu_r5[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.rpu.cpu[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.gem); i++) {
+        g_autofree gchar *name = g_strdup_printf("gem[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.gem[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
+        g_autofree gchar *name = g_strdup_printf("adma[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.adma[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.uart); i++) {
+        g_autofree gchar *name = g_strdup_printf("uart[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.uart[i]),
+                                 &error_abort);
+    }
+
+    object_property_set_link(OBJECT(&s->lpd.crl),
+                             "usb", OBJECT(&s->lpd.iou.usb),
+                             &error_abort);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_CRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_CRL_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -622,8 +673,6 @@ static void versal_unimp(Versal *s)
 
     versal_unimp_area(s, "psm", &s->mr_ps,
                         MM_PSM_START, MM_PSM_END - MM_PSM_START);
-    versal_unimp_area(s, "crl", &s->mr_ps,
-                        MM_CRL, MM_CRL_SIZE);
     versal_unimp_area(s, "crf", &s->mr_ps,
                         MM_FPD_CRF, MM_FPD_CRF_SIZE);
     versal_unimp_area(s, "apu", &s->mr_ps,
@@ -681,6 +730,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
     versal_create_ospi(s, pic);
+    versal_create_crl(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
-- 
2.25.1


