Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E449F8D5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:57:22 +0100 (CET)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPsX-0004VQ-9R
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:57:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmI-0004Zj-Pp
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmC-0003Pi-52
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCQoDTdCqX47voMvMQELdUXUIJy2lxwMFhhXZJgUkOA=;
 b=KrtIv8xTe8q5clgIU7o/ad0c/JuqHNoQq+Us2AzDF8+EHxArlCZbOD9aO4GcYQVnFc7r/3
 7N6zCrkCIe4qkBx877vIV/zQWFmgVcGCOZMPwPYyCdGklxr5C1tim4QaNR30P/4FK+u0yY
 uAKAB0kQnjWxWXDiKIbfAVCP2Dff3gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-SmH5xgVvPPyaehwXFbfuEA-1; Fri, 28 Jan 2022 06:50:44 -0500
X-MC-Unique: SmH5xgVvPPyaehwXFbfuEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA482F4A;
 Fri, 28 Jan 2022 11:50:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2A6522DE3;
 Fri, 28 Jan 2022 11:50:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/19] jobs: protect jobs with job_lock/unlock
Date: Fri, 28 Jan 2022 06:50:19 -0500
Message-Id: <20220128115031.4061565-8-eesposit@redhat.com>
In-Reply-To: <20220128115031.4061565-1-eesposit@redhat.com>
References: <20220128115031.4061565-1-eesposit@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduce the job locking mechanism through the whole job API,
following the comments and requirements of job-monitor (assume
lock is held) and job-driver (lock is not held).

job_{lock/unlock} is independent from real_job_{lock/unlock}.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c             |  18 +++++---
 block/replication.c |   8 +++-
 blockdev.c          |  17 +++++--
 blockjob.c          |  60 +++++++++++++++++-------
 job-qmp.c           |   2 +
 job.c               | 110 ++++++++++++++++++++++++++++++++------------
 monitor/qmp-cmds.c  |   6 ++-
 qemu-img.c          |  41 ++++++++++-------
 8 files changed, 185 insertions(+), 77 deletions(-)

diff --git a/block.c b/block.c
index afa18653d1..5e1ab8d692 100644
--- a/block.c
+++ b/block.c
@@ -4972,7 +4972,9 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
-    assert(job_next(NULL) == NULL);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job_next(NULL) == NULL);
+    }
     assert(qemu_in_main_thread());
 
     /* Drop references from requests still in flight, such as canceled block
@@ -6149,13 +6151,15 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         }
     }
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        GSList *el;
+    WITH_JOB_LOCK_GUARD() {
+        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+            GSList *el;
 
-        xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
-                           job->job.id);
-        for (el = job->nodes; el; el = el->next) {
-            xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
+            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
+                                job->job.id);
+            for (el = job->nodes; el; el = el->next) {
+                xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
+            }
         }
     }
 
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..a03b28726e 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
-        job_cancel_sync(commit_job, false);
+        WITH_JOB_LOCK_GUARD() {
+            job_cancel_sync(commit_job, false);
+        }
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
@@ -726,7 +728,9 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
-            job_cancel_sync(&s->backup_job->job, true);
+            WITH_JOB_LOCK_GUARD() {
+                job_cancel_sync(&s->backup_job->job, true);
+            }
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index 45a24fee8a..2e522dd7fe 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -150,6 +150,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
         return;
     }
 
+    JOB_LOCK_GUARD();
+
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
             AioContext *aio_context = job->job.aio_context;
@@ -1838,7 +1840,9 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job, true);
+        WITH_JOB_LOCK_GUARD() {
+            job_cancel_sync(&state->job->job, true);
+        }
 
         aio_context_release(aio_context);
     }
@@ -1939,7 +1943,9 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job, true);
+        WITH_JOB_LOCK_GUARD() {
+            job_cancel_sync(&state->job->job, true);
+        }
 
         aio_context_release(aio_context);
     }
@@ -2388,7 +2394,10 @@ exit:
     if (!has_props) {
         qapi_free_TransactionProperties(props);
     }
-    job_txn_unref(block_job_txn);
+
+    WITH_JOB_LOCK_GUARD() {
+        job_txn_unref(block_job_txn);
+    }
 }
 
 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
@@ -3711,6 +3720,8 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;
 
+    JOB_LOCK_GUARD();
+
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
 
diff --git a/blockjob.c b/blockjob.c
index cce8146cb6..9fd1b6972f 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -102,7 +102,9 @@ static char *child_job_get_parent_desc(BdrvChild *c)
 static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
-    job_pause(&job->job);
+    WITH_JOB_LOCK_GUARD() {
+        job_pause(&job->job);
+    }
 }
 
 static bool child_job_drained_poll(BdrvChild *c)
@@ -114,8 +116,10 @@ static bool child_job_drained_poll(BdrvChild *c)
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job->busy || job_is_completed(job)) {
-        return false;
+    WITH_JOB_LOCK_GUARD() {
+        if (!job->busy || job_is_completed(job)) {
+            return false;
+        }
     }
 
     /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
@@ -130,7 +134,9 @@ static bool child_job_drained_poll(BdrvChild *c)
 static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
-    job_resume(&job->job);
+    WITH_JOB_LOCK_GUARD() {
+        job_resume(&job->job);
+    }
 }
 
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
@@ -252,7 +258,13 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
 
 static void block_job_on_idle(Notifier *n, void *opaque)
 {
+    /*
+     * we can't kick with job_mutex held, but we also want
+     * to protect the notifier list.
+     */
+    job_unlock();
     aio_wait_kick();
