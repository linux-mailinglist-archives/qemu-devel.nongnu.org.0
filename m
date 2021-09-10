Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097D406A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:24:58 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdiL-0001Je-8d
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgi-0007ll-8f
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOdgg-0005z1-PB
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631269394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0i2rNPu+9dBRTAtS7pIfzLsNlXiswpb9xYy/+2w9SU=;
 b=M4mYq40YBIyvJ6V4vPT6q8Myg/QyMkd123IXDnY1jjNsP5Q87lE4Yrzx4w6Dw7WAcmDRYB
 7TWBlQuuC5UBYiB3dvR2baPW/N3eLsvFqEVSE80o/tlGWsnE8VBzPUya8rQF1cvHbi1gUU
 jlUSvj+NA1YDd9aJV1Ne98BcVtoY78U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-1XCCg3O8NpOBQ6aXSOadMg-1; Fri, 10 Sep 2021 06:23:12 -0400
X-MC-Unique: 1XCCg3O8NpOBQ6aXSOadMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C631084680;
 Fri, 10 Sep 2021 10:23:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDC118FD2;
 Fri, 10 Sep 2021 10:23:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F15A918003B6; Fri, 10 Sep 2021 12:23:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] ps2: migration support for command reply queue
Date: Fri, 10 Sep 2021 12:23:00 +0200
Message-Id: <20210910102300.3589982-4-kraxel@redhat.com>
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

Add migration support for the PS/2 keyboard command reply queue.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210810133258.8231-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8c06fd7fb428..9376a8f4ce53 100644
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
     }
 
-    /* sanitize rptr and recalculate wptr */
+    /* limit the scancode queue size to PS2_QUEUE_SIZE */
+    if (q->count < ccount) {
+        q->count = ccount;
+    } else if (q->count > ccount + PS2_QUEUE_SIZE) {
+        q->count = ccount + PS2_QUEUE_SIZE;
+    }
+
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
2.31.1


