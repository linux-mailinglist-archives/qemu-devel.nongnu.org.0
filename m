Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8DB36F92B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:23:14 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcREn-000483-VL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQl2-0004G5-24
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkz-0002Z9-OU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Do1QNBCSuDEiCmyL31EFXHWHsqNooal/1M9hd73ZUqs=;
 b=cIYImyKEarGNHGmZYYGbRBBywlZR5A5U/G3CfYiotVrs8f1XleQi4fFO6zJ/axjWPeR5s9
 X8gFgN+G1m9dOvr6LqKsptkpKNYpljiZu3J2WH6bPwutVdR+WPzZ+Nu8ks58qxu3/2Leqo
 It+7b2togM7nWf8Kh6DdH4cWnw159Xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-yLfNWZvjPJuIrw8Qra0k4g-1; Fri, 30 Apr 2021 06:52:21 -0400
X-MC-Unique: yLfNWZvjPJuIrw8Qra0k4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02DA4593C0;
 Fri, 30 Apr 2021 10:52:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A668267889;
 Fri, 30 Apr 2021 10:52:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/39] block: use topological sort for permission update
Date: Fri, 30 Apr 2021 12:51:21 +0200
Message-Id: <20210430105147.125840-14-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rewrite bdrv_check_perm(), bdrv_abort_perm_update() and bdrv_set_perm()
to update nodes in topological sort order instead of simple DFS. With
topologically sorted nodes, we update a node only when all its parents
already updated. With DFS it's not so.

Consider the following example:

    A -+
    |  |
    |  v
    |  B
    |  |
    v  |
    C<-+

A is parent for B and C, B is parent for C.

Obviously, to update permissions, we should go in order A B C, so, when
we update C, all parent permissions already updated. But with current
approach (simple recursion) we can update in sequence A C B C (C is
updated twice). On first update of C, we consider old B permissions, so
doing wrong thing. If it succeed, all is OK, on second C update we will
finish with correct graph. But if the wrong thing failed, we break the
whole process for no reason (it's possible that updated B permission
will be less strict, but we will never check it).

Also new approach gives a way to simultaneously and correctly update
several nodes, we just need to run bdrv_topological_dfs() several times
to add all nodes and their subtrees into one topologically sorted list
(next patch will update bdrv_replace_node() in this manner).

Test test_parallel_perm_update() is now passing, so move it out of
debugging "if".

We also need to support ignore_children in
bdrv_parent_perms_conflict()

For test 283 order of conflicting parents check is changed.

Note also that in bdrv_check_perm() we don't check for parents conflict
at root bs, as we may be in the middle of permission update in
bdrv_reopen_multiple(). bdrv_reopen_multiple() will be updated soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-14-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 116 +++++++++++++++++++++++++------
 tests/unit/test-bdrv-graph-mod.c |   4 +-
 tests/qemu-iotests/283.out       |   2 +-
 3 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index e5af4cdae9..cbcc4c15a0 100644
--- a/block.c
+++ b/block.c
@@ -2054,7 +2054,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
+                                       GSList *ignore_children,
+                                       Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2064,8 +2066,12 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
      * directions.
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
+        if (g_slist_find(ignore_children, a)) {
+            continue;
+        }
+
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b) {
+            if (a == b || g_slist_find(ignore_children, b)) {
                 continue;
             }
 
@@ -2094,6 +2100,40 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+/*
+ * Adds the whole subtree of @bs (including @bs itself) to the @list (except for
+ * nodes that are already in the @list, of course) so that final list is
+ * topologically sorted. Return the result (GSList @list object is updated, so
+ * don't use old reference after function call).
+ *
+ * On function start @list must be already topologically sorted and for any node
+ * in the @list the whole subtree of the node must be in the @list as well. The
+ * simplest way to satisfy this criteria: use only result of
+ * bdrv_topological_dfs() or NULL as @list parameter.
+ */
+static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
+                                    BlockDriverState *bs)
+{
+    BdrvChild *child;
+    g_autoptr(GHashTable) local_found = NULL;
+
+    if (!found) {
+        assert(!list);
+        found = local_found = g_hash_table_new(NULL, NULL);
+    }
+
+    if (g_hash_table_contains(found, bs)) {
+        return list;
+    }
+    g_hash_table_add(found, bs);
+
+    QLIST_FOREACH(child, &bs->children, next) {
+        list = bdrv_topological_dfs(list, found, child->bs);
+    }
+
+    return g_slist_prepend(list, bs);
+}
+
 static void bdrv_child_set_perm_commit(void *opaque)
 {
     BdrvChild *c = opaque;
@@ -2158,10 +2198,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
  * A call to this function must always be followed by a call to bdrv_set_perm()
  * or bdrv_abort_perm_update().
  */
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                uint64_t cumulative_perms,
+                                uint64_t cumulative_shared_perms,
+                                GSList *ignore_children, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2226,21 +2266,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
-        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
+    }
+
+    return 0;
+}
+
+static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                           uint64_t cumulative_perms,
+                           uint64_t cumulative_shared_perms,
+                           GSList *ignore_children, Error **errp)
+{
+    int ret;
+    BlockDriverState *root = bs;
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
 
-        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
-                                     cur_ignore_children, errp);
-        g_slist_free(cur_ignore_children);
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bs != root) {
+            if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+                return -EINVAL;
+            }
+
+            bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                     &cumulative_shared_perms);
+        }
+
+        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
+                                   cumulative_shared_perms,
+                                   ignore_children, errp);
         if (ret < 0) {
             return ret;
         }
-
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2250,10 +2312,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
  * taken file locks) need to be undone.
- *
- * This function recursively notifies all child nodes.
  */
-static void bdrv_abort_perm_update(BlockDriverState *bs)
+static void bdrv_node_abort_perm_update(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2268,11 +2328,19 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
-        bdrv_abort_perm_update(c->bs);
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs)
+static void bdrv_abort_perm_update(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+
+    for ( ; list; list = list->next) {
+        bdrv_node_abort_perm_update((BlockDriverState *)list->data);
+    }
+}
+
+static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
@@ -2298,7 +2366,15 @@ static void bdrv_set_perm(BlockDriverState *bs)
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_commit(c);
-        bdrv_set_perm(c->bs);
+    }
+}
+
+static void bdrv_set_perm(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+
+    for ( ; list; list = list->next) {
+        bdrv_node_set_perm((BlockDriverState *)list->data);
     }
 }
 
@@ -2411,7 +2487,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
-    if (bdrv_parent_perms_conflict(bs, errp)) {
+    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
         return -EPERM;
     }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a6064b1863..e64e81a07c 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -406,12 +406,12 @@ int main(int argc, char *argv[])
     g_test_add_func("/bdrv-graph-mod/update-perm-tree", test_update_perm_tree);
     g_test_add_func("/bdrv-graph-mod/should-update-child",
                     test_should_update_child);
+    g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                    test_parallel_perm_update);
 
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
-        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
-                        test_parallel_perm_update);
         g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
                         test_append_greedy_filter);
     }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 37c35058ae..73eb75102f 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by other as 'image', which uses 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.30.2


