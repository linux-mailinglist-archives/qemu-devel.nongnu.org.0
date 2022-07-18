Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA15789CA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:51:25 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVq0-0001xP-I1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaV-0000jZ-BE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaQ-0005nV-Rc
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqbW2l6W6RhrinfjZD9GQcMCKG/77bm51JA5jKKJSlk=; b=Exqa+/GPnaYg4ntef8lF5rkfJv
 QH9RxMHPVwFRAdv+19ayDdEFV5xmv7nwSokfjLDkRVQs63XQ4AVmnNFO9boPKSt0u0iXJfbbG2uKw
 QEIUvrR8GauhrVbfVnIIAUX6tlVJs+2HxwnY0ccMKEf6KDzPNrdDMPZzOqO+g6+3OLNJGb72Ved4l
 cmWfBRfjdYq7YI+DW02ozwb34eLKxuZZ7k8lDtLBuYx5rJJprUtd5ck3IBLJcNGXW3iCtKRF9ouCB
 OxbGpYrELUTOxwPwYdMyaSN/ZK5tUa5eFtZ0v9I7+Hy26tpWA+7/8v0nIwH2q/S9m18p2/AiwJQBg
 heFSuAYAZ7XoTbvk2A9959CJGL0akAIBJIKIFYX1jlEM0hApkYYAdCaO8wgn7bXq17S7hgRunzEcO
 Y+gnoB45A9M4Zsix1/9+IEJRs+K6Y4LqOTOV/KTbHJYCn8TIZgluTqPaSCQiq2drQJhJw5q++f0Yu
 tN2trledoZBZsAwyjMuIWOzGWqlTTzPZ+NV9V0/5jcY5xoRs19kB6Z366fnbWiOHUk+rNRXsZTlVH
 WgFQRZFN4SSjXHsh42GdpaghRCGWy2GYXxN4scMEnvdxaIbGTN1ccLakBeZfmi0s6xV9+MW6/v1wk
 sRw8fbMlj9Lb9wZEhjP5qUaT60vx1IZJNhU54tEHc=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYv-000B51-90; Mon, 18 Jul 2022 19:33:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:18 +0100
Message-Id: <20220718183339.124253-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 19/40] lasips2: move keyboard port initialisation to new
 lasips2_kbd_port_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the initialisation of the keyboard port from lasips2_init() to
a new lasips2_kbd_port_init() function which will be invoked using
object_initialize_child() during the LASIPS2 device init.

Update LASIPS2State so that it now holds the new LASIPS2KbdPort child object and
ensure that it is realised in lasips2_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-20-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 47 ++++++++++++++++++++++++++------------
 include/hw/input/lasips2.h |  2 +-
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index f70cf893f6..74427c9990 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -40,9 +40,9 @@ static const VMStateDescription vmstate_lasips2 = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(kbd.control, LASIPS2State),
-        VMSTATE_UINT8(kbd.id, LASIPS2State),
-        VMSTATE_BOOL(kbd.irq, LASIPS2State),
+        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
+        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
+        VMSTATE_BOOL(kbd_port.parent_obj.irq, LASIPS2State),
         VMSTATE_UINT8(mouse.control, LASIPS2State),
         VMSTATE_UINT8(mouse.id, LASIPS2State),
         VMSTATE_BOOL(mouse.irq, LASIPS2State),
@@ -119,8 +119,8 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
-    qemu_set_irq(s->irq, s->kbd.irq | s->mouse.irq);
+    trace_lasips2_intr(s->kbd_port.parent_obj.irq | s->mouse.irq);
+    qemu_set_irq(s->irq, s->kbd_port.parent_obj.irq | s->mouse.irq);
 }
 
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
@@ -211,7 +211,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd.irq || port->parent->mouse.irq) {
+        if (port->parent->kbd_port.parent_obj.irq || port->parent->mouse.irq) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -240,7 +240,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
 static void lasips2_set_kbd_irq(void *opaque, int n, int level)
 {
     LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = &s->kbd;
+    LASIPS2Port *port = LASIPS2_PORT(&s->kbd_port);
 
     port->irq = level;
     lasips2_update_irq(port->parent);
@@ -258,9 +258,15 @@ static void lasips2_set_mouse_irq(void *opaque, int n, int level)
 static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
+    LASIPS2Port *lp;
 
-    s->kbd.ps2dev = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd.ps2dev), PS2_DEVICE_IRQ,
+    lp = LASIPS2_PORT(&s->kbd_port);
+    if (!(qdev_realize(DEVICE(lp), NULL, errp))) {
+        return;
+    }
+
+    lp->ps2dev = ps2_kbd_init();
+    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
     s->mouse.ps2dev = ps2_mouse_init();
@@ -272,18 +278,19 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 static void lasips2_init(Object *obj)
 {
     LASIPS2State *s = LASIPS2(obj);
+    LASIPS2Port *lp;
+
+    object_initialize_child(obj, "lasips2-kbd-port", &s->kbd_port,
+                            TYPE_LASIPS2_KBD_PORT);
 
-    s->kbd.id = 0;
     s->mouse.id = 1;
-    s->kbd.parent = s;
     s->mouse.parent = s;
 
-    memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
-                          "lasips2-kbd", 0x100);
     memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
 
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
+    lp = LASIPS2_PORT(&s->kbd_port);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &lp->reg);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
@@ -318,10 +325,22 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static void lasips2_kbd_port_init(Object *obj)
+{
+    LASIPS2KbdPort *s = LASIPS2_KBD_PORT(obj);
+    LASIPS2Port *lp = LASIPS2_PORT(obj);
+
+    memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-kbd",
+                          0x100);
+    lp->id = 0;
+    lp->parent = container_of(s, LASIPS2State, kbd_port);
+}
+
 static const TypeInfo lasips2_kbd_port_info = {
     .name          = TYPE_LASIPS2_KBD_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2KbdPort),
+    .instance_init = lasips2_kbd_port_init,
 };
 
 static const TypeInfo lasips2_mouse_port_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index aab6a3500c..f728f54c78 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -60,7 +60,7 @@ struct LASIPS2MousePort {
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-    LASIPS2Port kbd;
+    LASIPS2KbdPort kbd_port;
     LASIPS2Port mouse;
     qemu_irq irq;
 };
-- 
2.30.2


