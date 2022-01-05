Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01348485490
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:31:52 +0100 (CET)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57KR-0005xD-3E
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sk-0000Hx-Eq
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sb-0007Nx-Ih
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAZv/Zz5rRyB9QDSuBVfXjjv/jEAQDSoJpETDt8kYcA=;
 b=WzKq7rBcknahiuBc20IcwCOHPtGA3gMEJs6Z7xhzCDQuFW2WrSL+hYvWFmHya7LFLUIVAr
 ulpq4sDzpaQ7ZG4c6WOOKzACXUc365wfKHvp22R2IwiBBcfB2wINxbDpe0ONaE352+YkGq
 5wxeaCCSTFGQ63ozWQ5eFIboBFLOStU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-FDzG04ljNL6TBBYSfJ0Qqw-1; Wed, 05 Jan 2022 09:03:01 -0500
X-MC-Unique: FDzG04ljNL6TBBYSfJ0Qqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CCB919251CB;
 Wed,  5 Jan 2022 14:02:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98B0E2B4C0;
 Wed,  5 Jan 2022 14:02:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 14/16] job.c: use job_get_aio_context()
Date: Wed,  5 Jan 2022 09:02:06 -0500
Message-Id: <20220105140208.365608-15-eesposit@redhat.com>
In-Reply-To: <20220105140208.365608-1-eesposit@redhat.com>
References: <20220105140208.365608-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the job->aio_context is accessed under job_mutex,
leave as it is. Otherwise use job_get_aio_context().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/commit.c                   |  4 ++--
 block/mirror.c                   |  2 +-
 block/replication.c              |  2 +-
 blockjob.c                       | 18 +++++++++++-------
 job.c                            |  8 ++++----
 tests/unit/test-block-iothread.c |  6 +++---
 6 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index f639eb49c5..961b57edf0 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -369,7 +369,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         goto fail;
     }
 
-    s->base = blk_new(s->common.job.aio_context,
+    s->base = blk_new(job_get_aio_context(&s->common.job),
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
                       | BLK_PERM_GRAPH_MOD
@@ -382,7 +382,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base_bs = base;
 
     /* Required permissions are already taken with block_job_add_bdrv() */
-    s->top = blk_new(s->common.job.aio_context, 0, BLK_PERM_ALL);
+    s->top = blk_new(job_get_aio_context(&s->common.job), 0, BLK_PERM_ALL);
     ret = blk_insert_bs(s->top, top, errp);
     if (ret < 0) {
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 41450df55c..72b4367b4e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1743,7 +1743,7 @@ static BlockJob *mirror_start_job(
         target_perms |= BLK_PERM_GRAPH_MOD;
     }
 
-    s->target = blk_new(s->common.job.aio_context,
+    s->target = blk_new(job_get_aio_context(&s->common.job),
                         target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
     if (ret < 0) {
diff --git a/block/replication.c b/block/replication.c
index 50ea778937..68018948b9 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -148,8 +148,8 @@ static void replication_close(BlockDriverState *bs)
     }
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
-        assert(commit_job->aio_context == qemu_get_current_aio_context());
         WITH_JOB_LOCK_GUARD() {
+            assert(commit_job->aio_context == qemu_get_current_aio_context());
             job_cancel_sync_locked(commit_job, false);
         }
     }
diff --git a/blockjob.c b/blockjob.c
index cf1f49f6c2..468ba735c5 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -155,14 +155,16 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
         bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
     }
 
-    job->job.aio_context = ctx;
+    WITH_JOB_LOCK_GUARD() {
+        job->job.aio_context = ctx;
+    }
 }
 
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
 
-    return job->job.aio_context;
+    return job_get_aio_context(&job->job);
 }
 
 static const BdrvChildClass child_job = {
@@ -218,19 +220,21 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
 {
     BdrvChild *c;
     bool need_context_ops;
+    AioContext *job_aiocontext;
     assert(qemu_in_main_thread());
 
     bdrv_ref(bs);
 
-    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
+    job_aiocontext = job_get_aio_context(&job->job);
+    need_context_ops = bdrv_get_aio_context(bs) != job_aiocontext;
 
-    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
-        aio_context_release(job->job.aio_context);
+    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
+        aio_context_release(job_aiocontext);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
-    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
-        aio_context_acquire(job->job.aio_context);
+    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
+        aio_context_acquire(job_aiocontext);
     }
     if (c == NULL) {
         return -EPERM;
diff --git a/job.c b/job.c
index f16a4ef542..8a5b710d9b 100644
--- a/job.c
+++ b/job.c
@@ -566,7 +566,7 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
     job->busy = true;
     real_job_unlock();
     job_unlock();
-    aio_co_enter(job->aio_context, job->co);
+    aio_co_enter(job_get_aio_context(job), job->co);
     job_lock();
 }
 
@@ -1138,7 +1138,6 @@ static void coroutine_fn job_co_entry(void *opaque)
     Job *job = opaque;
     int ret;
 
-    assert(job->aio_context == qemu_get_current_aio_context());
     assert(job && job->driver && job->driver->run);
     job_pause_point(job);
     ret = job->driver->run(job, &job->err);
@@ -1177,7 +1176,7 @@ void job_start(Job *job)
         job->paused = false;
         job_state_transition_locked(job, JOB_STATUS_RUNNING);
     }
-    aio_co_enter(job->aio_context, job->co);
+    aio_co_enter(job_get_aio_context(job), job->co);
 }
 
 void job_cancel_locked(Job *job, bool force)
@@ -1303,7 +1302,8 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
     }
 
     job_unlock();
-    AIO_WAIT_WHILE(job->aio_context, (job_enter(job), !job_is_completed(job)));
+    AIO_WAIT_WHILE(job_get_aio_context(job),
+                   (job_enter(job), !job_is_completed(job)));
     job_lock();
 
     ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b9309beec2..addcb5846b 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -379,7 +379,7 @@ static int coroutine_fn test_job_run(Job *job, Error **errp)
     job_transition_to_ready(&s->common.job);
     while (!s->should_complete) {
         s->n++;
-        g_assert(qemu_get_current_aio_context() == job->aio_context);
+        g_assert(qemu_get_current_aio_context() == job_get_aio_context(job));
 
         /* Avoid job_sleep_ns() because it marks the job as !busy. We want to
          * emulate some actual activity (probably some I/O) here so that the
@@ -390,7 +390,7 @@ static int coroutine_fn test_job_run(Job *job, Error **errp)
         job_pause_point(&s->common.job);
     }
 
-    g_assert(qemu_get_current_aio_context() == job->aio_context);
+    g_assert(qemu_get_current_aio_context() == job_get_aio_context(job));
     return 0;
 }
 
@@ -642,7 +642,7 @@ static void test_propagate_mirror(void)
     g_assert(bdrv_get_aio_context(src) == ctx);
     g_assert(bdrv_get_aio_context(target) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
-    g_assert(job->aio_context == ctx);
+    g_assert(job_get_aio_context(job) == ctx);
 
     /* Change the AioContext of target */
     aio_context_acquire(ctx);
-- 
2.31.1


