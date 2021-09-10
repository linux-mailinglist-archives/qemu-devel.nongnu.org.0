Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DB406A1F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:25:42 +0200 (CEST)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdiy-0001aq-FT
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgl-0007pj-6N
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgj-000610-9m
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631269396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Vn96GG6yxevAOcXv9267enk6jzF62vBtTocwyjUDcU=;
 b=EERG5U7Kw72g9n7fiMHJZnw/RMk32qWjedJJlWcIUaPbShdlG110j1U2Qp0+tAETwlO1Sl
 kSX3zGIuWLWFNwZpbwbwja+n+asPT9UdxsusJoUbJ3OB9/e0N2Nk4PAK8yPUP5hgqIBTsP
 FIq2VHDdsbyddNughvZA8psG3vplsTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-VU4ZgfpdPiKIOGjNRmeJCg-1; Fri, 10 Sep 2021 06:23:15 -0400
X-MC-Unique: VU4ZgfpdPiKIOGjNRmeJCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3373A80196C;
 Fri, 10 Sep 2021 10:23:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D692460CD1;
 Fri, 10 Sep 2021 10:23:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E6B2C18003AA; Fri, 10 Sep 2021 12:23:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] ps2: use a separate keyboard command reply queue
Date: Fri, 10 Sep 2021 12:22:59 +0200
Message-Id: <20210910102300.3589982-3-kraxel@redhat.com>
In-Reply-To: <20210910102300.3589982-1-kraxel@redhat.com>
References: <20210910102300.3589982-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

A PS/2 keyboard has a separate command reply queue that is
independent of the key queue. This prevents that command replies
and keyboard input mix. Keyboard command replies take precedence
over queued keystrokes. A new keyboard command removes any
remaining command replies from the command reply queue.

Implement a separate keyboard command reply queue and clear the
command reply queue before command execution. This brings the
PS/2 keyboard emulation much closer to a real PS/2 keyboard.

The command reply queue is located in a few free bytes directly
in front of the scancode queue. Because the scancode queue has
a maximum length of 16 bytes there are 240 bytes available for
the command reply queue. At the moment only a maximum of 3 bytes
are required. For compatibility reasons rptr, wptr and count kept
their function. rptr is the start, wptr is the end and count is
the length of the entire keyboard queue. The new variable cwptr
is the end of the command reply queue or -1 if the queue is
empty. To write to the command reply queue, rptr is moved
backward by the number of required bytes and the command replies
are written to the buffer starting at the new rptr position.
After writing, cwptr is at the old rptr position. Copying cwptr
to rptr clears the command reply queue. The command reply queue
can't overflow because each new keyboard command clears the
command reply queue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/501
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/502
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210810133258.8231-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 115 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 84 insertions(+), 31 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 23e7befee5bb..8c06fd7fb428 100644
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
2.31.1


