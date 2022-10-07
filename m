Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F05F77E8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:25:32 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmPz-0001z5-KR
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuI-0005q4-QJ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuD-0003Fs-Gr
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Km+ii9D7ROH2QVi2O4c+Xg1Jo+k74YZRtZ8gsp2h2GE=;
 b=JXdjVH6W1MIluRuqDNqk1l/jVkd617qNGN0TgM+qoXH50Bt1fgfFsFV705IRELcWqeYIDh
 aHEuzxDfFjp3WpbRnxavlCUEtPWXlSOcalJHARYhpYYBI1wLVC3vpoxnlRe5cH/MA8ACT0
 tYpL32i2uCKIe/NTXuBOFR+9W4iNB8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-552q1O4GNTCReV8a35OqrQ-1; Fri, 07 Oct 2022 06:48:33 -0400
X-MC-Unique: 552q1O4GNTCReV8a35OqrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45DE6811E87;
 Fri,  7 Oct 2022 10:48:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45CDC2024CBB;
 Fri,  7 Oct 2022 10:48:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 33/50] job.c: add job_lock/unlock while keeping job.h intact
Date: Fri,  7 Oct 2022 12:47:35 +0200
Message-Id: <20221007104752.141361-34-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

With "intact" we mean that all job.h functions implicitly
take the lock. Therefore API callers are unmodified.

This means that:
- many static functions that will be always called with job lock held
  become _locked, and call _locked functions
- all public functions take the lock internally if needed, and call _locked
  functions
- all public functions called internally by other functions in job.c will have a
  _locked counterpart (sometimes public), to avoid deadlocks (job lock already taken).
  These functions are not used for now.
- some public functions called only from exernal files (not job.c) do not
  have _locked() counterpart and take the lock inside. Others won't need
  the lock at all because use fields only set at initialization and
  never modified.

job_{lock/unlock} is independent from real_job_{lock/unlock}.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220926093214.506243-6-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h | 138 +++++++++-
 job.c              | 610 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 561 insertions(+), 187 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index e3e31e2548..870dce1535 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -358,8 +358,15 @@ JobTxn *job_txn_new(void);
  */
 void job_txn_unref(JobTxn *txn);
 
+/*
+ * Same as job_txn_unref(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+void job_txn_unref_locked(JobTxn *txn);
+
 /**
  * Create a new long-running job and return it.
+ * Called with job_mutex *not* held.
  *
  * @job_id: The id of the newly-created job, or %NULL for internal jobs
  * @driver: The class object for the newly-created job.
@@ -380,17 +387,25 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
  */
 void job_ref(Job *job);
 
+/* Same as job_ref(), but called with job lock held. */
+void job_ref_locked(Job *job);
+
 /**
  * Release a reference that was previously acquired with job_ref() or
  * job_create(). If it's the last reference to the object, it will be freed.
  */
 void job_unref(Job *job);
 
+/* Same as job_unref(), but called with job lock held. */
+void job_unref_locked(Job *job);
+
 /**
  * @job: The job that has made progress
  * @done: How much progress the job made since the last call
  *
  * Updates the progress counter of the job.
+ *
+ * May be called with mutex held or not held.
  */
 void job_progress_update(Job *job, uint64_t done);
 
@@ -401,6 +416,8 @@ void job_progress_update(Job *job, uint64_t done);
  *
  * Sets the expected end value of the progress counter of a job so that a
  * completion percentage can be calculated when the progress is updated.
+ *
+ * May be called with mutex held or not held.
  */
 void job_progress_set_remaining(Job *job, uint64_t remaining);
 
@@ -416,6 +433,8 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  * length before, and job_progress_update() afterwards.
  * (So the operation acts as a parenthesis in regards to the main job
  * operation running in background.)
+ *
+ * May be called with mutex held or not held.
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
@@ -426,11 +445,19 @@ void job_progress_increase_remaining(Job *job, uint64_t delta);
  */
 void job_enter_cond(Job *job, bool(*fn)(Job *job));
 
+/*
+ * Same as job_enter_cond(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
+
 /**
  * @job: A job that has not yet been started.
  *
  * Begins execution of a job.
  * Takes ownership of one reference to the job object.
+ *
+ * Called with job_mutex *not* held.
  */
 void job_start(Job *job);
 
@@ -438,6 +465,7 @@ void job_start(Job *job);
  * @job: The job to enter.
  *
  * Continue the specified job by entering the coroutine.
+ * Called with job_mutex *not* held.
  */
 void job_enter(Job *job);
 
@@ -446,6 +474,8 @@ void job_enter(Job *job);
  *
  * Pause now if job_pause() has been called. Jobs that perform lots of I/O
  * must call this between requests so that the job can be paused.
