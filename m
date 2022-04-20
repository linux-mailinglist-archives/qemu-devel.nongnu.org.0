Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE145092DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:31:47 +0200 (CEST)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIrS-0004pB-TA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIda-0007v1-Ae; Wed, 20 Apr 2022 18:17:26 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdY-00065M-Ci; Wed, 20 Apr 2022 18:17:25 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3520279fac.4; 
 Wed, 20 Apr 2022 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ooRmZlwGkD4PbmGs0II3MWdtJGTf0c198wmutCi1+tw=;
 b=W2FvwV6hGjUGgax11lh13JFSZtEUksyEe33sjWB3LVMMwrMmNqnjoVtih606pKak8P
 4Q6SzJ4qcMasLAqHggJ7bZQrWrHhSaO8RmbYROIwoKXTQELca2MSvXNB12sFOFOAK2sg
 /pUj96t6qPRezLo0e312Tep15wzUaGfiKtqWNXAB72EpSiNGSyrAW+eY/YN3RnDIKeV7
 DEbGG84vl3oiFfu0AzWn1Eo75CpSLypXZf/dFZFaVOCGhs7GJYBaPAYRQL/5dksHdLKG
 m76sJyMEm3nQfmcpKftfvkiJxJk+0QemL/lxLbooRHH4Fk9N7bhfFxuA7qb6GhZu4BS2
 59Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ooRmZlwGkD4PbmGs0II3MWdtJGTf0c198wmutCi1+tw=;
 b=lGkO/QDiQt12KhYD6qwnQPi054G7TM84UE8arrl00RFaJeqIPEOBP0YgPhGlAw4g3k
 X0ul7gjGIr6An4rz7XQtgXLnAjGOlqxSCCnykVXLCh5m2Yfa1FWVeHeUqxThWAGTgTC/
 ljILauuDjscLBYs7Nkqh3SJgY7fRu3AJOPAY+D/QzLqseoPSKmxNhciFiftGc1kLkcVy
 tjaWvJH+RjK4fPobdtU7fAxntvUF6PZqMm0lyWeAVMbBloHDNSlhW0dGB4yooFatg/BD
 54n+GhX56kUacxnrLbOojevn5Z0zSpNMwRhgSIOgtv6jkxi57vCukZM7ukaKZ6abPDxv
 XIIA==
X-Gm-Message-State: AOAM533oCvFByGQxL+p+h7zgOLPu07yWgiqBnRau+uBi6yx1K00Iidxj
 i3pXac7CWoTQemqC8ucCrTI3xP7ULmk=
X-Google-Smtp-Source: ABdhPJyvflbgkfi9Cn5YfI2+jWzOYKkSZIyUYkn4j4UVdKjOqfX+sjHdwocMFkC0Bwe49FaCARwuRA==
X-Received: by 2002:a05:6870:4596:b0:da:b3f:2b1d with SMTP id
 y22-20020a056870459600b000da0b3f2b1dmr2670587oao.188.1650493042254; 
 Wed, 20 Apr 2022 15:17:22 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:16:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] ppc/pnv: Remove PnvOCC::psi link
Date: Wed, 20 Apr 2022 19:13:11 -0300
Message-Id: <20220420221329.169755-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Use an anonymous output GPIO line to connect the OCC device with the
PSIHB device and raise the appropriate PSI IRQ line depending on the
processor model.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220323072846.1780212-4-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c             | 12 ++++++------
 hw/ppc/pnv_occ.c         | 16 ++++------------
 include/hw/ppc/pnv_occ.h |  7 ++-----
 3 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3469432fbf..7c08a78d6c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1253,12 +1253,12 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     }
 
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip8->occ), "psi", OBJECT(&chip8->psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip8->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV_XSCOM_OCC_BASE, &chip8->occ.xscom_regs);
+    qdev_connect_gpio_out(DEVICE(&chip8->occ), 0,
+                          qdev_get_gpio_in(DEVICE(&chip8->psi), PSIHB_IRQ_OCC));
 
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(), PNV_OCC_SENSOR_BASE(chip),
@@ -1528,12 +1528,12 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
                                             (uint64_t) PNV9_LPCM_BASE(chip));
 
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip9->occ), "psi", OBJECT(&chip9->psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip9->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV9_XSCOM_OCC_BASE, &chip9->occ.xscom_regs);
+    qdev_connect_gpio_out(DEVICE(&chip9->occ), 0, qdev_get_gpio_in(
+                              DEVICE(&chip9->psi), PSIHB9_IRQ_OCC));
 
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(), PNV9_OCC_SENSOR_BASE(chip),
@@ -1731,13 +1731,13 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
                                             (uint64_t) PNV10_LPCM_BASE(chip));
 
     /* Create the simplified OCC model */
