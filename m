Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F564854CA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:42:47 +0100 (CET)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57V0-0006jJ-Qz
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56xb-0007Rq-A3
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:08:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56xS-0006bU-73
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfaj9EvKGUqJ1wWUDEqbOPPkd907n9+NL2fxc+laJeM=;
 b=Xkd9eS3R9WNKbG2s+ybWcylqY5M3zzh32MFrwfkTPuVifxF/egJIJ4pD1878ThA66dYHiZ
 nKJPltqzw0ahUQMkWwWQiq7IM1Ey1ZGwuJM/iADF5BAIwSYq3UZGoUOgQYaNiYOLcjhR0s
 q8DKUaodRA3iMx7WaklwitB/9hHlJDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-6iwUeA_PPpykba0v4tT9rg-1; Wed, 05 Jan 2022 09:07:56 -0500
X-MC-Unique: 6iwUeA_PPpykba0v4tT9rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45EEE874991;
 Wed,  5 Jan 2022 14:02:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3DF95B7CD;
 Wed,  5 Jan 2022 14:02:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 03/16] job.h: define locked functions
Date: Wed,  5 Jan 2022 09:01:55 -0500
Message-Id: <20220105140208.365608-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

These functions assume that the job lock is held by the
caller, to avoid TOC/TOU conditions. Therefore, their
name must end with _locked.

Introduce also additional helpers that define _locked
functions (useful when the job_mutex is globally applied).

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          |   2 +-
 block/replication.c              |   4 +-
 blockdev.c                       |  32 +++----
 blockjob.c                       |  16 ++--
 include/qemu/job.h               | 153 +++++++++++++++++++++---------
 job-qmp.c                        |  26 +++---
 job.c                            | 155 +++++++++++++++++--------------
 qemu-img.c                       |  10 +-
 tests/unit/test-bdrv-drain.c     |   2 +-
 tests/unit/test-block-iothread.c |   4 +-
 tests/unit/test-blockjob-txn.c   |  14 +--
 tests/unit/test-blockjob.c       |  30 +++---
 12 files changed, 263 insertions(+), 185 deletions(-)

diff --git a/block.c b/block.c
index ca70bcc807..8fcd525fa0 100644
--- a/block.c
+++ b/block.c
@@ -4976,7 +4976,7 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
-    assert(job_next(NULL) == NULL);
+    assert(job_next_locked(NULL) == NULL);
     assert(qemu_in_main_thread());
 
     /* Drop references from requests still in flight, such as canceled block
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..5215c328c1 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,7 @@ static void replication_close(BlockDriverState *bs)
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
-        job_cancel_sync(commit_job, false);
+        job_cancel_sync_locked(commit_job, false);
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
@@ -726,7 +726,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
-            job_cancel_sync(&s->backup_job->job, true);
+            job_cancel_sync_locked(&s->backup_job->job, true);
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index a3b9aeb3c2..11fd651bde 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -160,7 +160,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
 
-            job_cancel(&job->job, false);
+            job_cancel_locked(&job->job, false);
 
             aio_context_release(aio_context);
         }
@@ -1832,7 +1832,7 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job, true);
+        job_cancel_sync_locked(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
@@ -1933,7 +1933,7 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job, true);
+        job_cancel_sync_locked(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
@@ -2382,7 +2382,7 @@ exit:
     if (!has_props) {
         qapi_free_TransactionProperties(props);
     }
-    job_txn_unref(block_job_txn);
+    job_txn_unref_locked(block_job_txn);
 }
 
 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
@@ -3347,14 +3347,14 @@ void qmp_block_job_cancel(const char *device,
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
@@ -3369,7 +3369,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_pause(job);
-    job_user_pause(&job->job, errp);
+    job_user_pause_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3383,7 +3383,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_resume(job);
-    job_user_resume(&job->job, errp);
+    job_user_resume_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3397,7 +3397,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_complete(job);
-    job_complete(&job->job, errp);
+    job_complete_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
@@ -3411,16 +3411,16 @@ void qmp_block_job_finalize(const char *id, Error **errp)
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
     aio_context = blk_get_aio_context(job->blk);
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
     aio_context_release(aio_context);
 }
 
@@ -3436,7 +3436,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
diff --git a/blockjob.c b/blockjob.c
index 74476af473..5b5d7f26b3 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -65,7 +65,7 @@ BlockJob *block_job_next(BlockJob *bjob)
     assert(qemu_in_main_thread());
 
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
     assert(qemu_in_main_thread());
 
     if (job && is_block_job(job)) {
@@ -103,7 +103,7 @@ static char *child_job_get_parent_desc(BdrvChild *c)
 static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
-    job_pause(&job->job);
+    job_pause_locked(&job->job);
 }
 
 static bool child_job_drained_poll(BdrvChild *c)
@@ -115,7 +115,7 @@ static bool child_job_drained_poll(BdrvChild *c)
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job->busy || job_is_completed(job)) {
+    if (!job->busy || job_is_completed_locked(job)) {
         return false;
     }
 
@@ -131,7 +131,7 @@ static bool child_job_drained_poll(BdrvChild *c)
 static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
-    job_resume(&job->job);
+    job_resume_locked(&job->job);
 }
 
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
@@ -279,7 +279,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 
     assert(qemu_in_main_thread());
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+    if (job_apply_verb_locked(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
     if (speed < 0) {
@@ -301,7 +301,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }
 
     /* kick only if a timer is pending */
