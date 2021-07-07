Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E253D3BECC4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:03:24 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AxI-0002VV-0E
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Ast-0003Bg-I7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asp-0000Fj-PU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5WVZ1cU90Cud9ObEFGXUsR9P3xEzv6AfVLyPz5vB2c=;
 b=cxmX+IjuheX5Qd84GBHklhJSf9R6PSRpEe8/wUiQJCscJU/+GKSj5e1c6fbozZzPBv7bXm
 BB40sClqOHn0stoHl7NbAL2VaFswpDQfgc8tumHPujvIW6LtCMDzg02f+Db+Zt1IlzHPHJ
 PgJuEKqUT4evVZEiHY/ghBwB/JqCH40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Sd0KixKvOOaatDWGoSxGcQ-1; Wed, 07 Jul 2021 12:58:43 -0400
X-MC-Unique: Sd0KixKvOOaatDWGoSxGcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845D9801107;
 Wed,  7 Jul 2021 16:58:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566F9100EB3D;
 Wed,  7 Jul 2021 16:58:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 5/6] job: use global job_mutex to protect struct Job
Date: Wed,  7 Jul 2021 18:58:12 +0200
Message-Id: <20210707165813.55361-6-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This lock is going to replace most of the AioContext locks
in the job and blockjob, so that a Job can run in an arbitrary
AioContext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/blockjob_int.h |   1 +
 include/qemu/job.h           |   2 +
 block/backup.c               |   4 +
 block/mirror.c               |  11 +-
 blockdev.c                   |  62 ++++----
 blockjob.c                   |  67 +++++++--
 job-qmp.c                    |  55 +++----
 job.c                        | 284 +++++++++++++++++++++++++++--------
 qemu-img.c                   |  15 +-
 9 files changed, 350 insertions(+), 151 deletions(-)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 6633d83da2..8b91126506 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -53,6 +53,7 @@ struct BlockJobDriver {
      */
     void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
 
+    /* Called with job mutex *not* held. */
     void (*set_speed)(BlockJob *job, int64_t speed);
 };
 
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 4421d08d93..359f4e6b3a 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -49,6 +49,8 @@ typedef struct Job {
     /**
      * The type of this job.
      * Set it in job_create and just read.
+     * All calls to the driver function must be not locked by job_mutex,
+     * to avoid deadlocks.
      */
     const JobDriver *driver;
 
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..80ce956299 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -315,6 +315,10 @@ static void coroutine_fn backup_pause(Job *job)
     }
 }
 
+/*
+ * Called with job mutex *not* held (we don't want to call block_copy_kick
+ * with the lock held!)
+ */
 static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common);
diff --git a/block/mirror.c b/block/mirror.c
index 49aaaafffa..deefaa6a39 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1150,9 +1150,11 @@ static void mirror_complete(Job *job, Error **errp)
     s->should_complete = true;
 
     /* If the job is paused, it will be re-entered when it is resumed */
+    job_lock();
     if (!job_is_paused(job)) {
-        job_enter(job);
+        job_enter_locked(job);
     }
+    job_unlock();
 }
 
 static void coroutine_fn mirror_pause(Job *job)
@@ -1171,10 +1173,13 @@ static bool mirror_drained_poll(BlockJob *job)
      * from one of our own drain sections, to avoid a deadlock waiting for
      * ourselves.
      */
-    if (!job_is_paused(&s->common.job) && !job_is_cancelled(&s->common.job) &&
-        !s->in_drain) {
+    job_lock();
+    if (!job_is_paused(&s->common.job) &&
+        !job_is_cancelled_locked(&s->common.job) && !s->in_drain) {
+        job_unlock();
         return true;
     }
+    job_unlock();
 
     return !!s->in_flight;
 }
diff --git a/blockdev.c b/blockdev.c
index 8e2c15370e..9255aea6a2 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -150,9 +150,11 @@ void blockdev_mark_auto_del(BlockBackend *blk)
             AioContext *aio_context = job_get_aiocontext(&job->job);
             aio_context_acquire(aio_context);
 
+            job_lock();
             job_cancel(&job->job, false);
 
             aio_context_release(aio_context);
+            job_unlock();
         }
     }
 
@@ -3309,48 +3311,44 @@ out:
     aio_context_release(aio_context);
 }
 
-/* Get a block job using its ID and acquire its AioContext */
-static BlockJob *find_block_job(const char *id, AioContext **aio_context,
-                                Error **errp)
+/* Get a block job using its ID and acquire its job_lock */
+static BlockJob *find_block_job(const char *id, Error **errp)
 {
     BlockJob *job;
 
     assert(id != NULL);
 
-    *aio_context = NULL;
-
+    job_lock();
     job = block_job_get(id);
 
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
                   "Block job '%s' not found", id);
+        job_unlock();
         return NULL;
     }
 
