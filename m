Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9B406A25
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:28:57 +0200 (CEST)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdmC-00058h-PE
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgh-0007lk-Rt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdge-0005xF-TQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631269392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z8y1TjvdEG2Wx21WRgDWgLRpXfPBMrRQpf0FnstdbU=;
 b=W/ocz5lZG0x2p1t5LgQmxgMrEAAa9QNXuGE4hUXlB35Gd3CnaFQlUBSwiaxplGoMW5ix7O
 b3OOvllrIzCwiCQOqW8PBDEzrAnWZ1AQUIKAjyKvXLl1nzPTjkCwYeEQ1w9TSZyVmMbq1S
 K3qqfjXPuMbVAMgUWr5SA/htpKDWRJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-98CL85L9MQ2uYQX22FUPAQ-1; Fri, 10 Sep 2021 06:23:08 -0400
X-MC-Unique: 98CL85L9MQ2uYQX22FUPAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2FFF80006E;
 Fri, 10 Sep 2021 10:23:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9EB118FD2;
 Fri, 10 Sep 2021 10:23:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DADBA180038E; Fri, 10 Sep 2021 12:23:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] ps2: use the whole ps2 buffer but keep queue size
Date: Fri, 10 Sep 2021 12:22:58 +0200
Message-Id: <20210910102300.3589982-2-kraxel@redhat.com>
In-Reply-To: <20210910102300.3589982-1-kraxel@redhat.com>
References: <20210910102300.3589982-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Extend the used ps2 buffer size to the available buffer size but
keep the maximum ps2 queue size.

The next patch needs a few bytes of the larger buffer size.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210810133258.8231-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 69 +++++++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 49 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8dd482c1f65b..23e7befee5bb 100644
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
+        q->count = PS2_QUEUE_SIZE;
     }
 
-    /* move the queue elements to the start of data array */
-    for (i = 0; i < size; i++) {
-        if (q->rptr < 0 || q->rptr >= sizeof(q->data)) {
-            q->rptr = 0;
-        }
-        tmp_data[i] = q->data[q->rptr++];
-    }
-    memcpy(q->data, tmp_data, size);
-
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
2.31.1


