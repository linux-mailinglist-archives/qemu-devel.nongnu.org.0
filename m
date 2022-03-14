Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E24D85E2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:27:52 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkjn-0000wq-2b
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:27:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbQ-0001KQ-Mm
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbM-0006Xw-Vt
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8c6Z3AR9PZCtM6O69bQWb283pICoDFuvr9aNndTEVg=;
 b=L4LSss0W+y3uIbKY6mvRY5hIkVtGmRYOe+I5D22xozkRp0Hq2DQZXJi6AaHDOmAS2ZsoIk
 IoaTrs9odXYOKmQrnQQIQt8J8e1eUNU2m+mESU9TkcF95KxVx0+NMf/E7yfVa8GH7Qmlr7
 K0Dq3iizMYij/GfSjOTI/frlBm9HbFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-cyNo2sHZNxK2-oGgQv2Jig-1; Mon, 14 Mar 2022 09:19:05 -0400
X-MC-Unique: cyNo2sHZNxK2-oGgQv2Jig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3A2E185A7A4;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 816461686D;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 02/10] bdrv_parent_drained_begin_single: handle calls from
 coroutine context
Date: Mon, 14 Mar 2022 09:18:46 -0400
Message-Id: <20220314131854.2202651-3-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_parent_drained_begin_single() is also called by
bdrv_replace_child_noperm(). The latter is often called
from coroutines, for example in bdrv_co_create_opts() callbacks.

This can potentially create deadlocks, because if the drain_saldo
in bdrv_replace_child_noperm is > 0, the coroutine will start
polling using BDRV_POLL_WHILE. Right now this does not seem
to happen, but if additional drains are used in future,
this will be much more likely to happen.

Fix the problem by doing something very similar to
bdrv_do_drained_begin(): if in coroutine, schedule a bh
to execute the drain in the main loop, and enter the coroutine
only once it is done.

Just as the other drains, check the coroutine case only when
effectively polling.

As a consequence of this, remove the coroutine assertion in
bdrv_do_drained_begin_quiesce. We are never polling in that case.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 4a3e8d037d..e446782ae0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -67,10 +67,101 @@ static void bdrv_parent_drained_end_single_no_poll(BdrvChild *c,
     }
 }
 
+typedef struct {
+    Coroutine *co;
+    BdrvChild *child;
+    bool done;
+    bool begin;
+    bool poll;
+} BdrvCoDrainParentData;
+
+static void bdrv_co_drain_parent_bh_cb(void *opaque)
+{
+    BdrvCoDrainParentData *data = opaque;
+    Coroutine *co = data->co;
+    BdrvChild *child = data->child;
+    BlockDriverState *bs = child->bs;
+    AioContext *ctx = bdrv_get_aio_context(bs);
+
+    if (bs) {
+        aio_context_acquire(ctx);
+        bdrv_dec_in_flight(bs);
+    }
+
+    if (data->begin) {
+        bdrv_parent_drained_begin_single(child, data->poll);
+    } else {
+        assert(!data->poll);
+        bdrv_parent_drained_end_single(child);
+    }
+
+    if (bs) {
+        aio_context_release(ctx);
+    }
+
+    data->done = true;
+    aio_co_wake(co);
+}
+
+static void coroutine_fn bdrv_co_yield_to_drain_parent(BdrvChild *c,
+                                                       bool begin, bool poll)
+{
+    BdrvCoDrainParentData data;
+    Coroutine *self = qemu_coroutine_self();
+    BlockDriverState *bs = c->bs;
+    AioContext *ctx = bdrv_get_aio_context(bs);
+    AioContext *co_ctx = qemu_coroutine_get_aio_context(self);
+
+    /* Calling bdrv_drain() from a BH ensures the current coroutine yields and
+     * other coroutines run if they were queued by aio_co_enter(). */
+
+    assert(qemu_in_coroutine());
+    data = (BdrvCoDrainParentData) {
+        .co = self,
+        .child = c,
+        .done = false,
+        .begin = begin,
+        .poll = poll,
+    };
+
+    if (bs) {
+        bdrv_inc_in_flight(bs);
+    }
+
+    /*
+     * Temporarily drop the lock across yield or we would get deadlocks.
+     * bdrv_co_yield_to_drain_parent() reaquires the lock as needed.
+     *
+     * When we yield below, the lock for the current context will be
+     * released, so if this is actually the lock that protects bs, don't drop
+     * it a second time.
+     */
+    if (ctx != co_ctx) {
+        aio_context_release(ctx);
+    }
+    replay_bh_schedule_oneshot_event(ctx, bdrv_co_drain_parent_bh_cb, &data);
+
+    qemu_coroutine_yield();
+    /* If we are resumed from some other event (such as an aio completion or a
+     * timer callback), it is a bug in the caller that should be fixed. */
+    assert(data.done);
+
+    /* Reaquire the AioContext of bs if we dropped it */
+    if (ctx != co_ctx) {
+        aio_context_acquire(ctx);
+    }
+}
+
 void bdrv_parent_drained_end_single(BdrvChild *c)
 {
     int drained_end_counter = 0;
     IO_OR_GS_CODE();
+
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain_parent(c, false, false);
+        return;
+    }
+
     bdrv_parent_drained_end_single_no_poll(c, &drained_end_counter);
     BDRV_POLL_WHILE(c->bs, qatomic_read(&drained_end_counter) > 0);
 }
@@ -116,6 +207,12 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
 void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 {
     IO_OR_GS_CODE();
+
+    if (poll && qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain_parent(c, true, poll);
+        return;
+    }
+
     c->parent_quiesce_counter++;
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
@@ -430,7 +527,6 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
                                    BdrvChild *parent, bool ignore_bds_parents)
 {
     IO_OR_GS_CODE();
-    assert(!qemu_in_coroutine());
 
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
-- 
2.31.1