-    job_enter_cond(&job->job, job_timer_pending);
+    job_enter_cond_locked(&job->job, job_timer_pending);
 
     return true;
 }
@@ -553,7 +553,7 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
         if (!job->job.user_paused) {
-            job_pause(&job->job);
+            job_pause_locked(&job->job);
             /* make the pause user visible, which will be resumed from QMP. */
             job->job.user_paused = true;
         }
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 0d348ff186..0d1c4d1bb1 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -350,7 +350,7 @@ void job_unlock(void);
 
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
- * transaction using job_txn_add_job().
+ * transaction using job_txn_add_job_locked().
  *
  * The transaction is automatically freed when the last job completes or is
  * cancelled.
@@ -362,22 +362,25 @@ void job_unlock(void);
 JobTxn *job_txn_new(void);
 
 /**
- * Release a reference that was previously acquired with job_txn_add_job or
- * job_txn_new. If it's the last reference to the object, it will be freed.
+ * Release a reference that was previously acquired with
+ * job_txn_add_job_locked or job_txn_new.
+ * If it's the last reference to the object, it will be freed.
  */
-void job_txn_unref(JobTxn *txn);
+void job_txn_unref_locked(JobTxn *txn);
 
 /**
  * @txn: The transaction (may be NULL)
  * @job: Job to add to the transaction
  *
  * Add @job to the transaction.  The @job must not already be in a transaction.
- * The caller must call either job_txn_unref() or job_completed() to release
- * the reference that is automatically grabbed here.
+ * The caller must call either job_txn_unref_locked() or job_completed()
+ * to release the reference that is automatically grabbed here.
  *
  * If @txn is NULL, the function does nothing.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_txn_add_job(JobTxn *txn, Job *job);
+void job_txn_add_job_locked(JobTxn *txn, Job *job);
 
 /**
  * Create a new long-running job and return it.
@@ -396,16 +399,20 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
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
@@ -450,8 +457,10 @@ void job_event_completed(Job *job);
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
  * critical section.
+ *
+ * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
-void job_enter_cond(Job *job, bool(*fn)(Job *job));
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
 
 /**
  * @job: A job that has not yet been started.
@@ -471,8 +480,9 @@ void job_enter(Job *job);
 /**
  * @job: The job that is ready to pause.
  *
- * Pause now if job_pause() has been called. Jobs that perform lots of I/O
- * must call this between requests so that the job can be paused.
+ * Pause now if job_pause_locked() has been called.
+ * Jobs that perform lots of I/O must call this between
+ * requests so that the job can be paused.
  */
 void coroutine_fn job_pause_point(Job *job);
 
@@ -511,79 +521,117 @@ bool job_is_cancelled(Job *job);
  */
 bool job_cancel_requested(Job *job);
 
