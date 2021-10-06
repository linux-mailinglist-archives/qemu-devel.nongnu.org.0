Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C7424221
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:04:03 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9Ok-0004EF-KK
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8ip-0002UE-CV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8id-0007nG-1v
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzyEz7psNxBmM9h+ZzkhNTMCh1qAzZicm61qmTw66DQ=;
 b=QUcVBzDGo+mWFyKuh6tqX362pLbOXrHjIElulHKx5FCelEprcb6H7taRzQvBF+tcdNgg7I
 K/thJ3gyd/fMkb9mSs6VKSqCOkHsbaACgfv6myDQ4TWAj9nnut+jBqtCwFAkQBKrKPkRHe
 FrskiWbHKUPeQsTgVahifzgbaulWwfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-lnhn7FpcOoCvfsdxfFjNSw-1; Wed, 06 Oct 2021 11:20:28 -0400
X-MC-Unique: lnhn7FpcOoCvfsdxfFjNSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C0F7802928;
 Wed,  6 Oct 2021 15:20:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 155615F4E8;
 Wed,  6 Oct 2021 15:20:26 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 12/13] mirror: Do not clear .cancelled
Date: Wed,  6 Oct 2021 17:19:39 +0200
Message-Id: <20211006151940.214590-13-hreitz@redhat.com>
In-Reply-To: <20211006151940.214590-1-hreitz@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
index 75874c1806..efec2c7674 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -946,7 +946,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
-        s->common.job.cancelled = false;
         goto immediate_exit;
     }
 
@@ -1085,7 +1084,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
              * completion.
              */
             assert(QLIST_EMPTY(&bs->tracked_requests));
-            s->common.job.cancelled = false;
             need_drain = false;
             break;
         }
diff --git a/job.c b/job.c
index b0cf2d8374..dbfa67bb0a 100644
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


