Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12512329B6E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:11:16 +0100 (CET)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2vq-0006Xz-RG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH2ug-0005HJ-MY; Tue, 02 Mar 2021 06:10:02 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH2ue-00077M-Sc; Tue, 02 Mar 2021 06:10:02 -0500
Received: by mail-lf1-x12b.google.com with SMTP id f1so30666450lfu.3;
 Tue, 02 Mar 2021 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFV4c3TgWfAyHq01XF6j83TeOLv2ZtjkdtoWrSXhna4=;
 b=iblNGJEvNHt9Gg2YJJFKONtjC1f/bf5zVCdCZ3WfW75JDoej0AAxHYq3cSzBCD2BPR
 pJbQt/QvBtqvtHNpTo0vX9gU1F1LTtZ+UT4vsipihzlm5jUY5ybBx4urm+KtfbkoV+Jq
 a9prCiYSa9Bv22e2BtKjTHtyuMp8FNrPvyh2zxvuRIWwO0c+f3JukWf9Z0ylDirccmNN
 OgxrP3vpGpXESsOmTJFJOqA0x9fyvXAQNzHZ1Xp6wd3lJLwVVYw5+8zdqoFjz4eX6FCj
 juewDC/nmNe9/yZvAUsQxs1igfr5bhYPZTqhdmiWT94hEwcgKeysnggElQVqyNt6WJ3u
 Y3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFV4c3TgWfAyHq01XF6j83TeOLv2ZtjkdtoWrSXhna4=;
 b=EMGUlz5mXmi7Gdxse6DFMPO2utHjnHNpZW/ehhNtwVp0vFZqZEPO4Kjc1vE2PH2hpy
 Lun+5TDXuyQjUzpqs/qjyvvC/2kH2TB3sm4Rqx1yN0h4gy/IFTI0ekL6U6tZiWbyaEwd
 ur+EifEAsgq7FVA0hs8mj5Zo94Rb6lyKvnA86hfbInE0/aseGYY7uldwUMn17lRyo+I/
 KlKd7TNm8Th4dW1/vJrkn7uERZ71sq4IuIE9NJBnJXet/pPxu+mwNIF9CF3W+50Bv2lW
 Vw0k/IIvDPh/o17ne5MLw2bgXAqDl+F/NQPNJBKfRV0E526YJyc7dKG0cprJeR2KOks2
 qYLQ==
X-Gm-Message-State: AOAM531tikGe6iMRW7T7QA+6sld/svPJOQ1FVTLg8QENPlBc/TEAXqLc
 cZPik5fQxCN5agkRwguG+z8x2mv7gullCLlD
X-Google-Smtp-Source: ABdhPJyGp3aYbBRSZLXujTXgFQrm9cRucqhFjWLh8EGBG9gFJooY5nYQuxZY90OmiNtpJAuGvVuVdg==
X-Received: by 2002:ac2:42d1:: with SMTP id n17mr11709867lfl.76.1614683398636; 
 Tue, 02 Mar 2021 03:09:58 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n17sm2616601lfl.49.2021.03.02.03.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:09:58 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] hw/arm: versal: Add support for the XRAMs
Date: Tue,  2 Mar 2021 12:09:55 +0100
Message-Id: <20210302110955.1810487-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the support for the Versal Accelerator RAMs (XRAMs).

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 docs/system/arm/xlnx-versal-virt.rst |  1 +
 include/hw/arm/xlnx-versal.h         | 13 ++++++++++
 hw/arm/xlnx-versal.c                 | 36 ++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 2602d0f995..27f73500d9 100644
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
index 2b76885afd..22a8fa5d11 100644
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
index 628e77ef66..79609692e4 100644
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
2.25.1


