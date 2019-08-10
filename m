Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C87888D00
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 21:35:41 +0200 (CEST)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwX9Q-0007o1-K5
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 15:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hwX5z-0000LL-NY
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 15:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hwX5y-0007Cp-LL
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 15:32:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:48772)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hwX5s-00076y-IY; Sat, 10 Aug 2019 15:32:01 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hwX5p-0000nK-7l; Sat, 10 Aug 2019 22:31:57 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Sat, 10 Aug 2019 22:31:52 +0300
Message-Id: <20190810193155.58637-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190810193155.58637-1-vsementsov@virtuozzo.com>
References: <20190810193155.58637-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3 4/7] block/backup: drop handling of
 max_transfer for copy_range
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

Since previous commit, copy_range supports max_transfer, so we don't
need to handle it by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index c6a3b2b7bb..228ba9423c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -54,7 +54,6 @@ typedef struct BackupBlockJob {
     QLIST_HEAD(, CowRequest) inflight_reqs;
 
     bool use_copy_range;
-    int64_t copy_range_size;
 
     BdrvRequestFlags write_flags;
     bool initializing_bitmap;
@@ -156,12 +155,11 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
     int ret;
     int nr_clusters;
     BlockBackend *blk = job->common.blk;
-    int nbytes;
+    int nbytes = end - start;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
 
-    assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
+    assert(end - start < INT_MAX);
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
-    nbytes = MIN(job->copy_range_size, end - start);
     nr_clusters = DIV_ROUND_UP(nbytes, job->cluster_size);
     bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
                             job->cluster_size * nr_clusters);
@@ -756,11 +754,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->copy_bitmap = copy_bitmap;
     copy_bitmap = NULL;
     job->use_copy_range = !compress; /* compression isn't supported for it */
-    job->copy_range_size = MIN_NON_ZERO(blk_get_max_transfer(job->common.blk),
-                                        blk_get_max_transfer(job->target));
-    job->copy_range_size = MAX(job->cluster_size,
-                               QEMU_ALIGN_UP(job->copy_range_size,
-                                             job->cluster_size));
 
     /* Required permissions are already taken with target's blk_new() */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
-- 
2.18.0


