Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D831295
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:41:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkaW-0003zD-BR
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:41:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWkRv-0006mt-2A
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWkRs-0008Dm-O5
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:32:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:57214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hWkRs-0008Aa-CQ; Fri, 31 May 2019 12:32:08 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hWkRo-0006Lb-BU; Fri, 31 May 2019 19:32:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 31 May 2019 19:31:58 +0300
Message-Id: <20190531163202.162543-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190531163202.162543-1-vsementsov@virtuozzo.com>
References: <20190531163202.162543-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 5/9] block/qcow2-bitmap: drop
 qcow2_reopen_bitmaps_rw_hint()
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

The function is unused, drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h        |  2 --
 block/qcow2-bitmap.c | 15 +--------------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 567375e56c..88a2030f54 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -732,8 +732,6 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
 bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
 Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                                 Error **errp);
-int qcow2_reopen_bitmaps_rw_hint(BlockDriverState *bs, bool *header_updated,
-                                 Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 60b79f1dac..fbeee37243 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1102,8 +1102,7 @@ Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
     return list;
 }
 
-int qcow2_reopen_bitmaps_rw_hint(BlockDriverState *bs, bool *header_updated,
-                                 Error **errp)
+int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
@@ -1111,10 +1110,6 @@ int qcow2_reopen_bitmaps_rw_hint(BlockDriverState *bs, bool *header_updated,
     GSList *ro_dirty_bitmaps = NULL;
     int ret = 0;
 
-    if (header_updated != NULL) {
-        *header_updated = false;
-    }
-
     if (s->nb_bitmaps == 0) {
         /* No bitmaps - nothing to do */
         return 0;
@@ -1156,9 +1151,6 @@ int qcow2_reopen_bitmaps_rw_hint(BlockDriverState *bs, bool *header_updated,
             error_setg_errno(errp, -ret, "Can't update bitmap directory");
             goto out;
         }
-        if (header_updated != NULL) {
-            *header_updated = true;
-        }
         g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
     }
 
@@ -1169,11 +1161,6 @@ out:
     return ret;
 }
 
-int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp)
-{
-    return qcow2_reopen_bitmaps_rw_hint(bs, NULL, errp);
-}
-
 /* Checks to see if it's safe to resize bitmaps */
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp)
 {
-- 
2.18.0


