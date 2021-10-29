Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE974400A4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:51:44 +0200 (CEST)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV6W-0006Jb-0O
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvJ-00070D-0f
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv8-0003hN-UM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDAhwS7nAT0w+wGzXAq361uetIozqftT+K8z8x0H0M8=;
 b=KkVbBRIJv/5R9MglY+AEuqoUj6LkEed/DHisyxRU9NW2bYIisguJH23zxpVfGo0gEZOsh5
 0nhDxC1ht4I9mTDMbgWJm1Jtrw0tOQ8obRlZzu5OZ781/rDEfL/7zgoeWCVt/xmJ541pGA
 tf/A+u9QPqhZv7bWdzx+X8AsXZb8Ql8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-otdr25PBPMGgk1qJSBXJ1g-1; Fri, 29 Oct 2021 12:39:51 -0400
X-MC-Unique: otdr25PBPMGgk1qJSBXJ1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E50C362F8;
 Fri, 29 Oct 2021 16:39:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CAD469117;
 Fri, 29 Oct 2021 16:39:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 14/15] jobs: add missing job locks to replace aiocontext
 lock
Date: Fri, 29 Oct 2021 12:39:13 -0400
Message-Id: <20211029163914.4044794-15-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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

find_block_job() and find_job() cannot be handled like
all other functions in the previous commit: in order
to avoid unneccessary job lock/unlock, replace the
aiocontext lock with the job_lock.

However, once we start dropping these aiocontex locks
we also break the assumptions of the callees in the job
API, many of which assume the aiocontext lock is held.

To keep this commit simple, handle the rest of the aiocontext
removal in the next commit.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 52 ++++++++++++++++++----------------------------------
 job-qmp.c  | 46 ++++++++++++++++------------------------------
 2 files changed, 34 insertions(+), 64 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index c5a835d9ed..592ed4a0fc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3318,48 +3318,43 @@ out:
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
 
 void qmp_block_job_cancel(const char *device,
                           bool has_force, bool force, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3378,13 +3373,12 @@ void qmp_block_job_cancel(const char *device,
     trace_qmp_block_job_cancel(job);
     job_user_cancel(&job->job, force, errp);
 out:
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_pause(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3392,13 +3386,12 @@ void qmp_block_job_pause(const char *device, Error **errp)
 
     trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3406,13 +3399,12 @@ void qmp_block_job_resume(const char *device, Error **errp)
 
     trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(device, &aio_context, errp);
+    BlockJob *job = find_block_job(device, errp);
 
     if (!job) {
         return;
@@ -3420,13 +3412,12 @@ void qmp_block_job_complete(const char *device, Error **errp)
 
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *job = find_block_job(id, &aio_context, errp);
+    BlockJob *job = find_block_job(id, errp);
 
     if (!job) {
         return;
@@ -3436,20 +3427,13 @@ void qmp_block_job_finalize(const char *id, Error **errp)
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
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
 {
-    AioContext *aio_context;
-    BlockJob *bjob = find_block_job(id, &aio_context, errp);
+    BlockJob *bjob = find_block_job(id, errp);
     Job *job;
 
     if (!bjob) {
@@ -3459,7 +3443,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_change_backing_file(const char *device,
diff --git a/job-qmp.c b/job-qmp.c
index a355dc2954..d592780953 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,29 +29,26 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/* Get a job using its ID. Returns with job_lock held on success. */
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
-    aio_context = job->aio_context;
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
@@ -138,7 +124,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
 
     trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
-    aio_context_release(aio_context);
+    job_unlock();
 }
 
 static JobInfo *job_query_single(Job *job, Error **errp)
-- 
2.27.0


