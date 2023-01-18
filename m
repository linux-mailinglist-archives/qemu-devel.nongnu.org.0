Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC401670EB3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 01:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwPw-0005v9-5l; Tue, 17 Jan 2023 19:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPr-0005ts-Bg; Tue, 17 Jan 2023 19:35:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPo-00055Q-P4; Tue, 17 Jan 2023 19:34:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 579CB7466FF;
 Wed, 18 Jan 2023 01:32:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 28A60746392; Wed, 18 Jan 2023 01:32:33 +0100 (CET)
Message-Id: <6c79d6903fc11e153f8050a374904c2b5d5db585.1674001242.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674001241.git.balaton@eik.bme.hu>
References: <cover.1674001241.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/4] hw/misc/macio: Rename sysbus_dev to sbd for consistency
 and brevity
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed, 18 Jan 2023 01:32:33 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some functions use sysbus_dev while others sbd name for local variable
storing a sysbus device pointer. Standardise on the shorter name to be
consistent and make the code easier to read as short name is less
distracting and needs less line breaks.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/macio.c | 78 +++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 0dfe372965..4d7223cc85 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -96,14 +96,14 @@ static void macio_bar_setup(MacIOState *s)
 static void macio_common_realize(PCIDevice *d, Error **errp)
 {
     MacIOState *s = MACIO(d);
-    SysBusDevice *sysbus_dev;
+    SysBusDevice *sbd;
 
     if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
         return;
     }
-    sysbus_dev = SYS_BUS_DEVICE(&s->dbdma);
+    sbd = SYS_BUS_DEVICE(&s->dbdma);
     memory_region_add_subregion(&s->bar, 0x08000,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
+                                sysbus_mmio_get_region(sbd, 0));
 
     qdev_prop_set_uint32(DEVICE(&s->escc), "disabled", 0);
     qdev_prop_set_uint32(DEVICE(&s->escc), "frequency", ESCC_CLOCK);
@@ -122,11 +122,10 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
                               qemu_irq irq0, qemu_irq irq1, int dmaid,
                               Error **errp)
 {
-    SysBusDevice *sysbus_dev;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(ide);
 
-    sysbus_dev = SYS_BUS_DEVICE(ide);
-    sysbus_connect_irq(sysbus_dev, 0, irq0);
-    sysbus_connect_irq(sysbus_dev, 1, irq1);
+    sysbus_connect_irq(sbd, 0, irq0);
+    sysbus_connect_irq(sbd, 1, irq1);
     qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
     object_property_set_link(OBJECT(ide), "dbdma", OBJECT(&s->dbdma),
                              &error_abort);
@@ -141,7 +140,7 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     OldWorldMacIOState *os = OLDWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&os->pic);
     Error *err = NULL;
-    SysBusDevice *sysbus_dev;
+    SysBusDevice *sbd;
 
     macio_common_realize(d, &err);
     if (err) {
@@ -153,33 +152,30 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&os->pic), BUS(&s->macio_bus), errp)) {
         return;
     }
-    sysbus_dev = SYS_BUS_DEVICE(&os->pic);
+    sbd = SYS_BUS_DEVICE(&os->pic);
     memory_region_add_subregion(&s->bar, 0x0,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
+                                sysbus_mmio_get_region(sbd, 0));
 
     qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
                          s->frequency);
     if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
         return;
     }
-    sysbus_dev = SYS_BUS_DEVICE(&s->cuda);
+    sbd = SYS_BUS_DEVICE(&s->cuda);
     memory_region_add_subregion(&s->bar, 0x16000,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
-    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
-                                                       OLDWORLD_CUDA_IRQ));
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, OLDWORLD_CUDA_IRQ));
 
-    sysbus_dev = SYS_BUS_DEVICE(&s->escc);
-    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
-                                                       OLDWORLD_ESCCB_IRQ));
-    sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
-                                                       OLDWORLD_ESCCA_IRQ));
+    sbd = SYS_BUS_DEVICE(&s->escc);
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, OLDWORLD_ESCCB_IRQ));
+    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, OLDWORLD_ESCCA_IRQ));
 
     if (!qdev_realize(DEVICE(&os->nvram), BUS(&s->macio_bus), errp)) {
         return;
     }
