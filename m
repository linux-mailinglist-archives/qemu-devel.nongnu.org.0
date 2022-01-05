Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C480F48549F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:33:10 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57Lh-0000A3-Tm
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:33:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sk-0000Ht-Dq
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sb-0007NZ-6s
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7YKvrBZTPTQ+wpenx5UiAxDXXIWRIJIZ0rAV7So16E=;
 b=P2h2MucocZ+x+hOIG7YKhSrhvx2D1UGkZdsXPoE1oenJWNI8jZL8GiNatlSQdX2OCVRpxb
 bmJGR3J3sKwhqsTlMVzI5nAyhOb3rAXmAttpt5RvGLaoVvGQOHI1BaWdpb+i3XDb8TopEH
 e6amvXYzWUCmWfj/6EzA5byKslKultE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-p8GXoTSqPbGRFYbvPz-9og-1; Wed, 05 Jan 2022 09:03:01 -0500
X-MC-Unique: p8GXoTSqPbGRFYbvPz-9og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6128A8042A2;
 Wed,  5 Jan 2022 14:02:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AFD92B4B3;
 Wed,  5 Jan 2022 14:02:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 11/16] jobs: document all static functions and add
 _locked() suffix
Date: Wed,  5 Jan 2022 09:02:03 -0500
Message-Id: <20220105140208.365608-12-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Now that we added the job_lock/unlock pairs, we can also
rename all static functions in job.c that are called with
the job mutex held as _locked(), and add a little comment
on top.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c |   8 ++
 job.c      | 243 +++++++++++++++++++++++++++++++----------------------
 2 files changed, 149 insertions(+), 102 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index e00c8d31d5..cf1f49f6c2 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -242,6 +242,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_on_idle(Notifier *n, void *opaque)
 {
     /*
@@ -269,6 +270,7 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
+/* Called with job_mutex held. May temporarly release the lock. */
 bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
@@ -310,6 +312,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
+/* Called with job_mutex lock held. */
 BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
@@ -355,6 +358,7 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_cancelled(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -374,6 +378,7 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_completed(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -400,6 +405,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_pending(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -412,6 +418,7 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
+/* Called with job_mutex lock held. */
 static void block_job_event_ready(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -504,6 +511,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     return job;
 }
 
+/* Called with job_mutex lock held. */
 void block_job_iostatus_reset(BlockJob *job)
 {
     assert(qemu_in_main_thread());
diff --git a/job.c b/job.c
index 56722a5043..f16a4ef542 100644
--- a/job.c
+++ b/job.c
@@ -54,6 +54,7 @@
  */
 QemuMutex job_mutex;
 
+/* Protected by job_mutex */
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -129,7 +130,8 @@ JobTxn *job_txn_new(void)
     return txn;
 }
 
-static void job_txn_ref(JobTxn *txn)
+/* Called with job_mutex held. */
+static void job_txn_ref_locked(JobTxn *txn)
 {
     txn->refcnt++;
 }
@@ -151,10 +153,11 @@ void job_txn_add_job_locked(JobTxn *txn, Job *job)
     job->txn = txn;
 
     QLIST_INSERT_HEAD(&txn->jobs, job, txn_list);
-    job_txn_ref(txn);
+    job_txn_ref_locked(txn);
 }
 
-static void job_txn_del_job(Job *job)
+/* Called with job_mutex held. */
+static void job_txn_del_job_locked(Job *job)
 {
     if (job->txn) {
         QLIST_REMOVE(job, txn_list);
@@ -163,17 +166,18 @@ static void job_txn_del_job(Job *job)
     }
 }
 
-static int job_txn_apply(Job *job, int fn(Job *))
+/* Called with job_mutex held. */
+static int job_txn_apply_locked(Job *job, int fn(Job *))
 {
     Job *other_job, *next;
     JobTxn *txn = job->txn;
     int rc = 0;
 
     /*
-     * Similar to job_completed_txn_abort, we take each job's lock before
-     * applying fn, but since we assume that outer_ctx is held by the caller,
-     * we need to release it here to avoid holding the lock twice - which would
-     * break AIO_WAIT_WHILE from within fn.
+     * Similar to job_completed_txn_abort_locked, we take each job's lock
+     * before applying fn, but since we assume that outer_ctx is held by the
+     * caller, we need to release it here to avoid holding the lock
+     * twice - which would break AIO_WAIT_WHILE from within fn.
      */
     job_ref_locked(job);
     aio_context_release(job->aio_context);
@@ -199,7 +203,8 @@ bool job_is_internal(Job *job)
     return (job->id == NULL);
 }
 
-static void job_state_transition(Job *job, JobStatus s1)
+/* Called with job_mutex held. */
+static void job_state_transition_locked(Job *job, JobStatus s1)
 {
     JobStatus s0 = job->status;
     assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
@@ -355,7 +360,8 @@ static bool job_started(Job *job)
     return job->co;
 }
 
-static bool job_should_pause(Job *job)
+/* Called with job_mutex held. */
+static bool job_should_pause_locked(Job *job)
 {
     return job->pause_count > 0;
 }
@@ -381,6 +387,7 @@ Job *job_get_locked(const char *id)
     return NULL;
 }
 
+/* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
     Job *job = opaque;
@@ -434,7 +441,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     notifier_list_init(&job->on_pending);
     notifier_list_init(&job->on_ready);
 
-    job_state_transition(job, JOB_STATUS_CREATED);
+    job_state_transition_locked(job, JOB_STATUS_CREATED);
     aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
                    QEMU_CLOCK_REALTIME, SCALE_NS,
                    job_sleep_timer_cb, job);
@@ -502,7 +509,7 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
  * To be called when a cancelled job is finalised.
  * Called with job_mutex held.
  */
-static void job_event_cancelled(Job *job)
+static void job_event_cancelled_locked(Job *job)
 {
     notifier_list_notify(&job->on_finalize_cancelled, job);
 }
@@ -511,22 +518,25 @@ static void job_event_cancelled(Job *job)
  * To be called when a successfully completed job is finalised.
  * Called with job_mutex held.
  */
-static void job_event_completed(Job *job)
+static void job_event_completed_locked(Job *job)
 {
     notifier_list_notify(&job->on_finalize_completed, job);
 }
 
-static void job_event_pending(Job *job)
+/* Called with job_mutex held. */
+static void job_event_pending_locked(Job *job)
 {
     notifier_list_notify(&job->on_pending, job);
 }
 
-static void job_event_ready(Job *job)
+/* Called with job_mutex held. */
+static void job_event_ready_locked(Job *job)
 {
     notifier_list_notify(&job->on_ready, job);
 }
 
-static void job_event_idle(Job *job)
+/* Called with job_mutex held. */
+static void job_event_idle_locked(Job *job)
 {
     notifier_list_notify(&job->on_idle, job);
 }
@@ -571,15 +581,18 @@ void job_enter(Job *job)
  * is allowed and cancels the timer.
  *
  * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
- * called explicitly. */
-static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
+ * called explicitly.
+ *
+ * Called with job_mutex held, but releases it temporarly.
+ */
+static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
     real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
     }
     job->busy = false;
-    job_event_idle(job);
+    job_event_idle_locked(job);
     real_job_unlock();
     job_unlock();
     qemu_coroutine_yield();
@@ -594,7 +607,7 @@ void coroutine_fn job_pause_point(Job *job)
     assert(job && job_started(job));
 
     job_lock();
-    if (!job_should_pause(job)) {
+    if (!job_should_pause_locked(job)) {
         job_unlock();
         return;
     }
@@ -609,15 +622,15 @@ void coroutine_fn job_pause_point(Job *job)
         job_lock();
     }
 
-    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
+    if (job_should_pause_locked(job) && !job_is_cancelled_locked(job)) {
         JobStatus status = job->status;
-        job_state_transition(job, status == JOB_STATUS_READY
+        job_state_transition_locked(job, status == JOB_STATUS_READY
                                   ? JOB_STATUS_STANDBY
                                   : JOB_STATUS_PAUSED);
         job->paused = true;
-        job_do_yield(job, -1);
+        job_do_yield_locked(job, -1);
         job->paused = false;
-        job_state_transition(job, status);
+        job_state_transition_locked(job, status);
     }
     job_unlock();
 
@@ -636,8 +649,8 @@ void job_yield(Job *job)
             return;
         }
 
-        if (!job_should_pause(job)) {
-            job_do_yield(job, -1);
+        if (!job_should_pause_locked(job)) {
+            job_do_yield_locked(job, -1);
         }
     }
 
@@ -654,8 +667,9 @@ void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
             return;
         }
 
