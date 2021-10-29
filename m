Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3B4400A1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:51:40 +0200 (CEST)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV6R-00065d-MX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvC-0006mB-Ay
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv2-0003Wh-Fg
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmjvroSopI72pXZHN/uxPLNKVF3UScbVUP6pftVmTw8=;
 b=GRaEJDfWA6OHiJrvlfujzIacP20qp3gHJmC6YFgvqe8jc/JWwmP5kFT0pwetb5qpTmDqIF
 8fzu9lzWo0wEs3feSQ96K7QWr7PsPoN2O7XxyynXn+k2+Hl8CwX+UZ2bTdEtQM7SOt/Q04
 bcctbIE04n4Dpm/nzH4/sTwPnoxslBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-D-NOd1MIP7OCLqPlDndCZg-1; Fri, 29 Oct 2021 12:39:46 -0400
X-MC-Unique: D-NOd1MIP7OCLqPlDndCZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9B310A8E03;
 Fri, 29 Oct 2021 16:39:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06A2A69117;
 Fri, 29 Oct 2021 16:39:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 09/15] job.c: move inner aiocontext lock in callbacks
Date: Fri, 29 Oct 2021 12:39:08 -0400
Message-Id: <20211029163914.4044794-10-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

Instead of having the lock in job_tnx_apply, move it inside
in the callback. This will be helpful for next commits, when
we introduce job_lock/unlock pairs.

job_transition_to_pending() and job_needs_finalize() do not
need to be protected by the aiocontext lock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index 88d911f2d7..eb6d321960 100644
--- a/job.c
+++ b/job.c
@@ -153,7 +153,6 @@ static void job_txn_del_job(Job *job)
 
 static int job_txn_apply(Job *job, int fn(Job *))
 {
-    AioContext *inner_ctx;
     Job *other_job, *next;
     JobTxn *txn = job->txn;
     int rc = 0;
@@ -168,10 +167,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
-        inner_ctx = other_job->aio_context;
-        aio_context_acquire(inner_ctx);
         rc = fn(other_job);
-        aio_context_release(inner_ctx);
         if (rc) {
             break;
         }
@@ -836,7 +832,10 @@ static void job_clean(Job *job)
 
 static int job_finalize_single(Job *job)
 {
+    AioContext *ctx = job->aio_context;
+
     assert(job_is_completed(job));
+    aio_context_acquire(ctx);
 
     /* Ensure abort is called for late-transactional failures */
     job_update_rc(job);
@@ -863,6 +862,7 @@ static int job_finalize_single(Job *job)
 
     job_txn_del_job(job);
     job_conclude(job);
+    aio_context_release(ctx);
     return 0;
 }
 
@@ -968,11 +968,16 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    AioContext *ctx = job->aio_context;
     assert(qemu_in_main_thread());
+
+    aio_context_acquire(ctx);
     if (job->ret == 0 && job->driver->prepare) {
         job->ret = job->driver->prepare(job);
         job_update_rc(job);
     }
+    aio_context_release(ctx);
+
     return job->ret;
 }
 
-- 
2.27.0


