Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5149F909
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:17:10 +0100 (CET)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQBh-0002f4-Ur
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmV-0004c6-La
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmP-0003SU-Vz
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dm7rJV9A7Q/y8dyzMuyYfUFqsk3VtpZVVHnICQncXNY=;
 b=Pnt7+eaLqQWhFsfrIqPzaeKWB99HAD3LVYqoR3l8IprI/Qt4/BulxFRUg4hHXUCQriSjCu
 YAZJ2VQsp0s3D3Ox3I5MlfLI4fzQeW0VIkQhmUWX9xLI4xs7ufNH7RFhe0K5sWJibOBawk
 yI38EqPuK13sw3hYbfVI0jEAr3wTpTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-eCThsTTFPey1T2rlBYkoEQ-1; Fri, 28 Jan 2022 06:50:56 -0500
X-MC-Unique: eCThsTTFPey1T2rlBYkoEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B36301006AAA;
 Fri, 28 Jan 2022 11:50:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF5722DE3;
 Fri, 28 Jan 2022 11:50:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 18/19] job.c: enable job lock/unlock and remove Aiocontext
 locks
Date: Fri, 28 Jan 2022 06:50:30 -0500
Message-Id: <20220128115031.4061565-19-eesposit@redhat.com>
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

Change the job_{lock/unlock} and macros to use job_mutex.

Now that they are not nop anymore, remove the aiocontext
to avoid deadlocks.

Therefore:
- when possible, remove completely the aiocontext lock/unlock pair
- if it is used by some other functions too, reduce the locking
section as much as possible, leaving the job API outside.

There is only one JobDriver callback, ->free() that assumes that
the aiocontext lock is held (because it calls bdrv_unref), so for
now keep that under aiocontext lock.

Also remove real_job_{lock/unlock}, as they are replaced by the
public functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c                       | 65 ++++-----------------------
 include/qemu/job.h               | 22 ++++-----
 job-qmp.c                        | 41 ++++-------------
 job.c                            | 76 +++-----------------------------
 tests/unit/test-bdrv-drain.c     |  4 +-
 tests/unit/test-block-iothread.c |  2 +-
 tests/unit/test-blockjob.c       | 13 ++----
 7 files changed, 38 insertions(+), 185 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index d6693593b0..203e5ff770 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -155,12 +155,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
     for (job = block_job_next_locked(NULL); job;
          job = block_job_next_locked(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
-            AioContext *aio_context = job->job.aio_context;
-            aio_context_acquire(aio_context);
-
             job_cancel_locked(&job->job, false);
-
-            aio_context_release(aio_context);
         }
     }
 
@@ -1836,16 +1831,9 @@ static void drive_backup_abort(BlkActionState *common)
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         WITH_JOB_LOCK_GUARD() {
             job_cancel_sync_locked(&state->job->job, true);
         }
-
-        aio_context_release(aio_context);
     }
 }
 
@@ -1939,16 +1927,9 @@ static void blockdev_backup_abort(BlkActionState *common)
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         WITH_JOB_LOCK_GUARD() {
             job_cancel_sync_locked(&state->job->job, true);
         }
-
-        aio_context_release(aio_context);
     }
 }
 
@@ -3312,18 +3293,13 @@ out:
     aio_context_release(aio_context);
 }
 
-/*
- * Get a block job using its ID and acquire its AioContext.
- * Returns with job_lock held on success.
- */
-static BlockJob *find_block_job(const char *id, AioContext **aio_context,
-                                Error **errp)
+/* Get a block job using its ID. Returns with job_lock held on success */
+static BlockJob *find_block_job(const char *id, Error **errp)
 {
     BlockJob *job;
 
     assert(id != NULL);
 
-    *aio_context = NULL;
     job_lock();
 
     job = block_job_get_locked(id);
@@ -3335,31 +3311,25 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
         return NULL;
     }
 
