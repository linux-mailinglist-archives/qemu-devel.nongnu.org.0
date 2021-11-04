Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021564455E6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:59:55 +0100 (CET)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieDa-0004T0-5d
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8G-0003aC-DI
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8A-0006xF-H0
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2R9cjYVWSNgOQdAXl7OtwjBDdECT+/2n1YfuZGY0PAU=;
 b=eDF8pDPeA+vcL8cT4e0s7b3NuzGHb4TxQO6qGg0zaBkdCkJazKr8hRQMy4gx1np8n7SK9X
 Fo3GT/vqp1g3puY0Wbk5pZ3CL6CcOKlFU0UJYtzamC2SMAwc8iy5/VIyEGg+GgEv6jNFVm
 Ovhre1u1n5/VYHb2aUu7F6kqTo6eV2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-37sij-guNYm881n35-y9KQ-1; Thu, 04 Nov 2021 10:54:13 -0400
X-MC-Unique: 37sij-guNYm881n35-y9KQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED468066F6;
 Thu,  4 Nov 2021 14:54:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35BD26418A;
 Thu,  4 Nov 2021 14:54:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 10/14] jobs: protect jobs with job_lock/unlock
Date: Thu,  4 Nov 2021 10:53:30 -0400
Message-Id: <20211104145334.1346363-11-eesposit@redhat.com>
In-Reply-To: <20211104145334.1346363-1-eesposit@redhat.com>
References: <20211104145334.1346363-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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

job_{lock/unlock} is independent from _job_{lock/unlock}.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c             |   6 ++
 block/replication.c |   4 +
 blockdev.c          |  13 +++
 blockjob.c          |  37 +++++++-
 job-qmp.c           |   4 +
 job.c               | 201 ++++++++++++++++++++++++++++++++++----------
 monitor/qmp-cmds.c  |   2 +
 qemu-img.c          |   8 +-
 8 files changed, 229 insertions(+), 46 deletions(-)

diff --git a/block.c b/block.c
index da80e89ad4..a6dcd9eb36 100644
--- a/block.c
+++ b/block.c
@@ -4826,7 +4826,9 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
+    job_lock();
     assert(job_next(NULL) == NULL);
+    job_unlock();
     assert(qemu_in_main_thread());
 
     /* Drop references from requests still in flight, such as canceled block
@@ -5965,6 +5967,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         }
     }
 
+    job_lock();
+
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         GSList *el;
 
@@ -5975,6 +5979,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         }
     }
 
+    job_unlock();
+
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         xdbg_graph_add_node(gr, bs, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_DRIVER,
                            bs->node_name);
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..0f487cc215 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
+        job_lock();
         job_cancel_sync(commit_job, false);
+        job_unlock();
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
@@ -726,7 +728,9 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
+            job_lock();
             job_cancel_sync(&s->backup_job->job, true);
+            job_unlock();
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index 67b55eec11..c5a835d9ed 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -150,6 +150,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
         return;
     }
 
+    job_lock();
+
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
             AioContext *aio_context = job->job.aio_context;
@@ -161,6 +163,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
         }
     }
 
+    job_unlock();
+
     dinfo->auto_del = 1;
 }
 
@@ -1844,7 +1848,9 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
+        job_lock();
         job_cancel_sync(&state->job->job, true);
+        job_unlock();
 
         aio_context_release(aio_context);
     }
@@ -1945,7 +1951,9 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
+        job_lock();
         job_cancel_sync(&state->job->job, true);
+        job_unlock();
 
         aio_context_release(aio_context);
     }
@@ -2394,7 +2402,9 @@ exit:
     if (!has_props) {
         qapi_free_TransactionProperties(props);
     }
+    job_lock();
     job_txn_unref(block_job_txn);
+    job_unlock();
 }
 
 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
@@ -3717,6 +3727,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;
 
+    job_lock();
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
 
@@ -3726,10 +3737,12 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
         value = block_job_query(job, errp);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
+            job_unlock();
             return NULL;
         }
         QAPI_LIST_APPEND(tail, value);
     }
+    job_unlock();
 
     return head;
 }
diff --git a/blockjob.c b/blockjob.c
index 53c1e9c406..dcc13dc336 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -88,19 +88,25 @@ static char *child_job_get_parent_desc(BdrvChild *c)
 static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
+    job_lock();
     job_pause(&job->job);
+    job_unlock();
 }
 
 static bool child_job_drained_poll(BdrvChild *c)
 {
     BlockJob *bjob = c->opaque;
     Job *job = &bjob->job;
+    bool inactive_incomplete;
     const BlockJobDriver *drv = block_job_driver(bjob);
 
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job->busy || job_is_completed(job)) {
+    job_lock();
+    inactive_incomplete = !job->busy || job_is_completed(job);
+    job_unlock();
+    if (inactive_incomplete) {
         return false;
     }
 
@@ -116,7 +122,9 @@ static bool child_job_drained_poll(BdrvChild *c)
 static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
+    job_lock();
     job_resume(&job->job);
+    job_unlock();
 }
 
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
@@ -236,9 +244,16 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
+/* Called with job_mutex lock held. */
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
@@ -257,6 +272,7 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
+/* Called with job_mutex held. May temporarly release the lock. */
 bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