-/** Returns whether the job is in a completed state. */
-bool job_is_completed(Job *job);
+/**
+ * Returns whether the job is in a completed state.
+ * Called between job_lock and job_unlock.
+ */
+bool job_is_completed_locked(Job *job);
 
-/** Returns whether the job is ready to be completed. */
+/**
+ * Returns whether the job is ready to be completed.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_ready(Job *job);
 
+/** Same as job_is_ready(), but assumes job_lock is held. */
+bool job_is_ready_locked(Job *job);
+
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
 
+/** Same as job_early_fail(), but assumes job_lock is held. */
+void job_early_fail_locked(Job *job);
+
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
+ * Cancels the specified job like job_cancel_locked(),
+ * but may refuse to do so if the operation isn't meaningful
+ * in the current state of the job.
+ *
+ * Called between job_lock and job_unlock.
  */
-void job_user_cancel(Job *job, bool force, Error **errp);
+void job_user_cancel_locked(Job *job, bool force, Error **errp);
 
 /**
  * Synchronously cancel the @job.  The completion callback is called
@@ -596,14 +644,20 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  *
  * Callers must hold the AioContext lock of job->aio_context.
  */
-int job_cancel_sync(Job *job, bool force);
+int job_cancel_sync_locked(Job *job, bool force);
 
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
  * @job: The job to be completed.
- * @errp: Error object which may be set by job_complete(); this is not
+ * @errp: Error object which may be set by job_complete_locked(); this is not
  *        necessarily set on every error, the job return value has to be
  *        checked as well.
  *
@@ -614,8 +668,10 @@ void job_cancel_sync_all(void);
  * Returns the return value from the job.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
  */
-int job_complete_sync(Job *job, Error **errp);
+int job_complete_sync_locked(Job *job, Error **errp);
 
 /**
  * For a @job that has finished its work and is pending awaiting explicit
@@ -624,14 +680,18 @@ int job_complete_sync(Job *job, Error **errp);
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
@@ -641,7 +701,10 @@ void job_dismiss(Job **job, Error **errp);
  * cancelled before completing, and -errno in other error cases.
  *
  * Callers must hold the AioContext lock of job->aio_context.
+ *
+ * Called between job_lock and job_unlock.
  */
-int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
+int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
+                           Error **errp);
 
 #endif
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..de4120a1d4 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -36,7 +36,7 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
 
     *aio_context = NULL;
 
-    job = job_get(id);
+    job = job_get_locked(id);
     if (!job) {
         error_setg(errp, "Job not found");
         return NULL;
@@ -58,7 +58,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     }
 
     trace_qmp_job_cancel(job);
-    job_user_cancel(job, true, errp);
+    job_user_cancel_locked(job, true, errp);
     aio_context_release(aio_context);
 }
 
@@ -72,7 +72,7 @@ void qmp_job_pause(const char *id, Error **errp)
     }
 
     trace_qmp_job_pause(job);
-    job_user_pause(job, errp);
+    job_user_pause_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -86,7 +86,7 @@ void qmp_job_resume(const char *id, Error **errp)
     }
 
     trace_qmp_job_resume(job);
-    job_user_resume(job, errp);
+    job_user_resume_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -100,7 +100,7 @@ void qmp_job_complete(const char *id, Error **errp)
     }
 
     trace_qmp_job_complete(job);
-    job_complete(job, errp);
+    job_complete_locked(job, errp);
     aio_context_release(aio_context);
 }
 
@@ -114,16 +114,16 @@ void qmp_job_finalize(const char *id, Error **errp)
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
 
@@ -137,7 +137,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
     }
 
     trace_qmp_job_dismiss(job);
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
@@ -171,7 +171,7 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
-    for (job = job_next(NULL); job; job = job_next(job)) {
+    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
         AioContext *aio_context;
 
diff --git a/job.c b/job.c
index ccf737a179..bb6ca2940c 100644
--- a/job.c
+++ b/job.c
@@ -118,14 +118,14 @@ static void job_txn_ref(JobTxn *txn)
     txn->refcnt++;
 }
 
