Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5387E15
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 17:35:05 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw6v2-0007ut-OY
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 11:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sN-00041h-IE
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sL-0002pQ-5k
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:57596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sI-0002io-1r; Fri, 09 Aug 2019 11:32:14 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sC-0004Cp-FL; Fri, 09 Aug 2019 18:32:08 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:32:02 +0300
Message-Id: <20190809153207.49288-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190809153207.49288-1-vsementsov@virtuozzo.com>
References: <20190809153207.49288-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 2/7] block/backup: refactor write_flags
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
 armbru@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

write flags are constant, let's store it in BackupBlockJob instead of
recalculating. It also makes two boolean fields to be unused, so,
drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index d815436455..c6a3b2b7bb 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -50,14 +50,13 @@ typedef struct BackupBlockJob {
     uint64_t len;
     uint64_t bytes_read;
     int64_t cluster_size;
-    bool compress;
     NotifierWithReturn before_write;
     QLIST_HEAD(, CowRequest) inflight_reqs;
 
     bool use_copy_range;
     int64_t copy_range_size;
 
-    bool serialize_target_writes;
+    BdrvRequestFlags write_flags;
     bool initializing_bitmap;
 } BackupBlockJob;
 
@@ -113,10 +112,6 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-    int write_flags =
-            (job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0) |
-            (job->compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
-
 
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
     bdrv_reset_dirty_bitmap(job->copy_bitmap, start, job->cluster_size);
@@ -135,7 +130,7 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
     }
 
     ret = blk_co_pwrite(job->target, start, nbytes, *bounce_buffer,
-                        write_flags);
+                        job->write_flags);
     if (ret < 0) {
         trace_backup_do_cow_write_fail(job, start, ret);
         if (error_is_read) {
@@ -163,7 +158,6 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-    int write_flags = job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0;
 
     assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
@@ -172,7 +166,7 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
     bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
                             job->cluster_size * nr_clusters);
     ret = blk_co_copy_range(blk, start, job->target, start, nbytes,
-                            read_flags, write_flags);
+                            read_flags, job->write_flags);
     if (ret < 0) {
         trace_backup_do_cow_copy_range_fail(job, start, ret);
         bdrv_set_dirty_bitmap(job->copy_bitmap, start,
@@ -748,10 +742,16 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->sync_mode = sync_mode;
     job->sync_bitmap = sync_bitmap;
     job->bitmap_mode = bitmap_mode;
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


