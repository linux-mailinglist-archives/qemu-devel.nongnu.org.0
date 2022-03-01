Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721724C8DB0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:28:50 +0100 (CET)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Ue-0002q2-1L
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3Na-0000W9-Fp
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NX-00075O-Hq
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QgVm+oCHZA9oU7a3UvJSa+DGlQIWb6nrdHnhsz1KTM=;
 b=Mxu12pkaRNAnZLbxIZ7pqdx/XsSKErKYF5SFuKoia+LLV8gonSv3LxVV1uysCxfALIdb4D
 g3vJedM07GDmSBeNdk4lsMz9yn+Ly/9nznEMZKgjN4BWRl7ijGAw5VVC0Q2WeICw1fS523
 InkPd9S8fKLB4nzE7Ks+O8jSxcQZrRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-RvqFfhtcMeqJUfrk6f5a8Q-1; Tue, 01 Mar 2022 09:21:24 -0500
X-MC-Unique: RvqFfhtcMeqJUfrk6f5a8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB43A1854E27;
 Tue,  1 Mar 2022 14:21:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 224FD866CC;
 Tue,  1 Mar 2022 14:21:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 5/5] test-bdrv-drain: ensure draining from main loop stops
 iothreads
Date: Tue,  1 Mar 2022 09:21:13 -0500
Message-Id: <20220301142113.163174-6-eesposit@redhat.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 2 tests: test_main_and_then_iothread_drain ensures that if the
main thread drains, the iothread cannot drain (and thus read
the graph). test_main_and_iothread_drain instead lets main loop
and iothread to drain together, and makes sure that no drain
happens in parallel.

Note that we are using bdrv_subtree_drained_{begin/end}_unlocked
to try avoid using the aiocontext lock as much as possible, since
it will eventually go away.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..bf7fdcb568 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1534,6 +1534,219 @@ static void test_set_aio_context(void)
     iothread_join(b);
 }
 
