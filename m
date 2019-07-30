Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D97ADDB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 18:35:03 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsV5b-0004pq-1c
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 12:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53255)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3c-0001oI-DR
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsV3b-0002X1-E0
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:33:00 -0400
Received: from relay.sw.ru ([185.231.240.75]:54214)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3Z-0002Uo-1i; Tue, 30 Jul 2019 12:32:57 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsV3V-0001Yw-Bq; Tue, 30 Jul 2019 19:32:53 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:32:49 +0300
Message-Id: <20190730163251.755248-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190730163251.755248-1-vsementsov@virtuozzo.com>
References: <20190730163251.755248-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/3] block/backup: deal with zero detection
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

We have detect_zeroes option, so at least for blockdev-backup user
should define it if zero-detection is needed. For drive-backup leave
detection enabled by default but do it through existing option instead
of open-coding.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 15 ++++++---------
 blockdev.c     |  8 ++++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 715e1d3be8..f4aaf08df3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -110,7 +110,10 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-    int write_flags = job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0;
+    int write_flags =
+            (job->serialize_target_writes ? BDRV_REQ_SERIALISING : 0) |
+            (job->compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
+
 
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
     hbitmap_reset(job->copy_bitmap, start, job->cluster_size);
@@ -128,14 +131,8 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
         goto fail;
     }
 
-    if (buffer_is_zero(*bounce_buffer, nbytes)) {
-        ret = blk_co_pwrite_zeroes(job->target, start,
-                                   nbytes, write_flags | BDRV_REQ_MAY_UNMAP);
-    } else {
-        ret = blk_co_pwrite(job->target, start,
-                            nbytes, *bounce_buffer, write_flags |
-                            (job->compress ? BDRV_REQ_WRITE_COMPRESSED : 0));
-    }
+    ret = blk_co_pwrite(job->target, start, nbytes, *bounce_buffer,
+                        write_flags);
     if (ret < 0) {
         trace_backup_do_cow_write_fail(job, start, ret);
         if (error_is_read) {
diff --git a/blockdev.c b/blockdev.c
index 4d141e9a1f..a94d754504 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3434,7 +3434,7 @@ static BlockJob *do_drive_backup(DriveBackup *backup, JobTxn *txn,
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
     AioContext *aio_context;
-    QDict *options = NULL;
+    QDict *options;
     Error *local_err = NULL;
     int flags, job_flags = JOB_DEFAULT;
     int64_t size;
@@ -3529,10 +3529,10 @@ static BlockJob *do_drive_backup(DriveBackup *backup, JobTxn *txn,
         goto out;
     }
 
+    options = qdict_new();
+    qdict_put_str(options, "discard", "unmap");
+    qdict_put_str(options, "detect-zeroes", "unmap");
     if (backup->format) {
-        if (!options) {
-            options = qdict_new();
-        }
         qdict_put_str(options, "driver", backup->format);
     }
 
-- 
2.18.0


