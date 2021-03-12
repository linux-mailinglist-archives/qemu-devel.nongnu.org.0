Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A1338F34
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:55:26 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiGD-0005jV-Dn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCo-0002l9-OD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:55 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCg-0001ul-1b
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id x16so1820136wrn.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4xsCRD2bMed0SCtX8gN3Rs64JErSjVm7SkMT/16Txvk=;
 b=LuxKFnI4R25pc4Twqak4eikhlj0qBgBrwj7eaypQCpB5GTffHYH39PXVXPnIW3gYes
 taCZJdTDecCl3aUEZKaBIiBuE6qZBRZMdEQg/O6tiiNkw8yROAdFCEXg9WEhoz7H7xYI
 e0v3agqVvjtfl/0AQPBRaR2++VEOIw830dhddpZBm7ASoh9ChHEpmaLRWujeDlZlVyq1
 hAkI3Em20NHP5d+5ufdfcBSjA9OVosFNQIdrS8Q3uFT60BJZi3TnPNBNpxx2IRUSqnMq
 FADQGyYY0MYYeXLwdbWTO4LnobHCRb59wlVj2VRNtq7Bttw4m4Pj0efPfvbNv6GPkWSz
 ++kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xsCRD2bMed0SCtX8gN3Rs64JErSjVm7SkMT/16Txvk=;
 b=Uw8Z/lYs7CaZsgIOrjLbxwKridSxnKQvmEk2RamrS+9QoSPpbDJTvdVaz+1pcUA/0W
 Md0pVgTwfgpsz/cHNm0DbHnKxY+c6K+8GL1MDVFFPjhZ44UtXVirai0d2quF2/dXEEVZ
 JRSh4eiGNs6hmnHSR6oM7GI5pCV7Twr3F0kAA9OK+4gcDY2UpPGfA2ezWNzLv31t7Kfw
 CWO/++bgN1Y5ZYjacdsLSJ8pAy2tTlK4KaVDqI7GIvH36FrrMvbAHvWXRkrWifQ4Z0+P
 R15bZWR/ZAaHDZRGobBS+S9GaNo5PlolcconldUvW17t9mezU4wCIgRu7/w879qbLjBh
 cksw==
X-Gm-Message-State: AOAM530YBc+jUUrJAaiKktuDVVebNeMWnGoBPbhyRGHmTXKPeOYgofp+
 7ECjRuDJKB82sP2qfVqolOPPYWbjtKa16jTU
X-Google-Smtp-Source: ABdhPJz6qCQl4OraxIL5M/I3V4iqMhinjHj7XX4U9dPo4EHcR+Z4QiitX9I7ECjKN46x3Ulcn//HlA==
X-Received: by 2002:adf:8545:: with SMTP id 63mr13853836wrh.128.1615557104441; 
 Fri, 12 Mar 2021 05:51:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/39] hw/arm: versal: Add support for the XRAMs
Date: Fri, 12 Mar 2021 13:51:03 +0000
Message-Id: <20210312135140.1099-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the support for the Versal Accelerator RAMs (XRAMs).

Reviewed-by: Luc Michel <luc@lmichel.fr>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210308224637.2949533-3-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/xlnx-versal-virt.rst |  1 +
 include/hw/arm/xlnx-versal.h         | 13 ++++++++++
 hw/arm/xlnx-versal.c                 | 36 ++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 2602d0f9953..27f73500d95 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -30,6 +30,7 @@ Implemented devices:
 - 8 ADMA (Xilinx zDMA) channels
 - 2 SD Controllers
 - OCM (256KB of On Chip Memory)
+- XRAM (4MB of on chip Accelerator RAM)
 - DDR memory
 
 QEMU does not yet model any other devices, including the PL and the AI Engine.
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 2b76885afd6..22a8fa5d11b 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -14,6 +14,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
+#include "hw/or-irq.h"
 #include "hw/sd/sdhci.h"
 #include "hw/intc/arm_gicv3.h"
 #include "hw/char/pl011.h"
@@ -22,6 +23,7 @@
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
 #include "qom/object.h"
 #include "hw/usb/xlnx-usb-subsystem.h"
+#include "hw/misc/xlnx-versal-xramc.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -31,6 +33,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
 #define XLNX_VERSAL_NR_GEMS    2
 #define XLNX_VERSAL_NR_ADMAS   8
 #define XLNX_VERSAL_NR_SDS     2
+#define XLNX_VERSAL_NR_XRAM    4
 #define XLNX_VERSAL_NR_IRQS    192
 
 struct Versal {
@@ -62,6 +65,11 @@ struct Versal {
             XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
             VersalUsb2 usb;
         } iou;
+
+        struct {
+            qemu_or_irq irq_orgate;
+            XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
+        } xram;
     } lpd;
 
     /* The Platform Management Controller subsystem.  */
@@ -96,6 +104,7 @@ struct Versal {
 #define VERSAL_GEM1_IRQ_0          58
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
+#define VERSAL_XRAM_IRQ_0          79
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -128,6 +137,10 @@ struct Versal {
 #define MM_OCM                      0xfffc0000U
 #define MM_OCM_SIZE                 0x40000
 
+#define MM_XRAM                     0xfe800000
+#define MM_XRAMC                    0xff8e0000
+#define MM_XRAMC_SIZE               0x10000
+
 #define MM_USB2_CTRL_REGS           0xFF9D0000
 #define MM_USB2_CTRL_REGS_SIZE      0x10000
 
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 628e77ef660..79609692e4e 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -278,6 +279,40 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
 }
 
+static void versal_create_xrams(Versal *s, qemu_irq *pic)
+{
+    int nr_xrams = ARRAY_SIZE(s->lpd.xram.ctrl);
+    DeviceState *orgate;
+    int i;
+
+    /* XRAM IRQs get ORed into a single line.  */
+    object_initialize_child(OBJECT(s), "xram-irq-orgate",
+                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
+    orgate = DEVICE(&s->lpd.xram.irq_orgate);
+    object_property_set_int(OBJECT(orgate),
+                            "num-lines", nr_xrams, &error_fatal);
+    qdev_realize(orgate, NULL, &error_fatal);
+    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_XRAM_IRQ_0]);
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.xram.ctrl); i++) {
+        SysBusDevice *sbd;
+        MemoryRegion *mr;
+
+        object_initialize_child(OBJECT(s), "xram[*]", &s->lpd.xram.ctrl[i],
+                                TYPE_XLNX_XRAM_CTRL);
+        sbd = SYS_BUS_DEVICE(&s->lpd.xram.ctrl[i]);
+        sysbus_realize(sbd, &error_fatal);
+
+        mr = sysbus_mmio_get_region(sbd, 0);
+        memory_region_add_subregion(&s->mr_ps,
+                                    MM_XRAMC + i * MM_XRAMC_SIZE, mr);
+        mr = sysbus_mmio_get_region(sbd, 1);
+        memory_region_add_subregion(&s->mr_ps, MM_XRAM + i * MiB, mr);
+
+        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(orgate, i));
+    }
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -363,6 +398,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
     versal_create_rtc(s, pic);
+    versal_create_xrams(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
-- 
2.20.1


