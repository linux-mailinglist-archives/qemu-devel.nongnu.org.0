Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2F6F7505
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:55:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puf1M-0005kj-4d; Thu, 04 May 2023 15:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puf1K-0005kY-2D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puf1I-0006PI-MB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683230019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t7uQFODUsT7GUPKJzVAstWb4vuQdfLqZNy3S4rp+B4=;
 b=eelqbAO8I/JUbe2xFP80AHlqtSOREZPT7ZN60dAP+Yz1eFc+AkF/wxP0Ri4Frx49DEoe38
 f2KAhiZSePU7Vmy6Vd9g8FZOMyP9JM0kbF1rI3ksIgSCH9tj2wDvU1y+2BEOtiUVHxeJg3
 /U+0OsJDNAo7XevHYLn7nA3it6ev+ps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-qVm4RSmtOvC22VNK6fWUTQ-1; Thu, 04 May 2023 15:53:34 -0400
X-MC-Unique: qVm4RSmtOvC22VNK6fWUTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50FFE101A550;
 Thu,  4 May 2023 19:53:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78E421410F29;
 Thu,  4 May 2023 19:53:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 xen-devel@lists.xenproject.org, eesposit@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 01/21] block: Fix use after free in blockdev_mark_auto_del()
Date: Thu,  4 May 2023 15:53:07 -0400
Message-Id: <20230504195327.695107-2-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

From: Kevin Wolf <kwolf@redhat.com>

job_cancel_locked() drops the job list lock temporarily and it may call
aio_poll(). We must assume that the list has changed after this call.
Also, with unlucky timing, it can end up freeing the job during
job_completed_txn_abort_locked(), making the job pointer invalid, too.

For both reasons, we can't just continue at block_job_next_locked(job).
Instead, start at the head of the list again after job_cancel_locked()
and skip those jobs that we already cancelled (or that are completing
anyway).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230503140142.474404-1-kwolf@redhat.com>
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


