Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375863BECBC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:01:16 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AvD-00051T-15
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asf-0002ZE-U9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asa-0000CH-76
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbt58Whr8Dn3aSVkCbruxcBQMkjnDxH0dOYGTyebg1g=;
 b=X3wR6UXmxf03rvxWmDyCuefBjZ5p4yakDgTt6n+krwe4OKQsk9z0ydaBETk4I03P4OCna5
 MO3gYccdSGSW4cnudsETN50uFQASRUXQU9C7AMv8GKqncgwquiYzqKF7nAUvku7jdRcB+H
 DUbsfhvyPsdejMNFGwVX6kWET8EMi4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-NuQxNECiPhCEqs37Evhymg-1; Wed, 07 Jul 2021 12:58:28 -0400
X-MC-Unique: NuQxNECiPhCEqs37Evhymg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B99E804141;
 Wed,  7 Jul 2021 16:58:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C87A100EBAF;
 Wed,  7 Jul 2021 16:58:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 1/6] job: use getter/setters instead of accessing the Job
 fields directly
Date: Wed,  7 Jul 2021 18:58:08 +0200
Message-Id: <20210707165813.55361-2-eesposit@redhat.com>
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using getters/setters we can have a more strict control on struct Job
fields. The struct remains public, because it is also used as base
class for BlockJobs and various, but replace all direct accesses
to the fields we want to protect with getters/setters.
This is in preparation to the locking patches.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h  | 33 +++++++++++++++++++
 block.c             |  2 +-
 block/commit.c      |  4 +--
 block/mirror.c      | 17 +++++-----
 block/replication.c |  3 +-
 blockdev.c          |  2 +-
 blockjob.c          | 78 ++++++++++++++++++++++++---------------------
 job-qmp.c           | 16 ++++++----
 job.c               | 52 +++++++++++++++++++++++++++++-
 qemu-img.c          |  2 +-
 10 files changed, 151 insertions(+), 58 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 41162ed494..72c7d0f69d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -303,6 +303,39 @@ void job_txn_unref(JobTxn *txn);
  */
 void job_txn_add_job(JobTxn *txn, Job *job);
 
+/** Returns the @ret field of a given Job. */
+int job_get_ret(Job *job);
+
+/** Returns the AioContext of a given Job. */
+AioContext *job_get_aiocontext(Job *job);
+
+/** Sets the AioContext of a given Job. */
+void job_set_aiocontext(Job *job, AioContext *aio);
+
+/** Returns if a given Job is busy. */
+bool job_is_busy(Job *job);
+
+/** Returns the Error of a given Job. */
+Error *job_get_err(Job *job);
+
+/** Returns if a Job has a pause_count > 0. */
+bool job_should_pause(Job *job);
+
+/** Sets the user_paused flag of a given Job to true. */
+void job_set_user_paused(Job *job);
+
+/** Sets the cancelled flag of a given Job. */
+void job_set_cancelled(Job *job, bool cancel);
+
+/** Returns if a given Job is paused. */
+bool job_is_paused(Job *job);
+
+/** Returns if a given Job is force cancelled. */
+bool job_is_force_cancel(Job *job);
+
+/** Returns the statis of a given Job. */
+JobStatus job_get_status(Job *job);
+
 /**
  * Create a new long-running job and return it.
  *
diff --git a/block.c b/block.c
index acd35cb0cb..1628db2550 100644
--- a/block.c
+++ b/block.c
@@ -5721,7 +5721,7 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         GSList *el;
 
         xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
-                           job->job.id);
+                            job->job.id);
         for (el = job->nodes; el; el = el->next) {
             xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
         }
diff --git a/block/commit.c b/block/commit.c
index 42792b4556..087865953e 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -367,7 +367,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         goto fail;
     }
 
-    s->base = blk_new(s->common.job.aio_context,
+    s->base = blk_new(job_get_aiocontext(&s->common.job),
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
                       | BLK_PERM_GRAPH_MOD
@@ -380,7 +380,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base_bs = base;
 
     /* Required permissions are already taken with block_job_add_bdrv() */
