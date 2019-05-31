Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2E3127B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkUb-00081l-0s
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:34:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWkRu-0006mB-7U
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWkRs-0008DV-NK
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:32:10 -0400
Received: from relay.sw.ru ([185.231.240.75]:57244)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hWkRs-0008Aj-8x; Fri, 31 May 2019 12:32:08 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hWkRp-0006Lb-2U; Fri, 31 May 2019 19:32:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 31 May 2019 19:32:02 +0300
Message-Id: <20190531163202.162543-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190531163202.162543-1-vsementsov@virtuozzo.com>
References: <20190531163202.162543-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 9/9] qcow2-bitmap: move bitmap reopen-rw
 code to qcow2_reopen_prepare
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
index 7b22fb5d9c..a35b3e0d96 100644
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
index 56e1388908..b5527ae713 100644
--- a/block.c
+++ b/block.c
@@ -3894,16 +3894,12 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
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
@@ -3947,21 +3943,6 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
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
index ffc067a8ac..945fae74b5 100644
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
@@ -5215,7 +5220,6 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_detach_aio_context  = qcow2_detach_aio_context,
     .bdrv_attach_aio_context  = qcow2_attach_aio_context,
 
-    .bdrv_reopen_bitmaps_rw = qcow2_reopen_bitmaps_rw,
     .bdrv_can_store_new_dirty_bitmap = qcow2_can_store_new_dirty_bitmap,
     .bdrv_remove_persistent_dirty_bitmap = qcow2_remove_persistent_dirty_bitmap,
     .bdrv_need_rw_file_child_during_reopen_rw = qcow2_has_bitmaps,
-- 
2.18.0