+ *
+ * Called with job_mutex *not* held.
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -453,6 +483,7 @@ void coroutine_fn job_pause_point(Job *job);
  * @job: The job that calls the function.
  *
  * Yield the job coroutine.
+ * Called with job_mutex *not* held.
  */
 void coroutine_fn job_yield(Job *job);
 
@@ -463,6 +494,8 @@ void coroutine_fn job_yield(Job *job);
  * Put the job to sleep (assuming that it wasn't canceled) for @ns
  * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
  * interrupt the wait.
+ *
+ * Called with job_mutex *not* held.
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
@@ -475,21 +508,40 @@ const char *job_type_str(const Job *job);
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-/** Returns whether the job is being cancelled. */
+/**
+ * Returns whether the job is being cancelled.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_cancelled(Job *job);
 
+/* Same as job_is_cancelled(), but called with job lock held. */
+bool job_is_cancelled_locked(Job *job);
+
 /**
  * Returns whether the job is scheduled for cancellation (at an
  * indefinite point).
+ * Called with job_mutex *not* held.
  */
 bool job_cancel_requested(Job *job);
 
-/** Returns whether the job is in a completed state. */
+/**
+ * Returns whether the job is in a completed state.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_completed(Job *job);
 
-/** Returns whether the job is ready to be completed. */
+/* Same as job_is_completed(), but called with job lock held. */
+bool job_is_completed_locked(Job *job);
+
+/**
+ * Returns whether the job is ready to be completed.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_ready(Job *job);
 
+/* Same as job_is_ready(), but called with job lock held. */
+bool job_is_ready_locked(Job *job);
+
 /**
  * Request @job to pause at the next pause point. Must be paired with
  * job_resume(). If the job is supposed to be resumed by user action, call
@@ -497,24 +549,45 @@ bool job_is_ready(Job *job);
  */
 void job_pause(Job *job);
 
+/* Same as job_pause(), but called with job lock held. */
+void job_pause_locked(Job *job);
+
 /** Resumes a @job paused with job_pause. */
 void job_resume(Job *job);
 
+/*
+ * Same as job_resume(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+void job_resume_locked(Job *job);
+
 /**
  * Asynchronously pause the specified @job.
  * Do not allow a resume until a matching call to job_user_resume.
  */
 void job_user_pause(Job *job, Error **errp);
 
+/* Same as job_user_pause(), but called with job lock held. */
+void job_user_pause_locked(Job *job, Error **errp);
+
 /** Returns true if the job is user-paused. */
 bool job_user_paused(Job *job);
 
+/* Same as job_user_paused(), but called with job lock held. */
+bool job_user_paused_locked(Job *job);
+
 /**
  * Resume the specified @job.
  * Must be paired with a preceding job_user_pause.
  */
 void job_user_resume(Job *job, Error **errp);
 
+/*
+ * Same as job_user_resume(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+void job_user_resume_locked(Job *job, Error **errp);
+
 /**
  * Get the next element from the list of block jobs after @job, or the
  * first one if @job is %NULL.
@@ -523,6 +596,9 @@ void job_user_resume(Job *job, Error **errp);
  */
 Job *job_next(Job *job);
 
+/* Same as job_next(), but called with job lock held. */
+Job *job_next_locked(Job *job);
+
 /**
  * Get the job identified by @id (which must not be %NULL).
  *
@@ -530,6 +606,9 @@ Job *job_next(Job *job);
  */
 Job *job_get(const char *id);
 
+/* Same as job_get(), but called with job lock held. */
+Job *job_get_locked(const char *id);
+
 /**
  * Check whether the verb @verb can be applied to @job in its current state.
  * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
@@ -537,27 +616,48 @@ Job *job_get(const char *id);
  */
 int job_apply_verb(Job *job, JobVerb verb, Error **errp);
 
-/** The @job could not be started, free it. */
+/* Same as job_apply_verb, but called with job lock held. */
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
+
+/**
+ * The @job could not be started, free it.
+ * Called with job_mutex *not* held.
+ */
 void job_early_fail(Job *job);
 
-/** Moves the @job from RUNNING to READY */
+/**
+ * Moves the @job from RUNNING to READY.
+ * Called with job_mutex *not* held.
+ */
 void job_transition_to_ready(Job *job);
 
 /** Asynchronously complete the specified @job. */
 void job_complete(Job *job, Error **errp);
 
+/*
+ * Same as job_complete(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+void job_complete_locked(Job *job, Error **errp);
+
 /**
  * Asynchronously cancel the specified @job. If @force is true, the job should
  * be cancelled immediately without waiting for a consistent state.
  */
 void job_cancel(Job *job, bool force);
 
+/* Same as job_cancel(), but called with job lock held. */
+void job_cancel_locked(Job *job, bool force);
+
 /**
  * Cancels the specified job like job_cancel(), but may refuse to do so if the
  * operation isn't meaningful in the current state of the job.
  */
 void job_user_cancel(Job *job, bool force, Error **errp);
 
+/* Same as job_user_cancel(), but called with job lock held. */
+void job_user_cancel_locked(Job *job, bool force, Error **errp);
+
 /**
  * Synchronously cancel the @job.  The completion callback is called
  * before the function returns.  If @force is false, the job may
@@ -571,7 +671,14 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  */
 int job_cancel_sync(Job *job, bool force);
 
-/** Synchronously force-cancels all jobs using job_cancel_sync(). */
+/* Same as job_cancel_sync, but called with job lock held. */
+int job_cancel_sync_locked(Job *job, bool force);
+
+/**
+ * Synchronously force-cancels all jobs using job_cancel_sync_locked().
+ *
+ * Called with job_lock *not* held.
+ */
 void job_cancel_sync_all(void);
 
 /**
@@ -590,6 +697,9 @@ void job_cancel_sync_all(void);
  */
 int job_complete_sync(Job *job, Error **errp);
 
+/* Same as job_complete_sync, but called with job lock held. */
+int job_complete_sync_locked(Job *job, Error **errp);
+
 /**
  * For a @job that has finished its work and is pending awaiting explicit
  * acknowledgement to commit its work, this will commit that work.
@@ -600,12 +710,18 @@ int job_complete_sync(Job *job, Error **errp);
  */
 void job_finalize(Job *job, Error **errp);
 
+/* Same as job_finalize(), but called with job lock held. */
+void job_finalize_locked(Job *job, Error **errp);
+
 /**
  * Remove the concluded @job from the query list and resets the passed pointer
  * to %NULL. Returns an error if the job is not actually concluded.
  */
 void job_dismiss(Job **job, Error **errp);
 
+/* Same as job_dismiss(), but called with job lock held. */
+void job_dismiss_locked(Job **job, Error **errp);
+
 /**
  * Synchronously finishes the given @job. If @finish is given, it is called to
  * trigger completion or cancellation of the job.
@@ -615,6 +731,14 @@ void job_dismiss(Job **job, Error **errp);
  *
  * Callers must hold the AioContext lock of job->aio_context.
  */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
+int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
+                    Error **errp);
+
+/*
+ * Same as job_finish_sync(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
+                           Error **errp);
 
 #endif
diff --git a/job.c b/job.c
index 9500b5b36e..87564979cb 100644
--- a/job.c
+++ b/job.c
@@ -38,6 +38,7 @@
  */
 QemuMutex job_mutex;
 
