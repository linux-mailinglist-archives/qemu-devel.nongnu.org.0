Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22534ADE25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:19:56 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTDf-0003gQ-Hn
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRaj-0003Es-CE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRae-0008CK-IS
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644330928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNBbZkukQ3AnjfEbC9paP9AFXWuGkbanuvLy2sbnq0I=;
 b=EtBY8b0ixcoHcYAqtU66njgbN6y1sQDS7Wn5K37uBb/WKkTPOWoYBtBbO4Kb8U+qRLr/Rv
 JdXuZxTUqhczwO2kui4NDzGj9VLgN1eGhGjvtlzbz6xta3Y0UDb2aCd+TM+lPNmomL8hfG
 9ki0IRdiJP6rp/iy+V8J8IdDlD+mjbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-IiLzObvuN-S6zdu9pJhpMg-1; Tue, 08 Feb 2022 09:35:25 -0500
X-MC-Unique: IiLzObvuN-S6zdu9pJhpMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35DD68143F2;
 Tue,  8 Feb 2022 14:35:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4052E74E88;
 Tue,  8 Feb 2022 14:35:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 04/20] job.c: move inner aiocontext lock in callbacks
Date: Tue,  8 Feb 2022 09:34:57 -0500
Message-Id: <20220208143513.1077229-5-eesposit@redhat.com>
In-Reply-To: <20220208143513.1077229-1-eesposit@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
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
index f13939d3c6..d8c13ac0d1 100644
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
@@ -717,11 +713,15 @@ static void job_clean(Job *job)
 
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
@@ -729,6 +729,8 @@ static int job_finalize_single(Job *job)
     }
     job_clean(job);
 
+    aio_context_release(ctx);
+
     if (job->cb) {
         job->cb(job->opaque, job->ret);
     }
@@ -833,8 +835,8 @@ static void job_completed_txn_abort(Job *job)
             assert(job_cancel_requested(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
-        job_finalize_single(other_job);
         aio_context_release(ctx);
+        job_finalize_single(other_job);
     }
 
     /*
@@ -849,11 +851,16 @@ static void job_completed_txn_abort(Job *job)
 
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


