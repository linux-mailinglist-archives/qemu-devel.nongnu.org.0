Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE7472A85
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:44:43 +0100 (CET)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwip0-0008G2-TV
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwill-0002ya-Fj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwili-0007oU-CV
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639392077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFvf8EJSgXHYZIgb45dR2RFSuImjrGJV7vsU0A2n7Qs=;
 b=LKqk/KR7jlzP+Hy4rnq6eht8h2WOVbS1bRNnu5kkVDaMCaiKUqms9fCJM8d/7JhxPUAEyx
 VgPuI3xJK+bWsVsFeoJ3hSTGI/AsGy3SiwYfD3yiDniXMx8VWmBKhU2i6ZsTyl0TnOn4ta
 Hi/ar0ca7vC6KEES1OuFVaEbcsKmYSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-ZW9TizJzMj2JLhxQZE21lQ-1; Mon, 13 Dec 2021 05:41:14 -0500
X-MC-Unique: ZW9TizJzMj2JLhxQZE21lQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953DC640A1;
 Mon, 13 Dec 2021 10:41:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE8E66B8EA;
 Mon, 13 Dec 2021 10:41:12 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 5/6] test-bdrv-drain.c: adapt test to the new subtree
 drains
Date: Mon, 13 Dec 2021 05:40:13 -0500
Message-Id: <20211213104014.69858-6-eesposit@redhat.com>
In-Reply-To: <20211213104014.69858-1-eesposit@redhat.com>
References: <20211213104014.69858-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a couple of problems in this test when we add
subtree drains in bdrv_replace_child_noperm:

- First of all, inconsistency between block_job_create under
aiocontext lock that internally calls blk_insert_bs and therefore
bdrv_replace_child_noperm, and blk_insert_bs that is called two lines
above in the same test without aiocontext. Since we use the
unlocked subtree_drain, we want to move the aiocontext further
down.

- test_detach_by_parent_cb: this test uses a callback of an I/O
function (blk_aio_preadv) to modify the grah, using bdrv_attach_child.
This is simply not allowed anymore. I/O cannot change the graph.

- test_detach_indirect: here it is simply a matter of wrong callbacks
used. In the original test, there was only a subtree drain, so
overriding .drained_begin was not a problem. Now that we have
additional subtree drains, we risk to call the test callback
to early, or multiple times. We do not want that, so override
the callback only when we actually want to use it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index a62e6451a1..9414fc68b7 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -939,10 +939,10 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     blk_insert_bs(blk_target, target, &error_abort);
     blk_set_allow_aio_context_change(blk_target, true);
 
-    aio_context_acquire(ctx);
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
+    aio_context_acquire(ctx);
     job = &tjob->common;
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
 
@@ -1388,8 +1388,6 @@ static void test_detach_indirect(bool by_parent_cb)
 
     if (!by_parent_cb) {
         detach_by_driver_cb_class = child_of_bds;
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
     }
 
     /* Create all involved nodes */
@@ -1447,6 +1445,12 @@ static void test_detach_indirect(bool by_parent_cb)
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
 
@@ -1470,6 +1474,12 @@ static void test_detach_indirect(bool by_parent_cb)
 
     bdrv_subtree_drained_end(parent_b);
 
+    if (!by_parent_cb) {
+        /* restore .drained_begin cb, we don't need it anymore. */
+        detach_by_driver_cb_class.drained_begin =
+            child_of_bds.drained_begin;
+    }
+
     bdrv_unref(parent_b);
     blk_unref(blk);
 
@@ -1483,7 +1493,7 @@ static void test_detach_indirect(bool by_parent_cb)
 
 static void test_detach_by_parent_cb(void)
 {
-    test_detach_indirect(true);
+    /* test_detach_indirect(true); */
 }
 
 static void test_detach_by_driver_cb(void)
-- 
2.31.1


