Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD0560334
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:38:05 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YpN-0001ty-Qd
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTy-0007wi-D4
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTt-00023J-RL
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656512149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5AaHjl5kBfuJCVPN9dewCN9kesbyjxpkbexHJDD7MY=;
 b=MeFUC2tvy1bvIyu8BmcAOfbOGuCowKcE4oXfOEzi4NvdZO444CD6rAjEUZM0YUQJsta0Tc
 26E1VJMJSbXzkJPAwNZ7m/6e/a0/n9yQNa5WA4QD/4SkAP7qYoSDpKkwrrKqSf/IJyoV9p
 Wd4G127u5vro81SNrD+v+orFlnzq92U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-9E_I11XmPcm5F6iU5WpbHg-1; Wed, 29 Jun 2022 10:15:45 -0400
X-MC-Unique: 9E_I11XmPcm5F6iU5WpbHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 337FA801233;
 Wed, 29 Jun 2022 14:15:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D81D918EAD;
 Wed, 29 Jun 2022 14:15:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v8 06/20] job.h: define functions called without job lock held
Date: Wed, 29 Jun 2022 10:15:24 -0400
Message-Id: <20220629141538.3400679-7-eesposit@redhat.com>
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions don't need a _locked() counterpart, since
they are all called outside job.c and take the lock only
internally.

Update also the comments in blockjob.c (and move them in job.c).

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c         | 20 --------------------
 include/qemu/job.h | 37 ++++++++++++++++++++++++++++++++++---
 job.c              | 15 +++++++++++++++
 3 files changed, 49 insertions(+), 23 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 4868453d74..7da59a1f1c 100644
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
index 99960cc9a3..b714236c1a 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -363,6 +363,7 @@ void job_txn_unref_locked(JobTxn *txn);
 
 /**
  * Create a new long-running job and return it.
+ * Called with job_mutex *not* held.
  *
  * @job_id: The id of the newly-created job, or %NULL for internal jobs
  * @driver: The class object for the newly-created job.
@@ -400,6 +401,8 @@ void job_unref_locked(Job *job);
  * @done: How much progress the job made since the last call
  *
  * Updates the progress counter of the job.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_update(Job *job, uint64_t done);
 
@@ -410,6 +413,8 @@ void job_progress_update(Job *job, uint64_t done);
  *
  * Sets the expected end value of the progress counter of a job so that a
  * completion percentage can be calculated when the progress is updated.
+ *
+ * Progress API is thread safe.
  */
 void job_progress_set_remaining(Job *job, uint64_t remaining);
 
@@ -425,6 +430,8 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  * length before, and job_progress_update() afterwards.
  * (So the operation acts as a parenthesis in regards to the main job
  * operation running in background.)
+ *
+ * Progress API is thread safe.
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
@@ -443,6 +450,8 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
  *
  * Begins execution of a job.
  * Takes ownership of one reference to the job object.
+ *
+ * Called with job_mutex *not* held.
  */
 void job_start(Job *job);
 
@@ -450,6 +459,7 @@ void job_start(Job *job);
  * @job: The job to enter.
  *
  * Continue the specified job by entering the coroutine.
+ * Called with job_mutex *not* held.
  */
 void job_enter(Job *job);
 
@@ -458,6 +468,9 @@ void job_enter(Job *job);
  *
  * Pause now if job_pause() has been called. Jobs that perform lots of I/O
  * must call this between requests so that the job can be paused.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -465,6 +478,8 @@ void coroutine_fn job_pause_point(Job *job);
  * @job: The job that calls the function.
  *
  * Yield the job coroutine.
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void job_yield(Job *job);
 
@@ -475,6 +490,9 @@ void job_yield(Job *job);
  * Put the job to sleep (assuming that it wasn't canceled) for @ns
  * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
  * interrupt the wait.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
@@ -496,6 +514,7 @@ bool job_is_cancelled_locked(Job *job);
 /**
  * Returns whether the job is scheduled for cancellation (at an
  * indefinite point).
+ * Called with job_mutex *not* held.
  */
 bool job_cancel_requested(Job *job);
 
@@ -582,10 +601,16 @@ int job_apply_verb(Job *job, JobVerb verb, Error **errp);
 /* Same as job_apply_verb, but called with job lock held. */
 int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
 
-/** The @job could not be started, free it. */
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
@@ -628,7 +653,13 @@ int job_cancel_sync(Job *job, bool force);
 /* Same as job_cancel_sync, but called with job lock held. */
 int job_cancel_sync_locked(Job *job, bool force);
 
-/** Synchronously force-cancels all jobs using job_cancel_sync(). */
+/**
+ * Synchronously force-cancels all jobs using job_cancel_sync_locked().
+ *
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
+ * patterns in the caller.
+ */
 void job_cancel_sync_all(void);
 
 /**
diff --git a/job.c b/job.c
index dd44fac8dd..7a3cc93f66 100644
--- a/job.c
+++ b/job.c
@@ -32,12 +32,27 @@
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
+ *
+ *
+ * The second includes functions used by the block job drivers and sometimes
+ * by the core block layer. These delegate the locking to the callee instead.
+ */
+
 /*
  * job_mutex protects the jobs list, but also makes the
  * struct job fields thread-safe.
  */
 QemuMutex job_mutex;
 
+/* Protected by job_mutex */
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
-- 
2.31.1


