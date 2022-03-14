Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B04D8650
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:58:36 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlDX-0005Jh-OM
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:58:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt9-0006r6-FE
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksz-0001c6-2b
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkXUqqU+Zc+ISerGy3JKlgjK3THlKD8VxkVK5IMb6t4=;
 b=WUqrj0QE+QFGqUKt2jVzUvr2kTZ1SsOz607olB+kzpppoJO440u211V6nvktEBbBDLI3xP
 vYzJnO0Mv43/4AMSvlFCnmGE8QUx95ages9yUNZsRlU0nXM5jKil6KDKE2vxln/pGdkRCj
 NBH1GHN6P+LpZfGMCTTBe2+oVCt2ltM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-BYPsk5-SPd2g20SCc7mMKw-1; Mon, 14 Mar 2022 09:37:17 -0400
X-MC-Unique: BYPsk5-SPd2g20SCc7mMKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5CE3187506A;
 Mon, 14 Mar 2022 13:37:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62CA9403144;
 Mon, 14 Mar 2022 13:37:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 10/18] jobs: rename static functions called with job_mutex
 held
Date: Mon, 14 Mar 2022 09:36:59 -0400
Message-Id: <20220314133707.2206082-11-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

With the *nop* job_lock/unlock placed, rename the static
functions that are always under job_mutex, adding "_locked" suffix.

List of functions that get this suffix:
job_txn_ref		   job_txn_del_job
job_txn_apply		   job_state_transition
job_should_pause	   job_event_cancelled
job_event_completed	   job_event_pending
job_event_ready		   job_event_idle
job_do_yield		   job_timer_not_pending
job_do_dismiss		   job_conclude
job_update_rc		   job_commit
job_abort		   job_clean
job_finalize_single	   job_cancel_async
job_completed_txn_abort	   job_prepare
job_needs_finalize	   job_do_finalize
job_transition_to_pending  job_completed_txn_success
job_completed		   job_cancel_err
job_force_cancel_err

Note that "locked" refers to the *nop* job_lock/unlock, and not
real_job_lock/unlock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 247 +++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 141 insertions(+), 106 deletions(-)

diff --git a/job.c b/job.c
index 3e9e632a18..298432ce00 100644
--- a/job.c
+++ b/job.c
@@ -113,7 +113,8 @@ JobTxn *job_txn_new(void)
     return txn;
 }
 
-static void job_txn_ref(JobTxn *txn)
+/* Called with job_mutex held. */
+static void job_txn_ref_locked(JobTxn *txn)
 {
     txn->refcnt++;
 }
@@ -145,10 +146,11 @@ static void job_txn_add_job(JobTxn *txn, Job *job)
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
@@ -157,7 +159,8 @@ static void job_txn_del_job(Job *job)
     }
 }
 
-static int job_txn_apply(Job *job, int fn(Job *))
+/* Called with job_mutex held. */
+static int job_txn_apply_locked(Job *job, int fn(Job *))
 {
     AioContext *inner_ctx;
     Job *other_job, *next;
@@ -165,10 +168,10 @@ static int job_txn_apply(Job *job, int fn(Job *))
     int rc = 0;
 
     /*
-     * Similar to job_completed_txn_abort, we take each job's lock before
-     * applying fn, but since we assume that outer_ctx is held by the caller,
-     * we need to release it here to avoid holding the lock twice - which would
-     * break AIO_WAIT_WHILE from within fn.
+     * Similar to job_completed_txn_abort_locked, we take each job's lock
+     * before applying fn, but since we assume that outer_ctx is held by
+     * the caller, we need to release it here to avoid holding the lock
+     * twice - which would break AIO_WAIT_WHILE from within fn.
      */
     job_ref(job);
     aio_context_release(job->aio_context);
@@ -197,7 +200,8 @@ bool job_is_internal(Job *job)
     return (job->id == NULL);
 }
 
-static void job_state_transition(Job *job, JobStatus s1)
+/* Called with job_mutex held. */
+static void job_state_transition_locked(Job *job, JobStatus s1)
 {
     JobStatus s0 = job->status;
     assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
@@ -322,7 +326,8 @@ static bool job_started(Job *job)
     return job->co;
 }
 
-static bool job_should_pause(Job *job)
+/* Called with job_mutex held. */
+static bool job_should_pause_locked(Job *job)
 {
     return job->pause_count > 0;
 }
@@ -402,7 +407,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     notifier_list_init(&job->on_ready);
     notifier_list_init(&job->on_idle);
 
-    job_state_transition(job, JOB_STATUS_CREATED);
+    job_state_transition_locked(job, JOB_STATUS_CREATED);
     aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
                    QEMU_CLOCK_REALTIME, SCALE_NS,
                    job_sleep_timer_cb, job);
@@ -468,31 +473,36 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
 
 /**
  * To be called when a cancelled job is finalised.
+ * Called with job_mutex held.
  */