-    s->top = blk_new(s->common.job.aio_context, 0, BLK_PERM_ALL);
+    s->top = blk_new(job_get_aiocontext(&s->common.job), 0, BLK_PERM_ALL);
     ret = blk_insert_bs(s->top, top, errp);
     if (ret < 0) {
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 019f6deaa5..49aaaafffa 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -636,7 +636,7 @@ static int mirror_exit_common(Job *job)
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
     Error *local_err = NULL;
-    bool abort = job->ret < 0;
+    bool abort = job_get_ret(job) < 0;
     int ret = 0;
 
     if (s->prepared) {
@@ -930,7 +930,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
-        s->common.job.cancelled = false;
+        job_set_cancelled(&s->common.job, false);
         goto immediate_exit;
     }
 
@@ -1065,7 +1065,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
              * completion.
              */
             assert(QLIST_EMPTY(&bs->tracked_requests));
-            s->common.job.cancelled = false;
+            job_set_cancelled(&s->common.job, false);
             need_drain = false;
             break;
         }
@@ -1079,7 +1079,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
         if (job_is_cancelled(&s->common.job) &&
-            (!s->synced || s->common.job.force_cancel))
+            (!s->synced || job_is_force_cancel(&s->common.job)))
         {
             break;
         }
@@ -1092,8 +1092,8 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 || ((s->common.job.force_cancel || !s->synced) &&
-               job_is_cancelled(&s->common.job)));
+        assert(ret < 0 || ((job_is_force_cancel(&s->common.job) || !s->synced)
+               && job_is_cancelled(&s->common.job)));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
@@ -1150,7 +1150,7 @@ static void mirror_complete(Job *job, Error **errp)
     s->should_complete = true;
 
     /* If the job is paused, it will be re-entered when it is resumed */
-    if (!job->paused) {
+    if (!job_is_paused(job)) {
         job_enter(job);
     }
 }
@@ -1171,7 +1171,8 @@ static bool mirror_drained_poll(BlockJob *job)
      * from one of our own drain sections, to avoid a deadlock waiting for
      * ourselves.
      */
-    if (!s->common.job.paused && !s->common.job.cancelled && !s->in_drain) {
+    if (!job_is_paused(&s->common.job) && !job_is_cancelled(&s->common.job) &&
+        !s->in_drain) {
         return true;
     }
 
diff --git a/block/replication.c b/block/replication.c
index 52163f2d1f..3923761a54 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,8 @@ static void replication_close(BlockDriverState *bs)
     }
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
-        assert(commit_job->aio_context == qemu_get_current_aio_context());
+        assert(job_get_aiocontext(commit_job) ==
+               qemu_get_current_aio_context());
         job_cancel_sync(commit_job);
     }
 
diff --git a/blockdev.c b/blockdev.c
index f08192deda..8e2c15370e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -147,7 +147,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
-            AioContext *aio_context = job->job.aio_context;
+            AioContext *aio_context = job_get_aiocontext(&job->job);
             aio_context_acquire(aio_context);
 
             job_cancel(&job->job, false);
diff --git a/blockjob.c b/blockjob.c
index 4bad1408cb..7f49f03ec7 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -112,7 +112,7 @@ static bool child_job_drained_poll(BdrvChild *c)
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job->busy || job_is_completed(job)) {
+    if (!job_is_busy(job) || job_is_completed(job)) {
         return false;
     }
 
@@ -161,14 +161,14 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
         bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
     }
 
-    job->job.aio_context = ctx;
+    job_set_aiocontext(&job->job, ctx);
 }
 
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
 
