Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3462FBFA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Mt-00067E-3x; Fri, 18 Nov 2022 12:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mr-00066A-8J
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mp-0002UP-Ak
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7igsZ80em/jvdPAsQMaBYr1f54ZBJRQrM8K/jrwxC7w=;
 b=iuooyYHJgtgGPTcVdtVUgSadY8cy/BXS5fU4g8MHpUpAGduA6pzIJpq0EXDA7DG9kwQvCD
 vhZwqlctYfqjT9HgrqLFGJ9rahWJZ2OBLDGVGl/NiWPm0igQDoA96Pm+u1bmDQJ7kh+XIM
 xaXtJOE9MPSZQ+QmEgFhMebSFQ5yBjs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-LMlOJZgKOLmB8rfV8q7sRA-1; Fri, 18 Nov 2022 12:41:26 -0500
X-MC-Unique: LMlOJZgKOLmB8rfV8q7sRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73B0738173C9;
 Fri, 18 Nov 2022 17:41:26 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39451492B04;
 Fri, 18 Nov 2022 17:41:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] block: Revert .bdrv_drained_begin/end to
 non-coroutine_fn
Date: Fri, 18 Nov 2022 18:40:58 +0100
Message-Id: <20221118174110.55183-4-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Polling during bdrv_drained_end() can be problematic (and in the future,
we may get cases for bdrv_drained_begin() where polling is forbidden,
and we don't care about already in-flight requests, but just want to
prevent new requests from arriving).

The .bdrv_drained_begin/end callbacks running in a coroutine is the only
reason why we have to do this polling, so make them non-coroutine
callbacks again. None of the callers actually yield any more.