+typedef struct ParallelDrainJob {
+    BlockJob common;
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    IOThread *a;
+    bool should_fail;
+    bool allowed_to_run;
+    bool conclude_test;
+    bool job_started;
+} ParallelDrainJob;
+
+typedef struct BDRVParallelTestState {
+    ParallelDrainJob *job;
+} BDRVParallelTestState;
+
+static void coroutine_fn bdrv_test_par_co_drain(BlockDriverState *bs)
+{
+    BDRVParallelTestState *s = bs->opaque;
+    ParallelDrainJob *job = s->job;
+    assert(!qatomic_read(&job->should_fail));
+}
+
+static int parallel_run_test(Job *job, Error **errp)
+{
+    ParallelDrainJob *s = container_of(job, ParallelDrainJob, common.job);
+    s->job_started = true;
+
+    while (!s->conclude_test) {
+        if (s->allowed_to_run) {
+            bdrv_subtree_drained_begin_unlocked(s->bs);
+            bdrv_subtree_drained_end_unlocked(s->bs);
+        }
+        job_pause_point(&s->common.job);
+    }
+    s->job_started = false;
+
+    return 0;
+}
+
+static BlockDriver bdrv_test_parallel = {
+    .format_name            = "test",
+    .instance_size          = sizeof(BDRVParallelTestState),
+    .supports_backing       = true,
+
+    .bdrv_co_drain_begin    = bdrv_test_par_co_drain,
+    .bdrv_co_drain_end      = bdrv_test_par_co_drain,
+
+    .bdrv_child_perm        = bdrv_default_perms,
+};
+
+static bool parallel_drained_poll(BlockJob *job)
+{
+    /* need to return false otherwise a drain in coroutine deadlocks */
+    return false;
+}
+
+static const BlockJobDriver test_block_job_driver_parallel = {
+    .job_driver = {
+        .instance_size = sizeof(ParallelDrainJob),
+        .run           = parallel_run_test,
+        .user_resume   = block_job_user_resume,
+        .free          = block_job_free,
+    },
+    .drained_poll      = parallel_drained_poll,
+};
+
+static ParallelDrainJob *setup_job_test(void)
+{
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    Error *err = NULL;
+    IOThread *a = iothread_new();
+    AioContext *ctx_a = iothread_get_aio_context(a);
+    ParallelDrainJob *s;
+    BDRVParallelTestState *p;
+    int ret;
+
+    blk = blk_new(qemu_get_aio_context(),
+                         BLK_PERM_CONSISTENT_READ, BLK_PERM_ALL);
+    blk_set_allow_aio_context_change(blk, true);
+
+    bs = bdrv_new_open_driver(&bdrv_test_parallel, "parent", 0,
+                                     &error_abort);
+    p = bs->opaque;
+
+    ret = blk_insert_bs(blk, bs, &error_abort);
+    assert(ret == 0);
+
+    s = block_job_create("job1", &test_block_job_driver_parallel,
+                         NULL, blk_bs(blk), 0, BLK_PERM_ALL, 0, JOB_DEFAULT,
+                         NULL, NULL, &err);
+    s->bs = bs;
+    s->a = a;
+    s->blk = blk;
+    p->job = s;
+
+    ret = bdrv_try_set_aio_context(bs, ctx_a, &error_abort);
+    assert(ret == 0);
+    assert(blk_get_aio_context(blk) == ctx_a);
+    assert(s->common.job.aio_context == ctx_a);
+
+    return s;
+}
+
+static void stop_and_tear_down_test(ParallelDrainJob *s)
+{
+    AioContext *ctx = iothread_get_aio_context(s->a);
+
+    /* stop iothread */
+    s->conclude_test = true;
+
+    /* wait that it's stopped */
+    while (s->job_started) {
+        aio_poll(qemu_get_current_aio_context(), false);
+    }
+
+    aio_context_acquire(ctx);
+    bdrv_unref(s->bs);
+    blk_unref(s->blk);
+    aio_context_release(ctx);
+    iothread_join(s->a);
+}
+
+/**
+ * test_main_and_then_iothread_drain: test that if the main
+ * loop drains, iothread cannot possibly drain.
+ *
+ * In this test, make sure that the main loop has firstly
+ * drained, and then allow the iothread to try and drain.
+ *
+ * Therefore, if the main loop drains, there is no way that
+ * the graph can be read or written by the iothread.
+ */
+static void test_main_and_then_iothread_drain(void)
+{
+    ParallelDrainJob *s = setup_job_test();
+
+    s->allowed_to_run = false;
+    job_start(&s->common.job);
+
+    /*
+     * Wait that the iothread starts, even though it just
+     * loops without doing anything (allowed_to_run is false)
+     */
+    while (!s->job_started) {
+        aio_poll(qemu_get_current_aio_context(), false);
+    }
+
+    /*
+     * Drain in the main loop and ensure that no drain
+     * is performed by the iothread.
+     */
+    bdrv_subtree_drained_begin_unlocked(s->bs);
+    /* iothread should be put */
+    qatomic_set(&s->should_fail, true);
+    /* let the iothread do drains */
+    s->allowed_to_run = true;
+
+    /* [perform graph modifications here], as iothread is stopped */
+    sleep(3);
+
+    /* done with modifications, let the iothread drain once it resumes */
+    qatomic_set(&s->should_fail, false);
+
+    /* drained_end should resume the iothread */
+    bdrv_subtree_drained_end_unlocked(s->bs);
+
+    stop_and_tear_down_test(s);
+}
+
+/**
+ * test_main_and_iothread_drain: test that if the main
+ * loop drains, iothread cannot possibly drain.
+ *
+ * In this test, simply let iothread and main loop concurrenly
+ * loop and drain together, making sure that iothread never
+ * reads the graph while main loop is draining.
+ *
+ * Therefore, if the main loop drains, there is no way that
+ * the graph can be read or written by the iothread.
+ */
+static void test_main_and_iothread_drain(void)
+{
+    ParallelDrainJob *s = setup_job_test();
+    int i;
+
+    /* let the iothread do drains from beginning */
+    s->allowed_to_run = true;
+    job_start(&s->common.job);
+
+    /* wait that the iothread starts and begins with drains. */
+    while (!s->job_started) {
+        aio_poll(qemu_get_current_aio_context(), false);
+    }
+
+    /* at the same time, also main loop performs drains */
+    for (i = 0; i < 1000; i++) {
+        bdrv_subtree_drained_begin_unlocked(s->bs);
+        /* iothread should be put, regardless of when it drained */
+        qatomic_set(&s->should_fail, true);
+
+        /* [perform graph modifications here] */
+
+        /* done with modifications, let the iothread drain once it resumes */
+        qatomic_set(&s->should_fail, false);
+
+        /* drained_end should resume the iothread */
+        bdrv_subtree_drained_end_unlocked(s->bs);
+    }
+
+    stop_and_tear_down_test(s);
+}
+
 
 typedef struct TestDropBackingBlockJob {
     BlockJob common;
@@ -2185,6 +2398,11 @@ int main(int argc, char **argv)
     g_test_add_func("/bdrv-drain/iothread/drain_subtree",
                     test_iothread_drain_subtree);
 
+    g_test_add_func("/bdrv-drain/iothread/drain_main_and_then_iothread",
+                    test_main_and_then_iothread_drain);
+    g_test_add_func("/bdrv-drain/iothread/drain_parallel",
+                    test_main_and_iothread_drain);
+
     g_test_add_func("/bdrv-drain/blockjob/drain_all", test_blockjob_drain_all);
     g_test_add_func("/bdrv-drain/blockjob/drain", test_blockjob_drain);
     g_test_add_func("/bdrv-drain/blockjob/drain_subtree",
-- 
2.31.1


