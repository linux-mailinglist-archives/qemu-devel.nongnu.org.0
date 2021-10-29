Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC544007F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:43:03 +0200 (CEST)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUy6-0001v1-8A
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv2-0006jE-OC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUuv-0003Lp-3h
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DY5ZD8ylORg/qMGHFiLOdK/62qb51+HdjO9Y0BsQ70s=;
 b=b6pxghgt3desm67h65t8PIihBCr5ba8tWGKXezdmzUgknVOAuC5mkmsDmjl6ldef7yHkva
 9K/5cpIE1IfsQ7KdI7+suQgsBtG6+YLBC6pQ245lk0jpSt9wE+LizzcrvrdNIeXBYnhw1r
 vaJZKrW+9IrBm3r6PbGxWibkeOfLG2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-mWOfH6BRNy2sXwX3i5KEtw-1; Fri, 29 Oct 2021 12:39:41 -0400
X-MC-Unique: mWOfH6BRNy2sXwX3i5KEtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B715E10A8E00;
 Fri, 29 Oct 2021 16:39:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4F1969214;
 Fri, 29 Oct 2021 16:39:38 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 04/15] jobs: add job-monitor.h
Date: Fri, 29 Oct 2021 12:39:03 -0400
Message-Id: <20211029163914.4044794-5-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

job-monitor.h contains all functions of job.h that are used by the
monitor and essentially all functions that do not define a
JobDriver/Blockdriver.

Right now just move the headers, proper categorization and API
definition will come in the next commit.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-monitor.h | 220 +++++++++++++++++++++++++++++++++++++
 include/qemu/job.h         | 180 +-----------------------------
 2 files changed, 221 insertions(+), 179 deletions(-)
 create mode 100644 include/qemu/job-monitor.h

diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
new file mode 100644
index 0000000000..b5b41a7548
--- /dev/null
+++ b/include/qemu/job-monitor.h
@@ -0,0 +1,220 @@
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
+ */
+void job_txn_add_job(JobTxn *txn, Job *job);
+
+/**
+ * Add a reference to Job refcnt, it will be decreased with job_unref, and then
+ * be freed if it comes to be the last reference.
+ */
+void job_ref(Job *job);
+
+/**
+ * Release a reference that was previously acquired with job_ref() or
+ * job_create(). If it's the last reference to the object, it will be freed.
+ */
+void job_unref(Job *job);
+
+/**
+ * Conditionally enter the job coroutine if the job is ready to run, not
+ * already busy and fn() returns true. fn() is called while under the job_lock
+ * critical section.
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
+ */
+bool job_is_completed(Job *job);
+
+/**
+ * Request @job to pause at the next pause point. Must be paired with
+ * job_resume(). If the job is supposed to be resumed by user action, call
+ * job_user_pause() instead.
+ */
+void job_pause(Job *job);
+
+/**
+ * Resumes a @job paused with job_pause.
+ */
+void job_resume(Job *job);
+
+/**
+ * Asynchronously pause the specified @job.
+ * Do not allow a resume until a matching call to job_user_resume.
+ */
+void job_user_pause(Job *job, Error **errp);
+
+/**
+ * Returns true if the job is user-paused.
+ */
+bool job_user_paused(Job *job);
+
+/**
+ * Resume the specified @job.
+ * Must be paired with a preceding job_user_pause.
+ */
+void job_user_resume(Job *job, Error **errp);
+
+/**
+ * Get the next element from the list of block jobs after @job, or the
+ * first one if @job is %NULL.
+ *
+ * Returns the requested job, or %NULL if there are no more jobs left.
+ */
+Job *job_next(Job *job);
+
+/**
+ * Get the job identified by @id (which must not be %NULL).
+ *
+ * Returns the requested job, or %NULL if it doesn't exist.
+ */
+Job *job_get(const char *id);
+
+/**
+ * Check whether the verb @verb can be applied to @job in its current state.
+ * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
+ * returned.
+ */
+int job_apply_verb(Job *job, JobVerb verb, Error **errp);
+
+/**
+ * Asynchronously complete the specified @job.
+ */
+void job_complete(Job *job, Error **errp);
+
+/**
+ * Asynchronously cancel the specified @job. If @force is true, the job should
+ * be cancelled immediately without waiting for a consistent state.
+ */
+void job_cancel(Job *job, bool force);
+
+/**
+ * Cancels the specified job like job_cancel(), but may refuse to do so if the
+ * operation isn't meaningful in the current state of the job.
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
+ */
+void job_finalize(Job *job, Error **errp);
+
+/**
+ * Remove the concluded @job from the query list and resets the passed pointer
+ * to %NULL. Returns an error if the job is not actually concluded.
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
+ */
+int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
+
+#endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index e4e0c26672..8d189ed1c2 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -26,38 +26,7 @@
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
- */
-void job_txn_add_job(JobTxn *txn, Job *job);
+#include "job-monitor.h"
 
 /**
  * Create a new long-running job and return it.
@@ -75,18 +44,6 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  AioContext *ctx, int flags, BlockCompletionFunc *cb,
                  void *opaque, Error **errp);
 
-/**
- * Add a reference to Job refcnt, it will be decreased with job_unref, and then
- * be freed if it comes to be the last reference.
- */
-void job_ref(Job *job);
-
-/**
- * Release a reference that was previously acquired with job_ref() or
- * job_create(). If it's the last reference to the object, it will be freed.
- */
-void job_unref(Job *job);
-
 /**
  * @job: The job that has made progress
  * @done: How much progress the job made since the last call
@@ -126,13 +83,6 @@ void job_event_cancelled(Job *job);
 /** To be called when a successfully completed job is finalised. */
 void job_event_completed(Job *job);
 
