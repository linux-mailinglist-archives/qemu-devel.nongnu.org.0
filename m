Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74F55A3A3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:35:59 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qy6-0000Yv-Hw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qru-0008SR-BB; Fri, 24 Jun 2022 17:29:34 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:41064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrr-0004Q9-7W; Fri, 24 Jun 2022 17:29:34 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C6C412E3069;
 Sat, 25 Jun 2022 00:29:23 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HlEv3TGcN7-TNJ8KARQ; Sat, 25 Jun 2022 00:29:23 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106163; bh=UbdrGNghJeeR+8t01b6sFaZTQ8ujMvUkKRiu2r1/WNw=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=Bi0hvJM3dKdQO5LI99kEoJHZbYDY7PSHrcmRIriLVR/sqniV2JwZMjmLQiW7ChHvS
 uHlq3Q7luy+ASWGPqsljw3+VEcziR2IyXS7hDBuxlAzF8OG/N0TYKeyn+FtQgRwfvR
 hhaOyUUCMygwwbwGkmac4UZT9Pm3Xs0rCuIOqkxE=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TNMSoCIV; Sat, 25 Jun 2022 00:29:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 04/15] test-bdrv-graph-mod: update
 test_parallel_perm_update test case
Date: Sat, 25 Jun 2022 00:28:19 +0300
Message-Id: <20220624212830.316919-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_parallel_perm_update() does two things that we are going to
restrict in the near future:

1. It updates bs->file field by hand. bs->file will be managed
   automatically by generic code (together with bs->children list).

   Let's better refactor our "tricky" bds to have own state where one
   of children is linked as "selected".
   This also looks less "tricky", so avoid using this word.

2. It create FILTERED children that are not PRIMARY. Except for tests
   all FILTERED children in the Qemu block layer are always PRIMARY as
   well.  We are going to formalize this rule, so let's better use DATA
   children here.

3. It creates more than one FILTERED child, which is already abandoned
   in BDRV_CHILD_FILTERED's description.

While being here, update the picture to better correspond to the test
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/unit/test-bdrv-graph-mod.c | 80 +++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a6e3bb79be..e2f1355af1 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -241,13 +241,26 @@ static void test_parallel_exclusive_write(void)
     bdrv_unref(top);
 }
 
