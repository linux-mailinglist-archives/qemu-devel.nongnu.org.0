Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF7572909
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:09:51 +0200 (CEST)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO4j-0001c6-KG
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNq1-00037M-Dx; Tue, 12 Jul 2022 17:54:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpy-0007tF-Sz; Tue, 12 Jul 2022 17:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaHcGUblxmmANxEdiCNI1P/pRBpq8u4Je9D39gKPaBw=; b=uBlHTrSn9VvOBRDN9ZagPRsEVK
 7Wjv3Gxayr+CdTSXlUzyPB7s3orohzDX4cJo4Oick3ATOLCLF5WJQQC7kAGuvuJguJgOWMtTMUBcy
 wjic3TlPh5JKv20QbW+xlRTFu1VdmBfK4SbTXnSAumkInWsrP/ou7Liz4oBXIXYlK1FKmuV5t3DIb
 O6RO8032A5tWMrn91Vn4dbC874mOCvSw6VI+0P6JKMZNUd4h+Q7D5u2y+4lJ3VwiUFUj94nLUWmhU
 P7MYmUfoaM4rKUUmPjInFPaOj+vHDm9X+CGRVWgSzQ/ksPVfoWnJNWsHyK9hfwSg3PEJViTLsh8vj
 cpHjEkMAvAWEhOcb9y+GF2O3eXSckWCFwzTbHTog+7LKWgW7V9pxVoFyKk89PNlqTpYBhvHdmp/Ui
 7WgPfA5EnQh+LrKHCPUBHmVu41wt0JcEI4sfEvqY1gPhzFyi8euGxAloieFzu30NtKtjn80G9cPit
 baRiCJBZYslbaE3dsj772zuG1/xhgYX25DkexxPe70mySTNJUxlvupQgevYnovM0RMvMPGz04rsG+
 zrIcfy8ns/nLsiJKazhtmKUTMqOcVjk2//I0Iuq3SBep+tyEVsrPNFAuxoX9x+3ePMisZJA5PbVYp
 oeCnkwWO10HFRXy+RaA2XIpOMNW7aPlnCQSE0lq/M=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoH-000Bqt-4s; Tue, 12 Jul 2022 22:52:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:31 +0100
Message-Id: <20220712215251.7944-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 20/40] lasips2: move mouse port initialisation to new
 lasips2_mouse_port_init() function
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

Move the initialisation of the mouse port from lasips2_init() to
a new lasips2_mouse_port_init() function which will be invoked using
object_initialize_child() during the LASIPS2 device init.

Update LASIPS2State so that it now holds the new LASIPS2MousePort child object and
ensure that it is realised in lasips2_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 52 +++++++++++++++++++++++++-------------
 include/hw/input/lasips2.h |  2 +-
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 74427c9990..9535cab268 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -43,9 +43,9 @@ static const VMStateDescription vmstate_lasips2 = {
         VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
         VMSTATE_BOOL(kbd_port.parent_obj.irq, LASIPS2State),
-        VMSTATE_UINT8(mouse.control, LASIPS2State),
-        VMSTATE_UINT8(mouse.id, LASIPS2State),
-        VMSTATE_BOOL(mouse.irq, LASIPS2State),
+        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
+        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
+        VMSTATE_BOOL(mouse_port.parent_obj.irq, LASIPS2State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -119,8 +119,10 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd_port.parent_obj.irq | s->mouse.irq);
-    qemu_set_irq(s->irq, s->kbd_port.parent_obj.irq | s->mouse.irq);
+    trace_lasips2_intr(s->kbd_port.parent_obj.irq |
+                       s->mouse_port.parent_obj.irq);
+    qemu_set_irq(s->irq, s->kbd_port.parent_obj.irq |
+                         s->mouse_port.parent_obj.irq);
 }
 
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
@@ -211,8 +213,9 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd_port.parent_obj.irq || port->parent->mouse.irq) {
-            ret |= LASIPS2_STATUS_CMPINTR;
+        if (port->parent->kbd_port.parent_obj.irq ||
+            port->parent->mouse_port.parent_obj.irq) {
+                ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
 
@@ -249,7 +252,7 @@ static void lasips2_set_kbd_irq(void *opaque, int n, int level)
 static void lasips2_set_mouse_irq(void *opaque, int n, int level)
 {
     LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = &s->mouse;
+    LASIPS2Port *port = LASIPS2_PORT(&s->mouse_port);
 
     port->irq = level;
     lasips2_update_irq(port->parent);
@@ -269,8 +272,14 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    s->mouse.ps2dev = ps2_mouse_init();
-    qdev_connect_gpio_out(DEVICE(s->mouse.ps2dev), PS2_DEVICE_IRQ,
+
+    lp = LASIPS2_PORT(&s->mouse_port);
+    if (!(qdev_realize(DEVICE(lp), NULL, errp))) {
+        return;
+    }
+
+    lp->ps2dev = ps2_mouse_init();
+    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
 }
@@ -282,16 +291,13 @@ static void lasips2_init(Object *obj)
 
     object_initialize_child(obj, "lasips2-kbd-port", &s->kbd_port,
                             TYPE_LASIPS2_KBD_PORT);
-
-    s->mouse.id = 1;
-    s->mouse.parent = s;
-
-    memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
-                          "lasips2-mouse", 0x100);
+    object_initialize_child(obj, "lasips2-mouse-port", &s->mouse_port,
+                            TYPE_LASIPS2_MOUSE_PORT);
 
     lp = LASIPS2_PORT(&s->kbd_port);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &lp->reg);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+    lp = LASIPS2_PORT(&s->mouse_port);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &lp->reg);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
@@ -343,10 +349,22 @@ static const TypeInfo lasips2_kbd_port_info = {
     .instance_init = lasips2_kbd_port_init,
 };
 
+static void lasips2_mouse_port_init(Object *obj)
+{
+    LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(obj);
+    LASIPS2Port *lp = LASIPS2_PORT(obj);
+
+    memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
+                          0x100);
+    lp->id = 1;
+    lp->parent = container_of(s, LASIPS2State, mouse_port);
+}
+
 static const TypeInfo lasips2_mouse_port_info = {
     .name          = TYPE_LASIPS2_MOUSE_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2MousePort),
+    .instance_init = lasips2_mouse_port_init,
 };
 
 static void lasips2_register_types(void)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index f728f54c78..84807bec36 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -61,7 +61,7 @@ struct LASIPS2State {
     SysBusDevice parent_obj;
 
     LASIPS2KbdPort kbd_port;
-    LASIPS2Port mouse;
+    LASIPS2MousePort mouse_port;
     qemu_irq irq;
 };
 
-- 
2.30.2


