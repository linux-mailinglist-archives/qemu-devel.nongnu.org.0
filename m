Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E44D8712
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:38:41 +0100 (CET)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlqK-00078i-Fa
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:38:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt5-0006iS-2o
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksx-0001b6-KK
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uvjh7yXdaQ/URZN0Box/zpO9HCa237N5xEx3E3TU+lY=;
 b=OKBORo3UOnUU967EEe8tJnA/Y/qNK7dekceYYISG7kpSttkd7wibfAfZm3JowgGGPwk4TY
 kqhZQANO9+x1HfoZhQr3YHaF/jLlT/7z4lHrCZ5fJFrw/TBzRgr6NNjNyESG8/XyunSrD7
 V+4fdpxW/qLyqGWFMONdlSapF7Azm9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-PDSE_DQ8PcG9IPXW-G4mGA-1; Mon, 14 Mar 2022 09:37:15 -0400
X-MC-Unique: PDSE_DQ8PcG9IPXW-G4mGA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 413FA80348D;
 Mon, 14 Mar 2022 13:37:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD93403144;
 Mon, 14 Mar 2022 13:37:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 06/18] jobs: protect jobs with job_lock/unlock
Date: Mon, 14 Mar 2022 09:36:55 -0400
Message-Id: <20220314133707.2206082-7-eesposit@redhat.com>
In-Reply-To: <20220314133707.2206082-1-eesposit@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
following the comments  in job.h and requirements of job-monitor
(like the functions in job-qmp.c, assume lock is held) and
job-driver (like in mirror.c and all other JobDriver, lock is not held).

Use the _locked helpers introduced before to differentiate
between functions called with and without job_mutex.
This only applies to function that are called under both
cases, all the others will be renamed later.

job_{lock/unlock} is independent from real_job_{lock/unlock}.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c             |  18 ++++---
 block/replication.c |   8 ++-
 blockdev.c          |  17 ++++--
 blockjob.c          |  56 +++++++++++++-------
 job-qmp.c           |   2 +
 job.c               | 125 +++++++++++++++++++++++++++++++-------------
 monitor/qmp-cmds.c  |   6 ++-
 qemu-img.c          |  41 +++++++++------
 8 files changed, 187 insertions(+), 86 deletions(-)

diff --git a/block.c b/block.c
index 718e4cae8b..5dc46fde11 100644
--- a/block.c
+++ b/block.c
@@ -4978,7 +4978,9 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
-    assert(job_next(NULL) == NULL);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job_next(NULL) == NULL);
+    }
     GLOBAL_STATE_CODE();
 
     /* Drop references from requests still in flight, such as canceled block
@@ -6165,13 +6167,15 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
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
index e46e831212..8722e5d4b9 100644
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
@@ -3720,6 +3729,8 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;
 
+    JOB_LOCK_GUARD();
+
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
         AioContext *aio_context;
diff --git a/blockjob.c b/blockjob.c
index 4868453d74..d726efe679 100644
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
+        if (!job->busy || job_is_completed_locked(job)) {
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
@@ -292,7 +298,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     job->speed = speed;
 
     if (drv->set_speed) {
+        job_unlock();
         drv->set_speed(job, speed);
+        job_lock();
     }
 
     if (speed && speed <= old_speed) {
@@ -335,7 +343,7 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     info->len       = progress_total;
     info->speed     = job->speed;
     info->io_status = job->iostatus;
-    info->ready     = job_is_ready(&job->job),
+    info->ready     = job_is_ready_locked(&job->job),
     info->status    = job->job.status;
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
@@ -469,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
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
@@ -487,7 +497,10 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    if (!block_job_set_speed(job, speed, errp)) {
+    WITH_JOB_LOCK_GUARD() {
+        ret = block_job_set_speed(job, speed, errp);
+    }
+    if (!ret) {
         goto fail;
     }
 
@@ -512,7 +525,9 @@ void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
     GLOBAL_STATE_CODE();
-    block_job_iostatus_reset(bjob);
+    WITH_JOB_LOCK_GUARD() {
+        block_job_iostatus_reset(bjob);
+    }
 }
 
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
@@ -546,10 +561,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
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
index 829a28aa70..270df1eb7e 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -171,6 +171,8 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     for (job = job_next(NULL); job; job = job_next(job)) {
         JobInfo *value;
         AioContext *aio_context;
diff --git a/job.c b/job.c
index 853f42050e..3e9e632a18 100644
--- a/job.c
+++ b/job.c
@@ -361,6 +361,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
 {
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     if (job_id) {
         if (flags & JOB_INTERNAL) {
             error_setg(errp, "Cannot specify job ID for internal job");
@@ -435,7 +437,9 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            job_unlock();
             job->driver->free(job);
+            job_lock();
         }
 
         QLIST_REMOVE(job, job_list);
@@ -522,6 +526,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
 
 void job_enter(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_enter_cond(job, NULL);
 }
 
@@ -540,7 +545,9 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     job->busy = false;
     job_event_idle(job);
     real_job_unlock();
+    job_unlock();
     qemu_coroutine_yield();
+    job_lock();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
     assert(job->busy);
@@ -554,15 +561,17 @@ static void coroutine_fn job_pause_point_locked(Job *job)
     if (!job_should_pause(job)) {
         return;
     }
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
         return;
     }
 
     if (job->driver->pause) {
+        job_unlock();
         job->driver->pause(job);
+        job_lock();
     }
 
-    if (job_should_pause(job) && !job_is_cancelled(job)) {
+    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
         JobStatus status = job->status;
         job_state_transition(job, status == JOB_STATUS_READY
                                   ? JOB_STATUS_STANDBY
@@ -574,7 +583,9 @@ static void coroutine_fn job_pause_point_locked(Job *job)
     }
 
     if (job->driver->resume) {
+        job_unlock();
         job->driver->resume(job);
+        job_lock();
     }
 }
 
@@ -586,10 +597,11 @@ void coroutine_fn job_pause_point(Job *job)
 
 void job_yield(Job *job)
 {
+    JOB_LOCK_GUARD();
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
         return;
     }
 
@@ -597,15 +609,16 @@ void job_yield(Job *job)
         job_do_yield(job, -1);
     }
 
-    job_pause_point(job);
+    job_pause_point_locked(job);
 }
 
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
+    JOB_LOCK_GUARD();
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
         return;
     }
 
@@ -613,10 +626,10 @@ void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
         job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
     }
 
-    job_pause_point(job);
+    job_pause_point_locked(job);
 }
 
-/* Assumes the block_job_mutex is held */
+/* Assumes the job_mutex is held */
 static bool job_timer_not_pending(Job *job)
 {
     return !timer_pending(&job->sleep_timer);
@@ -626,7 +639,7 @@ void job_pause(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter(job);
+        job_enter_cond(job, NULL);
     }
 }
 
