Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7E6FDDC7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:26:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipR-0002Gd-NW; Wed, 10 May 2023 08:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipJ-000292-IX
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipG-0007e9-6M
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb1wed0zq4TydEORbcgD6A7N63EQBgP+y1JKZQIPgBg=;
 b=bX+TW0zRvStHZDyAj3Ci719doCqu9GE1RDir9SNAuiULI73wWyyTU+h1HgcrOHmQzYEt8G
 5ePCnKsZGomccwjdSdR4LXTrtMQ0gUMpOxgv0F82w8XxiapVUjmbVRh6Yn+/pjpHgfvzJP
 qBm+pOGaYaLokiprW7kIin6fSujnHHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-1w_hvY5VORi3K7nLoWUz8A-1; Wed, 10 May 2023 08:21:40 -0400
X-MC-Unique: 1w_hvY5VORi3K7nLoWUz8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8491285A5A3;
 Wed, 10 May 2023 12:21:40 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7E3247CD0;
 Wed, 10 May 2023 12:21:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/28] block: Fix use after free in blockdev_mark_auto_del()
Date: Wed, 10 May 2023 14:20:47 +0200
Message-Id: <20230510122111.46566-5-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

job_cancel_locked() drops the job list lock temporarily and it may call
aio_poll(). We must assume that the list has changed after this call.
Also, with unlucky timing, it can end up freeing the job during
job_completed_txn_abort_locked(), making the job pointer invalid, too.

For both reasons, we can't just continue at block_job_next_locked(job).
Instead, start at the head of the list again after job_cancel_locked()
and skip those jobs that we already cancelled (or that are completing
anyway).

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230503140142.474404-1-kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index d7b5c18f0a..2c1752a403 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -153,12 +153,22 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     JOB_LOCK_GUARD();
 
-    for (job = block_job_next_locked(NULL); job;
-         job = block_job_next_locked(job)) {
-        if (block_job_has_bdrv(job, blk_bs(blk))) {
+    do {
+        job = block_job_next_locked(NULL);
+        while (job && (job->job.cancelled ||
+                       job->job.deferred_to_main_loop ||
+                       !block_job_has_bdrv(job, blk_bs(blk))))
+        {
+            job = block_job_next_locked(job);
+        }
+        if (job) {
+            /*
+             * This drops the job lock temporarily and polls, so we need to
+             * restart processing the list from the start after this.
+             */
             job_cancel_locked(&job->job, false);
         }
-    }
+    } while (job);
 
     dinfo->auto_del = 1;
 }
-- 
2.40.1


