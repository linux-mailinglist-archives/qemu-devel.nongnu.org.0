Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432C559AA7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:50:26 +0200 (CEST)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jhZ-00083r-39
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ4-0007A0-SY; Fri, 24 Jun 2022 09:41:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ0-00054B-98; Fri, 24 Jun 2022 09:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mvAJZ4P5Q1iTQxoa3SmGf3mWyoKSkskxl1Q/JBJZB9I=; b=hOGBR4QzebBIemSFl4nKcIyouB
 0MKrveDmekyIHhe8+paYJVkgGyqVBWmooPFFMcALszRNn0evk+aZe2K3Oh81M7N0y91PoCK8JdK8T
 AUqUHfkFIFNNFsOG3X+aKfYJzkTaOzY7eWVyGs0UwVmdegXza3/OfNNQMb6+5+V+YvRXOIdbRTfDm
 VxOKhMOEuHuy089gozV1zPY2s8g0lAaEpj1Pd/DeIkRxh1KPiiEaUk7NUpte+suqJ4Uf/eiJmwEkc
 Zt92OXc6eJyYps4LFYseVmfDbqB8QG5vdfKFZetzLlgst97I3rLAulqd/r9EGKNIp46UO2ONObdZB
 +wZ0dR5rSp3faMz/vn186ae8fyZObyBBT5hXRCOJzhuv6n2RzT8z2BoDKA1c7zMqoVC4hXDmhrMNj
 g5+07IvpxjdY0JMa5nNeVyFAKXSFr7foD6L+5McY+Bl6p+gvqFeSVRlvxYGZIXj89GH8Xf97XfT13
 k11MR2BP5ZGXO+TS5Lmibu7D61kE7XjQNakfH/vSVPE6qaZshwjwD6z/SZNeQCZ4L+oN3YHPepFPu
 Gw+O2IJ80plxb0xQIjNToB3W9fWI99CVo69mHXyG9Pj8MT8bwKeiB5DEPP3EMiL4+5VeYtli6VA7S
 8LbvjoefoHuA7QYIzzJHf5NWkzOws4ToYkx2tuIXc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXg-00037t-OI; Fri, 24 Jun 2022 14:40:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:18 +0100
Message-Id: <20220624134109.881989-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/54] ps2: QOMify PS2KbdState
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

Make PS2KbdState into a new PS2_KBD_DEVICE QOM type which inherits from the
abstract PS2_DEVICE type.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 104 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 39 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 514e55cbb6..14eb777c3f 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -31,6 +31,7 @@
 #include "ui/input.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "qapi/error.h"
 
 #include "trace.h"
 
