Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1349F8D9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:58:13 +0100 (CET)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPtM-0005sa-Ea
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmQ-0004ac-94
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmK-0003RB-GA
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aphXLxgTJOPr15I2ZBMTkc/OIrSbqVG/Sb/p/DJmIGM=;
 b=O+pCiA+wTbDFDqMQo/AqhPjoh3aswyNPIdtHnA2URPQdVPlK/BAZhAIv4IJZ8wmQCB9gZr
 fioPs/w1lZRJWTSR2y0Eic5bW/hNUemiYQHG84N+o5jr30EnLNTmpbUpjHpUTt+MPL8SDR
 upaJstspF/dQyOUsOJyi7xcuGfTFo3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-k2ioY-ueMXuumICJ1VHH5Q-1; Fri, 28 Jan 2022 06:50:45 -0500
X-MC-Unique: k2ioY-ueMXuumICJ1VHH5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B661083F62;
 Fri, 28 Jan 2022 11:50:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10CB922DE4;
 Fri, 28 Jan 2022 11:50:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/19] jobs: add job lock in find_* functions
Date: Fri, 28 Jan 2022 06:50:20 -0500
Message-Id: <20220128115031.4061565-9-eesposit@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 blockdev.c | 14 +++++++++++++-
 job-qmp.c  | 13 ++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 2e522dd7fe..7a9e9b4a13 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3311,7 +3311,10 @@ out:
     aio_context_release(aio_context);
 }
 
-/* Get a block job using its ID and acquire its AioContext */
+/*
+ * Get a block job using its ID and acquire its AioContext.
+ * Returns with job_lock held on success.
+ */
 static BlockJob *find_block_job(const char *id, AioContext **aio_context,
                                 Error **errp)
 {
@@ -3320,12 +3323,14 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
     assert(id != NULL);
 
     *aio_context = NULL;
+    job_lock();
 
     job = block_job_get(id);
 
     if (!job) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
                   "Block job '%s' not found", id);
+        job_unlock();
         return NULL;
     }
 
@@ -3346,6 +3351,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
 
     block_job_set_speed(job, speed, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_cancel(const char *device,
@@ -3372,6 +3378,7 @@ void qmp_block_job_cancel(const char *device,
     job_user_cancel(&job->job, force, errp);
 out:
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_pause(const char *device, Error **errp)
@@ -3386,6 +3393,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
     trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
@@ -3400,6 +3408,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
     trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
@@ -3414,6 +3423,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
@@ -3437,6 +3447,7 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     aio_context = block_job_get_aio_context(job);
     job_unref(&job->job);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
@@ -3453,6 +3464,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     job = &bjob->job;
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_change_backing_file(const char *device,
diff --git a/job-qmp.c b/job-qmp.c
index 06f970f6cf..a08cd7dd36 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -29,16 +29,21 @@
 #include "qapi/error.h"
 #include "trace/trace-root.h"
 
-/* Get a job using its ID and acquire its AioContext */
+/*
+ * Get a block job using its ID and acquire its AioContext.
+ * Returns with job_lock held on success.
+ */
 static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
 {
     Job *job;
 
     *aio_context = NULL;
+    job_lock();
 
     job = job_get(id);
     if (!job) {
         error_setg(errp, "Job not found");
+        job_unlock();
         return NULL;
     }
 
@@ -60,6 +65,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     trace_qmp_job_cancel(job);
     job_user_cancel(job, true, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_pause(const char *id, Error **errp)
@@ -74,6 +80,7 @@ void qmp_job_pause(const char *id, Error **errp)
     trace_qmp_job_pause(job);
     job_user_pause(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_resume(const char *id, Error **errp)
@@ -88,6 +95,7 @@ void qmp_job_resume(const char *id, Error **errp)
     trace_qmp_job_resume(job);
     job_user_resume(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_complete(const char *id, Error **errp)
@@ -102,6 +110,7 @@ void qmp_job_complete(const char *id, Error **errp)
     trace_qmp_job_complete(job);
     job_complete(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
@@ -125,6 +134,7 @@ void qmp_job_finalize(const char *id, Error **errp)
     aio_context = job->aio_context;
     job_unref(job);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
@@ -139,6 +149,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
     trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 static JobInfo *job_query_single(Job *job, Error **errp)
-- 
2.31.1


