Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C33E354D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:14:07 +0200 (CEST)
Received: from localhost ([::1]:48222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLDK-0004Eq-DC
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBc-0002B3-Uh
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:20 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:39078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBa-0003hX-PV
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:20 -0400
Received: from fwd10.aul.t-online.de (fwd10.aul.t-online.de [172.20.26.152])
 by mailout06.t-online.de (Postfix) with SMTP id 87A3D1AF78;
 Sat,  7 Aug 2021 14:12:10 +0200 (CEST)
Received: from linpower.localnet
 (bLtg++ZV8hRDPGUKNVe5Ge3pHiAKZD1f2k08Fgt7kkKTfDMxYIF+9Z5DxyetlFwgSR@[79.208.26.7])
 by fwd10.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mCLBN-0adu4W0; Sat, 7 Aug 2021 14:12:05 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2C734200617; Sat,  7 Aug 2021 14:12:02 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/3] ps2: use a separate keyboard command reply queue
Date: Sat,  7 Aug 2021 14:12:01 +0200
Message-Id: <20210807121202.6294-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bLtg++ZV8hRDPGUKNVe5Ge3pHiAKZD1f2k08Fgt7kkKTfDMxYIF+9Z5DxyetlFwgSR
X-TOI-EXPURGATEID: 150726::1628338325-00000BB9-45238EC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a3fdae0-9753-47e2-bff6-642d4be9c264
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A PS/2 keyboard has a separate command reply queue that is
independant of the key queue. This prevents that command replies
and keyboard input mix. Keyboard command replies take precedence
over queued keystrokes. A new keyboard command removes any
remaining command replies from the command reply queue.

Implement a separate keyboard command reply queue and clear the
command reply queue before command execution. This brings the
PS/2 keyboard emulation much closer to a real PS/2 keyboard.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/501
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/502
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 115 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 84 insertions(+), 31 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 23e7befee5..8c06fd7fb4 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -91,7 +91,7 @@
 
 typedef struct {
     uint8_t data[PS2_BUFFER_SIZE];
-    int rptr, wptr, count;
+    int rptr, wptr, cwptr, count;
 } PS2Queue;
 
 struct PS2State {
@@ -186,6 +186,7 @@ static void ps2_reset_queue(PS2State *s)
 
     q->rptr = 0;
     q->wptr = 0;
+    q->cwptr = -1;
     q->count = 0;
 }
 
