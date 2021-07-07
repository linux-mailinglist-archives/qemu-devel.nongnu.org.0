Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E93BECBE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:02:02 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Avx-00071V-B8
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Ash-0002cp-K3
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asb-0000CS-Le
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1msqywGvdzMNmRG960je5Q8SBmaBNN/cjW23H/9JGYs=;
 b=J7LB9Oh7NYl+0bQ+rH+BadL4IIDD3N0b2aKLt3+Lq9P8t9HeVt0b8J7HjHglnVeB3wy9mi
 +it+pAXp91pPbdHnSAs4eae1pu7UaI+OX8xqNKkYO6nH8y+wfjnPphn3gQeTkbkKYCRl2Y
 MmIameuuUYEXyh22oYhCMKYJhn/rnhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-d2uamycrOTiiE8EjzaWD7Q-1; Wed, 07 Jul 2021 12:58:31 -0400
X-MC-Unique: d2uamycrOTiiE8EjzaWD7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BFB08030B0;
 Wed,  7 Jul 2021 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4C81036D03;
 Wed,  7 Jul 2021 16:58:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/6] job: _locked functions and public job_lock/unlock for
 next patch
Date: Wed,  7 Jul 2021 18:58:09 +0200
Message-Id: <20210707165813.55361-3-eesposit@redhat.com>
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create _locked functions, to make next patch a little bit smaller.
Also set the locking functions as public, so that they can be used
also from structures using the Job struct.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 23 +++++++++++++
 job.c              | 85 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 72c7d0f69d..ba2f9b2660 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -305,6 +305,7 @@ void job_txn_add_job(JobTxn *txn, Job *job);
 
 /** Returns the @ret field of a given Job. */
 int job_get_ret(Job *job);
+int job_get_ret_locked(Job *job);
 
 /** Returns the AioContext of a given Job. */
 AioContext *job_get_aiocontext(Job *job);
@@ -336,6 +337,24 @@ bool job_is_force_cancel(Job *job);
 /** Returns the statis of a given Job. */
 JobStatus job_get_status(Job *job);
 
+/**
+ * job_lock:
+ *
+ * Take the mutex protecting the list of jobs and their status.
+ * Most functions called by the monitor need to call job_lock
+ * and job_unlock manually.  On the other hand, function called
+ * by the block jobs themselves and by the block layer will take the
+ * lock for you.
+ */
+void job_lock(void);
+
+/**
+ * job_unlock:
+ *
+ * Release the mutex protecting the list of jobs and their status.
+ */
+void job_unlock(void);
+
 /**
  * Create a new long-running job and return it.
  *
@@ -424,6 +443,7 @@ void job_start(Job *job);
  * Continue the specified job by entering the coroutine.
  */
 void job_enter(Job *job);
+void job_enter_locked(Job *job);
 
 /**
  * @job: The job that is ready to pause.
@@ -462,12 +482,15 @@ bool job_is_internal(Job *job);
 
 /** Returns whether the job is scheduled for cancellation. */
 bool job_is_cancelled(Job *job);
+bool job_is_cancelled_locked(Job *job);
 
 /** Returns whether the job is in a completed state. */
 bool job_is_completed(Job *job);
+bool job_is_completed_locked(Job *job);
 
 /** Returns whether the job is ready to be completed. */
 bool job_is_ready(Job *job);
+bool job_is_ready_locked(Job *job);
 
 /**
  * Request @job to pause at the next pause point. Must be paired with
diff --git a/job.c b/job.c
index 872bbebb01..96fb8e9730 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,10 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/* job_mutex protexts the jobs list, but also the job operations. */
+static QemuMutex job_mutex;
+
+/* Protected by job_mutex */
 static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
 
 /* Job State Transition Table */
@@ -64,27 +68,22 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX] = {
 /* Transactional group of jobs */
 struct JobTxn {
 
-    /* Is this txn being cancelled? */
+    /* Is this txn being cancelled? Atomic.*/
     bool aborting;
 
-    /* List of jobs */
+    /* List of jobs. Protected by job_mutex. */
     QLIST_HEAD(, Job) jobs;
 
-    /* Reference count */
+    /* Reference count. Atomic. */
     int refcnt;
 };
 
-/* Right now, this mutex is only needed to synchronize accesses to job->busy
- * and job->sleep_timer, such as concurrent calls to job_do_yield and
- * job_enter. */
-static QemuMutex job_mutex;
-
-static void job_lock(void)
+void job_lock(void)
 {
     qemu_mutex_lock(&job_mutex);
 }
 
-static void job_unlock(void)
+void job_unlock(void)
 {
     qemu_mutex_unlock(&job_mutex);
 }
@@ -109,11 +108,22 @@ bool job_is_busy(Job *job)
     return qatomic_read(&job->busy);
 }
 
-int job_get_ret(Job *job)
+/* Called with job_mutex held. */
+int job_get_ret_locked(Job *job)
 {
     return job->ret;
 }
 
+/* Called with job_mutex *not* held. */
+int job_get_ret(Job *job)
+{
+    int ret;
+    job_lock();
+    ret = job_get_ret_locked(job);
+    job_unlock();
+    return ret;
+}
+
 Error *job_get_err(Job *job)
 {
     return job->err;
@@ -255,12 +265,24 @@ const char *job_type_str(const Job *job)
     return JobType_str(job_type(job));
 }
 
-bool job_is_cancelled(Job *job)
+/* Called with job_mutex held. */
+bool job_is_cancelled_locked(Job *job)
 {
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+/* Called with job_mutex *not* held. */
+bool job_is_cancelled(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job_is_cancelled_locked(job);
+    job_unlock();
+    return ret;
+}
+
+/* Called with job_mutex held. */
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -282,7 +304,18 @@ bool job_is_ready(Job *job)
     return false;
 }
 
-bool job_is_completed(Job *job)
+/* Called with job_mutex *not* held. */
+bool job_is_ready(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job_is_ready_locked(job);
+    job_unlock();
+    return ret;
+}
+
+/* Called with job_mutex held. */
+bool job_is_completed_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -304,6 +337,17 @@ bool job_is_completed(Job *job)
     return false;
 }
 
+/* Called with job_mutex *not* held. */
+bool job_is_completed(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job_is_completed_locked(job);
+    job_unlock();
+    return ret;
+}
+
+/* Does not need job_mutex. Value is never modified */
 static bool job_started(Job *job)
 {
     return job->co;
@@ -503,11 +547,20 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_enter(Job *job)
+/* Called with job_mutex held. */
+void job_enter_locked(Job *job)
 {
     job_enter_cond(job, NULL);
 }
 
+/* Called with job_mutex *not* held. */
+void job_enter(Job *job)
+{
+    job_lock();
+    job_enter_locked(job, NULL);
+    job_unlock();
+}
+
 /* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
  * Reentering the job coroutine with job_enter() before the timer has expired
  * is allowed and cancels the timer.
@@ -684,12 +737,14 @@ void job_dismiss(Job **jobptr, Error **errp)
     *jobptr = NULL;
 }
 
+/* Called with job_mutex held. */
 void job_early_fail(Job *job)
 {
     assert(job->status == JOB_STATUS_CREATED);
     job_do_dismiss(job);
 }
 
+/* Called with job_mutex held. */
 static void job_conclude(Job *job)
 {
     job_state_transition(job, JOB_STATUS_CONCLUDED);
-- 
2.31.1


