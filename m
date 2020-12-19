Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3482DEE3B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:47:34 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZlt-00025r-WB
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhZ-00048R-5m; Sat, 19 Dec 2020 05:43:05 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39318
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhX-00038Q-EH; Sat, 19 Dec 2020 05:43:04 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhT-0004BS-Ji; Sat, 19 Dec 2020 10:43:01 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 thuth@redhat.com
Date: Sat, 19 Dec 2020 10:42:28 +0000
Message-Id: <20201219104229.1964-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 6/7] macio: wire macio GPIOs to OpenPIC using sysbus IRQs
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

This both allows the wiring to be done as Ben suggested in his original comment in
gpio.c and also enables the OpenPIC object property link to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/gpio.c         | 24 +++++-------------------
 hw/misc/macio/macio.c        | 12 +++++++-----
 include/hw/misc/macio/gpio.h |  2 --
 3 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index 0fef8fb335..b1bcf830c3 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -57,10 +57,7 @@ void macio_set_gpio(MacIOGPIOState *s, uint32_t gpio, bool state)
 
     s->gpio_regs[gpio] = new_reg;
 
-    /* This is will work until we fix the binding between MacIO and
-     * the MPIC properly so we can route all GPIOs and avoid going
-     * via the top level platform code.
-     *
+    /*
      * Note that we probably need to get access to the MPIC config to
      * decode polarity since qemu always use "raise" regardless.
      *
@@ -152,25 +149,15 @@ static const MemoryRegionOps macio_gpio_ops = {
     },
 };
 
-static void macio_gpio_realize(DeviceState *dev, Error **errp)
-{
-    MacIOGPIOState *s = MACIO_GPIO(dev);
-
-    s->gpio_extirqs[1] = qdev_get_gpio_in(DEVICE(s->pic),
-                                          NEWWORLD_EXTING_GPIO1);
-    s->gpio_extirqs[9] = qdev_get_gpio_in(DEVICE(s->pic),
-                                          NEWWORLD_EXTING_GPIO9);
-}
-
 static void macio_gpio_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     MacIOGPIOState *s = MACIO_GPIO(obj);
+    int i;
 
-    object_property_add_link(obj, "pic", TYPE_OPENPIC,
-                             (Object **) &s->pic,
-                             qdev_prop_allow_set_link_before_realize,
-                             0);
+    for (i = 0; i < 10; i++) {
+        sysbus_init_irq(sbd, &s->gpio_extirqs[i]);
+    }
 
     memory_region_init_io(&s->gpiomem, OBJECT(s), &macio_gpio_ops, obj,
                           "gpio", 0x30);
@@ -207,7 +194,6 @@ static void macio_gpio_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     NMIClass *nc = NMI_CLASS(oc);
 
-    dc->realize = macio_gpio_realize;
     dc->reset = macio_gpio_reset;
     dc->vmsd = &vmstate_macio_gpio;
     nc->nmi_monitor_handler = macio_gpio_nmi;
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 36be77cede..d17cffd868 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -324,14 +324,16 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
 
     if (ns->has_pmu) {
         /* GPIOs */
-        sysbus_dev = SYS_BUS_DEVICE(&ns->gpio);
-        object_property_set_link(OBJECT(&ns->gpio), "pic", OBJECT(pic_dev),
-                                 &error_abort);
-        memory_region_add_subregion(&s->bar, 0x50,
-                                    sysbus_mmio_get_region(sysbus_dev, 0));
         if (!qdev_realize(DEVICE(&ns->gpio), BUS(&s->macio_bus), errp)) {
             return;
         }
+        sysbus_dev = SYS_BUS_DEVICE(&ns->gpio);
+        sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
+                           NEWWORLD_EXTING_GPIO1));
+        sysbus_connect_irq(sysbus_dev, 9, qdev_get_gpio_in(pic_dev,
+                           NEWWORLD_EXTING_GPIO9));
+        memory_region_add_subregion(&s->bar, 0x50,
+                                    sysbus_mmio_get_region(sysbus_dev, 0));
 
         /* PMU */
         object_initialize_child(OBJECT(s), "pmu", &s->pmu, TYPE_VIA_PMU);
diff --git a/include/hw/misc/macio/gpio.h b/include/hw/misc/macio/gpio.h
index 4dee09a9dd..7d2aa886c2 100644
--- a/include/hw/misc/macio/gpio.h
+++ b/include/hw/misc/macio/gpio.h
@@ -38,8 +38,6 @@ struct MacIOGPIOState {
     SysBusDevice parent;
     /*< public >*/
 
-    OpenPICState *pic;
-
     MemoryRegion gpiomem;
     qemu_irq gpio_extirqs[10];
     uint8_t gpio_levels[8];
-- 
2.20.1


