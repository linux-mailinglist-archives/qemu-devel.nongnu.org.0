Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6F7ADDA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsV5X-0004gf-0o
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53261)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3c-0001p5-PJ
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3b-0002XD-Ml
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:33:00 -0400
Received: from relay.sw.ru ([185.231.240.75]:54206)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3Z-0002Uq-3E; Tue, 30 Jul 2019 12:32:57 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3V-0001Yw-RV; Tue, 30 Jul 2019 19:32:53 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:32:51 +0300
Message-Id: <20190730163251.755248-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190730163251.755248-1-vsementsov@virtuozzo.com>
References: <20190730163251.755248-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 3/3] block/backup: refactor write_flags
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

write flags are constant, let's store it in BackupBlockJob instead of
recalculating. It also makes two boolean fields to be unused, so,
drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index c5f941101a..4651649e9d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -47,7 +47,6 @@ typedef struct BackupBlockJob {
     uint64_t len;
     uint64_t bytes_read;
     int64_t cluster_size;
-    bool compress;
     NotifierWithReturn before_write;
     QLIST_HEAD(, CowRequest) inflight_reqs;
 
@@ -55,7 +54,7 @@ typedef struct BackupBlockJob {
     bool use_copy_range;
     int64_t copy_range_size;
 
-    bool serialize_target_writes;
+    BdrvRequestFlags write_flags;
 } BackupBlockJob;
 
 static const BlockJobDriver backup_job_driver;
@@ -110,10 +109,6 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-    int write_flags =
-            (job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0) |
-            (job->compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
-
 
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
     hbitmap_reset(job->copy_bitmap, start, job->cluster_size);
@@ -132,7 +127,7 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
     }
 
     ret = blk_co_pwrite(job->target, start, nbytes, *bounce_buffer,
-                        write_flags);
+                        job->write_flags);
     if (ret < 0) {
         trace_backup_do_cow_write_fail(job, start, ret);
         if (error_is_read) {
@@ -160,7 +155,6 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-    int write_flags = job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0;
 
     assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
@@ -168,7 +162,7 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
     nr_clusters = DIV_ROUND_UP(nbytes, job->cluster_size);
     hbitmap_reset(job->copy_bitmap, start, job->cluster_size * nr_clusters);
     ret = blk_co_copy_range(blk, start, job->target, start, nbytes,
-                            read_flags, write_flags);
+                            read_flags, job->write_flags);
     if (ret < 0) {
         trace_backup_do_cow_copy_range_fail(job, start, ret);
         hbitmap_set(job->copy_bitmap, start, job->cluster_size * nr_clusters);
@@ -638,10 +632,16 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->sync_mode = sync_mode;
     job->sync_bitmap = sync_mode == MIRROR_SYNC_MODE_INCREMENTAL ?
                        sync_bitmap : NULL;
-    job->compress = compress;
 
-    /* Detect image-fleecing (and similar) schemes */
-    job->serialize_target_writes = bdrv_chain_contains(target, bs);
+    /*
+     * Set write flags:
+     *  1. Detect image-fleecing (and similar) schemes
+     *  2. Handle compression
+     */
+    job->write_flags =
+            (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
+
     job->cluster_size = cluster_size;
     job->copy_bitmap = copy_bitmap;
     copy_bitmap = NULL;
-- 
2.18.0