+/* Protected by job_mutex */
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -113,18 +114,25 @@ JobTxn *job_txn_new(void)
     return txn;
 }
 
-static void job_txn_ref(JobTxn *txn)
+/* Called with job_mutex held. */
+static void job_txn_ref_locked(JobTxn *txn)
 {
     txn->refcnt++;
 }
 
-void job_txn_unref(JobTxn *txn)
+void job_txn_unref_locked(JobTxn *txn)
 {
     if (txn && --txn->refcnt == 0) {
         g_free(txn);
     }
 }
 
+void job_txn_unref(JobTxn *txn)
+{
+    JOB_LOCK_GUARD();
+    job_txn_unref_locked(txn);
+}
+
 /**
  * @txn: The transaction (may be NULL)
  * @job: Job to add to the transaction
@@ -134,8 +142,10 @@ void job_txn_unref(JobTxn *txn)
  * the reference that is automatically grabbed here.
  *
  * If @txn is NULL, the function does nothing.
+ *
+ * Called with job_mutex held.
  */
-static void job_txn_add_job(JobTxn *txn, Job *job)
+static void job_txn_add_job_locked(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
@@ -145,19 +155,21 @@ static void job_txn_add_job(JobTxn *txn, Job *job)
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
-        job_txn_unref(job->txn);
+        job_txn_unref_locked(job->txn);
         job->txn = NULL;
     }
 }
 
-static int job_txn_apply(Job *job, int fn(Job *))
+/* Called with job_mutex held, but releases it temporarily. */
+static int job_txn_apply_locked(Job *job, int fn(Job *))
 {
     AioContext *inner_ctx;
     Job *other_job, *next;
@@ -170,7 +182,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * we need to release it here to avoid holding the lock twice - which would
      * break AIO_WAIT_WHILE from within fn.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
@@ -188,7 +200,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * can't use a local variable to cache it.
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
     return rc;
 }
 
@@ -197,7 +209,8 @@ bool job_is_internal(Job *job)
     return (job->id == NULL);
 }
 
