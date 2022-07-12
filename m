Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A018B57295E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:34:00 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOS7-0007BW-PL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqz-0004pJ-M8; Tue, 12 Jul 2022 17:55:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqv-0008Bq-CG; Tue, 12 Jul 2022 17:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qv2VAuYpynDUuetTvJGxbtIK+8joHZHB07QUkFtSUc=; b=SUpPyDHqtz0ro16SALZNtTIH1v
 yOZgRBRmOc/WmH31fIS0GYor9whjqy1N4Ga6g1Np+OVHQdYbcZ6zDVrb8lNbVIy0yGEhqHn0tLFlC
 aJ1SQoIq0MBmOrLGg5J8/B8uupGB7/71ZGf5HIOsURU5HGUgbrUjWPSxkdubX0qLoj/pEAymNYQ0X
 DcJwt8djScPsxxwQdxH6idg1NgHUcTse8yiOWe43XybBQ4HvT3mFb96ZisjbMyI81jQpN510NIxsb
 76wI23nKkO21syPzh1eLCcFW0bt03o25wCwthyYt3cCbZhEmKXMU5eaoVnfk3yneIwLR5wrcgy4Gw
 m7OZ+gMp1JULSDDgAGeaYYsjePCW5rBAtMs4xknqO+zrjf/SbovC4PaSTwFI96oxTpkRtwkGVKz5/
 IIyJytzGwkSQ33NpoYZu3yHAhjtUV0FN/j9dBWVwoUIBuifLbX45IGTTfhCuJMzEyJp7OBp+4xrNi
 hUVPA7j/q3nEuM65etEXu0+5Xtnc0thp1Lxkex13OUyqXyfDyMDOatmjDnPVIPSIlJWVsIN5EmwkB
 /RJI6593GibEVAzrVlpFiNzHdy1Wcu6t+YBzgISA+gh9yzPQzN4WHy8ECpx5g3SKVQUvPI6btLVkB
 SJNo/V58fPrNw8HOMs0tYkeQyOdDfUg800oIK2iPg=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpD-000Bqt-OA; Tue, 12 Jul 2022 22:53:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:47 +0100
Message-Id: <20220712215251.7944-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 36/40] pckbd: don't use legacy ps2_kbd_init() function
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

Instantiate the PS2 keyboard device within KBDState using
object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
it in i8042_realizefn() and i8042_mmio_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 29 +++++++++++++++++++++--------
 include/hw/input/i8042.h |  3 ++-
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 195a64f520..cb452f2612 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -286,7 +286,7 @@ static void kbd_queue(KBDState *s, int b, int aux)
         s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
         kbd_safe_update_irq(s);
     } else {
-        ps2_queue(aux ? s->mouse : s->kbd, b);
+        ps2_queue(aux ? s->mouse : PS2_DEVICE(&s->ps2kbd), b);
     }
 }
 
@@ -408,7 +408,7 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
                 timer_mod(s->throttle_timer,
                           qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) + 1000);
             }
-            s->obdata = ps2_read_data(s->kbd);
+            s->obdata = ps2_read_data(PS2_DEVICE(&s->ps2kbd));
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
             s->obdata = ps2_read_data(s->mouse);
         } else if (s->obsrc & KBD_OBSRC_CTRL) {
@@ -429,14 +429,15 @@ static void kbd_write_data(void *opaque, hwaddr addr,
 
     switch (s->write_cmd) {
     case 0:
-        ps2_write_keyboard(s->kbd, val);
+        ps2_write_keyboard(&s->ps2kbd, val);
         /* sending data to the keyboard reenables PS/2 communication */
         s->mode &= ~KBD_MODE_DISABLE_KBD;
         kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
-        ps2_keyboard_set_translation(s->kbd, (s->mode & KBD_MODE_KCC) != 0);
+        ps2_keyboard_set_translation(&s->ps2kbd,
+                                     (s->mode & KBD_MODE_KCC) != 0);
         /*
          * a write to the mode byte interrupt enable flags directly updates
          * the irq lines
@@ -699,10 +700,14 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
 
-    ks->kbd = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
+    if (!sysbus_realize(SYS_BUS_DEVICE(&ks->ps2kbd), errp)) {
+        return;
+    }
+
+    qdev_connect_gpio_out(DEVICE(&ks->ps2kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
+
     ks->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
@@ -716,6 +721,8 @@ static void i8042_mmio_init(Object *obj)
 
     ks->extended_state = true;
 
+    object_initialize_child(obj, "ps2kbd", &ks->ps2kbd, TYPE_PS2_KBD_DEVICE);
+
     qdev_init_gpio_out(DEVICE(obj), ks->irqs, 2);
     qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_kbd_irq,
                             "ps2-kbd-input-irq", 1);
@@ -851,6 +858,8 @@ static void i8042_initfn(Object *obj)
     memory_region_init_io(isa_s->io + 1, obj, &i8042_cmd_ops, s,
                           "i8042-cmd", 1);
 
+    object_initialize_child(obj, "ps2kbd", &s->ps2kbd, TYPE_PS2_KBD_DEVICE);
+
     qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
 
     qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
@@ -884,10 +893,14 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
 
-    s->kbd = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd), PS2_DEVICE_IRQ,
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ps2kbd), errp)) {
+        return;
+    }
+
+    qdev_connect_gpio_out(DEVICE(&s->ps2kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
+
     s->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index ca933d8e1b..8beb0ac01f 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -10,6 +10,7 @@
 
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
+#include "hw/input/ps2.h"
 #include "qom/object.h"
 
 #define I8042_KBD_IRQ      0
@@ -30,7 +31,7 @@ typedef struct KBDState {
     uint8_t obdata;
     uint8_t cbdata;
     uint8_t pending_tmp;
-    void *kbd;
+    PS2KbdState ps2kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
 
-- 
2.30.2


