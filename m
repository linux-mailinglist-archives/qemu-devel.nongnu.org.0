Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969634EB4D6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:49:20 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZImF-0004Yx-Kp
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:49:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIet-0003iu-E7; Tue, 29 Mar 2022 16:41:44 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:49870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIep-0006ZY-A3; Tue, 29 Mar 2022 16:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=1L4k2gAWVX4zj+5QqFcW0HSFBLJV/FfxUvF82Oj5WM0=; 
 t=1648586499;x=1649191899; 
 b=VAaSxzvSdjPQu5PuotfAPzXHMMOPSePoVNFHdDLjqLoNlXEgNcc2o34NA2YWx+OlIr9RIK4VdLtD3Qs+tunrdScV+7PdDFyqLyRy5c6rPpKywkvuFm6gE+XVrXE4kJXu5BpedhlBon/pJW1/V/DMEsmL4+/XFi30JYyCEEAQvRCZIFqcIzpGO1XN9NFVlgKTP2iHwi5vp1aBwDFnTJiv+6aMCqSkTfhLJ8tlQAMKmrSwH8riKP58YZYCoXS0hyfLSk6wrUwlZ0h44UNk8pawaIRXqeBnHuAVn0g6/A3om9WXByTLbV70OlILsP2/S7AFoUQ/pJiNm4B08wx76DewnQ==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIen-000374-3j; Tue, 29 Mar 2022 23:41:37 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 04/45] test-bdrv-graph-mod: update
 test_parallel_perm_update test case
Date: Tue, 29 Mar 2022 23:40:26 +0300
Message-Id: <20220329204107.411011-5-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6155011D2176585D5E1D932C628789187E00894C459B0CD1B9FA56F0B93261D8E12587C5BBE144EB2EC206EF2094F4D734F618F6F9AC73237B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7081BBE264C6D7F42EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637575C0790A70C4B158638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A05458C46951720BF5C90DC095AB2B276F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73C4D5265B590B1679FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8883BAB8B32E402CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC74F4549EE67997D43AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC36703085CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5E5CB6F22651DBA0630AC5FABFB3D7EA99C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349379E7F8541B6C9AAD4EFB449E33A2C9B4E099A09C633C8655075D22E1EC01D30E86F6A150A1CF761D7E09C32AA3244C322BB313FD893C809874B9DE730228511E098CBE561D634383B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYvvRb1IRkbfA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D01305676C5D68106D8EEC4672EA2C5A1B0DDEFE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

While being here, update the picture to better correspond to the test
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/unit/test-bdrv-graph-mod.c | 70 ++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a6e3bb79be..40795d3c04 100644
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
+ *    Making bdrv_refresh_perms() public just for this test doesn't worth it)
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
@@ -290,7 +307,7 @@ static BlockDriver bdrv_write_to_file = {
  *
  * So, exclusive write is propagated.
  *
- * Assume, we want to make fl2 active instead of fl1.
+ * Assume, we want to select fl2  instead of fl1.
  * So, we set some option for top driver and do permission update.
  *
  * With simple DFS, if permission update goes first through
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
2.35.1


