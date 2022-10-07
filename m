Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A75F778C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:37:11 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglfC-0008Rq-C9
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuI-0005pS-MJ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuE-0003G3-8b
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/+v3H6aSx0QXLvioRW8RWOD3PtTXuSNfQdTQyBTUco=;
 b=gecgdg5UK+fZBIDLvXtiBgoPXCvJWIrfqxakVa40KodPKNGLf0Gso8WMjRfeOI2aQ+kSKa
 15PVqUYavZbQ94D8G4PLoTfCVn/hhL68UWebpbpzzWQb4kXPqaN2yACb9XsqHXF2DunWT5
 XTNDF9SdPxNOL4UsyIwfrHXds2Inc8o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-Du2-zZZ4Na6QgqydDcrmpQ-1; Fri, 07 Oct 2022 06:48:36 -0400
X-MC-Unique: Du2-zZZ4Na6QgqydDcrmpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55D3A382624C;
 Fri,  7 Oct 2022 10:48:36 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 933DB2024CBB;
 Fri,  7 Oct 2022 10:48:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 36/50] jobs: add job lock in find_* functions
Date: Fri,  7 Oct 2022 12:47:38 +0200
Message-Id: <20221007104752.141361-37-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
they first search for the job and then perform an action on it.
Therefore, we need to do the search + action under the same
job mutex critical section.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220926093214.506243-9-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 67 +++++++++++++++++++++++++++++++++++++-----------------
 job-qmp.c  | 57 ++++++++++++++++++++++++++++++++--------------
 2 files changed, 86 insertions(+), 38 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 392d9476e6..2e941e2979 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3313,9 +3313,13 @@ out:
     aio_context_release(aio_context);
 }
 
-/* Get a block job using its ID and acquire its AioContext */
-static BlockJob *find_block_job(const char *id, AioContext **aio_context,
-                                Error **errp)
+/*
+ * Get a block job using its ID and acquire its AioContext.
+ * Called with job_mutex held.
+ */
+static BlockJob *find_block_job_locked(const char *id,
+                                       AioContext **aio_context,
+                                       Error **errp)
 {
     BlockJob *job;
 
@@ -3323,7 +3327,7 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
 
     *aio_context = NULL;
 
-    job = block_job_get(id);
+    job = block_job_get_locked(id);
 
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
@@ -3340,13 +3344,16 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
 void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(device, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
-    block_job_set_speed(job, speed, errp);
+    block_job_set_speed_locked(job, speed, errp);
     aio_context_release(aio_context);
 }
 
@@ -3354,7 +3361,10 @@ void qmp_block_job_cancel(const char *device,
                           bool has_force, bool force, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(device, &aio_context, errp);
 
     if (!job) {
         return;
@@ -3364,14 +3374,14 @@ void qmp_block_job_cancel(const char *device,
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
@@ -3379,57 +3389,69 @@ out:
 void qmp_block_job_pause(const char *device, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(device, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_block_job_pause(job);
-    job_user_pause(&job->job, errp);
+    job_user_pause_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(device, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_block_job_resume(job);
-    job_user_resume(&job->job, errp);
+    job_user_resume_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(device, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_block_job_complete(job);
-    job_complete(&job->job, errp);
+    job_complete_locked(&job->job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *job = find_block_job(id, &aio_context, errp);
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_block_job_finalize(job);
-    job_ref(&job->job);
-    job_finalize(&job->job, errp);
+    job_ref_locked(&job->job);
+    job_finalize_locked(&job->job, errp);
 
     /*
      * Job's context might have changed via job_finalize (and job_txn_apply
@@ -3437,23 +3459,26 @@ void qmp_block_job_finalize(const char *id, Error **errp)
      * one.
      */
     aio_context = block_job_get_aio_context(job);
-    job_unref(&job->job);
+    job_unref_locked(&job->job);
     aio_context_release(aio_context);
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    BlockJob *bjob = find_block_job(id, &aio_context, errp);
+    BlockJob *bjob;
     Job *job;
 
+    JOB_LOCK_GUARD();
+    bjob = find_block_job_locked(id, &aio_context, errp);
+
     if (!bjob) {
         return;
     }
 
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..b1c456482a 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,14 +29,19 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/*
+ * Get a job using its ID and acquire its AioContext.
+ * Called with job_mutex held.
+ */
+static Job *find_job_locked(const char *id,
+                            AioContext **aio_context,
+                            Error **errp)
 {
     Job *job;
 
     *aio_context = NULL;
 
-    job = job_get(id);
+    job = job_get_locked(id);
     if (!job) {
         error_setg(errp, "Job not found");
         return NULL;
@@ -51,71 +56,86 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
 void qmp_job_cancel(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_cancel(job);
-    job_user_cancel(job, true, errp);
+    job_user_cancel_locked(job, true, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_job_pause(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_pause(job);
-    job_user_pause(job, errp);
+    job_user_pause_locked(job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_job_resume(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_resume(job);
-    job_user_resume(job, errp);
+    job_user_resume_locked(job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_job_complete(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_complete(job);
-    job_complete(job, errp);
+    job_complete_locked(job, errp);
     aio_context_release(aio_context);
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_finalize(job);
-    job_ref(job);
-    job_finalize(job, errp);
+    job_ref_locked(job);
+    job_finalize_locked(job, errp);
 
     /*
      * Job's context might have changed via job_finalize (and job_txn_apply
@@ -123,21 +143,24 @@ void qmp_job_finalize(const char *id, Error **errp)
      * one.
      */
     aio_context = job->aio_context;
-    job_unref(job);
+    job_unref_locked(job);
     aio_context_release(aio_context);
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
 {
     AioContext *aio_context;
-    Job *job = find_job(id, &aio_context, errp);
+    Job *job;
+
+    JOB_LOCK_GUARD();
+    job = find_job_locked(id, &aio_context, errp);
 
     if (!job) {
         return;
     }
 
     trace_qmp_job_dismiss(job);
-    job_dismiss(&job, errp);
+    job_dismiss_locked(&job, errp);
     aio_context_release(aio_context);
 }
 
-- 
2.37.3


