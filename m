Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A64EB4D2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:46:01 +0200 (CEST)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIj2-0007Kh-Ek
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:46:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIez-0003oZ-7g; Tue, 29 Mar 2022 16:41:52 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:54286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIew-0006ac-Tf; Tue, 29 Mar 2022 16:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=a4GeTyuz+fw3jKBZdJyu/UKVlnrfdb8BjyP6LEx1qwA=; 
 t=1648586506;x=1649191906; 
 b=UsJbekXId4QroiDwSe06/l1dcfSYXfWeuOcPo7kivDzzdhmC59+f9G4aoxxJR5+w6YI747UQMTdaHh7rb+Fs1lqQ7eH5oT14MLv/TPod84uDxnLvhZBOwN8qcBk66UyR8HNtvySfLucB3p6KLds9zwrUqDQvC95XeK8TiySFtsb063Fwcj8Xc0zQbyxJq1MC7eKoq7aZDJ7++0TF6YzbFHZfIA9EXXf1KnC71SmBf750kljsf3fZ77Zd7SrJ1W/gIElppWcNOlG7QRPNypJKi+TxhO/GNpV22czGz9p4GV0xIkHx9aCFapPBrHdzSU9xXVFnsHFs1spEAMo0yYg5/w==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIet-000374-Kj; Tue, 29 Mar 2022 23:41:44 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 06/45] test-bdrv-graph-mod: fix filters to be filters
Date: Tue, 29 Mar 2022 23:40:28 +0300
Message-Id: <20220329204107.411011-7-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61C24934C3AF654FA0FDE5B3EC8CDA719600894C459B0CD1B9067698B864E189B344A670F966EA0C5EC206EF2094F4D734FEA01C85A8357090
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70EEC24FFE855BCBBC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7A9D436FF183A167CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6FCD539FB70D52053ABC8D226B9A49E3D20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063793270F7220657A0A389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637EDAD75E181AE3ED6D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7FF666271726182ADEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3D90E0058AC9F27DF35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5BA0B5DC836D620ED2CE48EFD36DBA4139C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34DFB7A809FB53708787A7E0E70D858212DEE3FD3F49D537AC9ED6427286B27C1F486C91C8BB5628A61D7E09C32AA3244C4DF87D8E359E7F8B9E8B5A2E110FB2A81E098CBE561D634383B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZIRZf+CqrBRA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D0130565D062D9F71924AA35295C332FC529DC1E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

bdrv_pass_through is used as filter, even all node variables has
corresponding names. We want to append it, so it should be
backing-child-based filter like mirror_top.
So, in test_update_perm_tree, first child should be DATA, as we don't
want filters with two filtered children.

bdrv_exclusive_writer is used as a filter once. So it should be filter
anyway. We want to append it, so it should be backing-child-based
fitler too.

Make all FILTERED children to be PRIMARY as well. We are going to force
this rule by assertion soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 include/block/block_int.h        |  5 +++--
 tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5ed61bb079..878ece76c7 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -121,8 +121,9 @@ struct BlockDriver {
     /*
      * Only make sense for filter drivers, for others must be false.
      * If true, filtered child is bs->backing. Otherwise it's bs->file.
-     * Only two internal filters use bs->backing as filtered child and has this
-     * field set to true: mirror_top and commit_top.
+     * Two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top. There also two such test
+     * filters in tests/unit/test-bdrv-graph-mod.c.
      *
      * Never create any more such filters!
      *
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 40795d3c04..7265971013 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -26,6 +26,8 @@
 
 static BlockDriver bdrv_pass_through = {
     .format_name = "pass-through",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = bdrv_default_perms,
 };
 
@@ -57,6 +59,8 @@ static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_exclusive_writer = {
     .format_name = "exclusive-writer",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = exclusive_write_perms,
 };
 
@@ -134,7 +138,7 @@ static void test_update_perm_tree(void)
     blk_insert_bs(root, bs, &error_abort);
 
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
-                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
+                      BDRV_CHILD_DATA, &error_abort);
 
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
@@ -228,11 +232,14 @@ static void test_parallel_exclusive_write(void)
      */
     bdrv_ref(base);
 
-    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
+    bdrv_attach_child(top, fl1, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_replace_node(fl1, fl2, &error_abort);
@@ -344,9 +351,11 @@ static void test_parallel_perm_update(void)
                               BDRV_CHILD_DATA, &error_abort);
     c_fl2 = bdrv_attach_child(ws, fl2, "second", &child_of_bds,
                               BDRV_CHILD_DATA, &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     /* Select fl1 as first child to be active */
@@ -397,7 +406,8 @@ static void test_append_greedy_filter(void)
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl = exclusive_writer_node("fl1");
 
-    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+    bdrv_attach_child(top, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_append(fl, base, &error_abort);
-- 
2.35.1


