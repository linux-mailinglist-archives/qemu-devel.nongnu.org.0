Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEE4D8634
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:49:06 +0100 (CET)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTl4L-0003dL-Db
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:49:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt5-0006mh-Vj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksx-0001b3-GL
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8r7L7FmkU/3fYvka1ITkirfC7TrwZ5J4MfLmob/0NI=;
 b=LHNsSyJenKNT4fdjBBT/9eM0t+ejVF13Y5Chnox2GQRS0OSm74FiQXxVqWFg99QLs4Su9p
 sLdD55YxFpLi8pxtr5VRRJm/BIUe1SrOtSixIgIKgcdLuBFA/cFlBCcTt7NcLAOLKIdRBp
 17dgysYNb+DudXGjxI2B9DgMvmd2SDw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-qbrb0928PSClW1g-RufDyA-1; Mon, 14 Mar 2022 09:37:17 -0400
X-MC-Unique: qbrb0928PSClW1g-RufDyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 259CC1C05AE8;
 Mon, 14 Mar 2022 13:37:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE331465044;
 Mon, 14 Mar 2022 13:37:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 11/18] job.h: rename job API functions called with
 job_mutex held
Date: Mon, 14 Mar 2022 09:37:00 -0400
Message-Id: <20220314133707.2206082-12-eesposit@redhat.com>
In-Reply-To: <20220314133707.2206082-1-eesposit@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

With the *nop* job_lock/unlock placed, rename the job functions
of the job API that are always under job_mutex, adding "_locked"
suffix.

List of functions that get this suffix:
job_txn_unref		job_txn_add_job
job_ref			job_unref
job_enter_cond		job_finish_sync
job_is_ready		job_pause
job_resume		job_user_pause
job_user_paused		job_user_resume
job_next		job_get
job_apply_verb		job_complete
job_cancel		job_user_cancel
job_cancel_sync		job_complete_sync
job_finalize		job_dismiss

Note that "locked" refers to the *nop* job_lock/unlock, and not
real_job_lock/unlock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          |   2 +-
 block/mirror.c                   |   2 +-
 block/replication.c              |   4 +-
 blockdev.c                       |  32 ++++----
 blockjob.c                       |  14 ++--
 include/qemu/job.h               | 119 ++++++++++++++++++----------
 job-qmp.c                        |  26 +++----
 job.c                            | 129 ++++++++++++++++---------------
 qemu-img.c                       |   6 +-
 tests/unit/test-bdrv-drain.c     |   2 +-
 tests/unit/test-block-iothread.c |   4 +-
 tests/unit/test-blockjob-txn.c   |  14 ++--
 tests/unit/test-blockjob.c       |  30 +++----
 13 files changed, 213 insertions(+), 171 deletions(-)

diff --git a/block.c b/block.c
index 5dc46fde11..9cf3416bea 100644
--- a/block.c
+++ b/block.c
@@ -4979,7 +4979,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     WITH_JOB_LOCK_GUARD() {
-        assert(job_next(NULL) == NULL);
+        assert(job_next_locked(NULL) == NULL);
     }
     GLOBAL_STATE_CODE();
 
diff --git a/block/mirror.c b/block/mirror.c
index b3b64a280a..a7c3bab382 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1157,7 +1157,7 @@ static void mirror_complete(Job *job, Error **errp)
     /* If the job is paused, it will be re-entered when it is resumed */
     WITH_JOB_LOCK_GUARD() {
         if (!job->paused) {
-            job_enter_cond(job, NULL);
+            job_enter_cond_locked(job, NULL);
         }
     }
 }
diff --git a/block/replication.c b/block/replication.c
index a03b28726e..50ea778937 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -150,7 +150,7 @@ static void replication_close(BlockDriverState *bs)
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
         WITH_JOB_LOCK_GUARD() {
-            job_cancel_sync(commit_job, false);
+            job_cancel_sync_locked(commit_job, false);
         }
     }
 
@@ -729,7 +729,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          */
         if (s->backup_job) {
             WITH_JOB_LOCK_GUARD() {
-                job_cancel_sync(&s->backup_job->job, true);
+                job_cancel_sync_locked(&s->backup_job->job, true);
             }
         }
 
diff --git a/blockdev.c b/blockdev.c
index 39e6fe4d59..1ac9dac1b0 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -157,7 +157,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
 
-            job_cancel(&job->job, false);
+            job_cancel_locked(&job->job, false);
 
             aio_context_release(aio_context);
         }
@@ -1841,7 +1841,7 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context_acquire(aio_context);
 
         WITH_JOB_LOCK_GUARD() {
-            job_cancel_sync(&state->job->job, true);
+            job_cancel_sync_locked(&state->job->job, true);
         }
 
         aio_context_release(aio_context);
