Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF8556018A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:41:35 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xwi-00076c-NM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1Z-0001YL-Dc; Wed, 29 Jun 2022 08:42:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1X-0005Rs-NU; Wed, 29 Jun 2022 08:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XkVqp2B9+fzLZmAgrlzGVDRYyMDijZTV5Rp4JZw6uAI=; b=PFylWWwOtZd3ehQ8ZfipYQaa4E
 P87KmDIG4MNA13RbKSjvFBxNqcbsBT1Ebdjg8b40h2vzFyNByXAgaK0CKMaV3B+ij39aNHwBGlFeq
 MpB+cOifiTD/Lpr8SrYshhucwDlxGlNqjxpL97Lw6l5IXzFqmKKKNmTvGqO66kxbYkv1pawKnIruo
 0W9UuXeKWga/vwcHadCSjibbGSQ1rQtUR3xVuSrepDc4vJZBfQFyIVbBmDwY+rcpwLz2v6qxT6WhK
 S4i8x7Bx6NTd8yGrXUtLikRWCwyIdmo6dYj1ZltKEHq2HPh8LlO2gIGso1K9jkXHgqtKSSPIv+WUp
 4PmxhoONjW9mMvpwbbAp1PX0k4JHyNAtwaG7nTKCXNxenAmwpj4Bazw4+go5e6+WTHRHP2zP0xv7a
 O+IZK4vEI3JE3UMDKpE4aElSEncvYNh1xd5J2Bk6q4RwHOy3Xg3hdJa1b/YTxOzr+ZrSn0N10EPwf
 zBrD5bufGDSFGtybbSpHOFJOhHX+SN08xd440KWv9E8OrscchGafrEycKYWOQ+T+SD8UckSQ1xeKN
 Y2URDot2r+stdKK8F3XzKt3skMHt5PHKnpwl3F1DuPU0Pt0Me18hMEhmN2l0IBSqIScE7kdukQ+4/
 mtO9QJxRV0J+yw+ni8Zt7AwqxfAgPU3vvoO61rsis=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzt-0002tZ-FN; Wed, 29 Jun 2022 13:40:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:24 +0100
Message-Id: <20220629124026.1077021-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 38/40] pckbd: don't use legacy ps2_mouse_init() function
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