+    job_lock();
 }
 
 bool block_job_is_internal(BlockJob *job)
@@ -292,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     job->speed = speed;
 
     if (drv->set_speed) {
+        job_unlock();
         drv->set_speed(job, speed);
+        job_lock();
     }
 
     if (speed && speed <= old_speed) {
@@ -469,13 +483,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job->ready_notifier.notify = block_job_event_ready;
     job->idle_notifier.notify = block_job_on_idle;
 
-    notifier_list_add(&job->job.on_finalize_cancelled,
-                      &job->finalize_cancelled_notifier);
-    notifier_list_add(&job->job.on_finalize_completed,
-                      &job->finalize_completed_notifier);
-    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
-    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
-    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
+    WITH_JOB_LOCK_GUARD() {
+        notifier_list_add(&job->job.on_finalize_cancelled,
+                          &job->finalize_cancelled_notifier);
+        notifier_list_add(&job->job.on_finalize_completed,
+                          &job->finalize_completed_notifier);
+        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
+        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
+        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
+    }
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
@@ -487,7 +503,10 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    if (!block_job_set_speed(job, speed, errp)) {
+    WITH_JOB_LOCK_GUARD() {
+        ret = block_job_set_speed(job, speed, errp);
+    }
+    if (!ret) {
         goto fail;
     }
 
@@ -512,7 +531,9 @@ void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
     assert(qemu_in_main_thread());
-    block_job_iostatus_reset(bjob);
+    WITH_JOB_LOCK_GUARD() {
+        block_job_iostatus_reset(bjob);
+    }
 }
 
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
@@ -545,10 +566,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         action);
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
-        if (!job->job.user_paused) {
-            job_pause(&job->job);
-            /* make the pause user visible, which will be resumed from QMP. */
-            job->job.user_paused = true;
+        WITH_JOB_LOCK_GUARD() {
+            if (!job->job.user_paused) {
+                job_pause(&job->job);
+                /*
+                 * make the pause user visible, which will be
+                 * resumed from QMP.
+                 */
+                job->job.user_paused = true;
+            }
         }
         block_job_iostatus_set_err(job, error);
     }
diff --git a/job-qmp.c b/job-qmp.c
index a6774aaaa5..06f970f6cf 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -171,6 +171,8 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     for (job = job_next(NULL); job; job = job_next(job)) {
         JobInfo *value;
 
diff --git a/job.c b/job.c
index 2b88cef19d..4947a58dcb 100644
--- a/job.c
+++ b/job.c
@@ -322,6 +322,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
 {
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     if (job_id) {
         if (flags & JOB_INTERNAL) {
             error_setg(errp, "Cannot specify job ID for internal job");
@@ -396,7 +398,9 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            job_unlock();
             job->driver->free(job);
+            job_lock();
         }
 
         QLIST_REMOVE(job, job_list);
@@ -485,6 +489,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
 
 void job_enter(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_enter_cond(job, NULL);
 }
 
@@ -503,7 +508,9 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     job->busy = false;
     job_event_idle(job);
     real_job_unlock();
+    job_unlock();
     qemu_coroutine_yield();
+    job_lock();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
     assert(job->busy);
@@ -513,15 +520,20 @@ void coroutine_fn job_pause_point(Job *job)
 {
     assert(job && job_started(job));
 
+    job_lock();
     if (!job_should_pause(job)) {
+        job_unlock();
         return;
     }
     if (job_is_cancelled(job)) {
+        job_unlock();
         return;
     }
 
     if (job->driver->pause) {
+        job_unlock();
         job->driver->pause(job);
+        job_lock();
     }
 
     if (job_should_pause(job) && !job_is_cancelled(job)) {
@@ -534,6 +546,7 @@ void coroutine_fn job_pause_point(Job *job)
         job->paused = false;
         job_state_transition(job, status);
     }
+    job_unlock();
 
     if (job->driver->resume) {
         job->driver->resume(job);
@@ -542,15 +555,17 @@ void coroutine_fn job_pause_point(Job *job)
 
 void job_yield(Job *job)
 {
-    assert(job->busy);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->busy);
 
-    /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
-        return;
-    }
+        /* Check cancellation *before* setting busy = false, too!  */
+        if (job_is_cancelled(job)) {
+            return;
+        }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, -1);
+        if (!job_should_pause(job)) {
+            job_do_yield(job, -1);
+        }
     }
 
     job_pause_point(job);
@@ -558,21 +573,23 @@ void job_yield(Job *job)
 
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
-    assert(job->busy);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->busy);
 
-    /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
-        return;
-    }
+        /* Check cancellation *before* setting busy = false, too!  */
+        if (job_is_cancelled(job)) {
+            return;
+        }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+        if (!job_should_pause(job)) {
+            job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+        }
     }
 
     job_pause_point(job);
 }
 
