Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503255B341
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:49:58 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WOT-0004Ny-Bd
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKg-0001OO-UG
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKf-0008LJ-0Q
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xM/ZsR3vL/mcygkoe1HK/kU0rflmUD5nWXFZvv+ZGZA=; b=BeXqJOSoTAKA+rNJUfiy707k7Q
 TBaoJ3lF8kdnLFttHO1OCA0xs93169J23jEgqLTvk86s/5U9bkH0lH1pfpTsR93RgfyS3xPLlD5+d
 eCW8imRQY6w9wnAdfzMYHJ0vYvvdCDtnvknPbteW1pAikN+DscbOVs0aaAQTjNDgEiqS76X6bHdJk
 SHHDXl+tykKwbU0IiRZFqofntVvnjA4KGbj4laj7t10xi+BKbps3+FThqid1IdErWXGDdPsjJOw8M
 X0gcjOoJ0t9XMB1exsxkxA4oWtrDBP2chpSqAjSBhu4KByz/l/X8EWaNGiKGVUxY+lnq+Ndup12JO
 7BPHDK4y/s5BE5yhK45Z8hIc+RKeV92EY83ORwrd2w5XwCWTRwf8FQWSel4z2wuhas9ATECkWQO4o
 8UPELg79ZRN0+4vBNqtsW/TI9QxsWzIr5cFSrwTuctUHZYTsmpiOTqg9+0bPf7xT87okyW1kLgv7O
 QEj2iu/MSx01eOBffOWWN7rru8PtTA6ZTQVovWE8rQK8u3xErUb3ZgtjEOM2TQTiMebW+5XUYzy79
 uXZG+ldoew9q3mJzzoZZN0bPA4S0iGElQtB7HLZA96o5bcqkjS90HRdLoLM68QKKiBDWUOGF1vXN3
 kyP5qmvEcGKFHi0kjDY1gjtX5GQbezrIsYD4VIsew=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJQ-0007KY-SN; Sun, 26 Jun 2022 18:44:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:40 +0100
Message-Id: <20220626174531.969187-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/55] ps2: QOMify PS2MouseState
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

Make PS2MouseState into a new PS2_MOUSE_DEVICE QOM type which inherits from the
abstract PS2_DEVICE type.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-5-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 98 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 38 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 14eb777c3f..ee7c36d4f2 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -123,8 +123,9 @@ struct PS2KbdState {
 #define TYPE_PS2_KBD_DEVICE "ps2-kbd"
 OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
 
-typedef struct {
-    PS2State common;
+struct PS2MouseState {
+    PS2State parent_obj;
+
     uint8_t mouse_status;
     uint8_t mouse_resolution;
     uint8_t mouse_sample_rate;
@@ -136,7 +137,10 @@ typedef struct {
     int mouse_dz;
     int mouse_dw;
     uint8_t mouse_buttons;
-} PS2MouseState;
+};
+
+#define TYPE_PS2_MOUSE_DEVICE "ps2-mouse"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 static uint8_t translate_table[256] = {
     0xff, 0x43, 0x41, 0x3f, 0x3d, 0x3b, 0x3c, 0x58,
@@ -735,12 +739,13 @@ void ps2_keyboard_set_translation(void *opaque, int mode)
 
 static int ps2_mouse_send_packet(PS2MouseState *s)
 {
+    PS2State *ps2 = PS2_DEVICE(s);
     /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
     const int needed = s->mouse_type ? 4 : 3;
     unsigned int b;
     int dx1, dy1, dz1, dw1;
 
-    if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
+    if (PS2_QUEUE_SIZE - ps2->queue.count < needed) {
         return 0;
     }
 
@@ -760,9 +765,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
         dy1 = -127;
     }
     b = 0x08 | ((dx1 < 0) << 4) | ((dy1 < 0) << 5) | (s->mouse_buttons & 0x07);
-    ps2_queue_noirq(&s->common, b);
-    ps2_queue_noirq(&s->common, dx1 & 0xff);
-    ps2_queue_noirq(&s->common, dy1 & 0xff);
+    ps2_queue_noirq(ps2, b);
+    ps2_queue_noirq(ps2, dx1 & 0xff);
+    ps2_queue_noirq(ps2, dy1 & 0xff);
     /* extra byte for IMPS/2 or IMEX */
     switch (s->mouse_type) {
     default:
@@ -776,7 +781,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
         } else if (dz1 < -127) {
             dz1 = -127;
         }
-        ps2_queue_noirq(&s->common, dz1 & 0xff);
+        ps2_queue_noirq(ps2, dz1 & 0xff);
         s->mouse_dz -= dz1;
         s->mouse_dw = 0;
         break;
@@ -812,11 +817,11 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
             b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
             s->mouse_dz -= dz1;
         }
-        ps2_queue_noirq(&s->common, b);
+        ps2_queue_noirq(ps2, b);
         break;
     }
 
-    ps2_raise_irq(&s->common);
+    ps2_raise_irq(ps2);
 
     trace_ps2_mouse_send_packet(s, dx1, dy1, dz1, b);
     /* update deltas */
