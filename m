Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94FD49F8FA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:11:36 +0100 (CET)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQ6J-0005Nj-Ru
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmQ-0004ad-94
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmJ-0003QS-Tp
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpK6YwXXmaGiaJSMzMZgz5JuC7LtKXmaevRPXpWssQk=;
 b=KnYw531oPimpghdeeIkI6syjBg6TrtgfHS67j1v+bV+ipOlXIjTHq4JddDKyjqNVopKCEI
 JzFmJLa1RMCYzsBJQipNPkOxm08kESKhu4oGxSXSKER5kzg1fjlEUckM1NHBNLkF/g/vbf
 TDHQxaM0lajHVkoOBBpTQ6fAfXtf5q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Nmr0YNLqOrqFwg4JJXKgsw-1; Fri, 28 Jan 2022 06:50:49 -0500
X-MC-Unique: Nmr0YNLqOrqFwg4JJXKgsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FA742F4D;
 Fri, 28 Jan 2022 11:50:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694E622DE3;
 Fri, 28 Jan 2022 11:50:47 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 12/19] job.h: define unlocked functions
Date: Fri, 28 Jan 2022 06:50:24 -0500
Message-Id: <20220128115031.4061565-13-eesposit@redhat.com>
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

All these functions assume that the lock is not held, and acquire
it internally.

These functions will be useful when job_lock is globally applied,
as they will allow callers to access the job struct fields
without worrying about the job lock.

Update also the comments in blockjob.c (and move them in job.c).

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c         | 20 -----------------
 include/qemu/job.h | 38 ++++++++++++++++++++++++++++---
 job.c              | 56 +++++++++++++++++++++++++++++++++++-----------
 3 files changed, 78 insertions(+), 36 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index f1a30833bd..a6c94b6b64 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -36,21 +36,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 
-/*
- * The block job API is composed of two categories of functions.
- *
- * The first includes functions used by the monitor.  The monitor is
- * peculiar in that it accesses the block job list with block_job_get, and
- * therefore needs consistency across block_job_get and the actual operation
- * (e.g. block_job_set_speed).  The consistency is achieved with
- * aio_context_acquire/release.  These functions are declared in blockjob.h.
- *
- * The second includes functions used by the block job drivers and sometimes
- * by the core block layer.  These do not care about locking, because the
- * whole coroutine runs under the AioContext lock, and are declared in
- * blockjob_int.h.
- */
-
 static bool is_block_job(Job *job)
 {
     return job_type(job) == JOB_TYPE_BACKUP ||
@@ -451,11 +436,6 @@ static void block_job_event_ready_locked(Notifier *n, void *opaque)
 }
 
 
-/*
- * API for block job drivers and the block layer.  These functions are
- * declared in blockjob_int.h.
- */
-
 void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        JobTxn *txn, BlockDriverState *bs, uint64_t perm,
                        uint64_t shared_perm, int64_t speed, int flags,
diff --git a/include/qemu/job.h b/include/qemu/job.h
index e13c976ba5..fc57472e84 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -382,6 +382,7 @@ void job_txn_add_job_locked(JobTxn *txn, Job *job);
 
 /**
  * Create a new long-running job and return it.
+ * Called with job_mutex *not* held.
  *
  * @job_id: The id of the newly-created job, or %NULL for internal jobs
  * @driver: The class object for the newly-created job.
@@ -417,6 +418,8 @@ void job_unref_locked(Job *job);
  * @done: How much progress the job made since the last call
  *
  * Updates the progress counter of the job.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_update(Job *job, uint64_t done);
 
@@ -427,6 +430,8 @@ void job_progress_update(Job *job, uint64_t done);
  *
  * Sets the expected end value of the progress counter of a job so that a
  * completion percentage can be calculated when the progress is updated.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_set_remaining(Job *job, uint64_t remaining);
 
@@ -442,6 +447,8 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  * length before, and job_progress_update() afterwards.
  * (So the operation acts as a parenthesis in regards to the main job
  * operation running in background.)
+ *
+ * Progress API is thread safe.
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
@@ -459,13 +466,17 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
  *
  * Begins execution of a job.
  * Takes ownership of one reference to the job object.
+ *
+ * Called with job_mutex *not* held.
  */
 void job_start(Job *job);
 
 /**
  * @job: The job to enter.
+ * Called with job_mutex *not* held.
  *
  * Continue the specified job by entering the coroutine.
+ * Called with job_mutex lock *not* held.
  */
 void job_enter(Job *job);
 
@@ -475,6 +486,9 @@ void job_enter(Job *job);
  * Pause now if job_pause_locked() has been called.
  * Jobs that perform lots of I/O must call this between
  * requests so that the job can be paused.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -482,6 +496,8 @@ void coroutine_fn job_pause_point(Job *job);
  * @job: The job that calls the function.
  *
  * Yield the job coroutine.
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void job_yield(Job *job);
 
