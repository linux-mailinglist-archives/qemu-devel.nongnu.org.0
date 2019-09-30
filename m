Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D92C242A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:22:47 +0200 (CEST)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExVd-000889-NO
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOJ-0004Yf-VK
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOI-0005us-MU
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:46664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOF-0005ot-9Z; Mon, 30 Sep 2019 11:15:07 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOC-0005tD-IE; Mon, 30 Sep 2019 18:15:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 10/10] block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty
Date: Mon, 30 Sep 2019 18:15:02 +0300
Message-Id: <20190930151502.7829-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930151502.7829-1-vsementsov@virtuozzo.com>
References: <20190930151502.7829-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

store_bitmap_data() loop does bdrv_set_dirty_iter() on each iteration,
which means that we actually don't need iterator itself and we can use
simpler bitmap API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-bitmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 98294a7696..09d892638d 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1260,7 +1260,6 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
     uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
     const char *bm_name = bdrv_dirty_bitmap_name(bitmap);
     uint8_t *buf = NULL;
-    BdrvDirtyBitmapIter *dbi;
     uint64_t *tb;
     uint64_t tb_size =
             size_to_clusters(s,
@@ -1279,12 +1278,14 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
         return NULL;
     }
 
-    dbi = bdrv_dirty_iter_new(bitmap);
     buf = g_malloc(s->cluster_size);
     limit = bytes_covered_by_bitmap_cluster(s, bitmap);
     assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
 
-    while ((offset = bdrv_dirty_iter_next(dbi)) >= 0) {
+    offset = 0;
+    while ((offset = bdrv_dirty_bitmap_next_dirty(bitmap, offset, INT64_MAX))
+           >= 0)
+    {
         uint64_t cluster = offset / limit;
         uint64_t end, write_size;
         int64_t off;
@@ -1331,19 +1332,17 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
             break;
         }
 
-        bdrv_set_dirty_iter(dbi, end);
+        offset = end;
     }
 
     *bitmap_table_size = tb_size;
     g_free(buf);
-    bdrv_dirty_iter_free(dbi);
 
     return tb;
 
 fail:
     clear_bitmap_table(bs, tb, tb_size);
     g_free(buf);
-    bdrv_dirty_iter_free(dbi);
     g_free(tb);
 
     return NULL;
-- 
2.21.0


