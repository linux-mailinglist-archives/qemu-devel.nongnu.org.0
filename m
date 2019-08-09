Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2618487E18
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 17:35:33 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw6vU-0008IM-BG
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49089)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sN-00041o-Ih
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hw6sL-0002pS-5o
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:32:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:57612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sI-0002ih-1Z; Fri, 09 Aug 2019 11:32:14 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hw6sD-0004Cp-Hj; Fri, 09 Aug 2019 18:32:09 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:32:06 +0300
Message-Id: <20190809153207.49288-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190809153207.49288-1-vsementsov@virtuozzo.com>
References: <20190809153207.49288-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 6/7] block/backup: teach
 backup_cow_with_bounce_buffer to copy more at once
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

backup_cow_with_offload can transfer more than on cluster. Let
backup_cow_with_bounce_buffer behave similarly. It reduces number
of IO and there are no needs to copy cluster by cluster.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index d482d93458..155e21d0a3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -104,22 +104,25 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
                                                       int64_t start,
                                                       int64_t end,
                                                       bool is_write_notifier,
-                                                      bool *error_is_read,
-                                                      void **bounce_buffer)
+                                                      bool *error_is_read)
 {
     int ret;
     BlockBackend *blk = job->common.blk;
     int nbytes;
     int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
+    void *bounce_buffer;
 
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
-    bdrv_reset_dirty_bitmap(job->copy_bitmap, start, job->cluster_size);
-    nbytes = MIN(job->cluster_size, job->len - start);
-    if (!*bounce_buffer) {
-        *bounce_buffer = blk_blockalign(blk, job->cluster_size);
+
+    nbytes = MIN(end - start, job->len - start);
+    bounce_buffer = blk_try_blockalign(blk, nbytes);
+    if (!bounce_buffer) {
+        return -ENOMEM;
     }
 
-    ret = blk_co_pread(blk, start, nbytes, *bounce_buffer, read_flags);
+    bdrv_reset_dirty_bitmap(job->copy_bitmap, start, end - start);
+
+    ret = blk_co_pread(blk, start, nbytes, bounce_buffer, read_flags);
     if (ret < 0) {
         trace_backup_do_cow_read_fail(job, start, ret);
         if (error_is_read) {
@@ -128,7 +131,7 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
         goto fail;
     }
 
-    ret = blk_co_pwrite(job->target, start, nbytes, *bounce_buffer,
+    ret = blk_co_pwrite(job->target, start, nbytes, bounce_buffer,
                         job->write_flags);
     if (ret < 0) {
         trace_backup_do_cow_write_fail(job, start, ret);
@@ -138,9 +141,12 @@ static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
         goto fail;
     }
 
+    qemu_vfree(bounce_buffer);
     return nbytes;
+
 fail:
     bdrv_set_dirty_bitmap(job->copy_bitmap, start, job->cluster_size);
+    qemu_vfree(bounce_buffer);
     return ret;
 
 }
@@ -254,7 +260,6 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
     CowRequest cow_request;
     int ret = 0;
     int64_t start, end; /* bytes */
-    void *bounce_buffer = NULL;
     int64_t skip_bytes;
 
     qemu_co_rwlock_rdlock(&job->flush_rwlock);
@@ -303,7 +308,7 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
         if (!job->use_copy_range) {
             ret = backup_cow_with_bounce_buffer(job, start, dirty_end,
                                                 is_write_notifier,
-                                                error_is_read, &bounce_buffer);
+                                                error_is_read);
         }
         if (ret < 0) {
             break;
@@ -318,10 +323,6 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
         ret = 0;
     }
 
-    if (bounce_buffer) {
-        qemu_vfree(bounce_buffer);
-    }
-
     cow_request_end(&cow_request);
 
     trace_backup_do_cow_return(job, offset, bytes, ret);
-- 
2.18.0