This means that bdrv_drained_end() effectively doesn't poll any more,
even if AIO_WAIT_WHILE() loops are still there (their condition is false
from the beginning). This is generally not a problem, but in
test-bdrv-drain, some additional explicit aio_poll() calls need to be
added because the test case wants to verify the final state after BHs
have executed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int-common.h | 10 ++++---
 block.c                          |  4 +--
 block/io.c                       | 49 +++++---------------------------
 block/qed.c                      |  6 ++--
 block/throttle.c                 |  8 +++---
 tests/unit/test-bdrv-drain.c     | 18 ++++++------
 6 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 31ae91e56e..40d646d1ed 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -735,17 +735,19 @@ struct BlockDriver {
     void (*bdrv_io_unplug)(BlockDriverState *bs);
 
     /**
-     * bdrv_co_drain_begin is called if implemented in the beginning of a
+     * bdrv_drain_begin is called if implemented in the beginning of a
      * drain operation to drain and stop any internal sources of requests in
      * the driver.
-     * bdrv_co_drain_end is called if implemented at the end of the drain.
+     * bdrv_drain_end is called if implemented at the end of the drain.
      *
      * They should be used by the driver to e.g. manage scheduled I/O
      * requests, or toggle an internal state. After the end of the drain new
      * requests will continue normally.
+     *
+     * Implementations of both functions must not call aio_poll().
      */
-    void coroutine_fn (*bdrv_co_drain_begin)(BlockDriverState *bs);
-    void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
+    void (*bdrv_drain_begin)(BlockDriverState *bs);
+    void (*bdrv_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
     bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
diff --git a/block.c b/block.c
index a18f052374..cbff7acd97 100644
--- a/block.c
+++ b/block.c
@@ -1715,8 +1715,8 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     assert(is_power_of_2(bs->bl.request_alignment));
 
     for (i = 0; i < bs->quiesce_counter; i++) {
-        if (drv->bdrv_co_drain_begin) {
-            drv->bdrv_co_drain_begin(bs);
+        if (drv->bdrv_drain_begin) {
+            drv->bdrv_drain_begin(bs);
         }
     }
 
diff --git a/block/io.c b/block/io.c
index b9424024f9..c2ed4b2af9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -252,55 +252,20 @@ typedef struct {
     int *drained_end_counter;
 } BdrvCoDrainData;
 
-static void coroutine_fn bdrv_drain_invoke_entry(void *opaque)
-{
-    BdrvCoDrainData *data = opaque;
-    BlockDriverState *bs = data->bs;
-
-    if (data->begin) {
-        bs->drv->bdrv_co_drain_begin(bs);
-    } else {
-        bs->drv->bdrv_co_drain_end(bs);
-    }
-
-    /* Set data->done and decrement drained_end_counter before bdrv_wakeup() */
-    qatomic_mb_set(&data->done, true);
-    if (!data->begin) {
-        qatomic_dec(data->drained_end_counter);
-    }
-    bdrv_dec_in_flight(bs);
-
-    g_free(data);
-}
-
-/* Recursively call BlockDriver.bdrv_co_drain_begin/end callbacks */
+/* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
 static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
                               int *drained_end_counter)
 {
-    BdrvCoDrainData *data;
-
-    if (!bs->drv || (begin && !bs->drv->bdrv_co_drain_begin) ||
-            (!begin && !bs->drv->bdrv_co_drain_end)) {
+    if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
+            (!begin && !bs->drv->bdrv_drain_end)) {
         return;
     }
 
-    data = g_new(BdrvCoDrainData, 1);
-    *data = (BdrvCoDrainData) {
-        .bs = bs,
-        .done = false,
-        .begin = begin,
-        .drained_end_counter = drained_end_counter,
-    };
-
-    if (!begin) {
-        qatomic_inc(drained_end_counter);
+    if (begin) {
+        bs->drv->bdrv_drain_begin(bs);
+    } else {
+        bs->drv->bdrv_drain_end(bs);
     }
-
-    /* Make sure the driver callback completes during the polling phase for
-     * drain_begin. */
-    bdrv_inc_in_flight(bs);
-    data->co = qemu_coroutine_create(bdrv_drain_invoke_entry, data);
-    aio_co_schedule(bdrv_get_aio_context(bs), data->co);
 }
 
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
diff --git a/block/qed.c b/block/qed.c
index 013f826c44..c2691a85b1 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -262,7 +262,7 @@ static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
     assert(!s->allocating_write_reqs_plugged);
     if (s->allocating_acb != NULL) {
         /* Another allocating write came concurrently.  This cannot happen
-         * from bdrv_qed_co_drain_begin, but it can happen when the timer runs.
+         * from bdrv_qed_drain_begin, but it can happen when the timer runs.
          */
         qemu_co_mutex_unlock(&s->table_lock);
         return false;
@@ -365,7 +365,7 @@ static void bdrv_qed_attach_aio_context(BlockDriverState *bs,
     }
 }
 
-static void coroutine_fn bdrv_qed_co_drain_begin(BlockDriverState *bs)
+static void bdrv_qed_drain_begin(BlockDriverState *bs)
 {
     BDRVQEDState *s = bs->opaque;
 
@@ -1661,7 +1661,7 @@ static BlockDriver bdrv_qed = {
     .bdrv_co_check            = bdrv_qed_co_check,
     .bdrv_detach_aio_context  = bdrv_qed_detach_aio_context,
     .bdrv_attach_aio_context  = bdrv_qed_attach_aio_context,
-    .bdrv_co_drain_begin      = bdrv_qed_co_drain_begin,
+    .bdrv_drain_begin         = bdrv_qed_drain_begin,
 };
 
 static void bdrv_qed_init(void)
diff --git a/block/throttle.c b/block/throttle.c
index 131eba3ab4..88851c84f4 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -214,7 +214,7 @@ static void throttle_reopen_abort(BDRVReopenState *reopen_state)
     reopen_state->opaque = NULL;
 }
 
-static void coroutine_fn throttle_co_drain_begin(BlockDriverState *bs)
+static void throttle_drain_begin(BlockDriverState *bs)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     if (qatomic_fetch_inc(&tgm->io_limits_disabled) == 0) {
@@ -222,7 +222,7 @@ static void coroutine_fn throttle_co_drain_begin(BlockDriverState *bs)
     }
 }
 
-static void coroutine_fn throttle_co_drain_end(BlockDriverState *bs)
+static void throttle_drain_end(BlockDriverState *bs)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     assert(tgm->io_limits_disabled);
@@ -261,8 +261,8 @@ static BlockDriver bdrv_throttle = {
     .bdrv_reopen_commit                 =   throttle_reopen_commit,
     .bdrv_reopen_abort                  =   throttle_reopen_abort,
 
-    .bdrv_co_drain_begin                =   throttle_co_drain_begin,
-    .bdrv_co_drain_end                  =   throttle_co_drain_end,
+    .bdrv_drain_begin                   =   throttle_drain_begin,
+    .bdrv_drain_end                     =   throttle_drain_end,
 
     .is_filter                          =   true,
     .strong_runtime_opts                =   throttle_strong_runtime_opts,
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 24f34e24ad..695519ee02 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -46,7 +46,7 @@ static void coroutine_fn sleep_in_drain_begin(void *opaque)
     bdrv_dec_in_flight(bs);
 }
 
-static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
+static void bdrv_test_drain_begin(BlockDriverState *bs)
 {
     BDRVTestState *s = bs->opaque;
     s->drain_count++;
@@ -57,7 +57,7 @@ static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
     }
 }
 