@@ -1944,7 +1944,7 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context_acquire(aio_context);
 
         WITH_JOB_LOCK_GUARD() {
-            job_cancel_sync(&state->job->job, true);
+            job_cancel_sync_locked(&state->job->job, true);
         }
 
         aio_context_release(aio_context);
@@ -2396,7 +2396,7 @@ exit:
     }
 
     WITH_JOB_LOCK_GUARD() {
-        job_txn_unref(block_job_txn);
+        job_txn_unref_locked(block_job_txn);
     }
 }
 
@@ -3371,14 +3371,14 @@ void qmp_block_job_cancel(const char *device,
         force = false;
     }
 
-    if (job_user_paused(&job->job) && !force) {
+    if (job_user_paused_locked(&job->job) && !force) {
         error_setg(errp, "The block job for device '%s' is currently paused",
                    device);
         goto out;
     }
 
     trace_qmp_block_job_cancel(job);
-    job_user_cancel(&job->job, force, errp);
+    job_user_cancel_locked(&job->job, force, errp);
 out:
     aio_context_release(aio_context);
 }
@@ -3396,7 +3396,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_pause(job);
-    job_user_pause(&job->job, errp);
+    job_user_pause_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3413,7 +3413,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_resume(job);
-    job_user_resume(&job->job, errp);
+    job_user_resume_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3430,7 +3430,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_complete(job);
-    job_complete(&job->job, errp);
+    job_complete_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3447,16 +3447,16 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     }
 
     trace_qmp_block_job_finalize(job);
-    job_ref(&job->job);
-    job_finalize(&job->job, errp);
+    job_ref_locked(&job->job);
+    job_finalize_locked(&job->job, errp);
 
     /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
+     * Job's context might have changed via job_finalize_locked
+     * (and job_txn_apply automatically acquires the new one),
+     * so make sure we release the correct one.
      */
     aio_context = block_job_get_aio_context(job);
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
     aio_context_release(aio_context);
 }
 
@@ -3475,7 +3475,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
diff --git a/blockjob.c b/blockjob.c
index d726efe679..02a98630c9 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -65,7 +65,7 @@ BlockJob *block_job_next(BlockJob *bjob)
     GLOBAL_STATE_CODE();
 
     do {
-        job = job_next(job);
+        job = job_next_locked(job);
     } while (job && !is_block_job(job));
 
     return job ? container_of(job, BlockJob, job) : NULL;
@@ -73,7 +73,7 @@ BlockJob *block_job_next(BlockJob *bjob)
 
 BlockJob *block_job_get(const char *id)
 {
-    Job *job = job_get(id);
+    Job *job = job_get_locked(id);
     GLOBAL_STATE_CODE();
 
     if (job && is_block_job(job)) {
@@ -103,7 +103,7 @@ static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
     WITH_JOB_LOCK_GUARD() {
-        job_pause(&job->job);
+        job_pause_locked(&job->job);
     }
 }
 
@@ -135,7 +135,7 @@ static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
     WITH_JOB_LOCK_GUARD() {
-        job_resume(&job->job);
+        job_resume_locked(&job->job);
     }
 }
 