-/* Assumes the block_job_mutex is held */
+/* Assumes the job_mutex is held */
 static bool job_timer_not_pending(Job *job)
 {
     return !timer_pending(&job->sleep_timer);
@@ -582,7 +599,7 @@ void job_pause(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter(job);
+        job_enter_cond(job, NULL);
     }
 }
 
@@ -628,7 +645,9 @@ void job_user_resume(Job *job, Error **errp)
         return;
     }
     if (job->driver->user_resume) {
+        job_unlock();
         job->driver->user_resume(job);
+        job_lock();
     }
     job->user_paused = false;
     job_resume(job);
@@ -692,7 +711,9 @@ static void job_commit(Job *job)
     assert(!job->ret);
     assert(qemu_in_main_thread());
     if (job->driver->commit) {
+        job_unlock();
         job->driver->commit(job);
+        job_lock();
     }
 }
 
@@ -701,7 +722,9 @@ static void job_abort(Job *job)
     assert(job->ret);
     assert(qemu_in_main_thread());
     if (job->driver->abort) {
+        job_unlock();
         job->driver->abort(job);
+        job_lock();
     }
 }
 
@@ -709,12 +732,15 @@ static void job_clean(Job *job)
 {
     assert(qemu_in_main_thread());
     if (job->driver->clean) {
+        job_unlock();
         job->driver->clean(job);
+        job_lock();
     }
 }
 
 static int job_finalize_single(Job *job)
 {
+    int job_ret;
     AioContext *ctx = job->aio_context;
 
     assert(job_is_completed(job));
@@ -734,7 +760,10 @@ static int job_finalize_single(Job *job)
     aio_context_release(ctx);
 
     if (job->cb) {
-        job->cb(job->opaque, job->ret);
+        job_ret = job->ret;
+        job_unlock();
+        job->cb(job->opaque, job_ret);
+        job_lock();
     }
 
     /* Emit events only if we actually started */
@@ -755,7 +784,9 @@ static void job_cancel_async(Job *job, bool force)
 {
     assert(qemu_in_main_thread());
     if (job->driver->cancel) {
+        job_unlock();
         force = job->driver->cancel(job, force);
+        job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
         force = true;
@@ -764,7 +795,9 @@ static void job_cancel_async(Job *job, bool force)
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
+            job_unlock();
             job->driver->user_resume(job);
+            job_lock();
         }
         job->user_paused = false;
         assert(job->pause_count > 0);
@@ -853,13 +886,17 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    int ret;
     AioContext *ctx = job->aio_context;
     assert(qemu_in_main_thread());
 
     if (job->ret == 0 && job->driver->prepare) {
+        job_unlock();
         aio_context_acquire(ctx);
-        job->ret = job->driver->prepare(job);
+        ret = job->driver->prepare(job);
         aio_context_release(ctx);
+        job_lock();
+        job->ret = ret;
         job_update_rc(job);
     }
 
@@ -905,6 +942,7 @@ static int job_transition_to_pending(Job *job)
 
 void job_transition_to_ready(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_state_transition(job, JOB_STATUS_READY);
     job_event_ready(job);
 }
@@ -954,6 +992,7 @@ static void job_exit(void *opaque)
     Job *job = (Job *)opaque;
     AioContext *ctx;
 
+    JOB_LOCK_GUARD();
     job_ref(job);
     aio_context_acquire(job->aio_context);
 
@@ -984,12 +1023,16 @@ static void job_exit(void *opaque)
 static void coroutine_fn job_co_entry(void *opaque)
 {
     Job *job = opaque;
+    int ret;
 
     assert(job && job->driver && job->driver->run);
     job_pause_point(job);
-    job->ret = job->driver->run(job, &job->err);
-    job->deferred_to_main_loop = true;
-    job->busy = true;
+    ret = job->driver->run(job, &job->err);
+    WITH_JOB_LOCK_GUARD() {
+        job->ret = ret;
+        job->deferred_to_main_loop = true;
+        job->busy = true;
+    }
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
@@ -1005,16 +1048,20 @@ static int job_pre_run(Job *job)
 
 void job_start(Job *job)
 {
-    assert(job && !job_started(job) && job->paused &&
-           job->driver && job->driver->run);
-    job->co = qemu_coroutine_create(job_co_entry, job);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job && !job_started(job) && job->paused &&
+            job->driver && job->driver->run);
+        job->co = qemu_coroutine_create(job_co_entry, job);
+    }
     if (job_pre_run(job)) {
         return;
     }
-    job->pause_count--;
-    job->busy = true;
-    job->paused = false;
-    job_state_transition(job, JOB_STATUS_RUNNING);
+    WITH_JOB_LOCK_GUARD() {
+        job->pause_count--;
+        job->busy = true;
+        job->paused = false;
+        job_state_transition(job, JOB_STATUS_RUNNING);
+    }
     aio_co_enter(job->aio_context, job->co);
 }
 
@@ -1042,7 +1089,7 @@ void job_cancel(Job *job, bool force)
             job_completed_txn_abort(job);
         }
     } else {
-        job_enter(job);
+        job_enter_cond(job, NULL);
     }
 }
 
