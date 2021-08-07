Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA673E354E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:14:24 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLDb-0004Vo-SI
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBd-0002CI-Hy
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:21 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:39074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCLBb-0003hC-Bx
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:12:21 -0400
Received: from fwd10.aul.t-online.de (fwd10.aul.t-online.de [172.20.26.152])
 by mailout06.t-online.de (Postfix) with SMTP id 6CCBA1AF77;
 Sat,  7 Aug 2021 14:12:10 +0200 (CEST)
Received: from linpower.localnet
 (XH7Ry+Zc8h8PJvfRmF65zSo89VaSXcq8ITJatkseOGVIHugy07irbrMOwDJ4unggXV@[79.208.26.7])
 by fwd10.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mCLBK-0XZ4880; Sat, 7 Aug 2021 14:12:02 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2A97D2000A1; Sat,  7 Aug 2021 14:12:02 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] ps2: use the whole ps2 buffer but keep queue size
Date: Sat,  7 Aug 2021 14:12:00 +0200
Message-Id: <20210807121202.6294-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XH7Ry+Zc8h8PJvfRmF65zSo89VaSXcq8ITJatkseOGVIHugy07irbrMOwDJ4unggXV
X-TOI-EXPURGATEID: 150726::1628338322-00000BB9-372AF816/0/0 CLEAN NORMAL
X-TOI-MSGID: 812d4948-d633-4b20-9339-7e34a5604a16
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

Extend the used ps2 buffer size to the available buffer size but
keep the maximum ps2 queue size.

The next patch needs a few bytes of the larger buffer size.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 69 +++++++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 49 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8dd482c1f6..23e7befee5 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -74,7 +74,12 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-#define PS2_QUEUE_SIZE 16  /* Buffer size required by PS/2 protocol */
+/*
+ * PS/2 buffer size. Keep 256 bytes for compatibility with
+ * older QEMU versions.
+ */
+#define PS2_BUFFER_SIZE     256
+#define PS2_QUEUE_SIZE      16  /* Queue size required by PS/2 protocol */
 
 /* Bits for 'modifiers' field in PS2KbdState */
 #define MOD_CTRL_L  (1 << 0)
@@ -85,9 +90,7 @@
 #define MOD_ALT_R   (1 << 5)
 
 typedef struct {
-    /* Keep the data array 256 bytes long, which compatibility
-     with older qemu versions. */
-    uint8_t data[256];
+    uint8_t data[PS2_BUFFER_SIZE];
     int rptr, wptr, count;
 } PS2Queue;
 
@@ -200,8 +203,9 @@ void ps2_queue_noirq(PS2State *s, int b)
     }
 
     q->data[q->wptr] = b;
-    if (++q->wptr == PS2_QUEUE_SIZE)
+    if (++q->wptr == PS2_BUFFER_SIZE) {
         q->wptr = 0;
+    }
     q->count++;
 }
 
@@ -509,13 +513,15 @@ uint32_t ps2_read_data(PS2State *s)
            (needed for EMM386) */
         /* XXX: need a timer to do things correctly */
         index = q->rptr - 1;
-        if (index < 0)
-            index = PS2_QUEUE_SIZE - 1;
+        if (index < 0) {
+            index = PS2_BUFFER_SIZE - 1;
+        }
         val = q->data[index];
     } else {
         val = q->data[q->rptr];
-        if (++q->rptr == PS2_QUEUE_SIZE)
+        if (++q->rptr == PS2_BUFFER_SIZE) {
             q->rptr = 0;
+        }
         q->count--;
         /* reading deasserts IRQ */
         s->update_irq(s->update_arg, 0);
@@ -926,30 +932,17 @@ static void ps2_common_reset(PS2State *s)
 static void ps2_common_post_load(PS2State *s)
 {
     PS2Queue *q = &s->queue;
-    uint8_t i, size;
-    uint8_t tmp_data[PS2_QUEUE_SIZE];
 
-    /* set the useful data buffer queue size, < PS2_QUEUE_SIZE */
-    size = q->count;
+    /* set the useful data buffer queue size <= PS2_QUEUE_SIZE */
     if (q->count < 0) {
-        size = 0;
+        q->count = 0;
     } else if (q->count > PS2_QUEUE_SIZE) {
-        size = PS2_QUEUE_SIZE;
-    }
-
-    /* move the queue elements to the start of data array */
-    for (i = 0; i < size; i++) {
-        if (q->rptr < 0 || q->rptr >= sizeof(q->data)) {
-            q->rptr = 0;
-        }
-        tmp_data[i] = q->data[q->rptr++];
+        q->count = PS2_QUEUE_SIZE;
     }
-    memcpy(q->data, tmp_data, size);
 
-    /* reset rptr/wptr/count */
-    q->rptr = 0;
-    q->wptr = (size == PS2_QUEUE_SIZE) ? 0 : size;
-    q->count = size;
+    /* sanitize rptr and recalculate wptr */
+    q->rptr = q->rptr & (PS2_BUFFER_SIZE - 1);
+    q->wptr = (q->rptr + q->count) & (PS2_BUFFER_SIZE - 1);
 }
 
 static void ps2_kbd_reset(void *opaque)
@@ -1053,22 +1046,11 @@ static int ps2_kbd_post_load(void* opaque, int version_id)
     return 0;
 }
 
-static int ps2_kbd_pre_save(void *opaque)
-{
-    PS2KbdState *s = (PS2KbdState *)opaque;
-    PS2State *ps2 = &s->common;
-
-    ps2_common_post_load(ps2);
-
-    return 0;
-}
-
 static const VMStateDescription vmstate_ps2_keyboard = {
     .name = "ps2kbd",
     .version_id = 3,
     .minimum_version_id = 2,
     .post_load = ps2_kbd_post_load,
-    .pre_save = ps2_kbd_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(common, PS2KbdState, 0, vmstate_ps2_common, PS2State),
         VMSTATE_INT32(scan_enabled, PS2KbdState),
@@ -1093,22 +1075,11 @@ static int ps2_mouse_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static int ps2_mouse_pre_save(void *opaque)
-{
-    PS2MouseState *s = (PS2MouseState *)opaque;
-    PS2State *ps2 = &s->common;
-
-    ps2_common_post_load(ps2);
-
-    return 0;
-}
-
 static const VMStateDescription vmstate_ps2_mouse = {
     .name = "ps2mouse",
     .version_id = 2,
     .minimum_version_id = 2,
     .post_load = ps2_mouse_post_load,
-    .pre_save = ps2_mouse_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(common, PS2MouseState, 0, vmstate_ps2_common, PS2State),
         VMSTATE_UINT8(mouse_status, PS2MouseState),
-- 
2.26.2


