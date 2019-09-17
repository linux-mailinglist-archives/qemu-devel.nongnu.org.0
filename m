Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD4B5297
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 18:12:29 +0200 (CEST)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAG5b-0007m4-Sr
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 12:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iAG0z-0004Y9-Cc
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:07:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iAG0y-000750-7U
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:07:41 -0400
Received: from relay.sw.ru ([185.231.240.75]:53070)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iAG0t-00072T-7L; Tue, 17 Sep 2019 12:07:35 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iAG0q-0003UJ-HO; Tue, 17 Sep 2019 19:07:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 17 Sep 2019 19:07:31 +0300
Message-Id: <20190917160731.10895-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917160731.10895-1-vsementsov@virtuozzo.com>
References: <20190917160731.10895-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v12 2/2] block/backup: fix
 backup_cow_with_offload for last cluster
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shouldn't try to copy bytes beyond EOF. Fix it.

Fixes: 9ded4a0114968e
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/backup.c b/block/backup.c
index d8fdbfadfe..89f7f89200 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -161,7 +161,7 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
 
     assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
-    nbytes = MIN(job->copy_range_size, end - start);
+    nbytes = MIN(job->copy_range_size, MIN(end, job->len) - start);
     nr_clusters = DIV_ROUND_UP(nbytes, job->cluster_size);
     bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
                             job->cluster_size * nr_clusters);
-- 
2.21.0