-    *aio_context = blk_get_aio_context(job->blk);
-    aio_context_acquire(*aio_context);
-
     return job;
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
     }
 
     block_job_set_speed(job, speed, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_cancel(const char *device,
                           bool has_force, bool force, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3369,13 +3367,13 @@ void qmp_block_job_cancel(const char *device,
     trace_qmp_block_job_cancel(job);
     job_user_cancel(&job->job, force, errp);
 out:
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_pause(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3383,13 +3381,13 @@ void qmp_block_job_pause(const char *device, Error **errp)
 
     trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_resume(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3397,13 +3395,13 @@ void qmp_block_job_resume(const char *device, Error **errp)
 
     trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_complete(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3411,13 +3409,13 @@ void qmp_block_job_complete(const char *device, Error **errp)
 
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(id, &aio_context, errp);
+    BlockJob *job = find_block_job(id, errp);
 
     if (!job) {
         return;
@@ -3427,20 +3425,14 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     job_ref(&job->job);
     job_finalize(&job->job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
-     */
-    aio_context = blk_get_aio_context(job->blk);
     job_unref(&job->job);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *bjob = find_block_job(id, &aio_context, errp);
+    BlockJob *bjob = find_block_job(id, errp);
     Job *job;
 
     if (!bjob) {
@@ -3450,7 +3442,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_change_backing_file(const char *device,
diff --git a/blockjob.c b/blockjob.c
index 7f49f03ec7..e7b289089b 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -42,15 +42,16 @@
  * The first includes functions used by the monitor.  The monitor is
  * peculiar in that it accesses the block job list with block_job_get, and
  * therefore needs consistency across block_job_get and the actual operation
- * (e.g. block_job_set_speed).  The consistency is achieved with
- * aio_context_acquire/release.  These functions are declared in blockjob.h.
+ * (e.g. block_job_set_speed).  To achieve this consistency, the caller
+ * calls block_job_lock/block_job_unlock itself around the whole operation.
+ * These functions are declared in blockjob.h.
  *
  * The second includes functions used by the block job drivers and sometimes
- * by the core block layer.  These do not care about locking, because the
- * whole coroutine runs under the AioContext lock, and are declared in
- * blockjob_int.h.
+ * by the core block layer. These delegate the locking to the callee instead,
+ * and are declared in blockjob_int.h.
  */
 
+/* Does not need job_mutex. Value is never modified */
 static bool is_block_job(Job *job)
 {
     return job_type(job) == JOB_TYPE_BACKUP ||
@@ -59,6 +60,7 @@ static bool is_block_job(Job *job)
            job_type(job) == JOB_TYPE_STREAM;
 }
 
+/* Called with job_mutex *not* held. */
 BlockJob *block_job_next(BlockJob *bjob)
 {
     Job *job = bjob ? &bjob->job : NULL;
@@ -70,6 +72,7 @@ BlockJob *block_job_next(BlockJob *bjob)
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
+/* Called with job_mutex held. */
 BlockJob *block_job_get(const char *id)
 {
     Job *job = job_get(id);
@@ -97,24 +100,31 @@ static char *child_job_get_parent_desc(BdrvChild *c)
     return g_strdup_printf("%s job '%s'", job_type_str(&job->job), job->job.id);
 }
 
+/* Called with job_mutex *not* held. */
 static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
+    job_lock();
     job_pause(&job->job);
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 static bool child_job_drained_poll(BdrvChild *c)
 {
     BlockJob *bjob = c->opaque;
     Job *job = &bjob->job;
     const BlockJobDriver *drv = block_job_driver(bjob);
 
+    job_lock();
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job_is_busy(job) || job_is_completed(job)) {
+    if (!job_is_busy(job) || job_is_completed_locked(job)) {
+        job_unlock();
         return false;
     }
+    job_unlock();
 
     /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
      * override this assumption. */
@@ -125,10 +135,13 @@ static bool child_job_drained_poll(BdrvChild *c)
     }
 }
 
+/* Called with job_mutex *not* held. */
 static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
+    job_lock();
     job_resume(&job->job);
+    job_unlock();
 }
 
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
@@ -246,11 +259,15 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 static void block_job_on_idle(Notifier *n, void *opaque)
 {
+    job_unlock();
     aio_wait_kick();
+    job_lock();
 }
 
+/* Does not need job_mutex. Value is never modified */
 bool block_job_is_internal(BlockJob *job)
 {
     return (job->job.id == NULL);
@@ -267,6 +284,7 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
+/* Called with job_mutex held. May temporarly release the lock. */
 bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
@@ -286,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     job->speed = speed;
 
     if (drv->set_speed) {
+        job_unlock();
         drv->set_speed(job, speed);
+        job_lock();
     }
 
     if (speed && speed <= old_speed) {
@@ -304,6 +324,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
+/* Called with block_job_mutex *not* held. */
 BlockJobInfo *block_job_query(BlockJob *blkjob, Error **errp)
 {
     BlockJobInfo *info;
@@ -319,6 +340,7 @@ BlockJobInfo *block_job_query(BlockJob *blkjob, Error **errp)
     progress_get_snapshot(&job->progress, &progress_current,
                           &progress_total);
 
+    job_lock();
     info = g_new0(BlockJobInfo, 1);
     info->type      = g_strdup(job_type_str(job));
     info->device    = g_strdup(job->id);
@@ -328,11 +350,11 @@ BlockJobInfo *block_job_query(BlockJob *blkjob, Error **errp)
     info->len       = progress_total;
     info->speed     = blkjob->speed;
     info->io_status = blkjob->iostatus;
-    info->ready     = job_is_ready(job);
+    info->ready     = job_is_ready_locked(job);
     info->status    = job_get_status(job);
     info->auto_finalize = job->auto_finalize;
     info->auto_dismiss = job->auto_dismiss;
-    job_ret = job_get_ret(job);
+    job_ret = job_get_ret_locked(job);
     if (job_ret) {
         Error *job_err = job_get_err(job);
         info->has_error = true;
@@ -340,9 +362,11 @@ BlockJobInfo *block_job_query(BlockJob *blkjob, Error **errp)
                         g_strdup(error_get_pretty(job_err)) :
                         g_strdup(strerror(-job_ret));
     }
+    job_unlock();
     return info;
 }
 
+/* Called with job_mutex held. */
 static void block_job_iostatus_set_err(BlockJob *job, int error)
 {
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
@@ -351,6 +375,7 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
+/* Called with job_mutex held. */
 static void block_job_event_cancelled(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -370,6 +395,7 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
+/* Called with job_mutex held. */
 static void block_job_event_completed(Notifier *n, void *opaque)
 {
     BlockJob *blkjob = opaque;
@@ -381,7 +407,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
         return;
     }
 
-    if (job_get_ret(job) < 0) {
+    if (job_get_ret_locked(job) < 0) {
         msg = error_get_pretty(job_get_err(job));
     }
 
@@ -397,6 +423,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
+/* Called with job_mutex held. */
 static void block_job_event_pending(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -409,6 +436,7 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
+/* Called with job_mutex held. */
 static void block_job_event_ready(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
@@ -430,10 +458,11 @@ static void block_job_event_ready(Notifier *n, void *opaque)
 
 
 /*
- * API for block job drivers and the block layer.  These functions are
- * declared in blockjob_int.h.
+ * API for block job drivers and the block layer, who do not know about
+ * job_mutex.  These functions are declared in blockjob_int.h.
  */
 
+/* Called with block_job_mutex *not* held, but temporarly releases it. */
 void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        JobTxn *txn, BlockDriverState *bs, uint64_t perm,
                        uint64_t shared_perm, int64_t speed, int flags,
@@ -472,6 +501,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job->ready_notifier.notify = block_job_event_ready;
     job->idle_notifier.notify = block_job_on_idle;
 
+    job_lock();
+
     notifier_list_add(&job->job.on_finalize_cancelled,
                       &job->finalize_cancelled_notifier);
     notifier_list_add(&job->job.on_finalize_completed,
@@ -482,7 +513,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
+
+    job_unlock();
+    /* calls drain and friends, that already take the lock */
     block_job_add_bdrv(job, "main node", bs, 0, BLK_PERM_ALL, &error_abort);
+    job_lock();
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
@@ -493,27 +528,35 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     if (!block_job_set_speed(job, speed, errp)) {
         job_early_fail(&job->job);
+        job_unlock();
         return NULL;
     }
 
+    job_unlock();
     return job;
 }
 
+/* Called with job_mutex *not* held. */
 void block_job_iostatus_reset(BlockJob *job)
 {
+    job_lock();
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
+        job_unlock();
         return;
     }
     assert(job_user_paused(&job->job) && job_should_pause(&job->job));
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
     block_job_iostatus_reset(bjob);
 }
 
+/* Called with job_mutex *not* held. */
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         int is_read, int error)
 {
@@ -544,12 +587,14 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         action);
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
+        job_lock();
         if (!job_user_paused(&job->job)) {
             job_pause(&job->job);
             /* make the pause user visible, which will be resumed from QMP. */
             job_set_user_paused(&job->job);
         }
         block_job_iostatus_set_err(job, error);
+        job_unlock();
     }
     return action;
 }
diff --git a/job-qmp.c b/job-qmp.c
index 12238a1643..03f3946490 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,29 +29,26 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/* Get a job using its ID and acquire its job_lock */
+static Job *find_job(const char *id, Error **errp)
 {
     Job *job;
 
-    *aio_context = NULL;
+    job_lock();
 
     job = job_get(id);
     if (!job) {
         error_setg(errp, "Job not found");
+        job_unlock();
         return NULL;
     }
 
-    *aio_context = job_get_aiocontext(job);
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
@@ -59,13 +56,12 @@ void qmp_job_cancel(const char *id, Error **errp)
 
     trace_qmp_job_cancel(job);
     job_user_cancel(job, true, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_pause(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -73,13 +69,12 @@ void qmp_job_pause(const char *id, Error **errp)
 
     trace_qmp_job_pause(job);
     job_user_pause(job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_resume(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -87,13 +82,12 @@ void qmp_job_resume(const char *id, Error **errp)
 
     trace_qmp_job_resume(job);
     job_user_resume(job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_complete(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -101,13 +95,12 @@ void qmp_job_complete(const char *id, Error **errp)
 
     trace_qmp_job_complete(job);
     job_complete(job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -117,20 +110,13 @@ void qmp_job_finalize(const char *id, Error **errp)
     job_ref(job);
     job_finalize(job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
-     */
-    aio_context = job_get_aiocontext(job);
     job_unref(job);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job = find_job(id, errp);
 
     if (!job) {
         return;
@@ -138,9 +124,10 @@ void qmp_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
+/* Called with job_mutex held. */
 static JobInfo *job_query_single(Job *job, Error **errp)
 {
     JobInfo *info;
@@ -175,15 +162,15 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     for (job = job_next(NULL); job; job = job_next(job)) {
         JobInfo *value;
-        AioContext *aio_context;
 
         if (job_is_internal(job)) {
             continue;
         }
-        aio_context = job_get_aiocontext(job);
-        aio_context_acquire(aio_context);
+
+        job_lock();
         value = job_query_single(job, errp);
-        aio_context_release(aio_context);
+        job_unlock();
+
         if (!value) {
             qapi_free_JobInfoList(head);
             return NULL;
diff --git a/job.c b/job.c
index 48b304c3ff..e2006532b5 100644
--- a/job.c
+++ b/job.c
@@ -93,19 +93,22 @@ static void __attribute__((__constructor__)) job_init(void)
     qemu_mutex_init(&job_mutex);
 }
 
+/* Does not need job_mutex */
 AioContext *job_get_aiocontext(Job *job)
 {
-    return job->aio_context;
+    return qatomic_read(&job->aio_context);
 }
 
+/* Does not need job_mutex */
 void job_set_aiocontext(Job *job, AioContext *aio)
 {
-    job->aio_context = aio;
+    qatomic_set(&job->aio_context, aio);
 }
 
+/* Called with job_mutex held. */
 bool job_is_busy(Job *job)
 {
-    return qatomic_read(&job->busy);
+    return job->busy;
 }
 
 /* Called with job_mutex held. */
@@ -124,59 +127,75 @@ int job_get_ret(Job *job)
     return ret;
 }
 
+/* Called with job_mutex held. */
 Error *job_get_err(Job *job)
 {
     return job->err;
 }
 
+/* Called with job_mutex held. */
 JobStatus job_get_status(Job *job)
 {
     return job->status;
 }
-
+/* Called with job_mutex *not* held. */
 void job_set_cancelled(Job *job, bool cancel)
 {
+    job_lock();
     job->cancelled = cancel;
+    job_unlock();
 }
 
+/* Called with job_mutex *not* held. */
 bool job_is_force_cancel(Job *job)
 {
-    return job->force_cancel;
+    bool ret;
+    job_lock();
+    ret = job->force_cancel;
+    job_unlock();
+    return ret;
 }
 
+/* Does not need job_mutex */
 JobTxn *job_txn_new(void)
 {
     JobTxn *txn = g_new0(JobTxn, 1);
     QLIST_INIT(&txn->jobs);
-    txn->refcnt = 1;
+    qatomic_set(&txn->refcnt, 1);
     return txn;
 }
 
+/* Does not need job_mutex */
 static void job_txn_ref(JobTxn *txn)
 {
-    txn->refcnt++;
+    qatomic_inc(&txn->refcnt);
 }
 
+/* Does not need job_mutex */
 void job_txn_unref(JobTxn *txn)
 {
-    if (txn && --txn->refcnt == 0) {
+    if (txn && qatomic_dec_fetch(&txn->refcnt) == 0) {
         g_free(txn);
     }
 }
 
+/* Called with job_mutex *not* held. */
 void job_txn_add_job(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
     }
 
+    job_lock();
     assert(!job->txn);
     job->txn = txn;
 
     QLIST_INSERT_HEAD(&txn->jobs, job, txn_list);
+    job_unlock();
     job_txn_ref(txn);
 }
 
+/* Called with job_mutex held. */
 static void job_txn_del_job(Job *job)
 {
     if (job->txn) {
@@ -186,6 +205,7 @@ static void job_txn_del_job(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static int job_txn_apply(Job *job, int fn(Job *))
 {
     AioContext *inner_ctx;
@@ -221,11 +241,13 @@ static int job_txn_apply(Job *job, int fn(Job *))
     return rc;
 }
 
+/* Does not need job_mutex */
 bool job_is_internal(Job *job)
 {
     return (job->id == NULL);
 }
 
+/* Called with job_mutex held. */
 static void job_state_transition(Job *job, JobStatus s1)
 {
     JobStatus s0 = job->status;
@@ -241,6 +263,7 @@ static void job_state_transition(Job *job, JobStatus s1)
     }
 }
 
+/* Called with job_mutex held. */
 int job_apply_verb(Job *job, JobVerb verb, Error **errp)
 {
     JobStatus s0 = job->status;
@@ -255,11 +278,13 @@ int job_apply_verb(Job *job, JobVerb verb, Error **errp)
     return -EPERM;
 }
 
+/* Does not need job_mutex. Value is never modified */
 JobType job_type(const Job *job)
 {
     return job->driver->job_type;
 }
 
+/* Does not need job_mutex. Value is never modified */
 const char *job_type_str(const Job *job)
 {
     return JobType_str(job_type(job));
@@ -353,24 +378,34 @@ static bool job_started(Job *job)
     return job->co;
 }
 
+/* Called with job_mutex held. */
 bool job_should_pause(Job *job)
 {
     return job->pause_count > 0;
 }
 
+/* Called with job_mutex held. */
 bool job_is_paused(Job *job)
 {
     return job->paused;
 }
 
+/* Called with job_mutex *not* held. */
 Job *job_next(Job *job)
 {
+    Job *ret;
+    job_lock();
     if (!job) {
-        return QLIST_FIRST(&jobs);
+        ret = QLIST_FIRST(&jobs);
+        job_unlock();
+        return ret;
     }
-    return QLIST_NEXT(job, job_list);
+    ret = QLIST_NEXT(job, job_list);
+    job_unlock();
+    return ret;
 }
 
+/* Called with job_mutex held. */
 Job *job_get(const char *id)
 {
     Job *job;
@@ -388,13 +423,14 @@ Job *job_get(const char *id)
     return NULL;
 }
 
+/* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
     Job *job = opaque;
-
     job_enter(job);
 }
 
+/* Called with job_mutex *not* held. */
 void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                  AioContext *ctx, int flags, BlockCompletionFunc *cb,
                  void *opaque, Error **errp)
@@ -449,6 +485,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
                    job_sleep_timer_cb, job);
 
     QLIST_INSERT_HEAD(&jobs, job, job_list);
+    job_unlock();
 
     /* Single jobs are modeled as single-job transactions for sake of
      * consolidating the job management logic */
@@ -463,11 +500,13 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     return job;
 }
 
+/* Called with job_mutex held. */
 void job_ref(Job *job)
 {
     ++job->refcnt;
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 void job_unref(Job *job)
 {
     if (--job->refcnt == 0) {
@@ -476,7 +515,9 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            job_unlock();
             job->driver->free(job);
+            job_lock();
         }
 
         QLIST_REMOVE(job, job_list);
@@ -488,46 +529,55 @@ void job_unref(Job *job)
     }
 }
 
+/* API is thread safe */
 void job_progress_update(Job *job, uint64_t done)
 {
     progress_work_done(&job->progress, done);
 }
 
+/* API is thread safe */
 void job_progress_set_remaining(Job *job, uint64_t remaining)
 {
     progress_set_remaining(&job->progress, remaining);
 }
 
+/* API is thread safe */
 void job_progress_increase_remaining(Job *job, uint64_t delta)
 {
     progress_increase_remaining(&job->progress, delta);
 }
 
+/* Called with job_mutex held. */
 void job_event_cancelled(Job *job)
 {
     notifier_list_notify(&job->on_finalize_cancelled, job);
 }
 
+/* Called with job_mutex held. */
 void job_event_completed(Job *job)
 {
     notifier_list_notify(&job->on_finalize_completed, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_pending(Job *job)
 {
     notifier_list_notify(&job->on_pending, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_ready(Job *job)
 {
     notifier_list_notify(&job->on_ready, job);
 }
 
+/* Called with job_mutex held. */
 static void job_event_idle(Job *job)
 {
     notifier_list_notify(&job->on_idle, job);
 }
 
+/* Called with job_mutex held, but releases it temporarly. */
 void job_enter_cond(Job *job, bool(*fn)(Job *job))
 {
     if (!job_started(job)) {
@@ -537,14 +587,11 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    job_lock();
     if (job->busy) {
-        job_unlock();
         return;
     }
 
     if (fn && !fn(job)) {
-        job_unlock();
         return;
     }
 
@@ -552,7 +599,8 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
     timer_del(&job->sleep_timer);
     job->busy = true;
     job_unlock();
-    aio_co_enter(job->aio_context, job->co);
+    aio_co_enter(job_get_aiocontext(job), job->co);
+    job_lock();
 }
 
 /* Called with job_mutex held. */
@@ -565,7 +613,7 @@ void job_enter_locked(Job *job)
 void job_enter(Job *job)
 {
     job_lock();
-    job_enter_locked(job, NULL);
+    job_enter_locked(job);
     job_unlock();
 }
 
@@ -574,7 +622,11 @@ void job_enter(Job *job)
  * is allowed and cancels the timer.
  *
  * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
- * called explicitly. */
+ * called explicitly.
+ *
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
     job_lock();
@@ -587,86 +639,122 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     qemu_coroutine_yield();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
+    job_lock();
     assert(job->busy);
+    job_unlock();
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
 void coroutine_fn job_pause_point(Job *job)
 {
     assert(job && job_started(job));
 
+    job_lock();
     if (!job_should_pause(job)) {
+        job_unlock();
         return;
     }
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
+        job_unlock();
         return;
     }
 
     if (job->driver->pause) {
+        job_unlock();
         job->driver->pause(job);
+        job_lock();
     }
 
-    if (job_should_pause(job) && !job_is_cancelled(job)) {
+    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
         JobStatus status = job->status;
         job_state_transition(job, status == JOB_STATUS_READY
                                   ? JOB_STATUS_STANDBY
                                   : JOB_STATUS_PAUSED);
         job->paused = true;
+        job_unlock();
         job_do_yield(job, -1);
+        job_lock();
         job->paused = false;
         job_state_transition(job, status);
     }
+    job_unlock();
 
     if (job->driver->resume) {
         job->driver->resume(job);
     }
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
 void job_yield(Job *job)
 {
+    bool res;
+    job_lock();
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
+        job_unlock();
         return;
     }
 
-    if (!job_should_pause(job)) {
+    res = job_should_pause(job);
+    job_unlock();
+
+    if (!res) {
         job_do_yield(job, -1);
     }
 
     job_pause_point(job);
 }
 
+/*
+ * Called with job_mutex *not* held (we don't want the coroutine
+ * to yield with the lock held!).
+ */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
+    bool res;
+    job_lock();
     assert(job->busy);
 
     /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled(job)) {
+    if (job_is_cancelled_locked(job)) {
+        job_unlock();
         return;
     }
 
-    if (!job_should_pause(job)) {
+    res = job_should_pause(job);
+    job_unlock();
+
+    if (!res) {
         job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
     }
 
     job_pause_point(job);
 }
 
-/* Assumes the block_job_mutex is held */
+/* Called with job_mutex held. */
 static bool job_timer_not_pending(Job *job)
 {
     return !timer_pending(&job->sleep_timer);
 }
 
+/* Called with job_mutex held. */
 void job_pause(Job *job)
 {
     job->pause_count++;
     if (!job->paused) {
-        job_enter(job);
+        job_enter_locked(job);
     }
 }
 
+/* Called with job_mutex held. */
 void job_resume(Job *job)
 {
     assert(job->pause_count > 0);
@@ -679,6 +767,7 @@ void job_resume(Job *job)
     job_enter_cond(job, job_timer_not_pending);
 }
 
+/* Called with job_mutex held. */
 void job_user_pause(Job *job, Error **errp)
 {
     if (job_apply_verb(job, JOB_VERB_PAUSE, errp)) {
@@ -692,16 +781,19 @@ void job_user_pause(Job *job, Error **errp)
     job_pause(job);
 }
 
+/* Called with job_mutex held. */
 bool job_user_paused(Job *job)
 {
     return job->user_paused;
 }
 
+/* Called with job_mutex held. */
 void job_set_user_paused(Job *job)
 {
     job->user_paused = true;
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 void job_user_resume(Job *job, Error **errp)
 {
     assert(job);
@@ -713,12 +805,15 @@ void job_user_resume(Job *job, Error **errp)
         return;
     }
     if (job->driver->user_resume) {
+        job_unlock();
         job->driver->user_resume(job);
+        job_lock();
     }
     job->user_paused = false;
     job_resume(job);
 }
 
+/* Called with job_mutex held. */
 static void job_do_dismiss(Job *job)
 {
     assert(job);
@@ -732,6 +827,7 @@ static void job_do_dismiss(Job *job)
     job_unref(job);
 }
 
+/* Called with job_mutex held. */
 void job_dismiss(Job **jobptr, Error **errp)
 {
     Job *job = *jobptr;
@@ -761,9 +857,10 @@ static void job_conclude(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static void job_update_rc(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_is_cancelled_locked(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
@@ -774,22 +871,25 @@ static void job_update_rc(Job *job)
     }
 }
 
+/* Called with job_mutex *not* held. */
 static void job_commit(Job *job)
 {
-    assert(!job->ret);
+    assert(!job_get_ret(job));
     if (job->driver->commit) {
         job->driver->commit(job);
     }
 }
 
+/* Called with job_mutex *not* held. */
 static void job_abort(Job *job)
 {
-    assert(job->ret);
+    assert(job_get_ret(job));
     if (job->driver->abort) {
         job->driver->abort(job);
     }
 }
 
+/* Called with job_mutex *not* held. */
 static void job_clean(Job *job)
 {
     if (job->driver->clean) {
@@ -797,14 +897,18 @@ static void job_clean(Job *job)
     }
 }
 
+/* Called with job lock held, but it releases it temporarily */
 static int job_finalize_single(Job *job)
 {
-    assert(job_is_completed(job));
+    int ret;
+    assert(job_is_completed_locked(job));
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
 
-    if (!job->ret) {
+    ret = job->ret;
+    job_unlock();
+    if (!ret) {
         job_commit(job);
     } else {
         job_abort(job);
@@ -812,12 +916,13 @@ static int job_finalize_single(Job *job)
     job_clean(job);
 
     if (job->cb) {
-        job->cb(job->opaque, job->ret);
+        job->cb(job->opaque, ret);
     }
+    job_lock();
 
     /* Emit events only if we actually started */
     if (job_started(job)) {
-        if (job_is_cancelled(job)) {
+        if (job_is_cancelled_locked(job)) {
             job_event_cancelled(job);
         } else {
             job_event_completed(job);
@@ -829,15 +934,20 @@ static int job_finalize_single(Job *job)
     return 0;
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 static void job_cancel_async(Job *job, bool force)
 {
     if (job->driver->cancel) {
+        job_unlock();
         job->driver->cancel(job, force);
+        job_lock();
     }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
+            job_unlock();
             job->driver->user_resume(job);
+            job_lock();
         }
         job->user_paused = false;
         assert(job->pause_count > 0);
@@ -848,27 +958,21 @@ static void job_cancel_async(Job *job, bool force)
     job->force_cancel |= force;
 }
 
+/* Called with job_mutex held. */
 static void job_completed_txn_abort(Job *job)
 {
-    AioContext *outer_ctx = job->aio_context;
     AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
 
-    if (txn->aborting) {
+    if (qatomic_cmpxchg(&txn->aborting, false, true)) {
         /*
          * We are cancelled by another job, which will handle everything.
          */
         return;
     }
-    txn->aborting = true;
     job_txn_ref(txn);
 
-    /* We can only hold the single job's AioContext lock while calling
-     * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise. */
-    aio_context_release(outer_ctx);
-
     /* Other jobs are effectively cancelled by us, set the status for
      * them; this job, however, may or may not be cancelled, depending
      * on the caller, so leave it. */
@@ -884,33 +988,39 @@ static void job_completed_txn_abort(Job *job)
         other_job = QLIST_FIRST(&txn->jobs);
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
-        if (!job_is_completed(other_job)) {
-            assert(job_is_cancelled(other_job));
+        if (!job_is_completed_locked(other_job)) {
+            assert(job_is_cancelled_locked(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
         aio_context_release(ctx);
     }
 
-    aio_context_acquire(outer_ctx);
-
     job_txn_unref(txn);
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 static int job_prepare(Job *job)
 {
+    int ret;
+
     if (job->ret == 0 && job->driver->prepare) {
-        job->ret = job->driver->prepare(job);
+        job_unlock();
+        ret = job->driver->prepare(job);
+        job_lock();
+        job->ret = ret;
         job_update_rc(job);
     }
     return job->ret;
 }
 
+/* Does not need job_mutex */
 static int job_needs_finalize(Job *job)
 {
     return !job->auto_finalize;
 }
 
+/* Called with job_mutex held. */
 static void job_do_finalize(Job *job)
 {
     int rc;
@@ -925,6 +1035,7 @@ static void job_do_finalize(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 void job_finalize(Job *job, Error **errp)
 {
     assert(job && job->id);
@@ -934,6 +1045,7 @@ void job_finalize(Job *job, Error **errp)
     job_do_finalize(job);
 }
 
+/* Called with job_mutex held. */
 static int job_transition_to_pending(Job *job)
 {
     job_state_transition(job, JOB_STATUS_PENDING);
@@ -943,17 +1055,22 @@ static int job_transition_to_pending(Job *job)
     return 0;
 }
 
+/* Called with job_mutex *not* held. */
 void job_transition_to_ready(Job *job)
 {
+    job_lock();
     job_state_transition(job, JOB_STATUS_READY);
     job_event_ready(job);
+    job_unlock();
 }
 
+/* Called with job_mutex held. */
 static void job_completed_txn_success(Job *job)
 {
-    JobTxn *txn = job->txn;
+    JobTxn *txn;
     Job *other_job;
 
+    txn = job->txn;
     job_state_transition(job, JOB_STATUS_WAITING);
 
     /*
@@ -961,7 +1078,7 @@ static void job_completed_txn_success(Job *job)
      * txn.
      */
     QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
-        if (!job_is_completed(other_job)) {
+        if (!job_is_completed_locked(other_job)) {
             return;
         }
         assert(other_job->ret == 0);
@@ -975,9 +1092,10 @@ static void job_completed_txn_success(Job *job)
     }
 }
 
+/* Called with job_mutex held. */
 static void job_completed(Job *job)
 {
-    assert(job && job->txn && !job_is_completed(job));
+    assert(job && job->txn && !job_is_completed_locked(job));
 
     job_update_rc(job);
     trace_job_completed(job, job->ret);
@@ -988,14 +1106,16 @@ static void job_completed(Job *job)
     }
 }
 
-/** Useful only as a type shim for aio_bh_schedule_oneshot. */
+/**
+ * Useful only as a type shim for aio_bh_schedule_oneshot.
+ *  Called with job_mutex *not* held.
+ */
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
-    AioContext *ctx;
 
+    job_lock();
     job_ref(job);
-    aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
      * callbacks. However, completion callbacks tend to involve operations that
@@ -1012,29 +1132,40 @@ static void job_exit(void *opaque)
      * acquiring the new lock, and we ref/unref to avoid job_completed freeing
      * the job underneath us.
      */
-    ctx = job->aio_context;
     job_unref(job);
-    aio_context_release(ctx);
+    job_unlock();
 }
 
 /**
  * All jobs must allow a pause point before entering their job proper. This
  * ensures that jobs can be paused prior to being started, then resumed later.
+ *
+ * Called with job_mutex *not* held.
  */
 static void coroutine_fn job_co_entry(void *opaque)
 {
     Job *job = opaque;
+    Error *local_error = NULL;
+    int ret;
 
     assert(job && job->driver && job->driver->run);
     job_pause_point(job);
-    job->ret = job->driver->run(job, &job->err);
+    ret = job->driver->run(job, &local_error);
+    job_lock();
+    if (local_error) {
+        error_propagate(&job->err, local_error);
+    }
+    job->ret = ret;
     job->deferred_to_main_loop = true;
     job->busy = true;
+    job_unlock();
     aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
 }
 
+/* Called with job_mutex *not* held. */
 void job_start(Job *job)
 {
+    job_lock();
     assert(job && !job_started(job) && job->paused &&
            job->driver && job->driver->run);
     job->co = qemu_coroutine_create(job_co_entry, job);
@@ -1042,9 +1173,11 @@ void job_start(Job *job)
     job->busy = true;
     job->paused = false;
     job_state_transition(job, JOB_STATUS_RUNNING);
-    aio_co_enter(job->aio_context, job->co);
+    job_unlock();
+    aio_co_enter(job_get_aiocontext(job), job->co);
 }
 
+/* Called with job_mutex held. */
 void job_cancel(Job *job, bool force)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
@@ -1057,10 +1190,11 @@ void job_cancel(Job *job, bool force)
     } else if (job->deferred_to_main_loop) {
         job_completed_txn_abort(job);
     } else {
-        job_enter(job);
+        job_enter_locked(job);
     }
 }
 
+/* Called with job_mutex held. */
 void job_user_cancel(Job *job, bool force, Error **errp)
 {
     if (job_apply_verb(job, JOB_VERB_CANCEL, errp)) {
@@ -1069,19 +1203,36 @@ void job_user_cancel(Job *job, bool force, Error **errp)
     job_cancel(job, force);
 }
 
-/* A wrapper around job_cancel() taking an Error ** parameter so it may be
+/*
+ * A wrapper around job_cancel() taking an Error ** parameter so it may be
  * used with job_finish_sync() without the need for (rather nasty) function
- * pointer casts there. */
+ * pointer casts there.
+ *
+ * Called with job_mutex held.
+ */
 static void job_cancel_err(Job *job, Error **errp)
 {
     job_cancel(job, false);
 }
 
+/*
+ * Called with job_mutex *not* held, unlike most other APIs consumed
+ * by the monitor!
+ */
 int job_cancel_sync(Job *job)
 {
-    return job_finish_sync(job, &job_cancel_err, NULL);
+    int ret;
+
+    job_lock();
+    ret = job_finish_sync(job, &job_cancel_err, NULL);
+    job_unlock();
+    return ret;
 }
 
+/*
+ * Called with job_mutex *not* held, unlike most other APIs consumed
+ * by the monitor!
+ */
 void job_cancel_sync_all(void)
 {
     Job *job;
@@ -1095,11 +1246,13 @@ void job_cancel_sync_all(void)
     }
 }
 
+/* Called with job_mutex held. */
 int job_complete_sync(Job *job, Error **errp)
 {
     return job_finish_sync(job, job_complete, errp);
 }
 
+/* Called with job_mutex held. Temporarly releases the lock. */
 void job_complete(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
@@ -1107,15 +1260,18 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_is_cancelled(job) || !job->driver->complete) {
+    if (job_is_cancelled_locked(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
     }
 
+    job_unlock();
     job->driver->complete(job, errp);
+    job_lock();
 }
 
+/* Called with job_mutex held. */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
 {
     Error *local_err = NULL;
@@ -1132,10 +1288,12 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
         return -EBUSY;
     }
 
-    AIO_WAIT_WHILE(job->aio_context,
-                   (job_enter(job), !job_is_completed(job)));
+    job_unlock();
+    AIO_WAIT_WHILE(NULL, (job_enter(job), !job_is_completed(job)));
+    job_lock();
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
+    ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
+           -ECANCELED : job->ret;
     job_unref(job);
     return ret;
 }
diff --git a/qemu-img.c b/qemu-img.c
index d16bd367d9..82debde038 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -898,17 +898,19 @@ static void common_block_job_cb(void *opaque, int ret)
     }
 }
 
+/* Called with job_mutex held. Releases it temporarly */
 static void run_block_job(BlockJob *job, Error **errp)
 {
     uint64_t progress_current, progress_total;
     AioContext *aio_context = blk_get_aio_context(job->blk);
     int ret = 0;
 
-    aio_context_acquire(aio_context);
     job_ref(&job->job);
     do {
         float progress = 0.0f;
+        job_unlock();
         aio_poll(aio_context, true);
+        job_lock();
 
         progress_get_snapshot(&job->job.progress, &progress_current,
                               &progress_total);
@@ -916,15 +918,15 @@ static void run_block_job(BlockJob *job, Error **errp)
             progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
+    } while (!job_is_ready_locked(&job->job) &&
+             !job_is_completed_locked(&job->job));
 
-    if (!job_is_completed(&job->job)) {
+    if (!job_is_completed_locked(&job->job)) {
         ret = job_complete_sync(&job->job, errp);
     } else {
-        ret = job_get_ret(&job->job);
+        ret = job_get_ret_locked(&job->job);
     }
     job_unref(&job->job);
-    aio_context_release(aio_context);
 
     /* publish completion progress only when success */
     if (!ret) {
@@ -1076,9 +1078,12 @@ static int img_commit(int argc, char **argv)
         bdrv_ref(bs);
     }
 
+    job_lock();
     job = block_job_get("commit");
     assert(job);
     run_block_job(job, &local_err);
+    job_unlock();
+
     if (local_err) {
         goto unref_backing;
     }
-- 
2.31.1


