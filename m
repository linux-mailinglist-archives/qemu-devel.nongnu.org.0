Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC1B8CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 10:28:23 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBEH8-0001oY-BF
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 04:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBEEh-0008E1-Cz
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBEEg-0005PX-1l
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:25:51 -0400
Received: from relay.sw.ru ([185.231.240.75]:60538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBEEc-0005Nf-PO; Fri, 20 Sep 2019 04:25:46 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBEEZ-0004DS-GB; Fri, 20 Sep 2019 11:25:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/3] block: move bdrv_can_store_new_dirty_bitmap to
 block/dirty-bitmap.c
Date: Fri, 20 Sep 2019 11:25:41 +0300
Message-Id: <20190920082543.23444-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920082543.23444-1-vsementsov@virtuozzo.com>
References: <20190920082543.23444-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block/dirty-bitmap.c seems to be more appropriate for it and
bdrv_remove_persistent_dirty_bitmap already in it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 block.c              | 22 ----------------------
 block/dirty-bitmap.c | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 5944124845..bea03cfcc9 100644
--- a/block.c
+++ b/block.c
@@ -6555,25 +6555,3 @@ void bdrv_del_child(BlockDriverState *parent_bs, BdrvChild *child, Error **errp)
 
     parent_bs->drv->bdrv_del_child(parent_bs, child, errp);
 }
-
-bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
-                                     uint32_t granularity, Error **errp)
-{
-    BlockDriver *drv = bs->drv;
-
-    if (!drv) {
-        error_setg_errno(errp, ENOMEDIUM,
-                         "Can't store persistent bitmaps to %s",
-                         bdrv_get_device_or_node_name(bs));
-        return false;
-    }
-
-    if (!drv->bdrv_can_store_new_dirty_bitmap) {
-        error_setg_errno(errp, ENOTSUP,
-                         "Can't store persistent bitmaps to %s",
-                         bdrv_get_device_or_node_name(bs));
-        return false;
-    }
-
-    return drv->bdrv_can_store_new_dirty_bitmap(bs, name, granularity, errp);
-}
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 134e0c9a0c..8f42015db9 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -464,6 +464,28 @@ void bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs,
     }
 }
 
+bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
+                                     uint32_t granularity, Error **errp)
+{
+    BlockDriver *drv = bs->drv;
+
+    if (!drv) {
+        error_setg_errno(errp, ENOMEDIUM,
+                         "Can't store persistent bitmaps to %s",
+                         bdrv_get_device_or_node_name(bs));
+        return false;
+    }
+
+    if (!drv->bdrv_can_store_new_dirty_bitmap) {
+        error_setg_errno(errp, ENOTSUP,
+                         "Can't store persistent bitmaps to %s",
+                         bdrv_get_device_or_node_name(bs));
+        return false;
+    }
+
+    return drv->bdrv_can_store_new_dirty_bitmap(bs, name, granularity, errp);
+}
+
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap)
 {
     bdrv_dirty_bitmap_lock(bitmap);
-- 
2.21.0


