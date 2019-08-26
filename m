Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED19D3DE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 18:21:15 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Hk2-0005xM-5L
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 12:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2HcS-0000RL-Gt
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2HcR-0000qx-56
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:44754)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2HcN-0000lt-Sj; Mon, 26 Aug 2019 12:13:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2HcH-0006QJ-NZ; Mon, 26 Aug 2019 19:13:13 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 26 Aug 2019 19:13:00 +0300
Message-Id: <20190826161312.489398-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190826161312.489398-1-vsementsov@virtuozzo.com>
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 01/13] block/backup: fix
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shouldn't try to copy bytes beyond EOF. Fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/backup.c b/block/backup.c
index 2baf7bed65..33b144305f 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -161,7 +161,7 @@ static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
 
     assert(QEMU_IS_ALIGNED(job->copy_range_size, job->cluster_size));
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
-    nbytes = MIN(job->copy_range_size, end - start);
+    nbytes = MIN(job->copy_range_size, MIN(end - start, job->len - start));
     nr_clusters = DIV_ROUND_UP(nbytes, job->cluster_size);
     bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
                             job->cluster_size * nr_clusters);
-- 
2.18.0