@@ -1084,6 +1131,7 @@ void job_cancel_sync_all(void)
     Job *job;
     AioContext *aio_context;
 
+    JOB_LOCK_GUARD();
     while ((job = job_next(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
@@ -1111,7 +1159,9 @@ void job_complete(Job *job, Error **errp)
         return;
     }
 
+    job_unlock();
     job->driver->complete(job, errp);
+    job_lock();
 }
 
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
@@ -1130,8 +1180,10 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
         return -EBUSY;
     }
 
+    job_unlock();
     AIO_WAIT_WHILE(job->aio_context,
                    (job_enter(job), !job_is_completed(job)));
+    job_lock();
 
     ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
     job_unref(job);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f97bf7ca77..f935fa4ad5 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -134,8 +134,10 @@ void qmp_cont(Error **errp)
         blk_iostatus_reset(blk);
     }
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        block_job_iostatus_reset(job);
+    WITH_JOB_LOCK_GUARD() {
+        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+            block_job_iostatus_reset(job);
+        }
     }
 
     /* Continuing after completed migration. Images have been inactivated to
diff --git a/qemu-img.c b/qemu-img.c
index 6fe2466032..a805f6fe7a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -906,25 +906,30 @@ static void run_block_job(BlockJob *job, Error **errp)
     int ret = 0;
 
     aio_context_acquire(aio_context);
-    job_ref(&job->job);
-    do {
-        float progress = 0.0f;
-        aio_poll(aio_context, true);
+    WITH_JOB_LOCK_GUARD() {
+        job_ref(&job->job);
+        do {
+            float progress = 0.0f;
+            job_unlock();
+            aio_poll(aio_context, true);
+
+            progress_get_snapshot(&job->job.progress, &progress_current,
+                                &progress_total);
+            if (progress_total) {
+                progress = (float)progress_current / progress_total * 100.f;
+            }
+            qemu_progress_print(progress, 0);
+            job_lock();
+        } while (!job_is_ready(&job->job) &&
+                !job_is_completed(&job->job));
 
-        progress_get_snapshot(&job->job.progress, &progress_current,
-                              &progress_total);
-        if (progress_total) {
-            progress = (float)progress_current / progress_total * 100.f;
+        if (!job_is_completed(&job->job)) {
+            ret = job_complete_sync(&job->job, errp);
+        } else {
+            ret = job->job.ret;
         }
-        qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
-
-    if (!job_is_completed(&job->job)) {
-        ret = job_complete_sync(&job->job, errp);
-    } else {
-        ret = job->job.ret;
+        job_unref(&job->job);
     }
-    job_unref(&job->job);
     aio_context_release(aio_context);
 
     /* publish completion progress only when success */
@@ -1077,7 +1082,9 @@ static int img_commit(int argc, char **argv)
         bdrv_ref(bs);
     }
 
-    job = block_job_get("commit");
+    WITH_JOB_LOCK_GUARD() {
+        job = block_job_get("commit");
+    }
     assert(job);
     run_block_job(job, &local_err);
     if (local_err) {
-- 
2.31.1


