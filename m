Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCC55B38B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:39:56 +0200 (CEST)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5XAp-0003JN-Nw
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSJ-00060a-Gy
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSH-0000y0-LU
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DEGDwtWAz88eZMF+Rdl89YpmlNrQkSN1Qqv7bjyriPg=; b=O2P9S3vV7tb3aU9XgNxOtR2n4v
 g9HNA+enjRQ+V15xMMBOptvssLLMa8HWENQUy453xr/EioDZ4T4A6cyvgzxBUpxwtg9Mf8ip0bQEl
 mwoEoyqXnKDrmtbztPS5jjDt7cZRXCHwyLMXpSSDNRtgyMu7bG5bdYSYsGC7GuSIYWfoudEbms3Oi
 x2oTfF60n8aIEkvw93aDLliqQqd1WC2svr6QHajQW89bSyBPIXAe8+G6hEP7FyVMzPQbkC9gABkwz
 QI2jRzSwYuEKVEAs8fSHOckzgbOZ2n3TG7ZGvrzlRJ4x6Qk50bi95UzMBLqusIMcBOJAuffONmA/d
 prgMELI/ZyfbUlLjReqQcuWcpAr8aDum+JOTl3+O4xuuT5GBz6iAmYqhmLvjDHT6DLdm2nyl8P+Xw
 kGjjfzOmBQWyHZbYSvUB2r/Zhh2v0+OTLpnE9/xLbGXkQUhowblm3B3Abc0SDAJsMl4aVwduxX2RP
 SmjIYSFlFZME4AAw+kdpEo4xyEmK65uPxhCTL1BBnQAXgrJ7iiMssivmKFoR8sz4pp8RNIOqUeznP
 v1TROoF4/qlZ63qm0JEZ4AHIMQn1p0VNIkEJ5u/LQmD4KoTPLZ+5TQ+94CMa/PBBEy7sR4o5c/K7H
 8HSImBcY8ouXJTHxihFXCKOrW6/ylcdeCi5pwpvLg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMP-0007KY-Od; Sun, 26 Jun 2022 18:47:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:30 +0100
Message-Id: <20220626174531.969187-55-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 54/55] ps2: remove update_irq() function and update_arg
 parameter
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

Now that all the PS2 devices have been converted to use GPIOs the update_irq()
callback function and the update_arg parameter can be removed.

This allows these arguments to be completely removed from ps2_kbd_init() and
ps2_mouse_init(), along with the transitional logic that was added to
ps2_raise_irq() and ps2_lower_irq().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-55-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c     |  4 ++--
 hw/input/pckbd.c       |  8 ++++----
 hw/input/pl050.c       |  4 ++--
 hw/input/ps2.c         | 25 ++++---------------------
 include/hw/input/ps2.h |  6 ++----
 5 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index a6e14e0e6b..9223cb0af4 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -274,11 +274,11 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 
     vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(NULL, NULL);
+    s->kbd.dev = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    s->mouse.dev = ps2_mouse_init(NULL, NULL);
+    s->mouse.dev = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 18f27abc58..9184411c3e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -702,11 +702,11 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
 
-    ks->kbd = ps2_kbd_init(NULL, NULL);
+    ks->kbd = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    ks->mouse = ps2_mouse_init(NULL, NULL);
+    ks->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
@@ -876,11 +876,11 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
 
-    s->kbd = ps2_kbd_init(NULL, NULL);
+    s->kbd = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(s->kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
-    s->mouse = ps2_mouse_init(NULL, NULL);
+    s->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index ffaa72dea4..209cc001cf 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -172,9 +172,9 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(NULL, NULL);
+        s->dev = ps2_mouse_init();
     } else {
-        s->dev = ps2_kbd_init(NULL, NULL);
+        s->dev = ps2_kbd_init();
     }
     qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 98c6206fb8..59bac28ac8 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -175,20 +175,12 @@ void ps2_queue_noirq(PS2State *s, int b)
 
 static void ps2_raise_irq(PS2State *s)
 {
-    if (qemu_irq_is_connected(s->irq)) {
-        qemu_set_irq(s->irq, 1);
-    } else {
-        s->update_irq(s->update_arg, 1);
-    }
+    qemu_set_irq(s->irq, 1);
 }
 
 static void ps2_lower_irq(PS2State *s)
 {
-    if (qemu_irq_is_connected(s->irq)) {
-        qemu_set_irq(s->irq, 0);
-    } else {
-        s->update_irq(s->update_arg, 0);
-    }
+    qemu_set_irq(s->irq, 0);
 }
 
 void ps2_queue(PS2State *s, int b)
@@ -1232,21 +1224,16 @@ static void ps2_kbd_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &ps2_keyboard_handler);
 }
 
-void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
+void *ps2_kbd_init(void)
 {
     DeviceState *dev;
     PS2KbdState *s;
-    PS2State *ps2;
 
     dev = qdev_new(TYPE_PS2_KBD_DEVICE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = PS2_KBD_DEVICE(dev);
-    ps2 = PS2_DEVICE(s);
 
     trace_ps2_kbd_init(s);
-    ps2->update_irq = update_irq;
-    ps2->update_arg = update_arg;
-
     return s;
 }
 
@@ -1262,20 +1249,16 @@ static void ps2_mouse_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &ps2_mouse_handler);
 }
 
-void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
+void *ps2_mouse_init(void)
 {
     DeviceState *dev;
     PS2MouseState *s;
-    PS2State *ps2;
 
     dev = qdev_new(TYPE_PS2_MOUSE_DEVICE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = PS2_MOUSE_DEVICE(dev);
-    ps2 = PS2_DEVICE(s);
 
     trace_ps2_mouse_init(s);
-    ps2->update_irq = update_irq;
-    ps2->update_arg = update_arg;
     return s;
 }
 
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 5422aee9aa..a78619d8cb 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -59,8 +59,6 @@ struct PS2State {
     PS2Queue queue;
     int32_t write_cmd;
     qemu_irq irq;
-    void (*update_irq)(void *, int);
-    void *update_arg;
 };
 
 #define TYPE_PS2_DEVICE "ps2-device"
@@ -100,8 +98,8 @@ struct PS2MouseState {
 OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 /* ps2.c */
-void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
-void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
+void *ps2_kbd_init(void);
+void *ps2_mouse_init(void);
 void ps2_write_mouse(PS2MouseState *s, int val);
 void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
-- 
2.30.2


