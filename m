Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64952F4FA0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:14:30 +0100 (CET)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzimz-0005M6-PI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikb-0003dd-QS; Wed, 13 Jan 2021 11:12:01 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39970
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikZ-0001V6-8q; Wed, 13 Jan 2021 11:12:01 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzike-0001mR-R5; Wed, 13 Jan 2021 16:12:09 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 13 Jan 2021 16:11:26 +0000
Message-Id: <20210113161128.3156-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
References: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 5/7] macio: move OpenPIC inside macio-newworld device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

The OpenPIC device is located within the macio device on real hardware so make it
a child of the macio-newworld device. This also removes the need for setting and
checking a separate PIC object property link on the macio-newworld device which
currently causes the automated QOM introspection tests to fail.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201229175619.6051-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c         | 19 +++++++++----------
 hw/ppc/mac_newworld.c         | 25 +++++++++++--------------
 include/hw/misc/macio/macio.h |  2 +-
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index cfb87da6c9..36be77cede 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -273,7 +273,7 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
 {
     MacIOState *s = MACIO(d);
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
-    DeviceState *pic_dev = DEVICE(ns->pic);
+    DeviceState *pic_dev = DEVICE(&ns->pic);
     Error *err = NULL;
     SysBusDevice *sysbus_dev;
     MemoryRegion *timer_memory = NULL;
@@ -284,17 +284,19 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         return;
     }
 
+    /* OpenPIC */
+    qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
+    sysbus_dev = SYS_BUS_DEVICE(&ns->pic);
+    sysbus_realize_and_unref(sysbus_dev, &error_fatal);
+    memory_region_add_subregion(&s->bar, 0x40000,
+                                sysbus_mmio_get_region(sysbus_dev, 0));
+
     sysbus_dev = SYS_BUS_DEVICE(&s->escc);
     sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
                                                        NEWWORLD_ESCCB_IRQ));
     sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
                                                        NEWWORLD_ESCCA_IRQ));
 
-    /* OpenPIC */
-    sysbus_dev = SYS_BUS_DEVICE(ns->pic);
-    memory_region_add_subregion(&s->bar, 0x40000,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
-
     /* IDE buses */
     macio_realize_ide(s, &ns->ide[0],
                       qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
@@ -369,10 +371,7 @@ static void macio_newworld_init(Object *obj)
     NewWorldMacIOState *ns = NEWWORLD_MACIO(obj);
     int i;
 
-    object_property_add_link(obj, "pic", TYPE_OPENPIC,
-                             (Object **) &ns->pic,
-                             qdev_prop_allow_set_link_before_realize,
-                             0);
+    object_initialize_child(OBJECT(s), "pic", &ns->pic, TYPE_OPENPIC);
 
     object_initialize_child(OBJECT(s), "gpio", &ns->gpio, TYPE_MACIO_GPIO);
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 708bb2f1ab..e991db4add 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -293,18 +293,6 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    pic_dev = qdev_new(TYPE_OPENPIC);
-    qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
-    s = SYS_BUS_DEVICE(pic_dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    k = 0;
-    for (i = 0; i < smp_cpus; i++) {
-        for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
-            sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
-        }
-    }
-    g_free(openpic_irqs);
-
     if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
         /* 970 gets a U3 bus */
         /* Uninorth AGP bus */
@@ -378,8 +366,6 @@ static void ppc_core99_init(MachineState *machine)
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     qdev_prop_set_bit(dev, "has-pmu", has_pmu);
     qdev_prop_set_bit(dev, "has-adb", has_adb);
-    object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
-                             &error_abort);
 
     escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
     qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
@@ -387,6 +373,7 @@ static void ppc_core99_init(MachineState *machine)
 
     pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
+    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
     for (i = 0; i < 4; i++) {
         qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
                               qdev_get_gpio_in(pic_dev, 0x1b + i));
@@ -407,6 +394,16 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
+    /* OpenPIC */
+    s = SYS_BUS_DEVICE(pic_dev);
+    k = 0;
+    for (i = 0; i < smp_cpus; i++) {
+        for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
+            sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
+        }
+    }
+    g_free(openpic_irqs);
+
     /* We only emulate 2 out of 3 IDE controllers for now */
     ide_drive_get(hd, ARRAY_SIZE(hd));
 
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 707dfab50c..6c05f3bfd2 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -115,7 +115,7 @@ struct NewWorldMacIOState {
 
     bool has_pmu;
     bool has_adb;
-    OpenPICState *pic;
+    OpenPICState pic;
     MACIOIDEState ide[2];
     MacIOGPIOState gpio;
 };
-- 
2.20.1