-static void job_state_transition(Job *job, JobStatus s1)
+/* Called with job_mutex held. */
+static void job_state_transition_locked(Job *job, JobStatus s1)
 {
     JobStatus s0 = job->status;
     assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
@@ -212,7 +225,7 @@ static void job_state_transition(Job *job, JobStatus s1)
     }
 }
 
-int job_apply_verb(Job *job, JobVerb verb, Error **errp)
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp)
 {
     JobStatus s0 = job->status;
     assert(verb >= 0 && verb < JOB_VERB__MAX);
@@ -226,6 +239,12 @@ int job_apply_verb(Job *job, JobVerb verb, Error **errp)
     return -EPERM;
 }
 
+int job_apply_verb(Job *job, JobVerb verb, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    return job_apply_verb_locked(job, verb, errp);
+}
+
 JobType job_type(const Job *job)
 {
     return job->driver->job_type;
@@ -236,19 +255,32 @@ const char *job_type_str(const Job *job)
     return JobType_str(job_type(job));
 }
 
-bool job_is_cancelled(Job *job)
+bool job_is_cancelled_locked(Job *job)
 {
     /* force_cancel may be true only if cancelled is true, too */
     assert(job->cancelled || !job->force_cancel);
     return job->force_cancel;
 }
 
-bool job_cancel_requested(Job *job)
+bool job_is_cancelled(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_cancelled_locked(job);
+}
+
+/* Called with job_mutex held. */
+static bool job_cancel_requested_locked(Job *job)
 {
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+bool job_cancel_requested(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_cancel_requested_locked(job);
+}
+
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -270,7 +302,13 @@ bool job_is_ready(Job *job)
     return false;
 }
 
-bool job_is_completed(Job *job)
+bool job_is_ready(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_ready_locked(job);
+}
+
+bool job_is_completed_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -292,17 +330,24 @@ bool job_is_completed(Job *job)
     return false;
 }
 
-static bool job_started(Job *job)
+bool job_is_completed(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_completed_locked(job);
+}
+
+static bool job_started_locked(Job *job)
 {
     return job->co;
 }
 
-static bool job_should_pause(Job *job)
+/* Called with job_mutex held. */
+static bool job_should_pause_locked(Job *job)
 {
     return job->pause_count > 0;
 }
 
-Job *job_next(Job *job)
+Job *job_next_locked(Job *job)
 {
     if (!job) {
         return QLIST_FIRST(&jobs);
@@ -310,7 +355,13 @@ Job *job_next(Job *job)
     return QLIST_NEXT(job, job_list);
 }
 
-Job *job_get(const char *id)
+Job *job_next(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_next_locked(job);
+}
+
+Job *job_get_locked(const char *id)
 {
     Job *job;
 
@@ -323,6 +374,13 @@ Job *job_get(const char *id)
     return NULL;
 }
 
+Job *job_get(const char *id)
+{
+    JOB_LOCK_GUARD();
+    return job_get_locked(id);
+}
+
+/* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
     Job *job = opaque;
@@ -336,6 +394,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
 {
     Job *job;
 
+    JOB_LOCK_GUARD();
+
     if (job_id) {
         if (flags & JOB_INTERNAL) {
             error_setg(errp, "Cannot specify job ID for internal job");
@@ -345,7 +405,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
             error_setg(errp, "Invalid job ID '%s'", job_id);
             return NULL;
         }
-        if (job_get(job_id)) {
+        if (job_get_locked(job_id)) {
             error_setg(errp, "Job ID '%s' already in use", job_id);
             return NULL;
         }
@@ -375,7 +435,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     notifier_list_init(&job->on_ready);
     notifier_list_init(&job->on_idle);
 
-    job_state_transition(job, JOB_STATUS_CREATED);
+    job_state_transition_locked(job, JOB_STATUS_CREATED);
     aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
                    QEMU_CLOCK_REALTIME, SCALE_NS,
                    job_sleep_timer_cb, job);
@@ -386,21 +446,27 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
      * consolidating the job management logic */
     if (!txn) {
         txn = job_txn_new();
-        job_txn_add_job(txn, job);
-        job_txn_unref(txn);
+        job_txn_add_job_locked(txn, job);
+        job_txn_unref_locked(txn);
     } else {
-        job_txn_add_job(txn, job);
+        job_txn_add_job_locked(txn, job);
     }
 
     return job;
 }
 
-void job_ref(Job *job)
+void job_ref_locked(Job *job)
 {
     ++job->refcnt;
 }
 
-void job_unref(Job *job)
+void job_ref(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_ref_locked(job);
+}
+
+void job_unref_locked(Job *job)
 {
     GLOBAL_STATE_CODE();
 
@@ -410,7 +476,9 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            job_unlock();
             job->driver->free(job);
+            job_lock();
         }
 
         QLIST_REMOVE(job, job_list);
@@ -422,6 +490,12 @@ void job_unref(Job *job)
     }
 }
 