@@ -492,6 +508,9 @@ void job_yield(Job *job);
  * Put the job to sleep (assuming that it wasn't canceled) for @ns
  * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
  * interrupt the wait.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
@@ -504,12 +523,19 @@ const char *job_type_str(const Job *job);
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-/** Returns whether the job is being cancelled. */
+/**
+ * Returns whether the job is being cancelled.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_cancelled(Job *job);
 
+/** Just like job_is_cancelled, but called between job_lock and job_unlock */
+bool job_is_cancelled_locked(Job *job);
+
 /**
  * Returns whether the job is scheduled for cancellation (at an
  * indefinite point).
+ * Called with job_mutex *not* held.
  */
 bool job_cancel_requested(Job *job);
 
@@ -593,13 +619,19 @@ Job *job_get_locked(const char *id);
  */
 int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
 
-/** The @job could not be started, free it. */
+/**
+ * The @job could not be started, free it.
+ * Called with job_mutex *not* held.
+ */
 void job_early_fail(Job *job);
 
 /** Same as job_early_fail(), but assumes job_lock is held. */
 void job_early_fail_locked(Job *job);
 
-/** Moves the @job from RUNNING to READY */
+/**
+ * Moves the @job from RUNNING to READY.
+ * Called with job_mutex *not* held.
+ */
 void job_transition_to_ready(Job *job);
 
 /**
diff --git a/job.c b/job.c
index 2f2b4892e0..468a387390 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,22 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/*
+ * The job API is composed of two categories of functions.
+ *
+ * The first includes functions used by the monitor.  The monitor is
+ * peculiar in that it accesses the block job list with job_get, and
+ * therefore needs consistency across job_get and the actual operation
+ * (e.g. job_user_cancel). To achieve this consistency, the caller
+ * calls job_lock/job_unlock itself around the whole operation.
+ * These functions are declared in job-monitor.h.
+ *
+ *
+ * The second includes functions used by the block job drivers and sometimes
+ * by the core block layer. These delegate the locking to the callee instead,
+ * and are declared in job-driver.h.
+ */
+
 /*
  * job_mutex protects the jobs list, but also makes the
  * struct job fields thread-safe.
@@ -227,18 +243,31 @@ const char *job_type_str(const Job *job)
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
 
+bool job_cancel_requested(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_cancel_requested_locked(job);
+}
+
 bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
@@ -551,7 +580,7 @@ void coroutine_fn job_pause_point(Job *job)
         job_unlock();
         return;
     }
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
         job_unlock();
         return;
     }
@@ -585,7 +614,7 @@ void job_yield(Job *job)
         assert(job->busy);
 
         /* Check cancellation *before* setting busy = false, too!  */
-        if (job_is_cancelled(job)) {
+        if (job_is_cancelled_locked(job)) {
             return;
         }
 
@@ -603,7 +632,7 @@ void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
         assert(job->busy);
 
         /* Check cancellation *before* setting busy = false, too!  */
-        if (job_is_cancelled(job)) {
+        if (job_is_cancelled_locked(job)) {
             return;
         }
 
@@ -731,7 +760,7 @@ static void job_conclude_locked(Job *job)
 /* Called with job_mutex held. */
 static void job_update_rc_locked(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
@@ -909,7 +938,7 @@ static void job_completed_txn_abort_locked(Job *job)
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed_locked(other_job)) {
-            assert(job_cancel_requested(other_job));
+            assert(job_cancel_requested_locked(other_job));
             job_finish_sync_locked(other_job, NULL, NULL);
         }
         aio_context_release(ctx);
@@ -1133,10 +1162,10 @@ void job_cancel_locked(Job *job, bool force)
          * job_cancel_async_locked() ignores soft-cancel requests for jobs
          * that are already done (i.e. deferred to the main loop).  We
          * have to check again whether the job is really cancelled.
-         * (job_cancel_requested() and job_is_cancelled() are equivalent
-         * here, because job_cancel_async_locked() will make soft-cancel
-         * requests no-ops when deferred_to_main_loop is true.  We
-         * choose to call job_is_cancelled() to show that we invoke
+         * (job_cancel_requested_locked() and job_is_cancelled_locked() are
+         * equivalent here, because job_cancel_async_locked() will make
+         * soft-cancel requests no-ops when deferred_to_main_loop is true.  We
+         * choose to call job_is_cancelled_locked() to show that we invoke
          * job_completed_txn_abort_locked() only for force-cancelled jobs.)
          */
         if (job_is_cancelled_locked(job)) {
@@ -1213,7 +1242,7 @@ void job_complete_locked(Job *job, Error **errp)
     if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_cancel_requested(job) || !job->driver->complete) {
+    if (job_cancel_requested_locked(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
@@ -1246,7 +1275,8 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
                    (job_enter(job), !job_is_completed(job)));
     job_lock();
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
+    ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
+          -ECANCELED : job->ret;
     job_unref_locked(job);
     return ret;
 }
-- 
2.31.1