@@ -284,7 +284,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 
     GLOBAL_STATE_CODE();
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+    if (job_apply_verb_locked(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
     if (speed < 0) {
@@ -308,7 +308,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }
 
     /* kick only if a timer is pending */
-    job_enter_cond(&job->job, job_timer_pending);
+    job_enter_cond_locked(&job->job, job_timer_pending);
 
     return true;
 }
@@ -563,7 +563,7 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     if (action == BLOCK_ERROR_ACTION_STOP) {
         WITH_JOB_LOCK_GUARD() {
             if (!job->job.user_paused) {
-                job_pause(&job->job);
+                job_pause_locked(&job->job);
                 /*
                  * make the pause user visible, which will be
                  * resumed from QMP.
diff --git a/include/qemu/job.h b/include/qemu/job.h
index aa33d091b1..dfd2586e63 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -339,7 +339,7 @@ void job_unlock(void);
 
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
- * transaction using job_txn_add_job().
+ * transaction using job_txn_add_job_locked().
  *
  * The transaction is automatically freed when the last job completes or is
  * cancelled.
@@ -351,10 +351,12 @@ void job_unlock(void);
 JobTxn *job_txn_new(void);
 
 /**
- * Release a reference that was previously acquired with job_txn_add_job or
- * job_txn_new. If it's the last reference to the object, it will be freed.
+ * Release a reference that was previously acquired with job_txn_add_job_locked
+ * or job_txn_new. If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_txn_unref(JobTxn *txn);
+void job_txn_unref_locked(JobTxn *txn);
 
 /**
  * Create a new long-running job and return it.
@@ -373,16 +375,20 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  void *opaque, Error **errp);
 
 /**
- * Add a reference to Job refcnt, it will be decreased with job_unref, and then
- * be freed if it comes to be the last reference.
+ * Add a reference to Job refcnt, it will be decreased with job_unref_locked,
+ * and then be freed if it comes to be the last reference.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_ref(Job *job);
+void job_ref_locked(Job *job);
 
 /**
- * Release a reference that was previously acquired with job_ref() or
+ * Release a reference that was previously acquired with job_ref_locked() or
  * job_create(). If it's the last reference to the object, it will be freed.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
  */
-void job_unref(Job *job);
+void job_unref_locked(Job *job);
 
 /**
  * @job: The job that has made progress
@@ -421,8 +427,10 @@ void job_progress_increase_remaining(Job *job, uint64_t delta);
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
  * critical section.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
  */
-void job_enter_cond(Job *job, bool(*fn)(Job *job));
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
 
 /**
  * @job: A job that has not yet been started.
@@ -442,8 +450,8 @@ void job_enter(Job *job);
 /**
  * @job: The job that is ready to pause.
  *
- * Pause now if job_pause() has been called. Jobs that perform lots of I/O
- * must call this between requests so that the job can be paused.
+ * Pause now if job_pause_locked() has been called. Jobs that perform lots of
+ * I/O must call this between requests so that the job can be paused.
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -509,50 +517,68 @@ bool job_is_ready_locked(Job *job);
 
 /**
  * Request @job to pause at the next pause point. Must be paired with
- * job_resume(). If the job is supposed to be resumed by user action, call
- * job_user_pause() instead.
+ * job_resume_locked(). If the job is supposed to be resumed by user action,
+ * call job_user_pause_locked() instead.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_pause(Job *job);
+void job_pause_locked(Job *job);
 
-/** Resumes a @job paused with job_pause. */
-void job_resume(Job *job);
+/**
+ * Resumes a @job paused with job_pause_locked.
+ * Called between job_lock and job_unlock.
+ */
+void job_resume_locked(Job *job);
 
 /**
  * Asynchronously pause the specified @job.
- * Do not allow a resume until a matching call to job_user_resume.
+ * Do not allow a resume until a matching call to job_user_resume_locked.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_user_pause(Job *job, Error **errp);
+void job_user_pause_locked(Job *job, Error **errp);
 
-/** Returns true if the job is user-paused. */
-bool job_user_paused(Job *job);
+/**
+ * Returns true if the job is user-paused.
+ * Called between job_lock and job_unlock.
+ */
+bool job_user_paused_locked(Job *job);
 
 /**
  * Resume the specified @job.
- * Must be paired with a preceding job_user_pause.
+ * Must be paired with a preceding job_user_pause_locked.
+ *
+ * Called between job_lock and job_unlock, but might release it temporarly.
  */
-void job_user_resume(Job *job, Error **errp);
+void job_user_resume_locked(Job *job, Error **errp);
 
 /**
  * Get the next element from the list of block jobs after @job, or the
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ *
+ * Called between job_lock and job_unlock.
  */
-Job *job_next(Job *job);
+Job *job_next_locked(Job *job);
 
 /**
  * Get the job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ *
+ * Called between job_lock and job_unlock.
  */
-Job *job_get(const char *id);
+Job *job_get_locked(const char *id);
 
 /**
  * Check whether the verb @verb can be applied to @job in its current state.
  * Returns 0 if the verb can be applied; otherwise errp is set and -EPERM
  * returned.
+ *
+ * Called between job_lock and job_unlock.
  */
-int job_apply_verb(Job *job, JobVerb verb, Error **errp);
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
 
 /** The @job could not be started, free it. */
 void job_early_fail(Job *job);
@@ -560,20 +586,27 @@ void job_early_fail(Job *job);
 /** Moves the @job from RUNNING to READY */
 void job_transition_to_ready(Job *job);
 
-/** Asynchronously complete the specified @job. */
-void job_complete(Job *job, Error **errp);
+/**
+ * Asynchronously complete the specified @job.
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
+ */
+void job_complete_locked(Job *job, Error **errp);
 
 /**
  * Asynchronously cancel the specified @job. If @force is true, the job should
  * be cancelled immediately without waiting for a consistent state.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_cancel(Job *job, bool force);
+void job_cancel_locked(Job *job, bool force);
 
 /**
- * Cancels the specified job like job_cancel(), but may refuse to do so if the
- * operation isn't meaningful in the current state of the job.
+ * Cancels the specified job like job_cancel_locked(), but may refuse to do so
+ * if the operation isn't meaningful in the current state of the job.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_user_cancel(Job *job, bool force, Error **errp);
+void job_user_cancel_locked(Job *job, bool force, Error **errp);
 
 /**
  * Synchronously cancel the @job.  The completion callback is called
@@ -585,15 +618,16 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  * during the call, or -ECANCELED if it was canceled.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ * Called between job_lock and job_unlock.
  */
-int job_cancel_sync(Job *job, bool force);
+int job_cancel_sync_locked(Job *job, bool force);
 
-/** Synchronously force-cancels all jobs using job_cancel_sync(). */
+/** Synchronously force-cancels all jobs using job_cancel_sync_locked(). */
 void job_cancel_sync_all(void);
 
 /**
  * @job: The job to be completed.
- * @errp: Error object which may be set by job_complete(); this is not
+ * @errp: Error object which may be set by job_complete_locked(); this is not
  *        necessarily set on every error, the job return value has to be
  *        checked as well.
  *
@@ -604,8 +638,9 @@ void job_cancel_sync_all(void);
  * Returns the return value from the job.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ * Called between job_lock and job_unlock.
  */
-int job_complete_sync(Job *job, Error **errp);
+int job_complete_sync_locked(Job *job, Error **errp);
 
 /**
  * For a @job that has finished its work and is pending awaiting explicit
@@ -614,14 +649,18 @@ int job_complete_sync(Job *job, Error **errp);
  * FIXME: Make the below statement universally true:
  * For jobs that support the manual workflow mode, all graph changes that occur
  * as a result will occur after this command and before a successful reply.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_finalize(Job *job, Error **errp);
+void job_finalize_locked(Job *job, Error **errp);
 
 /**
  * Remove the concluded @job from the query list and resets the passed pointer
  * to %NULL. Returns an error if the job is not actually concluded.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_dismiss(Job **job, Error **errp);
+void job_dismiss_locked(Job **job, Error **errp);
 
 /**
  * Synchronously finishes the given @job. If @finish is given, it is called to
@@ -631,7 +670,9 @@ void job_dismiss(Job **job, Error **errp);
  * cancelled before completing, and -errno in other error cases.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ * Called between job_lock and job_unlock.
  */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
+                           Error **errp);
 
 #endif
diff --git a/job-qmp.c b/job-qmp.c
index 58ca9b6632..c2eabae09c 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -39,7 +39,7 @@ static Job *find_job_locked(const char *id, AioContext **aio_context, Error **er
 
     *aio_context = NULL;
 
-    job = job_get(id);
+    job = job_get_locked(id);
     if (!job) {
         error_setg(errp, "Job not found");
         return NULL;
@@ -64,7 +64,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     }
 
     trace_qmp_job_cancel(job);
-    job_user_cancel(job, true, errp);
+    job_user_cancel_locked(job, true, errp);
     aio_context_release(aio_context);
 }
 
@@ -81,7 +81,7 @@ void qmp_job_pause(const char *id, Error **errp)
     }
 
     trace_qmp_job_pause(job);
-    job_user_pause(job, errp);
+    job_user_pause_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -98,7 +98,7 @@ void qmp_job_resume(const char *id, Error **errp)
     }
 
     trace_qmp_job_resume(job);
-    job_user_resume(job, errp);
+    job_user_resume_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -115,7 +115,7 @@ void qmp_job_complete(const char *id, Error **errp)
     }
 
     trace_qmp_job_complete(job);
