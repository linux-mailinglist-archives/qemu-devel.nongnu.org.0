Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA44AD838
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:19:05 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPSb-0001O5-1I
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOql-0000iE-2i
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:00 -0500
Received: from [2a00:1450:4864:20::335] (port=53047
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023l-4P
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id v129so8397707wme.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8DE+kSBE9JeorBInTufvqzj6URnlu+Op8R/h5V0Mkw4=;
 b=tGTESSntjeaiD+lm8vrkdssGA2zXmTVQJyYBWA26RWH/Qzquvej+Vm2igAejduSUKX
 s154fiukX2POawrSzxYc+QBRyL/snB/+QSqd6D9Cx+PW4OQ63BqyXFRaFzlsiBgk36Z6
 JQqJGZ0TAmX96pC/crHwnpZBZtJFNTf4bwCWW4eCibFCuUyWM/LF0LlFyjGAHomXmxSA
 SEVvSK8UsEMh+Zh8y+ZAdF+x28UQ5PikngNn/8qZBdK0YYwMR2PX67xZcZIFhzKkbKWG
 d03nUYIAXYBwmCP1kvINlnnuYCgpD0y2TZyIEr6vr2RlTInVcw+sPdCgjBO/K8bkYI2L
 pSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DE+kSBE9JeorBInTufvqzj6URnlu+Op8R/h5V0Mkw4=;
 b=fo/hAw+RfsQrgWwvyjYCBF4LBfAtfJ+eZNiia9/J2WJKNeVp2e4XYDtWVmFQ7Jr7nP
 aGS9IIHHykTPt4dJUeN7j2GSDR+v89mPlZWFDvTyYOIDon19HT+bVSaC1L+vr6cz7sEO
 UQx5KfjkMSlGXLKojirh9JKF173aYiPGseaJcWXxkdHvX1MDHWBmB8y48+JEMxLIlT9x
 BcJwiGUckToca75r6aT3BcGZ+d0AGCbqK7FwkebNhRhHiefcIQv0YF+tKl0vjbcDfGqr
 Bee+UvQtNi7WB1Wh7rNVsXxviV8pRW/6xcKvAKUaCnAqK5rEtR5DUZI9ooQHxud5l+bF
 LN1w==
X-Gm-Message-State: AOAM533BW5Sy2E4roPFI7/9oaeYGEfpOQlHlyP8DJ/kOOBhZ/7/xW5DU
 jWtyxdUS6KPlEfEU82Uq59Xu06QX2SZdUQ==
X-Google-Smtp-Source: ABdhPJxKZb60Rr/pyaOH9mdNi7eyinH1j4hH7LKijMYuRDpCCosp4bugVSa4Q9TZR2zJdjNC4gRH/A==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr767960wmc.121.1644320393673; 
 Tue, 08 Feb 2022 03:39:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/39] hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
Date: Tue,  8 Feb 2022 11:39:14 +0000
Message-Id: <20220208113948.3217356-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

'Or' the IRQs coming from the QSPI and QSPI DMA models. This is done for
avoiding the situation where one of the models incorrectly deasserts an
interrupt asserted from the other model (which will result in that the IRQ
is lost and will not reach guest SW).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220203151742.1457-1-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 062e637fe49..9424f81c377 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -38,6 +38,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
+#include "hw/or-irq.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -122,6 +123,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
+    qemu_or_irq qspi_irq_orgate;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1c52a575aad..5fbf38c4660 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,7 @@
 #define LQSPI_ADDR          0xc0000000
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
+#define NUM_QSPI_IRQ_LINES  2
 
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
@@ -362,6 +363,8 @@ static void xlnx_zynqmp_init(Object *obj)
     }
 
     object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
+    object_initialize_child(obj, "qspi-irq-orgate",
+                            &s->qspi_irq_orgate, TYPE_OR_IRQ);
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -709,6 +712,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[adma_ch_intr[i]]);
     }
 
+    object_property_set_int(OBJECT(&s->qspi_irq_orgate),
+                            "num-lines", NUM_QSPI_IRQ_LINES, &error_fatal);
+    qdev_realize(DEVICE(&s->qspi_irq_orgate), NULL, &error_fatal);
+    qdev_connect_gpio_out(DEVICE(&s->qspi_irq_orgate), 0, gic_spi[QSPI_IRQ]);
+
     if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
                                   OBJECT(system_memory), errp)) {
         return;
@@ -718,7 +726,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0,
+                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 0));
 
     if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
                                   OBJECT(&s->qspi_dma), errp)) {
@@ -729,7 +738,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 1));
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
         g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
-- 
2.25.1


