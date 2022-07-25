Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8157FEF5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:25:36 +0200 (CEST)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFx9T-00086N-0t
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5X-0002XV-SV
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5U-00061a-0K
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xl16RQ27IbssBeTxi2z23S4vpV8WJZdQC/pP649MYjo=;
 b=gbUgGS0lYulxZj8dttigI2cBcbm7X/zCqixcE0Ng47fGYZ8JJQtM4yKoCtWLAEij6UMSAV
 EF5BN7WgzhP6ku72adczoeSx9u0G6yd1Dmz6f1lE68ohxf3A5DPWXggqTL7x0agAidANd0
 oyTBhQHURt68TI1ey/TyZuR9H6SPEXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-zw5qGrT8MPGuOR0wh5cT5Q-1; Mon, 25 Jul 2022 08:21:26 -0400
X-MC-Unique: zw5qGrT8MPGuOR0wh5cT5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44628853AB;
 Mon, 25 Jul 2022 12:21:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 753E618EB5;
 Mon, 25 Jul 2022 12:21:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 03/11] bdrv_change_aio_context: use hash table instead of
 list of visited nodes
Date: Mon, 25 Jul 2022 08:21:12 -0400
Message-Id: <20220725122120.309236-4-eesposit@redhat.com>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Minor performance improvement, but given that we have hash tables
available, avoid iterating in the visited nodes list every time just
to check if a node has been already visited.

The data structure is not actually a proper hash map, but an hash set,
as we are just adding nodes and not key,value pairs.

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 28 ++++++++++++++++------------
 include/block/block-global-state.h |  2 +-
 include/block/block_int-common.h   |  3 ++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index c80e49009a..c02a628336 100644
--- a/block.c
+++ b/block.c
@@ -109,7 +109,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 static bool bdrv_backing_overridden(BlockDriverState *bs);
 
 static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                    GSList **visited, Transaction *tran,
+                                    GHashTable *visited, Transaction *tran,
                                     Error **errp);
 
 /* If non-zero, use only whitelisted block drivers */
@@ -7444,14 +7444,15 @@ typedef struct BdrvStateSetAioContext {
 } BdrvStateSetAioContext;
 
 static bool bdrv_parent_change_aio_context(BdrvChild *c, AioContext *ctx,
-                                           GSList **visited, Transaction *tran,
+                                           GHashTable *visited,
+                                           Transaction *tran,
                                            Error **errp)
 {
     GLOBAL_STATE_CODE();
-    if (g_slist_find(*visited, c)) {
+    if (g_hash_table_contains(visited, c)) {
         return true;
     }
-    *visited = g_slist_prepend(*visited, c);
+    g_hash_table_add(visited, c);
 
     /*
      * A BdrvChildClass that doesn't handle AioContext changes cannot
@@ -7482,14 +7483,14 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 }
 
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
-                                   GSList **visited, Transaction *tran,
+                                   GHashTable *visited, Transaction *tran,
                                    Error **errp)
 {
     GLOBAL_STATE_CODE();
-    if (g_slist_find(*visited, c)) {
+    if (g_hash_table_contains(visited, c)) {
         return true;
     }
-    *visited = g_slist_prepend(*visited, c);
+    g_hash_table_add(visited, c);
     return bdrv_change_aio_context(c->bs, ctx, visited, tran, errp);
 }
 
@@ -7561,7 +7562,7 @@ static TransactionActionDrv set_aio_context = {
  * responsible for freeing the list afterwards.
  */
 static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                    GSList **visited, Transaction *tran,
+                                    GHashTable *visited, Transaction *tran,
                                     Error **errp)
 {
     BdrvChild *c;
@@ -7646,16 +7647,19 @@ int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                       BdrvChild *ignore_child, Error **errp)
 {
     Transaction *tran;
-    GSList *visited;
+    GHashTable *visited;
     int ret;
     AioContext *old_context = bdrv_get_aio_context(bs);
     GLOBAL_STATE_CODE();
 
     /* Recursion phase: go through all nodes of the graph */
     tran = tran_new();
-    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
-    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
-    g_slist_free(visited);
+    visited = g_hash_table_new(NULL, NULL);
+    if (ignore_child) {
+        g_hash_table_add(visited, ignore_child);
+    }
+    ret = bdrv_change_aio_context(bs, ctx, visited, tran, errp);
+    g_hash_table_destroy(visited);
 
     /* Linear phase: go through all callbacks collected in the transaction */
 
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index fdcb81a175..ceecf0aa8e 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -230,7 +230,7 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
-                                   GSList **visited, Transaction *tran,
+                                   GHashTable *visited, Transaction *tran,
                                    Error **errp);
 int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                       BdrvChild *ignore_child, Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 43828cf74f..c639873487 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -897,7 +897,8 @@ struct BdrvChildClass {
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
 
     bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
-                           GSList **visited, Transaction *tran, Error **errp);
+                           GHashTable *visited, Transaction *tran,
+                           Error **errp);
 
     AioContext *(*get_parent_aio_context)(BdrvChild *child);
 
-- 
2.31.1


