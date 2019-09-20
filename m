Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F45B91B6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 16:25:14 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBJqT-0007Wx-Ep
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 10:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmW-0004Z6-9G
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmU-0000t0-Jt
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:43800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmQ-0000g7-7d; Fri, 20 Sep 2019 10:21:02 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmM-0006b5-7T; Fri, 20 Sep 2019 17:20:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v13 01/15] block/backup: fix max_transfer handling for
 copy_range
Date: Fri, 20 Sep 2019 17:20:42 +0300
Message-Id: <20190920142056.12778-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920142056.12778-1-vsementsov@virtuozzo.com>
References: <20190920142056.12778-1-vsementsov@virtuozzo.com>
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
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Of course, QEMU_ALIGN_UP is a typo, it should be QEMU_ALIGN_DOWN, as we
are trying to find aligned size which satisfy both source and target.
Also, don't ignore too small max_transfer. In this case seems safer to
disable copy_range.

Fixes: 9ded4a0114968e
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 763f0d7ff6..db20249063 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -741,12 +741,19 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cluster_size = cluster_size;
     job->copy_bitmap = copy_bitmap;
     copy_bitmap = NULL;
-    job->use_copy_range = !compress; /* compression isn't supported for it */
     job->copy_range_size = MIN_NON_ZERO(blk_get_max_transfer(job->common.blk),
                                         blk_get_max_transfer(job->target));
-    job->copy_range_size = MAX(job->cluster_size,
-                               QEMU_ALIGN_UP(job->copy_range_size,
-                                             job->cluster_size));
+    job->copy_range_size = QEMU_ALIGN_DOWN(job->copy_range_size,
+                                           job->cluster_size);
+    /*
+     * Set use_copy_range, consider the following:
+     * 1. Compression is not supported for copy_range.
+     * 2. copy_range does not respect max_transfer (it's a TODO), so we factor
+     *    that in here. If max_transfer is smaller than the job->cluster_size,
+     *    we do not use copy_range (in that case it's zero after aligning down
+     *    above).
+     */
+    job->use_copy_range = !compress && job->copy_range_size > 0;
 
     /* Required permissions are already taken with target's blk_new() */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
-- 
2.21.0


