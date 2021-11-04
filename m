Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE9445663
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:33:49 +0100 (CET)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miekO-0003pR-Qr
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiF-00013F-R5
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiB-0001ZU-Re
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636039890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHrKZspW4xfOAJZsV1LkSiCBylCFy5gWcth4e3lvJjg=;
 b=A2ra7grqov8z9pw2FvXJ14CdiaIhVGm736Ee5QbtHc2UM+LQ1SRNKbeEdHt7PjILCcDHLi
 fr/adbxDvQJ6+Jy+aBQIjiM+1pBhCbt2AWQRuvo6y+nLTFgMv20suVF+Hp/bcJmnwvPgXQ
 G3CmIUUT2iRU43tArzBrZ+RwqKIILQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-CzQIS4NLOxq5_LTRTZdOZg-1; Thu, 04 Nov 2021 11:31:27 -0400
X-MC-Unique: CzQIS4NLOxq5_LTRTZdOZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E7911B4C04;
 Thu,  4 Nov 2021 15:31:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C66F67840;
 Thu,  4 Nov 2021 15:31:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/3] jobs: add job-monitor.h
Date: Thu,  4 Nov 2021 11:31:20 -0400
Message-Id: <20211104153121.1362449-3-eesposit@redhat.com>
In-Reply-To: <20211104153121.1362449-1-eesposit@redhat.com>
References: <20211104153121.1362449-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job-monitor.h contains all functions of job.h that are used by the
monitor and essentially all functions that do not define a
JobDriver/Blockdriver.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-monitor.h | 282 +++++++++++++++++++++++++++++++++++++
 include/qemu/job.h         | 228 +-----------------------------
 job.c                      |   1 +
 3 files changed, 284 insertions(+), 227 deletions(-)
 create mode 100644 include/qemu/job-monitor.h

diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
new file mode 100644
index 0000000000..7189cdafef
--- /dev/null
+++ b/include/qemu/job-monitor.h
@@ -0,0 +1,282 @@
+/*
+ * Declarations for background jobs
+ *
+ * Copyright (c) 2011 IBM Corp.
+ * Copyright (c) 2012, 2018 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef JOB_MONITOR_H
+#define JOB_MONITOR_H
+
+#include "job-common.h"
+
+/*
+ * Job monitor API.
+ *
+ * These functions use are used by the QEMU monitor, for example
+ * to execute QMP commands. The monitor is aware of the job_mutex
+ * presence, so these functions assume it is held by the caller
+ * to protect job fields (see job-common.h).
+ * This prevents TOC/TOU bugs, allowing the caller to hold the
+ * lock between a check in the job state and the actual action.
+ *
+ * Therefore, each function in this API that needs protection
+ * must have the comment
+ * "Called between job_lock and job_unlock."
+ */
+
+/**
+ * Allocate and return a new job transaction. Jobs can be added to the
+ * transaction using job_txn_add_job().
+ *
+ * The transaction is automatically freed when the last job completes or is
+ * cancelled.
+ *
+ * All jobs in the transaction either complete successfully or fail/cancel as a
+ * group.  Jobs wait for each other before completing.  Cancelling one job
+ * cancels all jobs in the transaction.
+ */
+JobTxn *job_txn_new(void);
+
+/**
+ * Release a reference that was previously acquired with job_txn_add_job or
+ * job_txn_new. If it's the last reference to the object, it will be freed.
+ */
+void job_txn_unref(JobTxn *txn);
+
+/**
+ * @txn: The transaction (may be NULL)
+ * @job: Job to add to the transaction
+ *
+ * Add @job to the transaction.  The @job must not already be in a transaction.
+ * The caller must call either job_txn_unref() or job_completed() to release
+ * the reference that is automatically grabbed here.
+ *
+ * If @txn is NULL, the function does nothing.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_txn_add_job(JobTxn *txn, Job *job);
+
+/**
+ * Add a reference to Job refcnt, it will be decreased with job_unref, and then
+ * be freed if it comes to be the last reference.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_ref(Job *job);
+
+/**
+ * Release a reference that was previously acquired with job_ref() or
+ * job_create(). If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_unref(Job *job);
+
+/**
+ * Conditionally enter the job coroutine if the job is ready to run, not
+ * already busy and fn() returns true. fn() is called while under the job_lock
+ * critical section.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
+void job_enter_cond(Job *job, bool(*fn)(Job *job));
+
+/**
+ * Returns true if the job should not be visible to the management layer.
+ */
+bool job_is_internal(Job *job);
+
+/**
+ * Returns whether the job is in a completed state.
+ * Called between job_lock and job_unlock.
+ */
+bool job_is_completed(Job *job);
+
+/**
+ * Request @job to pause at the next pause point. Must be paired with
+ * job_resume(). If the job is supposed to be resumed by user action, call
+ * job_user_pause() instead.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_pause(Job *job);
+
+/**
+ * Resumes a @job paused with job_pause.
+ * Called between job_lock and job_unlock.
+ */
+void job_resume(Job *job);
+
+/**
+ * Asynchronously pause the specified @job.
+ * Do not allow a resume until a matching call to job_user_resume.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_user_pause(Job *job, Error **errp);
+
+/**
+ * Returns true if the job is user-paused.
+ * Called between job_lock and job_unlock.
+ */
+bool job_user_paused(Job *job);
+
+/**
+ * Resume the specified @job.
+ * Must be paired with a preceding job_user_pause.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_user_resume(Job *job, Error **errp);
+
+/**
+ * Get the next element from the list of block jobs after @job, or the
+ * first one if @job is %NULL.
+ *
+ * Returns the requested job, or %NULL if there are no more jobs left.
+ *
+ * Called between job_lock and job_unlock.
+ */
+Job *job_next(Job *job);
+
+/**
+ * Get the job identified by @id (which must not be %NULL).
+ *
+ * Returns the requested job, or %NULL if it doesn't exist.
+ *
+ * Called between job_lock and job_unlock.
+ */
+Job *job_get(const char *id);
+
+/**
+ * Check whether the verb @verb can be applied to @job in its current state.
+ * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
+ * returned.
+ *
+ * Called between job_lock and job_unlock.
+ */
+int job_apply_verb(Job *job, JobVerb verb, Error **errp);
+
+/**
+ * Asynchronously complete the specified @job.
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
+void job_complete(Job *job, Error **errp);
+
+/**
+ * Asynchronously cancel the specified @job. If @force is true, the job should
+ * be cancelled immediately without waiting for a consistent state.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_cancel(Job *job, bool force);
+
+/**
+ * Cancels the specified job like job_cancel(), but may refuse to do so if the
+ * operation isn't meaningful in the current state of the job.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_user_cancel(Job *job, bool force, Error **errp);
+
+/**
+ * Synchronously cancel the @job.  The completion callback is called
+ * before the function returns.  If @force is false, the job may
+ * actually complete instead of canceling itself; the circumstances
+ * under which this happens depend on the kind of job that is active.
+ *
+ * Returns the return value from the job if the job actually completed
+ * during the call, or -ECANCELED if it was canceled.
+ *
+ * Callers must hold the AioContext lock of job->aio_context.
+ */
+int job_cancel_sync(Job *job, bool force);
+
+/**
+ * Synchronously force-cancels all jobs using job_cancel_sync().
+ *
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
+ * patterns in the caller.
+ */
+void job_cancel_sync_all(void);
+
+/**
+ * @job: The job to be completed.
+ * @errp: Error object which may be set by job_complete(); this is not
+ *        necessarily set on every error, the job return value has to be
+ *        checked as well.
+ *
+ * Synchronously complete the job.  The completion callback is called before the
+ * function returns, unless it is NULL (which is permissible when using this
+ * function).
+ *
+ * Returns the return value from the job.
+ *
+ * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
+ */
+int job_complete_sync(Job *job, Error **errp);
+
+/**
+ * For a @job that has finished its work and is pending awaiting explicit
+ * acknowledgement to commit its work, this will commit that work.
+ *
+ * FIXME: Make the below statement universally true:
+ * For jobs that support the manual workflow mode, all graph changes that occur
+ * as a result will occur after this command and before a successful reply.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_finalize(Job *job, Error **errp);
+
+/**
+ * Remove the concluded @job from the query list and resets the passed pointer
+ * to %NULL. Returns an error if the job is not actually concluded.
+ *
+ * Called between job_lock and job_unlock.
+ */
+void job_dismiss(Job **job, Error **errp);
+
+/**
+ * Synchronously finishes the given @job. If @finish is given, it is called to
+ * trigger completion or cancellation of the job.
+ *
+ * Returns 0 if the job is successfully completed, -ECANCELED if the job was
+ * cancelled before completing, and -errno in other error cases.
+ *
+ * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
+int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
+                    Error **errp);
+
+/** Same as job_is_ready(), but assumes job_lock is held. */
+bool job_is_ready_locked(Job *job);
+
+/** Same as job_early_fail(), but assumes job_lock is held. */
+void job_early_fail_locked(Job *job);
+
+#endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 0003b636bc..79f5367f3d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -26,40 +26,7 @@
 #ifndef JOB_H
 #define JOB_H
 