-    object_property_set_link(OBJECT(&chip10->occ), "psi", OBJECT(&chip10->psi),
-                             &error_abort);
     if (!qdev_realize(DEVICE(&chip10->occ), NULL, errp)) {
         return;
     }
     pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
                             &chip10->occ.xscom_regs);
+    qdev_connect_gpio_out(DEVICE(&chip10->occ), 0, qdev_get_gpio_in(
+                              DEVICE(&chip10->psi), PSIHB9_IRQ_OCC));
 
     /* OCC SRAM model */
     memory_region_add_subregion(get_system_memory(),
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 4ed66f5e1f..9fa6d91d31 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
 #include "hw/ppc/pnv_xscom.h"
@@ -51,13 +52,12 @@
 static void pnv_occ_set_misc(PnvOCC *occ, uint64_t val)
 {
     bool irq_state;
-    PnvOCCClass *poc = PNV_OCC_GET_CLASS(occ);
 
     val &= 0xffff000000000000ull;
 
     occ->occmisc = val;
     irq_state = !!(val >> 63);
-    pnv_psi_irq_set(occ->psi, poc->psi_irq, irq_state);
+    qemu_set_irq(occ->psi_irq, irq_state);
 }
 
 static uint64_t pnv_occ_power8_xscom_read(void *opaque, hwaddr addr,
@@ -168,7 +168,6 @@ static void pnv_occ_power8_class_init(ObjectClass *klass, void *data)
 
     poc->xscom_size = PNV_XSCOM_OCC_SIZE;
     poc->xscom_ops = &pnv_occ_power8_xscom_ops;
-    poc->psi_irq = PSIHB_IRQ_OCC;
 }
 
 static const TypeInfo pnv_occ_power8_type_info = {
@@ -241,7 +240,6 @@ static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
     dc->desc = "PowerNV OCC Controller (POWER9)";
     poc->xscom_size = PNV9_XSCOM_OCC_SIZE;
     poc->xscom_ops = &pnv_occ_power9_xscom_ops;
-    poc->psi_irq = PSIHB9_IRQ_OCC;
 }
 
 static const TypeInfo pnv_occ_power9_type_info = {
@@ -269,8 +267,6 @@ static void pnv_occ_realize(DeviceState *dev, Error **errp)
     PnvOCC *occ = PNV_OCC(dev);
     PnvOCCClass *poc = PNV_OCC_GET_CLASS(occ);
 
-    assert(occ->psi);
-
     occ->occmisc = 0;
 
     /* XScom region for OCC registers */
@@ -281,12 +277,9 @@ static void pnv_occ_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&occ->sram_regs, OBJECT(dev), &pnv_occ_sram_ops,
                           occ, "occ-common-area",
                           PNV_OCC_SENSOR_DATA_BLOCK_SIZE);
-}
 
-static Property pnv_occ_properties[] = {
-    DEFINE_PROP_LINK("psi", PnvOCC, psi, TYPE_PNV_PSI, PnvPsi *),
-    DEFINE_PROP_END_OF_LIST(),
-};
+    qdev_init_gpio_out(DEVICE(dev), &occ->psi_irq, 1);
+}
 
 static void pnv_occ_class_init(ObjectClass *klass, void *data)
 {
@@ -294,7 +287,6 @@ static void pnv_occ_class_init(ObjectClass *klass, void *data)
 
     dc->realize = pnv_occ_realize;
     dc->desc = "PowerNV OCC Controller";
-    device_class_set_props(dc, pnv_occ_properties);
     dc->user_creatable = false;
 }
 
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index f982ba0024..90a81dae2b 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV Emulation of a few OCC related registers
  *
- * Copyright (c) 2015-2017, IBM Corporation.
+ * Copyright (c) 2015-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -20,7 +20,6 @@
 #ifndef PPC_PNV_OCC_H
 #define PPC_PNV_OCC_H
 
-#include "hw/ppc/pnv_psi.h"
 #include "qom/object.h"
 
 #define TYPE_PNV_OCC "pnv-occ"
@@ -44,19 +43,17 @@ struct PnvOCC {
     /* OCC Misc interrupt */
     uint64_t occmisc;
 
-    PnvPsi *psi;
+    qemu_irq psi_irq;
 
     MemoryRegion xscom_regs;
     MemoryRegion sram_regs;
 };
 
-
 struct PnvOCCClass {
     DeviceClass parent_class;
 
     int xscom_size;
     const MemoryRegionOps *xscom_ops;
-    int psi_irq;
 };
 
 #define PNV_OCC_SENSOR_DATA_BLOCK_BASE(i)                               \
-- 
2.35.1