-    job_complete(job, errp);
+    job_complete_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -132,16 +132,16 @@ void qmp_job_finalize(const char *id, Error **errp)
     }
 
     trace_qmp_job_finalize(job);
-    job_ref(job);
-    job_finalize(job, errp);
+    job_ref_locked(job);
+    job_finalize_locked(job, errp);
 
     /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
+     * Job's context might have changed via job_finalize_locked
+     * (and job_txn_apply automatically acquires the new one),
+     * so make sure we release the correct one.
      */
     aio_context = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(aio_context);
 }
 
@@ -158,7 +158,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
     }
 
     trace_qmp_job_dismiss(job);
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
@@ -194,7 +194,7 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     JOB_LOCK_GUARD();
 
-    for (job = job_next(NULL); job; job = job_next(job)) {
+    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
         AioContext *aio_context;
 
diff --git a/job.c b/job.c
index 298432ce00..217a7493fd 100644
--- a/job.c
+++ b/job.c
@@ -119,7 +119,7 @@ static void job_txn_ref_locked(JobTxn *txn)
     txn->refcnt++;
 }
 
-void job_txn_unref(JobTxn *txn)
+void job_txn_unref_locked(JobTxn *txn)
 {
     if (txn && --txn->refcnt == 0) {
         g_free(txn);
@@ -136,7 +136,7 @@ void job_txn_unref(JobTxn *txn)
  *
  * If @txn is NULL, the function does nothing.
  */
-static void job_txn_add_job(JobTxn *txn, Job *job)
+static void job_txn_add_job_locked(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
@@ -154,7 +154,7 @@ static void job_txn_del_job_locked(Job *job)
 {
     if (job->txn) {
         QLIST_REMOVE(job, txn_list);
-        job_txn_unref(job->txn);
+        job_txn_unref_locked(job->txn);
         job->txn = NULL;
     }
 }
@@ -173,7 +173,7 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
      * the caller, we need to release it here to avoid holding the lock
      * twice - which would break AIO_WAIT_WHILE from within fn.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
@@ -191,7 +191,7 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
      * can't use a local variable to cache it.
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
     return rc;
 }
 
@@ -216,7 +216,7 @@ static void job_state_transition_locked(Job *job, JobStatus s1)
     }
 }
 
