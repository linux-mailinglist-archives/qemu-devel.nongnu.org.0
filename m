Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14986445611
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:10:36 +0100 (CET)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieNv-0005Jc-70
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8I-0003jJ-7O
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie8G-0006xx-12
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vd4XOfIs4VvsjHgEE5D1vk6Ol7npAzlbVZYdjHNk7Q=;
 b=hfnl/E+h2tGlNJbh9htIi/cJHwekHxE8OhXAC/p7SlN8qSxTFJctIe6zj2HH/ihh+MfVH5
 JDdRQet+PO5oNu23wAzFKGNy36h5mY8KGwjMl2lA66qRT4qTY3uAgDi6M2smaT+wMFPJMk
 bOFvgRjA6qDSoUw9akkAFKX6hLX1hu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-TgbBVmxlOvGru5RcNNhNww-1; Thu, 04 Nov 2021 10:54:17 -0400
X-MC-Unique: TgbBVmxlOvGru5RcNNhNww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1C98066EF;
 Thu,  4 Nov 2021 14:54:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 666286418A;
 Thu,  4 Nov 2021 14:54:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 13/14] jobs: add job lock in find_* functions
Date: Thu,  4 Nov 2021 10:53:33 -0400
Message-Id: <20211104145334.1346363-14-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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

Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
they first search for the job and then perform an action on it.
Therefore, we need to do the search + action under the same
job mutex critical section.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 9 +++++++++
 job-qmp.c  | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/blockdev.c b/blockdev.c
index c5a835d9ed..0bd79757fc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3327,12 +3327,14 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
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
 
@@ -3353,6 +3355,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
 
     block_job_set_speed(job, speed, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_cancel(const char *device,
@@ -3379,6 +3382,7 @@ void qmp_block_job_cancel(const char *device,
     job_user_cancel(&job->job, force, errp);
 out:
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_pause(const char *device, Error **errp)
@@ -3393,6 +3397,7 @@ void qmp_block_job_pause(const char *device, Error **errp)
     trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_resume(const char *device, Error **errp)
@@ -3407,6 +3412,7 @@ void qmp_block_job_resume(const char *device, Error **errp)
     trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_complete(const char *device, Error **errp)
@@ -3421,6 +3427,7 @@ void qmp_block_job_complete(const char *device, Error **errp)
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_finalize(const char *id, Error **errp)
@@ -3444,6 +3451,7 @@ void qmp_block_job_finalize(const char *id, Error **errp)
     aio_context = blk_get_aio_context(job->blk);
     job_unref(&job->job);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_block_job_dismiss(const char *id, Error **errp)
@@ -3460,6 +3468,7 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     job = &bjob->job;
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_change_backing_file(const char *device,
diff --git a/job-qmp.c b/job-qmp.c
index a355dc2954..8f07c51db8 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -35,10 +35,12 @@ static Job *find_job(const char *id, AioContext **aio_context, Error **errp)
     Job *job;
 
     *aio_context = NULL;
+    job_lock();
 
     job = job_get(id);
     if (!job) {
         error_setg(errp, "Job not found");
+        job_unlock();
         return NULL;
     }
 
@@ -60,6 +62,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     trace_qmp_job_cancel(job);
     job_user_cancel(job, true, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_pause(const char *id, Error **errp)
@@ -74,6 +77,7 @@ void qmp_job_pause(const char *id, Error **errp)
     trace_qmp_job_pause(job);
     job_user_pause(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_resume(const char *id, Error **errp)
@@ -88,6 +92,7 @@ void qmp_job_resume(const char *id, Error **errp)
     trace_qmp_job_resume(job);
     job_user_resume(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_complete(const char *id, Error **errp)
@@ -102,6 +107,7 @@ void qmp_job_complete(const char *id, Error **errp)
     trace_qmp_job_complete(job);
     job_complete(job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_finalize(const char *id, Error **errp)
@@ -125,6 +131,7 @@ void qmp_job_finalize(const char *id, Error **errp)
     aio_context = job->aio_context;
     job_unref(job);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 void qmp_job_dismiss(const char *id, Error **errp)
@@ -139,6 +146,7 @@ void qmp_job_dismiss(const char *id, Error **errp)
     trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
+    job_unlock();
 }
 
 static JobInfo *job_query_single(Job *job, Error **errp)
-- 
2.27.0


