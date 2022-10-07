Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322605F78B8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:15:29 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognCI-0006Da-UR
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuT-00064j-8L
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuQ-0003Kr-8d
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2WdplvwTI6MIfo/zELfBqymRgLDY2/NxUe8BieTvEc=;
 b=GhwkagUw2w+WPrR5IiVzR1u1iuwSmQeFJG4Qpge5r9LWEGA6DWLpLQEfg2sbo77k56Z3QN
 mcMGcncN7sM9rUa8kYv37zNLPv4K+fxDG9C5MdaHEo9QprQfRMEiEenMPOfAYAGM9j8XKT
 10/VLDe87vFHIXY9kUtjbdp7yT7zTUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-HD6FjsjAOYmCN-dzV6G9sQ-1; Fri, 07 Oct 2022 06:48:46 -0400
X-MC-Unique: HD6FjsjAOYmCN-dzV6G9sQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 354D51C0515C;
 Fri,  7 Oct 2022 10:48:46 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7164B2028DC1;
 Fri,  7 Oct 2022 10:48:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 46/50] job.c: enable job lock/unlock and remove Aiocontext locks
Date: Fri,  7 Oct 2022 12:47:48 +0200
Message-Id: <20221007104752.141361-47-kwolf@redhat.com>
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

Change the job_{lock/unlock} and macros to use job_mutex.

Now that they are not nop anymore, remove the aiocontext
to avoid deadlocks.

Therefore:
- when possible, remove completely the aiocontext lock/unlock pair
- if it is used by some other function too, reduce the locking
  section as much as possible, leaving the job API outside.
- change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
  are not using the aiocontext lock anymore

The only functions that still need the aiocontext lock are:
- the JobDriver callbacks, already documented in job.h
- job_cancel_sync() in replication.c is called with aio_context_lock
  taken, but now job is using AIO_WAIT_WHILE_UNLOCKED so we need to
  release the lock.

Reduce the locking section to only cover the callback invocation
and document the functions that take the AioContext lock,
to avoid taking it twice.

Also remove real_job_{lock/unlock}, as they are replaced by the
public functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220926093214.506243-19-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h               |  17 ++---
 block/replication.c              |   2 +
 blockdev.c                       |  72 +++-----------------
 job-qmp.c                        |  46 +++----------
 job.c                            | 111 +++++++++----------------------
 qemu-img.c                       |   2 -
 tests/unit/test-bdrv-drain.c     |   4 +-
 tests/unit/test-block-iothread.c |   2 +-
 tests/unit/test-blockjob.c       |  19 +++---
 9 files changed, 72 insertions(+), 203 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index b943d90e8f..a54fb83887 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -88,7 +88,7 @@ typedef struct Job {
     AioContext *aio_context;
 
 
-    /** Protected by AioContext lock */
+    /** Protected by job_mutex */
 
     /** Reference count of the block job */
     int refcnt;
@@ -111,7 +111,7 @@ typedef struct Job {
     /**
      * Set to false by the job while the coroutine has yielded and may be
      * re-entered by job_enter(). There may still be I/O or event loop activity
-     * pending. Accessed under block_job_mutex (in blockjob.c).
+     * pending. Accessed under job_mutex.
      *
      * When the job is deferred to the main loop, busy is true as long as the
      * bottom half is still pending.
@@ -346,9 +346,9 @@ typedef enum JobCreateFlags {
 
 extern QemuMutex job_mutex;
 
-#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
+#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
 
-#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
+#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
 
 /**
  * job_lock:
@@ -422,6 +422,8 @@ void job_ref_locked(Job *job);
 /**
  * Release a reference that was previously acquired with job_ref() or
  * job_create(). If it's the last reference to the object, it will be freed.
+ *
+ * Takes AioContext lock internally to invoke a job->driver callback.
  */
 void job_unref(Job *job);
 
@@ -696,7 +698,7 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp);
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
  *
- * Callers must hold the AioContext lock of job->aio_context.
+ * Called with job_lock *not* held.
  */
 int job_cancel_sync(Job *job, bool force);
 
@@ -721,8 +723,7 @@ void job_cancel_sync_all(void);
  * function).
  *
  * Returns the return value from the job.
