Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25DACBFCD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 17:55:08 +0200 (CEST)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGPuz-0005gV-A6
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 11:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPnh-000371-UL
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPng-0005du-UR
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:36340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnR-0005Ec-Hz; Fri, 04 Oct 2019 11:47:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnL-00019e-2t; Fri, 04 Oct 2019 18:47:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/5] block/dirty-bitmap: add bdrv_has_named_bitmaps helper
Date: Fri,  4 Oct 2019 18:46:59 +0300
Message-Id: <20191004154701.3202-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004154701.3202-1-vsementsov@virtuozzo.com>
References: <20191004154701.3202-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
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
 quintela@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be used for bitmap migration in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  1 +
 block/dirty-bitmap.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 4b4b731b46..4c0ebe5c2a 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -101,6 +101,7 @@ int64_t bdrv_get_meta_dirty_count(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_truncate(BlockDriverState *bs, int64_t bytes);
 bool bdrv_dirty_bitmap_readonly(const BdrvDirtyBitmap *bitmap);
 bool bdrv_has_readonly_bitmaps(BlockDriverState *bs);
+bool bdrv_has_named_bitmaps(BlockDriverState *bs);
 bool bdrv_dirty_bitmap_get_autoload(const BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_get_persistence(BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_inconsistent(const BdrvDirtyBitmap *bitmap);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 134e0c9a0c..cfc957ebc2 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -742,6 +742,19 @@ bool bdrv_has_readonly_bitmaps(BlockDriverState *bs)
     return false;
 }
 
+bool bdrv_has_named_bitmaps(BlockDriverState *bs)
+{
+    BdrvDirtyBitmap *bm;
+
+    QLIST_FOREACH(bm, &bs->dirty_bitmaps, list) {
+        if (bdrv_dirty_bitmap_name(bm)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* Called with BQL taken. */
 void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap, bool persistent)
 {
-- 
2.21.0


