Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFB49FD90
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:04:29 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTjg-00074e-1d
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0002DY-N6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::429] (port=39613
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDF-0006PY-1m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id s9so11560413wrb.6
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lput9ZyfBONy+UwUh17f5j4R/MQZh8iGWIehnxeMxGQ=;
 b=gGi+tPmAa/u0w7jOM7xgMRmesuHF/Cm2jqPNn1HA10qnZ4FKEP6yFBlwnjpvLjKmjc
 872yiEmTNZRVAcggEs417B+XzK89kO7HL+Uh5+PK9jqeUFsQ0RiAJ9o2+GgvoYa6IPqQ
 IUhnVBQRMSoO6cl/WiRkmV7Uyv6/Rp/A5ipCT5pxEBMeOGaKrGF5EI0MKsjtAnWYrI5B
 FP4ElAMgrgnWfO62K9Z+33bmu7PMldZkvbFwLBUzicYnmTV7EUMw2pH6T7aHxZycjPHV
 Hpcp9s7O04no3WjFw44De06GPnXmsGVYG49G/ZRT/hJPG+aA+TRVooJmFmWytOBgZMXY
 /xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lput9ZyfBONy+UwUh17f5j4R/MQZh8iGWIehnxeMxGQ=;
 b=BfkVT7RsiEvgOfYBC3M20P6nd0RB3d82fV86q0h9Kf910G4tzDr9AVtwFebaEhufJv
 qBCBv3thMScKkoEBQQVHahZmpkOpxZFFG/YU7L2NFFDV15LagGPYNbAIHTO/k6+CIH1w
 y+v76w73MhhXF6So319ATgD2y5y4ngX2iOmfl0tuYdFOCxZBGP8vb3Ejo4oqLAeUpbar
 gtN2bKONANfdwIgXkw+WlnI74hIJWl4fWkIO3ZDx6T2yyazISTZhFQPWey1Lu13UtKxt
 pycs1vtNlkvjUzJUlcSFE/2m2LUw6khisAxBVY5kjVwDjs5qbuKteh2ihjtuAtROgaR4
 tQSw==
X-Gm-Message-State: AOAM531Ik+N30/dkyvIbQ/w4pACtcjDpcRWIj64ZltRn7z+8Y2gY1zE1
 H3/ZvAMUUyDSwVNIM9BUO7JFSQJrreQZOA==
X-Google-Smtp-Source: ABdhPJwqfKJPX2Udzzl+4KenxmiqWI1GhTFsxY9UsyBNSuq53mQif1ZxyLYaG2YsH2/3TC/IpYrfAQ==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr7401342wru.273.1643383827641; 
 Fri, 28 Jan 2022 07:30:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/32] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Date: Fri, 28 Jan 2022 15:29:48 +0000
Message-Id: <20220128153009.2467560-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Connect the OSPI flash memory controller model (including the source and
destination DMA).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220121161141.14389-8-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 20 ++++++++
 hw/arm/xlnx-versal.c         | 93 ++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 811df73350b..1b5ad4de802 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -26,6 +26,8 @@
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-versal-efuse.h"
+#include "hw/ssi/xlnx-versal-ospi.h"
+#include "hw/dma/xlnx_csu_dma.h"
 #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
@@ -80,6 +82,14 @@ struct Versal {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
             XlnxVersalPmcIouSlcr slcr;
+
+            struct {
+                XlnxVersalOspi ospi;
+                XlnxCSUDMA dma_src;
+                XlnxCSUDMA dma_dst;
+                MemoryRegion linear_mr;
+                qemu_or_irq irq_orgate;
+            } ospi;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -116,6 +126,7 @@ struct Versal {
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
 #define VERSAL_PMC_APB_IRQ         121
+#define VERSAL_OSPI_IRQ            124
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -184,6 +195,15 @@ struct Versal {
 #define MM_PMC_PMC_IOU_SLCR         0xf1060000
 #define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
 
+#define MM_PMC_OSPI                 0xf1010000
+#define MM_PMC_OSPI_SIZE            0x10000
+
+#define MM_PMC_OSPI_DAC             0xc0000000
+#define MM_PMC_OSPI_DAC_SIZE        0x20000000
+
+#define MM_PMC_OSPI_DMA_DST         0xf1011800
+#define MM_PMC_OSPI_DMA_SRC         0xf1011000
+
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index c8c0c102c74..ab58bebfd2e 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -28,6 +28,7 @@
 #define GEM_REVISION        0x40070106
 
 #define VERSAL_NUM_PMC_APB_IRQS 3
+#define NUM_OSPI_IRQ_LINES 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -412,6 +413,97 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
                        qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 2));
 }
 
+static void versal_create_ospi(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    MemoryRegion *mr_dac;
+    qemu_irq ospi_mux_sel;
+    DeviceState *orgate;
+
+    memory_region_init(&s->pmc.iou.ospi.linear_mr, OBJECT(s),
+                       "versal-ospi-linear-mr" , MM_PMC_OSPI_DAC_SIZE);
+
+    object_initialize_child(OBJECT(s), "versal-ospi", &s->pmc.iou.ospi.ospi,
+                            TYPE_XILINX_VERSAL_OSPI);
+
+    mr_dac = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 1);
+    memory_region_add_subregion(&s->pmc.iou.ospi.linear_mr, 0x0, mr_dac);
+
+    /* Create the OSPI destination DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-dst",
+                            &s->pmc.iou.ospi.dma_dst,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_dst),
+                            "dma", OBJECT(get_system_memory()),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_DST,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    /* Create the OSPI source DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-src",
+                            &s->pmc.iou.ospi.dma_src,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_bool(OBJECT(&s->pmc.iou.ospi.dma_src), "is-dst",
+                             false, &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
+                            "dma", OBJECT(mr_dac), &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
+                            "stream-connected-dma",
+                             OBJECT(&s->pmc.iou.ospi.dma_dst),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_SRC,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    /* Realize the OSPI */
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.ospi), "dma-src",
+                             OBJECT(&s->pmc.iou.ospi.dma_src), &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DAC,
+                                &s->pmc.iou.ospi.linear_mr);
+
+    /* ospi_mux_sel */
+    ospi_mux_sel = qdev_get_gpio_in_named(DEVICE(&s->pmc.iou.ospi.ospi),
+                                          "ospi-mux-sel", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "ospi-mux-sel", 0,
+                                ospi_mux_sel);
+
+    /* OSPI irq */
+    object_initialize_child(OBJECT(s), "ospi-irq-orgate",
+                            &s->pmc.iou.ospi.irq_orgate, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->pmc.iou.ospi.irq_orgate),
+                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
+
+    orgate = DEVICE(&s->pmc.iou.ospi.irq_orgate);
+    qdev_realize(orgate, NULL, &error_fatal);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 0,
+                       qdev_get_gpio_in(orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src), 0,
+                       qdev_get_gpio_in(orgate, 1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst), 0,
+                       qdev_get_gpio_in(orgate, 2));
+
+    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -552,6 +644,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
+    versal_create_ospi(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
-- 
2.25.1


