Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9219485585
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:12:29 +0100 (CET)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57xk-0001Cj-R2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:12:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56tG-0000uv-0E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sx-0008Dx-8L
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9KFzjfrQRYiykcdvOQDWrZC14aIDxSfC1t9wEbmH0U=;
 b=a/D0461tJDDABOjswyIytPjTmyrRkPyT2FHJBBjEXHRZNFWp9J1jSwmHbXPSRrGUNX0kBB
 AuZbwOYXP1I0e8O6TAdgkt+YtxKQ8kzDPmCMWdPDhGPQW2VC/eR//G+CT26TY4CTxSZuzn
 wEGxl2vBi529qCQsaxiXfFt/bh0zqoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-xk8B1DtkMJOfMAP9C7AyrA-1; Wed, 05 Jan 2022 09:03:23 -0500
X-MC-Unique: xk8B1DtkMJOfMAP9C7AyrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5118C6127A;
 Wed,  5 Jan 2022 14:02:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 184C53468B;
 Wed,  5 Jan 2022 14:02:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 04/16] job.h: define unlocked functions
Date: Wed,  5 Jan 2022 09:01:56 -0500
Message-Id: <20220105140208.365608-5-eesposit@redhat.com>
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
 blockjob.c         | 20 -------------
 include/qemu/job.h | 68 ++++++++++++++++++++++++++++++++++++++++++--
 job.c              | 70 ++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 133 insertions(+), 25 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 5b5d7f26b3..ce356be51e 100644
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
@@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n, void *opaque)
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
index 0d1c4d1bb1..f800b0b881 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -384,6 +384,7 @@ void job_txn_add_job_locked(JobTxn *txn, Job *job);
 
 /**
  * Create a new long-running job and return it.
+ * Called with job_mutex *not* held.
  *
  * @job_id: The id of the newly-created job, or %NULL for internal jobs
  * @driver: The class object for the newly-created job.
@@ -419,6 +420,8 @@ void job_unref_locked(Job *job);
  * @done: How much progress the job made since the last call
  *
  * Updates the progress counter of the job.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_update(Job *job, uint64_t done);
 
@@ -429,6 +432,8 @@ void job_progress_update(Job *job, uint64_t done);
  *
  * Sets the expected end value of the progress counter of a job so that a
  * completion percentage can be calculated when the progress is updated.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_set_remaining(Job *job, uint64_t remaining);
 
@@ -444,6 +449,8 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  * length before, and job_progress_update() afterwards.
  * (So the operation acts as a parenthesis in regards to the main job
  * operation running in background.)
+ *
+ * Progress API is thread safe.
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
@@ -467,13 +474,17 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
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
 
@@ -483,6 +494,9 @@ void job_enter(Job *job);
  * Pause now if job_pause_locked() has been called.
  * Jobs that perform lots of I/O must call this between
  * requests so that the job can be paused.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -490,6 +504,8 @@ void coroutine_fn job_pause_point(Job *job);
  * @job: The job that calls the function.
  *
  * Yield the job coroutine.
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void job_yield(Job *job);
 
@@ -500,6 +516,9 @@ void job_yield(Job *job);
  * Put the job to sleep (assuming that it wasn't canceled) for @ns
  * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
  * interrupt the wait.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
@@ -512,12 +531,19 @@ const char *job_type_str(const Job *job);
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
 
@@ -601,13 +627,19 @@ Job *job_get_locked(const char *id);
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
@@ -707,4 +739,34 @@ void job_dismiss_locked(Job **job, Error **errp);
 int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
                            Error **errp);
 
+/**
+ * Returns the @job->status.
+ * Called with job_mutex *not* held.
+ */
+JobStatus job_get_status(Job *job);
+
+/**
+ * Returns the @job->pause_count.
+ * Called with job_mutex *not* held.
+ */
+int job_get_pause_count(Job *job);
+
+/**
+ * Returns @job->paused.
+ * Called with job_mutex *not* held.
+ */
+bool job_get_paused(Job *job);
+
+/**
+ * Returns @job->busy.
+ * Called with job_mutex *not* held.
+ */
+bool job_get_busy(Job *job);
+
+/**
+ * Returns @job->aio_context.
+ * Called with job_mutex *not* held.
+ */
+AioContext *job_get_aio_context(Job *job);
+
 #endif
diff --git a/job.c b/job.c
index bb6ca2940c..f4e1a56705 100644
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
@@ -226,18 +242,61 @@ const char *job_type_str(const Job *job)
     return JobType_str(job_type(job));
 }
 
-bool job_is_cancelled(Job *job)
+JobStatus job_get_status(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job->status;
+}
+
+int job_get_pause_count(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job->pause_count;
+}
+
+bool job_get_paused(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job->paused;
+}
+
+bool job_get_busy(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job->busy;
+}
+
+AioContext *job_get_aio_context(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job->aio_context;
+}
+
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
@@ -288,6 +347,13 @@ bool job_is_completed_locked(Job *job)
     return false;
 }
 
+/* Called with job_mutex lock *not* held */
+static bool job_is_completed(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_completed_locked(job);
+}
+
 static bool job_started(Job *job)
 {
     return job->co;
-- 
2.31.1