-        if (!job_should_pause(job)) {
-            job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+        if (!job_should_pause_locked(job)) {
+            job_do_yield_locked(job,
+                                qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
         }
     }
 
@@ -726,16 +740,17 @@ void job_user_resume_locked(Job *job, Error **errp)
     job_resume_locked(job);
 }
 
-static void job_do_dismiss(Job *job)
+/* Called with job_mutex held. */
+static void job_do_dismiss_locked(Job *job)
 {
     assert(job);
     job->busy = false;
     job->paused = false;
     job->deferred_to_main_loop = true;
 
-    job_txn_del_job(job);
+    job_txn_del_job_locked(job);
 
-    job_state_transition(job, JOB_STATUS_NULL);
+    job_state_transition_locked(job, JOB_STATUS_NULL);
     job_unref_locked(job);
 }
 
@@ -748,14 +763,14 @@ void job_dismiss_locked(Job **jobptr, Error **errp)
         return;
     }
 
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
     *jobptr = NULL;
 }
 
 void job_early_fail_locked(Job *job)
 {
     assert(job->status == JOB_STATUS_CREATED);
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
 }
 
 void job_early_fail(Job *job)
@@ -764,15 +779,17 @@ void job_early_fail(Job *job)
     job_early_fail_locked(job);
 }
 
