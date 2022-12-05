Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD4642820
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2AIz-0008J0-P3; Mon, 05 Dec 2022 07:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2AIv-0008IG-KS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2AIt-0006Xi-Hv
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670242234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbPu+vp7PvZVFJ3apwCjuxKxuDzeG7IZ/szZJOYbpI0=;
 b=I8EBM/PEgFdsZOwQohLnK6GDhOdTz5bu+Vr1GoYH7HtYJGL7uVRc8Py0h88RJZ3wCiR/PN
 rjakwga8d8e1s4qeLzNRszDMyPJoOwb90JdDgg/AFemNNxuC9lnBPgZtKApempf38iuv9a
 5x5eIDCj249HUxbWxv6BJQpahp1jEhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-rWfHHguYO9iwyG5y3Xp4Ig-1; Mon, 05 Dec 2022 07:10:33 -0500
X-MC-Unique: rWfHHguYO9iwyG5y3Xp4Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EB98800B23;
 Mon,  5 Dec 2022 12:10:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC8263F45;
 Mon,  5 Dec 2022 12:10:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/2] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Date: Mon,  5 Dec 2022 07:10:28 -0500
Message-Id: <20221205121029.1089209-2-eesposit@redhat.com>
In-Reply-To: <20221205121029.1089209-1-eesposit@redhat.com>
References: <20221205121029.1089209-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This test uses a callback of an I/O function (blk_aio_preadv)
to modify the graph, using bdrv_attach_child.
This is simply not allowed anymore. I/O cannot change the graph.

The problem in this test is in:

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
6. Here is the problem: detach_by_parent_aio_cb modifies the graph,
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
 tests/unit/test-bdrv-drain.c | 41 ++++++++----------------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 09dc4a4891..4ce159250e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1316,7 +1316,6 @@ struct detach_by_parent_data {
     BdrvChild *child_b;
     BlockDriverState *c;
     BdrvChild *child_c;
-    bool by_parent_cb;
 };
 static struct detach_by_parent_data detach_by_parent_data;
 
@@ -1334,12 +1333,7 @@ static void detach_indirect_bh(void *opaque)
 
 static void detach_by_parent_aio_cb(void *opaque, int ret)
 {
-    struct detach_by_parent_data *data = &detach_by_parent_data;
-
     g_assert_cmpint(ret, ==, 0);
-    if (data->by_parent_cb) {
-        detach_indirect_bh(data);
-    }
 }
 
 static void detach_by_driver_cb_drained_begin(BdrvChild *child)
@@ -1358,33 +1352,25 @@ static BdrvChildClass detach_by_driver_cb_class;
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
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
-    }
+    detach_by_driver_cb_class = child_of_bds;
+    detach_by_driver_cb_class.drained_begin = detach_by_driver_cb_drained_begin;
 
     /* Create all involved nodes */
     parent_a = bdrv_new_open_driver(&bdrv_test, "parent-a", BDRV_O_RDWR,
@@ -1403,10 +1389,8 @@ static void test_detach_indirect(bool by_parent_cb)
 
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
@@ -1418,7 +1402,7 @@ static void test_detach_indirect(bool by_parent_cb)
 
     bdrv_ref(a);
     bdrv_attach_child(parent_a, a, "PA-A",
-                      by_parent_cb ? &child_of_bds : &detach_by_driver_cb_class,
+                      &detach_by_driver_cb_class,
                       BDRV_CHILD_DATA, &error_abort);
 
     g_assert_cmpint(parent_a->refcnt, ==, 1);
@@ -1436,7 +1420,6 @@ static void test_detach_indirect(bool by_parent_cb)
         .parent_b = parent_b,
         .child_b = child_b,
         .c = c,
-        .by_parent_cb = by_parent_cb,
     };
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
@@ -1475,14 +1458,9 @@ static void test_detach_indirect(bool by_parent_cb)
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
@@ -2236,7 +2214,6 @@ int main(int argc, char **argv)
     g_test_add_func("/bdrv-drain/detach/drain_all", test_detach_by_drain_all);
     g_test_add_func("/bdrv-drain/detach/drain", test_detach_by_drain);
     g_test_add_func("/bdrv-drain/detach/drain_subtree", test_detach_by_drain_subtree);
-    g_test_add_func("/bdrv-drain/detach/parent_cb", test_detach_by_parent_cb);
     g_test_add_func("/bdrv-drain/detach/driver_cb", test_detach_by_driver_cb);
 
     g_test_add_func("/bdrv-drain/attach/drain", test_append_to_drained);
-- 
2.31.1