@@ -198,7 +199,7 @@ void ps2_queue_noirq(PS2State *s, int b)
 {
     PS2Queue *q = &s->queue;
 
-    if (q->count == PS2_QUEUE_SIZE) {
+    if (q->count >= PS2_QUEUE_SIZE) {
         return;
     }
 
@@ -260,6 +261,63 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
     ps2_raise_irq(s);
 }
 
+static void ps2_cqueue_data(PS2Queue *q, int b)
+{
+    q->data[q->cwptr] = b;
+    if (++q->cwptr >= PS2_BUFFER_SIZE) {
+        q->cwptr = 0;
+    }
+    q->count++;
+}
+
+static void ps2_cqueue_1(PS2State *s, int b1)
+{
+    PS2Queue *q = &s->queue;
+
+    q->rptr = (q->rptr - 1) & (PS2_BUFFER_SIZE - 1);
+    q->cwptr = q->rptr;
+    ps2_cqueue_data(q, b1);
+    ps2_raise_irq(s);
+}
+
+static void ps2_cqueue_2(PS2State *s, int b1, int b2)
+{
+    PS2Queue *q = &s->queue;
+
+    q->rptr = (q->rptr - 2) & (PS2_BUFFER_SIZE - 1);
+    q->cwptr = q->rptr;
+    ps2_cqueue_data(q, b1);
+    ps2_cqueue_data(q, b2);
+    ps2_raise_irq(s);
+}
+
+static void ps2_cqueue_3(PS2State *s, int b1, int b2, int b3)
+{
+    PS2Queue *q = &s->queue;
+
+    q->rptr = (q->rptr - 3) & (PS2_BUFFER_SIZE - 1);
+    q->cwptr = q->rptr;
+    ps2_cqueue_data(q, b1);
+    ps2_cqueue_data(q, b2);
+    ps2_cqueue_data(q, b3);
+    ps2_raise_irq(s);
+}
+
+static void ps2_cqueue_reset(PS2State *s)
+{
+    PS2Queue *q = &s->queue;
+    int ccount;
+
+    if (q->cwptr == -1) {
+        return;
+    }
+
+    ccount = (q->cwptr - q->rptr) & (PS2_BUFFER_SIZE - 1);
+    q->count -= ccount;
+    q->rptr = q->cwptr;
+    q->cwptr = -1;
+}
+
 /* keycode is the untranslated scancode in the current scancode set. */
 static void ps2_put_keycode(void *opaque, int keycode)
 {
@@ -523,6 +581,10 @@ uint32_t ps2_read_data(PS2State *s)
             q->rptr = 0;
         }
         q->count--;
+        if (q->rptr == q->cwptr) {
+            /* command reply queue is empty */
+            q->cwptr = -1;
+        }
         /* reading deasserts IRQ */
         s->update_irq(s->update_arg, 0);
         /* reassert IRQs if data left */
@@ -554,92 +616,83 @@ void ps2_write_keyboard(void *opaque, int val)
     PS2KbdState *s = (PS2KbdState *)opaque;
 
     trace_ps2_write_keyboard(opaque, val);
+    ps2_cqueue_reset(&s->common);
     switch(s->common.write_cmd) {
     default:
     case -1:
         switch(val) {
         case 0x00:
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         case 0x05:
-            ps2_queue(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
             break;
         case KBD_CMD_GET_ID:
             /* We emulate a MF2 AT keyboard here */
-            if (s->translate)
-                ps2_queue_3(&s->common,
-                    KBD_REPLY_ACK,
-                    KBD_REPLY_ID,
-                    0x41);
-            else
-                ps2_queue_3(&s->common,
-                    KBD_REPLY_ACK,
-                    KBD_REPLY_ID,
-                    0x83);
+            ps2_cqueue_3(&s->common, KBD_REPLY_ACK, KBD_REPLY_ID,
+                s->translate ? 0x41 : 0x83);
             break;
         case KBD_CMD_ECHO:
-            ps2_queue(&s->common, KBD_CMD_ECHO);
+            ps2_cqueue_1(&s->common, KBD_CMD_ECHO);
             break;
         case KBD_CMD_ENABLE:
             s->scan_enabled = 1;
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         case KBD_CMD_SCANCODE:
         case KBD_CMD_SET_LEDS:
         case KBD_CMD_SET_RATE:
         case KBD_CMD_SET_MAKE_BREAK:
             s->common.write_cmd = val;
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET_DISABLE:
             ps2_reset_keyboard(s);
             s->scan_enabled = 0;
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET_ENABLE:
             ps2_reset_keyboard(s);
             s->scan_enabled = 1;
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         case KBD_CMD_RESET:
             ps2_reset_keyboard(s);
-            ps2_queue_2(&s->common,
+            ps2_cqueue_2(&s->common,
                 KBD_REPLY_ACK,
                 KBD_REPLY_POR);
             break;
         case KBD_CMD_SET_TYPEMATIC:
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
         default:
-            ps2_queue(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
             break;
         }
         break;
     case KBD_CMD_SET_MAKE_BREAK:
-        ps2_queue(&s->common, KBD_REPLY_ACK);
+        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
         s->common.write_cmd = -1;
         break;
     case KBD_CMD_SCANCODE:
         if (val == 0) {
-            if (s->common.queue.count <= PS2_QUEUE_SIZE - 2) {
-                ps2_queue(&s->common, KBD_REPLY_ACK);
-                ps2_put_keycode(s, s->scancode_set);
-            }
+            ps2_cqueue_2(&s->common, KBD_REPLY_ACK, s->translate ?
+                translate_table[s->scancode_set] : s->scancode_set);
         } else if (val >= 1 && val <= 3) {
             s->scancode_set = val;
-            ps2_queue(&s->common, KBD_REPLY_ACK);
+            ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
         } else {
-            ps2_queue(&s->common, KBD_REPLY_RESEND);
+            ps2_cqueue_1(&s->common, KBD_REPLY_RESEND);
         }
         s->common.write_cmd = -1;
         break;
     case KBD_CMD_SET_LEDS:
         ps2_set_ledstate(s, val);
-        ps2_queue(&s->common, KBD_REPLY_ACK);
+        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
         s->common.write_cmd = -1;
         break;
     case KBD_CMD_SET_RATE:
-        ps2_queue(&s->common, KBD_REPLY_ACK);
+        ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
         s->common.write_cmd = -1;
         break;
     }
-- 
2.26.2