-static void job_conclude(Job *job)
+/* Called with job_mutex held. */
+static void job_conclude_locked(Job *job)
 {
-    job_state_transition(job, JOB_STATUS_CONCLUDED);
+    job_state_transition_locked(job, JOB_STATUS_CONCLUDED);
     if (job->auto_dismiss || !job_started(job)) {
-        job_do_dismiss(job);
+        job_do_dismiss_locked(job);
     }
 }
 
-static void job_update_rc(Job *job)
+/* Called with job_mutex held. */
+static void job_update_rc_locked(Job *job)
 {
     if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
@@ -781,11 +798,12 @@ static void job_update_rc(Job *job)
         if (!job->err) {
             error_setg(&job->err, "%s", strerror(-job->ret));
         }
-        job_state_transition(job, JOB_STATUS_ABORTING);
+        job_state_transition_locked(job, JOB_STATUS_ABORTING);
     }
 }
 
-static void job_commit(Job *job)
+/* Called with job_mutex held, but releases it temporarly */
+static void job_commit_locked(Job *job)
 {
     assert(!job->ret);
     assert(qemu_in_main_thread());
@@ -796,7 +814,8 @@ static void job_commit(Job *job)
     }
 }
 
-static void job_abort(Job *job)
+/* Called with job_mutex held, but releases it temporarly */
+static void job_abort_locked(Job *job)
 {
     assert(job->ret);
     assert(qemu_in_main_thread());
@@ -807,7 +826,8 @@ static void job_abort(Job *job)
     }
 }
 
-static void job_clean(Job *job)
+/* Called with job_mutex held, but releases it temporarly */
+static void job_clean_locked(Job *job)
 {
     assert(qemu_in_main_thread());
     if (job->driver->clean) {
@@ -817,7 +837,8 @@ static void job_clean(Job *job)
     }
 }
 