-void job_txn_unref(JobTxn *txn)
+void job_txn_unref_locked(JobTxn *txn)
 {
     if (txn && --txn->refcnt == 0) {
         g_free(txn);
     }
 }
 
-void job_txn_add_job(JobTxn *txn, Job *job)
+void job_txn_add_job_locked(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
@@ -142,7 +142,7 @@ static void job_txn_del_job(Job *job)
 {
     if (job->txn) {
         QLIST_REMOVE(job, txn_list);
-        job_txn_unref(job->txn);
+        job_txn_unref_locked(job->txn);
         job->txn = NULL;
     }
 }
@@ -160,7 +160,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * we need to release it here to avoid holding the lock twice - which would
      * break AIO_WAIT_WHILE from within fn.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
@@ -178,7 +178,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * can't use a local variable to cache it.
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
     return rc;
 }
 
@@ -202,7 +202,7 @@ static void job_state_transition(Job *job, JobStatus s1)
     }
 }
 
-int job_apply_verb(Job *job, JobVerb verb, Error **errp)
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp)
 {
     JobStatus s0 = job->status;
     assert(verb >= 0 && verb < JOB_VERB__MAX);
@@ -238,7 +238,7 @@ bool job_cancel_requested(Job *job)
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -260,7 +260,13 @@ bool job_is_ready(Job *job)
     return false;
 }
 
-bool job_is_completed(Job *job)
+bool job_is_ready(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_ready_locked(job);
+}
+
+bool job_is_completed_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -292,7 +298,7 @@ static bool job_should_pause(Job *job)
     return job->pause_count > 0;
 }
 
-Job *job_next(Job *job)
+Job *job_next_locked(Job *job)
 {
     if (!job) {
         return QLIST_FIRST(&jobs);
@@ -300,7 +306,7 @@ Job *job_next(Job *job)
     return QLIST_NEXT(job, job_list);
 }
 
-Job *job_get(const char *id)
+Job *job_get_locked(const char *id)
 {
     Job *job;
 
@@ -335,7 +341,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
             error_setg(errp, "Invalid job ID '%s'", job_id);
             return NULL;
         }
-        if (job_get(job_id)) {
+        if (job_get_locked(job_id)) {
             error_setg(errp, "Job ID '%s' already in use", job_id);
             return NULL;
         }
@@ -375,21 +381,21 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
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
     assert(qemu_in_main_thread());
 
@@ -451,7 +457,7 @@ static void job_event_idle(Job *job)
     notifier_list_notify(&job->on_idle, job);
 }
 
-void job_enter_cond(Job *job, bool(*fn)(Job *job))
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
 {
     if (!job_started(job)) {
         return;
@@ -480,7 +486,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
 
 void job_enter(Job *job)
 {
-    job_enter_cond(job, NULL);
+    job_enter_cond_locked(job, NULL);
 }
 
 /* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
@@ -500,7 +506,7 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     real_job_unlock();
     qemu_coroutine_yield();
 
-    /* Set by job_enter_cond() before re-entering the coroutine.  */
+    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
@@ -573,7 +579,7 @@ static bool job_timer_not_pending(Job *job)
     return !timer_pending(&job->sleep_timer);
 }
 
-void job_pause(Job *job)
+void job_pause_locked(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
@@ -581,7 +587,7 @@ void job_pause(Job *job)
     }
 }
 
-void job_resume(Job *job)
+void job_resume_locked(Job *job)
 {
     assert(job->pause_count > 0);
     job->pause_count--;
@@ -590,12 +596,12 @@ void job_resume(Job *job)
     }
 
     /* kick only if no timer is pending */
-    job_enter_cond(job, job_timer_not_pending);
+    job_enter_cond_locked(job, job_timer_not_pending);
 }
 
