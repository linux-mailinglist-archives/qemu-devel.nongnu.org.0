Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BAB4D8707
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:37:11 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlos-0005Vz-LS
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:37:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt4-0006fz-B2
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksx-0001bC-O1
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6honxngkyPyu7ofQTt1CZZ3NSWgyWaKInEc8WFDTMEY=;
 b=cj6avd59O1O6S5mBpewc4iTF9c+C3jYmBhAsnZXrj3PGFxr8k03XHSXzYeVOv+8VMbg5KQ
 rEXVD6AX41o72WO53e0FCrLHfFLe3TYja80SfffNmcFdAXM+CxydvC888fRWbk1eNuURxS
 eNy29phi8E/P2vz0naOwqrn39+WgB5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-bZ1Lout7O3ejsTc60EE8Lg-1; Mon, 14 Mar 2022 09:37:18 -0400
X-MC-Unique: bZ1Lout7O3ejsTc60EE8Lg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 804CA101CC62;
 Mon, 14 Mar 2022 13:37:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D9EA403144;
 Mon, 14 Mar 2022 13:37:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 12/18] block_job: rename block_job functions called with
 job_mutex held
Date: Mon, 14 Mar 2022 09:37:01 -0400
Message-Id: <20220314133707.2206082-13-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Just as for the job API, rename block_job functions that are
always called under job lock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                  |  3 ++-
 block/backup.c           |  4 ++--
 blockdev.c               | 12 +++++++-----
 blockjob.c               | 39 ++++++++++++++++++++++-----------------
 include/block/blockjob.h | 29 ++++++++++++++++++-----------
 monitor/qmp-cmds.c       |  5 +++--
 qemu-img.c               |  2 +-
 7 files changed, 55 insertions(+), 39 deletions(-)

diff --git a/block.c b/block.c
index 9cf3416bea..23416b7fc7 100644
--- a/block.c
+++ b/block.c
@@ -6168,7 +6168,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
             GSList *el;
 
             xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
diff --git a/block/backup.c b/block/backup.c
index 5cfd0b999c..02e0f59ef1 100644
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
diff --git a/blockdev.c b/blockdev.c
index 1ac9dac1b0..9602401b03 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -152,7 +152,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
@@ -3325,7 +3326,7 @@ static BlockJob *find_block_job_locked(const char *id,
 
     *aio_context = NULL;
 
-    job = block_job_get(id);
+    job = block_job_get_locked(id);
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
                   "Block job '%s' not found", id);
@@ -3350,7 +3351,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
         return;
     }
 
-    block_job_set_speed(job, speed, errp);
+    block_job_set_speed_locked(job, speed, errp);
     aio_context_release(aio_context);
 }
 
@@ -3755,7 +3756,8 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         BlockJobInfo *value;
         AioContext *aio_context;
 
@@ -3764,7 +3766,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
         }
         aio_context = block_job_get_aio_context(job);
         aio_context_acquire(aio_context);
-        value = block_job_query(job, errp);
+        value = block_job_query_locked(job, errp);
         aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
diff --git a/blockjob.c b/blockjob.c
index 02a98630c9..0745f4e745 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -59,7 +59,7 @@ static bool is_block_job(Job *job)
            job_type(job) == JOB_TYPE_STREAM;
 }
 
-BlockJob *block_job_next(BlockJob *bjob)
+BlockJob *block_job_next_locked(BlockJob *bjob)
 {
     Job *job = bjob ? &bjob->job : NULL;
     GLOBAL_STATE_CODE();
@@ -71,7 +71,7 @@ BlockJob *block_job_next(BlockJob *bjob)
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
-BlockJob *block_job_get(const char *id)
+BlockJob *block_job_get_locked(const char *id)
 {
     Job *job = job_get_locked(id);
     GLOBAL_STATE_CODE();
@@ -256,7 +256,8 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
-static void block_job_on_idle(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_on_idle_locked(Notifier *n, void *opaque)
 {
     aio_wait_kick();
 }
@@ -277,7 +278,7 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
@@ -319,7 +320,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
+BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
@@ -364,7 +365,8 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
-static void block_job_event_cancelled(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_cancelled_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -383,7 +385,8 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
-static void block_job_event_completed(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_completed_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     const char *msg = NULL;
@@ -409,7 +412,8 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
-static void block_job_event_pending(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_pending_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
 
@@ -421,7 +425,8 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
-static void block_job_event_ready(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_ready_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -471,11 +476,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     ratelimit_init(&job->limit);
 
-    job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
-    job->finalize_completed_notifier.notify = block_job_event_completed;
-    job->pending_notifier.notify = block_job_event_pending;
-    job->ready_notifier.notify = block_job_event_ready;
-    job->idle_notifier.notify = block_job_on_idle;
+    job->finalize_cancelled_notifier.notify = block_job_event_cancelled_locked;
+    job->finalize_completed_notifier.notify = block_job_event_completed_locked;
+    job->pending_notifier.notify = block_job_event_pending_locked;
+    job->ready_notifier.notify = block_job_event_ready_locked;
+    job->idle_notifier.notify = block_job_on_idle_locked;
 
     WITH_JOB_LOCK_GUARD() {
         notifier_list_add(&job->job.on_finalize_cancelled,
@@ -498,7 +503,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
     WITH_JOB_LOCK_GUARD() {
-        ret = block_job_set_speed(job, speed, errp);
+        ret = block_job_set_speed_locked(job, speed, errp);
     }
     if (!ret) {
         goto fail;
@@ -511,7 +516,7 @@ fail:
     return NULL;
 }
 
-void block_job_iostatus_reset(BlockJob *job)
+void block_job_iostatus_reset_locked(BlockJob *job)
 {
     GLOBAL_STATE_CODE();
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
@@ -526,7 +531,7 @@ void block_job_user_resume(Job *job)
     BlockJob *bjob = container_of(job, BlockJob, job);
     GLOBAL_STATE_CODE();
     WITH_JOB_LOCK_GUARD() {
-        block_job_iostatus_reset(bjob);
+        block_job_iostatus_reset_locked(bjob);
     }
 }
 
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 6525e16fd5..000f5a1d21 100644
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
@@ -135,32 +137,37 @@ void block_job_remove_all_bdrv(BlockJob *job);
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
- * block_job_iostatus_reset:
+ * block_job_iostatus_reset_locked:
  * @job: The job whose I/O status should be reset.
  *
  * Reset I/O status on @job and on BlockDriverState objects it uses,
  * other than job->blk.
+ *
+ * Called with job_mutex lock held.
  */
-void block_job_iostatus_reset(BlockJob *job);
+void block_job_iostatus_reset_locked(BlockJob *job);
 
 /*
  * block_job_get_aio_context:
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2bb41a8a41..95f482e34d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -135,8 +135,9 @@ void qmp_cont(Error **errp)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-            block_job_iostatus_reset(job);
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
+            block_job_iostatus_reset_locked(job);
         }
     }
 
diff --git a/qemu-img.c b/qemu-img.c
index 315c9c2a31..222c9fdf5c 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1083,7 +1083,7 @@ static int img_commit(int argc, char **argv)
     }
 
     WITH_JOB_LOCK_GUARD() {
-        job = block_job_get("commit");
+        job = block_job_get_locked("commit");
     }
     assert(job);
     run_block_job(job, &local_err);
-- 
2.31.1