-static int job_finalize_single(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static int job_finalize_single_locked(Job *job)
 {
     int job_ret;
     AioContext *ctx = job->aio_context;
@@ -825,16 +846,16 @@ static int job_finalize_single(Job *job)
     assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
-    job_update_rc(job);
+    job_update_rc_locked(job);
 
     aio_context_acquire(ctx);
 
     if (!job->ret) {
-        job_commit(job);
+        job_commit_locked(job);
     } else {
-        job_abort(job);
+        job_abort_locked(job);
     }
-    job_clean(job);
+    job_clean_locked(job);
 
     aio_context_release(ctx);
 
@@ -848,18 +869,19 @@ static int job_finalize_single(Job *job)
     /* Emit events only if we actually started */
     if (job_started(job)) {
         if (job_is_cancelled_locked(job)) {
-            job_event_cancelled(job);
+            job_event_cancelled_locked(job);
         } else {
-            job_event_completed(job);
+            job_event_completed_locked(job);
         }
     }
 
-    job_txn_del_job(job);
-    job_conclude(job);
+    job_txn_del_job_locked(job);
+    job_conclude_locked(job);
     return 0;
 }
 
-static void job_cancel_async(Job *job, bool force)
+/* Called with job_mutex held, but releases it temporarly. */
+static void job_cancel_async_locked(Job *job, bool force)
 {
     assert(qemu_in_main_thread());
     if (job->driver->cancel) {
@@ -897,7 +919,8 @@ static void job_cancel_async(Job *job, bool force)
     }
 }
 
-static void job_completed_txn_abort(Job *job)
+/* Called with job_mutex held. */
+static void job_completed_txn_abort_locked(Job *job)
 {
     AioContext *ctx;
     JobTxn *txn = job->txn;
@@ -910,12 +933,12 @@ static void job_completed_txn_abort(Job *job)
         return;
     }
     txn->aborting = true;
-    job_txn_ref(txn);
+    job_txn_ref_locked(txn);
 
     /*
      * We can only hold the single job's AioContext lock while calling
-     * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
+     * job_finalize_single_locked() because the finalization callbacks can
+     *  involve calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
     job_ref_locked(job);
@@ -930,10 +953,10 @@ static void job_completed_txn_abort(Job *job)
             aio_context_acquire(ctx);
             /*
              * This is a transaction: If one job failed, no result will matter.
-             * Therefore, pass force=true to terminate all other jobs as quickly
-             * as possible.
+             * Therefore, pass force=true to terminate all other jobs as
+             * quickly as possible.
              */
-            job_cancel_async(other_job, true);
+            job_cancel_async_locked(other_job, true);
             aio_context_release(ctx);
         }
     }
@@ -949,13 +972,13 @@ static void job_completed_txn_abort(Job *job)
             assert(job_cancel_requested_locked(other_job));
             job_finish_sync_locked(other_job, NULL, NULL);
         }
-        job_finalize_single(other_job);
+        job_finalize_single_locked(other_job);
         aio_context_release(ctx);
     }
 
     /*
      * Use job_ref_locked()/job_unref_locked() so we can read the AioContext
-     * here even if the job went away during job_finalize_single().
+     * here even if the job went away during job_finalize_single_locked().
      */
     aio_context_acquire(job->aio_context);
     job_unref_locked(job);
@@ -963,7 +986,8 @@ static void job_completed_txn_abort(Job *job)
     job_txn_unref_locked(txn);
 }
 
-static int job_prepare(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static int job_prepare_locked(Job *job)
 {
     int ret;
     AioContext *ctx = job->aio_context;
@@ -976,28 +1000,30 @@ static int job_prepare(Job *job)
         aio_context_release(ctx);
         job_lock();
         job->ret = ret;
-        job_update_rc(job);
+        job_update_rc_locked(job);
     }
 
     return job->ret;
 }
 
