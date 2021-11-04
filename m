Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC8445602
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:05:52 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieJL-0005wW-I9
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8H-0003ee-8A
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8B-0006xa-RX
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ov/mehPNL/8B9RqNk/asIlDyOsWU3ie8LdI2BcgQhBk=;
 b=KV1QPb8t+EFrcWPGQ2LOVopFHjhTAGmvtRYkDXezG3nwO0JRy7DZLEv0biq5hrtxsf3ads
 rw+F96Ut0Ip6mzJl/EU/sI5ItJqiHX2/z8rC7okz8dMwTLPvzf9YypYgYgR84iZEUXTrgS
 yR4upBJeLIzAgiSXxqo+unSlkPXLlhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-t92zUXJjOL-3F05zt3hWsA-1; Thu, 04 Nov 2021 10:54:18 -0400
X-MC-Unique: t92zUXJjOL-3F05zt3hWsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D622D8066EB;
 Thu,  4 Nov 2021 14:54:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 764B66418A;
 Thu,  4 Nov 2021 14:54:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 14/14] job.c: enable job lock/unlock and remove
 Aiocontext locks
Date: Thu,  4 Nov 2021 10:53:34 -0400
Message-Id: <20211104145334.1346363-15-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Also remove _job_{lock/unlock}, as they are replaced by the
public functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h               |  7 ---
 block/replication.c              |  2 +
 blockdev.c                       | 62 ++++--------------------
 job-qmp.c                        | 38 ++++-----------
 job.c                            | 81 ++++----------------------------
 tests/unit/test-bdrv-drain.c     |  4 +-
 tests/unit/test-block-iothread.c |  2 +-
 tests/unit/test-blockjob.c       | 13 ++---
 8 files changed, 34 insertions(+), 175 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 58b3af47e3..d417e1b601 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -608,8 +608,6 @@ void job_user_cancel(Job *job, bool force, Error **errp);
  *
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
- *
- * Callers must hold the AioContext lock of job->aio_context.
  */
 int job_cancel_sync(Job *job, bool force);
 
@@ -633,9 +631,6 @@ void job_cancel_sync_all(void);
  * function).
  *
  * Returns the return value from the job.
- *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock.
  */
 int job_complete_sync(Job *job, Error **errp);
@@ -667,8 +662,6 @@ void job_dismiss(Job **job, Error **errp);
  * Returns 0 if the job is successfully completed, -ECANCELED if the job was
  * cancelled before completing, and -errno in other error cases.
  *
- * Callers must hold the AioContext lock of job->aio_context.
- *
  * Called between job_lock and job_unlock.
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
index 0bd79757fc..dfc73ef1bf 100644
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
 
@@ -3318,15 +3299,13 @@ out:
     aio_context_release(aio_context);
 }
 
-/* Get a block job using its ID and acquire its AioContext */
-static BlockJob *find_block_job(const char *id, AioContext **aio_context,
-                                Error **errp)
+/* Get a block job using its ID. Returns with job_lock held on success */
+static BlockJob *find_block_job(const char *id, Error **errp)
 {
     BlockJob *job;
 
     assert(id != NULL);
 
-    *aio_context = NULL;
     job_lock();
 
     job = block_job_get(id);
@@ -3338,31 +3317,25 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
         return NULL;
     }
 