-void job_user_pause(Job *job, Error **errp)
+void job_user_pause_locked(Job *job, Error **errp)
 {
-    if (job_apply_verb(job, JOB_VERB_PAUSE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_PAUSE, errp)) {
         return;
     }
     if (job->user_paused) {
@@ -603,15 +609,15 @@ void job_user_pause(Job *job, Error **errp)
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
     assert(qemu_in_main_thread());
@@ -619,14 +625,14 @@ void job_user_resume(Job *job, Error **errp)
         error_setg(errp, "Can't resume a job that was not paused");
         return;
     }
-    if (job_apply_verb(job, JOB_VERB_RESUME, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_RESUME, errp)) {
         return;
     }
     if (job->driver->user_resume) {
         job->driver->user_resume(job);
     }
     job->user_paused = false;
-    job_resume(job);
+    job_resume_locked(job);
 }
 
 static void job_do_dismiss(Job *job)
@@ -639,15 +645,15 @@ static void job_do_dismiss(Job *job)
     job_txn_del_job(job);
 
     job_state_transition(job, JOB_STATUS_NULL);
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
 
@@ -655,12 +661,18 @@ void job_dismiss(Job **jobptr, Error **errp)
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
@@ -710,7 +722,7 @@ static void job_clean(Job *job)
 
 static int job_finalize_single(Job *job)
 {
-    assert(job_is_completed(job));
+    assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
@@ -795,7 +807,7 @@ static void job_completed_txn_abort(Job *job)
      * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
@@ -822,22 +834,22 @@ static void job_completed_txn_abort(Job *job)
          */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             assert(job_cancel_requested(other_job));
-            job_finish_sync(other_job, NULL, NULL);
+            job_finish_sync_locked(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
         aio_context_release(ctx);
     }
 
     /*
-     * Use job_ref()/job_unref() so we can read the AioContext here
-     * even if the job went away during job_finalize_single().
+     * Use job_ref_locked()/job_unref_locked() so we can read the AioContext
+     * here even if the job went away during job_finalize_single().
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
 
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 }
 
 static int job_prepare(Job *job)
@@ -869,10 +881,10 @@ static void job_do_finalize(Job *job)
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
     job_do_finalize(job);
@@ -905,7 +917,7 @@ static void job_completed_txn_success(Job *job)
      * txn.
      */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             return;
         }
         assert(other_job->ret == 0);
@@ -921,7 +933,7 @@ static void job_completed_txn_success(Job *job)
 
 static void job_completed(Job *job)
 {
-    assert(job && job->txn && !job_is_completed(job));
+    assert(job && job->txn && !job_is_completed_locked(job));
 
     job_update_rc(job);
     trace_job_completed(job, job->ret);
@@ -938,7 +950,7 @@ static void job_exit(void *opaque)
     Job *job = (Job *)opaque;
     AioContext *ctx;
 
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
@@ -957,7 +969,7 @@ static void job_exit(void *opaque)
      * the job underneath us.
      */
     ctx = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(ctx);
 }
 
@@ -1003,7 +1015,7 @@ void job_start(Job *job)
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_cancel(Job *job, bool force)
+void job_cancel_locked(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
         job_do_dismiss(job);
@@ -1031,20 +1043,22 @@ void job_cancel(Job *job, bool force)
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
 
-/* A wrapper around job_cancel() taking an Error ** parameter so it may be
- * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there. */
+/*
+ * A wrapper around job_cancel_locked() taking an Error ** parameter so
+ * it may be used with job_finish_sync_locked() without the
+ * need for (rather nasty) function pointer casts there.
+ */
 static void job_cancel_err(Job *job, Error **errp)
 {
-    job_cancel(job, false);
+    job_cancel_locked(job, false);
 }
 
 /**
@@ -1052,15 +1066,15 @@ static void job_cancel_err(Job *job, Error **errp)
  */
 static void job_force_cancel_err(Job *job, Error **errp)
 {
-    job_cancel(job, true);
+    job_cancel_locked(job, true);
 }
 
-int job_cancel_sync(Job *job, bool force)
+int job_cancel_sync_locked(Job *job, bool force)
 {
     if (force) {
-        return job_finish_sync(job, &job_force_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_force_cancel_err, NULL);
     } else {
-        return job_finish_sync(job, &job_cancel_err, NULL);
+        return job_finish_sync_locked(job, &job_cancel_err, NULL);
     }
 }
 
@@ -1069,25 +1083,25 @@ void job_cancel_sync_all(void)
     Job *job;
     AioContext *aio_context;
 
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
     assert(qemu_in_main_thread());
-    if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
     if (job_cancel_requested(job) || !job->driver->complete) {
@@ -1099,26 +1113,27 @@ void job_complete(Job *job, Error **errp)
     job->driver->complete(job, errp);
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
 
     AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed(job)));
