Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D249F8CA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:54:27 +0100 (CET)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDPpj-0007xL-0h
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmC-0004YL-Hf
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPm8-0003Oq-Pl
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSNdqnXVltImj1xnDIfilmZEvtW+JONldwLSI+K6V7M=;
 b=aXs57xE24BsDKYcF3F1NN8EbzM78fDrVJHgv6r6u/k9A4M/zSNdwDuHRwmZCgD09pijMHm
 y1mZc6llRSXVTLw95EYDaWKahDctFgkmBp8casoXFaP9WAH5kKJEE7091FRtDB/D2RTVSl
 KgzUzoncZ5P6ZMu2kHHSz+07xqGW9OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-BivP5EwbNzK_wa0Pl0Aayg-1; Fri, 28 Jan 2022 06:50:41 -0500
X-MC-Unique: BivP5EwbNzK_wa0Pl0Aayg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B722E1083F69;
 Fri, 28 Jan 2022 11:50:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B11A71F478;
 Fri, 28 Jan 2022 11:50:38 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 04/19] job.c: move inner aiocontext lock in callbacks
Date: Fri, 28 Jan 2022 06:50:16 -0500
Message-Id: <20220128115031.4061565-5-eesposit@redhat.com>
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

Instead of having the lock in job_tnx_apply, move it inside
in the callback. This will be helpful for next commits, when
we introduce job_lock/unlock pairs.

job_transition_to_pending() and job_needs_finalize() do not
need to be protected by the aiocontext lock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/job.c b/job.c
index e97b159396..2b88cef19d 100644
--- a/job.c
+++ b/job.c
@@ -149,7 +149,6 @@ static void job_txn_del_job(Job *job)
 
 static int job_txn_apply(Job *job, int fn(Job *))
 {
-    AioContext *inner_ctx;
     Job *other_job, *next;
     JobTxn *txn = job->txn;
     int rc = 0;
@@ -164,10 +163,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
-        inner_ctx = other_job->aio_context;
-        aio_context_acquire(inner_ctx);
         rc = fn(other_job);
-        aio_context_release(inner_ctx);
         if (rc) {
             break;
         }
@@ -719,11 +715,15 @@ static void job_clean(Job *job)
 
 static int job_finalize_single(Job *job)
 {
+    AioContext *ctx = job->aio_context;
+
     assert(job_is_completed(job));
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
 
+    aio_context_acquire(ctx);
+
     if (!job->ret) {
         job_commit(job);
     } else {
@@ -731,6 +731,8 @@ static int job_finalize_single(Job *job)
     }
     job_clean(job);
 
+    aio_context_release(ctx);
+
     if (job->cb) {
         job->cb(job->opaque, job->ret);
     }
@@ -835,8 +837,8 @@ static void job_completed_txn_abort(Job *job)
             assert(job_cancel_requested(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
-        job_finalize_single(other_job);
         aio_context_release(ctx);
+        job_finalize_single(other_job);
     }
 
     /*
@@ -851,11 +853,16 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    AioContext *ctx = job->aio_context;
     assert(qemu_in_main_thread());
+
     if (job->ret == 0 && job->driver->prepare) {
+        aio_context_acquire(ctx);
         job->ret = job->driver->prepare(job);
+        aio_context_release(ctx);
         job_update_rc(job);
     }
+
     return job->ret;
 }
 
-- 
2.31.1