+void job_unref(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_unref_locked(job);
+}
+
 void job_progress_update(Job *job, uint64_t done)
 {
     progress_work_done(&job->progress, done);
@@ -439,38 +513,43 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
 
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
 
-void job_enter_cond(Job *job, bool(*fn)(Job *job))
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
 {
-    if (!job_started(job)) {
+    if (!job_started_locked(job)) {
         return;
     }
     if (job->deferred_to_main_loop) {
@@ -492,12 +571,21 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
     timer_del(&job->sleep_timer);
     job->busy = true;
     real_job_unlock();
+    job_unlock();
     aio_co_enter(job->aio_context, job->co);
+    job_lock();
+}
+
+void job_enter_cond(Job *job, bool(*fn)(Job *job))
+{
+    JOB_LOCK_GUARD();
+    job_enter_cond_locked(job, fn);
 }
 
 void job_enter(Job *job)
 {
-    job_enter_cond(job, NULL);
+    JOB_LOCK_GUARD();
+    job_enter_cond_locked(job, NULL);
 }
 
 /* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
@@ -505,100 +593,129 @@ void job_enter(Job *job)
  * is allowed and cancels the timer.
  *
  * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
- * called explicitly. */
-static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
+ * called explicitly.
+ *
+ * Called with job_mutex held, but releases it temporarily.
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
+    job_unlock();
     qemu_coroutine_yield();
+    job_lock();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
-void coroutine_fn job_pause_point(Job *job)
+/* Called with job_mutex held, but releases it temporarily. */
+static void coroutine_fn job_pause_point_locked(Job *job)
 {
-    assert(job && job_started(job));
+    assert(job && job_started_locked(job));
 
-    if (!job_should_pause(job)) {
+    if (!job_should_pause_locked(job)) {
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
+        job_unlock();
         job->driver->resume(job);
+        job_lock();
     }
 }
 
-void coroutine_fn job_yield(Job *job)
+void coroutine_fn job_pause_point(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_pause_point_locked(job);
+}
+
+static void coroutine_fn job_yield_locked(Job *job)
 {
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
         return;
     }
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, -1);
+    if (!job_should_pause_locked(job)) {
+        job_do_yield_locked(job, -1);
     }
 
-    job_pause_point(job);
+    job_pause_point_locked(job);
+}
+
+void coroutine_fn job_yield(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_yield_locked(job);
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
 
-    if (!job_should_pause(job)) {
-        job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+    if (!job_should_pause_locked(job)) {
+        job_do_yield_locked(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
     }
 
-    job_pause_point(job);
+    job_pause_point_locked(job);
 }
 
-/* Assumes the block_job_mutex is held */
-static bool job_timer_not_pending(Job *job)
+/* Assumes the job_mutex is held */
+static bool job_timer_not_pending_locked(Job *job)
 {
     return !timer_pending(&job->sleep_timer);
 }
 
-void job_pause(Job *job)
+void job_pause_locked(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter(job);
+        job_enter_cond_locked(job, NULL);
     }
 }
 
-void job_resume(Job *job)
+void job_pause(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_pause_locked(job);
+}
+
+void job_resume_locked(Job *job)
 {
     assert(job->pause_count > 0);
     job->pause_count--;
@@ -607,12 +724,18 @@ void job_resume(Job *job)
     }
 
     /* kick only if no timer is pending */
-    job_enter_cond(job, job_timer_not_pending);
+    job_enter_cond_locked(job, job_timer_not_pending_locked);
 }
 
-void job_user_pause(Job *job, Error **errp)
+void job_resume(Job *job)
 {
-    if (job_apply_verb(job, JOB_VERB_PAUSE, errp)) {
+    JOB_LOCK_GUARD();
+    job_resume_locked(job);
+}
+
+void job_user_pause_locked(Job *job, Error **errp)
+{
+    if (job_apply_verb_locked(job, JOB_VERB_PAUSE, errp)) {
         return;
     }
     if (job->user_paused) {
@@ -620,15 +743,27 @@ void job_user_pause(Job *job, Error **errp)
         return;
     }
     job->user_paused = true;
-    job_pause(job);
+    job_pause_locked(job);
 }
 
-bool job_user_paused(Job *job)
+void job_user_pause(Job *job, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    job_user_pause_locked(job, errp);
+}
+
+bool job_user_paused_locked(Job *job)
 {
     return job->user_paused;
 }
 
-void job_user_resume(Job *job, Error **errp)
+bool job_user_paused(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_user_paused_locked(job);
+}
+
+void job_user_resume_locked(Job *job, Error **errp)
 {
     assert(job);
     GLOBAL_STATE_CODE();
@@ -636,66 +771,84 @@ void job_user_resume(Job *job, Error **errp)
         error_setg(errp, "Can't resume a job that was not paused");
         return;
     }
-    if (job_apply_verb(job, JOB_VERB_RESUME, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_RESUME, errp)) {
         return;
     }
     if (job->driver->user_resume) {
+        job_unlock();
         job->driver->user_resume(job);
+        job_lock();
     }
     job->user_paused = false;
-    job_resume(job);
+    job_resume_locked(job);
 }
 
-static void job_do_dismiss(Job *job)
+void job_user_resume(Job *job, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    job_user_resume_locked(job, errp);
+}
+
+/* Called with job_mutex held, but releases it temporarily. */
+static void job_do_dismiss_locked(Job *job)
 {
     assert(job);
     job->busy = false;
     job->paused = false;
     job->deferred_to_main_loop = true;
 
-    job_txn_del_job(job);
+    job_txn_del_job_locked(job);
 
-    job_state_transition(job, JOB_STATUS_NULL);
-    job_unref(job);
+    job_state_transition_locked(job, JOB_STATUS_NULL);
+    job_unref_locked(job);
 }
 
-void job_dismiss(Job **jobptr, Error **errp)
+void job_dismiss_locked(Job **jobptr, Error **errp)
 {
     Job *job = *jobptr;
     /* similarly to _complete, this is QMP-interface only. */
     assert(job->id);
-    if (job_apply_verb(job, JOB_VERB_DISMISS, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_DISMISS, errp)) {
         return;
     }
 
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
     *jobptr = NULL;
 }
 
+void job_dismiss(Job **jobptr, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    job_dismiss_locked(jobptr, errp);
+}
+
 void job_early_fail(Job *job)
 {
+    JOB_LOCK_GUARD();
     assert(job->status == JOB_STATUS_CREATED);
-    job_do_dismiss(job);
+    job_do_dismiss_locked(job);
 }
 
-static void job_conclude(Job *job)
+/* Called with job_mutex held. */
+static void job_conclude_locked(Job *job)
 {
-    job_state_transition(job, JOB_STATUS_CONCLUDED);
-    if (job->auto_dismiss || !job_started(job)) {
-        job_do_dismiss(job);
+    job_state_transition_locked(job, JOB_STATUS_CONCLUDED);
+    if (job->auto_dismiss || !job_started_locked(job)) {
+        job_do_dismiss_locked(job);
     }
 }
 
-static void job_update_rc(Job *job)
+/* Called with job_mutex held. */
+static void job_update_rc_locked(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
         if (!job->err) {
             error_setg(&job->err, "%s", strerror(-job->ret));
         }
-        job_state_transition(job, JOB_STATUS_ABORTING);
+        job_state_transition_locked(job, JOB_STATUS_ABORTING);
     }
 }
 
@@ -725,43 +878,57 @@ static void job_clean(Job *job)
     }
 }
 
