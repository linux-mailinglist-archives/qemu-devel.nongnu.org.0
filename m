Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AA424139
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:22:58 +0200 (CEST)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8kz-0003vp-9j
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8hz-0001GY-Cw
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8hw-0007C8-OG
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkI3YtTJH0qbxN7CudcVoS+4zgvGczYKWRtJK0ClTOI=;
 b=cKhQg7PSMvtoykwSCWYHP8euXVOIupQ51tIi8mC5xcn3SDG4BzfDOEB+1tub0G1S+8wexe
 lNYMtGGcPT4wKsML2QL9gF6X7NQMd1KK+8f+keheUxhpASfc9DLxh1Xwhh52eHXdjeh5Gl
 MbCKH4gOJa7BKQi9wAKG+eQSKhrlY6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-D7NhAiAzMT-4bldoB9DL7g-1; Wed, 06 Oct 2021 11:19:46 -0400
X-MC-Unique: D7NhAiAzMT-4bldoB9DL7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A76A0104FC19;
 Wed,  6 Oct 2021 15:19:45 +0000 (UTC)
Received: from localhost (unknown [10.39.193.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40B805D9C6;
 Wed,  6 Oct 2021 15:19:45 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 01/13] job: Context changes in job_completed_txn_abort()
Date: Wed,  6 Oct 2021 17:19:28 +0200
Message-Id: <20211006151940.214590-2-hreitz@redhat.com>
In-Reply-To: <20211006151940.214590-1-hreitz@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finalizing the job may cause its AioContext to change.  This is noted by
job_exit(), which points at job_txn_apply() to take this fact into
account.

However, job_completed() does not necessarily invoke job_txn_apply()
(through job_completed_txn_success()), but potentially also
job_completed_txn_abort().  The latter stores the context in a local
variable, and so always acquires the same context at its end that it has
released in the beginning -- which may be a different context from the
one that job_exit() releases at its end.  If it is different, qemu
aborts ("qemu_mutex_unlock_impl: Operation not permitted").

Drop the local @outer_ctx variable from job_completed_txn_abort(), and
instead re-acquire the actual job's context at the end of the function,
so job_exit() will release the same.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/job.c b/job.c
index e7a5d28854..810e6a2065 100644
--- a/job.c
+++ b/job.c
@@ -737,7 +737,6 @@ static void job_cancel_async(Job *job, bool force)
 
 static void job_completed_txn_abort(Job *job)
 {
-    AioContext *outer_ctx = job->aio_context;
     AioContext *ctx;
     JobTxn *txn = job->txn;
     Job *other_job;
@@ -751,10 +750,14 @@ static void job_completed_txn_abort(Job *job)
     txn->aborting = true;
     job_txn_ref(txn);
 
-    /* We can only hold the single job's AioContext lock while calling
+    /*
+     * We can only hold the single job's AioContext lock while calling
      * job_finalize_single() because the finalization callbacks can involve
-     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise. */
-    aio_context_release(outer_ctx);
+     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
+     * Note that the job's AioContext may change when it is finalized.
+     */
+    job_ref(job);
+    aio_context_release(job->aio_context);
 
     /* Other jobs are effectively cancelled by us, set the status for
      * them; this job, however, may or may not be cancelled, depending
@@ -769,6 +772,10 @@ static void job_completed_txn_abort(Job *job)
     }
     while (!QLIST_EMPTY(&txn->jobs)) {
         other_job = QLIST_FIRST(&txn->jobs);
+        /*
+         * The job's AioContext may change, so store it in @ctx so we
+         * release the same context that we have acquired before.
+         */
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
@@ -779,7 +786,12 @@ static void job_completed_txn_abort(Job *job)
         aio_context_release(ctx);
     }
 
-    aio_context_acquire(outer_ctx);
+    /*
+     * Use job_ref()/job_unref() so we can read the AioContext here
+     * even if the job went away during job_finalize_single().
+     */
+    aio_context_acquire(job->aio_context);
+    job_unref(job);
 
     job_txn_unref(txn);
 }
-- 
2.31.1


