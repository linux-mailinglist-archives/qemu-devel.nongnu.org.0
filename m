Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BC61FA14
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os56s-0005SK-Kt; Mon, 07 Nov 2022 11:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56p-0005Pi-Qd; Mon, 07 Nov 2022 11:36:27 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56n-0000GS-Lu; Mon, 07 Nov 2022 11:36:27 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 5F7A35F3E3;
 Mon,  7 Nov 2022 19:36:15 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7318::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6oMWGH9or4-aENC3YCE; Mon, 07 Nov 2022 19:36:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667838974; bh=sMSKoXrIwnB9j3ELiriv3/2q8O1xxftJlNX7bSulgTc=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=fSDOsGuc9IjeaKgtwDigR6qce45cOB3aK9rDqvUxfx0rJC8YOKrOZXDqUG6QkzumC
 sO5BZGK6NuwWPfxFJOcDbxQMRz31xkxPHraTNgGVLBXVCzHegFXs08yRrqCmgjJZQK
 CLe0m1Xpbpts/5wG2m8QQYP4GqFCH2KPZfk5WNTw=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v8 4/4] block: refactor bdrv_list_refresh_perms to allow any
 list of nodes
Date: Mon,  7 Nov 2022 19:35:58 +0300
Message-Id: <20221107163558.618889-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107163558.618889-1-vsementsov@yandex-team.ru>
References: <20221107163558.618889-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

We are going to increase usage of collecting nodes in a list to then
update, and calling bdrv_topological_dfs() each time is not convenient,
and not correct as we are going to interleave graph modifying with
filling the node list.

So, let's switch to a function that takes any list of nodes, adds all
their subtrees and do topological sort. And finally, refresh
permissions.

While being here, make the function public, as we'll want to use it
from blockdev.c in near future.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index eed54f968d..4e039ee220 100644
--- a/block.c
+++ b/block.c
@@ -2511,8 +2511,12 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
+/*
+ * @list is a product of bdrv_topological_dfs() (may be called several times) -
+ * a topologically sorted subgraph.
+ */
+static int bdrv_do_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                 Transaction *tran, Error **errp)
 {
     int ret;
     BlockDriverState *bs;
@@ -2534,6 +2538,24 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
+/*
+ * @list is any list of nodes. List is completed by all subtrees and
+ * topologically sorted. It's not a problem if some node occurs in the @list
+ * several times.
+ */
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
+{
+    g_autoptr(GHashTable) found = g_hash_table_new(NULL, NULL);
+    g_autoptr(GSList) refresh_list = NULL;
+
+    for ( ; list; list = list->next) {
+        refresh_list = bdrv_topological_dfs(refresh_list, found, list->data);
+    }
+
+    return bdrv_do_refresh_perms(refresh_list, q, tran, errp);
+}
+
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2594,7 +2616,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
         tran = local_tran = tran_new();
     }
 
-    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    ret = bdrv_do_refresh_perms(list, NULL, tran, errp);
 
     if (local_tran) {
         tran_finalize(local_tran, ret);
@@ -4350,7 +4372,6 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     BlockReopenQueueEntry *bs_entry, *next;
     AioContext *ctx;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -4380,18 +4401,15 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bs_entry->prepared = true;
     }
 
-    found = g_hash_table_new(NULL, NULL);
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
 
-        refresh_list = bdrv_topological_dfs(refresh_list, found, state->bs);
+        refresh_list = g_slist_prepend(refresh_list, state->bs);
         if (state->old_backing_bs) {
-            refresh_list = bdrv_topological_dfs(refresh_list, found,
-                                                state->old_backing_bs);
+            refresh_list = g_slist_prepend(refresh_list, state->old_backing_bs);
         }
         if (state->old_file_bs) {
-            refresh_list = bdrv_topological_dfs(refresh_list, found,
-                                                state->old_file_bs);
+            refresh_list = g_slist_prepend(refresh_list, state->old_file_bs);
         }
     }
 
@@ -5108,7 +5126,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     Error **errp)
 {
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *to_cow_parent = NULL;
     int ret;
@@ -5149,10 +5166,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
-    found = g_hash_table_new(NULL, NULL);
-
-    refresh_list = bdrv_topological_dfs(refresh_list, found, to);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, from);
+    refresh_list = g_slist_prepend(refresh_list, to);
+    refresh_list = g_slist_prepend(refresh_list, from);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
     if (ret < 0) {
@@ -5237,7 +5252,6 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 {
     int ret;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
@@ -5249,9 +5263,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     bdrv_replace_child_tran(child, new_bs, tran);
 
-    found = g_hash_table_new(NULL, NULL);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+    refresh_list = g_slist_prepend(refresh_list, old_bs);
+    refresh_list = g_slist_prepend(refresh_list, new_bs);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
-- 
2.34.1


