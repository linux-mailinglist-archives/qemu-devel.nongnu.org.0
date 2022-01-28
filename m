Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5149F90C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:18:33 +0100 (CET)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQD2-0005xD-Jk
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmf-0004oN-Ce
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmQ-0003Qu-22
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxWbrBscuEborYKlajU59WgGXWtOb1DLaAUD7JEp8TM=;
 b=WVmKRnPG4/f9CErwfrpXZhfaWxttxEDYQLbs5c0e8eojBunGWxkwn2hz6l6t/niBPG2RjV
 kN+emfKI5+34oFOwhRCYGN8Bif9BJzI5pKtfb76KibO0ypWeLojWeH93jqGW01sL33Mm1S
 Y+3qMcdw+3b8hp+n0eB7fEpWrAPe1H0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-fksTIeC6OB-rF5LtI5eK8g-1; Fri, 28 Jan 2022 06:50:47 -0500
X-MC-Unique: fksTIeC6OB-rF5LtI5eK8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BEA11006AA7;
 Fri, 28 Jan 2022 11:50:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35BDE1FD88;
 Fri, 28 Jan 2022 11:50:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 10/19] job.h: define locked functions
Date: Fri, 28 Jan 2022 06:50:22 -0500
Message-Id: <20220128115031.4061565-11-eesposit@redhat.com>
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

These functions assume that the job lock is held by the
caller, to avoid TOC/TOU conditions. Therefore, their
name must end with _locked.

Introduce also additional helpers that define _locked
functions (useful when the job_mutex is globally applied).

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          |   5 +-
 block/backup.c                   |   4 +-
 block/replication.c              |   4 +-
 blockdev.c                       |  44 +++++----
 blockjob.c                       |  28 +++---
 include/block/blockjob.h         |  23 +++--
 include/qemu/job.h               | 153 +++++++++++++++++++---------
 job-qmp.c                        |  26 ++---
 job.c                            | 164 ++++++++++++++++++-------------
 monitor/qmp-cmds.c               |   3 +-
 qemu-img.c                       |  14 +--
 tests/unit/test-bdrv-drain.c     |   2 +-
 tests/unit/test-block-iothread.c |   4 +-
 tests/unit/test-blockjob-txn.c   |  14 +--
 tests/unit/test-blockjob.c       |  30 +++---
 15 files changed, 306 insertions(+), 212 deletions(-)

diff --git a/block.c b/block.c
index 5e1ab8d692..ab801e776d 100644
--- a/block.c
+++ b/block.c
@@ -4973,7 +4973,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     WITH_JOB_LOCK_GUARD() {
-        assert(job_next(NULL) == NULL);
+        assert(job_next_locked(NULL) == NULL);
     }
     assert(qemu_in_main_thread());
 
@@ -6152,7 +6152,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
             GSList *el;
 
             xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
diff --git a/block/backup.c b/block/backup.c
index c53041772c..c29f3c1ae8 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -316,8 +316,8 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     BackupBlockJob *s = container_of(job, BackupBlockJob, common);
 
     /*
-     * block_job_set_speed() is called first from block_job_create(), when we
-     * don't yet have s->bcs.
+     * block_job_set_speed_locked() is called first from block_job_create(),
+     * when we don't yet have s->bcs.
      */
     if (s->bcs) {
         block_copy_set_speed(s->bcs, speed);
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
index 7a9e9b4a13..d6693593b0 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -152,12 +152,13 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
 
-            job_cancel(&job->job, false);
+            job_cancel_locked(&job->job, false);
 
             aio_context_release(aio_context);
         }
@@ -1841,7 +1842,7 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context_acquire(aio_context);
 
         WITH_JOB_LOCK_GUARD() {
-            job_cancel_sync(&state->job->job, true);
+            job_cancel_sync_locked(&state->job->job, true);
         }
 
         aio_context_release(aio_context);
@@ -1944,7 +1945,7 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context_acquire(aio_context);
 
         WITH_JOB_LOCK_GUARD() {
-            job_cancel_sync(&state->job->job, true);
+            job_cancel_sync_locked(&state->job->job, true);
         }
 
         aio_context_release(aio_context);
