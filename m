Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12E5A2884
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:28:18 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZNh-0005Ze-Eo
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGz-0000bx-1l
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGt-0003xE-Qu
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h60nW70wRNq46EvQhvF2mbVls9JmeI2W+yNsFOL3C7U=;
 b=ZQBpRJDqGD2FBg/LVXrgTWWa+dx3J2jxW5KCNs9wUvORc7VBqxIvkS+8MiORcmd12hN6RX
 tssW5Pey4CyK8YiN9ypxRdrS8/YwpVk247OZxRfNyT4v5jZLbJF50WSTAQsUFpDHzXVNKc
 yP71av0kjvj0l75XdKS6yQdjsYKmqGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-JxeQPns9Pqy04m48t_EHXw-1; Fri, 26 Aug 2022 09:21:10 -0400
X-MC-Unique: JxeQPns9Pqy04m48t_EHXw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E6EE85A58B;
 Fri, 26 Aug 2022 13:21:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0156440315A;
 Fri, 26 Aug 2022 13:21:09 +0000 (UTC)
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
Subject: [PATCH v11 07/21] blockjob: introduce block_job  _locked() APIs
Date: Fri, 26 Aug 2022 09:20:50 -0400
Message-Id: <20220826132104.3678958-8-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Just as done with job.h, create _locked() functions in blockjob.h

These functions will be later useful when caller has already taken
the lock. All blockjob _locked functions call job _locked functions.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockjob.c               | 52 ++++++++++++++++++++++++++++++++--------
 include/block/blockjob.h | 18 ++++++++++++++
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 7da59a1f1c..0d59aba439 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -44,21 +44,27 @@ static bool is_block_job(Job *job)
            job_type(job) == JOB_TYPE_STREAM;
 }
 
-BlockJob *block_job_next(BlockJob *bjob)
+BlockJob *block_job_next_locked(BlockJob *bjob)
 {
     Job *job = bjob ? &bjob->job : NULL;
     GLOBAL_STATE_CODE();
 
     do {
-        job = job_next(job);
+        job = job_next_locked(job);
     } while (job && !is_block_job(job));
 
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
-BlockJob *block_job_get(const char *id)
+BlockJob *block_job_next(BlockJob *bjob)
 {
-    Job *job = job_get(id);
+    JOB_LOCK_GUARD();
+    return block_job_next_locked(bjob);
+}
+
+BlockJob *block_job_get_locked(const char *id)
+{
+    Job *job = job_get_locked(id);
     GLOBAL_STATE_CODE();
 
     if (job && is_block_job(job)) {
@@ -68,6 +74,12 @@ BlockJob *block_job_get(const char *id)
     }
 }
 
+BlockJob *block_job_get(const char *id)
+{
+    JOB_LOCK_GUARD();
+    return block_job_get_locked(id);
+}
+
 void block_job_free(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
@@ -256,14 +268,14 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
     GLOBAL_STATE_CODE();
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+    if (job_apply_verb_locked(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
         return false;
     }
     if (speed < 0) {
@@ -277,7 +289,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     job->speed = speed;
 
     if (drv->set_speed) {
+        job_unlock();
         drv->set_speed(job, speed);
+        job_lock();
     }
 
     if (speed && speed <= old_speed) {
@@ -285,18 +299,24 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }
 
     /* kick only if a timer is pending */
-    job_enter_cond(&job->job, job_timer_pending);
+    job_enter_cond_locked(&job->job, job_timer_pending);
 
     return true;
 }
 
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    return block_job_set_speed_locked(job, speed, errp);
+}
+
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
     IO_CODE();
     return ratelimit_calculate_delay(&job->limit, n);
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
+BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
     uint64_t progress_current, progress_total;
@@ -320,7 +340,7 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     info->len       = progress_total;
     info->speed     = job->speed;
     info->io_status = job->iostatus;
-    info->ready     = job_is_ready(&job->job),
+    info->ready     = job_is_ready_locked(&job->job),
     info->status    = job->job.status;
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
@@ -333,6 +353,12 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     return info;
 }
 
+BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
+{
+    JOB_LOCK_GUARD();
+    return block_job_query_locked(job, errp);
+}
+
 static void block_job_iostatus_set_err(BlockJob *job, int error)
 {
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
@@ -478,7 +504,7 @@ fail:
     return NULL;
 }
 
-void block_job_iostatus_reset(BlockJob *job)
+void block_job_iostatus_reset_locked(BlockJob *job)
 {
     GLOBAL_STATE_CODE();
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
@@ -488,6 +514,12 @@ void block_job_iostatus_reset(BlockJob *job)
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
 
+void block_job_iostatus_reset(BlockJob *job)
+{
+    JOB_LOCK_GUARD();
+    block_job_iostatus_reset_locked(job);
+}
+
 void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 6525e16fd5..8b65d3949d 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -92,6 +92,9 @@ typedef struct BlockJob {
  */
 BlockJob *block_job_next(BlockJob *job);
 
+/* Same as block_job_next(), but called with job lock held. */
+BlockJob *block_job_next_locked(BlockJob *job);
+
 /**
  * block_job_get:
  * @id: The id of the block job.
@@ -102,6 +105,9 @@ BlockJob *block_job_next(BlockJob *job);
  */
 BlockJob *block_job_get(const char *id);
 
+/* Same as block_job_get(), but called with job lock held. */
+BlockJob *block_job_get_locked(const char *id);
+
 /**
  * block_job_add_bdrv:
  * @job: A block job
@@ -145,6 +151,12 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
  */
 bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
 
+/*
+ * Same as block_job_set_speed(), but called with job lock held.
+ * Might release the lock temporarily.
+ */
+bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp);
+
 /**
  * block_job_query:
  * @job: The job to get information about.
@@ -153,6 +165,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
  */
 BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
 
+/* Same as block_job_query(), but called with job lock held. */
+BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
+
 /**
  * block_job_iostatus_reset:
  * @job: The job whose I/O status should be reset.
@@ -162,6 +177,9 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
  */
 void block_job_iostatus_reset(BlockJob *job);
 
+/* Same as block_job_iostatus_reset(), but called with job lock held. */
+void block_job_iostatus_reset_locked(BlockJob *job);
+
 /*
  * block_job_get_aio_context:
  *
-- 
2.31.1


