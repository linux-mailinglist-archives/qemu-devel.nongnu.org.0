Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47184455C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:56:31 +0100 (CET)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieAI-0005ol-RR
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie7v-0002vY-De
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie7s-0006qF-B8
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0O4TgLee/XFBAnFSAEoBp6QNy4upsDe28hIOz6AcLc=;
 b=HycomxxVCsHwFyFLS2OOPxf1DKBSZwOOVSrUOdBH/azho01wMeIsTljx4LdrijGOfVHF/0
 NLSGPuqqXwTtTfhq2SJM4C+ZyHn3WjYkusyiWxedxxFZ1KjTEaQ8Z4rLdq7Eql8PdLlZEy
 Z+aEeDYkXGeWIDeD7DDNid3ezT/+k1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-WRmBIlNiOnqinximpI7wlQ-1; Thu, 04 Nov 2021 10:53:56 -0400
X-MC-Unique: WRmBIlNiOnqinximpI7wlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30B2CF989;
 Thu,  4 Nov 2021 14:53:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 090A26418A;
 Thu,  4 Nov 2021 14:53:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 03/14] job.h: define locked functions
Date: Thu,  4 Nov 2021 10:53:23 -0400
Message-Id: <20211104145334.1346363-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

These functions assume that the job lock is held by the
caller, to avoid TOC/TOU conditions.

Introduce also additional helpers that define _locked
functions (useful when the job_mutex is globally applied).

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 66 ++++++++++++++++++++++++++++++++++++++++++----
 job.c              | 18 +++++++++++--
 2 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index f7036ac6b3..c7a6bcad1b 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -355,6 +355,8 @@ void job_txn_unref(JobTxn *txn);
  * the reference that is automatically grabbed here.
  *
  * If @txn is NULL, the function does nothing.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_txn_add_job(JobTxn *txn, Job *job);
 
@@ -377,12 +379,16 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
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
 
@@ -429,6 +435,8 @@ void job_event_completed(Job *job);
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
  * critical section.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
 void job_enter_cond(Job *job, bool(*fn)(Job *job));
 
@@ -490,34 +498,52 @@ bool job_is_cancelled(Job *job);
  */
 bool job_cancel_requested(Job *job);
 
-/** Returns whether the job is in a completed state. */
+/**
+ * Returns whether the job is in a completed state.
+ * Called between job_lock and job_unlock.
+ */
 bool job_is_completed(Job *job);
 
 /** Returns whether the job is ready to be completed. */
 bool job_is_ready(Job *job);
 
+/** Same as job_is_ready(), but assumes job_lock is held. */
+bool job_is_ready_locked(Job *job);
+
 /**
  * Request @job to pause at the next pause point. Must be paired with
  * job_resume(). If the job is supposed to be resumed by user action, call
  * job_user_pause() instead.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_pause(Job *job);
 
-/** Resumes a @job paused with job_pause. */
+/**
+ * Resumes a @job paused with job_pause.
+ * Called between job_lock and job_unlock.
+ */
 void job_resume(Job *job);
 
 /**
  * Asynchronously pause the specified @job.
  * Do not allow a resume until a matching call to job_user_resume.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_user_pause(Job *job, Error **errp);
 
-/** Returns true if the job is user-paused. */
+/**
+ * Returns true if the job is user-paused.
+ * Called between job_lock and job_unlock.
+ */
 bool job_user_paused(Job *job);
 
 /**
  * Resume the specified @job.
  * Must be paired with a preceding job_user_pause.
+ *
+ * Called between job_lock and job_unlock.
  */
 void job_user_resume(Job *job, Error **errp);
 
@@ -526,6 +552,8 @@ void job_user_resume(Job *job, Error **errp);
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ *
+ * Called between job_lock and job_unlock.
  */
 Job *job_next(Job *job);
 
@@ -533,6 +561,8 @@ Job *job_next(Job *job);
  * Get the job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ *
+ * Called between job_lock and job_unlock.
  */
 Job *job_get(const char *id);
 
@@ -540,27 +570,39 @@ Job *job_get(const char *id);
  * Check whether the verb @verb can be applied to @job in its current state.
  * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
  * returned.
+ *
+ * Called between job_lock and job_unlock.
  */
 int job_apply_verb(Job *job, JobVerb verb, Error **errp);
 
 /** The @job could not be started, free it. */
 void job_early_fail(Job *job);
 
+/** Same as job_early_fail(), but assumes job_lock is held. */
+void job_early_fail_locked(Job *job);
+
 /** Moves the @job from RUNNING to READY */
 void job_transition_to_ready(Job *job);
 
-/** Asynchronously complete the specified @job. */
+/**
+ * Asynchronously complete the specified @job.
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
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
 
@@ -577,7 +619,13 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  */
 int job_cancel_sync(Job *job, bool force);
 
-/** Synchronously force-cancels all jobs using job_cancel_sync(). */
+/**
+ * Synchronously force-cancels all jobs using job_cancel_sync().
+ *
+ * Called with job_lock *not* held, unlike most other APIs consumed
+ * by the monitor! This is primarly to avoid adding unnecessary lock-unlock
+ * patterns in the caller.
+ */
 void job_cancel_sync_all(void);
 
 /**
@@ -593,6 +641,8 @@ void job_cancel_sync_all(void);
  * Returns the return value from the job.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
  */
 int job_complete_sync(Job *job, Error **errp);
 
@@ -603,12 +653,16 @@ int job_complete_sync(Job *job, Error **errp);
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
 
@@ -620,6 +674,8 @@ void job_dismiss(Job **job, Error **errp);
  * cancelled before completing, and -errno in other error cases.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
 
diff --git a/job.c b/job.c
index 0e4dacf028..e393c1222f 100644
--- a/job.c
+++ b/job.c
@@ -242,7 +242,8 @@ bool job_cancel_requested(Job *job)
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+/* Called with job_mutex held. */
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -264,6 +265,13 @@ bool job_is_ready(Job *job)
     return false;
 }
 
+/* Called with job_mutex lock *not* held */
+bool job_is_ready(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_ready_locked(job);
+}
+
 bool job_is_completed(Job *job)
 {
     switch (job->status) {
@@ -659,12 +667,18 @@ void job_dismiss(Job **jobptr, Error **errp)
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
+    JOB_LOCK_GUARD();
+    job_early_fail_locked(job);
+}
+
 static void job_conclude(Job *job)
 {
     job_state_transition(job, JOB_STATUS_CONCLUDED);
-- 
2.27.0