-static int job_finalize_single(Job *job)
+/* Called with job_mutex held, but releases it temporarily */
+static int job_finalize_single_locked(Job *job)
 {
-    assert(job_is_completed(job));
+    int job_ret;
+
+    assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
-    job_update_rc(job);
+    job_update_rc_locked(job);
+
+    job_ret = job->ret;
+    job_unlock();
 
-    if (!job->ret) {
+    if (!job_ret) {
         job_commit(job);
     } else {
         job_abort(job);
     }
     job_clean(job);
 
+    job_lock();
+
     if (job->cb) {
-        job->cb(job->opaque, job->ret);
+        job_ret = job->ret;
+        job_unlock();
+        job->cb(job->opaque, job_ret);
+        job_lock();
     }
 
     /* Emit events only if we actually started */
-    if (job_started(job)) {
-        if (job_is_cancelled(job)) {
-            job_event_cancelled(job);
+    if (job_started_locked(job)) {
+        if (job_is_cancelled_locked(job)) {
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
+/* Called with job_mutex held, but releases it temporarily */
+static void job_cancel_async_locked(Job *job, bool force)
 {
     GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
+        job_unlock();
         force = job->driver->cancel(job, force);
+        job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
         force = true;
@@ -770,7 +937,9 @@ static void job_cancel_async(Job *job, bool force)
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
+            job_unlock();
             job->driver->user_resume(job);
+            job_lock();
         }
         job->user_paused = false;
         assert(job->pause_count > 0);
@@ -791,7 +960,8 @@ static void job_cancel_async(Job *job, bool force)
     }
 }
 
-static void job_completed_txn_abort(Job *job)
+/* Called with job_mutex held, but releases it temporarily. */
+static void job_completed_txn_abort_locked(Job *job)
 {
     AioContext *ctx;
     JobTxn *txn = job->txn;
@@ -804,7 +974,7 @@ static void job_completed_txn_abort(Job *job)
         return;
     }
     txn->aborting = true;
-    job_txn_ref(txn);
+    job_txn_ref_locked(txn);
 
     /*
      * We can only hold the single job's AioContext lock while calling
@@ -812,7 +982,7 @@ static void job_completed_txn_abort(Job *job)
      * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
@@ -827,7 +997,7 @@ static void job_completed_txn_abort(Job *job)
              * Therefore, pass force=true to terminate all other jobs as quickly
              * as possible.
              */
-            job_cancel_async(other_job, true);
+            job_cancel_async_locked(other_job, true);
             aio_context_release(ctx);
         }
     }
@@ -839,11 +1009,11 @@ static void job_completed_txn_abort(Job *job)
          */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
-        if (!job_is_completed(other_job)) {
-            assert(job_cancel_requested(other_job));
-            job_finish_sync(other_job, NULL, NULL);
+        if (!job_is_completed_locked(other_job)) {
+            assert(job_cancel_requested_locked(other_job));
+            job_finish_sync_locked(other_job, NULL, NULL);
         }
-        job_finalize_single(other_job);
+        job_finalize_single_locked(other_job);
         aio_context_release(ctx);
     }
 
@@ -852,110 +1022,132 @@ static void job_completed_txn_abort(Job *job)
      * even if the job went away during job_finalize_single().
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
 
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 }
 
-static int job_prepare(Job *job)
+/* Called with job_mutex held, but releases it temporarily */
+static int job_prepare_locked(Job *job)
 {
+    int ret;
+
     GLOBAL_STATE_CODE();
     if (job->ret == 0 && job->driver->prepare) {
-        job->ret = job->driver->prepare(job);
-        job_update_rc(job);
+        job_unlock();
+        ret = job->driver->prepare(job);
+        job_lock();
+        job->ret = ret;
+        job_update_rc_locked(job);
     }
     return job->ret;
 }
 
-static int job_needs_finalize(Job *job)
+/* Called with job_mutex held */
+static int job_needs_finalize_locked(Job *job)
 {
     return !job->auto_finalize;
 }
 
-static void job_do_finalize(Job *job)
+/* Called with job_mutex held */
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
 
-void job_finalize(Job *job, Error **errp)
+void job_finalize_locked(Job *job, Error **errp)
 {
     assert(job && job->id);
-    if (job_apply_verb(job, JOB_VERB_FINALIZE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_FINALIZE, errp)) {
         return;
     }
-    job_do_finalize(job);
+    job_do_finalize_locked(job);
 }
 
-static int job_transition_to_pending(Job *job)
+void job_finalize(Job *job, Error **errp)
 {
-    job_state_transition(job, JOB_STATUS_PENDING);
+    JOB_LOCK_GUARD();
+    job_finalize_locked(job, errp);
+}
+
+/* Called with job_mutex held. */
+static int job_transition_to_pending_locked(Job *job)
+{
+    job_state_transition_locked(job, JOB_STATUS_PENDING);
     if (!job->auto_finalize) {
-        job_event_pending(job);
+        job_event_pending_locked(job);
     }
     return 0;
 }
 
 void job_transition_to_ready(Job *job)
 {
-    job_state_transition(job, JOB_STATUS_READY);
-    job_event_ready(job);
+    JOB_LOCK_GUARD();
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
      * txn.
      */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             return;
         }
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
-    assert(job && job->txn && !job_is_completed(job));
+    assert(job && job->txn && !job_is_completed_locked(job));
 
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
+ * Called with job_mutex *not* held.
+ */
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
     AioContext *ctx;
+    JOB_LOCK_GUARD();
 
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
@@ -963,9 +1155,9 @@ static void job_exit(void *opaque)
      * drain block nodes, and if .drained_poll still returned true, we would
      * deadlock. */
     job->busy = false;
-    job_event_idle(job);
+    job_event_idle_locked(job);
 
-    job_completed(job);
+    job_completed_locked(job);
 
     /*
      * Note that calling job_completed can move the job to a different
@@ -974,7 +1166,7 @@ static void job_exit(void *opaque)
      * the job underneath us.
      */
     ctx = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(ctx);
 }
 