-static void coroutine_fn bdrv_test_co_drain_end(BlockDriverState *bs)
+static void bdrv_test_drain_end(BlockDriverState *bs)
 {
     BDRVTestState *s = bs->opaque;
     s->drain_count--;
@@ -111,8 +111,8 @@ static BlockDriver bdrv_test = {
     .bdrv_close             = bdrv_test_close,
     .bdrv_co_preadv         = bdrv_test_co_preadv,
 
-    .bdrv_co_drain_begin    = bdrv_test_co_drain_begin,
-    .bdrv_co_drain_end      = bdrv_test_co_drain_end,
+    .bdrv_drain_begin       = bdrv_test_drain_begin,
+    .bdrv_drain_end         = bdrv_test_drain_end,
 
     .bdrv_child_perm        = bdrv_default_perms,
 
@@ -1703,6 +1703,7 @@ static void test_blockjob_commit_by_drained_end(void)
     bdrv_drained_begin(bs_child);
     g_assert(!job_has_completed);
     bdrv_drained_end(bs_child);
+    aio_poll(qemu_get_aio_context(), false);
     g_assert(job_has_completed);
 
     bdrv_unref(bs_parents[0]);
@@ -1858,6 +1859,7 @@ static void test_drop_intermediate_poll(void)
 
     g_assert(!job_has_completed);
     ret = bdrv_drop_intermediate(chain[1], chain[0], NULL);
+    aio_poll(qemu_get_aio_context(), false);
     g_assert(ret == 0);
     g_assert(job_has_completed);
 
@@ -1946,7 +1948,7 @@ static void coroutine_fn bdrv_replace_test_drain_co(void *opaque)
  * .was_drained.
  * Increment .drain_count.
  */
-static void coroutine_fn bdrv_replace_test_co_drain_begin(BlockDriverState *bs)
+static void bdrv_replace_test_drain_begin(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
@@ -1977,7 +1979,7 @@ static void coroutine_fn bdrv_replace_test_read_entry(void *opaque)
  * If .drain_count reaches 0 and the node has a backing file, issue a
  * read request.
  */
-static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
+static void bdrv_replace_test_drain_end(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
@@ -2002,8 +2004,8 @@ static BlockDriver bdrv_replace_test = {
     .bdrv_close             = bdrv_replace_test_close,
     .bdrv_co_preadv         = bdrv_replace_test_co_preadv,
 
-    .bdrv_co_drain_begin    = bdrv_replace_test_co_drain_begin,
-    .bdrv_co_drain_end      = bdrv_replace_test_co_drain_end,
+    .bdrv_drain_begin       = bdrv_replace_test_drain_begin,
+    .bdrv_drain_end         = bdrv_replace_test_drain_end,
 
     .bdrv_child_perm        = bdrv_default_perms,
 };
-- 
2.38.1