-    return job->job.aio_context;
+    return job_get_aiocontext(&job->job);
 }
 
 static const BdrvChildClass child_job = {
@@ -222,18 +222,19 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
 {
     BdrvChild *c;
     bool need_context_ops;
+    AioContext *ctx = job_get_aiocontext(&job->job);
 
     bdrv_ref(bs);
 
-    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
+    need_context_ops = bdrv_get_aio_context(bs) != ctx;
 
-    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
-        aio_context_release(job->job.aio_context);
+    if (need_context_ops && ctx != qemu_get_aio_context()) {
+        aio_context_release(ctx);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
-    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
-        aio_context_acquire(job->job.aio_context);
+    if (need_context_ops && ctx != qemu_get_aio_context()) {
+        aio_context_acquire(ctx);
     }
     if (c == NULL) {
         return -EPERM;
@@ -303,37 +304,41 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
+BlockJobInfo *block_job_query(BlockJob *blkjob, Error **errp)
 {
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
+    int job_ret;
+    Job *job = &blkjob->job;
 
-    if (block_job_is_internal(job)) {
+    if (block_job_is_internal(blkjob)) {
         error_setg(errp, "Cannot query QEMU internal jobs");
         return NULL;
     }
 
-    progress_get_snapshot(&job->job.progress, &progress_current,
+    progress_get_snapshot(&job->progress, &progress_current,
                           &progress_total);
 
     info = g_new0(BlockJobInfo, 1);
-    info->type      = g_strdup(job_type_str(&job->job));
-    info->device    = g_strdup(job->job.id);
-    info->busy      = qatomic_read(&job->job.busy);
-    info->paused    = job->job.pause_count > 0;
+    info->type      = g_strdup(job_type_str(job));
+    info->device    = g_strdup(job->id);
+    info->busy      = job_is_busy(job);
+    info->paused    = job_should_pause(job);
     info->offset    = progress_current;
     info->len       = progress_total;
-    info->speed     = job->speed;
-    info->io_status = job->iostatus;
-    info->ready     = job_is_ready(&job->job),
-    info->status    = job->job.status;
-    info->auto_finalize = job->job.auto_finalize;
-    info->auto_dismiss  = job->job.auto_dismiss;
-    if (job->job.ret) {
+    info->speed     = blkjob->speed;
+    info->io_status = blkjob->iostatus;
+    info->ready     = job_is_ready(job);
+    info->status    = job_get_status(job);
+    info->auto_finalize = job->auto_finalize;
+    info->auto_dismiss = job->auto_dismiss;
+    job_ret = job_get_ret(job);
+    if (job_ret) {
+        Error *job_err = job_get_err(job);
         info->has_error = true;
-        info->error = job->job.err ?
-                        g_strdup(error_get_pretty(job->job.err)) :
-                        g_strdup(strerror(-job->job.ret));
+        info->error = job_err ?
+                        g_strdup(error_get_pretty(job_err)) :
+                        g_strdup(strerror(-job_ret));
     }
     return info;
 }
@@ -367,26 +372,27 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
 
 static void block_job_event_completed(Notifier *n, void *opaque)
 {
-    BlockJob *job = opaque;
+    BlockJob *blkjob = opaque;
     const char *msg = NULL;
     uint64_t progress_current, progress_total;
+    Job *job = &blkjob->job;
 
-    if (block_job_is_internal(job)) {
+    if (block_job_is_internal(blkjob)) {
         return;
     }
 
-    if (job->job.ret < 0) {
-        msg = error_get_pretty(job->job.err);
+    if (job_get_ret(job) < 0) {
+        msg = error_get_pretty(job_get_err(job));
     }
 
-    progress_get_snapshot(&job->job.progress, &progress_current,
+    progress_get_snapshot(&job->progress, &progress_current,
                           &progress_total);
 
-    qapi_event_send_block_job_completed(job_type(&job->job),
-                                        job->job.id,
+    qapi_event_send_block_job_completed(job_type(job),
+                                        job->id,
                                         progress_total,
                                         progress_current,
-                                        job->speed,
+                                        blkjob->speed,
                                         !!msg,
                                         msg);
 }
@@ -498,7 +504,7 @@ void block_job_iostatus_reset(BlockJob *job)
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         return;
     }
-    assert(job->job.user_paused && job->job.pause_count > 0);
+    assert(job_user_paused(&job->job) && job_should_pause(&job->job));
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
 
@@ -538,10 +544,10 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         action);
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
-        if (!job->job.user_paused) {
+        if (!job_user_paused(&job->job)) {
             job_pause(&job->job);
             /* make the pause user visible, which will be resumed from QMP. */
-            job->job.user_paused = true;
+            job_set_user_paused(&job->job);
         }
         block_job_iostatus_set_err(job, error);
     }
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..12238a1643 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -42,7 +42,7 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
         return NULL;
     }
 
-    *aio_context = job->aio_context;
+    *aio_context = job_get_aiocontext(job);
     aio_context_acquire(*aio_context);
 
     return job;
@@ -122,7 +122,7 @@ void qmp_job_finalize(const char *id, Error **errp)
      * automatically acquires the new one), so make sure we release the correct
      * one.
      */
-    aio_context = job->aio_context;
+    aio_context = job_get_aiocontext(job);
     job_unref(job);
     aio_context_release(aio_context);
 }
@@ -146,21 +146,23 @@ static JobInfo *job_query_single(Job *job, Error **errp)
     JobInfo *info;
     uint64_t progress_current;
     uint64_t progress_total;
+    Error *job_err;
 
     assert(!job_is_internal(job));
     progress_get_snapshot(&job->progress, &progress_current,
                           &progress_total);
+    job_err = job_get_err(job);
 
     info = g_new(JobInfo, 1);
     *info = (JobInfo) {
         .id                 = g_strdup(job->id),
         .type               = job_type(job),
-        .status             = job->status,
+        .status             = job_get_status(job),
         .current_progress   = progress_current,
         .total_progress     = progress_total,
-        .has_error          = !!job->err,
-        .error              = job->err ? \
-                              g_strdup(error_get_pretty(job->err)) : NULL,
+        .has_error          = !!job_err,
+        .error              = job_err ? \
+                              g_strdup(error_get_pretty(job_err)) : NULL,
     };
 
     return info;
@@ -178,7 +180,7 @@ JobInfoList *qmp_query_jobs(Error **errp)
         if (job_is_internal(job)) {
             continue;
         }
-        aio_context = job->aio_context;
+        aio_context = job_get_aiocontext(job);
         aio_context_acquire(aio_context);
         value = job_query_single(job, errp);
         aio_context_release(aio_context);
diff --git a/job.c b/job.c
index e7a5d28854..872bbebb01 100644
--- a/job.c
+++ b/job.c
@@ -94,6 +94,46 @@ static void __attribute__((__constructor__)) job_init(void)
     qemu_mutex_init(&job_mutex);
 }
 
+AioContext *job_get_aiocontext(Job *job)
+{
+    return job->aio_context;
+}
+
+void job_set_aiocontext(Job *job, AioContext *aio)
+{
+    job->aio_context = aio;
+}
+
+bool job_is_busy(Job *job)
+{
+    return qatomic_read(&job->busy);
+}
+
+int job_get_ret(Job *job)
+{
+    return job->ret;
+}
+
+Error *job_get_err(Job *job)
+{
+    return job->err;
+}
+
+JobStatus job_get_status(Job *job)
+{
+    return job->status;
+}
+
+void job_set_cancelled(Job *job, bool cancel)
+{
+    job->cancelled = cancel;
+}
+
+bool job_is_force_cancel(Job *job)
+{
+    return job->force_cancel;
+}
+
 JobTxn *job_txn_new(void)
 {
     JobTxn *txn = g_new0(JobTxn, 1);
@@ -269,11 +309,16 @@ static bool job_started(Job *job)
     return job->co;
 }
 
-static bool job_should_pause(Job *job)
+bool job_should_pause(Job *job)
 {
     return job->pause_count > 0;
 }
 
+bool job_is_paused(Job *job)
+{
+    return job->paused;
+}
+
 Job *job_next(Job *job)
 {
     if (!job) {
@@ -591,6 +636,11 @@ bool job_user_paused(Job *job)
     return job->user_paused;
 }
 
+void job_set_user_paused(Job *job)
+{
+    job->user_paused = true;
+}
+
 void job_user_resume(Job *job, Error **errp)
 {
     assert(job);
diff --git a/qemu-img.c b/qemu-img.c
index 7956a89965..d16bd367d9 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -921,7 +921,7 @@ static void run_block_job(BlockJob *job, Error **errp)
     if (!job_is_completed(&job->job)) {
         ret = job_complete_sync(&job->job, errp);
     } else {
-        ret = job->job.ret;
+        ret = job_get_ret(&job->job);
     }
     job_unref(&job->job);
     aio_context_release(aio_context);
-- 
2.31.1


