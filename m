Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DECDB105
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:23:28 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7c7-0002R1-VE
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iL6eg-0002Df-RD
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iL6ef-0006MD-Mx
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:21:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:35146)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iL6ed-0006JB-1X; Thu, 17 Oct 2019 10:21:27 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iL6eZ-0007Ck-Kx; Thu, 17 Oct 2019 17:21:23 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/backup: drop dead code from backup_job_create
Date: Thu, 17 Oct 2019 17:21:22 +0300
Message-Id: <20191017142122.20897-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After commit 00e30f05de1d195, there is no more "goto error" points
after job creation, so after "error:" @job is always NULL and we don't
need roll-back job creation.

Reported-by: Coverity (CID 1406402)
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 46978c1785..6e1497f7bb 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -474,10 +474,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(bs, sync_bitmap, NULL);
     }
-    if (job) {
-        backup_clean(&job->common.job);
-        job_early_fail(&job->common.job);
-    } else if (backup_top) {
+    if (backup_top) {
         bdrv_backup_top_drop(backup_top);
     }
 
-- 
2.21.0


