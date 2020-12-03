Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28452CDC8C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:38:51 +0100 (CET)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksZ8-0007GD-Nw
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKO-0006oR-5z
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKL-0003Tk-Tq
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S900SpiJiWpgSYHQX3D3TlzJJk8QiYP6bMg+zIoxy5I=;
 b=T9W5Si8knfOD88OoptGBeKuNLSKvhSdBMBUUMXN4wwB3IKg+ZhZxJJjVVnzDhzpr2HkiGr
 82MXktjnsDnIMgVop54Zkt5isuAgY9gfieQC8EcNWt4Snz9qrPUqY4NriuWtaet3n1DlUv
 RJDronDhClsZVnSdsBpSve0jWzxsG7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ie_a5zZwPWCPvWIwvBx_3Q-1; Thu, 03 Dec 2020 12:23:28 -0500
X-MC-Unique: ie_a5zZwPWCPvWIwvBx_3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 061D7107ACE3;
 Thu,  3 Dec 2020 17:23:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B96FB63BA7;
 Thu,  3 Dec 2020 17:23:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] block: Fix deadlock in bdrv_co_yield_to_drain()
Date: Thu,  3 Dec 2020 18:23:11 +0100
Message-Id: <20201203172311.68232-4-kwolf@redhat.com>
In-Reply-To: <20201203172311.68232-1-kwolf@redhat.com>
References: <20201203172311.68232-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If bdrv_co_yield_to_drain() is called for draining a block node that
runs in a different AioContext, it keeps that AioContext locked while it
yields and schedules a BH in the AioContext to do the actual drain.

As long as executing the BH is the very next thing the event loop of the
node's AioContext, this actually happens to work, but when it tries to
execute something else that wants to take the AioContext lock, it will
deadlock. (In the bug report, this other thing is a virtio-scsi device
running virtio_scsi_data_plane_handle_cmd().)

Instead, always drop the AioContext lock across the yield and reacquire
it only when the coroutine is reentered. The BH needs to unconditionally
take the lock for itself now.

This fixes the 'block_resize' QMP command on a block node that runs in
an iothread.

Cc: qemu-stable@nongnu.org
Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1903511
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/block/io.c b/block/io.c
index ec5e152bb7..a9f56a9ab1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -306,17 +306,7 @@ static void bdrv_co_drain_bh_cb(void *opaque)
 
     if (bs) {
         AioContext *ctx = bdrv_get_aio_context(bs);
-        AioContext *co_ctx = qemu_coroutine_get_aio_context(co);
-
-        /*
-         * When the coroutine yielded, the lock for its home context was
-         * released, so we need to re-acquire it here. If it explicitly
-         * acquired a different context, the lock is still held and we don't
-         * want to lock it a second time (or AIO_WAIT_WHILE() would hang).
-         */
-        if (ctx == co_ctx) {
-            aio_context_acquire(ctx);
-        }
+        aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
         if (data->begin) {
             assert(!data->drained_end_counter);
@@ -328,9 +318,7 @@ static void bdrv_co_drain_bh_cb(void *opaque)
                                 data->ignore_bds_parents,
                                 data->drained_end_counter);
         }
-        if (ctx == co_ctx) {
-            aio_context_release(ctx);
-        }
+        aio_context_release(ctx);
     } else {
         assert(data->begin);
         bdrv_drain_all_begin();
@@ -348,13 +336,16 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 int *drained_end_counter)
 {
     BdrvCoDrainData data;
+    Coroutine *self = qemu_coroutine_self();
+    AioContext *ctx = bdrv_get_aio_context(bs);
+    AioContext *co_ctx = qemu_coroutine_get_aio_context(self);
 
     /* Calling bdrv_drain() from a BH ensures the current coroutine yields and
      * other coroutines run if they were queued by aio_co_enter(). */
 
     assert(qemu_in_coroutine());
     data = (BdrvCoDrainData) {
-        .co = qemu_coroutine_self(),
+        .co = self,
         .bs = bs,
         .done = false,
         .begin = begin,
@@ -368,13 +359,29 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     if (bs) {
         bdrv_inc_in_flight(bs);
     }
-    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(bs),
-                                     bdrv_co_drain_bh_cb, &data);
+
+    /*
+     * Temporarily drop the lock across yield or we would get deadlocks.
+     * bdrv_co_drain_bh_cb() reaquires the lock as needed.
+     *
+     * When we yield below, the lock for the current context will be
+     * released, so if this is actually the lock that protects bs, don't drop
+     * it a second time.
+     */
+    if (ctx != co_ctx) {
+        aio_context_release(ctx);
+    }
+    replay_bh_schedule_oneshot_event(ctx, bdrv_co_drain_bh_cb, &data);
 
     qemu_coroutine_yield();
     /* If we are resumed from some other event (such as an aio completion or a
      * timer callback), it is a bug in the caller that should be fixed. */
     assert(data.done);
+
+    /* Reaquire the AioContext of bs if we dropped it */
+    if (ctx != co_ctx) {
+        aio_context_acquire(ctx);
+    }
 }
 
 void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-- 
2.28.0