-/**
- * Conditionally enter the job coroutine if the job is ready to run, not
- * already busy and fn() returns true. fn() is called while under the job_lock
- * critical section.
- */
-void job_enter_cond(Job *job, bool(*fn)(Job *job));
-
 /**
  * @job: A job that has not yet been started.
  *
@@ -173,10 +123,6 @@ void job_yield(Job *job);
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
-
-/** Returns true if the job should not be visible to the management layer. */
-bool job_is_internal(Job *job);
-
 /** Returns whether the job is being cancelled. */
 bool job_is_cancelled(Job *job);
 
@@ -186,137 +132,13 @@ bool job_is_cancelled(Job *job);
  */
 bool job_cancel_requested(Job *job);
 
-/** Returns whether the job is in a completed state. */
-bool job_is_completed(Job *job);
-
 /** Returns whether the job is ready to be completed. */
 bool job_is_ready(Job *job);
 
-/**
- * Request @job to pause at the next pause point. Must be paired with
- * job_resume(). If the job is supposed to be resumed by user action, call
- * job_user_pause() instead.
- */
-void job_pause(Job *job);
-
-/** Resumes a @job paused with job_pause. */
-void job_resume(Job *job);
-
-/**
- * Asynchronously pause the specified @job.
- * Do not allow a resume until a matching call to job_user_resume.
- */
-void job_user_pause(Job *job, Error **errp);
-
-/** Returns true if the job is user-paused. */
-bool job_user_paused(Job *job);
-
-/**
- * Resume the specified @job.
- * Must be paired with a preceding job_user_pause.
- */
-void job_user_resume(Job *job, Error **errp);
-
-/**
- * Get the next element from the list of block jobs after @job, or the
- * first one if @job is %NULL.
- *
- * Returns the requested job, or %NULL if there are no more jobs left.
- */
-Job *job_next(Job *job);
-
-/**
- * Get the job identified by @id (which must not be %NULL).
- *
- * Returns the requested job, or %NULL if it doesn't exist.
- */
-Job *job_get(const char *id);
-
-/**
- * Check whether the verb @verb can be applied to @job in its current state.
- * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
- * returned.
- */
-int job_apply_verb(Job *job, JobVerb verb, Error **errp);
-
 /** The @job could not be started, free it. */
 void job_early_fail(Job *job);
 
 /** Moves the @job from RUNNING to READY */
 void job_transition_to_ready(Job *job);
 
-/** Asynchronously complete the specified @job. */
-void job_complete(Job *job, Error **errp);
-
-/**
- * Asynchronously cancel the specified @job. If @force is true, the job should
- * be cancelled immediately without waiting for a consistent state.
- */
-void job_cancel(Job *job, bool force);
-
-/**
- * Cancels the specified job like job_cancel(), but may refuse to do so if the
- * operation isn't meaningful in the current state of the job.
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
- *
- * Callers must hold the AioContext lock of job->aio_context.
- */
-int job_cancel_sync(Job *job, bool force);
-
-/** Synchronously force-cancels all jobs using job_cancel_sync(). */
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
- *
- * Callers must hold the AioContext lock of job->aio_context.
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
- */
-void job_finalize(Job *job, Error **errp);
-
-/**
- * Remove the concluded @job from the query list and resets the passed pointer
- * to %NULL. Returns an error if the job is not actually concluded.
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
- * Callers must hold the AioContext lock of job->aio_context.
- */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
-
 #endif
-- 
2.27.0


