Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861FDF64
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 11:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL2YJ-0007cr-G0
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 05:26:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hL2HL-0002RM-IA
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hL2HK-0003wL-AF
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:08:51 -0400
Received: from relay.sw.ru ([185.231.240.75]:32890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hL2HJ-0003sT-GO; Mon, 29 Apr 2019 05:08:49 -0400
Received: from [10.28.8.145] (helo=kvm.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hL2HD-0002jV-Ll; Mon, 29 Apr 2019 12:08:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon, 29 Apr 2019 12:08:38 +0300
Message-Id: <20190429090842.57910-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190429090842.57910-1-vsementsov@virtuozzo.com>
References: <20190429090842.57910-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 1/5] block/backup: simplify
 backup_incremental_init_copy_bitmap
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
	jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify backup_incremental_init_copy_bitmap using the function
bdrv_dirty_bitmap_next_dirty_area.

Note: move to job->len instead of bitmap size: it should not matter but
less code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 9988753249..d9f5db18ac 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -403,43 +403,27 @@ static int coroutine_fn backup_run_incremental(BackupBlockJob *job)
 /* init copy_bitmap from sync_bitmap */
 static void backup_incremental_init_copy_bitmap(BackupBlockJob *job)
 {
-    BdrvDirtyBitmapIter *dbi;
-    int64_t offset;
-    int64_t end = DIV_ROUND_UP(bdrv_dirty_bitmap_size(job->sync_bitmap),
-                               job->cluster_size);
-
-    dbi = bdrv_dirty_iter_new(job->sync_bitmap);
-    while ((offset = bdrv_dirty_iter_next(dbi)) != -1) {
-        int64_t cluster = offset / job->cluster_size;
-        int64_t next_cluster;
-
-        offset += bdrv_dirty_bitmap_granularity(job->sync_bitmap);
-        if (offset >= bdrv_dirty_bitmap_size(job->sync_bitmap)) {
-            hbitmap_set(job->copy_bitmap, cluster, end - cluster);
-            break;
-        }
+    uint64_t offset = 0;
+    uint64_t bytes = job->len;
 
-        offset = bdrv_dirty_bitmap_next_zero(job->sync_bitmap, offset,
-                                             UINT64_MAX);
-        if (offset == -1) {
-            hbitmap_set(job->copy_bitmap, cluster, end - cluster);
-            break;
-        }
+    while (bdrv_dirty_bitmap_next_dirty_area(job->sync_bitmap,
+                                             &offset, &bytes))
+    {
+        uint64_t cluster = offset / job->cluster_size;
+        uint64_t end_cluster = DIV_ROUND_UP(offset + bytes, job->cluster_size);
 
-        next_cluster = DIV_ROUND_UP(offset, job->cluster_size);
-        hbitmap_set(job->copy_bitmap, cluster, next_cluster - cluster);
-        if (next_cluster >= end) {
+        hbitmap_set(job->copy_bitmap, cluster, end_cluster - cluster);
+
+        offset = end_cluster * job->cluster_size;
+        if (offset >= job->len) {
             break;
         }
-
-        bdrv_set_dirty_iter(dbi, next_cluster * job->cluster_size);
+        bytes = job->len - offset;
     }
 
     /* TODO job_progress_set_remaining() would make more sense */
     job_progress_update(&job->common.job,
         job->len - hbitmap_count(job->copy_bitmap) * job->cluster_size);
-
-    bdrv_dirty_iter_free(dbi);
 }
 
 static int coroutine_fn backup_run(Job *job, Error **errp)
-- 
2.18.0


