Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1F4D85D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:23:22 +0100 (CET)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkfR-0004Qm-FH
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:23:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbQ-0001KV-Nz
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbN-0006Y1-1I
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5A1ILpiRiqerGvgg8niN65+BDyItzpEbSe6WdR135zU=;
 b=SeaJiNOmBki1xK/p+/bDCcgJTvDXLp721CgY2egoRqNGZEO2RDlMD4BFb9NhddAURlcfF1
 FfaO9AHrH7oeJKWZ2VniIREc1uFm6kJX3mHNrQHt8eca9CiRQnR0naGLwEA9G6PHpSEBtE
 OqM291syWCX5q3XoQHkQoFkPNvXdGb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-E-r3gKzfMaWAhlyAMmp4Og-1; Mon, 14 Mar 2022 09:19:06 -0400
X-MC-Unique: E-r3gKzfMaWAhlyAMmp4Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E80A101AA50;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CBD52EF83;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 07/10] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Date: Mon, 14 Mar 2022 09:18:51 -0400
Message-Id: <20220314131854.2202651-8-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This test uses a callback of an I/O function (blk_aio_preadv)
to modify the graph, using bdrv_attach_child.
This is simply not allowed anymore. I/O cannot change the graph.

Before "block/io.c: make bdrv_do_drained_begin_quiesce static
and introduce bdrv_drained_begin_no_poll", the test would simply
be at risk of failure, because if bdrv_replace_child_noperm()
(called to modify the graph) would call a drain,
then one callback of .drained_begin() is bdrv_do_drained_begin_quiesce,
that specifically asserts that we are not in a coroutine.

Now that we fixed the behavior, the drain will invoke a bh in the
main loop, so we don't have such problem. However, this test is still
illegal and fails because we forbid graph changes from I/O paths.

Once we add the required subtree_drains to protect
bdrv_replace_child_noperm(), the key problem in this test is in:

acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
/* Drain and check the expected result */
bdrv_subtree_drained_begin(parent_b);

because the detach_by_parent_aio_cb calls detach_indirect_bh(), that
modifies the graph and is invoked during bdrv_subtree_drained_begin().
The call stack is the following:
1. blk_aio_preadv() creates a coroutine, increments in_flight counter
and enters the coroutine running blk_aio_read_entry()
2. blk_aio_read_entry() performs the read and then schedules a bh to
   complete (blk_aio_complete)
3. at this point, subtree_drained_begin() kicks in and waits for all
   in_flight requests, polling
4. polling allows the bh to be scheduled, so blk_aio_complete runs
5. blk_aio_complete *first* invokes the callback
   (detach_by_parent_aio_cb) and then decrements the in_flight counter
6. Here we have the problem: detach_by_parent_aio_cb modifies the graph,
   so both bdrv_unref_child() and bdrv_attach_child() will have
   subtree_drains inside. And this causes a deadlock, because the
   nested drain will wait for in_flight counter to go to zero, which
   is only happening once the drain itself finishes.

Different story is test_detach_by_driver_cb(): in this case,
detach_by_parent_aio_cb() does not call detach_indirect_bh(),
but it is instead called as a bh running in the main loop by
detach_by_driver_cb_drained_begin(), the callback for
.drained_begin().

This test was added in 231281ab42 and part of the series
"Drain fixes and cleanups, part 3"
https://lists.nongnu.org/archive/html/qemu-block/2018-05/msg01132.html
but as explained above I believe that it is not valid anymore, and
can be discarded.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 46 +++++++++---------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index f750ddfc4e..fa0d86209a 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1294,7 +1294,6 @@ struct detach_by_parent_data {
     BdrvChild *child_b;
     BlockDriverState *c;
     BdrvChild *child_c;
-    bool by_parent_cb;
 };
 static struct detach_by_parent_data detach_by_parent_data;
 
@@ -1312,12 +1311,7 @@ static void detach_indirect_bh(void *opaque)
 
 static void detach_by_parent_aio_cb(void *opaque, int ret)
 {
-    struct detach_by_parent_data *data = &detach_by_parent_data;
-
     g_assert_cmpint(ret, ==, 0);
-    if (data->by_parent_cb) {
-        detach_indirect_bh(data);
-    }
 }
 
 static BdrvChildClass detach_by_driver_cb_class;