-#include "job-common.h"
-
-/**
- * Allocate and return a new job transaction. Jobs can be added to the
- * transaction using job_txn_add_job().
- *
- * The transaction is automatically freed when the last job completes or is
- * cancelled.
- *
- * All jobs in the transaction either complete successfully or fail/cancel as a
- * group.  Jobs wait for each other before completing.  Cancelling one job
- * cancels all jobs in the transaction.
- */
-JobTxn *job_txn_new(void);
-
-/**
- * Release a reference that was previously acquired with job_txn_add_job or
- * job_txn_new. If it's the last reference to the object, it will be freed.
- */
-void job_txn_unref(JobTxn *txn);
-
-/**
- * @txn: The transaction (may be NULL)
- * @job: Job to add to the transaction
- *
- * Add @job to the transaction.  The @job must not already be in a transaction.
- * The caller must call either job_txn_unref() or job_completed() to release
- * the reference that is automatically grabbed here.
- *
- * If @txn is NULL, the function does nothing.
- *
- * Called between job_lock and job_unlock.
- */
-void job_txn_add_job(JobTxn *txn, Job *job);
+#include "job-monitor.h"
 
 /**
  * Create a new long-running job and return it.
@@ -77,22 +44,6 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  AioContext *ctx, int flags, BlockCompletionFunc *cb,
                  void *opaque, Error **errp);
 
-/**
- * Add a reference to Job refcnt, it will be decreased with job_unref, and then
- * be freed if it comes to be the last reference.
- *
- * Called between job_lock and job_unlock.
- */
-void job_ref(Job *job);
-
-/**
- * Release a reference that was previously acquired with job_ref() or
- * job_create(). If it's the last reference to the object, it will be freed.
- *
- * Called between job_lock and job_unlock.
- */
-void job_unref(Job *job);
-
 /**
  * @job: The job that has made progress
  * @done: How much progress the job made since the last call
@@ -126,15 +77,6 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
-/**
- * Conditionally enter the job coroutine if the job is ready to run, not
- * already busy and fn() returns true. fn() is called while under the job_lock
- * critical section.
- *
- * Called between job_lock and job_unlock, but it releases the lock temporarly.
- */
-void job_enter_cond(Job *job, bool(*fn)(Job *job));
-
 /**
  * @job: A job that has not yet been started.
  *
@@ -175,9 +117,6 @@ void job_yield(Job *job);
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
-/** Returns true if the job should not be visible to the management layer. */
-bool job_is_internal(Job *job);
-
 /** Returns whether the job is being cancelled. */
 bool job_is_cancelled(Job *job);
 
@@ -187,180 +126,15 @@ bool job_is_cancelled(Job *job);
  */
 bool job_cancel_requested(Job *job);
 
-/**
- * Returns whether the job is in a completed state.
- * Called between job_lock and job_unlock.
- */
-bool job_is_completed(Job *job);
-
 /** Returns whether the job is ready to be completed. */
 bool job_is_ready(Job *job);
 
-/** Same as job_is_ready(), but assumes job_lock is held. */
-bool job_is_ready_locked(Job *job);
-
-/**
- * Request @job to pause at the next pause point. Must be paired with
- * job_resume(). If the job is supposed to be resumed by user action, call
- * job_user_pause() instead.
- *
- * Called between job_lock and job_unlock.
- */
-void job_pause(Job *job);
-
-/**
- * Resumes a @job paused with job_pause.
- * Called between job_lock and job_unlock.
- */
-void job_resume(Job *job);
-
-/**
- * Asynchronously pause the specified @job.
- * Do not allow a resume until a matching call to job_user_resume.
- *
- * Called between job_lock and job_unlock.
- */
-void job_user_pause(Job *job, Error **errp);
-
-/**
- * Returns true if the job is user-paused.
- * Called between job_lock and job_unlock.
- */
-bool job_user_paused(Job *job);
-
-/**
- * Resume the specified @job.
- * Must be paired with a preceding job_user_pause.
- *
- * Called between job_lock and job_unlock.
- */
-void job_user_resume(Job *job, Error **errp);
-
-/**
- * Get the next element from the list of block jobs after @job, or the
- * first one if @job is %NULL.
- *
- * Returns the requested job, or %NULL if there are no more jobs left.
- *
- * Called between job_lock and job_unlock.
- */
-Job *job_next(Job *job);
-
-/**
- * Get the job identified by @id (which must not be %NULL).
- *
- * Returns the requested job, or %NULL if it doesn't exist.
- *
- * Called between job_lock and job_unlock.
- */
-Job *job_get(const char *id);
-
-/**
- * Check whether the verb @verb can be applied to @job in its current state.
- * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
- * returned.
- *
- * Called between job_lock and job_unlock.
- */
-int job_apply_verb(Job *job, JobVerb verb, Error **errp);
-
 /** The @job could not be started, free it. */
 void job_early_fail(Job *job);
 
