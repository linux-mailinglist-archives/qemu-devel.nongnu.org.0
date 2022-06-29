Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F53560396
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:49:04 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Z03-0005Si-Aa
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YU7-0007xl-2x
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTx-00025o-25
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656512152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNYq0gSSV9cw0Omn6iltZyOpbe1HatzX1nkQ2ELMevI=;
 b=b77/KZz/EQGuaUxRsdYIGDBG9liTNypNr53TukNs903qUxb5JmPgUgbN+QkuGKUFR5VS7I
 02uFDPiss4mHg3GP1I0lTIBpbSpp/qoHmVz3dW/aZtCrL8VIZpuE9+Hv7mtdii0PBQEZoA
 chmsL1BfbDctH+e2HquJlY8VjYKGPPo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-BbXQYX8RMju_DCwze9Grdg-1; Wed, 29 Jun 2022 10:15:49 -0400
X-MC-Unique: BbXQYX8RMju_DCwze9Grdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B13BF3C0F38D;
 Wed, 29 Jun 2022 14:15:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6105D18EAB;
 Wed, 29 Jun 2022 14:15:47 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v8 13/20] jobs: group together API calls under the same job
 lock
Date: Wed, 29 Jun 2022 10:15:31 -0400
Message-Id: <20220629141538.3400679-14-eesposit@redhat.com>
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the API offers also _locked() functions, take advantage
of it and give also the caller control to take the lock and call
_locked functions.

This makes sense especially when we have for loops, because it
makes no sense to have:

for(job = job_next(); ...)

where each job_next() takes the lock internally.
Instead we want

JOB_LOCK_GUARD();
for(job = job_next_locked(); ...)

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c            | 20 +++++++++++-------
 blockdev.c         | 12 ++++++++---
 blockjob.c         | 52 +++++++++++++++++++++++++++++++---------------
 job-qmp.c          |  4 +++-
 job.c              | 13 +++++++-----
 monitor/qmp-cmds.c |  7 +++++--
 qemu-img.c         | 41 +++++++++++++++++++++---------------
 7 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/block.c b/block.c
index 2c00dddd80..d0db104d71 100644
--- a/block.c
+++ b/block.c
@@ -4978,9 +4978,12 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
-    assert(job_next(NULL) == NULL);
     GLOBAL_STATE_CODE();
 
+    WITH_JOB_LOCK_GUARD() {
+        assert(job_next_locked(NULL) == NULL);
+    }
+
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
     bdrv_drain_all();
@@ -6165,13 +6168,16 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         }
     }
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        GSList *el;
+    WITH_JOB_LOCK_GUARD() {
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
+            GSList *el;
 
-        xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
-                           job->job.id);
-        for (el = job->nodes; el; el = el->next) {
-            xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
+            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
+                                job->job.id);
+            for (el = job->nodes; el; el = el->next) {
+                xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
+            }
         }
     }
 
diff --git a/blockdev.c b/blockdev.c
index 71f793c4ab..5b79093155 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
         return;
     }
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    JOB_LOCK_GUARD();
+
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
 
-            job_cancel(&job->job, false);
+            job_cancel_locked(&job->job, false);
 
             aio_context_release(aio_context);
         }
@@ -3745,7 +3748,10 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    JOB_LOCK_GUARD();
+
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         BlockJobInfo *value;
         AioContext *aio_context;
 
diff --git a/blockjob.c b/blockjob.c
index 70952879d8..1075def475 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -99,7 +99,9 @@ static char *child_job_get_parent_desc(BdrvChild *c)
 static void child_job_drained_begin(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
-    job_pause(&job->job);
+    WITH_JOB_LOCK_GUARD() {
+        job_pause_locked(&job->job);
+    }
 }
 
 static bool child_job_drained_poll(BdrvChild *c)
@@ -111,8 +113,10 @@ static bool child_job_drained_poll(BdrvChild *c)
     /* An inactive or completed job doesn't have any pending requests. Jobs
      * with !job->busy are either already paused or have a pause point after
      * being reentered, so no job driver code will run before they pause. */
