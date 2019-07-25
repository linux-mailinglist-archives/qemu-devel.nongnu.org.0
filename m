Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C21749B1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:19:56 +0200 (CEST)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZul-0000bj-6P
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35755)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZtz-0007SK-HW
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZty-00044m-1L
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:44250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtx-00042q-NJ; Thu, 25 Jul 2019 05:19:05 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtw-0001bs-Ca; Thu, 25 Jul 2019 12:19:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 12:19:00 +0300
Message-Id: <20190725091900.30542-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190725091900.30542-1-vsementsov@virtuozzo.com>
References: <20190725091900.30542-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3 9/9] qcow2-bitmap: move bitmap reopen-rw
 code to qcow2_reopen_prepare
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
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we have used .bdrv_need_rw_file_child_during_reopen_rw handler,
and have write access to file child in reopen-prepare, and we prepared
qcow2_reopen_bitmaps_rw to be called from reopening rw -> rw, we now
can simple move qcow2_reopen_bitmaps_rw() call to
qcow2_reopen_prepare() and handle errors as befits.

Hacky handler .bdrv_reopen_bitmaps_rw is not needed more and therefore
dropped.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  6 ------
 block.c                   | 19 -------------------
 block/qcow2.c             |  6 +++++-
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 7bd6fd68dd..5077b26561 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -533,12 +533,6 @@ struct BlockDriver {
 
      bool (*bdrv_need_rw_file_child_during_reopen_rw)(BlockDriverState *bs);
 
-    /**
-     * Bitmaps should be marked as 'IN_USE' in the image on reopening image
-     * as rw. This handler should realize it. It also should unset readonly
-     * field of BlockDirtyBitmap's in case of success.
-     */
-    int (*bdrv_reopen_bitmaps_rw)(BlockDriverState *bs, Error **errp);
     bool (*bdrv_can_store_new_dirty_bitmap)(BlockDriverState *bs,
                                             const char *name,
                                             uint32_t granularity,
diff --git a/block.c b/block.c
index 3c8e1c59b4..71b4f9961c 100644
--- a/block.c
+++ b/block.c
@@ -4037,16 +4037,12 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     BlockDriver *drv;
     BlockDriverState *bs;
     BdrvChild *child;
-    bool old_can_write, new_can_write;
 
     assert(reopen_state != NULL);
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
 
-    old_can_write =
-        !bdrv_is_read_only(bs) && !(bdrv_get_flags(bs) & BDRV_O_INACTIVE);
-
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
         drv->bdrv_reopen_commit(reopen_state);
@@ -4090,21 +4086,6 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     }
 
     bdrv_refresh_limits(bs, NULL);
-
-    new_can_write =
-        !bdrv_is_read_only(bs) && !(bdrv_get_flags(bs) & BDRV_O_INACTIVE);
-    if (!old_can_write && new_can_write && drv->bdrv_reopen_bitmaps_rw) {
-        Error *local_err = NULL;
-        if (drv->bdrv_reopen_bitmaps_rw(bs, &local_err) < 0) {
-            /* This is not fatal, bitmaps just left read-only, so all following
-             * writes will fail. User can remove read-only bitmaps to unblock
-             * writes.
-             */
-            error_reportf_err(local_err,
-                              "%s: Failed to make dirty bitmaps writable: ",
-                              bdrv_get_node_name(bs));
-        }
-    }
 }
 
 /*
diff --git a/block/qcow2.c b/block/qcow2.c
index 1d9fb3ae98..1ef71c1f1f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1815,6 +1815,11 @@ static int qcow2_reopen_prepare(BDRVReopenState *state,
         if (ret < 0) {
             goto fail;
         }
+    } else {
+        ret = qcow2_reopen_bitmaps_rw(state->bs, errp);
+        if (ret < 0) {
+            goto fail;
+        }
     }
 
     return 0;
@@ -5229,7 +5234,6 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_detach_aio_context  = qcow2_detach_aio_context,
     .bdrv_attach_aio_context  = qcow2_attach_aio_context,
 
-    .bdrv_reopen_bitmaps_rw = qcow2_reopen_bitmaps_rw,
     .bdrv_can_store_new_dirty_bitmap = qcow2_can_store_new_dirty_bitmap,
     .bdrv_remove_persistent_dirty_bitmap = qcow2_remove_persistent_dirty_bitmap,
     .bdrv_need_rw_file_child_during_reopen_rw = qcow2_has_bitmaps,
-- 
2.18.0


