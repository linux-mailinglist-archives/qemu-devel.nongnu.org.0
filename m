Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3D53E59F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:02:51 +0200 (CEST)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFBq-0003Tq-MF
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMa-00088R-1p; Mon, 06 Jun 2022 11:09:52 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:59565
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMX-0006ER-Qh; Mon, 06 Jun 2022 11:09:51 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxjl36hTz4xZj;
 Tue,  7 Jun 2022 01:09:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxjf0m87z4xZY;
 Tue,  7 Jun 2022 01:09:41 +1000 (AEST)
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
Subject: [PATCH 20/21] hw/misc: add a toy i2c echo device [DO NOT PULL]
Date: Mon,  6 Jun 2022 17:07:31 +0200
Message-Id: <20220606150732.2282041-21-clg@kaod.org>
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

Add an example I2C device to demonstrate how a slave may master the bus
and send data asynchronously to another slave.

The device will echo whatever it is sent to the device identified by the
first byte received.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/i2c-echo.c  | 162 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build |   2 +
 2 files changed, 164 insertions(+)
 create mode 100644 hw/misc/i2c-echo.c

diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
new file mode 100644
index 000000000000..27992eff8c5b
--- /dev/null
+++ b/hw/misc/i2c-echo.c
@@ -0,0 +1,162 @@
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu/main-loop.h"
+#include "block/aio.h"
+#include "hw/i2c/i2c.h"
+
+#define TYPE_I2C_ECHO "i2c-echo"
+OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
+
+enum i2c_echo_state {
+    I2C_ECHO_STATE_IDLE,
+    I2C_ECHO_STATE_REQUEST_MASTER,
+    I2C_ECHO_STATE_START_SEND,
+    I2C_ECHO_STATE_ACK,
+};
+
+typedef struct I2CEchoState {
+    I2CSlave parent_obj;
+
+    I2CBus *bus;
+
+    enum i2c_echo_state state;
+    QEMUBH *bh;
+
+    unsigned int pos;
+    uint8_t data[3];
+} I2CEchoState;
+
+static void i2c_echo_bh(void *opaque)
+{
+    I2CEchoState *state = opaque;
+
+    switch (state->state) {
+    case I2C_ECHO_STATE_IDLE:
+        return;
+
+    case I2C_ECHO_STATE_REQUEST_MASTER:
+        i2c_bus_master(state->bus, state->bh);
+        state->state = I2C_ECHO_STATE_START_SEND;
+        return;
+
+    case I2C_ECHO_STATE_START_SEND:
+        if (i2c_start_send_async(state->bus, state->data[0])) {
+            goto release_bus;
+        }
+
+        state->pos++;
+        state->state = I2C_ECHO_STATE_ACK;
+        return;
+
+    case I2C_ECHO_STATE_ACK:
+        if (state->pos > 2) {
+            break;
+        }
+
+        if (i2c_send_async(state->bus, state->data[state->pos++])) {
+            break;
+        }
+
+        return;
+    }
+
+
+    i2c_end_transfer(state->bus);
+release_bus:
+    i2c_bus_release(state->bus);
+
+    state->state = I2C_ECHO_STATE_IDLE;
+}
+
+static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    switch (event) {
+    case I2C_START_RECV:
+        state->pos = 0;
+
+        break;
+
+    case I2C_START_SEND:
+        state->pos = 0;
+
+        break;
+
+    case I2C_FINISH:
+        state->pos = 0;
+        state->state = I2C_ECHO_STATE_REQUEST_MASTER;
+        qemu_bh_schedule(state->bh);
+
+        break;
+
+    case I2C_NACK:
+        break;
+
+    default:
+        return -1;
+    }
+
+    return 0;
+}
+
+static uint8_t i2c_echo_recv(I2CSlave *s)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return 0xff;
+    }
+
+    return state->data[state->pos++];
+}
+
+static int i2c_echo_send(I2CSlave *s, uint8_t data)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return -1;
+    }
+
+    state->data[state->pos++] = data;
+
+    return 0;
+}
+
+static void i2c_echo_realize(DeviceState *dev, Error **errp)
+{
+    I2CEchoState *state = I2C_ECHO(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
+
+    state->bus = I2C_BUS(bus);
+    state->bh = qemu_bh_new(i2c_echo_bh, state);
+
+    return;
+}
+
+static void i2c_echo_class_init(ObjectClass *oc, void *data)
+{
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = i2c_echo_realize;
+
+    sc->event = i2c_echo_event;
+    sc->recv = i2c_echo_recv;
+    sc->send = i2c_echo_send;
+}
+
+static const TypeInfo i2c_echo = {
+    .name = TYPE_I2C_ECHO,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(I2CEchoState),
+    .class_init = i2c_echo_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&i2c_echo);
+}
+
+type_init(register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 132b7b7344bb..8c366f94da42 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -123,6 +123,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
 
 softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
+softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
+
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
 specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
-- 
2.35.3


