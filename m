Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2593787D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 17:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYucn-0005N3-LA
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 11:48:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYuWL-0000W6-2K
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYuWJ-0004bD-MW
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:41:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:50220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYuWJ-0004X6-Ey; Thu, 06 Jun 2019 11:41:39 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYuWC-0000xX-Qt; Thu, 06 Jun 2019 18:41:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu,  6 Jun 2019 18:41:30 +0300
Message-Id: <20190606154132.153330-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190606154132.153330-1-vsementsov@virtuozzo.com>
References: <20190606154132.153330-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 2/4] block/block-backend: blk_iostatus_reset:
 drop usage of bs->job
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
	xiechanglong.d@gmail.com, armbru@redhat.com, mreitz@redhat.com,
	den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to remove bs->job pointer. Drop it's usage in
blk_iostatus_reset.

blk_iostatus_reset() has only two callers:

1. blk_attach_dev(). This doesn't have anything to do with jobs and
    attaching a new guest device won't solve any problem the job
    encountered, so no reason to reset the iostatus for the job.

2. qmp_cont(). This resets the iostatus for everything. We can just
    call block_job_iostatus_reset() for all block jobs instead of going
    through BlockBackend.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-backend.c | 4 ----
 qmp.c                 | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f5d9407d20..a8d160fd5d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1073,11 +1073,7 @@ void blk_iostatus_disable(BlockBackend *blk)
 void blk_iostatus_reset(BlockBackend *blk)
 {
     if (blk_iostatus_is_enabled(blk)) {
-        BlockDriverState *bs = blk_bs(blk);
         blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
-        if (bs && bs->job) {
-            block_job_iostatus_reset(bs->job);
-        }
     }
 }
 
diff --git a/qmp.c b/qmp.c
index fa1b3c1577..89cf10e28e 100644
--- a/qmp.c
+++ b/qmp.c
@@ -142,6 +142,7 @@ void qmp_x_exit_preconfig(Error **errp)
 void qmp_cont(Error **errp)
 {
     BlockBackend *blk;
+    BlockJob *job;
     Error *local_err = NULL;
 
     /* if there is a dump in background, we should wait until the dump
@@ -165,6 +166,10 @@ void qmp_cont(Error **errp)
         blk_iostatus_reset(blk);
     }
 
+    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
+        block_job_iostatus_reset(job);
+    }
+
     /* Continuing after completed migration. Images have been inactivated to
      * allow the destination to take control. Need to get control back now.
      *
-- 
2.18.0


