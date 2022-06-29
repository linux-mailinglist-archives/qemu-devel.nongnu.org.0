Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6BD56015F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:34:51 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XqC-0007WK-8e
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1G-0000dy-2t; Wed, 29 Jun 2022 08:42:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1D-0004lL-3X; Wed, 29 Jun 2022 08:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMG5hdGAWVYBOw8CgNJ9+TA7NMbEsvdQMQzaAWj3YJA=; b=JdO9OY4t1VC9R7mTxK3w7lBzPR
 VFdGIDG1oqjYUFIRkj/WvDW6uYHXL7JLTCGsWIPlXtWitOHqAEjsu7TZe1kUWiK/+HPLP4P/lJGIF
 Bwie7yaWv43vONfgFoc6r7nHKst+f8lYwbbbWkKaWMWDh2HhYcsDca9RinrsxvaHq+YVXjmj8eAED
 1aCvbvrUPW1m61kJs+aVlLwLHDZT5rX5wcd9ayQ1j0gLxlEyAv5exxhR7tsmmyGvzS3vfikME/vxX
 jgPVqXlD6vVHfAzgw1Qqs3on1y5PnLQf3z6derR5uhGXE727mKk0GQ/gLzzesP4mPCP/QB4mdN9aZ
 jVx+S/mhn09whsJYs8+M3u/CsmVVx5M2sAdrFBLsPzFCiithZ9uppNB36s08kAAJ0tkW4WL7xpe0g
 T2RRU2uuLQt1veESsxp5Z+I9qqOtjZKhE2htMmTFRkBQIJYXPGalfGBJ8NGZOtoINCFJJMfS5grlX
 pSQaV1NmaiEH633tJp/YMOeru+ZHQ6Q7rbJCvglM4r3/k3gCE+izNkiC6rzVzVA8H5nn0nydkrnJS
 FJKAgbJwTYsZvFEFc/5cJ6jJ09vt6uZrkxNPKaOS73SCMbJxMcUf8XfVzbFjiCub4pYqA+cEBou/a
 zemBJkZnZ1bxEFQdj6l3JNfBEHPX2upQQUl+Nd/E4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzc-0002tZ-6m; Wed, 29 Jun 2022 13:40:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:14 +0100
Message-Id: <20220629124026.1077021-29-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 28/40] lasips2: switch to using port-based IRQs
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

Now we can implement port-based IRQs by wiring the PS2 device IRQs to the
LASI2Port named input gpios rather than directly to the LASIPS2 device, and
generate the LASIPS2 output IRQ from the int_status bitmap representing the
individual port IRQs instead of the birq boolean.

This enables us to remove the separate PS2 keyboard and PS2 mouse named input
gpios from the LASIPS2 device and simplify the register implementation to
drive the port IRQ using qemu_set_irq() rather than accessing the LASIPS2
device IRQs directly. As a consequence the IRQ level logic in lasips2_set_irq()
can also be simplified accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 59 ++++++++++++--------------------------
 include/hw/input/lasips2.h |  7 ++---
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 013d891af6..5ceb38c1af 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -42,10 +42,8 @@ static const VMStateDescription vmstate_lasips2 = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(kbd_port.parent_obj.birq, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(mouse_port.parent_obj.birq, LASIPS2State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -119,10 +117,10 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd_port.parent_obj.birq |
-                       s->mouse_port.parent_obj.birq);
-    qemu_set_irq(s->irq, s->kbd_port.parent_obj.birq |
-                         s->mouse_port.parent_obj.birq);
+    int level = s->int_status ? 1 : 0;
+
+    trace_lasips2_intr(level);
+    qemu_set_irq(s->irq, level);
 }
 
 static void lasips2_set_irq(void *opaque, int n, int level)
@@ -154,9 +152,8 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     case REG_PS2_XMTDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
             port->buf = val;
-            port->birq = true;
             port->loopback_rbne = true;
-            lasips2_update_irq(port->parent);
+            qemu_set_irq(port->irq, 1);
             break;
         }
 
@@ -189,9 +186,8 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
 
     case REG_PS2_RCVDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->birq = false;
             port->loopback_rbne = false;
-            lasips2_update_irq(port->parent);
+            qemu_set_irq(port->irq, 0);
             ret = port->buf;
             break;
         }
@@ -226,9 +222,8 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd_port.parent_obj.birq ||
-            port->parent->mouse_port.parent_obj.birq) {
-                ret |= LASIPS2_STATUS_CMPINTR;
+        if (port->parent->int_status) {
+            ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
 
@@ -253,24 +248,6 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void lasips2_set_kbd_irq(void *opaque, int n, int level)
-{
-    LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = LASIPS2_PORT(&s->kbd_port);
-
-    port->birq = level;
-    lasips2_update_irq(port->parent);
-}
-
-static void lasips2_set_mouse_irq(void *opaque, int n, int level)
-{
-    LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = LASIPS2_PORT(&s->mouse_port);
-
-    port->birq = level;
-    lasips2_update_irq(port->parent);
-}
-
 static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
@@ -281,18 +258,18 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
-                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
-                                                 0));
+    qdev_connect_gpio_out(DEVICE(lp), 0,
+                          qdev_get_gpio_in_named(dev, "lasips2-port-input-irq",
+                                                 lp->id));
 
     lp = LASIPS2_PORT(&s->mouse_port);
     if (!(qdev_realize(DEVICE(lp), NULL, errp))) {
         return;
     }
 
-    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
-                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
-                                                 0));
+    qdev_connect_gpio_out(DEVICE(lp), 0,
+                          qdev_get_gpio_in_named(dev, "lasips2-port-input-irq",
+                                                 lp->id));
 }
 
 static void lasips2_init(Object *obj)
@@ -312,10 +289,6 @@ static void lasips2_init(Object *obj)
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
-    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_kbd_irq,
-                            "ps2-kbd-input-irq", 1);
-    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
-                            "ps2-mouse-input-irq", 1);
     qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
                             "lasips2-port-input-irq", 2);
 }
@@ -381,8 +354,10 @@ static const TypeInfo lasips2_port_info = {
 static void lasips2_kbd_port_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2Port *lp = LASIPS2_PORT(dev);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
     lp->ps2dev = ps2_kbd_init();
+    lpdc->parent_realize(dev, errp);
 }
 
 static void lasips2_kbd_port_init(Object *obj)
@@ -416,8 +391,10 @@ static const TypeInfo lasips2_kbd_port_info = {
 static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2Port *lp = LASIPS2_PORT(dev);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
     lp->ps2dev = ps2_mouse_init();
+    lpdc->parent_realize(dev, errp);
 }
 
 static void lasips2_mouse_port_init(Object *obj)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index b79febf64b..7199f16622 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -12,10 +12,8 @@
  * + sysbus MMIO region 1: MemoryRegion defining the LASI PS2 mouse
  *   registers
  * + sysbus IRQ 0: LASI PS2 output irq
- * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
- *   keyboard device has asserted its irq
- * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
- *   mouse device has asserted its irq
+ * + Named GPIO input "lasips2-port-input-irq[0..1]": set to 1 if the downstream
+ *   LASIPS2Port has asserted its irq
  */
 
 #ifndef HW_INPUT_LASIPS2_H
@@ -46,7 +44,6 @@ struct LASIPS2Port {
     uint8_t control;
     uint8_t buf;
     bool loopback_rbne;
-    bool birq;
     qemu_irq irq;
 };
 
-- 
2.30.2


