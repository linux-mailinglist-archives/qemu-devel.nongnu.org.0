Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EC36F943
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:27:03 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRIU-00005k-Ss
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkc-0003gY-S0
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQka-0002IF-0S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKvkrsToDZGTY0s8+SAXCNmyp9LmhNs53k9JJAAUspw=;
 b=CQrS41s2GY4waeJXrZgRg3LS9N5zUHNizK8aso4OhlL56f0P07fp20jGEq3T06PUiuPXrY
 yWcD183lLxqD/sV3P0Lp1fjlPtKwMQ7mkG+VBD8kAPBVKVz06x5v6t9eff03vBgkxGTmjm
 vyagSwnfr1x5547HeGKu+yHjQDnO9h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-SvfWAzFMMouyUQZDas2TEQ-1; Fri, 30 Apr 2021 06:51:56 -0400
X-MC-Unique: SvfWAzFMMouyUQZDas2TEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE0C0501ED;
 Fri, 30 Apr 2021 10:51:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECEDB5F707;
 Fri, 30 Apr 2021 10:51:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/39] tests/test-bdrv-graph-mod: add test_parallel_perm_update
Date: Fri, 30 Apr 2021 12:51:10 +0200
Message-Id: <20210430105147.125840-3-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add test to show that simple DFS recursion order is not correct for
permission update. Correct order is topological-sort order, which will
be introduced later.

Consider the block driver which has two filter children: one active
with exclusive write access and one inactive with no specific
permissions.

And, these two children has a common base child, like this:

┌─────┐     ┌──────┐
│ fl2 │ ◀── │ top  │
└─────┘     └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  │         │ fl1  │
  │         └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  └───────▶ │ base │
            └──────┘

So, exclusive write is propagated.

Assume, we want to make fl2 active instead of fl1.
So, we set some option for top driver and do permission update.

If permission update (remember, it's DFS) goes first through
top->fl1->base branch it will succeed: it firstly drop exclusive write
permissions and than apply them for another BdrvChildren.
But if permission update goes first through top->fl2->base branch it
will fail, as when we try to update fl2->base child, old not yet
updated fl1->base child will be in conflict.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-perm-update

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-graph-mod.c | 116 +++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 80a9a20066..a8219b131e 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -238,6 +238,120 @@ static void test_parallel_exclusive_write(void)
     bdrv_unref(top);
 }
 
+static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
+                                     BdrvChildRole role,
+                                     BlockReopenQueue *reopen_queue,
+                                     uint64_t perm, uint64_t shared,
+                                     uint64_t *nperm, uint64_t *nshared)
+{
+    if (bs->file && c == bs->file) {
+        *nperm = BLK_PERM_WRITE;
+        *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
+    } else {
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+    }
+}
+
+static BlockDriver bdrv_write_to_file = {
+    .format_name = "tricky-perm",
+    .bdrv_child_perm = write_to_file_perms,
+};
+
+
+/*
+ * The following test shows that topological-sort order is required for
+ * permission update, simple DFS is not enough.
+ *
+ * Consider the block driver which has two filter children: one active
+ * with exclusive write access and one inactive with no specific
+ * permissions.
+ *
+ * And, these two children has a common base child, like this:
+ *
+ * ┌─────┐     ┌──────┐
+ * │ fl2 │ ◀── │ top  │
+ * └─────┘     └──────┘
+ *   │           │
+ *   │           │ w
+ *   │           ▼
+ *   │         ┌──────┐
+ *   │         │ fl1  │
+ *   │         └──────┘
+ *   │           │
+ *   │           │ w
+ *   │           ▼
+ *   │         ┌──────┐
+ *   └───────▶ │ base │
+ *             └──────┘
+ *
+ * So, exclusive write is propagated.
+ *
+ * Assume, we want to make fl2 active instead of fl1.
+ * So, we set some option for top driver and do permission update.
+ *
+ * With simple DFS, if permission update goes first through
+ * top->fl1->base branch it will succeed: it firstly drop exclusive write
+ * permissions and than apply them for another BdrvChildren.
+ * But if permission update goes first through top->fl2->base branch it
+ * will fail, as when we try to update fl2->base child, old not yet
+ * updated fl1->base child will be in conflict.
+ *
+ * With topological-sort order we always update parents before children, so fl1
+ * and fl2 are both updated when we update base and there is no conflict.
+ */
+static void test_parallel_perm_update(void)
+{
+    BlockDriverState *top = no_perm_node("top");
+    BlockDriverState *tricky =
+            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
+                                 &error_abort);
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl1 = pass_through_node("fl1");
+    BlockDriverState *fl2 = pass_through_node("fl2");
+    BdrvChild *c_fl1, *c_fl2;
+
+    /*
+     * bdrv_attach_child() eats child bs reference, so we need two @base
+     * references for two filters:
+     */
+    bdrv_ref(base);
+
+    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
+                      &error_abort);
+    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+
+    /* Select fl1 as first child to be active */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+    assert(!(c_fl2->perm & BLK_PERM_WRITE));
+
+    /* Now, try to switch active child and update permissions */
+    tricky->file = c_fl2;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl2->perm & BLK_PERM_WRITE);
+    assert(!(c_fl1->perm & BLK_PERM_WRITE));
+
+    /* Switch once more, to not care about real child order in the list */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+    assert(!(c_fl2->perm & BLK_PERM_WRITE));
+
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -262,6 +376,8 @@ int main(int argc, char *argv[])
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
+        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                        test_parallel_perm_update);
     }
 
     return g_test_run();
-- 
2.30.2


