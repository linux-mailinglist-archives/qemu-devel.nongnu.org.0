Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9317F3E27BD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:49:25 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwTk-0003MM-Ls
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwK9-0007PS-7U
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwK7-0003sP-MN
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOlfHZPm5f3UFrbXjl0CFLE4QSOJOft7/dj+saDcXxY=;
 b=KRs9wkSihsfBmcL6JPY+KAe2m1oQt/t60g+RlPlV7PICPD/U7XSCOuS6YKHUTQZK53mfx6
 SLSbYYRGvZaVudY3G4RqstPMM278kmdbkoNpp1wageUHbX5wTVSNKmG62o6QKJUov/E2Oy
 hA7DoFbR6GcoEbIzv7aS0c64NHShP5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-fgVCTJcUPtGXmszAzA0zmA-1; Fri, 06 Aug 2021 05:39:25 -0400
X-MC-Unique: fgVCTJcUPtGXmszAzA0zmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2C4801FCD;
 Fri,  6 Aug 2021 09:39:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F95819C44;
 Fri,  6 Aug 2021 09:39:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 11/12] mirror: Do not clear .cancelled
Date: Fri,  6 Aug 2021 11:38:58 +0200
Message-Id: <20210806093859.706464-12-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
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
so we can be sure that .force_cancel can only be true of .cancelled is
true as well.  Assert this in job_is_cancelled().

Signed-off-by: Max Reitz <mreitz@redhat.com>
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
index 2bd3c946a7..2ce6865ab2 100644
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


