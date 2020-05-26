Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10EF1CFB75
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 18:59:34 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYYFh-0001lH-NN
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7m-0005TB-NY; Tue, 12 May 2020 12:51:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:50572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7j-0001RE-2m; Tue, 12 May 2020 12:51:22 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7C-0004nT-GY; Tue, 12 May 2020 19:50:46 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/15] block: Add child access functions
Date: Tue, 12 May 2020 19:50:33 +0300
Message-Id: <1589302245-893269-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 10:53:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

There are BDS children that the general block layer code can access,
namely bs->file and bs->backing.  Since the introduction of filters and
external data files, their meaning is not quite clear.  bs->backing can
be a COW source, or it can be an R/W-filtered child; bs->file can be an
R/W-filtered child, it can be data and metadata storage, or it can be
just metadata storage.

This overloading really is not helpful.  This patch adds function that
retrieve the correct child for each exact purpose.  Later patches in
this series will make use of them.  Doing so will allow us to handle
filter nodes and external data files in a meaningful way.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block.c                   | 99 +++++++++++++++++++++++++++++++++++++++++++++++
 include/block/block_int.h | 57 +++++++++++++++++++++++++--
 2 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 0653ccb..b2aae2e 100644
--- a/block.c
+++ b/block.c
@@ -6764,3 +6764,102 @@ void bdrv_del_child(BlockDriverState *parent_bs, BdrvChild *child, Error **errp)
 
     parent_bs->drv->bdrv_del_child(parent_bs, child, errp);
 }
+
+/*
+ * Return the child that @bs acts as an overlay for, and from which data may be
+ * copied in COW or COR operations.  Usually this is the backing file.
+ */
+BdrvChild *bdrv_filtered_cow_child(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return NULL;
+    }
+
+    if (bs->drv->is_filter) {
+        return NULL;
+    }
+
+    return bs->backing;
+}
+
+/*
+ * If @bs acts as a pass-through filter for one of its children,
+ * return that child.  "Pass-through" means that write operations to
+ * @bs are forwarded to that child instead of triggering COW.
+ */
+BdrvChild *bdrv_filtered_rw_child(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return NULL;
+    }
+
+    if (!bs->drv->is_filter) {
+        return NULL;
+    }
+
+    /* Only one of @backing or @file may be used */
+    assert(!(bs->backing && bs->file));
+
+    return bs->backing ?: bs->file;
+}
+
+/*
+ * Return any filtered child, independently of how it reacts to write
+ * accesses and whether data is copied onto this BDS through COR.
+ */
+BdrvChild *bdrv_filtered_child(BlockDriverState *bs)
+{
+    BdrvChild *cow_child = bdrv_filtered_cow_child(bs);
+    BdrvChild *rw_child = bdrv_filtered_rw_child(bs);
+
+    /* There can only be one filtered child at a time */
+    assert(!(cow_child && rw_child));
+
+    return cow_child ?: rw_child;
+}
+
+/*
+ * Return the child that stores the metadata for this node.
+ */
+BdrvChild *bdrv_metadata_child(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return NULL;
+    }
+
+    /* Filters do not have metadata */
+    if (bs->drv->is_filter) {
+        return NULL;
+    }
+
+    return bs->file;
+}
+
+/*
+ * Return the child that stores the data that is allocated on this
+ * node.  This may or may not include metadata.
+ */
+BdrvChild *bdrv_storage_child(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return NULL;
+    }
+
+    if (bs->drv->bdrv_storage_child) {
+        return bs->drv->bdrv_storage_child(bs);
+    }
+
+    return bdrv_filtered_rw_child(bs) ?: bs->file;
+}
+
+/*
+ * Return the primary child of this node: For filters, that is the
+ * filtered child.  For other nodes, that is usually the child storing
+ * metadata.
+ * (A generally more helpful description is that this is (usually) the
+ * child that has the same filename as @bs.)
+ */
+BdrvChild *bdrv_primary_child(BlockDriverState *bs)
+{
+    return bdrv_filtered_rw_child(bs) ?: bs->file;
+}
diff --git a/include/block/block_int.h b/include/block/block_int.h
index df6d027..dca59e9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -89,9 +89,11 @@ struct BlockDriver {
     int instance_size;
 
     /* set to true if the BlockDriver is a block filter. Block filters pass
-     * certain callbacks that refer to data (see block.c) to their bs->file if
-     * the driver doesn't implement them. Drivers that do not wish to forward
-     * must implement them and return -ENOTSUP.
+     * certain callbacks that refer to data (see block.c) to their bs->file
+     * or bs->backing (whichever one exists) if the driver doesn't implement
+     * them. Drivers that do not wish to forward must implement them and return
+     * -ENOTSUP.
+     * Note that filters are not allowed to modify data.
      */
     bool is_filter;
     /*
@@ -585,6 +587,13 @@ struct BlockDriver {
      * If this pointer is NULL, the array is considered empty.
      * "filename" and "driver" are always considered strong. */
     const char *const *strong_runtime_opts;
+
+    /**
+     * Return the data storage child, if there is exactly one.  If
+     * this function is not implemented, the block layer will assume
+     * bs->file to be this child.
+     */
+    BdrvChild *(*bdrv_storage_child)(BlockDriverState *bs);
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
@@ -1332,6 +1341,48 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 void bdrv_set_monitor_owned(BlockDriverState *bs);
 BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp);
 
+BdrvChild *bdrv_filtered_cow_child(BlockDriverState *bs);
+BdrvChild *bdrv_filtered_rw_child(BlockDriverState *bs);
+BdrvChild *bdrv_filtered_child(BlockDriverState *bs);
+BdrvChild *bdrv_metadata_child(BlockDriverState *bs);
+BdrvChild *bdrv_storage_child(BlockDriverState *bs);
+BdrvChild *bdrv_primary_child(BlockDriverState *bs);
+
+static inline BlockDriverState *child_bs(BdrvChild *child)
+{
+    return child ? child->bs : NULL;
+}
+
+static inline BlockDriverState *bdrv_filtered_cow_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_filtered_cow_child(bs));
+}
+
+static inline BlockDriverState *bdrv_filtered_rw_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_filtered_rw_child(bs));
+}
+
+static inline BlockDriverState *bdrv_filtered_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_filtered_child(bs));
+}
+
+static inline BlockDriverState *bdrv_metadata_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_metadata_child(bs));
+}
+
+static inline BlockDriverState *bdrv_storage_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_storage_child(bs));
+}
+
+static inline BlockDriverState *bdrv_primary_bs(BlockDriverState *bs)
+{
+    return child_bs(bdrv_primary_child(bs));
+}
+
 /**
  * Simple implementation of bdrv_co_create_opts for protocol drivers
  * which only support creation via opening a file
-- 
1.8.3.1