@@ -672,7 +685,9 @@ void job_user_resume(Job *job, Error **errp)
         return;
     }
     if (job->driver->user_resume) {
+        job_unlock();
         job->driver->user_resume(job);
+        job_lock();
     }
     job->user_paused = false;
     job_resume(job);
@@ -706,6 +721,7 @@ void job_dismiss(Job **jobptr, Error **errp)
 
 void job_early_fail(Job *job)
 {
+    JOB_LOCK_GUARD();
     assert(job->status == JOB_STATUS_CREATED);
     job_do_dismiss(job);
 }
@@ -720,7 +736,7 @@ static void job_conclude(Job *job)
 
 static void job_update_rc(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
@@ -736,7 +752,9 @@ static void job_commit(Job *job)
     assert(!job->ret);
     GLOBAL_STATE_CODE();
     if (job->driver->commit) {
+        job_unlock();
         job->driver->commit(job);
+        job_lock();
     }
 }
 
@@ -745,7 +763,9 @@ static void job_abort(Job *job)
     assert(job->ret);
     GLOBAL_STATE_CODE();
     if (job->driver->abort) {
+        job_unlock();
         job->driver->abort(job);
+        job_lock();
     }
 }
 
@@ -753,13 +773,17 @@ static void job_clean(Job *job)
 {
     GLOBAL_STATE_CODE();
     if (job->driver->clean) {
+        job_unlock();
         job->driver->clean(job);
+        job_lock();
     }
 }
 
 static int job_finalize_single(Job *job)
 {
-    assert(job_is_completed(job));
+    int job_ret;
+
+    assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
@@ -772,12 +796,15 @@ static int job_finalize_single(Job *job)
     job_clean(job);
 
     if (job->cb) {
-        job->cb(job->opaque, job->ret);
+        job_ret = job->ret;
+        job_unlock();
+        job->cb(job->opaque, job_ret);
+        job_lock();
     }
 
     /* Emit events only if we actually started */
     if (job_started(job)) {
-        if (job_is_cancelled(job)) {
+        if (job_is_cancelled_locked(job)) {
             job_event_cancelled(job);
         } else {
             job_event_completed(job);
@@ -793,7 +820,9 @@ static void job_cancel_async(Job *job, bool force)
 {
     GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
+        job_unlock();
         force = job->driver->cancel(job, force);
+        job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
         force = true;
@@ -802,7 +831,9 @@ static void job_cancel_async(Job *job, bool force)
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
+            job_unlock();
             job->driver->user_resume(job);
+            job_lock();
         }
         job->user_paused = false;
         assert(job->pause_count > 0);
@@ -871,8 +902,8 @@ static void job_completed_txn_abort(Job *job)
          */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
-        if (!job_is_completed(other_job)) {
-            assert(job_cancel_requested(other_job));
+        if (!job_is_completed_locked(other_job)) {
+            assert(job_cancel_requested_locked(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
@@ -891,9 +922,14 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    int ret;
+
     GLOBAL_STATE_CODE();
     if (job->ret == 0 && job->driver->prepare) {
-        job->ret = job->driver->prepare(job);
+        job_unlock();
+        ret = job->driver->prepare(job);
+        job_lock();
+        job->ret = ret;
         job_update_rc(job);
     }
     return job->ret;
@@ -938,6 +974,7 @@ static int job_transition_to_pending(Job *job)
 
 void job_transition_to_ready(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_state_transition(job, JOB_STATUS_READY);
     job_event_ready(job);
 }
@@ -954,7 +991,7 @@ static void job_completed_txn_success(Job *job)
      * txn.
      */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             return;
         }
         assert(other_job->ret == 0);
@@ -970,7 +1007,7 @@ static void job_completed_txn_success(Job *job)
 
 static void job_completed(Job *job)
 {
-    assert(job && job->txn && !job_is_completed(job));
+    assert(job && job->txn && !job_is_completed_locked(job));
 
     job_update_rc(job);
     trace_job_completed(job, job->ret);
@@ -1021,25 +1058,33 @@ static void job_exit(void *opaque)
 static void coroutine_fn job_co_entry(void *opaque)
 {
     Job *job = opaque;
+    int ret;
 
     assert(job && job->driver && job->driver->run);
-    assert(job->aio_context == qemu_get_current_aio_context());
-    job_pause_point(job);
-    job->ret = job->driver->run(job, &job->err);
-    job->deferred_to_main_loop = true;
-    job->busy = true;
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->aio_context == qemu_get_current_aio_context());
+        job_pause_point_locked(job);
+    }
+    ret = job->driver->run(job, &job->err);
+    WITH_JOB_LOCK_GUARD() {
+        job->ret = ret;
+        job->deferred_to_main_loop = true;
+        job->busy = true;
+    }
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
 void job_start(Job *job)
 {
-    assert(job && !job_started(job) && job->paused &&
-           job->driver && job->driver->run);
-    job->co = qemu_coroutine_create(job_co_entry, job);
-    job->pause_count--;
-    job->busy = true;
-    job->paused = false;
-    job_state_transition(job, JOB_STATUS_RUNNING);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job && !job_started(job) && job->paused &&
+            job->driver && job->driver->run);
+        job->co = qemu_coroutine_create(job_co_entry, job);
+        job->pause_count--;
+        job->busy = true;
+        job->paused = false;
+        job_state_transition(job, JOB_STATUS_RUNNING);
+    }
     aio_co_enter(job->aio_context, job->co);
 }
 
@@ -1057,17 +1102,17 @@ void job_cancel(Job *job, bool force)
          * job_cancel_async() ignores soft-cancel requests for jobs
          * that are already done (i.e. deferred to the main loop).  We
          * have to check again whether the job is really cancelled.
-         * (job_cancel_requested() and job_is_cancelled() are equivalent
-         * here, because job_cancel_async() will make soft-cancel
-         * requests no-ops when deferred_to_main_loop is true.  We
-         * choose to call job_is_cancelled() to show that we invoke
+         * (job_cancel_requested_locked() and job_is_cancelled_locked()
+         * are equivalent here, because job_cancel_async() will
+         * make soft-cancel requests no-ops when deferred_to_main_loop is true.
+         * We choose to call job_is_cancelled_locked() to show that we invoke
          * job_completed_txn_abort() only for force-cancelled jobs.)
          */
-        if (job_is_cancelled(job)) {
+        if (job_is_cancelled_locked(job)) {
             job_completed_txn_abort(job);
         }
     } else {
-        job_enter(job);
+        job_enter_cond(job, NULL);
     }
 }
 
@@ -1109,6 +1154,7 @@ void job_cancel_sync_all(void)
     Job *job;
     AioContext *aio_context;
 
+    JOB_LOCK_GUARD();
     while ((job = job_next(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
@@ -1130,13 +1176,15 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_cancel_requested(job) || !job->driver->complete) {
+    if (job_cancel_requested_locked(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
     }
 
+    job_unlock();
     job->driver->complete(job, errp);
+    job_lock();
 }
 
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
@@ -1155,10 +1203,13 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
         return -EBUSY;
     }
 
+    job_unlock();
     AIO_WAIT_WHILE(job->aio_context,
                    (job_enter(job), !job_is_completed(job)));
+    job_lock();
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
+    ret = (job_is_cancelled_locked(job) && job->ret == 0)
+          ? -ECANCELED : job->ret;
     job_unref(job);
     return ret;
 }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index ad82c275c4..2bb41a8a41 100644
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
index 6fe2466032..320d82b42a 100644
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
+        } while (!job_is_ready_locked(&job->job) &&
+                 !job_is_completed_locked(&job->job));
 
-        progress_get_snapshot(&job->job.progress, &progress_current,
-                              &progress_total);
-        if (progress_total) {
-            progress = (float)progress_current / progress_total * 100.f;
+        if (!job_is_completed_locked(&job->job)) {
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


