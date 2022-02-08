Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD04ADE87
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:45:16 +0100 (CET)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTcB-0007Wd-Lu
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:45:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYU-0000JY-2i
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYE-0002e5-70
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wooyD7Yqu7I8E0U9w4WCE3qS2Jo+fC3O3hAAv7wXP64=;
 b=gOwnd71lD5ePWDY+vnf++xOIntoy5unPpkVDykoIy9dHmYatUsQfZWLeJdjQSCmXvSY0Ay
 Tf1kkAGYauxBKFcPX1kWr3O8SNmpBUcIV/CyTyMGtLr9SPaoknAq0YuB/QYh20+EQ4kKEO
 yrYkJVcTndQcfMY0qNjru40UzENItbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-dFkCcP-aNIi9IED_udlYhA-1; Tue, 08 Feb 2022 10:37:03 -0500
X-MC-Unique: dFkCcP-aNIi9IED_udlYhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44807100C669;
 Tue,  8 Feb 2022 15:37:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 811627D473;
 Tue,  8 Feb 2022 15:37:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/6] test-bdrv-drain.c: adapt test to the coming subtree drains
Date: Tue,  8 Feb 2022 10:36:53 -0500
Message-Id: <20220208153655.1251658-5-eesposit@redhat.com>
In-Reply-To: <20220208153655.1251658-1-eesposit@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There will be 2 problems in this test when we will add
subtree drains in bdrv_replace_child_noperm:

- First, the test is inconsistent about taking the AioContext lock when
  calling bdrv_replace_child_noperm.  bdrv_replace_child_noperm is reached
  in two places: from blk_insert_bs directly, and via block_job_create.
  Only the second does it with the AioContext lock taken, and there seems
  to be no reason why the lock is needed.
  Move aio_context_acquire further down, to just protect block_job_add_bdrv()

- Second, test_detach_indirect is only interested in observing the first
  call to .drained_begin. In the original test, there was only a single
  subtree drain; however, with additional drains introduced in
  bdrv_replace_child_noperm(), the test callback would be called too early
  and/or multiple times.
  Override the callback only when we actually want to use it, and put back
  the original after it's been invoked.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 4924ceb562..c52ba2db4e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -912,12 +912,12 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     blk_insert_bs(blk_target, target, &error_abort);
     blk_set_allow_aio_context_change(blk_target, true);
 
-    aio_context_acquire(ctx);
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
     tjob->bs = src;
     job = &tjob->common;
+    aio_context_acquire(ctx);
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
 
     switch (result) {
@@ -1342,15 +1342,18 @@ static void detach_by_parent_aio_cb(void *opaque, int ret)
     }
 }
 
+static BdrvChildClass detach_by_driver_cb_class;
+
 static void detach_by_driver_cb_drained_begin(BdrvChild *child)
 {
+    /* restore .drained_begin cb, we don't need it anymore. */
+    detach_by_driver_cb_class.drained_begin = child_of_bds.drained_begin;
+
     aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
                             detach_indirect_bh, &detach_by_parent_data);
     child_of_bds.drained_begin(child);
 }
 
-static BdrvChildClass detach_by_driver_cb_class;
-
 /*
  * Initial graph:
  *
@@ -1382,8 +1385,6 @@ static void test_detach_indirect(bool by_parent_cb)
 
     if (!by_parent_cb) {
         detach_by_driver_cb_class = child_of_bds;
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
     }
 
     /* Create all involved nodes */
@@ -1441,6 +1442,12 @@ static void test_detach_indirect(bool by_parent_cb)
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
 
+    if (!by_parent_cb) {
+        /* set .drained_begin cb to run only in the following drain. */
+        detach_by_driver_cb_class.drained_begin =
+            detach_by_driver_cb_drained_begin;
+    }
+
     /* Drain and check the expected result */
     bdrv_subtree_drained_begin(parent_b);
 
-- 
2.31.1


