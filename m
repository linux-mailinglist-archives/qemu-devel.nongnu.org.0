Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF34455FF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:04:54 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieIP-0004kU-67
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie89-0003OP-CT
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mie87-0006to-55
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaWunbwvqIDuIfno9n5JZVBiFuhnvi6sDZnnZWaTXuo=;
 b=C4vpLo8TMLXNqxjHiB9t4Ol4hMhZKe4/b4W6xke0iyDc23EiRJ5aFedBHKGABtmdml6Csb
 XdIzt2nyATse3cwB5Rfxef+7JmSGhRF2l4CxG6h7XRERYFFyqo73dOvI251HtdpAahXAhR
 psWdqzw4i2Qm7PyFfEMxWKnNMjgEnUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-7zH0_Q7RPyW8gTLSuLqV_Q-1; Thu, 04 Nov 2021 10:54:10 -0400
X-MC-Unique: 7zH0_Q7RPyW8gTLSuLqV_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A1C1007302;
 Thu,  4 Nov 2021 14:54:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECCA36418A;
 Thu,  4 Nov 2021 14:54:07 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 07/14] job.c: move inner aiocontext lock in callbacks
Date: Thu,  4 Nov 2021 10:53:27 -0400
Message-Id: <20211104145334.1346363-8-eesposit@redhat.com>
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

Instead of having the lock in job_tnx_apply, move it inside
in the callback. This will be helpful for next commits, when
we introduce job_lock/unlock pairs.

job_transition_to_pending() and job_needs_finalize() do not
need to be protected by the aiocontext lock.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index ce5066522f..7856fa734b 100644
--- a/job.c
+++ b/job.c
@@ -170,7 +170,6 @@ static void job_txn_del_job(Job *job)
 
 static int job_txn_apply(Job *job, int fn(Job *))
 {
-    AioContext *inner_ctx;
     Job *other_job, *next;
     JobTxn *txn = job->txn;
     int rc = 0;
@@ -185,10 +184,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
     aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
-        inner_ctx = other_job->aio_context;
-        aio_context_acquire(inner_ctx);
         rc = fn(other_job);
-        aio_context_release(inner_ctx);
         if (rc) {
             break;
         }
@@ -820,11 +816,15 @@ static void job_clean(Job *job)
 
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
@@ -832,6 +832,8 @@ static int job_finalize_single(Job *job)
     }
     job_clean(job);
 
+    aio_context_release(ctx);
+
     if (job->cb) {
         job->cb(job->opaque, job->ret);
     }
@@ -952,11 +954,16 @@ static void job_completed_txn_abort(Job *job)
 
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
2.27.0


