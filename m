Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85513670EB2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 01:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwPx-0005wR-UY; Tue, 17 Jan 2023 19:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPs-0005tt-FD; Tue, 17 Jan 2023 19:35:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPq-00055h-II; Tue, 17 Jan 2023 19:35:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7A440746F31;
 Wed, 18 Jan 2023 01:32:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5554E746F2F; Wed, 18 Jan 2023 01:32:35 +0100 (CET)
Message-Id: <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674001241.git.balaton@eik.bme.hu>
References: <cover.1674001241.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/4] hw/misc/macio: Return bool from functions taking errp
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed, 18 Jan 2023 01:32:35 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the convention to return bool from functions which take an error
pointer which allows for callers to pass through their error pointer
without needing a local.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/macio.c | 62 +++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index ae2a9a960d..265c0bbd8d 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -90,13 +90,13 @@ static void macio_bar_setup(MacIOState *s)
     macio_escc_legacy_setup(s);
 }
 
-static void macio_common_realize(PCIDevice *d, Error **errp)
+static bool macio_common_realize(PCIDevice *d, Error **errp)
 {
     MacIOState *s = MACIO(d);
     SysBusDevice *sbd;
 
     if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
-        return;
+        return false;
     }
     sbd = SYS_BUS_DEVICE(&s->dbdma);
     memory_region_add_subregion(&s->bar, 0x08000,
@@ -108,14 +108,16 @@ static void macio_common_realize(PCIDevice *d, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnBtype", escc_serial);
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnAtype", escc_serial);
     if (!qdev_realize(DEVICE(&s->escc), BUS(&s->macio_bus), errp)) {
-        return;
+        return false;
     }
 
     macio_bar_setup(s);
     pci_register_bar(d, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->bar);
+
+    return true;
 }
 
-static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
+static bool macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
                               qemu_irq irq0, qemu_irq irq1, int dmaid,
                               Error **errp)
 {
@@ -128,7 +130,7 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
                              &error_abort);
     macio_ide_register_dma(ide);
 
-    qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
+    return qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
 }
 
 static void macio_oldworld_realize(PCIDevice *d, Error **errp)
@@ -136,12 +138,9 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     MacIOState *s = MACIO(d);
     OldWorldMacIOState *os = OLDWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&os->pic);
-    Error *err = NULL;
     SysBusDevice *sbd;
 
-    macio_common_realize(d, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_common_realize(d, errp)) {
         return;
     }
 
@@ -176,21 +175,17 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
     pmac_format_nvram_partition(&os->nvram, os->nvram.size);
 
     /* IDE buses */
-    macio_realize_ide(s, &os->ide[0],
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
-                      0x16, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &os->ide[0],
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
+                           0x16, errp)) {
         return;
     }
 
-    macio_realize_ide(s, &os->ide[1],
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
-                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
-                      0x1a, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &os->ide[1],
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
+                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
+                           0x1a, errp)) {
         return;
     }
 }
@@ -266,13 +261,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
     MacIOState *s = MACIO(d);
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
     DeviceState *pic_dev = DEVICE(&ns->pic);
-    Error *err = NULL;
     SysBusDevice *sbd;
     MemoryRegion *timer_memory = NULL;
 
-    macio_common_realize(d, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_common_realize(d, errp)) {
         return;
     }
 
@@ -288,21 +280,17 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
     sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, NEWWORLD_ESCCA_IRQ));
 
     /* IDE buses */
-    macio_realize_ide(s, &ns->ide[0],
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
-                      0x16, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &ns->ide[0],
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
+                           0x16, errp)) {
         return;
     }
 
-    macio_realize_ide(s, &ns->ide[1],
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
-                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
-                      0x1a, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!macio_realize_ide(s, &ns->ide[1],
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
+                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
+                           0x1a, errp)) {
         return;
     }
 
-- 
2.30.6