- *
- * Callers must hold the AioContext lock of job->aio_context.
+ * Called with job_lock *not* held.
  */
 int job_complete_sync(Job *job, Error **errp);
 
@@ -758,7 +759,7 @@ void job_dismiss_locked(Job **job, Error **errp);
  * Returns 0 if the job is successfully completed, -ECANCELED if the job was
  * cancelled before completing, and -errno in other error cases.
  *
- * Callers must hold the AioContext lock of job->aio_context.
+ * Called with job_lock *not* held.
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
                     Error **errp);
diff --git a/block/replication.c b/block/replication.c
index 5977f7a833..c67f931f37 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -727,7 +727,9 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
+            aio_context_release(aio_context);
             job_cancel_sync(&s->backup_job->job, true);
+            aio_context_acquire(aio_context);
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index 46090bb0aa..a32bafc07a 100644
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
 
@@ -1847,14 +1842,7 @@ static void drive_backup_abort(BlkActionState *common)
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_cancel_sync(&state->job->job, true);
-
-        aio_context_release(aio_context);
     }
 }
 
@@ -1948,14 +1936,7 @@ static void blockdev_backup_abort(BlkActionState *common)
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_cancel_sync(&state->job->job, true);
-
-        aio_context_release(aio_context);
     }
 }
 
@@ -3317,19 +3298,14 @@ out:
 }
 
 /*
- * Get a block job using its ID and acquire its AioContext.
- * Called with job_mutex held.
+ * Get a block job using its ID. Called with job_mutex held.
  */
