Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E929402950
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:02:56 +0200 (CEST)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNakY-0008D9-V0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRE-0005WS-4W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRB-0006EO-3G
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkI3YtTJH0qbxN7CudcVoS+4zgvGczYKWRtJK0ClTOI=;
 b=faB/gITp7FRDeFfaOaPTA1BKvprWvIs2cm5MA2K27n1yMz2ZIUN8JJnOYxU5ngXEOs3LXw
 WoWW0XMK8JkQNj45iW+G5P/N+I/aNtHiFkHMcHs+TkrooA2dm4hn81LGmCkBdsk/eqBhNn
 uRFpsDZ/TxHvfzKe4i3QoyBxV+4vUtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-JMcv082yOfmBc4Vd81hzZQ-1; Tue, 07 Sep 2021 08:42:50 -0400
X-MC-Unique: JMcv082yOfmBc4Vd81hzZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD76100B385;
 Tue,  7 Sep 2021 12:42:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726D460BE5;
 Tue,  7 Sep 2021 12:42:49 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 01/12] job: Context changes in job_completed_txn_abort()
Date: Tue,  7 Sep 2021 14:42:34 +0200
Message-Id: <20210907124245.143492-2-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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


