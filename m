Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8ABEFD6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 12:42:15 +0200 (CEST)
Received: from localhost ([::1]:33652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDRDy-00057L-Ih
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 06:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDQyj-0006gG-0c
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDQyg-00074K-6R
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:26:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:54284)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDQyb-0006vT-EE; Thu, 26 Sep 2019 06:26:21 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDQyY-0003nC-Cg; Thu, 26 Sep 2019 13:26:18 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v14 12/14] block: move in-flight requests handling from backup
 to block-copy
Date: Thu, 26 Sep 2019 13:26:12 +0300
Message-Id: <20190926102614.28999-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926102614.28999-1-vsementsov@virtuozzo.com>
References: <20190926102614.28999-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 den@openvz.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move synchronization mechanism to block-copy, to be able to use one
block-copy instance from backup job and backup-top filter in parallel.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  8 ++++++
 block/backup.c             | 52 --------------------------------------
 block/block-copy.c         | 43 +++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 52 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 54f90d0c9a..962f91056a 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -17,6 +17,13 @@
 
 #include "block/block.h"
 
+typedef struct BlockCopyInFlightReq {
+    int64_t start_byte;
+    int64_t end_byte;
+    QLIST_ENTRY(BlockCopyInFlightReq) list;
+    CoQueue wait_queue; /* coroutines blocked on this request */
+} BlockCopyInFlightReq;
+
 typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef void (*ProgressResetCallbackFunc)(void *opaque);
 typedef struct BlockCopyState {
@@ -27,6 +34,7 @@ typedef struct BlockCopyState {
     bool use_copy_range;
     int64_t copy_range_size;
     uint64_t len;
+    QLIST_HEAD(, BlockCopyInFlightReq) inflight_reqs;
 
     BdrvRequestFlags write_flags;
 
diff --git a/block/backup.c b/block/backup.c
index 4613b8c88d..d918836f1d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -29,13 +29,6 @@
 
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 
-typedef struct CowRequest {
-    int64_t start_byte;
-    int64_t end_byte;
-    QLIST_ENTRY(CowRequest) list;
-    CoQueue wait_queue; /* coroutines blocked on this request */
-} CowRequest;
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *source_bs;
@@ -51,50 +44,12 @@ typedef struct BackupBlockJob {
     uint64_t bytes_read;
     int64_t cluster_size;
     NotifierWithReturn before_write;
-    QLIST_HEAD(, CowRequest) inflight_reqs;
 
     BlockCopyState *bcs;
 } BackupBlockJob;
 
 static const BlockJobDriver backup_job_driver;
 
-/* See if in-flight requests overlap and wait for them to complete */
-static void coroutine_fn wait_for_overlapping_requests(BackupBlockJob *job,
-                                                       int64_t start,
-                                                       int64_t end)
-{
-    CowRequest *req;
-    bool retry;
-
-    do {
-        retry = false;
-        QLIST_FOREACH(req, &job->inflight_reqs, list) {
-            if (end > req->start_byte && start < req->end_byte) {
-                qemu_co_queue_wait(&req->wait_queue, NULL);
-                retry = true;
-                break;
-            }
-        }
-    } while (retry);
-}
-
-/* Keep track of an in-flight request */
-static void cow_request_begin(CowRequest *req, BackupBlockJob *job,
-                              int64_t start, int64_t end)
-{
-    req->start_byte = start;
-    req->end_byte = end;
-    qemu_co_queue_init(&req->wait_queue);
-    QLIST_INSERT_HEAD(&job->inflight_reqs, req, list);
-}
-
-/* Forget about a completed request */
-static void cow_request_end(CowRequest *req)
-{
-    QLIST_REMOVE(req, list);
-    qemu_co_queue_restart_all(&req->wait_queue);
-}
-
 static void backup_progress_bytes_callback(int64_t bytes, void *opaque)
 {
     BackupBlockJob *s = opaque;
@@ -116,7 +71,6 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
                                       bool *error_is_read,
                                       bool is_write_notifier)
 {
-    CowRequest cow_request;
     int ret = 0;
     int64_t start, end; /* bytes */
 
@@ -127,14 +81,9 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
 
     trace_backup_do_cow_enter(job, start, offset, bytes);
 
-    wait_for_overlapping_requests(job, start, end);
-    cow_request_begin(&cow_request, job, start, end);
-
     ret = block_copy(job->bcs, start, end - start, error_is_read,
                      is_write_notifier);
 
-    cow_request_end(&cow_request);
-
     trace_backup_do_cow_return(job, offset, bytes, ret);
 
     qemu_co_rwlock_unlock(&job->flush_rwlock);
@@ -316,7 +265,6 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     int ret = 0;
 
-    QLIST_INIT(&s->inflight_reqs);
     qemu_co_rwlock_init(&s->flush_rwlock);
 
     backup_init_copy_bitmap(s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 3fc9152853..61e5ea5f46 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -19,6 +19,41 @@
 #include "block/block-copy.h"
 #include "sysemu/block-backend.h"
 
+static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
+                                                       int64_t start,
+                                                       int64_t end)
+{
+    BlockCopyInFlightReq *req;
+    bool waited;
+
+    do {
+        waited = false;
+        QLIST_FOREACH(req, &s->inflight_reqs, list) {
+            if (end > req->start_byte && start < req->end_byte) {
+                qemu_co_queue_wait(&req->wait_queue, NULL);
+                waited = true;
+                break;
+            }
+        }
+    } while (waited);
+}
+
+static void block_copy_inflight_req_begin(BlockCopyState *s,
+                                          BlockCopyInFlightReq *req,
+                                          int64_t start, int64_t end)
+{
+    req->start_byte = start;
+    req->end_byte = end;
+    qemu_co_queue_init(&req->wait_queue);
+    QLIST_INSERT_HEAD(&s->inflight_reqs, req, list);
+}
+
+static void coroutine_fn block_copy_inflight_req_end(BlockCopyInFlightReq *req)
+{
+    QLIST_REMOVE(req, list);
+    qemu_co_queue_restart_all(&req->wait_queue);
+}
+
 void block_copy_state_free(BlockCopyState *s)
 {
     if (!s) {
@@ -79,6 +114,8 @@ BlockCopyState *block_copy_state_new(
     s->use_copy_range =
         !(write_flags & BDRV_REQ_WRITE_COMPRESSED) && s->copy_range_size > 0;
 
+    QLIST_INIT(&s->inflight_reqs);
+
     /*
      * We just allow aio context change on our block backends. block_copy() user
      * (now it's only backup) is responsible for source and target being in same
@@ -266,6 +303,7 @@ int coroutine_fn block_copy(BlockCopyState *s,
     int64_t end = bytes + start; /* bytes */
     void *bounce_buffer = NULL;
     int64_t status_bytes;
+    BlockCopyInFlightReq req;
 
     /*
      * block_copy() user is responsible for keeping source and target in same
@@ -276,6 +314,9 @@ int coroutine_fn block_copy(BlockCopyState *s,
     assert(QEMU_IS_ALIGNED(start, s->cluster_size));
     assert(QEMU_IS_ALIGNED(end, s->cluster_size));
 
+    block_copy_wait_inflight_reqs(s, start, bytes);
+    block_copy_inflight_req_begin(s, &req, start, end);
+
     while (start < end) {
         int64_t dirty_end;
 
@@ -329,5 +370,7 @@ int coroutine_fn block_copy(BlockCopyState *s,
         qemu_vfree(bounce_buffer);
     }
 
+    block_copy_inflight_req_end(&req);
+
     return ret;
 }
-- 
2.21.0