+                   (job_enter(job), !job_is_completed_locked(job)));
 
     ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
-    job_unref(job);
+    job_unref_locked(job);
     return ret;
 }
diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..09f3b11eab 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -906,7 +906,7 @@ static void run_block_job(BlockJob *job, Error **errp)
     int ret = 0;
 
     aio_context_acquire(aio_context);
-    job_ref(&job->job);
+    job_ref_locked(&job->job);
     do {
         float progress = 0.0f;
         aio_poll(aio_context, true);
@@ -917,14 +917,14 @@ static void run_block_job(BlockJob *job, Error **errp)
             progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
+    } while (!job_is_ready(&job->job) && !job_is_completed_locked(&job->job));
 
-    if (!job_is_completed(&job->job)) {
-        ret = job_complete_sync(&job->job, errp);
+    if (!job_is_completed_locked(&job->job)) {
+        ret = job_complete_sync_locked(&job->job, errp);
     } else {
         ret = job->job.ret;
     }
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
     aio_context_release(aio_context);
 
     /* publish completion progress only when success */
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2d3c17e566..3f344a0d0d 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -995,7 +995,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
 
     aio_context_acquire(ctx);
-    ret = job_complete_sync(&job->job, &error_abort);
+    ret = job_complete_sync_locked(&job->job, &error_abort);
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
     if (use_iothread) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index aea660aeed..7e1b521d61 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -456,7 +456,7 @@ static void test_attach_blockjob(void)
     }
 
     aio_context_acquire(ctx);
-    job_complete_sync(&tjob->common.job, &error_abort);
+    job_complete_sync_locked(&tjob->common.job, &error_abort);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
 
@@ -630,7 +630,7 @@ static void test_propagate_mirror(void)
                  BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
-    job = job_get("job0");
+    job = job_get_locked("job0");
     filter = bdrv_find_node("filter_node");
 
     /* Change the AioContext of src */
diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 8bd13b9949..5396fcef10 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -125,7 +125,7 @@ static void test_single_job(int expected)
     job_start(&job->job);
 
     if (expected == -ECANCELED) {
-        job_cancel(&job->job, false);
+        job_cancel_locked(&job->job, false);
     }
 
     while (result == -EINPROGRESS) {
@@ -133,7 +133,7 @@ static void test_single_job(int expected)
     }
     g_assert_cmpint(result, ==, expected);
 
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 }
 
 static void test_single_job_success(void)
