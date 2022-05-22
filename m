Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3853053E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:44:09 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqYi-0000iq-E4
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAm-0006px-6M; Sun, 22 May 2022 14:19:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAk-0003XJ-Et; Sun, 22 May 2022 14:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zLE66DdlmGT6YsVkLhsiFf/Fxn8Oc3TVtMPzp+lJT5g=; b=NpYzxKhw0F3yvNqWhNmoFzWOoV
 aAHT3oPfzg/00dITVTAlPkMrrXHV+NiNhUpt+C7RVAtrzMs7WC2nf99qqDfhSXDXid4XyZixq4QX0
 sw/r3FY93+J4uej2YcfpNEeDT8qYxLx2loOfZFyl6rFpU63+c44x4jXOUp6tFq7777xtSLQf8Npd/
 f8QQVofzRcM2frRji5x9C3scL4H/D3o4QTyRs5owWoctuEf+kYZhsfPHVkMDRPEcvxpGu8VWNZx2z
 iYDDXySNdGwvcoltuefBP/PRhZemSld1t7IwP4BuC1Lv+H3pHLniVFkTisjVTJrOgQ1b6HZjoCHYN
 YQX8UNU0A8hBbRr4BH6tfDxqA5PMjyJIdpiYWSntoJLQNwr1HTBTRijusNEJzml49Wid+X4F96JVB
 o5NAonWNuPy7lkqWqiuHpKnwYfQmqIBXH3nJ2Sz2+MZ7LkZ69aRsAFs76mVh4p04JoTYCQ0xbn1to
 Xdvdisyinaabi6bJizaNhFA3f8IW22xNPYYz3LQC24334hi6O8let8ySvsFIc0liK/dzJ1lEPSdJe
 ATpjyHXyjy+B9HDenvmt7R7YBjUQ+Pp1hAnw9bJ7o/wf8jhgcN7vnOjLH42GD07ej0mjB/47RB7n6
 mGXiOxEjXPXxz0Er4fWXFqE9a6SjfTZ1RjOtvmHao=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9b-0007pH-78; Sun, 22 May 2022 19:18:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:54 +0100
Message-Id: <20220522181836.864-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/50] ps2: implement ps2_reset() for the PS2_DEVICE QOM type
 based upon ps2_common_reset()
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

The functionality of ps2_common_reset() can be moved into a new ps2_reset() function
for the PS2_DEVICE QOM type. Update PS2DeviceClass to hold a reference to the parent
reset function and update the PS2_KBD_DEVICE and PS2_MOUSE_DEVICE types to use
device_class_set_parent_reset() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 48 ++++++++++++++++++++++++++++++------------
 include/hw/input/ps2.h |  2 ++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 3a770f3b78..5990eb6f79 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -995,8 +995,10 @@ void ps2_write_mouse(PS2MouseState *s, int val)
     }
 }
 
-static void ps2_common_reset(PS2State *s)
+static void ps2_reset(DeviceState *dev)
 {
+    PS2State *s = PS2_DEVICE(dev);
+
     s->write_cmd = -1;
     ps2_reset_queue(s);
     s->update_irq(s->update_arg, 0);
@@ -1028,26 +1030,28 @@ static void ps2_common_post_load(PS2State *s)
     q->cwptr = ccount ? (q->rptr + ccount) & (PS2_BUFFER_SIZE - 1) : -1;
 }
 
-static void ps2_kbd_reset(void *opaque)
+static void ps2_kbd_reset(DeviceState *dev)
 {
-    PS2KbdState *s = (PS2KbdState *) opaque;
-    PS2State *ps2 = PS2_DEVICE(s);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
+    PS2KbdState *s = PS2_KBD_DEVICE(dev);
+
+    trace_ps2_kbd_reset(s);
+    ps2dc->parent_reset(dev);
 
-    trace_ps2_kbd_reset(opaque);
-    ps2_common_reset(ps2);
     s->scan_enabled = 1;
     s->translate = 0;
     s->scancode_set = 2;
     s->modifiers = 0;
 }
 
-static void ps2_mouse_reset(void *opaque)
+static void ps2_mouse_reset(DeviceState *dev)
 {
-    PS2MouseState *s = (PS2MouseState *) opaque;
-    PS2State *ps2 = PS2_DEVICE(s);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
+    PS2MouseState *s = PS2_MOUSE_DEVICE(dev);
+
+    trace_ps2_mouse_reset(s);
+    ps2dc->parent_reset(dev);
 
-    trace_ps2_mouse_reset(opaque);
-    ps2_common_reset(ps2);
     s->mouse_status = 0;
     s->mouse_resolution = 0;
     s->mouse_sample_rate = 0;
@@ -1227,7 +1231,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_keyboard_handler);
-    qemu_register_reset(ps2_kbd_reset, s);
     return s;
 }
 
@@ -1255,26 +1258,45 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_mouse_handler);
-    qemu_register_reset(ps2_mouse_reset, s);
     return s;
 }
 
+static void ps2_kbd_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
+
+    device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+}
+
 static const TypeInfo ps2_kbd_info = {
     .name          = TYPE_PS2_KBD_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2KbdState),
+    .class_init    = ps2_kbd_class_init
 };
 
+static void ps2_mouse_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
+
+    device_class_set_parent_reset(dc, ps2_mouse_reset,
+                                  &ps2dc->parent_reset);
+}
+
 static const TypeInfo ps2_mouse_info = {
     .name          = TYPE_PS2_MOUSE_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2MouseState),
+    .class_init    = ps2_mouse_class_init
 };
 
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = ps2_reset;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 0493b78812..4e8de912c6 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -35,6 +35,8 @@
 
 struct PS2DeviceClass {
     DeviceClass parent_class;
+
+    DeviceReset parent_reset;
 };
 
 /*
-- 
2.20.1