@@ -278,7 +294,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     job->speed = speed;
 
     if (drv->set_speed) {
+        job_unlock();
         drv->set_speed(job, speed);
+        job_lock();
     }
 
     if (speed && speed <= old_speed) {
@@ -341,6 +359,7 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_cancelled(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -360,6 +379,7 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_completed(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -386,6 +406,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_pending(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -398,6 +419,7 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_ready(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -458,6 +480,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job->ready_notifier.notify = block_job_event_ready;
     job->idle_notifier.notify = block_job_on_idle;
 
+    job_lock();
     notifier_list_add(&job->job.on_finalize_cancelled,
                       &job->finalize_cancelled_notifier);
     notifier_list_add(&job->job.on_finalize_completed,
@@ -465,6 +488,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     notifier_list_add(&job->job.on_pending, &job->pending_notifier);
     notifier_list_add(&job->job.on_ready, &job->ready_notifier);
     notifier_list_add(&job->job.on_idle, &job->idle_notifier);
+    job_unlock();
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
@@ -477,14 +501,19 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     blk_set_disable_request_queuing(blk, true);
     blk_set_allow_aio_context_change(blk, true);
 
+    job_lock();
     if (!block_job_set_speed(job, speed, errp)) {
-        job_early_fail(&job->job);
+        job_early_fail_locked(&job->job);
+        job_unlock();
         return NULL;
     }
+    job_unlock();
+
 
     return job;
 }
 
+/* Called with job_mutex lock held. */
 void block_job_iostatus_reset(BlockJob *job)
 {
     assert(qemu_in_main_thread());
@@ -499,7 +528,9 @@ void block_job_user_resume(Job *job)
 {
     assert(qemu_in_main_thread());
     BlockJob *bjob = container_of(job, BlockJob, job);
+    job_lock();
     block_job_iostatus_reset(bjob);
+    job_unlock();
 }
 
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
@@ -532,11 +563,13 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         action);
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
+        job_lock();
         if (!job->job.user_paused) {
             job_pause(&job->job);
             /* make the pause user visible, which will be resumed from QMP. */
             job->job.user_paused = true;
         }
+        job_unlock();
         block_job_iostatus_set_err(job, error);
     }
     return action;
diff --git a/job-qmp.c b/job-qmp.c
index a6774aaaa5..a355dc2954 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -171,6 +171,8 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
+    job_lock();
+
     for (job = job_next(NULL); job; job = job_next(job)) {
         JobInfo *value;
 
@@ -180,10 +182,12 @@ JobInfoList *qmp_query_jobs(Error **errp)
         value = job_query_single(job, errp);
         if (!value) {
             qapi_free_JobInfoList(head);
+            job_unlock();
             return NULL;
         }
         QAPI_LIST_APPEND(tail, value);
     }
+    job_unlock();
 
     return head;
 }
diff --git a/job.c b/job.c
index 7856fa734b..5efbf38a72 100644
--- a/job.c
+++ b/job.c
@@ -55,6 +55,7 @@
  */
 static QemuMutex job_mutex;
 
+/* Protected by job_mutex */
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -134,6 +135,7 @@ JobTxn *job_txn_new(void)
     return txn;
 }
 
+/* Called with job_mutex held. */
 static void job_txn_ref(JobTxn *txn)
 {
     txn->refcnt++;
@@ -159,6 +161,7 @@ void job_txn_add_job(JobTxn *txn, Job *job)
     job_txn_ref(txn);
 }
 
+/* Called with job_mutex held. */
 static void job_txn_del_job(Job *job)
 {
     if (job->txn) {
@@ -168,6 +171,7 @@ static void job_txn_del_job(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static int job_txn_apply(Job *job, int fn(Job *))
 {
     Job *other_job, *next;
@@ -204,6 +208,7 @@ bool job_is_internal(Job *job)
     return (job->id == NULL);
 }
 
+/* Called with job_mutex held. */
 static void job_state_transition(Job *job, JobStatus s1)
 {
     JobStatus s0 = job->status;
@@ -371,6 +376,7 @@ static bool job_started(Job *job)
     return job->co;
 }
 
+/* Called with job_mutex held. */
 static bool job_should_pause(Job *job)
 {
     return job->pause_count > 0;
@@ -397,6 +403,7 @@ Job *job_get(const char *id)
     return NULL;
 }
 
+/* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
     Job *job = opaque;
@@ -404,12 +411,15 @@ static void job_sleep_timer_cb(void *opaque)
     job_enter(job);
 }
 
+/* Called with job_mutex *not* held. */
 void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  AioContext *ctx, int flags, BlockCompletionFunc *cb,
                  void *opaque, Error **errp)
 {
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     if (job_id) {
         if (flags & JOB_INTERNAL) {
             error_setg(errp, "Cannot specify job ID for internal job");
@@ -483,7 +493,9 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            job_unlock();
             job->driver->free(job);
+            job_lock();
         }
 
         QLIST_REMOVE(job, job_list);
@@ -495,16 +507,19 @@ void job_unref(Job *job)
     }
 }
 
+/* Progress API is thread safe */
 void job_progress_update(Job *job, uint64_t done)
 {
     progress_work_done(&job->progress, done);
 }
 
+/* Progress API is thread safe */
 void job_progress_set_remaining(Job *job, uint64_t remaining)
 {
     progress_set_remaining(&job->progress, remaining);
 }
 
+/* Progress API is thread safe */
 void job_progress_increase_remaining(Job *job, uint64_t delta)
 {
     progress_increase_remaining(&job->progress, delta);
@@ -528,16 +543,19 @@ static void job_event_completed(Job *job)
     notifier_list_notify(&job->on_finalize_completed, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_pending(Job *job)
 {
     notifier_list_notify(&job->on_pending, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_ready(Job *job)
 {
     notifier_list_notify(&job->on_ready, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_idle(Job *job)
 {
     notifier_list_notify(&job->on_idle, job);
@@ -567,11 +585,15 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
     timer_del(&job->sleep_timer);
     job->busy = true;
     _job_unlock();
+    job_unlock();
     aio_co_enter(job->aio_context, job->co);
+    job_lock();
 }
 
+/* Called with job_mutex *not* held. */
 void job_enter(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_enter_cond(job, NULL);
 }
 
@@ -580,7 +602,10 @@ void job_enter(Job *job)
  * is allowed and cancels the timer.
  *
  * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
- * called explicitly. */
+ * called explicitly.
+ *
+ * Called with job_mutex held, but releases it temporarly.
+ */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
     _job_lock();
@@ -590,28 +615,39 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     job->busy = false;
     job_event_idle(job);
     _job_unlock();
+    job_unlock();
     qemu_coroutine_yield();
+    job_lock();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
 void coroutine_fn job_pause_point(Job *job)
 {
     assert(job && job_started(job));
 
+    job_lock();
     if (!job_should_pause(job)) {
+        job_unlock();
         return;
     }
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
+        job_unlock();
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
@@ -621,45 +657,58 @@ void coroutine_fn job_pause_point(Job *job)
         job->paused = false;
         job_state_transition(job, status);
     }
+    job_unlock();
 
     if (job->driver->resume) {
         job->driver->resume(job);
     }
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
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
+        if (job_is_cancelled_locked(job)) {
+            return;
+        }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, -1);
+        if (!job_should_pause(job)) {
+            job_do_yield(job, -1);
+        }
     }
 
     job_pause_point(job);
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
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
+        if (job_is_cancelled_locked(job)) {
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
@@ -669,7 +718,7 @@ void job_pause(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter(job);
+        job_enter_cond(job, NULL);
     }
 }
 
@@ -723,12 +772,15 @@ void job_user_resume(Job *job, Error **errp)
         return;
     }
     if (job->driver->user_resume) {
+        job_unlock();
         job->driver->user_resume(job);
+        job_lock();
     }
     job->user_paused = false;
     job_resume(job);
 }
 
+/* Called with job_mutex held. */
 static void job_do_dismiss(Job *job)
 {
     assert(job);
@@ -767,6 +819,7 @@ void job_early_fail(Job *job)
     job_early_fail_locked(job);
 }
 
+/* Called with job_mutex held. */
 static void job_conclude(Job *job)
 {
     job_state_transition(job, JOB_STATUS_CONCLUDED);
@@ -775,9 +828,10 @@ static void job_conclude(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static void job_update_rc(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
@@ -788,34 +842,45 @@ static void job_update_rc(Job *job)
     }
 }
 
+/* Called with job_mutex held, but releases it temporarly */
 static void job_commit(Job *job)
 {
     assert(!job->ret);
     assert(qemu_in_main_thread());
     if (job->driver->commit) {
+        job_unlock();
         job->driver->commit(job);
+        job_lock();
     }
 }
 
+/* Called with job_mutex held, but releases it temporarly */
 static void job_abort(Job *job)
 {
     assert(job->ret);
     assert(qemu_in_main_thread());
     if (job->driver->abort) {
+        job_unlock();
         job->driver->abort(job);
+        job_lock();
     }
 }
 
+/* Called with job_mutex held, but releases it temporarly */
 static void job_clean(Job *job)
 {
     assert(qemu_in_main_thread());
     if (job->driver->clean) {
+        job_unlock();
         job->driver->clean(job);
+        job_lock();
     }
 }
 
+/* Called with job_mutex held, but releases it temporarly. */
 static int job_finalize_single(Job *job)
 {
+    int job_ret;
     AioContext *ctx = job->aio_context;
 
     assert(job_is_completed(job));
@@ -835,12 +900,15 @@ static int job_finalize_single(Job *job)
     aio_context_release(ctx);
 
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
@@ -852,11 +920,14 @@ static int job_finalize_single(Job *job)
     return 0;
 }
 
+/* Called with job_mutex held, but releases it temporarly. */
 static void job_cancel_async(Job *job, bool force)
 {
     assert(qemu_in_main_thread());
     if (job->driver->cancel) {
+        job_unlock();
         force = job->driver->cancel(job, force);
+        job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
         force = true;
@@ -865,7 +936,9 @@ static void job_cancel_async(Job *job, bool force)
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
+            job_unlock();
             job->driver->user_resume(job);
+            job_lock();
         }
         job->user_paused = false;
         assert(job->pause_count > 0);
@@ -886,6 +959,7 @@ static void job_cancel_async(Job *job, bool force)
     }
 }
 
+/* Called with job_mutex held. */
 static void job_completed_txn_abort(Job *job)
 {
     AioContext *ctx;
@@ -935,7 +1009,7 @@ static void job_completed_txn_abort(Job *job)
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
-            assert(job_cancel_requested(other_job));
+            assert(job_cancel_requested_locked(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
@@ -952,26 +1026,33 @@ static void job_completed_txn_abort(Job *job)
     job_txn_unref(txn);
 }
 
+/* Called with job_mutex held, but releases it temporarly. */
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
 
     return job->ret;
 }
 
+/* Called with job_mutex held. */
 static int job_needs_finalize(Job *job)
 {
     return !job->auto_finalize;
 }
 
+/* Called with job_mutex held. */
 static void job_do_finalize(Job *job)
 {
     int rc;
@@ -995,6 +1076,7 @@ void job_finalize(Job *job, Error **errp)
     job_do_finalize(job);
 }
 
+/* Called with job_mutex held. */
 static int job_transition_to_pending(Job *job)
 {
     job_state_transition(job, JOB_STATUS_PENDING);
@@ -1004,12 +1086,15 @@ static int job_transition_to_pending(Job *job)
     return 0;
 }
 
+/* Called with job_mutex *not* held. */
 void job_transition_to_ready(Job *job)
 {
+    JOB_LOCK_GUARD();
     job_state_transition(job, JOB_STATUS_READY);
     job_event_ready(job);
 }
 
+/* Called with job_mutex held. */
 static void job_completed_txn_success(Job *job)
 {
     JobTxn *txn = job->txn;
@@ -1036,6 +1121,7 @@ static void job_completed_txn_success(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static void job_completed(Job *job)
 {
     assert(job && job->txn && !job_is_completed(job));
@@ -1049,12 +1135,16 @@ static void job_completed(Job *job)
     }
 }
 
-/** Useful only as a type shim for aio_bh_schedule_oneshot. */
+/**
+ * Useful only as a type shim for aio_bh_schedule_oneshot.
+ *  Called with job_mutex *not* held.
+ */
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
     AioContext *ctx;
 
+    JOB_LOCK_GUARD();
     job_ref(job);
     aio_context_acquire(job->aio_context);
 
@@ -1081,28 +1171,36 @@ static void job_exit(void *opaque)
 /**
  * All jobs must allow a pause point before entering their job proper. This
  * ensures that jobs can be paused prior to being started, then resumed later.
+ *
+ * Called with job_mutex *not* held.
  */
 static void coroutine_fn job_co_entry(void *opaque)
 {
     Job *job = opaque;
-
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
 
+/* Called with job_mutex *not* held. */
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
 
@@ -1126,11 +1224,11 @@ void job_cancel(Job *job, bool force)
          * choose to call job_is_cancelled() to show that we invoke
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
 
@@ -1142,9 +1240,13 @@ void job_user_cancel(Job *job, bool force, Error **errp)
     job_cancel(job, force);
 }
 
-/* A wrapper around job_cancel() taking an Error ** parameter so it may be
+/*
+ * A wrapper around job_cancel() taking an Error ** parameter so it may be
  * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there. */
+ * pointer casts there.
+ *
+ * Called with job_mutex held.
+ */
 static void job_cancel_err(Job *job, Error **errp)
 {
     job_cancel(job, false);
@@ -1152,6 +1254,8 @@ static void job_cancel_err(Job *job, Error **errp)
 
 /**
  * Same as job_cancel_err(), but force-cancel.
+ *
+ * Called with job_mutex held.
  */
 static void job_force_cancel_err(Job *job, Error **errp)
 {
@@ -1167,11 +1271,17 @@ int job_cancel_sync(Job *job, bool force)
     }
 }
 
+/*
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding lock-unlock
+ * patterns in the caller.
+ */
 void job_cancel_sync_all(void)
 {
     Job *job;
     AioContext *aio_context;
 
+    JOB_LOCK_GUARD();
     while ((job = job_next(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
@@ -1193,13 +1303,15 @@ void job_complete(Job *job, Error **errp)
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
@@ -1218,10 +1330,13 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
         return -EBUSY;
     }
 
+    job_unlock();
     AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed(job)));
+                   (job_enter(job), !job_is_completed_unlocked(job)));
+    job_lock();
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
+    ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
+           -ECANCELED : job->ret;
     job_unref(job);
     return ret;
 }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..a0b023cac1 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -129,9 +129,11 @@ void qmp_cont(Error **errp)
         blk_iostatus_reset(blk);
     }
 
+    job_lock();
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         block_job_iostatus_reset(job);
     }
+    job_unlock();
 
     /* Continuing after completed migration. Images have been inactivated to
      * allow the destination to take control. Need to get control back now.
diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..170c65b1b7 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -906,9 +906,11 @@ static void run_block_job(BlockJob *job, Error **errp)
     int ret = 0;
 
     aio_context_acquire(aio_context);
+    job_lock();
     job_ref(&job->job);
     do {
         float progress = 0.0f;
+        job_unlock();
         aio_poll(aio_context, true);
 
         progress_get_snapshot(&job->job.progress, &progress_current,
@@ -917,7 +919,8 @@ static void run_block_job(BlockJob *job, Error **errp)
             progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
+        job_lock();
+    } while (!job_is_ready_locked(&job->job) && !job_is_completed(&job->job));
 
     if (!job_is_completed(&job->job)) {
         ret = job_complete_sync(&job->job, errp);
@@ -925,6 +928,7 @@ static void run_block_job(BlockJob *job, Error **errp)
         ret = job->job.ret;
     }
     job_unref(&job->job);
+    job_unlock();
     aio_context_release(aio_context);
 
     /* publish completion progress only when success */
@@ -1077,7 +1081,9 @@ static int img_commit(int argc, char **argv)
         bdrv_ref(bs);
     }
 
+    job_lock();
     job = block_job_get("commit");
+    job_unlock();
     assert(job);
     run_block_job(job, &local_err);
     if (local_err) {
-- 
2.27.0