-static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
-                                     BdrvChildRole role,
-                                     BlockReopenQueue *reopen_queue,
-                                     uint64_t perm, uint64_t shared,
-                                     uint64_t *nperm, uint64_t *nshared)
+/*
+ * write-to-selected node may have several DATA children, one of them may be
+ * "selected". Exclusive write permission is taken on selected child.
+ *
+ * We don't realize write handler itself, as we need only to test how permission
+ * update works.
+ */
+typedef struct BDRVWriteToSelectedState {
+    BdrvChild *selected;
+} BDRVWriteToSelectedState;
+
+static void write_to_selected_perms(BlockDriverState *bs, BdrvChild *c,
+                                    BdrvChildRole role,
+                                    BlockReopenQueue *reopen_queue,
+                                    uint64_t perm, uint64_t shared,
+                                    uint64_t *nperm, uint64_t *nshared)
 {
-    if (bs->file && c == bs->file) {
+    BDRVWriteToSelectedState *s = bs->opaque;
+
+    if (s->selected && c == s->selected) {
         *nperm = BLK_PERM_WRITE;
         *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
     } else {
@@ -256,9 +269,10 @@ static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static BlockDriver bdrv_write_to_file = {
-    .format_name = "tricky-perm",
-    .bdrv_child_perm = write_to_file_perms,
+static BlockDriver bdrv_write_to_selected = {
+    .format_name = "write-to-selected",
+    .instance_size = sizeof(BDRVWriteToSelectedState),
+    .bdrv_child_perm = write_to_selected_perms,
 };
 
 
@@ -266,15 +280,18 @@ static BlockDriver bdrv_write_to_file = {
  * The following test shows that topological-sort order is required for
  * permission update, simple DFS is not enough.
  *
- * Consider the block driver which has two filter children: one active
- * with exclusive write access and one inactive with no specific
- * permissions.
+ * Consider the block driver (write-to-selected) which has two children: one is
+ * selected so we have exclusive write access to it and for the other one we
+ * don't need any specific permissions.
  *
  * And, these two children has a common base child, like this:
+ *   (additional "top" on top is used in test just because the only public
+ *    function to update permission should get a specific child to update.
+ *    Making bdrv_refresh_perms() public just for this test isn't worth it)
  *
- * ┌─────┐     ┌──────┐
- * │ fl2 │ ◀── │ top  │
- * └─────┘     └──────┘
+ * ┌─────┐     ┌───────────────────┐     ┌─────┐
+ * │ fl2 │ ◀── │ write-to-selected │ ◀── │ top │
+ * └─────┘     └───────────────────┘     └─────┘
  *   │           │
  *   │           │ w
  *   │           ▼
@@ -290,14 +307,14 @@ static BlockDriver bdrv_write_to_file = {
  *
  * So, exclusive write is propagated.
  *
- * Assume, we want to make fl2 active instead of fl1.
- * So, we set some option for top driver and do permission update.
+ * Assume, we want to select fl2 instead of fl1.
+ * So, we set some option for write-to-selected driver and do permission update.
  *
  * With simple DFS, if permission update goes first through
- * top->fl1->base branch it will succeed: it firstly drop exclusive write
- * permissions and than apply them for another BdrvChildren.
- * But if permission update goes first through top->fl2->base branch it
- * will fail, as when we try to update fl2->base child, old not yet
+ * write-to-selected -> fl1 -> base branch it will succeed: it firstly drop
+ * exclusive write permissions and than apply them for another BdrvChildren.
+ * But if permission update goes first through write-to-selected -> fl2 -> base
+ * branch it will fail, as when we try to update fl2->base child, old not yet
  * updated fl1->base child will be in conflict.
  *
  * With topological-sort order we always update parents before children, so fl1
@@ -306,9 +323,10 @@ static BlockDriver bdrv_write_to_file = {
 static void test_parallel_perm_update(void)
 {
     BlockDriverState *top = no_perm_node("top");
-    BlockDriverState *tricky =
-            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
+    BlockDriverState *ws =
+            bdrv_new_open_driver(&bdrv_write_to_selected, "ws", BDRV_O_RDWR,
                                  &error_abort);
+    BDRVWriteToSelectedState *s = ws->opaque;
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl1 = pass_through_node("fl1");
     BlockDriverState *fl2 = pass_through_node("fl2");
@@ -320,33 +338,33 @@ static void test_parallel_perm_update(void)
      */
     bdrv_ref(base);
 
-    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
+    bdrv_attach_child(top, ws, "file", &child_of_bds, BDRV_CHILD_DATA,
                       &error_abort);
-    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
-                              BDRV_CHILD_FILTERED, &error_abort);
-    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
-                              BDRV_CHILD_FILTERED, &error_abort);
+    c_fl1 = bdrv_attach_child(ws, fl1, "first", &child_of_bds,
+                              BDRV_CHILD_DATA, &error_abort);
+    c_fl2 = bdrv_attach_child(ws, fl2, "second", &child_of_bds,
+                              BDRV_CHILD_DATA, &error_abort);
     bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
                       &error_abort);
     bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
                       &error_abort);
 
     /* Select fl1 as first child to be active */
-    tricky->file = c_fl1;
+    s->selected = c_fl1;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl1->perm & BLK_PERM_WRITE);
     assert(!(c_fl2->perm & BLK_PERM_WRITE));
 
     /* Now, try to switch active child and update permissions */
-    tricky->file = c_fl2;
+    s->selected = c_fl2;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl2->perm & BLK_PERM_WRITE);
     assert(!(c_fl1->perm & BLK_PERM_WRITE));
 
     /* Switch once more, to not care about real child order in the list */
-    tricky->file = c_fl1;
+    s->selected = c_fl1;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl1->perm & BLK_PERM_WRITE);
-- 
2.25.1


