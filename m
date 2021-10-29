Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC94400A5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:52:12 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV6x-0007w5-HT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvL-00070O-Mf
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvB-0003iS-Uk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5x1ge5Bl3AXmiSxRACGPuPQrdAgUEDdBvy7BWEZ0Enc=;
 b=jUG5uIfjc0McfSlvhHFfDEVphUH2S1Y56US8DWnsVH2oUcYe8HYtI/1IiK8LGw9TyuBbUn
 gxXVpDolL92HCNcWR6P0bbPNmFmDEq34TnhELlIwBdNmyNKOL8r5mvd9GrGp9Qd5H1Jll7
 UAY+jL9we7TBPfZ6xSbiVG7HMOZC+fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-_JGQNN8RMECBg0fqA1hO2A-1; Fri, 29 Oct 2021 12:39:52 -0400
X-MC-Unique: _JGQNN8RMECBg0fqA1hO2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BFC806688;
 Fri, 29 Oct 2021 16:39:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5758169117;
 Fri, 29 Oct 2021 16:39:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 15/15] jobs: remove all unnecessary AioContext locks
Date: Fri, 29 Oct 2021 12:39:14 -0400
Message-Id: <20211029163914.4044794-16-eesposit@redhat.com>
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

Now that we removed the aiocontext in find_* functions,
we need to remove it also in all other functions of the job API
that assumed the lock was held.

Therefore:
- when possible, remove completely the aiocontext lock/unlock pair
- if it is used by some other funcitons too, just leave the job API
  outside the aiocontext lock by adding unlock/lock pairs.

There is only one JobDriver callback, ->free() that assumes that
the aiocontext lock is held (because it calls bdrv_unref), so for
now keep that under aiocontext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-monitor.h       |  6 ----
 block/replication.c              |  2 ++
 blockdev.c                       | 19 -----------
 job.c                            | 57 ++++----------------------------
 tests/unit/test-bdrv-drain.c     |  4 +--
 tests/unit/test-block-iothread.c |  2 +-
 tests/unit/test-blockjob.c       | 13 ++------
 7 files changed, 14 insertions(+), 89 deletions(-)

diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
index f473bd298f..4ba7e503d1 100644
--- a/include/qemu/job-monitor.h
+++ b/include/qemu/job-monitor.h
@@ -207,8 +207,6 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  *
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
- *
- * Callers must hold the AioContext lock of job->aio_context.
  */
 int job_cancel_sync(Job *job, bool force);
 
@@ -233,8 +231,6 @@ void job_cancel_sync_all(void);
  *
  * Returns the return value from the job.
  *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock.
  */
 int job_complete_sync(Job *job, Error **errp);
@@ -266,8 +262,6 @@ void job_dismiss(Job **job, Error **errp);
  * Returns 0 if the job is successfully completed, -ECANCELED if the job was
  * cancelled before completing, and -errno in other error cases.
  *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock, but it releases the lock temporarly.
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
diff --git a/block/replication.c b/block/replication.c
index 0f487cc215..6a60c1af1a 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -728,9 +728,11 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
+            aio_context_release(aio_context);
             job_lock();
             job_cancel_sync(&s->backup_job->job, true);
             job_unlock();
+            aio_context_acquire(aio_context);
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index 592ed4a0fc..dfc73ef1bf 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -154,12 +154,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
-            AioContext *aio_context = job->job.aio_context;
-            aio_context_acquire(aio_context);
-
             job_cancel(&job->job, false);
-
-            aio_context_release(aio_context);
         }
     }
 
@@ -1843,16 +1838,9 @@ static void drive_backup_abort(BlkActionState *common)
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_lock();
         job_cancel_sync(&state->job->job, true);
         job_unlock();
-
-        aio_context_release(aio_context);
     }
 }
 
@@ -1946,16 +1934,9 @@ static void blockdev_backup_abort(BlkActionState *common)
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_lock();
         job_cancel_sync(&state->job->job, true);
         job_unlock();
-
-        aio_context_release(aio_context);
     }
 }
 
diff --git a/job.c b/job.c
index 6b3e860fa7..124b05f769 100644
--- a/job.c
+++ b/job.c
@@ -168,7 +168,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * break AIO_WAIT_WHILE from within fn.
      */
     job_ref(job);
-    aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
         rc = fn(other_job);
@@ -177,11 +176,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
         }
     }
 
-    /*
-     * Note that job->aio_context might have been changed by calling fn, so we
-     * can't use a local variable to cache it.
-     */
-    aio_context_acquire(job->aio_context);
     job_unref(job);
     return rc;
 }
@@ -510,7 +504,10 @@ void job_unref(Job *job)
 
         if (job->driver->free) {
             job_unlock();
+            /* FIXME: aiocontext lock is required because cb calls blk_unref */
+            aio_context_acquire(job->aio_context);
             job->driver->free(job);
+            aio_context_release(job->aio_context);
             job_lock();
         }
 