@@ -108,15 +109,19 @@ struct PS2State {
 #define TYPE_PS2_DEVICE "ps2-device"
 OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
 
-typedef struct {
-    PS2State common;
+struct PS2KbdState {
+    PS2State parent_obj;
+
     int scan_enabled;
     int translate;
     int scancode_set; /* 1=XT, 2=AT, 3=PS/2 */
     int ledstate;
     bool need_high_bit;
     unsigned int modifiers; /* bitmask of MOD_* constants above */
-} PS2KbdState;
+};
+
+#define TYPE_PS2_KBD_DEVICE "ps2-kbd"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
 
 typedef struct {
     PS2State common;
@@ -330,6 +335,7 @@ static void ps2_cqueue_reset(PS2State *s)
 static void ps2_put_keycode(void *opaque, int keycode)
 {
     PS2KbdState *s = opaque;
+    PS2State *ps = PS2_DEVICE(s);
 
     trace_ps2_put_keycode(opaque, keycode);
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
@@ -338,13 +344,13 @@ static void ps2_put_keycode(void *opaque, int keycode)
         if (keycode == 0xf0) {
             s->need_high_bit = true;
         } else if (s->need_high_bit) {
-            ps2_queue(&s->common, translate_table[keycode] | 0x80);
+            ps2_queue(ps, translate_table[keycode] | 0x80);
             s->need_high_bit = false;
         } else {
-            ps2_queue(&s->common, translate_table[keycode]);
+            ps2_queue(ps, translate_table[keycode]);
         }
     } else {
-        ps2_queue(&s->common, keycode);
+        ps2_queue(ps, keycode);
     }
 }
 
@@ -617,96 +623,99 @@ static void ps2_set_ledstate(PS2KbdState *s, int ledstate)
 
 static void ps2_reset_keyboard(PS2KbdState *s)
 {
+    PS2State *ps2 = PS2_DEVICE(s);
+
     trace_ps2_reset_keyboard(s);
     s->scan_enabled = 1;
     s->scancode_set = 2;
-    ps2_reset_queue(&s->common);
+    ps2_reset_queue(ps2);
     ps2_set_ledstate(s, 0);
 }
 
 void ps2_write_keyboard(void *opaque, int val)
 {
     PS2KbdState *s = (PS2KbdState *)opaque;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     trace_ps2_write_keyboard(opaque, val);
-    ps2_cqueue_reset(&s->common);
-    switch (s->common.write_cmd) {
+    ps2_cqueue_reset(ps2);
+    switch (ps2->write_cmd) {
     default:
     case -1:
         switch (val) {
         case 0x00:
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         case 0x05:
-            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(ps2, KBD_REPLY_RESEND);
             break;
         case KBD_CMD_GET_ID:
             /* We emulate a MF2 AT keyboard here */
-            ps2_cqueue_3(&s->common, KBD_REPLY_ACK, KBD_REPLY_ID,
+            ps2_cqueue_3(ps2, KBD_REPLY_ACK, KBD_REPLY_ID,
                          s->translate ? 0x41 : 0x83);
             break;
         case KBD_CMD_ECHO:
-            ps2_cqueue_1(&s->common, KBD_CMD_ECHO);
+            ps2_cqueue_1(ps2, KBD_CMD_ECHO);
             break;
         case KBD_CMD_ENABLE:
             s->scan_enabled = 1;
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         case KBD_CMD_SCANCODE:
         case KBD_CMD_SET_LEDS:
         case KBD_CMD_SET_RATE:
         case KBD_CMD_SET_MAKE_BREAK:
-            s->common.write_cmd = val;
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2->write_cmd = val;
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET_DISABLE:
             ps2_reset_keyboard(s);
             s->scan_enabled = 0;
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET_ENABLE:
             ps2_reset_keyboard(s);
             s->scan_enabled = 1;
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET:
             ps2_reset_keyboard(s);
-            ps2_cqueue_2(&s->common,
+            ps2_cqueue_2(ps2,
                          KBD_REPLY_ACK,
                          KBD_REPLY_POR);
             break;
         case KBD_CMD_SET_TYPEMATIC:
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
             break;
         default:
-            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(ps2, KBD_REPLY_RESEND);
             break;
         }
         break;
     case KBD_CMD_SET_MAKE_BREAK:
-        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
-        s->common.write_cmd = -1;
+        ps2_cqueue_1(ps2, KBD_REPLY_ACK);
+        ps2->write_cmd = -1;
         break;
     case KBD_CMD_SCANCODE:
         if (val == 0) {
-            ps2_cqueue_2(&s->common, KBD_REPLY_ACK, s->translate ?
+            ps2_cqueue_2(ps2, KBD_REPLY_ACK, s->translate ?
                 translate_table[s->scancode_set] : s->scancode_set);
         } else if (val >= 1 && val <= 3) {
             s->scancode_set = val;
-            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(ps2, KBD_REPLY_ACK);
         } else {
-            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(ps2, KBD_REPLY_RESEND);
         }
-        s->common.write_cmd = -1;
+        ps2->write_cmd = -1;
         break;
     case KBD_CMD_SET_LEDS:
         ps2_set_ledstate(s, val);
-        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
-        s->common.write_cmd = -1;
+        ps2_cqueue_1(ps2, KBD_REPLY_ACK);
+        ps2->write_cmd = -1;
         break;
     case KBD_CMD_SET_RATE:
-        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
-        s->common.write_cmd = -1;
+        ps2_cqueue_1(ps2, KBD_REPLY_ACK);
+        ps2->write_cmd = -1;
         break;
     }
 }
@@ -1075,9 +1084,10 @@ static void ps2_common_post_load(PS2State *s)
 static void ps2_kbd_reset(void *opaque)
 {
     PS2KbdState *s = (PS2KbdState *) opaque;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     trace_ps2_kbd_reset(opaque);
-    ps2_common_reset(&s->common);
+    ps2_common_reset(ps2);
     s->scan_enabled = 1;
     s->translate = 0;
     s->scancode_set = 2;
@@ -1164,15 +1174,16 @@ static const VMStateDescription vmstate_ps2_keyboard_need_high_bit = {
 static bool ps2_keyboard_cqueue_needed(void *opaque)
 {
     PS2KbdState *s = opaque;
+    PS2State *ps2 = PS2_DEVICE(s);
 
-    return s->common.queue.cwptr != -1; /* the queue is mostly empty */
+    return ps2->queue.cwptr != -1; /* the queue is mostly empty */
 }
 
 static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
     .name = "ps2kbd/command_reply_queue",
     .needed = ps2_keyboard_cqueue_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_INT32(common.queue.cwptr, PS2KbdState),
+        VMSTATE_INT32(parent_obj.queue.cwptr, PS2KbdState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1180,7 +1191,7 @@ static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
 static int ps2_kbd_post_load(void *opaque, int version_id)
 {
     PS2KbdState *s = (PS2KbdState *)opaque;
-    PS2State *ps2 = &s->common;
+    PS2State *ps2 = PS2_DEVICE(s);
 
     if (version_id == 2) {
         s->scancode_set = 2;
@@ -1197,7 +1208,8 @@ static const VMStateDescription vmstate_ps2_keyboard = {
     .minimum_version_id = 2,
     .post_load = ps2_kbd_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(common, PS2KbdState, 0, vmstate_ps2_common, PS2State),
+        VMSTATE_STRUCT(parent_obj, PS2KbdState, 0, vmstate_ps2_common,
+                       PS2State),
         VMSTATE_INT32(scan_enabled, PS2KbdState),
         VMSTATE_INT32(translate, PS2KbdState),
         VMSTATE_INT32_V(scancode_set, PS2KbdState, 3),
@@ -1250,11 +1262,18 @@ static QemuInputHandler ps2_keyboard_handler = {
 
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
-    PS2KbdState *s = g_new0(PS2KbdState, 1);
+    DeviceState *dev;
+    PS2KbdState *s;
+    PS2State *ps2;
+
+    dev = qdev_new(TYPE_PS2_KBD_DEVICE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = PS2_KBD_DEVICE(dev);
+    ps2 = PS2_DEVICE(s);
 
     trace_ps2_kbd_init(s);
-    s->common.update_irq = update_irq;
-    s->common.update_arg = update_arg;
+    ps2->update_irq = update_irq;
+    ps2->update_arg = update_arg;
     s->scancode_set = 2;
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
@@ -1284,6 +1303,12 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     return s;
 }
 
+static const TypeInfo ps2_kbd_info = {
+    .name          = TYPE_PS2_KBD_DEVICE,
+    .parent        = TYPE_PS2_DEVICE,
+    .instance_size = sizeof(PS2KbdState),
+};
+
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1302,6 +1327,7 @@ static const TypeInfo ps2_info = {
 static void ps2_register_types(void)
 {
     type_register_static(&ps2_info);
+    type_register_static(&ps2_kbd_info);
 }
 
 type_init(ps2_register_types)
-- 
2.30.2


