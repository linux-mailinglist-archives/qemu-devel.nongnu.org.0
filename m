Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341161019F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:28:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hV-0003z2-NR; Thu, 27 Oct 2022 14:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gQ-0001rW-O5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gG-0002UD-CP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OF9Eb81K7rIUOcViapjPkejE5ftvTUvO9fRnfffb/w=;
 b=AKhj1lZkxr1LiUCy9XbJcVgnos9ZSLb2WSwwIhsngcK9FKGd/hOto2pDMliZAKi86pzGm2
 AnmnKA8H8b52VtdWc/99WRvHp+2CGHxM8M+mR32YkBG8TCinTV0YYyPkmecxY/zO/ThR6q
 nXI08OC7jtqIRcMkm4eRsP3H7SILEfk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-07a4KgPQPVCZH3V5BuvOGg-1; Thu, 27 Oct 2022 14:32:36 -0400
X-MC-Unique: 07a4KgPQPVCZH3V5BuvOGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7615858F17;
 Thu, 27 Oct 2022 18:32:35 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1059F1121320;
 Thu, 27 Oct 2022 18:32:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 25/58] bdrv_change_aio_context: use hash table instead of list
 of visited nodes
Date: Thu, 27 Oct 2022 20:31:13 +0200
Message-Id: <20221027183146.463129-26-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Minor performance improvement, but given that we have hash tables
available, avoid iterating in the visited nodes list every time just
to check if a node has been already visited.

The data structure is not actually a proper hash map, but an hash set,
as we are just adding nodes and not key,value pairs.

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221025084952.2139888-4-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h |  2 +-
 include/block/block_int-common.h   |  3 ++-
 block.c                            | 28 ++++++++++++++++------------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 7b0095b419..e7372ec541 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -233,7 +233,7 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
-                                   GSList **visited, Transaction *tran,
+                                   GHashTable *visited, Transaction *tran,
                                    Error **errp);
 int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                       BdrvChild *ignore_child, Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9067a99249..7ccbbdae05 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -911,7 +911,8 @@ struct BdrvChildClass {
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
 
     bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
-                           GSList **visited, Transaction *tran, Error **errp);
+                           GHashTable *visited, Transaction *tran,
+                           Error **errp);
 
     AioContext *(*get_parent_aio_context)(BdrvChild *child);
 
diff --git a/block.c b/block.c
index 38e5d831ca..59319d9b0f 100644
--- a/block.c
+++ b/block.c
@@ -105,7 +105,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 static bool bdrv_backing_overridden(BlockDriverState *bs);
 
 static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                    GSList **visited, Transaction *tran,
+                                    GHashTable *visited, Transaction *tran,
                                     Error **errp);
 
 /* If non-zero, use only whitelisted block drivers */
@@ -7315,14 +7315,15 @@ typedef struct BdrvStateSetAioContext {
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
@@ -7353,14 +7354,14 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
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
 
@@ -7445,7 +7446,7 @@ static TransactionActionDrv set_aio_context = {
  * responsible for freeing the list afterwards.
  */
 static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                    GSList **visited, Transaction *tran,
+                                    GHashTable *visited, Transaction *tran,
                                     Error **errp)
 {
     BdrvChild *c;
@@ -7524,7 +7525,7 @@ int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                       BdrvChild *ignore_child, Error **errp)
 {
     Transaction *tran;
-    GSList *visited;
+    GHashTable *visited;
     int ret;
     AioContext *old_context = bdrv_get_aio_context(bs);
     GLOBAL_STATE_CODE();
@@ -7536,9 +7537,12 @@ int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
      * is successful (the transaction itself).
      */
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
 
     /*
      * Linear phase: go through all callbacks collected in the transaction.
-- 
2.37.3


