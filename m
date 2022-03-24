Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D44E6182
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:08:40 +0100 (CET)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXKOV-0006Xo-Hv
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:08:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nXKLX-0004KB-Vs; Thu, 24 Mar 2022 06:05:37 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nXKLT-0004ex-Jf; Thu, 24 Mar 2022 06:05:35 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22O9s6XV008967;
 Thu, 24 Mar 2022 17:54:07 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 24 Mar
 2022 18:04:41 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <leetroy@gmail.com>
Subject: [PATCH v1 2/2] aspeed: Add I2C buses to AST1030 model
Date: Thu, 24 Mar 2022 18:04:39 +0800
Message-ID: <20220324100439.478317-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324100439.478317-1-troy_lee@aspeedtech.com>
References: <20220324100439.478317-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22O9s6XV008967
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instanitate the I2C buses in AST1030 model and create two slave device
for ast1030-evb.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast1030.c | 17 +++++++++++++++++
 hw/arm/aspeed_minibmc.c | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/arm/aspeed_ast1030.c b/hw/arm/aspeed_ast1030.c
index fe700d922f..c16bcba7c9 100644
--- a/hw/arm/aspeed_ast1030.c
+++ b/hw/arm/aspeed_ast1030.c
@@ -92,6 +92,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
 
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
+    object_initialize_child(obj, "i2c", &s->i2c, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -163,6 +166,20 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
+    /* I2C */
+    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I2C] + i);
+        /* The AST2600 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
+    }
+
     /* LPC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
diff --git a/hw/arm/aspeed_minibmc.c b/hw/arm/aspeed_minibmc.c
index 6a29475919..764df92f65 100644
--- a/hw/arm/aspeed_minibmc.c
+++ b/hw/arm/aspeed_minibmc.c
@@ -37,6 +37,18 @@ struct AspeedMiniBmcMachineState {
 /* Main SYSCLK frequency in Hz (200MHz) */
 #define SYSCLK_FRQ 200000000ULL
 
+static void ast1030_evb_i2c_init(AspeedMiniBmcMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* U10 24C08 connects to SDA/SCL Groupt 1 by default */
+    uint8_t *eeprom_buf = g_malloc0(32 * 1024);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50, eeprom_buf);
+
+    /* U11 LM75 connects to SDA/SCL Group 2 by default */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4d);
+}
+
 static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
                                                           void *data)
 {
@@ -47,6 +59,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->soc_name = "ast1030-a1";
     amc->hw_strap1 = 0;
     amc->hw_strap2 = 0;
+    amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
     amc->fmc_model = "sst25vf032b";
-- 
2.25.1


