Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E040B4029AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:24:42 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb5d-0002x8-TN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRb-00061i-NZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRY-0006PS-TV
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7g4ucFPXhrunnz23VDj7Pt7l9AbbgYoJYQRKI/U2hec=;
 b=KG7I9l5ExcvbgOg+whMn9aMHAEl8facppndgim9pYX6mvvCbXrvgjxAmHjmuQr78H91Vwu
 PahNyExgr7ibt0JT+EM5GSt2PMynvfdO+5T9wb2CgOIach7KJJ6+Wzev3rnAHbj5oEZMBS
 1dsAAtlXFY8isQBrdWSGAf5+sKjaJn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-sJe_xobkO6e8Uie8KdquoA-1; Tue, 07 Sep 2021 08:43:14 -0400
X-MC-Unique: sJe_xobkO6e8Uie8KdquoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B35835DE5;
 Tue,  7 Sep 2021 12:43:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2CB10013D7;
 Tue,  7 Sep 2021 12:43:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11/12] mirror: Do not clear .cancelled
Date: Tue,  7 Sep 2021 14:42:44 +0200
Message-Id: <20210907124245.143492-12-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Clearing .cancelled before leaving the main loop when the job has been
soft-cancelled is no longer necessary since job_is_cancelled() only
returns true for jobs that have been force-cancelled.

Therefore, this only makes a differences in places that call
job_cancel_requested().  In block/mirror.c, this is done only before
.cancelled was cleared.

In job.c, there are two callers:
- job_completed_txn_abort() asserts that .cancelled is true, so keeping
  it true will not affect this place.

- job_complete() refuses to let a job complete that has .cancelled set.
  It is correct to refuse to let the user invoke job-complete on mirror
  jobs that have already been soft-cancelled.

With this change, there are no places that reset .cancelled to false and
so we can be sure that .force_cancel can only be true if .cancelled is
true as well.  Assert this in job_is_cancelled().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 2 --
 job.c          | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index af89c1716a..f94aa52fae 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -939,7 +939,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
-        s->common.job.cancelled = false;
         goto immediate_exit;
     }
 
@@ -1078,7 +1077,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
              * completion.
              */
             assert(QLIST_EMPTY(&bs->tracked_requests));
-            s->common.job.cancelled = false;
             need_drain = false;
             break;
         }
diff --git a/job.c b/job.c
index be878ca5fc..85c0216734 100644
--- a/job.c
+++ b/job.c
@@ -217,7 +217,9 @@ const char *job_type_str(const Job *job)
 
 bool job_is_cancelled(Job *job)
 {
-    return job->cancelled && job->force_cancel;
+    /* force_cancel may be true only if cancelled is true, too */
+    assert(job->cancelled || !job->force_cancel);
+    return job->force_cancel;
 }
 
 bool job_cancel_requested(Job *job)
-- 
2.31.1