-static BlockJob *find_block_job_locked(const char *id,
-                                       AioContext **aio_context,
-                                       Error **errp)
+static BlockJob *find_block_job_locked(const char *id, Error **errp)
 {
     BlockJob *job;
 
     assert(id != NULL);
 
-    *aio_context = NULL;
-
     job = block_job_get_locked(id);
 
     if (!job) {
@@ -3338,36 +3314,30 @@ static BlockJob *find_block_job_locked(const char *id,
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
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(device, &aio_context, errp);
+    job = find_block_job_locked(device, errp);
 
     if (!job) {
         return;
     }
 
     block_job_set_speed_locked(job, speed, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_cancel(const char *device,
                           bool has_force, bool force, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(device, &aio_context, errp);
+    job = find_block_job_locked(device, errp);
 
     if (!job) {
         return;
@@ -3380,22 +3350,19 @@ void qmp_block_job_cancel(const char *device,
     if (job_user_paused_locked(&job->job) && !force) {
         error_setg(errp, "The block job for device '%s' is currently paused",
                    device);
-        goto out;
+        return;
     }
 
     trace_qmp_block_job_cancel(job);
     job_user_cancel_locked(&job->job, force, errp);
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_pause(const char *device, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(device, &aio_context, errp);
+    job = find_block_job_locked(device, errp);
 
     if (!job) {
         return;
@@ -3403,16 +3370,14 @@ void qmp_block_job_pause(const char *device, Error **errp)
 
     trace_qmp_block_job_pause(job);
     job_user_pause_locked(&job->job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(device, &aio_context, errp);
+    job = find_block_job_locked(device, errp);
 
     if (!job) {
         return;
@@ -3420,16 +3385,14 @@ void qmp_block_job_resume(const char *device, Error **errp)
 
     trace_qmp_block_job_resume(job);
     job_user_resume_locked(&job->job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(device, &aio_context, errp);
+    job = find_block_job_locked(device, errp);
 
     if (!job) {
         return;
@@ -3437,16 +3400,14 @@ void qmp_block_job_complete(const char *device, Error **errp)
 
     trace_qmp_block_job_complete(job);
     job_complete_locked(&job->job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *job;
 
     JOB_LOCK_GUARD();
-    job = find_block_job_locked(id, &aio_context, errp);
+    job = find_block_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -3456,24 +3417,16 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     job_ref_locked(&job->job);
     job_finalize_locked(&job->job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
-     */
-    aio_context = block_job_get_aio_context(job);
     job_unref_locked(&job->job);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     BlockJob *bjob;
     Job *job;
 
     JOB_LOCK_GUARD();
-    bjob = find_block_job_locked(id, &aio_context, errp);
+    bjob = find_block_job_locked(id, errp);
 
     if (!bjob) {
         return;
@@ -3482,7 +3435,6 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss_locked(&job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_change_backing_file(const char *device,
@@ -3764,15 +3716,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     for (job = block_job_next_locked(NULL); job;
          job = block_job_next_locked(job)) {
         BlockJobInfo *value;
-        AioContext *aio_context;
 
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = block_job_get_aio_context(job);
-        aio_context_acquire(aio_context);
         value = block_job_query_locked(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
diff --git a/job-qmp.c b/job-qmp.c
index 393d3a5b81..d498fc89c0 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -30,36 +30,27 @@
 #include "trace/trace-root.h"
 
 /*
- * Get a job using its ID and acquire its AioContext.
- * Called with job_mutex held.
+ * Get a job using its ID. Called with job_mutex held.
  */
-static Job *find_job_locked(const char *id,
-                            AioContext **aio_context,
-                            Error **errp)
+static Job *find_job_locked(const char *id, Error **errp)
 {
     Job *job;
 
-    *aio_context = NULL;
-
     job = job_get_locked(id);
     if (!job) {
         error_setg(errp, "Job not found");
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
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -67,16 +58,14 @@ void qmp_job_cancel(const char *id, Error **errp)
 
     trace_qmp_job_cancel(job);
     job_user_cancel_locked(job, true, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_job_pause(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -84,16 +73,14 @@ void qmp_job_pause(const char *id, Error **errp)
 
     trace_qmp_job_pause(job);
     job_user_pause_locked(job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_job_resume(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -101,16 +88,14 @@ void qmp_job_resume(const char *id, Error **errp)
 
     trace_qmp_job_resume(job);
     job_user_resume_locked(job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_job_complete(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -118,16 +103,14 @@ void qmp_job_complete(const char *id, Error **errp)
 
     trace_qmp_job_complete(job);
     job_complete_locked(job, errp);
-    aio_context_release(aio_context);
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -137,23 +120,15 @@ void qmp_job_finalize(const char *id, Error **errp)
     job_ref_locked(job);
     job_finalize_locked(job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
-     */
-    aio_context = job->aio_context;
     job_unref_locked(job);
-    aio_context_release(aio_context);
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
     Job *job;
 
     JOB_LOCK_GUARD();
-    job = find_job_locked(id, &aio_context, errp);
+    job = find_job_locked(id, errp);
 
     if (!job) {
         return;
@@ -161,7 +136,6 @@ void qmp_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_job_dismiss(job);
     job_dismiss_locked(&job, errp);
-    aio_context_release(aio_context);
 }
 
 /* Called with job_mutex held. */
@@ -199,15 +173,11 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
-        AioContext *aio_context;
 
         if (job_is_internal(job)) {
             continue;
         }
-        aio_context = job->aio_context;
-        aio_context_acquire(aio_context);
         value = job_query_single_locked(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_JobInfoList(head);
             return NULL;
diff --git a/job.c b/job.c
index 3e6f61c523..76c6d7f79d 100644
--- a/job.c
+++ b/job.c
@@ -44,8 +44,6 @@
  *
  * The second includes functions used by the job drivers and sometimes
  * by the core block layer. These delegate the locking to the callee instead.
- *
- * TODO Actually make this true
  */
 
 /*
@@ -98,21 +96,11 @@ struct JobTxn {
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
@@ -187,7 +175,6 @@ static void job_txn_del_job_locked(Job *job)
 /* Called with job_mutex held, but releases it temporarily. */
 static int job_txn_apply_locked(Job *job, int fn(Job *))
 {
-    AioContext *inner_ctx;
     Job *other_job, *next;
     JobTxn *txn = job->txn;
     int rc = 0;
@@ -199,23 +186,14 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
      * break AIO_WAIT_WHILE from within fn.
      */
     job_ref_locked(job);
-    aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
-        inner_ctx = other_job->aio_context;
-        aio_context_acquire(inner_ctx);
         rc = fn(other_job);
-        aio_context_release(inner_ctx);
         if (rc) {
             break;
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
@@ -503,8 +481,12 @@ void job_unref_locked(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            AioContext *aio_context = job->aio_context;
             job_unlock();
+            /* FIXME: aiocontext lock is required because cb calls blk_unref */
+            aio_context_acquire(aio_context);
             job->driver->free(job);
+            aio_context_release(aio_context);
             job_lock();
         }
 
@@ -583,21 +565,17 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
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
 
     assert(!job->deferred_to_main_loop);
     timer_del(&job->sleep_timer);
     job->busy = true;
-    real_job_unlock();
     job_unlock();
     aio_co_wake(job->co);
     job_lock();
@@ -628,13 +606,11 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
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
@@ -920,10 +896,14 @@ static void job_clean(Job *job)
     }
 }
 
-/* Called with job_mutex held, but releases it temporarily */
+/*
+ * Called with job_mutex held, but releases it temporarily.
+ * Takes AioContext lock internally to invoke a job->driver callback.
+ */
 static int job_finalize_single_locked(Job *job)
 {
     int job_ret;
+    AioContext *ctx = job->aio_context;
 
     assert(job_is_completed_locked(job));
 
@@ -932,6 +912,7 @@ static int job_finalize_single_locked(Job *job)
 
     job_ret = job->ret;
     job_unlock();
+    aio_context_acquire(ctx);
 
     if (!job_ret) {
         job_commit(job);
@@ -940,15 +921,13 @@ static int job_finalize_single_locked(Job *job)
     }
     job_clean(job);
 
-    job_lock();
-
     if (job->cb) {
-        job_ret = job->ret;
-        job_unlock();
         job->cb(job->opaque, job_ret);
-        job_lock();
     }
 
+    aio_context_release(ctx);
+    job_lock();
+
     /* Emit events only if we actually started */
     if (job_started_locked(job)) {
         if (job_is_cancelled_locked(job)) {
@@ -963,13 +942,19 @@ static int job_finalize_single_locked(Job *job)
     return 0;
 }
 
-/* Called with job_mutex held, but releases it temporarily */
+/*
+ * Called with job_mutex held, but releases it temporarily.
+ * Takes AioContext lock internally to invoke a job->driver callback.
+ */
 static void job_cancel_async_locked(Job *job, bool force)
 {
+    AioContext *ctx = job->aio_context;
     GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
         job_unlock();
+        aio_context_acquire(ctx);
         force = job->driver->cancel(job, force);
+        aio_context_release(ctx);
         job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
@@ -1002,10 +987,12 @@ static void job_cancel_async_locked(Job *job, bool force)
     }
 }
 
-/* Called with job_mutex held, but releases it temporarily. */
+/*
+ * Called with job_mutex held, but releases it temporarily.
+ * Takes AioContext lock internally to invoke a job->driver callback.
+ */
 static void job_completed_txn_abort_locked(Job *job)
 {
-    AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
 
@@ -1018,54 +1005,31 @@ static void job_completed_txn_abort_locked(Job *job)
     txn->aborting = true;
     job_txn_ref_locked(txn);
 
-    /*
-     * We can only hold the single job's AioContext lock while calling
-     * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
-     * Note that the job's AioContext may change when it is finalized.
-     */
     job_ref_locked(job);
-    aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
      * them; this job, however, may or may not be cancelled, depending
      * on the caller, so leave it. */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
         if (other_job != job) {
-            ctx = other_job->aio_context;
-            aio_context_acquire(ctx);
             /*
              * This is a transaction: If one job failed, no result will matter.
              * Therefore, pass force=true to terminate all other jobs as quickly
              * as possible.
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
         job_finalize_single_locked(other_job);
-        aio_context_release(ctx);
     }
 
-    /*
-     * Use job_ref()/job_unref() so we can read the AioContext here
-     * even if the job went away during job_finalize_single().
-     */
-    aio_context_acquire(job->aio_context);
     job_unref_locked(job);
-
     job_txn_unref_locked(txn);
 }
 
@@ -1073,15 +1037,20 @@ static void job_completed_txn_abort_locked(Job *job)
 static int job_prepare_locked(Job *job)
 {
     int ret;
+    AioContext *ctx = job->aio_context;
 
     GLOBAL_STATE_CODE();
+
     if (job->ret == 0 && job->driver->prepare) {
         job_unlock();
+        aio_context_acquire(ctx);
         ret = job->driver->prepare(job);
+        aio_context_release(ctx);
         job_lock();
         job->ret = ret;
         job_update_rc_locked(job);
     }
+
     return job->ret;
 }
 
@@ -1186,11 +1155,8 @@ static void job_completed_locked(Job *job)
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
-    AioContext *ctx;
     JOB_LOCK_GUARD();
-
     job_ref_locked(job);
-    aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
      * callbacks. However, completion callbacks tend to involve operations that
@@ -1200,16 +1166,7 @@ static void job_exit(void *opaque)
     job_event_idle_locked(job);
 
     job_completed_locked(job);
-
-    /*
-     * Note that calling job_completed can move the job to a different
-     * aio_context, so we cannot cache from above. job_txn_apply takes care of
-     * acquiring the new lock, and we ref/unref to avoid job_completed freeing
-     * the job underneath us.
-     */
-    ctx = job->aio_context;
     job_unref_locked(job);
-    aio_context_release(ctx);
 }
 
 /**
@@ -1337,14 +1294,10 @@ int job_cancel_sync(Job *job, bool force)
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
 
@@ -1404,8 +1357,8 @@ int job_finish_sync_locked(Job *job,
     }
 
     job_unlock();
-    AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed(job)));
+    AIO_WAIT_WHILE_UNLOCKED(job->aio_context,
+                            (job_enter(job), !job_is_completed(job)));
     job_lock();
 
     ret = (job_is_cancelled_locked(job) && job->ret == 0)
diff --git a/qemu-img.c b/qemu-img.c
index e0a30b1f4c..ace3adf8ae 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, Error **errp)
     AioContext *aio_context = block_job_get_aio_context(job);
     int ret = 0;
 
-    aio_context_acquire(aio_context);
     job_lock();
     job_ref_locked(&job->job);
     do {
@@ -936,7 +935,6 @@ static void run_block_job(BlockJob *job, Error **errp)
     }
     job_unref_locked(&job->job);
     job_unlock();
-    aio_context_release(aio_context);
 
     /* publish completion progress only when success */
     if (!ret) {
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
index 96fd21c00a..def0709b2b 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -582,10 +582,10 @@ static void test_attach_blockjob(void)
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
index e4f126bb6d..f88e10e356 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -228,10 +228,7 @@ static void cancel_common(CancelJob *s)
     BlockJob *job = &s->common;
     BlockBackend *blk = s->blk;
     JobStatus sts = job->job.status;
-    AioContext *ctx;
-
-    ctx = job->job.aio_context;
-    aio_context_acquire(ctx);
+    AioContext *ctx = job->job.aio_context;
 
     job_cancel_sync(&job->job, true);
     WITH_JOB_LOCK_GUARD() {
@@ -242,9 +239,11 @@ static void cancel_common(CancelJob *s)
         assert(job->job.status == JOB_STATUS_NULL);
         job_unref_locked(&job->job);
     }
-    destroy_blk(blk);
 
+    aio_context_acquire(ctx);
+    destroy_blk(blk);
     aio_context_release(ctx);
+
 }
 
 static void test_cancel_created(void)
@@ -384,12 +383,10 @@ static void test_cancel_concluded(void)
     aio_poll(qemu_get_aio_context(), true);
     assert_job_status_is(job, JOB_STATUS_PENDING);
 
-    aio_context_acquire(job->aio_context);
     WITH_JOB_LOCK_GUARD() {
         job_finalize_locked(job, &error_abort);
+        assert(job->status == JOB_STATUS_CONCLUDED);
     }
-    aio_context_release(job->aio_context);
-    assert_job_status_is(job, JOB_STATUS_CONCLUDED);
 
     cancel_common(s);
 }
@@ -481,13 +478,11 @@ static void test_complete_in_standby(void)
 
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
@@ -497,6 +492,7 @@ static void test_complete_in_standby(void)
     aio_context_acquire(ctx);
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
+    aio_context_release(ctx);
 
     WITH_JOB_LOCK_GUARD() {
         /* But the job cannot run, so it will remain on standby */
@@ -515,6 +511,7 @@ static void test_complete_in_standby(void)
         job_dismiss_locked(&job, &error_abort);
     }
 
+    aio_context_acquire(ctx);
     destroy_blk(blk);
     aio_context_release(ctx);
     iothread_join(iothread);
-- 
2.37.3


