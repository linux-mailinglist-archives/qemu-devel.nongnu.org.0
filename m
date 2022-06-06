Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC253E59A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:56:44 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyF5w-0003dG-1B
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMO-0007Zj-Fi; Mon, 06 Jun 2022 11:09:40 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:38601
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMM-0006Dd-2U; Mon, 06 Jun 2022 11:09:40 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxjW5P01z4xZf;
 Tue,  7 Jun 2022 01:09:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxjQ1DMhz4xZY;
 Tue,  7 Jun 2022 01:09:29 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 18/21] hw/i2c/aspeed: add slave device in old register mode
Date: Mon,  6 Jun 2022 17:07:29 +0200
Message-Id: <20220606150732.2282041-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Klaus Jensen <k.jensen@samsung.com>

Add slave mode functionality for the Aspeed I2C controller in old
register mode. This is implemented by realizing an I2C slave device
owned by the I2C controller and attached to its own bus.

The I2C slave device only implements asynchronous sends on the bus, so
slaves not supporting that will not be able to communicate with it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: checkpatch fixes ]
Message-Id: <20220601210831.67259-6-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |  8 ++++
 hw/i2c/aspeed_i2c.c         | 93 +++++++++++++++++++++++++++++++++----
 2 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 03fe829a3a57..9e88f086131a 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -223,6 +223,9 @@ struct AspeedI2CBus {
 
     struct AspeedI2CState *controller;
 
+    /* slave mode */
+    I2CSlave *slave;
+
     MemoryRegion mr;
 
     I2CBus *bus;
@@ -251,6 +254,11 @@ struct AspeedI2CState {
     AddressSpace dram_as;
 };
 
+#define TYPE_ASPEED_I2C_BUS_SLAVE "aspeed.i2c.slave"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CBusSlave, ASPEED_I2C_BUS_SLAVE)
+struct AspeedI2CBusSlave {
+    I2CSlave i2c;
+};
 
 struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 379dbc1379cb..59245079002b 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -40,7 +40,7 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     bool raise_irq;
 
     if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
-        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s",
+        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s%s",
                aspeed_i2c_bus_pkt_mode_en(bus) &&
                ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
                                                "pktdone|" : "",
@@ -50,6 +50,8 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
                                                "ack|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ?
                                                "done|" : "",
+               ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH) ?
+                                               "slave-match|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
                                                "normal|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
@@ -689,9 +691,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
     switch (offset) {
     case A_I2CD_FUN_CTRL:
         if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
+            i2c_slave_set_address(bus->slave, bus->regs[R_I2CD_DEV_ADDR]);
         }
         bus->regs[R_I2CD_FUN_CTRL] = value & 0x0071C3FF;
         break;
@@ -712,12 +712,15 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                                  M_RX_CMD) ||
-                      SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                              M_S_RX_CMD_LAST))) {
-            aspeed_i2c_handle_rx_cmd(bus);
-            aspeed_i2c_bus_raise_interrupt(bus);
+        if (handle_rx) {
+            if (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD, M_RX_CMD) ||
+                SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
+                                        M_S_RX_CMD_LAST)) {
+                aspeed_i2c_handle_rx_cmd(bus);
+                aspeed_i2c_bus_raise_interrupt(bus);
+            } else if (aspeed_i2c_get_state(bus) == I2CD_STXD) {
+                i2c_ack(bus->bus);
+            }
         }
         break;
     case A_I2CD_DEV_ADDR:
@@ -1033,6 +1036,73 @@ static const TypeInfo aspeed_i2c_info = {
     .abstract   = true,
 };
 
+static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
+{
+    BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t value;
+
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
+
+        ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+        aspeed_i2c_set_state(bus, I2CD_STXD);
+
+        break;
+
+    case I2C_FINISH:
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, NORMAL_STOP, 1);
+
+        aspeed_i2c_set_state(bus, I2CD_IDLE);
+
+        break;
+
+    default:
+        return -1;
+    }
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+
+    return 0;
+}
+
+static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
+{
+    BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+}
+
+static void aspeed_i2c_bus_slave_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+
+    dc->desc = "Aspeed I2C Bus Slave";
+
+    sc->event = aspeed_i2c_bus_slave_event;
+    sc->send_async = aspeed_i2c_bus_slave_send_async;
+}
+
+static const TypeInfo aspeed_i2c_bus_slave_info = {
+    .name           = TYPE_ASPEED_I2C_BUS_SLAVE,
+    .parent         = TYPE_I2C_SLAVE,
+    .instance_size  = sizeof(AspeedI2CBusSlave),
+    .class_init     = aspeed_i2c_bus_slave_class_init,
+};
+
 static void aspeed_i2c_bus_reset(DeviceState *dev)
 {
     AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
@@ -1063,6 +1133,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
     s->bus = i2c_init_bus(dev, name);
+    s->slave = i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLAVE,
+                                       0xff);
 
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
                           s, name, aic->reg_size);
@@ -1222,6 +1294,7 @@ static const TypeInfo aspeed_1030_i2c_info = {
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
+    type_register_static(&aspeed_i2c_bus_slave_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
-- 
2.35.3


