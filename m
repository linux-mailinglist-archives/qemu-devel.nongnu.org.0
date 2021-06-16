Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC663A931A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:50:06 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltPNF-0007Jw-Rb
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltPHF-0004ZY-Ti; Wed, 16 Jun 2021 02:43:55 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltPHD-0004MO-Nv; Wed, 16 Jun 2021 02:43:53 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0882221C6C;
 Wed, 16 Jun 2021 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1623825830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTjtUP1SlKX8Rnx1EeyRCKFS60a51kS12cB6SCR7JDk=;
 b=3Ir1utHxP3XBe07BgeUTHofc5q6Oh+zLWgdP+2uDxoRAUflRE+Z57djklHTKNbbSjjW7DE
 HNw7h0lRYNwkQWreZOSr+D0TYVKrdJsu1K0sTWdA3jvbGk4VqhHhf/nB+KziCZ29KvOPXL
 C33v1yD2lqQAE+dPFFnpFoOE0/w4FNo=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] hw/char: QOMify sifive_uart
Date: Wed, 16 Jun 2021 08:43:34 +0200
Message-Id: <20210616064334.53398-3-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616064334.53398-1-lukas.juenger@greensocs.com>
References: <20210616064334.53398-1-lukas.juenger@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.juenger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com,
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This QOMifies the SiFive UART model. Migration and reset have been
implemented.

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
---
 include/hw/char/sifive_uart.h |  11 ++--
 hw/char/sifive_uart.c         | 114 +++++++++++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 16 deletions(-)

diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.h
index 3e962be659..7f6c79f8bd 100644
--- a/include/hw/char/sifive_uart.h
+++ b/include/hw/char/sifive_uart.h
@@ -21,6 +21,7 @@
 #define HW_SIFIVE_UART_H
 
 #include "chardev/char-fe.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
@@ -49,12 +50,10 @@ enum {
 
 #define SIFIVE_UART_GET_TXCNT(txctrl)   ((txctrl >> 16) & 0x7)
 #define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
+#define SIFIVE_UART_RX_FIFO_SIZE 8
 
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
-
-typedef struct SiFiveUARTState SiFiveUARTState;
-DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
-                         TYPE_SIFIVE_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUARTState, SIFIVE_UART)
 
 struct SiFiveUARTState {
     /*< private >*/
@@ -64,8 +63,8 @@ struct SiFiveUARTState {
     qemu_irq irq;
     MemoryRegion mmio;
     CharBackend chr;
-    uint8_t rx_fifo[8];
-    unsigned int rx_fifo_len;
+    uint8_t rx_fifo[SIFIVE_UART_RX_FIFO_SIZE];
+    uint8_t rx_fifo_len;
     uint32_t ie;
     uint32_t ip;
     uint32_t txctrl;
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 5df8212961..278e21c434 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -19,10 +19,12 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "migration/vmstate.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "hw/irq.h"
 #include "hw/char/sifive_uart.h"
+#include "hw/qdev-properties-system.h"
 
 /*
  * Not yet implemented:
@@ -175,20 +177,112 @@ static int sifive_uart_be_change(void *opaque)
     return 0;
 }
 
+static Property sifive_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_uart_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_uart_ops, s,
+                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void sifive_uart_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveUARTState *s = SIFIVE_UART(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+                             sifive_uart_event, sifive_uart_be_change, s,
+                             NULL, true);
+
+}
+
+static void sifive_uart_reset_enter(Object *obj, ResetType type)
+{
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+    s->ie = 0;
+    s->ip = 0;
+    s->txctrl = 0;
+    s->rxctrl = 0;
+    s->div = 0;
+    s->rx_fifo_len = 0;
+}
+
+static void sifive_uart_reset_hold(Object *obj)
+{
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+    qemu_irq_lower(s->irq);
+}
+
+static const VMStateDescription vmstate_sifive_uart = {
+    .name = TYPE_SIFIVE_UART,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(rx_fifo, SiFiveUARTState,
+                            SIFIVE_UART_RX_FIFO_SIZE),
+        VMSTATE_UINT8(rx_fifo_len, SiFiveUARTState),
+        VMSTATE_UINT32(ie, SiFiveUARTState),
+        VMSTATE_UINT32(ip, SiFiveUARTState),
+        VMSTATE_UINT32(txctrl, SiFiveUARTState),
+        VMSTATE_UINT32(rxctrl, SiFiveUARTState),
+        VMSTATE_UINT32(div, SiFiveUARTState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+
+static void sifive_uart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+
+    dc->realize = sifive_uart_realize;
+    dc->vmsd = &vmstate_sifive_uart;
+    rc->phases.enter = sifive_uart_reset_enter;
+    rc->phases.hold  = sifive_uart_reset_hold;
+    device_class_set_props(dc, sifive_uart_properties);
+}
+
+static const TypeInfo sifive_uart_info = {
+    .name          = TYPE_SIFIVE_UART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFiveUARTState),
+    .instance_init = sifive_uart_init,
+    .class_init    = sifive_uart_class_init,
+};
+
+static void sifive_uart_register_types(void)
+{
+    type_register_static(&sifive_uart_info);
+}
+
+type_init(sifive_uart_register_types)
+
 /*
  * Create UART device.
  */
 SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
-    SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
-    s->irq = irq;
-    qemu_chr_fe_init(&s->chr, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
-                             sifive_uart_event, sifive_uart_be_change, s,
-                             NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
-                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
-    memory_region_add_subregion(address_space, base, &s->mmio);
-    return s;
+    DeviceState *dev;
+    SysBusDevice *s;
+    SiFiveUARTState *r;
+
+    dev = qdev_new("riscv.sifive.uart");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(address_space, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, irq);
+
+    r = SIFIVE_UART(dev);
+    return r;
 }
-- 
2.31.1


