Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562F5789F5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:00:44 +0200 (CEST)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVz1-0000kj-7h
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaY-0000m0-0I
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaV-0005oF-6m
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JHjz4cmqhaUM0L79N6TyiJmCjQuntNgv1DnbRAIwnnM=; b=hm1gPJ+nU8ugoOzIaj60P0jj2I
 pAaADlxmr7BwG3S/Rp5qoTgbLWo7/0CV6lPnMzUe2KS963nQMGDjm2Lf8jpUgndknNxCTwpSfITJ7
 yDFVvdJuGKf2EbIicm4CA99n680bYlw+E6773kEjmrk7RGqZa/w+NKHl3r7ioJwBWIBtUrUCr4k1P
 BFErcRC7avgRpQZm3m/p731uVCUfegis18RsPuUrjDFRww41T2Bccapzxrb88D0N/+PTwGtORp2Sf
 oibwBjW8Kf3xxb0k6F6SQWW+XiBtz8BGaFwSO2yE7N1GRZS7FKXHOI/Kh7P+pJExzl8gI/y6IEUTE
 foOt1GeSkkUprKQkYlR8Z3VfpT6bvylKRyAyorLaoFxgVP/RtzF832N8oa77IcK7moqLgkbLFoDph
 ts8vslPQBUp66tcT7tpsF/rGE2wSqEc5m1wnsGg4XQkYyrmhpcZRJ0xsyTeX3hZAeAoRVl5D7QxuJ
 F8oHtK9kYfo4yPco+MIxx/RaYS4GvH4BbojrLkwAxMsq2s+pRodfxsFJrkMed0L3CSGZiJKCZdXEm
 rfKko5S8LuxFEQ/Qq9PZP189i7ycWHMA12dF8NWdfC3rbRHxZPJji/NLR4U5Ft7q59ndCmMwt/kHH
 DIXpcyjDz4OMi8vv0dNbC88Snw2EsIcLuiSydwYl0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYz-000B51-Jb; Mon, 18 Jul 2022 19:33:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:19 +0100
Message-Id: <20220718183339.124253-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 20/40] lasips2: move mouse port initialisation to new
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
Message-Id: <20220712215251.7944-21-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


