Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4D64CB88
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S59-0004nY-Se; Wed, 14 Dec 2022 08:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4V-00047c-V6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4U-0003Mq-0C
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79AEXEFfdFHAJvPV9Hmwsio3GBtled1L99oP1llzMW8=;
 b=SeqVeNtWxMv90J2ZJI0J5nzlTELcCHn96DM8EB/sKpUuV5d5NDjQOB/OgHLzKH2aR8pOk4
 rmfMfJOUeL/SXbZZZO7t9fbwqbqxQwRfdep3V8jciKFi+Cctt+bP692/rVgKRAA2nq2zwv
 VuHKlrDzYvol+UY1cQ2+sfS5C/zaQ1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-9xcU0nq8OweA761b-U9cMA-1; Wed, 14 Dec 2022 08:45:12 -0500
X-MC-Unique: 9xcU0nq8OweA761b-U9cMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A4A085A588;
 Wed, 14 Dec 2022 13:45:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9B3814171BE;
 Wed, 14 Dec 2022 13:45:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/51] block: refactor bdrv_list_refresh_perms to allow any
 list of nodes
Date: Wed, 14 Dec 2022 14:44:06 +0100
Message-Id: <20221214134453.31665-5-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Message-Id: <20221107163558.618889-5-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index f2f9178832..385ed3cd53 100644
--- a/block.c
+++ b/block.c
@@ -2521,8 +2521,12 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2544,6 +2548,24 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
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
@@ -2604,7 +2626,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
         tran = local_tran = tran_new();
     }
 
-    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    ret = bdrv_do_refresh_perms(list, NULL, tran, errp);
 
     if (local_tran) {
         tran_finalize(local_tran, ret);
@@ -4360,7 +4382,6 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     BlockReopenQueueEntry *bs_entry, *next;
     AioContext *ctx;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -4390,18 +4411,15 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
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
 
@@ -5118,7 +5136,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     Error **errp)
 {
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *to_cow_parent = NULL;
     int ret;
@@ -5159,10 +5176,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -5247,7 +5262,6 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 {
     int ret;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
@@ -5259,9 +5273,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     bdrv_replace_child_tran(child, new_bs, tran);
 
-    found = g_hash_table_new(NULL, NULL);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+    refresh_list = g_slist_prepend(refresh_list, old_bs);
+    refresh_list = g_slist_prepend(refresh_list, new_bs);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
-- 
2.38.1