@@ -978,7 +975,6 @@ static void job_cancel_async(Job *job, bool force)
 /* Called with job_mutex held. */
 static void job_completed_txn_abort(Job *job)
 {
-    AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
 
@@ -991,54 +987,28 @@ static void job_completed_txn_abort(Job *job)
     txn->aborting = true;
     job_txn_ref(txn);
 
-    /*
-     * We can only hold the single job's AioContext lock while calling
-     * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
-     * Note that the job's AioContext may change when it is finalized.
-     */
-    job_ref(job);
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
              * Therefore, pass force=true to terminate all other jobs as quickly
              * as possible.
              */
             job_cancel_async(other_job, true);
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
         if (!job_is_completed(other_job)) {
             assert(job_cancel_requested_locked(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
-        aio_context_release(ctx);
     }
 
-    /*
-     * Use job_ref()/job_unref() so we can read the AioContext here
-     * even if the job went away during job_finalize_single().
-     */
-    aio_context_acquire(job->aio_context);
-    job_unref(job);
-
     job_txn_unref(txn);
 }
 
@@ -1159,11 +1129,8 @@ static void job_completed(Job *job)
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
-    AioContext *ctx;
 
     job_lock();
-    job_ref(job);
-    aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
      * callbacks. However, completion callbacks tend to involve operations that
@@ -1174,16 +1141,7 @@ static void job_exit(void *opaque)
 
     job_completed(job);
 
-    /*
-     * Note that calling job_completed can move the job to a different
-     * aio_context, so we cannot cache from above. job_txn_apply takes care of
-     * acquiring the new lock, and we ref/unref to avoid job_completed freeing
-     * the job underneath us.
-     */
-    ctx = job->aio_context;
-    job_unref(job);
     job_unlock();
-    aio_context_release(ctx);
 }
 
 /**
@@ -1297,14 +1255,10 @@ int job_cancel_sync(Job *job, bool force)
 void job_cancel_sync_all(void)
 {
     Job *job;
-    AioContext *aio_context;
 
     job_lock();
     while ((job = job_next(NULL))) {
-        aio_context = job->aio_context;
-        aio_context_acquire(aio_context);
         job_cancel_sync(job, true);
-        aio_context_release(aio_context);
     }
     job_unlock();
 }
@@ -1350,8 +1304,9 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
     }
 
     job_unlock();
-    AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed_unlocked(job)));
+    AIO_WAIT_WHILE_UNLOCKED(job->aio_context,
+                            (job_enter(job),
+                            !job_is_completed_unlocked(job)));
     job_lock();
 
     ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 535c39b5a8..83485a33aa 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -928,9 +928,9 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         tjob->prepare_ret = -EIO;
         break;
     }
+    aio_context_release(ctx);
 
     job_start(&job->job);
-    aio_context_release(ctx);
 
     if (use_iothread) {
         /* job_co_entry() is run in the I/O thread, wait for the actual job
@@ -994,12 +994,12 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     g_assert_false(job_get_paused(&job->job));
     g_assert_true(job_get_busy(&job->job)); /* We're in qemu_co_sleep_ns() */
 
-    aio_context_acquire(ctx);
     job_lock();
     ret = job_complete_sync(&job->job, &error_abort);
     job_unlock();
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
+    aio_context_acquire(ctx);
     if (use_iothread) {
         blk_set_aio_context(blk_src, qemu_get_aio_context(), &error_abort);
         assert(blk_get_aio_context(blk_target) == qemu_get_aio_context());
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index f39cb8b7ef..cf197347b7 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -455,10 +455,10 @@ static void test_attach_blockjob(void)
         aio_poll(qemu_get_aio_context(), false);
     }
 
-    aio_context_acquire(ctx);
     job_lock();
     job_complete_sync(&tjob->common.job, &error_abort);
     job_unlock();
+    aio_context_acquire(ctx);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
 
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index b94e1510c9..11cff70a6b 100644
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
 
     job_lock();
     job_cancel_sync(&job->job, true);
@@ -244,7 +240,6 @@ static void cancel_common(CancelJob *s)
     job_unlock();
     destroy_blk(blk);
 
-    aio_context_release(ctx);
 }
 
 static void test_cancel_created(void)
@@ -381,11 +376,9 @@ static void test_cancel_concluded(void)
     aio_poll(qemu_get_aio_context(), true);
     assert(job_get_status(job) == JOB_STATUS_PENDING);
 
-    aio_context_acquire(job->aio_context);
     job_lock();
     job_finalize(job, &error_abort);
     job_unlock();
-    aio_context_release(job->aio_context);
     assert(job_get_status(job) == JOB_STATUS_CONCLUDED);
 
     cancel_common(s);
@@ -478,9 +471,7 @@ static void test_complete_in_standby(void)
 
     /* Wait for the job to become READY */
     job_start(job);
-    aio_context_acquire(ctx);
-    AIO_WAIT_WHILE(ctx, job_get_status(job) != JOB_STATUS_READY);
-    aio_context_release(ctx);
+    AIO_WAIT_WHILE_UNLOCKED(ctx, job_get_status(job) != JOB_STATUS_READY);
 
     /* Begin the drained section, pausing the job */
     bdrv_drain_all_begin();
@@ -498,6 +489,7 @@ static void test_complete_in_standby(void)
     job_complete(job, &error_abort);
 
     /* The test is done now, clean up. */
+    aio_context_release(ctx);
     job_finish_sync(job, NULL, &error_abort);
     assert(job->status == JOB_STATUS_PENDING);
 
@@ -507,6 +499,7 @@ static void test_complete_in_standby(void)
     job_dismiss(&job, &error_abort);
     job_unlock();
 
+    aio_context_acquire(ctx);
     destroy_blk(blk);
     aio_context_release(ctx);
     iothread_join(iothread);
-- 
2.27.0