@@ -2396,7 +2397,7 @@ exit:
     }
 
     WITH_JOB_LOCK_GUARD() {
-        job_txn_unref(block_job_txn);
+        job_txn_unref_locked(block_job_txn);
     }
 }
 
@@ -3325,7 +3326,7 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
     *aio_context = NULL;
     job_lock();
 
-    job = block_job_get(id);
+    job = block_job_get_locked(id);
 
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
@@ -3349,7 +3350,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
         return;
     }
 
-    block_job_set_speed(job, speed, errp);
+    block_job_set_speed_locked(job, speed, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -3368,14 +3369,14 @@ void qmp_block_job_cancel(const char *device,
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
     job_unlock();
@@ -3391,7 +3392,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_pause(job);
-    job_user_pause(&job->job, errp);
+    job_user_pause_locked(&job->job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -3406,7 +3407,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_resume(job);
-    job_user_resume(&job->job, errp);
+    job_user_resume_locked(&job->job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -3421,7 +3422,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
     }
 
     trace_qmp_block_job_complete(job);
-    job_complete(&job->job, errp);
+    job_complete_locked(&job->job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -3436,16 +3437,16 @@ void qmp_block_job_finalize(const char *id, Error **errp)
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
     job_unlock();
 }
@@ -3462,7 +3463,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -3734,13 +3735,14 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         BlockJobInfo *value;
 
         if (block_job_is_internal(job)) {
             continue;
         }
-        value = block_job_query(job, errp);
+        value = block_job_query_locked(job, errp);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
diff --git a/blockjob.c b/blockjob.c
index 9fd1b6972f..c370bd0b5e 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -59,21 +59,21 @@ static bool is_block_job(Job *job)
            job_type(job) == JOB_TYPE_STREAM;
 }
 
-BlockJob *block_job_next(BlockJob *bjob)
+BlockJob *block_job_next_locked(BlockJob *bjob)
 {
     Job *job = bjob ? &bjob->job : NULL;
     assert(qemu_in_main_thread());
 
     do {
-        job = job_next(job);
+        job = job_next_locked(job);
     } while (job && !is_block_job(job));
 
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
-BlockJob *block_job_get(const char *id)
+BlockJob *block_job_get_locked(const char *id)
 {
-    Job *job = job_get(id);
+    Job *job = job_get_locked(id);
     assert(qemu_in_main_thread());
 
     if (job && is_block_job(job)) {
@@ -103,7 +103,7 @@ static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
     WITH_JOB_LOCK_GUARD() {
-        job_pause(&job->job);
+        job_pause_locked(&job->job);
     }
 }
 
@@ -117,7 +117,7 @@ static bool child_job_drained_poll(BdrvChild *c)
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
     WITH_JOB_LOCK_GUARD() {
-        if (!job->busy || job_is_completed(job)) {
+        if (!job->busy || job_is_completed_locked(job)) {
             return false;
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
 
@@ -283,14 +283,14 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
     assert(qemu_in_main_thread());
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+    if (job_apply_verb_locked(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
     if (speed < 0) {
@@ -314,7 +314,7 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }
 
     /* kick only if a timer is pending */
-    job_enter_cond(&job->job, job_timer_pending);
+    job_enter_cond_locked(&job->job, job_timer_pending);
 
     return true;
 }
@@ -324,7 +324,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
+BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
@@ -348,7 +348,7 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     info->len       = progress_total;
     info->speed     = job->speed;
     info->io_status = job->iostatus;
-    info->ready     = job_is_ready(&job->job),
+    info->ready     = job_is_ready_locked(&job->job),
     info->status    = job->job.status;
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
@@ -504,7 +504,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
     WITH_JOB_LOCK_GUARD() {
-        ret = block_job_set_speed(job, speed, errp);
+        ret = block_job_set_speed_locked(job, speed, errp);
     }
     if (!ret) {
         goto fail;
@@ -568,7 +568,7 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     if (action == BLOCK_ERROR_ACTION_STOP) {
         WITH_JOB_LOCK_GUARD() {
             if (!job->job.user_paused) {
-                job_pause(&job->job);
+                job_pause_locked(&job->job);
                 /*
                  * make the pause user visible, which will be
                  * resumed from QMP.
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 2373dfeb07..cabfa52d5b 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -46,7 +46,7 @@ typedef struct BlockJob {
     /** Status that is published by the query-block-jobs QMP API */
     BlockDeviceIoStatus iostatus;
 
-    /** Speed that was set with @block_job_set_speed.  */
+    /** Speed that was set with @block_job_set_speed_locked.  */
     int64_t speed;
 
     /** Rate limiting data structure for implementing @speed. */
@@ -82,25 +82,27 @@ typedef struct BlockJob {
  */
 
 /**
- * block_job_next:
+ * block_job_next_locked:
  * @job: A block job, or %NULL.
  *
  * Get the next element from the list of block jobs after @job, or the
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ * Called with job_mutex lock held.
  */
-BlockJob *block_job_next(BlockJob *job);
+BlockJob *block_job_next_locked(BlockJob *job);
 
 /**
- * block_job_get:
+ * block_job_get_locked:
  * @id: The id of the block job.
  *
  * Get the block job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ * Called with job_mutex lock held.
  */
-BlockJob *block_job_get(const char *id);
+BlockJob *block_job_get_locked(const char *id);
 
 /**
  * block_job_add_bdrv:
@@ -135,23 +137,26 @@ void block_job_remove_all_bdrv(BlockJob *job);
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
 
 /**
- * block_job_set_speed:
+ * block_job_set_speed_locked:
  * @job: The job to set the speed for.
  * @speed: The new value
  * @errp: Error object.
  *
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
+ *
+ * Called with job_mutex lock held. May temporarly release the lock.
  */
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
+bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp);
 
 /**
- * block_job_query:
+ * block_job_query_locked:
  * @job: The job to get information about.
  *
  * Return information about a job.
+ * Called with job_mutex lock held.
  */
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
+BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
 
 /**
  * block_job_iostatus_reset:
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 6f22a20d58..e13c976ba5 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -348,7 +348,7 @@ void job_unlock(void);
 
 /**
  * Allocate and return a new job transaction. Jobs can be added to the
- * transaction using job_txn_add_job().
+ * transaction using job_txn_add_job_locked().
  *
  * The transaction is automatically freed when the last job completes or is
  * cancelled.
@@ -360,22 +360,25 @@ void job_unlock(void);
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
@@ -394,16 +397,20 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
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
@@ -442,8 +449,10 @@ void job_progress_increase_remaining(Job *job, uint64_t delta);
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
@@ -463,8 +472,9 @@ void job_enter(Job *job);
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
 
@@ -503,79 +513,117 @@ bool job_is_cancelled(Job *job);
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
@@ -588,14 +636,20 @@ void job_user_cancel(Job *job, bool force, Error **errp);
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
@@ -606,8 +660,10 @@ void job_cancel_sync_all(void);
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
@@ -616,14 +672,18 @@ int job_complete_sync(Job *job, Error **errp);
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
@@ -633,7 +693,10 @@ void job_dismiss(Job **job, Error **errp);
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
index a08cd7dd36..615e056fc4 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -40,7 +40,7 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
     *aio_context = NULL;
     job_lock();
 
-    job = job_get(id);
+    job = job_get_locked(id);
     if (!job) {
         error_setg(errp, "Job not found");
         job_unlock();
@@ -63,7 +63,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     }
 
     trace_qmp_job_cancel(job);
-    job_user_cancel(job, true, errp);
+    job_user_cancel_locked(job, true, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -78,7 +78,7 @@ void qmp_job_pause(const char *id, Error **errp)
     }
 
     trace_qmp_job_pause(job);
-    job_user_pause(job, errp);
+    job_user_pause_locked(job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -93,7 +93,7 @@ void qmp_job_resume(const char *id, Error **errp)
     }
 
     trace_qmp_job_resume(job);
-    job_user_resume(job, errp);
+    job_user_resume_locked(job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -108,7 +108,7 @@ void qmp_job_complete(const char *id, Error **errp)
     }
 
     trace_qmp_job_complete(job);
-    job_complete(job, errp);
+    job_complete_locked(job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -123,16 +123,16 @@ void qmp_job_finalize(const char *id, Error **errp)
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
     job_unlock();
 }
@@ -147,7 +147,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
     }
 
     trace_qmp_job_dismiss(job);
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
     job_unlock();
 }
@@ -184,7 +184,7 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     JOB_LOCK_GUARD();
 
-    for (job = job_next(NULL); job; job = job_next(job)) {
+    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
 
         if (job_is_internal(job)) {
diff --git a/job.c b/job.c
index 4947a58dcb..b169bd7280 100644
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
@@ -159,7 +159,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * we need to release it here to avoid holding the lock twice - which would
      * break AIO_WAIT_WHILE from within fn.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
@@ -174,7 +174,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * can't use a local variable to cache it.
      */
     aio_context_acquire(job->aio_context);
-    job_unref(job);
+    job_unref_locked(job);
     return rc;
 }
 
@@ -198,7 +198,7 @@ static void job_state_transition(Job *job, JobStatus s1)
     }
 }
 
-int job_apply_verb(Job *job, JobVerb verb, Error **errp)
+int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp)
 {
     JobStatus s0 = job->status;
     assert(verb >= 0 && verb < JOB_VERB__MAX);
@@ -234,7 +234,7 @@ bool job_cancel_requested(Job *job)
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -256,7 +256,13 @@ bool job_is_ready(Job *job)
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
@@ -278,6 +284,13 @@ bool job_is_completed(Job *job)
     return false;
 }
 
+/* Called with job_mutex lock *not* held */
+static bool job_is_completed(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_completed_locked(job);
+}
+
 static bool job_started(Job *job)
 {
     return job->co;
@@ -288,7 +301,7 @@ static bool job_should_pause(Job *job)
     return job->pause_count > 0;
 }
 
-Job *job_next(Job *job)
+Job *job_next_locked(Job *job)
 {
     if (!job) {
         return QLIST_FIRST(&jobs);
@@ -296,7 +309,7 @@ Job *job_next(Job *job)
     return QLIST_NEXT(job, job_list);
 }
 
-Job *job_get(const char *id)
+Job *job_get_locked(const char *id)
 {
     Job *job;
 
@@ -333,7 +346,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
             error_setg(errp, "Invalid job ID '%s'", job_id);
             return NULL;
         }
-        if (job_get(job_id)) {
+        if (job_get_locked(job_id)) {
             error_setg(errp, "Job ID '%s' already in use", job_id);
             return NULL;
         }
@@ -374,21 +387,21 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
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
 
@@ -460,7 +473,7 @@ static void job_event_idle(Job *job)
     notifier_list_notify(&job->on_idle, job);
 }
 
-void job_enter_cond(Job *job, bool(*fn)(Job *job))
+void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
 {
     if (!job_started(job)) {
         return;
@@ -490,7 +503,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
 void job_enter(Job *job)
 {
     JOB_LOCK_GUARD();
-    job_enter_cond(job, NULL);
+    job_enter_cond_locked(job, NULL);
 }
 
 /* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
@@ -512,7 +525,7 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     qemu_coroutine_yield();
     job_lock();
 
-    /* Set by job_enter_cond() before re-entering the coroutine.  */
+    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
@@ -595,15 +608,15 @@ static bool job_timer_not_pending(Job *job)
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
@@ -612,12 +625,12 @@ void job_resume(Job *job)
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
@@ -625,15 +638,15 @@ void job_user_pause(Job *job, Error **errp)
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
@@ -641,7 +654,7 @@ void job_user_resume(Job *job, Error **errp)
         error_setg(errp, "Can't resume a job that was not paused");
         return;
     }
-    if (job_apply_verb(job, JOB_VERB_RESUME, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_RESUME, errp)) {
         return;
     }
     if (job->driver->user_resume) {
@@ -650,7 +663,7 @@ void job_user_resume(Job *job, Error **errp)
         job_lock();
     }
     job->user_paused = false;
-    job_resume(job);
+    job_resume_locked(job);
 }
 
 static void job_do_dismiss(Job *job)
@@ -663,15 +676,15 @@ static void job_do_dismiss(Job *job)
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
 
@@ -679,12 +692,18 @@ void job_dismiss(Job **jobptr, Error **errp)
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
@@ -743,7 +762,7 @@ static int job_finalize_single(Job *job)
     int job_ret;
     AioContext *ctx = job->aio_context;
 
-    assert(job_is_completed(job));
+    assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
@@ -839,7 +858,7 @@ static void job_completed_txn_abort(Job *job)
      * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
      * Note that the job's AioContext may change when it is finalized.
      */
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
@@ -866,22 +885,22 @@ static void job_completed_txn_abort(Job *job)
          */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             assert(job_cancel_requested(other_job));
-            job_finish_sync(other_job, NULL, NULL);
+            job_finish_sync_locked(other_job, NULL, NULL);
         }
         aio_context_release(ctx);
         job_finalize_single(other_job);
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
@@ -922,10 +941,10 @@ static void job_do_finalize(Job *job)
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
@@ -959,7 +978,7 @@ static void job_completed_txn_success(Job *job)
      * txn.
      */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             return;
         }
         assert(other_job->ret == 0);
@@ -975,7 +994,7 @@ static void job_completed_txn_success(Job *job)
 
 static void job_completed(Job *job)
 {
-    assert(job && job->txn && !job_is_completed(job));
+    assert(job && job->txn && !job_is_completed_locked(job));
 
     job_update_rc(job);
     trace_job_completed(job, job->ret);
@@ -993,7 +1012,7 @@ static void job_exit(void *opaque)
     AioContext *ctx;
 
     JOB_LOCK_GUARD();
-    job_ref(job);
+    job_ref_locked(job);
     aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
@@ -1012,7 +1031,7 @@ static void job_exit(void *opaque)
      * the job underneath us.
      */
     ctx = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(ctx);
 }
 
@@ -1065,7 +1084,7 @@ void job_start(Job *job)
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_cancel(Job *job, bool force)
+void job_cancel_locked(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
         job_do_dismiss(job);
@@ -1089,24 +1108,26 @@ void job_cancel(Job *job, bool force)
             job_completed_txn_abort(job);
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
@@ -1114,15 +1135,15 @@ static void job_cancel_err(Job *job, Error **errp)
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
 
@@ -1132,25 +1153,25 @@ void job_cancel_sync_all(void)
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
     assert(qemu_in_main_thread());
-    if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
+    if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
     if (job_cancel_requested(job) || !job->driver->complete) {
@@ -1164,19 +1185,20 @@ void job_complete(Job *job, Error **errp)
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
 
@@ -1186,6 +1208,6 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
     job_lock();
 
     ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
-    job_unref(job);
+    job_unref_locked(job);
     return ret;
 }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f935fa4ad5..59f6bdd98c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -135,7 +135,8 @@ void qmp_cont(Error **errp)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
             block_job_iostatus_reset(job);
         }
     }
diff --git a/qemu-img.c b/qemu-img.c
index a805f6fe7a..deb5421137 100644
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
@@ -920,15 +920,15 @@ static void run_block_job(BlockJob *job, Error **errp)
             }
             qemu_progress_print(progress, 0);
             job_lock();
-        } while (!job_is_ready(&job->job) &&
-                !job_is_completed(&job->job));
+        } while (!job_is_ready_locked(&job->job) &&
+                !job_is_completed_locked(&job->job));
 
-        if (!job_is_completed(&job->job)) {
-            ret = job_complete_sync(&job->job, errp);
+        if (!job_is_completed_locked(&job->job)) {
+            ret = job_complete_sync_locked(&job->job, errp);
         } else {
             ret = job->job.ret;
         }
-        job_unref(&job->job);
+        job_unref_locked(&job->job);
     }
     aio_context_release(aio_context);
 
@@ -1083,7 +1083,7 @@ static int img_commit(int argc, char **argv)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        job = block_job_get("commit");
+        job = block_job_get_locked("commit");
     }
     assert(job);
     run_block_job(job, &local_err);
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