-    *aio_context = blk_get_aio_context(job->blk);
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
 
     block_job_set_speed(job, speed, errp);
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
@@ -3381,14 +3354,12 @@ void qmp_block_job_cancel(const char *device,
     trace_qmp_block_job_cancel(job);
     job_user_cancel(&job->job, force, errp);
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
@@ -3396,14 +3367,12 @@ void qmp_block_job_pause(const char *device, Error **errp)
 
     trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
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
@@ -3411,14 +3380,12 @@ void qmp_block_job_resume(const char *device, Error **errp)
 
     trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
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
@@ -3426,14 +3393,12 @@ void qmp_block_job_complete(const char *device, Error **errp)
 
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
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
@@ -3443,21 +3408,13 @@ void qmp_block_job_finalize(const char *id, Error **errp)
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
     job_unlock();
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *bjob = find_block_job(id, &aio_context, errp);
+    BlockJob *bjob = find_block_job(id, errp);
     Job *job;
 
     if (!bjob) {
@@ -3467,7 +3424,6 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
diff --git a/job-qmp.c b/job-qmp.c
index 8f07c51db8..d592780953 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,12 +29,11 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/* Get a job using its ID. Returns with job_lock held on success. */
+static Job *find_job(const char *id, Error **errp)
 {
     Job *job;
 
-    *aio_context = NULL;
     job_lock();
 
     job = job_get(id);
@@ -44,16 +43,12 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
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
@@ -61,14 +56,12 @@ void qmp_job_cancel(const char *id, Error **errp)
 
     trace_qmp_job_cancel(job);
     job_user_cancel(job, true, errp);
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
@@ -76,14 +69,12 @@ void qmp_job_pause(const char *id, Error **errp)
 
     trace_qmp_job_pause(job);
     job_user_pause(job, errp);
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
@@ -91,14 +82,12 @@ void qmp_job_resume(const char *id, Error **errp)
 
     trace_qmp_job_resume(job);
     job_user_resume(job, errp);
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
@@ -106,14 +95,12 @@ void qmp_job_complete(const char *id, Error **errp)
 
     trace_qmp_job_complete(job);
     job_complete(job, errp);
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
@@ -123,21 +110,13 @@ void qmp_job_finalize(const char *id, Error **errp)
     job_ref(job);
     job_finalize(job, errp);
 
-    /*
-     * Job's context might have changed via job_finalize (and job_txn_apply
-     * automatically acquires the new one), so make sure we release the correct
-     * one.
-     */
-    aio_context = job->aio_context;
     job_unref(job);
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
@@ -145,7 +124,6 @@ void qmp_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
     job_unlock();
 }
 
diff --git a/job.c b/job.c
index 5efbf38a72..f225e770f5 100644
--- a/job.c
+++ b/job.c
@@ -98,26 +98,16 @@ struct JobTxn {
     int refcnt;
 };
 
-#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
+#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
 
-#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
+#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
 
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
-static void _job_lock(void)
 {
     qemu_mutex_lock(&job_mutex);
 }
 
-static void _job_unlock(void)
+void job_unlock(void)
 {
     qemu_mutex_unlock(&job_mutex);
 }
@@ -185,7 +175,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * break AIO_WAIT_WHILE from within fn.
      */
     job_ref(job);
-    aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
         rc = fn(other_job);
@@ -194,11 +183,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
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
@@ -494,7 +478,10 @@ void job_unref(Job *job)
 
         if (job->driver->free) {
             job_unlock();
+            /* FIXME: aiocontext lock is required because cb calls blk_unref */
+            aio_context_acquire(job->aio_context);
             job->driver->free(job);
+            aio_context_release(job->aio_context);
             job_lock();
         }
 
@@ -570,21 +557,17 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    _job_lock();
     if (job->busy) {
-        _job_unlock();
         return;
     }
 
     if (fn && !fn(job)) {
-        _job_unlock();
         return;
     }
 
     assert(!job->deferred_to_main_loop);
     timer_del(&job->sleep_timer);
     job->busy = true;
-    _job_unlock();
     job_unlock();
     aio_co_enter(job->aio_context, job->co);
     job_lock();
@@ -608,13 +591,11 @@ void job_enter(Job *job)
  */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
-    _job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
     }
     job->busy = false;
     job_event_idle(job);
-    _job_unlock();
     job_unlock();
     qemu_coroutine_yield();
     job_lock();
@@ -962,7 +943,6 @@ static void job_cancel_async(Job *job, bool force)
 /* Called with job_mutex held. */
 static void job_completed_txn_abort(Job *job)
 {
-    AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
 
@@ -975,54 +955,28 @@ static void job_completed_txn_abort(Job *job)
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
 
@@ -1142,11 +1096,7 @@ static void job_completed(Job *job)
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
-    AioContext *ctx;
-
     JOB_LOCK_GUARD();
-    job_ref(job);
-    aio_context_acquire(job->aio_context);
 
     /* This is a lie, we're not quiescent, but still doing the completion
      * callbacks. However, completion callbacks tend to involve operations that
@@ -1156,16 +1106,6 @@ static void job_exit(void *opaque)
     job_event_idle(job);
 
     job_completed(job);
-
-    /*
-     * Note that calling job_completed can move the job to a different
-     * aio_context, so we cannot cache from above. job_txn_apply takes care of
-     * acquiring the new lock, and we ref/unref to avoid job_completed freeing
-     * the job underneath us.
-     */
-    ctx = job->aio_context;
-    job_unref(job);
-    aio_context_release(ctx);
 }
 
 /**
@@ -1279,14 +1219,10 @@ int job_cancel_sync(Job *job, bool force)
 void job_cancel_sync_all(void)
 {
     Job *job;
-    AioContext *aio_context;
 
     JOB_LOCK_GUARD();
     while ((job = job_next(NULL))) {
-        aio_context = job->aio_context;
-        aio_context_acquire(aio_context);
         job_cancel_sync(job, true);
-        aio_context_release(aio_context);
     }
 }
 
@@ -1331,8 +1267,9 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
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