-int job_apply_verb(Job *job, JobVerb verb, Error **errp)
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp)
 {
     JobStatus s0 = job->status;
     assert(verb >= 0 && verb < JOB_VERB__MAX);
@@ -332,7 +332,7 @@ static bool job_should_pause_locked(Job *job)
     return job->pause_count > 0;
 }
 
-Job *job_next(Job *job)
+Job *job_next_locked(Job *job)
 {
     if (!job) {
         return QLIST_FIRST(&jobs);
@@ -340,7 +340,7 @@ Job *job_next(Job *job)
     return QLIST_NEXT(job, job_list);
 }
 
-Job *job_get(const char *id)
+Job *job_get_locked(const char *id)
 {
     Job *job;
 
@@ -377,7 +377,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
             error_setg(errp, "Invalid job ID '%s'", job_id);
             return NULL;
         }
-        if (job_get(job_id)) {
+        if (job_get_locked(job_id)) {
             error_setg(errp, "Job ID '%s' already in use", job_id);
             return NULL;
         }
@@ -418,21 +418,21 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
      * consolidating the job management logic */
     if (!txn) {
         txn = job_txn_new();
-        job_txn_add_job(txn, job);
-        job_txn_unref(txn);
+        job_txn_add_job_locked(txn, job);
+        job_txn_unref_locked(txn);
     } else {
-        job_txn_add_job(txn, job);
+        job_txn_add_job_locked(txn, job);
     }
 
     return job;
 }
 
-void job_ref(Job *job)
+void job_ref_locked(Job *job)
 {
     ++job->refcnt;
 }
 
-void job_unref(Job *job)
+void job_unref_locked(Job *job)
 {
     GLOBAL_STATE_CODE();
 
@@ -507,7 +507,7 @@ static void job_event_idle_locked(Job *job)
     notifier_list_notify(&job->on_idle, job);
 }
 
-void job_enter_cond(Job *job, bool(*fn)(Job *job))
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
 {
     if (!job_started(job)) {
         return;
@@ -537,7 +537,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
 void job_enter(Job *job)
 {
     JOB_LOCK_GUARD();
-    job_enter_cond(job, NULL);
+    job_enter_cond_locked(job, NULL);
 }
 
 /*
@@ -563,7 +563,7 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
     qemu_coroutine_yield();
     job_lock();
 
-    /* Set by job_enter_cond() before re-entering the coroutine.  */
+    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
@@ -649,15 +649,15 @@ static bool job_timer_not_pending_locked(Job *job)
     return !timer_pending(&job->sleep_timer);
 }
 
-void job_pause(Job *job)
+void job_pause_locked(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter_cond(job, NULL);
+        job_enter_cond_locked(job, NULL);
     }
 }
 
-void job_resume(Job *job)
+void job_resume_locked(Job *job)
 {
     assert(job->pause_count > 0);
     job->pause_count--;
@@ -666,12 +666,12 @@ void job_resume(Job *job)
     }
 
     /* kick only if no timer is pending */
-    job_enter_cond(job, job_timer_not_pending_locked);
+    job_enter_cond_locked(job, job_timer_not_pending_locked);
 }
 
-void job_user_pause(Job *job, Error **errp)
+void job_user_pause_locked(Job *job, Error **errp)
 {
-    if (job_apply_verb(job, JOB_VERB_PAUSE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_PAUSE, errp)) {
         return;
     }
     if (job->user_paused) {
@@ -679,15 +679,15 @@ void job_user_pause(Job *job, Error **errp)
         return;
     }
     job->user_paused = true;
-    job_pause(job);
+    job_pause_locked(job);
 }
 
-bool job_user_paused(Job *job)
+bool job_user_paused_locked(Job *job)
 {
     return job->user_paused;
 }
 
-void job_user_resume(Job *job, Error **errp)
+void job_user_resume_locked(Job *job, Error **errp)
 {
     assert(job);
     GLOBAL_STATE_CODE();
@@ -695,7 +695,7 @@ void job_user_resume(Job *job, Error **errp)
         error_setg(errp, "Can't resume a job that was not paused");
         return;
     }