-    *aio_context = block_job_get_aio_context(job);
-    aio_context_acquire(*aio_context);
-
     return job;
 }
 
 void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
     }
 
     block_job_set_speed_locked(job, speed, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_cancel(const char *device,
                           bool has_force, bool force, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3378,14 +3348,12 @@ void qmp_block_job_cancel(const char *device,
     trace_qmp_block_job_cancel(job);
     job_user_cancel_locked(&job->job, force, errp);
 out:
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_pause(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3393,14 +3361,12 @@ void qmp_block_job_pause(const char *device, Error **errp)
 
     trace_qmp_block_job_pause(job);
     job_user_pause_locked(&job->job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3408,14 +3374,12 @@ void qmp_block_job_resume(const char *device, Error **errp)
 
     trace_qmp_block_job_resume(job);
     job_user_resume_locked(&job->job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3423,14 +3387,12 @@ void qmp_block_job_complete(const char *device, Error **errp)
 
     trace_qmp_block_job_complete(job);
     job_complete_locked(&job->job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(id, &aio_context, errp);
+    BlockJob *job = find_block_job(id, errp);
 
     if (!job) {
         return;
@@ -3440,21 +3402,13 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     job_ref_locked(&job->job);
     job_finalize_locked(&job->job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize_locked
-     * (and job_txn_apply automatically acquires the new one),
-     * so make sure we release the correct one.
-     */
-    aio_context = block_job_get_aio_context(job);
     job_unref_locked(&job->job);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *bjob = find_block_job(id, &aio_context, errp);
+    BlockJob *bjob = find_block_job(id, errp);
     Job *job;
 
     if (!bjob) {
@@ -3464,7 +3418,6 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss_locked(&job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
diff --git a/include/qemu/job.h b/include/qemu/job.h
index f335bac46c..7f9e6ee13e 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -75,11 +75,14 @@ typedef struct Job {
     ProgressMeter progress;
 
 
+    /** Protected by job_mutex */
+
     /**
      * AioContext to run the job coroutine in.
-     * This field can be read when holding either the BQL (so we are in
-     * the main loop) or the job_mutex.
-     * Instead, it can be only written when we hold *both* BQL and job_mutex.
+     * The job Aiocontext can be read when holding *either*
+     * the BQL (so we are in the main loop) or the job_mutex.
+     * Instead, it can only be written when we hold *both* BQL
+     * and the job_mutex.
      */
     AioContext *aio_context;
 
@@ -104,7 +107,7 @@ typedef struct Job {
     /**
      * Set to false by the job while the coroutine has yielded and may be
      * re-entered by job_enter(). There may still be I/O or event loop activity
-     * pending. Accessed under block_job_mutex (in blockjob.c).
+     * pending. Accessed under job_mutex.
      *
      * When the job is deferred to the main loop, busy is true as long as the
      * bottom half is still pending.
@@ -329,9 +332,9 @@ typedef enum JobCreateFlags {
 
 extern QemuMutex job_mutex;
 
-#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
+#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
 
-#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
+#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
 
 /**
  * job_lock:
@@ -670,8 +673,6 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp);
  *
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
- *
- * Callers must hold the AioContext lock of job->aio_context.
  */
 int job_cancel_sync_locked(Job *job, bool force);
 
@@ -695,9 +696,6 @@ void job_cancel_sync_all(void);
  * function).
  *
  * Returns the return value from the job.
- *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock.
  */
 int job_complete_sync_locked(Job *job, Error **errp);
@@ -729,8 +727,6 @@ void job_dismiss_locked(Job **job, Error **errp);
  * Returns 0 if the job is successfully completed, -ECANCELED if the job was
  * cancelled before completing, and -errno in other error cases.
  *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock.
  */
 int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
diff --git a/job-qmp.c b/job-qmp.c
index 615e056fc4..858b3a28f5 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,15 +29,11 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/*
- * Get a block job using its ID and acquire its AioContext.
- * Returns with job_lock held on success.
- */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/* Get a job using its ID. Returns with job_lock held on success. */
+static Job *find_job(const char *id, Error **errp)
 {
     Job *job;
 
-    *aio_context = NULL;
     job_lock();
 
     job = job_get_locked(id);
@@ -47,16 +43,12 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
         return NULL;
     }
 
-    *aio_context = job->aio_context;
-    aio_context_acquire(*aio_context);
-
     return job;
 }
 
 void qmp_job_cancel(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -64,14 +56,12 @@ void qmp_job_cancel(const char *id, Error **errp)
 
     trace_qmp_job_cancel(job);
     job_user_cancel_locked(job, true, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_job_pause(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -79,14 +69,12 @@ void qmp_job_pause(const char *id, Error **errp)
 
     trace_qmp_job_pause(job);
     job_user_pause_locked(job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_job_resume(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -94,14 +82,12 @@ void qmp_job_resume(const char *id, Error **errp)
 
     trace_qmp_job_resume(job);
     job_user_resume_locked(job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_job_complete(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -109,14 +95,12 @@ void qmp_job_complete(const char *id, Error **errp)
 
     trace_qmp_job_complete(job);
     job_complete_locked(job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -126,21 +110,13 @@ void qmp_job_finalize(const char *id, Error **errp)
     job_ref_locked(job);
     job_finalize_locked(job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize_locked
-     * (and job_txn_apply automatically acquires the new one),
-     * so make sure we release the correct one.
-     */
-    aio_context = job->aio_context;
     job_unref_locked(job);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -148,7 +124,6 @@ void qmp_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_job_dismiss(job);
     job_dismiss_locked(&job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
diff --git a/job.c b/job.c
index c4e0641bd4..be59fe7fd3 100644
--- a/job.c
+++ b/job.c
@@ -98,21 +98,11 @@ struct JobTxn {
 };
 
 void job_lock(void)
-{
-    /* nop */
-}
-
-void job_unlock(void)
-{
-    /* nop */
-}
-
-static void real_job_lock(void)
 {
     qemu_mutex_lock(&job_mutex);
 }
 
-static void real_job_unlock(void)
+void job_unlock(void)
 {
     qemu_mutex_unlock(&job_mutex);
 }
@@ -180,7 +170,6 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
      * twice - which would break AIO_WAIT_WHILE from within fn.
      */
     job_ref_locked(job);
-    aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
         rc = fn(other_job);
@@ -189,11 +178,6 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
         }
     }
 
-    /*
-     * Note that job->aio_context might have been changed by calling fn, so we
-     * can't use a local variable to cache it.
-     */
-    aio_context_acquire(job->aio_context);
     job_unref_locked(job);
     return rc;
 }
@@ -459,7 +443,10 @@ void job_unref_locked(Job *job)
 
         if (job->driver->free) {
             job_unlock();
+            /* FIXME: aiocontext lock is required because cb calls blk_unref */
+            aio_context_acquire(job->aio_context);
             job->driver->free(job);
+            aio_context_release(job->aio_context);
             job_lock();
         }
 
@@ -532,20 +519,16 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    real_job_lock();
     if (job->busy) {
-        real_job_unlock();
         return;
     }
 
     if (fn && !fn(job)) {
-        real_job_unlock();
         return;
     }
 
     timer_del(&job->sleep_timer);
     job->busy = true;
-    real_job_unlock();
     job_unlock();
     aio_co_wake(job->co);
     job_lock();
@@ -570,13 +553,11 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
     AioContext *next_aio_context;
 
-    real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
     }
     job->busy = false;
     job_event_idle_locked(job);
-    real_job_unlock();
     job_unlock();
     qemu_coroutine_yield();
     job_lock();
@@ -918,7 +899,6 @@ static void job_cancel_async_locked(Job *job, bool force)
 /* Called with job_mutex held. */
 static void job_completed_txn_abort_locked(Job *job)
 {
-    AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
 
@@ -931,54 +911,28 @@ static void job_completed_txn_abort_locked(Job *job)
     txn->aborting = true;
     job_txn_ref_locked(txn);
 
-    /*
-     * We can only hold the single job's AioContext lock while calling
-     * job_finalize_single_locked() because the finalization callbacks can
-     *  involve calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
-     * Note that the job's AioContext may change when it is finalized.
-     */
-    job_ref_locked(job);
-    aio_context_release(job->aio_context);
-
     /* Other jobs are effectively cancelled by us, set the status for
      * them; this job, however, may or may not be cancelled, depending
      * on the caller, so leave it. */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
         if (other_job != job) {
-            ctx = other_job->aio_context;
-            aio_context_acquire(ctx);
             /*
              * This is a transaction: If one job failed, no result will matter.
              * Therefore, pass force=true to terminate all other jobs as
              * quickly as possible.
              */
             job_cancel_async_locked(other_job, true);
-            aio_context_release(ctx);
         }
     }
     while (!QLIST_EMPTY(&txn->jobs)) {
         other_job = QLIST_FIRST(&txn->jobs);
-        /*
-         * The job's AioContext may change, so store it in @ctx so we
-         * release the same context that we have acquired before.
-         */
-        ctx = other_job->aio_context;
-        aio_context_acquire(ctx);
         if (!job_is_completed_locked(other_job)) {
             assert(job_cancel_requested_locked(other_job));
             job_finish_sync_locked(other_job, NULL, NULL);
         }
-        aio_context_release(ctx);
         job_finalize_single_locked(other_job);
     }
 
-    /*
-     * Use job_ref_locked()/job_unref_locked() so we can read the AioContext
-     * here even if the job went away during job_finalize_single_locked().
-     */
-    aio_context_acquire(job->aio_context);
-    job_unref_locked(job);
-
     job_txn_unref_locked(txn);
 }
 
@@ -1097,11 +1051,7 @@ static void job_completed_locked(Job *job)
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
-    AioContext *ctx;
-
     JOB_LOCK_GUARD();
-    job_ref_locked(job);
-    aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
      * callbacks. However, completion callbacks tend to involve operations that
@@ -1111,16 +1061,6 @@ static void job_exit(void *opaque)
     job_event_idle_locked(job);
 
     job_completed_locked(job);
-
-    /*
-     * Note that calling job_completed_locked can move the job to a different
-     * aio_context, so we cannot cache from above. job_txn_apply_locked takes
-     * care of acquiring the new lock, and we ref/unref to avoid
-     * job_completed_locked freeing the job underneath us.
-     */
-    ctx = job->aio_context;
-    job_unref_locked(job);
-    aio_context_release(ctx);
 }
 
 /**
@@ -1245,14 +1185,10 @@ int job_cancel_sync_locked(Job *job, bool force)
 void job_cancel_sync_all(void)
 {
     Job *job;
-    AioContext *aio_context;
 
     JOB_LOCK_GUARD();
     while ((job = job_next_locked(NULL))) {
-        aio_context = job->aio_context;
-        aio_context_acquire(aio_context);
         job_cancel_sync_locked(job, true);
-        aio_context_release(aio_context);
     }
 }
 
@@ -1299,8 +1235,8 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
     }
 
     job_unlock();
-    AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed(job)));
+    AIO_WAIT_WHILE_UNLOCKED(job->aio_context,
+                            (job_enter(job), !job_is_completed(job)));
     job_lock();
 
     ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 0db056ea63..4924ceb562 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -930,9 +930,9 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         tjob->prepare_ret = -EIO;
         break;
     }
+    aio_context_release(ctx);
 
     job_start(&job->job);
-    aio_context_release(ctx);
 
     if (use_iothread) {
         /* job_co_entry() is run in the I/O thread, wait for the actual job
@@ -1016,12 +1016,12 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
     }
 
-    aio_context_acquire(ctx);
     WITH_JOB_LOCK_GUARD() {
         ret = job_complete_sync_locked(&job->job, &error_abort);
     }
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
+    aio_context_acquire(ctx);
     if (use_iothread) {
         blk_set_aio_context(blk_src, qemu_get_aio_context(), &error_abort);
         assert(blk_get_aio_context(blk_target) == qemu_get_aio_context());
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 89e7f0fffb..9d7c8be00f 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -455,10 +455,10 @@ static void test_attach_blockjob(void)
         aio_poll(qemu_get_aio_context(), false);
     }
 
-    aio_context_acquire(ctx);
     WITH_JOB_LOCK_GUARD() {
         job_complete_sync_locked(&tjob->common.job, &error_abort);
     }
+    aio_context_acquire(ctx);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
 
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index 8280b1e0c9..d6fc52f80a 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -228,10 +228,6 @@ static void cancel_common(CancelJob *s)
     BlockJob *job = &s->common;
     BlockBackend *blk = s->blk;
     JobStatus sts = job->job.status;
-    AioContext *ctx;
-
-    ctx = job->job.aio_context;
-    aio_context_acquire(ctx);
 
     WITH_JOB_LOCK_GUARD() {
         job_cancel_sync_locked(&job->job, true);
@@ -244,7 +240,6 @@ static void cancel_common(CancelJob *s)
     }
     destroy_blk(blk);
 
-    aio_context_release(ctx);
 }
 
 static void test_cancel_created(void)
@@ -405,11 +400,9 @@ static void test_cancel_concluded(void)
     aio_poll(qemu_get_aio_context(), true);
     assert(job->status == JOB_STATUS_PENDING);
 
-    aio_context_acquire(job->aio_context);
     WITH_JOB_LOCK_GUARD() {
         job_finalize_locked(job, &error_abort);
     }
-    aio_context_release(job->aio_context);
     assert(job->status == JOB_STATUS_CONCLUDED);
 
     cancel_common(s);
@@ -503,13 +496,11 @@ static void test_complete_in_standby(void)
 
     /* Wait for the job to become READY */
     job_start(job);
-    aio_context_acquire(ctx);
     /*
      * Here we are waiting for the status to change, so don't bother
      * protecting the read every time.
      */
-    AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
-    aio_context_release(ctx);
+    AIO_WAIT_WHILE_UNLOCKED(ctx, job->status != JOB_STATUS_READY);
 
     /* Begin the drained section, pausing the job */
     bdrv_drain_all_begin();
@@ -529,6 +520,7 @@ static void test_complete_in_standby(void)
         job_complete_locked(job, &error_abort);
 
         /* The test is done now, clean up. */
+        aio_context_release(ctx);
         job_finish_sync_locked(job, NULL, &error_abort);
         assert(job->status == JOB_STATUS_PENDING);
 
@@ -538,6 +530,7 @@ static void test_complete_in_standby(void)
         job_dismiss_locked(&job, &error_abort);
     }
 
+    aio_context_acquire(ctx);
     destroy_blk(blk);
     aio_context_release(ctx);
     iothread_join(iothread);
-- 
2.31.1


