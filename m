Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFFA49FDCD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:16:39 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTvS-0008PW-TO
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:16:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002AZ-NU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::32b] (port=51037
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCy-0006OK-9J
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m26so2236216wms.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KgNyl7rHEhb26DMlIz1W/qbmf3VLruT246MH1nVTBeo=;
 b=eK2jYYOabfC4C48gmnyX1Qwfj2WnyB9vtS0DELq38dhESp27zND4A26QbX442JBLlF
 Mx5y2AQ1H2NYKGUT/bo96jHfpKAXQj/UdvxVjHnmM+aAeitDmSgc5SPkRDAnm0jNYC1p
 R749DsAZanJyRnr+F9GC8g1qARgcIbi8nNLy9Cd/IbKC5ixWmpqy/4G40SwzMW0BPFsk
 LiYL1/To/UpMbqYbB/cPgkW1kGUfdyw66kvVqSDobMMQoqVRPZHAVMJnX8wgFxJFuV8z
 LIUV+IB88FLXchH5NYzZoH63AgCtJV0WxEU9htFy9sjal8zKJ+3Dq8BydOCyBD6RIPWV
 2xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KgNyl7rHEhb26DMlIz1W/qbmf3VLruT246MH1nVTBeo=;
 b=oyetFykX0rOxWw9lYASgqL/sDC7nF3Z9EEKL5/84Fr/fp7AJGKlYPSex5RFsFDEVnU
 nAScIWN42hq/ykg4nHuBkG+SNXmUMQvqwYxwkQxMQZn2ZtC8EpGQZsG7utV8pcxXvFcw
 GecYCzzGHLyJNChy+RQTRONB8Nmw1joljl7Vc/jGU6sq9uaG6YKWTFabAFGxyCevO0CP
 AL3hgyuxvNR/09wuFgI/VJnBVMrmPy0BesFjdxaDRSbJUruVGYFNIFtWBYnxMQJJKNy8
 dbh7sxxcy9dsSOGvYABHYPLNpD/AQajW/f7mUIXPmuPAJWBxDk5VQgnl2IJcPZs13nW4
 r6pw==
X-Gm-Message-State: AOAM530r7vW4i3SxXAB4LX6zI6TwjaImVtK+XZIM4mZDocbXz2GRUiXw
 ewEQALA+p+ucrpq0gWAev22AlP5fv64ppQ==
X-Google-Smtp-Source: ABdhPJyWU6F9a8b9G2sbie7ehO4pI1wSVThvIzjDIOKaLx7Aydqd0LLqDw36Mjcr197k/P0egx2xnQ==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr7901125wmq.29.1643383823303; 
 Fri, 28 Jan 2022 07:30:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/32] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Fri, 28 Jan 2022 15:29:44 +0000
Message-Id: <20220128153009.2467560-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Connect Versal's PMC SLCR (system-level control registers) model.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220121161141.14389-4-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h |  5 +++
 hw/arm/xlnx-versal.c         | 71 +++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 62fb6f0a688..811df73350b 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -26,6 +26,7 @@
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-versal-efuse.h"
+#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -78,6 +79,7 @@ struct Versal {
     struct {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
+            XlnxVersalPmcIouSlcr slcr;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -179,6 +181,9 @@ struct Versal {
 #define MM_FPD_FPD_APU              0xfd5c0000
 #define MM_FPD_FPD_APU_SIZE         0x100
 
+#define MM_PMC_PMC_IOU_SLCR         0xf1060000
+#define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
+
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fefd00b57c5..c8c0c102c74 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -21,11 +21,13 @@
 #include "kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
+#include "qemu/log.h"
+#include "hw/sysbus.h"
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
 
-#define VERSAL_NUM_PMC_APB_IRQS 2
+#define VERSAL_NUM_PMC_APB_IRQS 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -271,6 +273,7 @@ static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
      * models:
      *  - RTC
      *  - BBRAM
+     *  - PMC SLCR
      */
     object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
                             &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
@@ -392,6 +395,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
 }
 
+static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
+                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    sysbus_connect_irq(sbd, 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 2));
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -448,8 +468,31 @@ static void versal_unimp_area(Versal *s, const char *name,
     memory_region_add_subregion(mr, base, mr_dev);
 }
 
+static void versal_unimp_sd_emmc_sel(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "Selecting between enabling SD mode or eMMC mode on "
+                  "controller %d is not yet implemented\n", n);
+}
+
+static void versal_unimp_qspi_ospi_mux_sel(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "Selecting between enabling the QSPI or OSPI linear address "
+                  "region is not yet implemented\n");
+}
+
+static void versal_unimp_irq_parity_imr(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "PMC SLCR parity interrupt behaviour "
+                  "is not yet implemented\n");
+}
+
 static void versal_unimp(Versal *s)
 {
+    qemu_irq gpio_in;
+
     versal_unimp_area(s, "psm", &s->mr_ps,
                         MM_PSM_START, MM_PSM_END - MM_PSM_START);
     versal_unimp_area(s, "crl", &s->mr_ps,
@@ -464,6 +507,31 @@ static void versal_unimp(Versal *s)
                         MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
     versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
                         MM_IOU_SCNTRS, MM_IOU_SCNTRS_SIZE);
+
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_sd_emmc_sel,
+                            "sd-emmc-sel-dummy", 2);
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_qspi_ospi_mux_sel,
+                            "qspi-ospi-mux-sel-dummy", 1);
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_irq_parity_imr,
+                            "irq-parity-imr-dummy", 1);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 0,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 1);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 1,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "qspi-ospi-mux-sel-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
+                                "qspi-ospi-mux-sel", 0,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "irq-parity-imr-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
+                                SYSBUS_DEVICE_GPIO_IRQ, 0,
+                                gpio_in);
 }
 
 static void versal_realize(DeviceState *dev, Error **errp)
@@ -483,6 +551,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
+    versal_create_pmc_iou_slcr(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
-- 
2.25.1


