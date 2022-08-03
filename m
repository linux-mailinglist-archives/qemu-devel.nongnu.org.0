Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC5588DCC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:49:15 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEkM-0007my-Tv
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER8-0002xL-7y; Wed, 03 Aug 2022 09:29:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER5-0000X7-Gx; Wed, 03 Aug 2022 09:29:21 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXl23md4z4xGG;
 Wed,  3 Aug 2022 23:29:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXl05Jtgz4x1Y;
 Wed,  3 Aug 2022 23:29:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 10/20] ppc/ppc405: QOM'ify GPIO
Date: Wed,  3 Aug 2022 15:28:34 +0200
Message-Id: <20220803132844.2370514-11-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803132844.2370514-1-clg@kaod.org>
References: <20220803132844.2370514-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 21 +++++++++++++++++++
 hw/ppc/ppc405_uc.c | 50 +++++++++++++++++++++-------------------------
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 3bb59624bb1c..36f6fd45217e 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,26 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* GPIO */
+#define TYPE_PPC405_GPIO "ppc405-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
+struct Ppc405GpioState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion io;
+    uint32_t or;
+    uint32_t tcr;
+    uint32_t osrh;
+    uint32_t osrl;
+    uint32_t tsrh;
+    uint32_t tsrl;
+    uint32_t odr;
+    uint32_t ir;
+    uint32_t rr1;
+    uint32_t isr1h;
+    uint32_t isr1l;
+};
+
 /* On Chip Memory */
 #define TYPE_PPC405_OCM "ppc405-ocm"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
@@ -159,6 +179,7 @@ struct Ppc405SoCState {
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
+    Ppc405GpioState gpio;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index efd81fd77255..bd018804594a 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -713,23 +713,6 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 }
 
 /*****************************************************************************/
-/* GPIO */
-typedef struct ppc405_gpio_t ppc405_gpio_t;
-struct ppc405_gpio_t {
-    MemoryRegion io;
-    uint32_t or;
-    uint32_t tcr;
-    uint32_t osrh;
-    uint32_t osrl;
-    uint32_t tsrh;
-    uint32_t tsrl;
-    uint32_t odr;
-    uint32_t ir;
-    uint32_t rr1;
-    uint32_t isr1h;
-    uint32_t isr1l;
-};
-
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
 {
     trace_ppc405_gpio_read(addr, size);
@@ -748,20 +731,22 @@ static const MemoryRegionOps ppc405_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ppc405_gpio_reset (void *opaque)
+static void ppc405_gpio_realize(DeviceState *dev, Error **errp)
 {
+    Ppc405GpioState *s = PPC405_GPIO(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &ppc405_gpio_ops, s, "gpio",
+                          0x038);
+    sysbus_init_mmio(sbd, &s->io);
 }
 
-static void ppc405_gpio_init(hwaddr base)
+static void ppc405_gpio_class_init(ObjectClass *oc, void *data)
 {
-    ppc405_gpio_t *gpio;
-
-    trace_ppc405_gpio_init(base);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    gpio = g_new0(ppc405_gpio_t, 1);
-    memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
-    memory_region_add_subregion(get_system_memory(), base, &gpio->io);
-    qemu_register_reset(&ppc405_gpio_reset, gpio);
+    dc->realize = ppc405_gpio_realize;
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1421,6 +1406,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
 
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
+
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1505,8 +1492,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
                          qdev_get_gpio_in(s->uic, 2));
+
     /* GPIO */
-    ppc405_gpio_init(0xef600700);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, 0xef600700);
 
     /* Serial ports */
     if (serial_hd(0) != NULL) {
@@ -1570,6 +1561,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_GPIO,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405GpioState),
+        .class_init     = ppc405_gpio_class_init,
+    }, {
         .name           = TYPE_PPC405_OCM,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OcmState),
-- 
2.37.1