-static void job_event_cancelled(Job *job)
+static void job_event_cancelled_locked(Job *job)
 {
     notifier_list_notify(&job->on_finalize_cancelled, job);
 }
 
 /**
  * To be called when a successfully completed job is finalised.
+ * Called with job_mutex held.
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
@@ -530,20 +540,24 @@ void job_enter(Job *job)
     job_enter_cond(job, NULL);
 }
 
-/* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
+/*
+ * Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
  * Reentering the job coroutine with job_enter() before the timer has expired
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
@@ -558,7 +572,7 @@ static void coroutine_fn job_pause_point_locked(Job *job)
 {
     assert(job && job_started(job));
 
-    if (!job_should_pause(job)) {
+    if (!job_should_pause_locked(job)) {
         return;
     }
     if (job_is_cancelled_locked(job)) {
@@ -571,15 +585,15 @@ static void coroutine_fn job_pause_point_locked(Job *job)
         job_lock();
     }
 
-    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
+    if (job_should_pause_locked(job) && !job_is_cancelled_locked(job)) {
         JobStatus status = job->status;
-        job_state_transition(job, status == JOB_STATUS_READY
-                                  ? JOB_STATUS_STANDBY
-                                  : JOB_STATUS_PAUSED);
+        job_state_transition_locked(job, status == JOB_STATUS_READY
+                                    ? JOB_STATUS_STANDBY
+                                    : JOB_STATUS_PAUSED);
         job->paused = true;
-        job_do_yield(job, -1);
+        job_do_yield_locked(job, -1);
         job->paused = false;
-        job_state_transition(job, status);
+        job_state_transition_locked(job, status);
     }
 
     if (job->driver->resume) {
@@ -605,8 +619,8 @@ void job_yield(Job *job)
         return;
     }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, -1);
+    if (!job_should_pause_locked(job)) {
+        job_do_yield_locked(job, -1);
     }
 
     job_pause_point_locked(job);
@@ -622,15 +636,15 @@ void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
         return;
     }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+    if (!job_should_pause_locked(job)) {
+        job_do_yield_locked(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
     }
 
     job_pause_point_locked(job);
 }
 
 /* Assumes the job_mutex is held */
-static bool job_timer_not_pending(Job *job)
+static bool job_timer_not_pending_locked(Job *job)
 {
     return !timer_pending(&job->sleep_timer);
 }
@@ -652,7 +666,7 @@ void job_resume(Job *job)
     }
 
     /* kick only if no timer is pending */
-    job_enter_cond(job, job_timer_not_pending);
+    job_enter_cond(job, job_timer_not_pending_locked);
 }
 
 void job_user_pause(Job *job, Error **errp)
@@ -693,16 +707,17 @@ void job_user_resume(Job *job, Error **errp)
     job_resume(job);
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
     job_unref(job);
 }
 
@@ -715,7 +730,7 @@ void job_dismiss(Job **jobptr, Error **errp)
         return;
     }
 
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
     *jobptr = NULL;
 }
 
@@ -723,18 +738,20 @@ void job_early_fail(Job *job)
 {
     JOB_LOCK_GUARD();
     assert(job->status == JOB_STATUS_CREATED);
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
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
@@ -743,11 +760,12 @@ static void job_update_rc(Job *job)
         if (!job->err) {
             error_setg(&job->err, "%s", strerror(-job->ret));
         }
-        job_state_transition(job, JOB_STATUS_ABORTING);
+        job_state_transition_locked(job, JOB_STATUS_ABORTING);
     }
 }
 
-static void job_commit(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static void job_commit_locked(Job *job)
 {
     assert(!job->ret);
     GLOBAL_STATE_CODE();
@@ -758,7 +776,8 @@ static void job_commit(Job *job)
     }
 }
 
-static void job_abort(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static void job_abort_locked(Job *job)
 {
     assert(job->ret);
     GLOBAL_STATE_CODE();
@@ -769,7 +788,8 @@ static void job_abort(Job *job)
     }
 }
 
