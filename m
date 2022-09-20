Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A25BDFFB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:28:19 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYc6-0003nH-Fd
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oaYPc-0004is-5S
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:15:24 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oaYPa-0006uR-5P
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:15:23 -0400
Received: by mail-lj1-x233.google.com with SMTP id l12so2024920ljg.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dnDEf1dx0KOWg4bk3uO6+evJjbNpnMa8XL0WfJ1ViHE=;
 b=afCHRvwvfvU+pKm093wch8zpKP0ow5RMJEhRuFNAq85Ge/usXpwe7jM6c4Pcv35Fuw
 uJLJOockI33LnMMo3i5gQY20aUfTPPiVDtZpM05v5A0z6lEOWcxB5n7lkH74ZfkDFRy3
 IWzzkHh9v8NtOm9aKu+r7f52u0cVX4BQYV3ex3S3dGILSn+AHLFgW3rl2rUvdIACiiVo
 5BqlAKbt15Kpz3zHR9LkN+RoI1mdSYT1EQ/6Mnqe5uKX5cndCP7L+dgSbzp2+RVZpy7A
 egjWME3WdjeSd+6B3E09h+Rywj8mYO3eefUYaaj1fdbKltf/KX21IV1HVwcAqI8pDkB5
 lyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dnDEf1dx0KOWg4bk3uO6+evJjbNpnMa8XL0WfJ1ViHE=;
 b=OqJqLFn4phTvLiicmT7/h9MTxtHafxhfJWGA/EMai4me3bKoCjqXTnkYoh4AkS14NY
 3Zsf5QcggqHGHHrpJ5Rwr7nyyukl3F7V/GE/LdKMYNigzRGzXP+77J9D5iLM90h3Ori1
 Y7MvxOeiMVRaW5CPZD1op8Tp2PCSOuFVSSHIWVgc3N+rkrpAyxC0R2YZtt1uc0qi+FKz
 SzF6HhUG6/8urVcIb524UEQxKUUxAlz/v6GYr5U1qg1njjwAQQEXyrBJQ9FlvNSCIT3I
 MHXLxu3LAnzNrbX+awcJ0j87wu6GPR0GALQI2hy1O5Ptc5ie1Dfw3cckpg4t12ygUBdg
 lqxQ==
X-Gm-Message-State: ACrzQf1IA8cprZoI7P6UrvLAkEAqdKOWj6mloZEtfAs0/dZZLVyibYu+
 fQilOlF1oEXJdqNSMg/rSH0/p1vkdN4=
X-Google-Smtp-Source: AMsMyM4C8YSresEQ708RsA9QJ6w5GYDLrEz2j1S+H8vmiK28Y8We3S5B/5sBufSW1DXUkMnFNyeRVA==
X-Received: by 2002:a2e:9b91:0:b0:26a:ce59:c517 with SMTP id
 z17-20020a2e9b91000000b0026ace59c517mr6358883lji.181.1663661719258; 
 Tue, 20 Sep 2022 01:15:19 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 v11-20020a2ea60b000000b00262fae1ffe6sm140197ljp.110.2022.09.20.01.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 01:15:18 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, edgar.iglesias@gmail.com, alistair@alistair23.me,
 fkonrad@amd.com, sai.pavan.boddu@amd.com, frasse.iglesias@gmail.com,
 francisco.iglesias@amd.com
Subject: [PATCH v1 1/1] hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers
Date: Tue, 20 Sep 2022 10:15:17 +0200
Message-Id: <20220920081517.25401-1-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

From: Francisco Iglesias <francisco.iglesias@amd.com>

Connect ZynqMP's USB controllers.

Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
---
 hw/arm/xlnx-zynqmp.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 383e177a00..335cfc417d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -143,6 +143,14 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
     77, 78, 79, 80, 81, 82, 83, 84
 };
 
+static const uint64_t usb_addr[XLNX_ZYNQMP_NUM_USB] = {
+    0xFE200000, 0xFE300000
+};
+
+static const int usb_intr[XLNX_ZYNQMP_NUM_USB] = {
+    65, 70
+};
+
 typedef struct XlnxZynqMPGICRegion {
     int region_index;
     uint32_t address;
@@ -428,6 +436,10 @@ static void xlnx_zynqmp_init(Object *obj)
     object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
     object_initialize_child(obj, "qspi-irq-orgate",
                             &s->qspi_irq_orgate, TYPE_OR_IRQ);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
+        object_initialize_child(obj, "usb[*]", &s->usb[i], TYPE_USB_DWC3);
+    }
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -814,6 +826,30 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_add_alias(OBJECT(s), bus_name,
                                   OBJECT(&s->qspi), target_bus);
     }
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
+        if (!object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
+                                      OBJECT(system_memory), errp)) {
+            return;
+        }
+
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "intrs", 4);
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usb[i]), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 0,
+                           gic_spi[usb_intr[i]]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 1,
+                           gic_spi[usb_intr[i] + 1]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 2,
+                           gic_spi[usb_intr[i] + 2]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 3,
+                           gic_spi[usb_intr[i] + 3]);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 85fd9f53da..20bdf894aa 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -42,6 +42,7 @@
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
 #include "hw/timer/cadence_ttc.h"
+#include "hw/usb/hcd-dwc3.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -56,6 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_NUM_SPIS 2
 #define XLNX_ZYNQMP_NUM_GDMA_CH 8
 #define XLNX_ZYNQMP_NUM_ADMA_CH 8
+#define XLNX_ZYNQMP_NUM_USB 2
 
 #define XLNX_ZYNQMP_NUM_QSPI_BUS 2
 #define XLNX_ZYNQMP_NUM_QSPI_BUS_CS 2
@@ -132,6 +134,7 @@ struct XlnxZynqMPState {
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
     CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
+    USBDWC3 usb[XLNX_ZYNQMP_NUM_USB];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
-- 
2.20.1