-    if (!job->busy || job_is_completed(job)) {
-        return false;
+    WITH_JOB_LOCK_GUARD() {
+        if (!job->busy || job_is_completed_locked(job)) {
+            return false;
+        }
     }
 
     /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
@@ -127,7 +131,9 @@ static bool child_job_drained_poll(BdrvChild *c)
 static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
 {
     BlockJob *job = c->opaque;
-    job_resume(&job->job);
+    WITH_JOB_LOCK_GUARD() {
+        job_resume_locked(&job->job);
+    }
 }
 
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
@@ -480,13 +486,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job->ready_notifier.notify = block_job_event_ready_locked;
     job->idle_notifier.notify = block_job_on_idle_locked;
 
-    notifier_list_add(&job->job.on_finalize_cancelled,
-                      &job->finalize_cancelled_notifier);
-    notifier_list_add(&job->job.on_finalize_completed,
-                      &job->finalize_completed_notifier);
-    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
-    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
-    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
+    WITH_JOB_LOCK_GUARD() {
+        notifier_list_add(&job->job.on_finalize_cancelled,
+                          &job->finalize_cancelled_notifier);
+        notifier_list_add(&job->job.on_finalize_completed,
+                          &job->finalize_completed_notifier);
+        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
+        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
+        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
+    }
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
@@ -498,7 +506,10 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    if (!block_job_set_speed(job, speed, errp)) {
+    WITH_JOB_LOCK_GUARD() {
+        ret = block_job_set_speed_locked(job, speed, errp);
+    }
+    if (!ret) {
         goto fail;
     }
 
@@ -529,7 +540,9 @@ void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
     GLOBAL_STATE_CODE();
-    block_job_iostatus_reset(bjob);
+    WITH_JOB_LOCK_GUARD() {
+        block_job_iostatus_reset_locked(bjob);
+    }
 }
 
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
@@ -563,10 +576,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         action);
     }
     if (action == BLOCK_ERROR_ACTION_STOP) {
-        if (!job->job.user_paused) {
-            job_pause(&job->job);
-            /* make the pause user visible, which will be resumed from QMP. */
-            job->job.user_paused = true;
+        WITH_JOB_LOCK_GUARD() {
+            if (!job->job.user_paused) {
+                job_pause_locked(&job->job);
+                /*
+                 * make the pause user visible, which will be
+                 * resumed from QMP.
+                 */
+                job->job.user_paused = true;
+            }
         }
         block_job_iostatus_set_err(job, error);
     }
diff --git a/job-qmp.c b/job-qmp.c
index 8ce3b7965e..6eff7016b2 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -192,7 +192,9 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
-    for (job = job_next(NULL); job; job = job_next(job)) {
+    JOB_LOCK_GUARD();
+
+    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
         AioContext *aio_context;
 
diff --git a/job.c b/job.c
index 7a3cc93f66..19d711dc73 100644
--- a/job.c
+++ b/job.c
@@ -1045,11 +1045,14 @@ static void job_completed_txn_abort_locked(Job *job)
 /* Called with job_mutex held, but releases it temporarily */
 static int job_prepare_locked(Job *job)
 {
+    int ret;
+
     GLOBAL_STATE_CODE();
     if (job->ret == 0 && job->driver->prepare) {
         job_unlock();
-        job->ret = job->driver->prepare(job);
+        ret = job->driver->prepare(job);
         job_lock();
+        job->ret = ret;
         job_update_rc_locked(job);
     }
     return job->ret;
@@ -1235,10 +1238,10 @@ void job_cancel_locked(Job *job, bool force)
          * job_cancel_async() ignores soft-cancel requests for jobs
          * that are already done (i.e. deferred to the main loop).  We
          * have to check again whether the job is really cancelled.
-         * (job_cancel_requested() and job_is_cancelled() are equivalent
-         * here, because job_cancel_async() will make soft-cancel
-         * requests no-ops when deferred_to_main_loop is true.  We
-         * choose to call job_is_cancelled() to show that we invoke
+         * (job_cancel_requested_locked() and job_is_cancelled_locked()
+         * are equivalent here, because job_cancel_async() will
+         * make soft-cancel requests no-ops when deferred_to_main_loop is true.
+         * We choose to call job_is_cancelled_locked() to show that we invoke
          * job_completed_txn_abort() only for force-cancelled jobs.)
          */
         if (job_is_cancelled_locked(job)) {
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 1ebb89f46c..1897ed7a13 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -133,8 +133,11 @@ void qmp_cont(Error **errp)
         blk_iostatus_reset(blk);
     }
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        block_job_iostatus_reset(job);
+    WITH_JOB_LOCK_GUARD() {
+        for (job = block_job_next_locked(NULL); job;
+             job = block_job_next_locked(job)) {
+            block_job_iostatus_reset_locked(job);
+        }
     }
 
     /* Continuing after completed migration. Images have been inactivated to
diff --git a/qemu-img.c b/qemu-img.c
index 4cf4d2423d..289d88a156 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
     int ret = 0;
 
     aio_context_acquire(aio_context);
-    job_ref(&job->job);
-    do {
-        float progress = 0.0f;
-        aio_poll(aio_context, true);
+    WITH_JOB_LOCK_GUARD() {
+        job_ref_locked(&job->job);
+        do {
+            float progress = 0.0f;
+            job_unlock();
+            aio_poll(aio_context, true);
+
+            progress_get_snapshot(&job->job.progress, &progress_current,
+                                &progress_total);
+            if (progress_total) {
+                progress = (float)progress_current / progress_total * 100.f;
+            }
+            qemu_progress_print(progress, 0);
+            job_lock();
+        } while (!job_is_ready_locked(&job->job) &&
+                 !job_is_completed_locked(&job->job));
 
-        progress_get_snapshot(&job->job.progress, &progress_current,
-                              &progress_total);
-        if (progress_total) {
-            progress = (float)progress_current / progress_total * 100.f;
+        if (!job_is_completed_locked(&job->job)) {
+            ret = job_complete_sync_locked(&job->job, errp);
+        } else {
+            ret = job->job.ret;
         }
-        qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
-
-    if (!job_is_completed(&job->job)) {
-        ret = job_complete_sync(&job->job, errp);
-    } else {
-        ret = job->job.ret;
+        job_unref_locked(&job->job);
     }
-    job_unref(&job->job);
     aio_context_release(aio_context);
 
     /* publish completion progress only when success */
@@ -1083,7 +1088,9 @@ static int img_commit(int argc, char **argv)
         bdrv_ref(bs);
     }
 
-    job = block_job_get("commit");
+    WITH_JOB_LOCK_GUARD() {
+        job = block_job_get_locked("commit");
+    }
     assert(job);
     run_block_job(job, &local_err);
     if (local_err) {
-- 
2.31.1


