Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784944008D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:47:33 +0200 (CEST)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV2S-0000ML-Hp
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv5-0006jW-EB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUuv-0003R1-OK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfA5e0BfbKPP6LolE9DInCP0HpFqmPCWYjTyHw8QFok=;
 b=L/59R5nG7T2md9aUXRlnChytj+O5p2J+/qJFtHdeUQNDlG3lGxDLHFkuvjiwpbRjE2AEHX
 6R8oDLXds0L/DMZ8vtef/KjtaLPYphZUao3Qm/hyL9MFA4Kl+jIYR3ggbPE0mGU067dW25
 qu/ENVft0e9pXJit3sECfPUUCYWnz5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-vcNBAMv9NZaxBCXIxUK10Q-1; Fri, 29 Oct 2021 12:39:41 -0400
X-MC-Unique: vcNBAMv9NZaxBCXIxUK10Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22E7806689;
 Fri, 29 Oct 2021 16:39:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0D7869117;
 Fri, 29 Oct 2021 16:39:39 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 05/15] job-monitor.h: define the job monitor API
Date: Fri, 29 Oct 2021 12:39:04 -0400
Message-Id: <20211029163914.4044794-6-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

These functions assume that the job lock is held by the
caller, to avoid TOC/TOU conditions.

Introduce also additional helpers that define _locked
functions (useful when the job_mutex is globally applied).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-monitor.h | 61 ++++++++++++++++++++++++++++++++++++++
 job.c                      | 22 ++++++++++++--
 2 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
index b5b41a7548..d92bc4f39d 100644
--- a/include/qemu/job-monitor.h
+++ b/include/qemu/job-monitor.h
@@ -28,6 +28,21 @@
 
 #include "job-common.h"
 
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
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
  * transaction using job_txn_add_job().
@@ -56,18 +71,24 @@ void job_txn_unref(JobTxn *txn);
  * the reference that is automatically grabbed here.
  *
  * If @txn is NULL, the function does nothing.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_txn_add_job(JobTxn *txn, Job *job);
 
 /**
  * Add a reference to Job refcnt, it will be decreased with job_unref, and then
  * be freed if it comes to be the last reference.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_ref(Job *job);
 
 /**
  * Release a reference that was previously acquired with job_ref() or
  * job_create(). If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_unref(Job *job);
 
@@ -75,6 +96,8 @@ void job_unref(Job *job);
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
  * critical section.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
 void job_enter_cond(Job *job, bool(*fn)(Job *job));
 
@@ -85,6 +108,7 @@ bool job_is_internal(Job *job);
 
 /**
  * Returns whether the job is in a completed state.
+ * Called between job_lock and job_unlock.
  */
 bool job_is_completed(Job *job);
 
@@ -92,28 +116,36 @@ bool job_is_completed(Job *job);
  * Request @job to pause at the next pause point. Must be paired with
  * job_resume(). If the job is supposed to be resumed by user action, call
  * job_user_pause() instead.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_pause(Job *job);
 
 /**
  * Resumes a @job paused with job_pause.
+ * Called between job_lock and job_unlock.
  */
 void job_resume(Job *job);
 
 /**
  * Asynchronously pause the specified @job.
  * Do not allow a resume until a matching call to job_user_resume.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_user_pause(Job *job, Error **errp);
 
 /**
  * Returns true if the job is user-paused.
+ * Called between job_lock and job_unlock.
  */
 bool job_user_paused(Job *job);
 
 /**
  * Resume the specified @job.
  * Must be paired with a preceding job_user_pause.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_user_resume(Job *job, Error **errp);
 
@@ -122,6 +154,8 @@ void job_user_resume(Job *job, Error **errp);
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ *
+ * Called between job_lock and job_unlock.
  */
 Job *job_next(Job *job);
 
@@ -129,6 +163,8 @@ Job *job_next(Job *job);
  * Get the job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ *
+ * Called between job_lock and job_unlock.
  */
 Job *job_get(const char *id);
 
@@ -136,23 +172,30 @@ Job *job_get(const char *id);
  * Check whether the verb @verb can be applied to @job in its current state.
  * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
  * returned.
+ *
+ * Called between job_lock and job_unlock.
  */
 int job_apply_verb(Job *job, JobVerb verb, Error **errp);
 
 /**
  * Asynchronously complete the specified @job.
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
 void job_complete(Job *job, Error **errp);
 
 /**
  * Asynchronously cancel the specified @job. If @force is true, the job should
  * be cancelled immediately without waiting for a consistent state.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_cancel(Job *job, bool force);
 
 /**
  * Cancels the specified job like job_cancel(), but may refuse to do so if the
  * operation isn't meaningful in the current state of the job.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_user_cancel(Job *job, bool force, Error **errp);
 
@@ -171,6 +214,10 @@ int job_cancel_sync(Job *job, bool force);
 
 /**
  * Synchronously force-cancels all jobs using job_cancel_sync().
+ *
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
+ * patterns in the caller.
  */
 void job_cancel_sync_all(void);
 
@@ -187,6 +234,8 @@ void job_cancel_sync_all(void);
  * Returns the return value from the job.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
  */
 int job_complete_sync(Job *job, Error **errp);
 
@@ -197,12 +246,16 @@ int job_complete_sync(Job *job, Error **errp);
  * FIXME: Make the below statement universally true:
  * For jobs that support the manual workflow mode, all graph changes that occur
  * as a result will occur after this command and before a successful reply.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_finalize(Job *job, Error **errp);
 
 /**
  * Remove the concluded @job from the query list and resets the passed pointer
  * to %NULL. Returns an error if the job is not actually concluded.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_dismiss(Job **job, Error **errp);
 
@@ -214,7 +267,15 @@ void job_dismiss(Job **job, Error **errp);
  * cancelled before completing, and -errno in other error cases.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
 
+/** Same as job_is_ready(), but assumes job_lock is held. */
+bool job_is_ready_locked(Job *job);
+
+/** Same as job_early_fail(), but assumes job_lock is held. */
+void job_early_fail_locked(Job *job);
+
 #endif
diff --git a/job.c b/job.c
index e003f136f0..b66d59b746 100644
--- a/job.c
+++ b/job.c
@@ -225,7 +225,8 @@ bool job_cancel_requested(Job *job)
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+/* Called with job_mutex held. */
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -247,6 +248,16 @@ bool job_is_ready(Job *job)
     return false;
 }
 
+/* Called with job_mutex lock *not* held */
+bool job_is_ready(Job *job)
+{
+    bool res;
+    job_lock();
+    res = job_is_ready_locked(job);
+    job_unlock();
+    return res;
+}
+
 bool job_is_completed(Job *job)
 {
     switch (job->status) {
@@ -642,12 +653,19 @@ void job_dismiss(Job **jobptr, Error **errp)
     *jobptr = NULL;
 }
 
-void job_early_fail(Job *job)
+void job_early_fail_locked(Job *job)
 {
     assert(job->status == JOB_STATUS_CREATED);
     job_do_dismiss(job);
 }
 
+void job_early_fail(Job *job)
+{
+    job_lock();
+    job_early_fail_locked(job);
+    job_unlock();
+}
+
 static void job_conclude(Job *job)
 {
     job_state_transition(job, JOB_STATUS_CONCLUDED);
-- 
2.27.0


