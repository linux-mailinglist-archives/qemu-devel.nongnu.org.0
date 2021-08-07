Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CC3E354C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:13:47 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLD0-0003le-3O
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBW-000230-3Y
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:14 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:53086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBU-0003cI-20
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:13 -0400
Received: from fwd23.aul.t-online.de (fwd23.aul.t-online.de [172.20.26.128])
 by mailout02.t-online.de (Postfix) with SMTP id C74DB6C23;
 Sat,  7 Aug 2021 14:12:08 +0200 (CEST)
Received: from linpower.localnet
 (ZB79bcZdrhj8pwH1sDwWcj9Gpe+MYp1yEK6eh4iw8ntgLMm4O-tWKBF6uHaIjTfwfk@[79.208.26.7])
 by fwd23.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mCLBP-0RXMfI0; Sat, 7 Aug 2021 14:12:07 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2E16A20061B; Sat,  7 Aug 2021 14:12:02 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] ps2: migration support for command reply queue
Date: Sat,  7 Aug 2021 14:12:02 +0200
Message-Id: <20210807121202.6294-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ZB79bcZdrhj8pwH1sDwWcj9Gpe+MYp1yEK6eh4iw8ntgLMm4O-tWKBF6uHaIjTfwfk
X-TOI-EXPURGATEID: 150726::1628338327-00009563-8EFBA68A/0/0 CLEAN NORMAL
X-TOI-MSGID: 252e0015-42f8-4fbb-8df2-c8c3ded7677f
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Add migration support for the PS/2 keyboard command reply queue.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8c06fd7fb4..9376a8f4ce 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -80,6 +80,7 @@
  */
 #define PS2_BUFFER_SIZE     256
 #define PS2_QUEUE_SIZE      16  /* Queue size required by PS/2 protocol */
+#define PS2_QUEUE_HEADROOM  8   /* Queue size for keyboard command replies */
 
 /* Bits for 'modifiers' field in PS2KbdState */
 #define MOD_CTRL_L  (1 << 0)
@@ -985,17 +986,27 @@ static void ps2_common_reset(PS2State *s)
 static void ps2_common_post_load(PS2State *s)
 {
     PS2Queue *q = &s->queue;
+    int ccount = 0;
 
-    /* set the useful data buffer queue size <= PS2_QUEUE_SIZE */
-    if (q->count < 0) {
-        q->count = 0;
-    } else if (q->count > PS2_QUEUE_SIZE) {
-        q->count = PS2_QUEUE_SIZE;
+    /* limit the number of queued command replies to PS2_QUEUE_HEADROOM */
+    if (q->cwptr != -1) {
+        ccount = (q->cwptr - q->rptr) & (PS2_BUFFER_SIZE - 1);
+        if (ccount > PS2_QUEUE_HEADROOM) {
+            ccount = PS2_QUEUE_HEADROOM;
+        }
+    }
+
+    /* limit the scancode queue size to PS2_QUEUE_SIZE */
+    if (q->count < ccount) {
+        q->count = ccount;
+    } else if (q->count > ccount + PS2_QUEUE_SIZE) {
+        q->count = ccount + PS2_QUEUE_SIZE;
     }
 
-    /* sanitize rptr and recalculate wptr */
+    /* sanitize rptr and recalculate wptr and cwptr */
     q->rptr = q->rptr & (PS2_BUFFER_SIZE - 1);
     q->wptr = (q->rptr + q->count) & (PS2_BUFFER_SIZE - 1);
+    q->cwptr = ccount ? (q->rptr + ccount) & (PS2_BUFFER_SIZE - 1) : -1;
 }
 
 static void ps2_kbd_reset(void *opaque)
@@ -1086,6 +1097,22 @@ static const VMStateDescription vmstate_ps2_keyboard_need_high_bit = {
     }
 };
 
+static bool ps2_keyboard_cqueue_needed(void *opaque)
+{
+    PS2KbdState *s = opaque;
+
+    return s->common.queue.cwptr != -1; /* the queue is mostly empty */
+}
+
+static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
+    .name = "ps2kbd/command_reply_queue",
+    .needed = ps2_keyboard_cqueue_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT32(common.queue.cwptr, PS2KbdState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int ps2_kbd_post_load(void* opaque, int version_id)
 {
     PS2KbdState *s = (PS2KbdState*)opaque;
@@ -1114,6 +1141,7 @@ static const VMStateDescription vmstate_ps2_keyboard = {
     .subsections = (const VMStateDescription*[]) {
         &vmstate_ps2_keyboard_ledstate,
         &vmstate_ps2_keyboard_need_high_bit,
+        &vmstate_ps2_keyboard_cqueue,
         NULL
     }
 };
-- 
2.26.2