-static int job_needs_finalize(Job *job)
+/* Called with job_mutex held. */
+static int job_needs_finalize_locked(Job *job)
 {
     return !job->auto_finalize;
 }
 
-static void job_do_finalize(Job *job)
+/* Called with job_mutex held. */
+static void job_do_finalize_locked(Job *job)
 {
     int rc;
     assert(job && job->txn);
 
     /* prepare the transaction to complete */
-    rc = job_txn_apply(job, job_prepare);
+    rc = job_txn_apply_locked(job, job_prepare_locked);
     if (rc) {
-        job_completed_txn_abort(job);
+        job_completed_txn_abort_locked(job);
     } else {
-        job_txn_apply(job, job_finalize_single);
+        job_txn_apply_locked(job, job_finalize_single_locked);
     }
 }
 
@@ -1007,14 +1033,15 @@ void job_finalize_locked(Job *job, Error **errp)
     if (job_apply_verb_locked(job, JOB_VERB_FINALIZE, errp)) {
         return;
     }
-    job_do_finalize(job);
+    job_do_finalize_locked(job);
 }
 
-static int job_transition_to_pending(Job *job)
+/* Called with job_mutex held. */
+static int job_transition_to_pending_locked(Job *job)
 {
-    job_state_transition(job, JOB_STATUS_PENDING);
+    job_state_transition_locked(job, JOB_STATUS_PENDING);
     if (!job->auto_finalize) {
-        job_event_pending(job);
+        job_event_pending_locked(job);
     }
     return 0;
 }
@@ -1022,16 +1049,17 @@ static int job_transition_to_pending(Job *job)
 void job_transition_to_ready(Job *job)
 {
     JOB_LOCK_GUARD();
-    job_state_transition(job, JOB_STATUS_READY);
-    job_event_ready(job);
+    job_state_transition_locked(job, JOB_STATUS_READY);
+    job_event_ready_locked(job);
 }
 