@@ -1339,31 +1333,24 @@ static void detach_by_driver_cb_drained_begin(BdrvChild *child)
  *    \ /   \
  *     A     B     C
  *
- * by_parent_cb == true:  Test that parent callbacks don't poll
- *
- *     PA has a pending write request whose callback changes the child nodes of
- *     PB: It removes B and adds C instead. The subtree of PB is drained, which
- *     will indirectly drain the write request, too.
- *
- * by_parent_cb == false: Test that bdrv_drain_invoke() doesn't poll
+ * Test that bdrv_drain_invoke() doesn't poll
  *
  *     PA's BdrvChildClass has a .drained_begin callback that schedules a BH
  *     that does the same graph change. If bdrv_drain_invoke() calls it, the
  *     state is messed up, but if it is only polled in the single
  *     BDRV_POLL_WHILE() at the end of the drain, this should work fine.
  */
-static void test_detach_indirect(bool by_parent_cb)
+static void test_detach_indirect(void)
 {
     BlockBackend *blk;
     BlockDriverState *parent_a, *parent_b, *a, *b, *c;
     BdrvChild *child_a, *child_b;
     BlockAIOCB *acb;
+    BDRVTestState *s;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    if (!by_parent_cb) {
-        detach_by_driver_cb_class = child_of_bds;
-    }
+    detach_by_driver_cb_class = child_of_bds;
 
     /* Create all involved nodes */
     parent_a = bdrv_new_open_driver(&bdrv_test, "parent-a", BDRV_O_RDWR,
@@ -1382,10 +1369,8 @@ static void test_detach_indirect(bool by_parent_cb)
 
     /* If we want to get bdrv_drain_invoke() to call aio_poll(), the driver
      * callback must not return immediately. */
-    if (!by_parent_cb) {
-        BDRVTestState *s = parent_a->opaque;
-        s->sleep_in_drain_begin = true;
-    }
+    s = parent_a->opaque;
+    s->sleep_in_drain_begin = true;
 
     /* Set child relationships */
     bdrv_ref(b);
@@ -1397,7 +1382,7 @@ static void test_detach_indirect(bool by_parent_cb)
 
     bdrv_ref(a);
     bdrv_attach_child(parent_a, a, "PA-A",
-                      by_parent_cb ? &child_of_bds : &detach_by_driver_cb_class,
+                      &detach_by_driver_cb_class,
                       BDRV_CHILD_DATA, &error_abort);
 
     g_assert_cmpint(parent_a->refcnt, ==, 1);
@@ -1415,16 +1400,13 @@ static void test_detach_indirect(bool by_parent_cb)
         .parent_b = parent_b,
         .child_b = child_b,
         .c = c,
-        .by_parent_cb = by_parent_cb,
     };
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
 
-    if (!by_parent_cb) {
-        /* set .drained_begin cb to run only in the following drain. */
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
-    }
+    /* set .drained_begin cb to run only in the following drain. */
+    detach_by_driver_cb_class.drained_begin =
+        detach_by_driver_cb_drained_begin;
 
     /* Drain and check the expected result */
     bdrv_subtree_drained_begin(parent_b);
@@ -1460,14 +1442,9 @@ static void test_detach_indirect(bool by_parent_cb)
     bdrv_unref(c);
 }
 
-static void test_detach_by_parent_cb(void)
-{
-    test_detach_indirect(true);
-}
-
 static void test_detach_by_driver_cb(void)
 {
-    test_detach_indirect(false);
+    test_detach_indirect();
 }
 
 static void test_append_to_drained(void)
@@ -2222,7 +2199,6 @@ int main(int argc, char **argv)
     g_test_add_func("/bdrv-drain/detach/drain_all", test_detach_by_drain_all);
     g_test_add_func("/bdrv-drain/detach/drain", test_detach_by_drain);
     g_test_add_func("/bdrv-drain/detach/drain_subtree", test_detach_by_drain_subtree);
-    g_test_add_func("/bdrv-drain/detach/parent_cb", test_detach_by_parent_cb);
     g_test_add_func("/bdrv-drain/detach/driver_cb", test_detach_by_driver_cb);
 
     g_test_add_func("/bdrv-drain/attach/drain", test_append_to_drained);
-- 
2.31.1