-    sysbus_dev = SYS_BUS_DEVICE(&os->nvram);
+    sbd = SYS_BUS_DEVICE(&os->nvram);
     memory_region_add_subregion(&s->bar, 0x60000,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
+                                sysbus_mmio_get_region(sbd, 0));
     pmac_format_nvram_partition(&os->nvram, os->nvram.size);
 
     /* IDE buses */
@@ -274,7 +270,7 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&ns->pic);
     Error *err = NULL;
-    SysBusDevice *sysbus_dev;
+    SysBusDevice *sbd;
     MemoryRegion *timer_memory = NULL;
 
     macio_common_realize(d, &err);
@@ -285,16 +281,14 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
 
     /* OpenPIC */
     qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
-    sysbus_dev = SYS_BUS_DEVICE(&ns->pic);
-    sysbus_realize_and_unref(sysbus_dev, &error_fatal);
+    sbd = SYS_BUS_DEVICE(&ns->pic);
+    sysbus_realize_and_unref(sbd, &error_fatal);
     memory_region_add_subregion(&s->bar, 0x40000,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
+                                sysbus_mmio_get_region(sbd, 0));
 
-    sysbus_dev = SYS_BUS_DEVICE(&s->escc);
-    sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
-                                                       NEWWORLD_ESCCB_IRQ));
-    sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
-                                                       NEWWORLD_ESCCA_IRQ));
+    sbd = SYS_BUS_DEVICE(&s->escc);
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCB_IRQ));
+    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCA_IRQ));
 
     /* IDE buses */
     macio_realize_ide(s, &ns->ide[0],
@@ -326,27 +320,26 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         if (!qdev_realize(DEVICE(&ns->gpio), BUS(&s->macio_bus), errp)) {
             return;
         }
-        sysbus_dev = SYS_BUS_DEVICE(&ns->gpio);
-        sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
+        sbd = SYS_BUS_DEVICE(&ns->gpio);
+        sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev,
                            NEWWORLD_EXTING_GPIO1));
-        sysbus_connect_irq(sysbus_dev, 9, qdev_get_gpio_in(pic_dev,
+        sysbus_connect_irq(sbd, 9, qdev_get_gpio_in(pic_dev,
                            NEWWORLD_EXTING_GPIO9));
         memory_region_add_subregion(&s->bar, 0x50,
-                                    sysbus_mmio_get_region(sysbus_dev, 0));
+                                    sysbus_mmio_get_region(sbd, 0));
 
         /* PMU */
         object_initialize_child(OBJECT(s), "pmu", &s->pmu, TYPE_VIA_PMU);
-        object_property_set_link(OBJECT(&s->pmu), "gpio", OBJECT(sysbus_dev),
+        object_property_set_link(OBJECT(&s->pmu), "gpio", OBJECT(sbd),
                                  &error_abort);
         qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
         if (!qdev_realize(DEVICE(&s->pmu), BUS(&s->macio_bus), errp)) {
             return;
         }
-        sysbus_dev = SYS_BUS_DEVICE(&s->pmu);
-        sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
-                                                           NEWWORLD_PMU_IRQ));
+        sbd = SYS_BUS_DEVICE(&s->pmu);
+        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_PMU_IRQ));
         memory_region_add_subregion(&s->bar, 0x16000,
-                                    sysbus_mmio_get_region(sysbus_dev, 0));
+                                    sysbus_mmio_get_region(sbd, 0));
     } else {
         object_unparent(OBJECT(&ns->gpio));
 
@@ -358,11 +351,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
             return;
         }
-        sysbus_dev = SYS_BUS_DEVICE(&s->cuda);
-        sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
-                                                           NEWWORLD_CUDA_IRQ));
+        sbd = SYS_BUS_DEVICE(&s->cuda);
+        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(pic_dev, NEWWORLD_CUDA_IRQ));
         memory_region_add_subregion(&s->bar, 0x16000,
-                                    sysbus_mmio_get_region(sysbus_dev, 0));
+                                    sysbus_mmio_get_region(sbd, 0));
     }
 }
 
-- 
2.30.6