@@ -985,37 +1177,47 @@ static void job_exit(void *opaque)
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
+    assert(qemu_in_main_thread());
+
+    WITH_JOB_LOCK_GUARD() {
+        assert(job && !job_started_locked(job) && job->paused &&
+            job->driver && job->driver->run);
+        job->co = qemu_coroutine_create(job_co_entry, job);
+        job->pause_count--;
+        job->busy = true;
+        job->paused = false;
+        job_state_transition_locked(job, JOB_STATUS_RUNNING);
+    }
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_cancel(Job *job, bool force)
+void job_cancel_locked(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
-        job_do_dismiss(job);
+        job_do_dismiss_locked(job);
         return;
     }
-    job_cancel_async(job, force);
-    if (!job_started(job)) {
-        job_completed(job);
+    job_cancel_async_locked(job, force);
+    if (!job_started_locked(job)) {
+        job_completed_locked(job);
     } else if (job->deferred_to_main_loop) {
         /*
          * job_cancel_async() ignores soft-cancel requests for jobs
@@ -1027,102 +1229,150 @@ void job_cancel(Job *job, bool force)
          * choose to call job_is_cancelled() to show that we invoke
          * job_completed_txn_abort() only for force-cancelled jobs.)
          */
-        if (job_is_cancelled(job)) {
-            job_completed_txn_abort(job);
+        if (job_is_cancelled_locked(job)) {
+            job_completed_txn_abort_locked(job);
         }
     } else {
-        job_enter(job);
+        job_enter_cond_locked(job, NULL);
     }
 }
 
-void job_user_cancel(Job *job, bool force, Error **errp)
+void job_cancel(Job *job, bool force)
 {
-    if (job_apply_verb(job, JOB_VERB_CANCEL, errp)) {
+    JOB_LOCK_GUARD();
+    job_cancel_locked(job, force);
+}
+
+void job_user_cancel_locked(Job *job, bool force, Error **errp)
+{
+    if (job_apply_verb_locked(job, JOB_VERB_CANCEL, errp)) {
         return;
     }
-    job_cancel(job, force);
+    job_cancel_locked(job, force);
+}
+
+void job_user_cancel(Job *job, bool force, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    job_user_cancel_locked(job, force, errp);
 }
 
 /* A wrapper around job_cancel() taking an Error ** parameter so it may be
  * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there. */
-static void job_cancel_err(Job *job, Error **errp)
+ * pointer casts there.
+ *
+ * Called with job_mutex held.
+ */
+static void job_cancel_err_locked(Job *job, Error **errp)
 {
-    job_cancel(job, false);
+    job_cancel_locked(job, false);
 }
 
 /**
  * Same as job_cancel_err(), but force-cancel.
+ * Called with job_mutex held.
  */
-static void job_force_cancel_err(Job *job, Error **errp)
+static void job_force_cancel_err_locked(Job *job, Error **errp)
 {
-    job_cancel(job, true);
+    job_cancel_locked(job, true);
 }
 
-int job_cancel_sync(Job *job, bool force)
+int job_cancel_sync_locked(Job *job, bool force)
 {
     if (force) {
-        return job_finish_sync(job, &job_force_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_force_cancel_err_locked, NULL);
     } else {
-        return job_finish_sync(job, &job_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_cancel_err_locked, NULL);
     }
 }
 
+int job_cancel_sync(Job *job, bool force)
+{
+    JOB_LOCK_GUARD();
+    return job_cancel_sync_locked(job, force);
+}
+
 void job_cancel_sync_all(void)
 {
     Job *job;
     AioContext *aio_context;
+    JOB_LOCK_GUARD();
 
-    while ((job = job_next(NULL))) {
+    while ((job = job_next_locked(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        job_cancel_sync(job, true);
+        job_cancel_sync_locked(job, true);
         aio_context_release(aio_context);
     }
 }
 
+int job_complete_sync_locked(Job *job, Error **errp)
+{
+    return job_finish_sync_locked(job, job_complete_locked, errp);
+}
+
 int job_complete_sync(Job *job, Error **errp)
 {
-    return job_finish_sync(job, job_complete, errp);
+    JOB_LOCK_GUARD();
+    return job_complete_sync_locked(job, errp);
 }
 
-void job_complete(Job *job, Error **errp)
+void job_complete_locked(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
     GLOBAL_STATE_CODE();
-    if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
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
 
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
+void job_complete(Job *job, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    job_complete_locked(job, errp);
+}
+
+int job_finish_sync_locked(Job *job,
+                           void (*finish)(Job *, Error **errp),
+                           Error **errp)
 {
     Error *local_err = NULL;
     int ret;
 
-    job_ref(job);
+    job_ref_locked(job);
 
     if (finish) {
         finish(job, &local_err);
     }
     if (local_err) {
         error_propagate(errp, local_err);
-        job_unref(job);
+        job_unref_locked(job);
         return -EBUSY;
     }
 
+    job_unlock();
     AIO_WAIT_WHILE(job->aio_context,
                    (job_enter(job), !job_is_completed(job)));
+    job_lock();
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
-    job_unref(job);
+    ret = (job_is_cancelled_locked(job) && job->ret == 0)
+          ? -ECANCELED : job->ret;
+    job_unref_locked(job);
     return ret;
 }
+
+int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
+{
+    JOB_LOCK_GUARD();
+    return job_finish_sync_locked(job, finish, errp);
+}
-- 
2.37.3