-static void job_completed_txn_success(Job *job)
+/* Called with job_mutex held. */
+static void job_completed_txn_success_locked(Job *job)
 {
     JobTxn *txn = job->txn;
     Job *other_job;
 
-    job_state_transition(job, JOB_STATUS_WAITING);
+    job_state_transition_locked(job, JOB_STATUS_WAITING);
 
     /*
      * Successful completion, see if there are other running jobs in this
@@ -1044,28 +1072,32 @@ static void job_completed_txn_success(Job *job)
         assert(other_job->ret == 0);
     }
 
-    job_txn_apply(job, job_transition_to_pending);
+    job_txn_apply_locked(job, job_transition_to_pending_locked);
 
     /* If no jobs need manual finalization, automatically do so */
-    if (job_txn_apply(job, job_needs_finalize) == 0) {
-        job_do_finalize(job);
+    if (job_txn_apply_locked(job, job_needs_finalize_locked) == 0) {
+        job_do_finalize_locked(job);
     }
 }
 
-static void job_completed(Job *job)
+/* Called with job_mutex held. */
+static void job_completed_locked(Job *job)
 {
     assert(job && job->txn && !job_is_completed_locked(job));
 
-    job_update_rc(job);
+    job_update_rc_locked(job);
     trace_job_completed(job, job->ret);
     if (job->ret) {
-        job_completed_txn_abort(job);
+        job_completed_txn_abort_locked(job);
     } else {
-        job_completed_txn_success(job);
+        job_completed_txn_success_locked(job);
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
@@ -1080,15 +1112,15 @@ static void job_exit(void *opaque)
      * drain block nodes, and if .drained_poll still returned true, we would
      * deadlock. */
     job->busy = false;
-    job_event_idle(job);
+    job_event_idle_locked(job);
 
-    job_completed(job);
+    job_completed_locked(job);
 
     /*
-     * Note that calling job_completed can move the job to a different
-     * aio_context, so we cannot cache from above. job_txn_apply takes care of
-     * acquiring the new lock, and we ref/unref to avoid job_completed freeing
-     * the job underneath us.
+     * Note that calling job_completed_locked can move the job to a different
+     * aio_context, so we cannot cache from above. job_txn_apply_locked takes
+     * care of acquiring the new lock, and we ref/unref to avoid
+     * job_completed_locked freeing the job underneath us.
      */
     ctx = job->aio_context;
     job_unref_locked(job);
@@ -1098,6 +1130,8 @@ static void job_exit(void *opaque)
 /**
  * All jobs must allow a pause point before entering their job proper. This
  * ensures that jobs can be paused prior to being started, then resumed later.
+ *
+ * Called with job_mutex *not* held.
  */
 static void coroutine_fn job_co_entry(void *opaque)
 {
@@ -1116,6 +1150,7 @@ static void coroutine_fn job_co_entry(void *opaque)
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
+/* Called with job_mutex *not* held. */
 static int job_pre_run(Job *job)
 {
     assert(qemu_in_main_thread());
@@ -1140,7 +1175,7 @@ void job_start(Job *job)
         job->pause_count--;
         job->busy = true;
         job->paused = false;
-        job_state_transition(job, JOB_STATUS_RUNNING);
+        job_state_transition_locked(job, JOB_STATUS_RUNNING);
     }
     aio_co_enter(job->aio_context, job->co);
 }
@@ -1148,25 +1183,25 @@ void job_start(Job *job)
 void job_cancel_locked(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
-        job_do_dismiss(job);
+        job_do_dismiss_locked(job);
         return;
     }
-    job_cancel_async(job, force);
+    job_cancel_async_locked(job, force);
     if (!job_started(job)) {
-        job_completed(job);
+        job_completed_locked(job);
     } else if (job->deferred_to_main_loop) {
         /*
-         * job_cancel_async() ignores soft-cancel requests for jobs
+         * job_cancel_async_locked() ignores soft-cancel requests for jobs
          * that are already done (i.e. deferred to the main loop).  We
          * have to check again whether the job is really cancelled.
          * (job_cancel_requested() and job_is_cancelled() are equivalent
-         * here, because job_cancel_async() will make soft-cancel
+         * here, because job_cancel_async_locked() will make soft-cancel
          * requests no-ops when deferred_to_main_loop is true.  We
          * choose to call job_is_cancelled() to show that we invoke
-         * job_completed_txn_abort() only for force-cancelled jobs.)
+         * job_completed_txn_abort_locked() only for force-cancelled jobs.)
          */
         if (job_is_cancelled_locked(job)) {
-            job_completed_txn_abort(job);
+            job_completed_txn_abort_locked(job);
         }
     } else {
         job_enter_cond_locked(job, NULL);
@@ -1185,16 +1220,20 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp)
  * A wrapper around job_cancel_locked() taking an Error ** parameter so
  * it may be used with job_finish_sync_locked() without the
  * need for (rather nasty) function pointer casts there.
+ *
+ * Called with job_mutex held.
  */
-static void job_cancel_err(Job *job, Error **errp)
+static void job_cancel_err_locked(Job *job, Error **errp)
 {
     job_cancel_locked(job, false);
 }
 
 /**
- * Same as job_cancel_err(), but force-cancel.
+ * Same as job_cancel_err_locked(), but force-cancel.
+ *
+ * Called with job_mutex held.
  */
-static void job_force_cancel_err(Job *job, Error **errp)
+static void job_force_cancel_err_locked(Job *job, Error **errp)
 {
     job_cancel_locked(job, true);
 }
@@ -1202,9 +1241,9 @@ static void job_force_cancel_err(Job *job, Error **errp)
 int job_cancel_sync_locked(Job *job, bool force)
 {
     if (force) {
-        return job_finish_sync_locked(job, &job_force_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_force_cancel_err_locked, NULL);
     } else {
-        return job_finish_sync_locked(job, &job_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_cancel_err_locked, NULL);
     }
 }
 
-- 
2.31.1


