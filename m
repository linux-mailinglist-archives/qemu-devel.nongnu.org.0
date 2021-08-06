Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E333E279C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:44:30 +0200 (CEST)
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwOz-0002XL-DO
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwK5-0007AI-MV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwK3-0003ok-KK
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Esc+nYL8IomEnF6GpE/bIqrQYMphOzuwXywcY4KiP0=;
 b=NcrXd40BLtWZkwSNq3+wgEcCqnTZWrDsK2OViPtQLKBPBKuJ7kY3Q54s7U8NRhZdW3ZNMe
 SGy1+tkOtXqCwomTd2R0NtH6HKwIt6n3qzgG0bR2nIq0urR2h7drMp9YnC7uFqxNhnV5xH
 j6OdSFvJwTmvJSW0wwowjglguwmKlnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-reNtIubwM8Su8tgxPvN95g-1; Fri, 06 Aug 2021 05:39:21 -0400
X-MC-Unique: reNtIubwM8Su8tgxPvN95g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFCFAC7402;
 Fri,  6 Aug 2021 09:39:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799655D9DE;
 Fri,  6 Aug 2021 09:39:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 09/12] mirror: Check job_is_cancelled() earlier
Date: Fri,  6 Aug 2021 11:38:56 +0200
Message-Id: <20210806093859.706464-10-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

We must check whether the job is force-cancelled early in our main loop,
most importantly before any `continue` statement.  For example, we used
to have `continue`s before our current checking location that are
triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
failing, force-cancelling the job would not terminate it.

Jobs can be cancelled while they yield, and once they are
(force-cancelled), they should not generate new I/O requests.
Therefore, we should put the check after the last yield before
mirror_iteration() is invoked.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 024fa2dcea..bf1d50ff1c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1000,6 +1000,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
         job_pause_point(&s->common.job);
 
+        if (job_is_cancelled(&s->common.job)) {
+            ret = 0;
+            goto immediate_exit;
+        }
+
         cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         /* cnt is the number of dirty bytes remaining and s->bytes_in_flight is
          * the number of bytes currently being processed; together those are
@@ -1078,8 +1083,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             break;
         }
 
-        ret = 0;
-
         if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
@@ -1087,9 +1090,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job)) {
-            break;
-        }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     }
 
-- 
2.31.1


