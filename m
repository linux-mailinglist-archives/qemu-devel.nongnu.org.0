Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09840246B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:33:00 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVbH-0007Tw-8G
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNVZU-0006Nd-5j; Tue, 07 Sep 2021 03:31:08 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNVZS-0002vp-0u; Tue, 07 Sep 2021 03:31:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3FF5ABCB6FF6;
 Tue,  7 Sep 2021 09:31:01 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 09:31:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e1c492da-6788-4648-9db5-b3c251ad36b6,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] aspeed/i2c: QOMify AspeedI2CBus
Date: Tue, 7 Sep 2021 09:30:59 +0200
Message-ID: <20210907073059.1155224-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5c67d43f-a668-4e79-930e-49aaa74810e4
X-Ovh-Tracer-Id: 1528127649440041766
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AST2600 SoC realize routine needs to be adapted when connecting
the I2C bus IRQs because the bus IRQs have moved to the AspeedI2CBus
SysBus device, one level below the Aspeed I2C controller SysBus
device.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |   8 ++-
 hw/arm/aspeed_ast2600.c     |   7 +--
 hw/i2c/aspeed_i2c.c         | 103 +++++++++++++++++++++++++++++-------
 3 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 565f83306624..4b9be09274c7 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -36,7 +36,11 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 struct AspeedI2CState;
 
-typedef struct AspeedI2CBus {
+#define TYPE_ASPEED_I2C_BUS "aspeed.i2c.bus"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CBus, ASPEED_I2C_BUS)
+struct AspeedI2CBus {
+    SysBusDevice parent_obj;
+
     struct AspeedI2CState *controller;
 
     MemoryRegion mr;
@@ -54,7 +58,7 @@ typedef struct AspeedI2CBus {
     uint32_t pool_ctrl;
     uint32_t dma_addr;
     uint32_t dma_len;
-} AspeedI2CBus;
+};
 
 struct AspeedI2CState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c69f27dff62a..a70e4c48a73c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -337,11 +337,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
-        /*
-         * The AST2600 SoC has one IRQ per I2C bus. Skip the common
-         * IRQ (AST2400 and AST2500) and connect all bussses.
-         */
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), i + 1, irq);
+        /* The AST2600 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
     /* FMC, The number of CS is set at the board level */
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8d276d9ed391..f1dacdb925ca 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -740,20 +740,20 @@ static const VMStateDescription aspeed_i2c_vmstate = {
 
 static void aspeed_i2c_reset(DeviceState *dev)
 {
-    int i;
     AspeedI2CState *s = ASPEED_I2C(dev);
-    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
 
     s->intr_status = 0;
+}
+
+static void aspeed_i2c_instance_init(Object *obj)
+{
+    AspeedI2CState *s = ASPEED_I2C(obj);
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
+    int i;
 
     for (i = 0; i < aic->num_busses; i++) {
-        s->busses[i].intr_ctrl = 0;
-        s->busses[i].intr_status = 0;
-        s->busses[i].cmd = 0;
-        s->busses[i].buf = 0;
-        s->busses[i].dma_addr = 0;
-        s->busses[i].dma_len = 0;
-        i2c_end_transfer(s->busses[i].bus);
+        object_initialize_child(obj, "bus[*]", &s->busses[i],
+                                TYPE_ASPEED_I2C_BUS);
     }
 }
 
@@ -791,17 +791,21 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < aic->num_busses; i++) {
-        char name[32];
+        Object *bus = OBJECT(&s->busses[i]);
         int offset = i < aic->gap ? 1 : 5;
 
-        sysbus_init_irq(sbd, &s->busses[i].irq);
-        snprintf(name, sizeof(name), "aspeed.i2c.%d", i);
-        s->busses[i].controller = s;
-        s->busses[i].id = i;
-        s->busses[i].bus = i2c_init_bus(dev, name);
-        memory_region_init_io(&s->busses[i].mr, OBJECT(dev),
-                              &aspeed_i2c_bus_ops, &s->busses[i], name,
-                              aic->reg_size);
+        if (!object_property_set_link(bus, "controller", OBJECT(s), errp)) {
+            return;
+        }
+
+        if (!object_property_set_uint(bus, "bus-id", i, errp)) {
+            return;
+        }
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(bus), errp)) {
+            return;
+        }
+
         memory_region_add_subregion(&s->iomem, aic->reg_size * (i + offset),
                                     &s->busses[i].mr);
     }
@@ -841,12 +845,74 @@ static void aspeed_i2c_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_i2c_info = {
     .name          = TYPE_ASPEED_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = aspeed_i2c_instance_init,
     .instance_size = sizeof(AspeedI2CState),
     .class_init    = aspeed_i2c_class_init,
     .class_size = sizeof(AspeedI2CClass),
     .abstract   = true,
 };
 
+static void aspeed_i2c_bus_reset(DeviceState *dev)
+{
+    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
+
+    s->intr_ctrl = 0;
+    s->intr_status = 0;
+    s->cmd = 0;
+    s->buf = 0;
+    s->dma_addr = 0;
+    s->dma_len = 0;
+    i2c_end_transfer(s->bus);
+}
+
+static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
+{
+    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
+    char name[32];
+    AspeedI2CClass *aic;
+
+    if (!s->controller) {
+        error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not set");
+        return;
+    }
+
+    aic = ASPEED_I2C_GET_CLASS(s->controller);
+
+    snprintf(name, sizeof(name), TYPE_ASPEED_I2C_BUS ".%d", s->id);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    s->bus = i2c_init_bus(dev, name);
+
+    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
+                          s, name, aic->reg_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
+}
+
+static Property aspeed_i2c_bus_properties[] = {
+    DEFINE_PROP_UINT8("bus-id", AspeedI2CBus, id, 0),
+    DEFINE_PROP_LINK("controller", AspeedI2CBus, controller, TYPE_ASPEED_I2C,
+                     AspeedI2CState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_i2c_bus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed I2C Bus";
+    dc->realize = aspeed_i2c_bus_realize;
+    dc->reset = aspeed_i2c_bus_reset;
+    device_class_set_props(dc, aspeed_i2c_bus_properties);
+}
+
+static const TypeInfo aspeed_i2c_bus_info = {
+    .name           = TYPE_ASPEED_I2C_BUS,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedI2CBus),
+    .class_init     = aspeed_i2c_bus_class_init,
+};
+
 static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 {
     return bus->controller->irq;
@@ -951,6 +1017,7 @@ static const TypeInfo aspeed_2600_i2c_info = {
 
 static void aspeed_i2c_register_types(void)
 {
+    type_register_static(&aspeed_i2c_bus_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
-- 
2.31.1


