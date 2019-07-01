Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E935CF2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 14:35:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYV87-0000XI-CZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 08:34:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5q-00081j-Dv
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5p-0006Ki-82
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:38 -0400
Received: from relay.sw.ru ([185.231.240.75]:52306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5o-0006EG-Uf; Wed, 05 Jun 2019 08:32:37 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5i-0001rG-5k; Wed, 05 Jun 2019 15:32:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 15:32:28 +0300
Message-Id: <20190605123229.92848-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190605123229.92848-1-vsementsov@virtuozzo.com>
References: <20190605123229.92848-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 1/2] block: introduce pinned blk
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add stay_at_node fields to BlockBackend and BdrvChild, for the same
behavior as stay_at_node field of BdrvChildRole. It will be used for
block-job blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h      |  6 ++++++
 include/sysemu/block-backend.h |  2 ++
 block.c                        |  2 +-
 block/block-backend.c          | 25 ++++++++++++++++++++++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 06df2bda1b..1a2eebd904 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -729,6 +729,12 @@ struct BdrvChild {
      */
     bool frozen;
 
+    /*
+     * This link should not be modified in bdrv_replace_node process. Used by
+     * should_update_child()
+     */
+    bool stay_at_node;
+
     QLIST_ENTRY(BdrvChild) next;
     QLIST_ENTRY(BdrvChild) next_parent;
 };
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 733c4957eb..fb248be977 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -77,6 +77,8 @@ typedef struct BlockBackendPublic {
 } BlockBackendPublic;
 
 BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm);
+BlockBackend *blk_new_pinned(AioContext *ctx,
+                             uint64_t perm, uint64_t shared_perm);
 BlockBackend *blk_new_open(const char *filename, const char *reference,
                            QDict *options, int flags, Error **errp);
 int blk_get_refcnt(BlockBackend *blk);
diff --git a/block.c b/block.c
index e3e77feee0..fda92c8629 100644
--- a/block.c
+++ b/block.c
@@ -3971,7 +3971,7 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     GHashTable *found;
     bool ret;
 
-    if (c->role->stay_at_node) {
+    if (c->stay_at_node || c->role->stay_at_node) {
         return false;
     }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index f5d9407d20..cd59f98e51 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -88,6 +88,11 @@ struct BlockBackend {
      * Accessed with atomic ops.
      */
     unsigned int in_flight;
+
+    /*
+     * On blk_insert_bs() new child will inherit  @stay_at_node.
+     */
+    bool stay_at_node;
 };
 
 typedef struct BlockBackendAIOCB {
@@ -321,9 +326,14 @@ static const BdrvChildRole child_root = {
  * to other users of the attached node.
  * Both sets of permissions can be changed later using blk_set_perm().
  *
+ * @stay_at_node is used to set stay_at_node field of child, attached in
+ * blk_insert_bs(). If true, child bs will not be updated on bdrv_replace_node.
+ *
  * Return the new BlockBackend on success, null on failure.
  */
-BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
+static BlockBackend *blk_new_common(AioContext *ctx,
+                                    uint64_t perm, uint64_t shared_perm,
+                                    bool stay_at_node)
 {
     BlockBackend *blk;
 
@@ -332,6 +342,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     blk->ctx = ctx;
     blk->perm = perm;
     blk->shared_perm = shared_perm;
+    blk->stay_at_node = stay_at_node;
     blk_set_enable_write_cache(blk, true);
 
     blk->on_read_error = BLOCKDEV_ON_ERROR_REPORT;
@@ -347,6 +358,17 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     return blk;
 }
 
+BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
+{
+    return blk_new_common(ctx, perm, shared_perm, false);
+}
+
+BlockBackend *blk_new_pinned(AioContext *ctx,
+                             uint64_t perm, uint64_t shared_perm)
+{
+    return blk_new_common(ctx, perm, shared_perm, true);
+}
+
 /*
  * Creates a new BlockBackend, opens a new BlockDriverState, and connects both.
  * The new BlockBackend is in the main AioContext.
@@ -808,6 +830,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     if (blk->root == NULL) {
         return -EPERM;
     }
+    blk->root->stay_at_node = blk->stay_at_node;
 
     notifier_list_notify(&blk->insert_bs_notifiers, blk);
     if (tgm->throttle_state) {
-- 
2.18.0