-    if (job_apply_verb(job, JOB_VERB_RESUME, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_RESUME, errp)) {
         return;
     }
     if (job->driver->user_resume) {
@@ -704,7 +704,7 @@ void job_user_resume(Job *job, Error **errp)
         job_lock();
     }
     job->user_paused = false;
-    job_resume(job);
+    job_resume_locked(job);
 }
 
 /* Called with job_mutex held. */
@@ -718,15 +718,15 @@ static void job_do_dismiss_locked(Job *job)
     job_txn_del_job_locked(job);
 
     job_state_transition_locked(job, JOB_STATUS_NULL);
-    job_unref(job);
+    job_unref_locked(job);
 }
 
-void job_dismiss(Job **jobptr, Error **errp)
+void job_dismiss_locked(Job **jobptr, Error **errp)
 {
     Job *job = *jobptr;
     /* similarly to _complete, this is QMP-interface only. */
     assert(job->id);
-    if (job_apply_verb(job, JOB_VERB_DISMISS, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_DISMISS, errp)) {
         return;
     }
 
@@ -898,7 +898,7 @@ static void job_completed_txn_abort_locked(Job *job)
      * involve calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
@@ -927,20 +927,20 @@ static void job_completed_txn_abort_locked(Job *job)
         aio_context_acquire(ctx);
         if (!job_is_completed_locked(other_job)) {
             assert(job_cancel_requested_locked(other_job));
-            job_finish_sync(other_job, NULL, NULL);
+            job_finish_sync_locked(other_job, NULL, NULL);
         }
         job_finalize_single_locked(other_job);
         aio_context_release(ctx);
     }
 
     /*
-     * Use job_ref()/job_unref() so we can read the AioContext here
-     * even if the job went away during job_finalize_single_locked().
+     * Use job_ref_locked()/job_unref_locked() so we can read the AioContext
+     * here even if the job went away during job_finalize_single_locked().
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
 
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 }
 
 /* Called with job_mutex held, but releases it temporarly. */
@@ -980,10 +980,10 @@ static void job_do_finalize_locked(Job *job)
     }
 }
 
-void job_finalize(Job *job, Error **errp)
+void job_finalize_locked(Job *job, Error **errp)
 {
     assert(job && job->id);
-    if (job_apply_verb(job, JOB_VERB_FINALIZE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_FINALIZE, errp)) {
         return;
     }
     job_do_finalize_locked(job);
@@ -1057,7 +1057,7 @@ static void job_exit(void *opaque)
     AioContext *ctx;
     JOB_LOCK_GUARD();
 
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
@@ -1077,7 +1077,7 @@ static void job_exit(void *opaque)
      * freeing the job underneath us.
      */
     ctx = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(ctx);
 }
 
@@ -1118,7 +1118,7 @@ void job_start(Job *job)
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_cancel(Job *job, bool force)
+void job_cancel_locked(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
         job_do_dismiss_locked(job);
@@ -1142,28 +1142,28 @@ void job_cancel(Job *job, bool force)
             job_completed_txn_abort_locked(job);
         }
     } else {
-        job_enter_cond(job, NULL);
+        job_enter_cond_locked(job, NULL);
     }
 }
 
-void job_user_cancel(Job *job, bool force, Error **errp)
+void job_user_cancel_locked(Job *job, bool force, Error **errp)
 {
-    if (job_apply_verb(job, JOB_VERB_CANCEL, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_CANCEL, errp)) {
         return;
     }
-    job_cancel(job, force);
+    job_cancel_locked(job, force);
 }
 
 /*
- * A wrapper around job_cancel() taking an Error ** parameter so it may be
- * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there.
+ * A wrapper around job_cancel_locked() taking an Error ** parameter
+ * so it may be used with job_finish_sync_locked() without the need
+ * for (rather nasty) function pointer casts there.
  *
  * Called with job_mutex held.
  */
 static void job_cancel_err_locked(Job *job, Error **errp)
 {
-    job_cancel(job, false);
+    job_cancel_locked(job, false);
 }
 
 /**
@@ -1172,15 +1172,15 @@ static void job_cancel_err_locked(Job *job, Error **errp)
  */
 static void job_force_cancel_err_locked(Job *job, Error **errp)
 {
-    job_cancel(job, true);
+    job_cancel_locked(job, true);
 }
 
-int job_cancel_sync(Job *job, bool force)
+int job_cancel_sync_locked(Job *job, bool force)
 {
     if (force) {
-        return job_finish_sync(job, &job_force_cancel_err_locked, NULL);
+        return job_finish_sync_locked(job, &job_force_cancel_err_locked, NULL);
     } else {
-        return job_finish_sync(job, &job_cancel_err_locked, NULL);
+        return job_finish_sync_locked(job, &job_cancel_err_locked, NULL);
     }
 }
 
@@ -1190,25 +1190,25 @@ void job_cancel_sync_all(void)
     AioContext *aio_context;
 
     JOB_LOCK_GUARD();
