Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F74D862C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:43:52 +0100 (CET)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkzG-0005ZR-Uv
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:43:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt3-0006eV-Vj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksy-0001bP-4p
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ba+Naz9pp+/LNM6jqcmJUdOS/WyINMr3PtDfFMsuaek=;
 b=SrgiJAgR2i5msFVhfYWGMvAE7Xg92YMthShhMjmfEbrH3Cd0JwjIzrUHsG4j12/qyrfXU6
 sgl9cG58KwhO5EEmU2NVUeP01Kr/OrzI/L2KfYohdRtveVmYW23SRAHJiQC54cM7e7x+Z0
 IX9m1A9KM7RxLWB87YqZFQcIS0DMnZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-kd7Up36vNGOjdW8QBux8EA-1; Mon, 14 Mar 2022 09:37:16 -0400
X-MC-Unique: kd7Up36vNGOjdW8QBux8EA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB9D3800E87;
 Mon, 14 Mar 2022 13:37:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49703403144;
 Mon, 14 Mar 2022 13:37:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 07/18] jobs: add job lock in find_* functions
Date: Mon, 14 Mar 2022 09:36:56 -0400
Message-Id: <20220314133707.2206082-8-eesposit@redhat.com>
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

Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
they first search for the job and then perform an action on it.
Therefore, we need to do the search + action under the same
job mutex critical section.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 46 +++++++++++++++++++++++++++++++++++-----------
 job-qmp.c  | 37 +++++++++++++++++++++++++++++--------
 2 files changed, 64 insertions(+), 19 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 8722e5d4b9..39e6fe4d59 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3311,9 +3311,13 @@ out:
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
 
@@ -3322,7 +3326,6 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
     *aio_context = NULL;
 
     job = block_job_get(id);
-
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
                   "Block job '%s' not found", id);
@@ -3338,7 +3341,10 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
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
@@ -3352,7 +3358,10 @@ void qmp_block_job_cancel(const char *device,
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
@@ -3377,7 +3386,10 @@ out:
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
@@ -3391,7 +3403,10 @@ void qmp_block_job_pause(const char *device, Error **errp)
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
@@ -3405,7 +3420,10 @@ void qmp_block_job_resume(const char *device, Error **errp)
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
@@ -3419,7 +3437,10 @@ void qmp_block_job_complete(const char *device, Error **errp)
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
@@ -3442,9 +3463,12 @@ void qmp_block_job_finalize(const char *id, Error **errp)
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
diff --git a/job-qmp.c b/job-qmp.c
index 270df1eb7e..58ca9b6632 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,8 +29,11 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
-static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
+/*
+ * Get a block job using its ID and acquire its AioContext.
+ * Called with job_mutex held.
+ */
+static Job *find_job_locked(const char *id, AioContext **aio_context, Error **errp)
 {
     Job *job;
 
@@ -51,7 +54,10 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
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
@@ -65,7 +71,10 @@ void qmp_job_cancel(const char *id, Error **errp)
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
@@ -79,7 +88,10 @@ void qmp_job_pause(const char *id, Error **errp)
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
@@ -93,7 +105,10 @@ void qmp_job_resume(const char *id, Error **errp)
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
@@ -107,7 +122,10 @@ void qmp_job_complete(const char *id, Error **errp)
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
@@ -130,7 +148,10 @@ void qmp_job_finalize(const char *id, Error **errp)
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
-- 
2.31.1


