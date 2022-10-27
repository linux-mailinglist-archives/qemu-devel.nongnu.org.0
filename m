Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A11610152
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7g8-0001LI-Ee; Thu, 27 Oct 2022 14:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g6-0001If-6t
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g2-0002PV-6k
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yS80rZc/juQiJgUoXlvgP8YIBeHkHqYtqn2t2MmGKw=;
 b=TxJfBFSmS/wdmTpGu1J8yHlBvYEBbuKPL5GofDiIRSyE/klyXcn5B+VZ/yu2fgVqEKQfBB
 k3sm6eoyGGp2EwmbrlR/QkB46yBOpzPmK8GXO+PenLrLB10k0Lr35cl4hd2zAaIjCqKdk+
 2kHY5UFEKFQ8CzgjCDIjbHr/Z+oHtG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-wtot4a2JPBeL6GvQ_O2Aiw-1; Thu, 27 Oct 2022 14:32:24 -0400
X-MC-Unique: wtot4a2JPBeL6GvQ_O2Aiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A9F18F0269;
 Thu, 27 Oct 2022 18:32:23 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DDF112C077;
 Thu, 27 Oct 2022 18:32:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 13/58] test-bdrv-graph-mod: fix filters to be filters
Date: Thu, 27 Oct 2022 20:31:01 +0200
Message-Id: <20221027183146.463129-14-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

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
Message-Id: <20220726201134.924743-7-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  5 +++--
 tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 95392052c9..10feef9f0c 100644
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
2.37.3