-    while ((job = job_next(NULL))) {
+    while ((job = job_next_locked(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        job_cancel_sync(job, true);
+        job_cancel_sync_locked(job, true);
         aio_context_release(aio_context);
     }
 }
 
-int job_complete_sync(Job *job, Error **errp)
+int job_complete_sync_locked(Job *job, Error **errp)
 {
-    return job_finish_sync(job, job_complete, errp);
+    return job_finish_sync_locked(job, job_complete_locked, errp);
 }
 
-void job_complete(Job *job, Error **errp)
+void job_complete_locked(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
     GLOBAL_STATE_CODE();
-    if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
     if (job_cancel_requested_locked(job) || !job->driver->complete) {
@@ -1222,19 +1222,20 @@ void job_complete(Job *job, Error **errp)
     job_lock();
 }
 
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
+                           Error **errp)
 {
     Error *local_err = NULL;
     int ret;
 
-    job_ref(job);
+    job_ref_locked(job);
 
     if (finish) {
         finish(job, &local_err);
     }
     if (local_err) {
         error_propagate(errp, local_err);
-        job_unref(job);
+        job_unref_locked(job);
         return -EBUSY;
     }
 
@@ -1245,6 +1246,6 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
 
     ret = (job_is_cancelled_locked(job) && job->ret == 0)
           ? -ECANCELED : job->ret;
-    job_unref(job);
+    job_unref_locked(job);
     return ret;
 }
diff --git a/qemu-img.c b/qemu-img.c
index 320d82b42a..315c9c2a31 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -907,7 +907,7 @@ static void run_block_job(BlockJob *job, Error **errp)
 
     aio_context_acquire(aio_context);
     WITH_JOB_LOCK_GUARD() {
-        job_ref(&job->job);
+        job_ref_locked(&job->job);
         do {
             float progress = 0.0f;
             job_unlock();
@@ -924,11 +924,11 @@ static void run_block_job(BlockJob *job, Error **errp)
                  !job_is_completed_locked(&job->job));
 
         if (!job_is_completed_locked(&job->job)) {
-            ret = job_complete_sync(&job->job, errp);
+            ret = job_complete_sync_locked(&job->job, errp);
         } else {
             ret = job->job.ret;
         }
-        job_unref(&job->job);
+        job_unref_locked(&job->job);
     }
     aio_context_release(aio_context);
 
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 181458eecb..0db056ea63 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1018,7 +1018,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
 
     aio_context_acquire(ctx);
     WITH_JOB_LOCK_GUARD() {
-        ret = job_complete_sync(&job->job, &error_abort);
+        ret = job_complete_sync_locked(&job->job, &error_abort);
     }
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 9866262f79..89e7f0fffb 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -457,7 +457,7 @@ static void test_attach_blockjob(void)
 
     aio_context_acquire(ctx);
     WITH_JOB_LOCK_GUARD() {
-        job_complete_sync(&tjob->common.job, &error_abort);
+        job_complete_sync_locked(&tjob->common.job, &error_abort);
     }
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
@@ -633,7 +633,7 @@ static void test_propagate_mirror(void)
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
     WITH_JOB_LOCK_GUARD() {
-        job = job_get("job0");
+        job = job_get_locked("job0");
     }
     filter = bdrv_find_node("filter_node");
 
diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 0355e54001..8dc1eaefc8 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -118,7 +118,7 @@ static void test_single_job(int expected)
 
     WITH_JOB_LOCK_GUARD() {
         if (expected == -ECANCELED) {
-            job_cancel(&job->job, false);
+            job_cancel_locked(&job->job, false);
         }
     }
 
@@ -128,7 +128,7 @@ static void test_single_job(int expected)
     g_assert_cmpint(result, ==, expected);
 
     WITH_JOB_LOCK_GUARD() {
-        job_txn_unref(txn);
+        job_txn_unref_locked(txn);
     }
 }
 
@@ -165,13 +165,13 @@ static void test_pair_jobs(int expected1, int expected2)
      * use-after-free bugs as possible.
      */
     WITH_JOB_LOCK_GUARD() {
-        job_txn_unref(txn);
+        job_txn_unref_locked(txn);
 
         if (expected1 == -ECANCELED) {
-            job_cancel(&job1->job, false);
+            job_cancel_locked(&job1->job, false);
         }
         if (expected2 == -ECANCELED) {
-            job_cancel(&job2->job, false);
+            job_cancel_locked(&job2->job, false);
         }
     }
 
@@ -226,7 +226,7 @@ static void test_pair_jobs_fail_cancel_race(void)
     job_start(&job2->job);
 
     WITH_JOB_LOCK_GUARD() {
-        job_cancel(&job1->job, false);
+        job_cancel_locked(&job1->job, false);
     }
 
     /* Now make job2 finish before the main loop kicks jobs.  This simulates
@@ -243,7 +243,7 @@ static void test_pair_jobs_fail_cancel_race(void)
     g_assert_cmpint(result2, ==, -ECANCELED);
 
     WITH_JOB_LOCK_GUARD() {
-        job_txn_unref(txn);
+        job_txn_unref_locked(txn);
     }
 }
 
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index ab7958dad5..8280b1e0c9 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -212,7 +212,7 @@ static CancelJob *create_common(Job **pjob)
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
     WITH_JOB_LOCK_GUARD() {
-        job_ref(job);
+        job_ref_locked(job);
         assert(job->status == JOB_STATUS_CREATED);
     }
 
@@ -234,13 +234,13 @@ static void cancel_common(CancelJob *s)
     aio_context_acquire(ctx);
 
     WITH_JOB_LOCK_GUARD() {
-        job_cancel_sync(&job->job, true);
+        job_cancel_sync_locked(&job->job, true);
         if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
             Job *dummy = &job->job;
-            job_dismiss(&dummy, &error_abort);
+            job_dismiss_locked(&dummy, &error_abort);
         }
         assert(job->job.status == JOB_STATUS_NULL);
-        job_unref(&job->job);
+        job_unref_locked(&job->job);
     }
     destroy_blk(blk);
 
@@ -288,7 +288,7 @@ static void test_cancel_paused(void)
     assert(job->status == JOB_STATUS_RUNNING);
 
     WITH_JOB_LOCK_GUARD() {
-        job_user_pause(job, &error_abort);
+        job_user_pause_locked(job, &error_abort);
     }
     job_enter(job);
     assert(job->status == JOB_STATUS_PAUSED);
@@ -336,7 +336,7 @@ static void test_cancel_standby(void)
     assert(job->status == JOB_STATUS_READY);
 
     WITH_JOB_LOCK_GUARD() {
-        job_user_pause(job, &error_abort);
+        job_user_pause_locked(job, &error_abort);
     }
     job_enter(job);
     assert(job->status == JOB_STATUS_STANDBY);
@@ -363,7 +363,7 @@ static void test_cancel_pending(void)
     assert(job->status == JOB_STATUS_READY);
 
     WITH_JOB_LOCK_GUARD() {
-        job_complete(job, &error_abort);
+        job_complete_locked(job, &error_abort);
     }
     job_enter(job);
     while (!job->deferred_to_main_loop) {
@@ -395,7 +395,7 @@ static void test_cancel_concluded(void)
     assert(job->status == JOB_STATUS_READY);
 
     WITH_JOB_LOCK_GUARD() {
-        job_complete(job, &error_abort);
+        job_complete_locked(job, &error_abort);
     }
     job_enter(job);
     while (!job->deferred_to_main_loop) {
@@ -407,7 +407,7 @@ static void test_cancel_concluded(void)
 
     aio_context_acquire(job->aio_context);
     WITH_JOB_LOCK_GUARD() {
-        job_finalize(job, &error_abort);
+        job_finalize_locked(job, &error_abort);
     }
     aio_context_release(job->aio_context);
     assert(job->status == JOB_STATUS_CONCLUDED);
@@ -456,7 +456,7 @@ static const BlockJobDriver test_yielding_driver = {
 };
 
 /*
- * Test that job_complete() works even on jobs that are in a paused
+ * Test that job_complete_locked() works even on jobs that are in a paused
  * state (i.e., STANDBY).
  *
  * To do this, run YieldingJob in an IO thread, get it into the READY
@@ -464,7 +464,7 @@ static const BlockJobDriver test_yielding_driver = {
  * acquire the context so the job will not be entered and will thus
  * remain on STANDBY.
  *
- * job_complete() should still work without error.
+ * job_complete_locked() should still work without error.
  *
  * Note that on the QMP interface, it is impossible to lock an IO
  * thread before a drained section ends.  In practice, the
@@ -526,16 +526,16 @@ static void test_complete_in_standby(void)
         assert(job->status == JOB_STATUS_STANDBY);
 
         /* Even though the job is on standby, this should work */
-        job_complete(job, &error_abort);
+        job_complete_locked(job, &error_abort);
 
         /* The test is done now, clean up. */
-        job_finish_sync(job, NULL, &error_abort);
+        job_finish_sync_locked(job, NULL, &error_abort);
         assert(job->status == JOB_STATUS_PENDING);
 
-        job_finalize(job, &error_abort);
+        job_finalize_locked(job, &error_abort);
         assert(job->status == JOB_STATUS_CONCLUDED);
 
-        job_dismiss(&job, &error_abort);
+        job_dismiss_locked(&job, &error_abort);
     }
 
     destroy_blk(blk);
-- 
2.31.1


