Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B238855A3B8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:38:58 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4r0z-0006rC-Gh
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrw-0008WE-5M; Fri, 24 Jun 2022 17:29:36 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qru-0004RY-6H; Fri, 24 Jun 2022 17:29:35 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E33022E2012;
 Sat, 25 Jun 2022 00:29:25 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 jH1sHSCBzA-TPJqhoBp; Sat, 25 Jun 2022 00:29:25 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106165; bh=1b7az85xv1izAXS2XaeET9ol2g2me2P7ptX9XmoetW4=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=CjuFZ6tXQcGj+en9ylfBqzQotoGINv1KM2Fi5xVgjA4R4g3P3wjjCi+3UAOaqdX0j
 K/h47/2P4b1aVCSJJMEYMi5QHucP7DRajy0YP29E6sId4aBSrRtlq+ONVaVP9aNANC
 2m5yMnOQefemvg9hBXhw6qnFNB+I/Jfwu5dPhIgk=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TPMSrRSK; Sat, 25 Jun 2022 00:29:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 06/15] test-bdrv-graph-mod: fix filters to be filters
Date: Sat, 25 Jun 2022 00:28:21 +0300
Message-Id: <20220624212830.316919-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int-common.h |  5 +++--
 tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9d91ccbcbf..d68adc6ff3 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -122,8 +122,9 @@ struct BlockDriver {
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
index e2f1355af1..c522591531 100644
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
2.25.1


