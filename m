Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8325E9E61
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:53:44 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocko3-0000f4-SE
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTe-0004qx-FB
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTS-0000I8-Ux
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhuGqqsKp/Kv7xpRZpYrfp9gdJs5Er8o/DGIYrHmh7k=;
 b=Yy1y164u7UYGiNjnrOa9Fv+5dJTamjJsXPKt21GZYNwzNrFtv6fEYCk5d4s8AmsfqAAsV/
 22bM2QytxNrt+s6UcwiVyhXjqQAyEPFqpX7/wgGihZAH7LDQNrg9TAoj5MmVubI+WupFuk
 Bhe9fvxMRyfYY1OtWxw4GZBW5uIAu84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-OOvOcLMXNQu01Fh2fm8gPw-1; Mon, 26 Sep 2022 05:32:22 -0400
X-MC-Unique: OOvOcLMXNQu01Fh2fm8gPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D41D882828;
 Mon, 26 Sep 2022 09:32:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94F349BB65;
 Mon, 26 Sep 2022 09:32:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v12 11/21] jobs: group together API calls under the same job
 lock
Date: Mon, 26 Sep 2022 05:32:04 -0400
Message-Id: <20220926093214.506243-12-eesposit@redhat.com>
In-Reply-To: <20220926093214.506243-1-eesposit@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

In addition, protect also direct field accesses, by either creating a
new critical section or widening the existing ones.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block.c            | 17 ++++++++++-------
 blockdev.c         | 14 ++++++++++----
 blockjob.c         | 35 ++++++++++++++++++++++-------------
 job-qmp.c          |  9 ++++++---
 monitor/qmp-cmds.c |  7 +++++--
 qemu-img.c         | 15 ++++++++++-----
 6 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..2c6a4f62c9 100644
--- a/block.c
+++ b/block.c
@@ -4980,8 +4980,8 @@ static void bdrv_close(BlockDriverState *bs)
 
 void bdrv_close_all(void)
 {
-    assert(job_next(NULL) == NULL);
     GLOBAL_STATE_CODE();
+    assert(job_next(NULL) == NULL);
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
@@ -6167,13 +6167,16 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
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
index 2e941e2979..46090bb0aa 100644
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
@@ -3756,7 +3759,10 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
     BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;
 
-    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+    JOB_LOCK_GUARD();
+
+    for (job = block_job_next_locked(NULL); job;
+         job = block_job_next_locked(job)) {
         BlockJobInfo *value;
         AioContext *aio_context;
 
@@ -3765,7 +3771,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
         }
         aio_context = block_job_get_aio_context(job);
         aio_context_acquire(aio_context);
-        value = block_job_query(job, errp);
+        value = block_job_query_locked(job, errp);
         aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
diff --git a/blockjob.c b/blockjob.c
index 0d59aba439..96fb9d9f73 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -111,8 +111,10 @@ static bool child_job_drained_poll(BdrvChild *c)
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
@@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job->ready_notifier.notify = block_job_event_ready;
     job->idle_notifier.notify = block_job_on_idle;
 
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
@@ -558,10 +562,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
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
index b1c456482a..393d3a5b81 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -164,7 +164,8 @@ void qmp_job_dismiss(const char *id, Error **errp)
     aio_context_release(aio_context);
 }
 
-static JobInfo *job_query_single(Job *job, Error **errp)
+/* Called with job_mutex held. */
+static JobInfo *job_query_single_locked(Job *job, Error **errp)
 {
     JobInfo *info;
     uint64_t progress_current;
@@ -194,7 +195,9 @@ JobInfoList *qmp_query_jobs(Error **errp)
     JobInfoList *head = NULL, **tail = &head;
     Job *job;
 
-    for (job = job_next(NULL); job; job = job_next(job)) {
+    JOB_LOCK_GUARD();
+
+    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
         JobInfo *value;
         AioContext *aio_context;
 
@@ -203,7 +206,7 @@ JobInfoList *qmp_query_jobs(Error **errp)
         }
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        value = job_query_single(job, errp);
+        value = job_query_single_locked(job, errp);
         aio_context_release(aio_context);
         if (!value) {
             qapi_free_JobInfoList(head);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 7314cd813d..81c8fdadf8 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -135,8 +135,11 @@ void qmp_cont(Error **errp)
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
index cab9776f42..e0a30b1f4c 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -912,9 +912,11 @@ static void run_block_job(BlockJob *job, Error **errp)
     int ret = 0;
 
     aio_context_acquire(aio_context);
-    job_ref(&job->job);
+    job_lock();
+    job_ref_locked(&job->job);
     do {
         float progress = 0.0f;
+        job_unlock();
         aio_poll(aio_context, true);
 
         progress_get_snapshot(&job->job.progress, &progress_current,
@@ -923,14 +925,17 @@ static void run_block_job(BlockJob *job, Error **errp)
             progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
-    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
+        job_lock();
+    } while (!job_is_ready_locked(&job->job) &&
+             !job_is_completed_locked(&job->job));
 
-    if (!job_is_completed(&job->job)) {
-        ret = job_complete_sync(&job->job, errp);
+    if (!job_is_completed_locked(&job->job)) {
+        ret = job_complete_sync_locked(&job->job, errp);
     } else {
         ret = job->job.ret;
     }
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
+    job_unlock();
     aio_context_release(aio_context);
 
     /* publish completion progress only when success */
-- 
2.31.1


