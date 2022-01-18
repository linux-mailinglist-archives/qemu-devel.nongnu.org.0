Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212BB492BAF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:55:41 +0100 (CET)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rli-0001XX-Mp
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rTJ-0002Qf-N2
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rTH-0005qS-UM
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCNhTywy/F6op3ibTVRQmfx5IM0UrdJWaXcz6og+PZk=;
 b=QKFA1tF7eJe/bW5xjDHUxNuOpFoegEQUGrV2psdGNJW+yCmpnwDDm9qf60d0okD8gWyajJ
 HKEMEU1UHLizHxcYQk64nLKHy92cpu80V0OuFzv71iYZmA8JM1ipoCuX6JmWR591vKvxIR
 jdg8WBbpFgGwuxZ8hMQtSKPt6RmBDGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-k5OKaxp_OSiE8q8bpCxxMg-1; Tue, 18 Jan 2022 11:36:30 -0500
X-MC-Unique: k5OKaxp_OSiE8q8bpCxxMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC7EB8143EF;
 Tue, 18 Jan 2022 16:28:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ECBF348F8;
 Tue, 18 Jan 2022 16:28:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 05/12] test-bdrv-drain.c: adapt test to the coming subtree
 drains
Date: Tue, 18 Jan 2022 11:27:31 -0500
Message-Id: <20220118162738.1366281-6-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- First of all, inconsistency between block_job_create under
aiocontext lock that internally calls blk_insert_bs and therefore
bdrv_replace_child_noperm, and blk_insert_bs that is called two lines
above in the same test without aiocontext. There seems to be no
reason on why we need the lock there, so move the aiocontext lock further
down.

- test_detach_indirect: here it is simply a matter of wrong callbacks
used. In the original test, there was only a subtree drain, so
overriding .drained_begin was not a problem. Now that we want to have
additional subtree drains, we risk to call the test callback
to early, or multiple times. We do not want that, so override
the callback only when we actually want to use it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 5a35dc391d..f6af206748 100644
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
@@ -1322,15 +1322,18 @@ static void detach_by_parent_aio_cb(void *opaque, int ret)
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
@@ -1362,8 +1365,6 @@ static void test_detach_indirect(bool by_parent_cb)
 
     if (!by_parent_cb) {
         detach_by_driver_cb_class = child_of_bds;
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
     }
 
     /* Create all involved nodes */
@@ -1421,6 +1422,12 @@ static void test_detach_indirect(bool by_parent_cb)
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


