Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1EC42413C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:23:31 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8lW-0005cn-Pa
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8iS-0002D2-4c
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8iP-0007au-1u
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7SOyhOhAWbmNpS+zUSclxy3uaQ1hzoXT8xfrBJFRzU=;
 b=GE+OSIUHaolLEZRJeXn0lRqmxcokHXxbynGDSoyL+CvI5diqV8Ng57YOSuvEzfa//DBsoP
 LfMwOjjVnAtM6GwQ2HYUBlCCGVNdq6ALD9bJgpOFpPIaJbhQfndKmWwTH4wsHF/cYjrTl8
 Zss7c9rOTyHAKQpqfGDXu86bp1IpniY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-cJhLxZp1Pb23srpqqTLCsQ-1; Wed, 06 Oct 2021 11:20:15 -0400
X-MC-Unique: cJhLxZp1Pb23srpqqTLCsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5391015DA1;
 Wed,  6 Oct 2021 15:20:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AE860C0F;
 Wed,  6 Oct 2021 15:20:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 07/13] job: Do not soft-cancel after a job is done
Date: Wed,  6 Oct 2021 17:19:34 +0200
Message-Id: <20211006151940.214590-8-hreitz@redhat.com>
In-Reply-To: <20211006151940.214590-1-hreitz@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

The only job that supports a soft cancel mode is the mirror job, and in
such a case it resets its .cancelled field before it leaves its .run()
function, so it does not really count as cancelled.

However, it is possible to cancel the job after .run() returns and
before job_exit() (which is run in the main loop) is executed.  Then,
.cancelled would still be true and the job would count as cancelled.
This does not seem to be in the interest of the mirror job, so adjust
job_cancel_async() to not set .cancelled in such a case, and
job_cancel() to not invoke job_completed_txn_abort().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 job.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index 81c016eb10..44e741ebd4 100644
--- a/job.c
+++ b/job.c
@@ -734,9 +734,19 @@ static void job_cancel_async(Job *job, bool force)
         assert(job->pause_count > 0);
         job->pause_count--;
     }
-    job->cancelled = true;
-    /* To prevent 'force == false' overriding a previous 'force == true' */
-    job->force_cancel |= force;
+
+    /*
+     * Ignore soft cancel requests after the job is already done
+     * (We will still invoke job->driver->cancel() above, but if the
+     * job driver supports soft cancelling and the job is done, that
+     * should be a no-op, too.  We still call it so it can override
+     * @force.)
+     */
+    if (force || !job->deferred_to_main_loop) {
+        job->cancelled = true;
+        /* To prevent 'force == false' overriding a previous 'force == true' */
+        job->force_cancel |= force;
+    }
 }
 
 static void job_completed_txn_abort(Job *job)
@@ -963,7 +973,14 @@ void job_cancel(Job *job, bool force)
     if (!job_started(job)) {
         job_completed(job);
     } else if (job->deferred_to_main_loop) {
-        job_completed_txn_abort(job);
+        /*
+         * job_cancel_async() ignores soft-cancel requests for jobs
+         * that are already done (i.e. deferred to the main loop).  We
+         * have to check again whether the job is really cancelled.
+         */
+        if (job_is_cancelled(job)) {
+            job_completed_txn_abort(job);
+        }
     } else {
         job_enter(job);
     }
-- 
2.31.1


