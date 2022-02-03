Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C584A862A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:26:46 +0100 (CET)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd4P-0004mO-NA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:26:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgO-0005bQ-Ox; Thu, 03 Feb 2022 09:01:56 -0500
Received: from [2a00:1450:4864:20::22e] (port=36377
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgJ-0000Ss-AI; Thu, 03 Feb 2022 09:01:56 -0500
Received: by mail-lj1-x22e.google.com with SMTP id j14so4069260lja.3;
 Thu, 03 Feb 2022 06:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QhwFreweWKPsGkVibsWY4YbrMuhumktWTk/WOqkoz90=;
 b=pdnmw1uuIZDpJftwM8cHTkBXGJhD6wV7u8tGrv0rkOp7oPloGdc/Rc8XLaVhBTIOC0
 J6TPgtsWnJysSdHvz2G4j5+5uq3wTgrsww8fFHW3BvGGvfXeomeNXZODhh2pRz9DofT3
 o9yS/T33RTpGwsC1Bcd53jHBXnjOmBQSb7UoXZZPiN39Gs1p/T2nCuPQV4K7V3nPPGJx
 HTTTpd7nedc0O5ssF+7e3haKvPMs2wp4HJFaE+TMo3xuhHeAPzUn0368udgzKBf/WscX
 8U204sWNUIfQ0L6wql0PhTpLH4fGWM4UDCAAlub45akrbX+IZu7sJJ8sp8acfXI4tK05
 B98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QhwFreweWKPsGkVibsWY4YbrMuhumktWTk/WOqkoz90=;
 b=K0LTdn8cM1dnCIB1OljbcbyHxB+V5Ypy0UDGuf9MXXy8Oe0PQObmieIMI9p7AR8ody
 YWR0IKxpj9dwsjI/2E7/bEf82LQXUQH+2LLO8fLEZPK98xFULaki5pXCLsgSMxv8ICHe
 1hijFnNILzhqVlELl8DV1wu4pr41Au8g8d6S7apVsnJF51GeM5iAWHHMdSx6s/5z9jJm
 f5oBGIKDoE3VBvAMQBroI1PFA/WCYwK39rCdqHQ4g6m1BESmQoLd397J97noIyXvTlcJ
 xrdbndQYgrxQmRoX96dINsJLDqXVUwHMKSHmYuB4r3k2ZOuPnVfULDw1YZ6ftRX5NT0Y
 3HQA==
X-Gm-Message-State: AOAM531f7HSWNd/fH+v4i/j0bTxHZBSDIcErwkNn2dfWCT77oJvNkTjh
 6Nu49mtMxq+gpOsoHkdyCiA4b6+3sBvq2w==
X-Google-Smtp-Source: ABdhPJzDo6aEi6XaoS2Vds2Hodft9Av6NUFZlIv8X1VJPHWLmW5rRyzi61iHDOdGKVG173fXLONvbw==
X-Received: by 2002:a2e:b0cc:: with SMTP id g12mr23093283ljl.21.1643896908999; 
 Thu, 03 Feb 2022 06:01:48 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id k2sm5072649lfe.213.2022.02.03.06.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:48 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Date: Thu,  3 Feb 2022 15:01:41 +0100
Message-Id: <20220203140141.310870-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22e.google.com
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
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP APU Control device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
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
index 9f433ee5d8..2fa8c77dfd 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -65,7 +65,7 @@
 #define DPDMA_IRQ           116
 
 #define APU_ADDR            0xfd5c0000
-#define APU_SIZE            0x100
+#define APU_IRQ             153
 
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
@@ -283,6 +283,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
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
@@ -302,7 +323,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr base;
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
-        { .name = "apu", APU_ADDR, APU_SIZE },
         { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
@@ -698,6 +718,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
-- 
2.25.1