@@ -168,13 +168,13 @@ static void test_pair_jobs(int expected1, int expected2)
     /* Release our reference now to trigger as many nice
      * use-after-free bugs as possible.
      */
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 
     if (expected1 == -ECANCELED) {
-        job_cancel(&job1->job, false);
+        job_cancel_locked(&job1->job, false);
     }
     if (expected2 == -ECANCELED) {
-        job_cancel(&job2->job, false);
+        job_cancel_locked(&job2->job, false);
     }
 
     while (result1 == -EINPROGRESS || result2 == -EINPROGRESS) {
@@ -227,7 +227,7 @@ static void test_pair_jobs_fail_cancel_race(void)
     job_start(&job1->job);
     job_start(&job2->job);
 
-    job_cancel(&job1->job, false);
+    job_cancel_locked(&job1->job, false);
 
     /* Now make job2 finish before the main loop kicks jobs.  This simulates
      * the race between a pending kick and another job completing.
@@ -242,7 +242,7 @@ static void test_pair_jobs_fail_cancel_race(void)
     g_assert_cmpint(result1, ==, -ECANCELED);
     g_assert_cmpint(result2, ==, -ECANCELED);
 
-    job_txn_unref(txn);
+    job_txn_unref_locked(txn);
 }
 
 int main(int argc, char **argv)
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index 4c9e1bf1e5..2beed3623e 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -211,7 +211,7 @@ static CancelJob *create_common(Job **pjob)
     bjob = mk_job(blk, "Steve", &test_cancel_driver, true,
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
-    job_ref(job);
+    job_ref_locked(job);
     assert(job->status == JOB_STATUS_CREATED);
     s = container_of(bjob, CancelJob, common);
     s->blk = blk;
@@ -230,13 +230,13 @@ static void cancel_common(CancelJob *s)
     ctx = job->job.aio_context;
     aio_context_acquire(ctx);
 
-    job_cancel_sync(&job->job, true);
+    job_cancel_sync_locked(&job->job, true);
     if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
         Job *dummy = &job->job;
-        job_dismiss(&dummy, &error_abort);
+        job_dismiss_locked(&dummy, &error_abort);
     }
     assert(job->job.status == JOB_STATUS_NULL);
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
     destroy_blk(blk);
 
     aio_context_release(ctx);
@@ -274,7 +274,7 @@ static void test_cancel_paused(void)
     job_start(job);
     assert(job->status == JOB_STATUS_RUNNING);
 
-    job_user_pause(job, &error_abort);
+    job_user_pause_locked(job, &error_abort);
     job_enter(job);
     assert(job->status == JOB_STATUS_PAUSED);
 
@@ -312,7 +312,7 @@ static void test_cancel_standby(void)
     job_enter(job);
     assert(job->status == JOB_STATUS_READY);
 
-    job_user_pause(job, &error_abort);
+    job_user_pause_locked(job, &error_abort);
     job_enter(job);
     assert(job->status == JOB_STATUS_STANDBY);
 
@@ -333,7 +333,7 @@ static void test_cancel_pending(void)
     job_enter(job);
     assert(job->status == JOB_STATUS_READY);
 
-    job_complete(job, &error_abort);
+    job_complete_locked(job, &error_abort);
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
@@ -359,7 +359,7 @@ static void test_cancel_concluded(void)
     job_enter(job);
     assert(job->status == JOB_STATUS_READY);
 
-    job_complete(job, &error_abort);
+    job_complete_locked(job, &error_abort);
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
@@ -369,7 +369,7 @@ static void test_cancel_concluded(void)
     assert(job->status == JOB_STATUS_PENDING);
 
     aio_context_acquire(job->aio_context);
-    job_finalize(job, &error_abort);
+    job_finalize_locked(job, &error_abort);
     aio_context_release(job->aio_context);
     assert(job->status == JOB_STATUS_CONCLUDED);
 
@@ -417,7 +417,7 @@ static const BlockJobDriver test_yielding_driver = {
 };
 
 /*
- * Test that job_complete() works even on jobs that are in a paused
+ * Test that job_complete_locked() works even on jobs that are in a paused
  * state (i.e., STANDBY).
  *
  * To do this, run YieldingJob in an IO thread, get it into the READY
@@ -425,7 +425,7 @@ static const BlockJobDriver test_yielding_driver = {
  * acquire the context so the job will not be entered and will thus
  * remain on STANDBY.
  *
- * job_complete() should still work without error.
+ * job_complete_locked() should still work without error.
  *
  * Note that on the QMP interface, it is impossible to lock an IO
  * thread before a drained section ends.  In practice, the
@@ -479,16 +479,16 @@ static void test_complete_in_standby(void)
     assert(job->status == JOB_STATUS_STANDBY);
 
     /* Even though the job is on standby, this should work */
-    job_complete(job, &error_abort);
+    job_complete_locked(job, &error_abort);
 
     /* The test is done now, clean up. */
-    job_finish_sync(job, NULL, &error_abort);
+    job_finish_sync_locked(job, NULL, &error_abort);
     assert(job->status == JOB_STATUS_PENDING);
 
-    job_finalize(job, &error_abort);
+    job_finalize_locked(job, &error_abort);
     assert(job->status == JOB_STATUS_CONCLUDED);
 
-    job_dismiss(&job, &error_abort);
+    job_dismiss_locked(&job, &error_abort);
 
     destroy_blk(blk);
     aio_context_release(ctx);
-- 
2.31.1


