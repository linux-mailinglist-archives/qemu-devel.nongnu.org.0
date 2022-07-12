Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DE572972
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:45:06 +0200 (CEST)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOcr-00034W-6c
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNr5-0004wk-Ci; Tue, 12 Jul 2022 17:55:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNr3-0008FY-AE; Tue, 12 Jul 2022 17:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MxRr1x7sp4HGU5f22Vh/2CbOx09OaRYzGgw12ODP/AM=; b=PMTH7YEbQxFW5A8qqSgn2PyBiS
 SkpaPcAM0E/PC1NiGxgZf59ovS5BUbroRasFXERWB9UsE8oLwmNGgDgEH0X43Prr+SgGm9oX5Lt2L
 N5P6lO/exJPpiO2YAH3PV1W5Hzx08/Th80FgbdU82e6PWdoyVpVTsFmRVneZPPfSNZzydMqLrGzzk
 FUJ6DgXr2eXFLb2OL1/IkeUbUsKOK2ZcledwcTioNlqLG4bLCeTwyjmMQoDWJoG3yONHZ9NjEZd7J
 fyF/bAGVWHQ6vu+sP2riX2pK/gtwvlWk0gpTSWKrvohBBlbzfELmczqkmLfaA7GYdZKaTAvQuza6U
 3jYlt/fIUD0hsqyc5VknIWb/HAAFXfn9kcero5PRl4yGHtU4HwOqcJyipO5mVy+mOA1HTcWvNeomU
 CGfR31WTqXqkfbJJnUfntI0r+ZSfQPJyBheDNlL2kYdcEThL3MJKYDvT26mhmHRGI14r82/9E6YnI
 fV/VURIZYjM85z3NlkKcCPNvmcFGCQGTh4Bg/WZLkuY/+AK+J6c26hiTu0g7Z43p7xhS/7ZSpC+Az
 CM9TS2dZwvrFwQT2wSMhw2ApeUsxmhQqG4eU8SxMiGAnMMyglGqMye7MHy0aoxEjZLb5YomQJgoPi
 bCbzVT3TuFL1D03siGKkyQ4CoYslgg7WCzjpXPaF8=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpL-000Bqt-0p; Tue, 12 Jul 2022 22:53:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:49 +0100
Message-Id: <20220712215251.7944-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 38/40] pckbd: don't use legacy ps2_mouse_init() function
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

Instantiate the PS2 mouse device within KBDState using
object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
it in i8042_realizefn() and i8042_mmio_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 27 +++++++++++++++++++--------
 include/hw/input/i8042.h |  2 +-
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index cb452f2612..0fc1af403e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -286,7 +286,7 @@ static void kbd_queue(KBDState *s, int b, int aux)
         s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
         kbd_safe_update_irq(s);
     } else {
-        ps2_queue(aux ? s->mouse : PS2_DEVICE(&s->ps2kbd), b);
+        ps2_queue(aux ? PS2_DEVICE(&s->ps2mouse) : PS2_DEVICE(&s->ps2kbd), b);
     }
 }
 
@@ -410,7 +410,7 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
             }
             s->obdata = ps2_read_data(PS2_DEVICE(&s->ps2kbd));
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
-            s->obdata = ps2_read_data(s->mouse);
+            s->obdata = ps2_read_data(PS2_DEVICE(&s->ps2mouse));
         } else if (s->obsrc & KBD_OBSRC_CTRL) {
             s->obdata = kbd_dequeue(s);
         }
@@ -459,7 +459,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
         outport_write(s, val);
         break;
     case KBD_CCMD_WRITE_MOUSE:
-        ps2_write_mouse(s->mouse, val);
+        ps2_write_mouse(&s->ps2mouse, val);
         /* sending data to the mouse reenables PS/2 communication */
         s->mode &= ~KBD_MODE_DISABLE_MOUSE;
         kbd_safe_update_irq(s);
@@ -704,12 +704,15 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!sysbus_realize(SYS_BUS_DEVICE(&ks->ps2mouse), errp)) {
+        return;
+    }
+
     qdev_connect_gpio_out(DEVICE(&ks->ps2kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
 
-    ks->mouse = ps2_mouse_init();
-    qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
+    qdev_connect_gpio_out(DEVICE(&ks->ps2mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
 }
@@ -722,6 +725,8 @@ static void i8042_mmio_init(Object *obj)
     ks->extended_state = true;
 
     object_initialize_child(obj, "ps2kbd", &ks->ps2kbd, TYPE_PS2_KBD_DEVICE);
+    object_initialize_child(obj, "ps2mouse", &ks->ps2mouse,
+                            TYPE_PS2_MOUSE_DEVICE);
 
     qdev_init_gpio_out(DEVICE(obj), ks->irqs, 2);
     qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_kbd_irq,
@@ -785,7 +790,7 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
     KBDState *s = &isa->kbd;
 
-    ps2_mouse_fake_event(s->mouse);
+    ps2_mouse_fake_event(&s->ps2mouse);
 }
 
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
@@ -859,6 +864,8 @@ static void i8042_initfn(Object *obj)
                           "i8042-cmd", 1);
 
     object_initialize_child(obj, "ps2kbd", &s->ps2kbd, TYPE_PS2_KBD_DEVICE);
+    object_initialize_child(obj, "ps2mouse", &s->ps2mouse,
+                            TYPE_PS2_MOUSE_DEVICE);
 
     qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
 
@@ -901,10 +908,14 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
 
-    s->mouse = ps2_mouse_init();
-    qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ps2mouse), errp)) {
+        return;
+    }
+
+    qdev_connect_gpio_out(DEVICE(&s->ps2mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
+
     if (isa_s->kbd_throttle && !isa_s->kbd.extended_state) {
         warn_report(TYPE_I8042 ": can't enable kbd-throttle without"
                     " extended-state, disabling kbd-throttle");
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 8beb0ac01f..e199f1ece8 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -32,7 +32,7 @@ typedef struct KBDState {
     uint8_t cbdata;
     uint8_t pending_tmp;
     PS2KbdState ps2kbd;
-    void *mouse;
+    PS2MouseState ps2mouse;
     QEMUTimer *throttle_timer;
 
     qemu_irq irqs[2];
-- 
2.30.2


