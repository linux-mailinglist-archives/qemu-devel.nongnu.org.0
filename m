Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577661016D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:18:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gD-0001Pg-TR; Thu, 27 Oct 2022 14:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gA-0001OJ-Tz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g5-0002Qy-O8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hd/LXjT3r7TTkhGchCe5XkpQclJpmiklOmssXYMIIio=;
 b=DSOM2WB+c5oRMjd6aJddKyLXZfijg7dwPToOs450ujBurso9y3I7tmNbybfiyvGF0HUyvh
 C9mibjq0lv8DWGRBr9TYVxAgpa2fvy95sZ1VmobDgDc7qYc4gbXhYgMVLDaJjsEJ+OMZSJ
 HThwqbR198ERHbtcxMuUiERmsnIVzwY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-7JXPSHDNMBGXGcUMdaHTag-1; Thu, 27 Oct 2022 14:32:25 -0400
X-MC-Unique: 7JXPSHDNMBGXGcUMdaHTag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BC0A800B23;
 Thu, 27 Oct 2022 18:32:20 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66BB9112C065;
 Thu, 27 Oct 2022 18:32:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 11/58] test-bdrv-graph-mod: update test_parallel_perm_update
 test case
Date: Thu, 27 Oct 2022 20:30:59 +0200
Message-Id: <20221027183146.463129-12-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-5-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.37.3