-/** Same as job_early_fail(), but assumes job_lock is held. */
-void job_early_fail_locked(Job *job);
-
 /** Moves the @job from RUNNING to READY */
 void job_transition_to_ready(Job *job);
 
-/**
- * Asynchronously complete the specified @job.
- * Called between job_lock and job_unlock, but it releases the lock temporarly.
- */
-void job_complete(Job *job, Error **errp);
-
-/**
- * Asynchronously cancel the specified @job. If @force is true, the job should
- * be cancelled immediately without waiting for a consistent state.
- *
- * Called between job_lock and job_unlock.
- */
-void job_cancel(Job *job, bool force);
-
-/**
- * Cancels the specified job like job_cancel(), but may refuse to do so if the
- * operation isn't meaningful in the current state of the job.
- *
- * Called between job_lock and job_unlock.
- */
-void job_user_cancel(Job *job, bool force, Error **errp);
-
-/**
- * Synchronously cancel the @job.  The completion callback is called
- * before the function returns.  If @force is false, the job may
- * actually complete instead of canceling itself; the circumstances
- * under which this happens depend on the kind of job that is active.
- *
- * Returns the return value from the job if the job actually completed
- * during the call, or -ECANCELED if it was canceled.
- */
-int job_cancel_sync(Job *job, bool force);
-
-/**
- * Synchronously force-cancels all jobs using job_cancel_sync().
- *
- * Called with job_lock *not* held, unlike most other APIs consumed
- * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
- * patterns in the caller.
- */
-void job_cancel_sync_all(void);
-
-/**
- * @job: The job to be completed.
- * @errp: Error object which may be set by job_complete(); this is not
- *        necessarily set on every error, the job return value has to be
- *        checked as well.
- *
- * Synchronously complete the job.  The completion callback is called before the
- * function returns, unless it is NULL (which is permissible when using this
- * function).
- *
- * Returns the return value from the job.
- * Called between job_lock and job_unlock.
- */
-int job_complete_sync(Job *job, Error **errp);
-
-/**
- * For a @job that has finished its work and is pending awaiting explicit
- * acknowledgement to commit its work, this will commit that work.
- *
- * FIXME: Make the below statement universally true:
- * For jobs that support the manual workflow mode, all graph changes that occur
- * as a result will occur after this command and before a successful reply.
- *
- * Called between job_lock and job_unlock.
- */
-void job_finalize(Job *job, Error **errp);
-
-/**
- * Remove the concluded @job from the query list and resets the passed pointer
- * to %NULL. Returns an error if the job is not actually concluded.
- *
- * Called between job_lock and job_unlock.
- */
-void job_dismiss(Job **job, Error **errp);
-
-/**
- * Synchronously finishes the given @job. If @finish is given, it is called to
- * trigger completion or cancellation of the job.
- *
- * Returns 0 if the job is successfully completed, -ECANCELED if the job was
- * cancelled before completing, and -errno in other error cases.
- *
- * Called between job_lock and job_unlock.
- */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
-
 /** Enters the @job if it is not paused */
 void job_enter_not_paused(Job *job);
 
diff --git a/job.c b/job.c
index 53c64fcde1..aa8c4fe1b6 100644
--- a/job.c
+++ b/job.c
@@ -40,6 +40,7 @@
  * therefore needs consistency across job_get and the actual operation
  * (e.g. job_user_cancel). To achieve this consistency, the caller
  * calls job_lock/job_unlock itself around the whole operation.
+ * These functions are declared in job-monitor.h.
  *
  *
  * The second includes functions used by the block job drivers and sometimes
-- 
2.27.0