@@ -918,85 +923,86 @@ void ps2_mouse_fake_event(void *opaque)
 void ps2_write_mouse(void *opaque, int val)
 {
     PS2MouseState *s = (PS2MouseState *)opaque;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     trace_ps2_write_mouse(opaque, val);
-    switch (s->common.write_cmd) {
+    switch (ps2->write_cmd) {
     default:
     case -1:
         /* mouse command */
         if (s->mouse_wrap) {
             if (val == AUX_RESET_WRAP) {
                 s->mouse_wrap = 0;
-                ps2_queue(&s->common, AUX_ACK);
+                ps2_queue(ps2, AUX_ACK);
                 return;
             } else if (val != AUX_RESET) {
-                ps2_queue(&s->common, val);
+                ps2_queue(ps2, val);
                 return;
             }
         }
         switch (val) {
         case AUX_SET_SCALE11:
             s->mouse_status &= ~MOUSE_STATUS_SCALE21;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_SET_SCALE21:
             s->mouse_status |= MOUSE_STATUS_SCALE21;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_SET_STREAM:
             s->mouse_status &= ~MOUSE_STATUS_REMOTE;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_SET_WRAP:
             s->mouse_wrap = 1;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_SET_REMOTE:
             s->mouse_status |= MOUSE_STATUS_REMOTE;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_GET_TYPE:
-            ps2_queue_2(&s->common,
+            ps2_queue_2(ps2,
                 AUX_ACK,
                 s->mouse_type);
             break;
         case AUX_SET_RES:
         case AUX_SET_SAMPLE:
-            s->common.write_cmd = val;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2->write_cmd = val;
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_GET_SCALE:
-            ps2_queue_4(&s->common,
+            ps2_queue_4(ps2,
                 AUX_ACK,
                 s->mouse_status,
                 s->mouse_resolution,
                 s->mouse_sample_rate);
             break;
         case AUX_POLL:
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             ps2_mouse_send_packet(s);
             break;
         case AUX_ENABLE_DEV:
             s->mouse_status |= MOUSE_STATUS_ENABLED;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_DISABLE_DEV:
             s->mouse_status &= ~MOUSE_STATUS_ENABLED;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_SET_DEFAULT:
             s->mouse_sample_rate = 100;
             s->mouse_resolution = 2;
             s->mouse_status = 0;
-            ps2_queue(&s->common, AUX_ACK);
+            ps2_queue(ps2, AUX_ACK);
             break;
         case AUX_RESET:
             s->mouse_sample_rate = 100;
             s->mouse_resolution = 2;
             s->mouse_status = 0;
             s->mouse_type = 0;
-            ps2_reset_queue(&s->common);
-            ps2_queue_3(&s->common,
+            ps2_reset_queue(ps2);
+            ps2_queue_3(ps2,
                 AUX_ACK,
                 0xaa,
                 s->mouse_type);
@@ -1037,13 +1043,13 @@ void ps2_write_mouse(void *opaque, int val)
             s->mouse_detect_state = 0;
             break;
         }
-        ps2_queue(&s->common, AUX_ACK);
-        s->common.write_cmd = -1;
+        ps2_queue(ps2, AUX_ACK);
+        ps2->write_cmd = -1;
         break;
     case AUX_SET_RES:
         s->mouse_resolution = val;
-        ps2_queue(&s->common, AUX_ACK);
-        s->common.write_cmd = -1;
+        ps2_queue(ps2, AUX_ACK);
+        ps2->write_cmd = -1;
         break;
     }
 }
@@ -1097,9 +1103,10 @@ static void ps2_kbd_reset(void *opaque)
 static void ps2_mouse_reset(void *opaque)
 {
     PS2MouseState *s = (PS2MouseState *) opaque;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     trace_ps2_mouse_reset(opaque);
-    ps2_common_reset(&s->common);
+    ps2_common_reset(ps2);
     s->mouse_status = 0;
     s->mouse_resolution = 0;
     s->mouse_sample_rate = 0;
@@ -1226,7 +1233,7 @@ static const VMStateDescription vmstate_ps2_keyboard = {
 static int ps2_mouse_post_load(void *opaque, int version_id)
 {
     PS2MouseState *s = (PS2MouseState *)opaque;
-    PS2State *ps2 = &s->common;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     ps2_common_post_load(ps2);
 
@@ -1239,7 +1246,8 @@ static const VMStateDescription vmstate_ps2_mouse = {
     .minimum_version_id = 2,
     .post_load = ps2_mouse_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(common, PS2MouseState, 0, vmstate_ps2_common, PS2State),
+        VMSTATE_STRUCT(parent_obj, PS2MouseState, 0, vmstate_ps2_common,
+                       PS2State),
         VMSTATE_UINT8(mouse_status, PS2MouseState),
         VMSTATE_UINT8(mouse_resolution, PS2MouseState),
         VMSTATE_UINT8(mouse_sample_rate, PS2MouseState),
@@ -1291,11 +1299,18 @@ static QemuInputHandler ps2_mouse_handler = {
 
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
-    PS2MouseState *s = g_new0(PS2MouseState, 1);
+    DeviceState *dev;
+    PS2MouseState *s;
+    PS2State *ps2;
+
+    dev = qdev_new(TYPE_PS2_MOUSE_DEVICE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = PS2_MOUSE_DEVICE(dev);
+    ps2 = PS2_DEVICE(s);
 
     trace_ps2_mouse_init(s);
-    s->common.update_irq = update_irq;
-    s->common.update_arg = update_arg;
+    ps2->update_irq = update_irq;
+    ps2->update_arg = update_arg;
     vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_mouse_handler);
@@ -1309,6 +1324,12 @@ static const TypeInfo ps2_kbd_info = {
     .instance_size = sizeof(PS2KbdState),
 };
 
+static const TypeInfo ps2_mouse_info = {
+    .name          = TYPE_PS2_MOUSE_DEVICE,
+    .parent        = TYPE_PS2_DEVICE,
+    .instance_size = sizeof(PS2MouseState),
+};
+
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1328,6 +1349,7 @@ static void ps2_register_types(void)
 {
     type_register_static(&ps2_info);
     type_register_static(&ps2_kbd_info);
+    type_register_static(&ps2_mouse_info);
 }
 
 type_init(ps2_register_types)
-- 
2.30.2