-static void job_clean(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static void job_clean_locked(Job *job)
 {
     GLOBAL_STATE_CODE();
     if (job->driver->clean) {
@@ -779,21 +799,22 @@ static void job_clean(Job *job)
     }
 }
 
-static int job_finalize_single(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static int job_finalize_single_locked(Job *job)
 {
     int job_ret;
 
     assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
-    job_update_rc(job);
+    job_update_rc_locked(job);
 
     if (!job->ret) {
-        job_commit(job);
+        job_commit_locked(job);
     } else {
-        job_abort(job);
+        job_abort_locked(job);
     }
-    job_clean(job);
+    job_clean_locked(job);
 
     if (job->cb) {
         job_ret = job->ret;
@@ -805,18 +826,19 @@ static int job_finalize_single(Job *job)
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
     GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
@@ -854,7 +876,8 @@ static void job_cancel_async(Job *job, bool force)
     }
 }
 
-static void job_completed_txn_abort(Job *job)
+/* Called with job_mutex held. */
+static void job_completed_txn_abort_locked(Job *job)
 {
     AioContext *ctx;
     JobTxn *txn = job->txn;
@@ -867,12 +890,12 @@ static void job_completed_txn_abort(Job *job)
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
+     * involve calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
     job_ref(job);
@@ -890,7 +913,7 @@ static void job_completed_txn_abort(Job *job)
              * Therefore, pass force=true to terminate all other jobs as quickly
              * as possible.
              */
-            job_cancel_async(other_job, true);
+            job_cancel_async_locked(other_job, true);
             aio_context_release(ctx);
         }
     }
@@ -906,13 +929,13 @@ static void job_completed_txn_abort(Job *job)
             assert(job_cancel_requested_locked(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
-        job_finalize_single(other_job);
+        job_finalize_single_locked(other_job);
         aio_context_release(ctx);
     }
 
     /*
      * Use job_ref()/job_unref() so we can read the AioContext here
-     * even if the job went away during job_finalize_single().
+     * even if the job went away during job_finalize_single_locked().
      */
     aio_context_acquire(job->aio_context);
     job_unref(job);
@@ -920,7 +943,8 @@ static void job_completed_txn_abort(Job *job)
     job_txn_unref(txn);
 }
 
-static int job_prepare(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static int job_prepare_locked(Job *job)
 {
     int ret;
 
@@ -930,27 +954,29 @@ static int job_prepare(Job *job)
         ret = job->driver->prepare(job);
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
 
@@ -960,14 +986,15 @@ void job_finalize(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_FINALIZE, errp)) {
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
@@ -975,16 +1002,17 @@ static int job_transition_to_pending(Job *job)
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
@@ -997,24 +1025,25 @@ static void job_completed_txn_success(Job *job)
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
 
@@ -1036,15 +1065,16 @@ static void job_exit(void *opaque)
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
+     * aio_context, so we cannot cache from above.
+     * job_txn_apply_locked takes care of
+     * acquiring the new lock, and we ref/unref to avoid job_completed_locked
+     * freeing the job underneath us.
      */
     ctx = job->aio_context;
     job_unref(job);
@@ -1083,7 +1113,7 @@ void job_start(Job *job)
         job->pause_count--;
         job->busy = true;
         job->paused = false;
-        job_state_transition(job, JOB_STATUS_RUNNING);
+        job_state_transition_locked(job, JOB_STATUS_RUNNING);
     }
     aio_co_enter(job->aio_context, job->co);
 }
@@ -1091,25 +1121,25 @@ void job_start(Job *job)
 void job_cancel(Job *job, bool force)
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
          * (job_cancel_requested_locked() and job_is_cancelled_locked()
-         * are equivalent here, because job_cancel_async() will
+         * are equivalent here, because job_cancel_async_locked() will
          * make soft-cancel requests no-ops when deferred_to_main_loop is true.
          * We choose to call job_is_cancelled_locked() to show that we invoke
-         * job_completed_txn_abort() only for force-cancelled jobs.)
+         * job_completed_txn_abort_locked() only for force-cancelled jobs.)
          */
         if (job_is_cancelled_locked(job)) {
-            job_completed_txn_abort(job);
+            job_completed_txn_abort_locked(job);
         }
     } else {
         job_enter_cond(job, NULL);
@@ -1124,18 +1154,23 @@ void job_user_cancel(Job *job, bool force, Error **errp)
     job_cancel(job, force);
 }
 
-/* A wrapper around job_cancel() taking an Error ** parameter so it may be
+/*
+ * A wrapper around job_cancel() taking an Error ** parameter so it may be
  * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there. */
-static void job_cancel_err(Job *job, Error **errp)
+ * pointer casts there.
+ *
+ * Called with job_mutex held.
+ */
+static void job_cancel_err_locked(Job *job, Error **errp)
 {
     job_cancel(job, false);
 }
 
 /**
- * Same as job_cancel_err(), but force-cancel.
+ * Same as job_cancel_err_locked(), but force-cancel.
+ * Called with job_mutex held.
  */
-static void job_force_cancel_err(Job *job, Error **errp)
+static void job_force_cancel_err_locked(Job *job, Error **errp)
 {
     job_cancel(job, true);
 }
@@ -1143,9 +1178,9 @@ static void job_force_cancel_err(Job *job, Error **errp)
 int job_cancel_sync(Job *job, bool force)
 {
     if (force) {
-        return job_finish_sync(job, &job_force_cancel_err, NULL);
+        return job_finish_sync(job, &job_force_cancel_err_locked, NULL);
     } else {
-        return job_finish_sync(job, &job_cancel_err, NULL);
+        return job_finish_sync(job, &job_cancel_err_locked, NULL);
     }
 }
 
-- 
2.31.1


