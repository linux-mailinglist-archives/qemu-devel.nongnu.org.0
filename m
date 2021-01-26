Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C249F304108
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:56:14 +0100 (CET)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PlN-0006kU-PR
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEK-0001C7-NZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEI-0006Y7-A1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgfRA+DvGtTEOmDzQ2rL9T6VN1EgJt5DxakAKwy1hOw=;
 b=L3hQCWrjLSL3hvpy8k4ZsWWzGmKL2QXTxqP4e+SdLhMXZzVUJ7ExA+i1kKQDf4dpAp3gAu
 YJsuUxIi3JE72FBCe8rBFMg7o2rJAFrq5GQImOH6yj3X88zvAfpf1OtGiVzXT/xXok3724
 Q23BW6CE8wFP44/sEOFNWb+7ryStO0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Dt-XobmOOpmWv7qMNg1f-g-1; Tue, 26 Jan 2021 09:21:58 -0500
X-MC-Unique: Dt-XobmOOpmWv7qMNg1f-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA04801AA3;
 Tue, 26 Jan 2021 14:21:57 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7F760C67;
 Tue, 26 Jan 2021 14:21:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 43/53] backup: move to block-copy
Date: Tue, 26 Jan 2021 15:20:06 +0100
Message-Id: <20210126142016.806073-44-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This brings async request handling and block-status driven chunk sizes
to backup out of the box, which improves backup performance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-18-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 187 +++++++++++++++++++++++++++++++------------------
 1 file changed, 120 insertions(+), 67 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 466608ee55..cc525d5544 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -22,7 +22,6 @@
 #include "block/block-copy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/ratelimit.h"
 #include "qemu/cutils.h"
 #include "sysemu/block-backend.h"
 #include "qemu/bitmap.h"
@@ -44,41 +43,17 @@ typedef struct BackupBlockJob {
     BlockdevOnError on_source_error;
     BlockdevOnError on_target_error;
     uint64_t len;
-    uint64_t bytes_read;
     int64_t cluster_size;
     BackupPerf perf;
 
     BlockCopyState *bcs;
+
+    bool wait;
+    BlockCopyCallState *bg_bcs_call;
 } BackupBlockJob;
 
 static const BlockJobDriver backup_job_driver;
 
-static void backup_progress_bytes_callback(int64_t bytes, void *opaque)
-{
-    BackupBlockJob *s = opaque;
-
-    s->bytes_read += bytes;
-}
-
-static int coroutine_fn backup_do_cow(BackupBlockJob *job,
-                                      int64_t offset, uint64_t bytes,
-                                      bool *error_is_read)
-{
-    int ret = 0;
-    int64_t start, end; /* bytes */
-
-    start = QEMU_ALIGN_DOWN(offset, job->cluster_size);
-    end = QEMU_ALIGN_UP(bytes + offset, job->cluster_size);
-
-    trace_backup_do_cow_enter(job, start, offset, bytes);
-
-    ret = block_copy(job->bcs, start, end - start, true, error_is_read);
-
-    trace_backup_do_cow_return(job, offset, bytes, ret);
-
-    return ret;
-}
-
 static void backup_cleanup_sync_bitmap(BackupBlockJob *job, int ret)
 {
     BdrvDirtyBitmap *bm;
@@ -158,53 +133,96 @@ static BlockErrorAction backup_error_action(BackupBlockJob *job,
     }
 }
 
-static bool coroutine_fn yield_and_check(BackupBlockJob *job)
+static void coroutine_fn backup_block_copy_callback(void *opaque)
 {
-    uint64_t delay_ns;
-
-    if (job_is_cancelled(&job->common.job)) {
-        return true;
-    }
-
-    /*
-     * We need to yield even for delay_ns = 0 so that bdrv_drain_all() can
-     * return. Without a yield, the VM would not reboot.
-     */
-    delay_ns = block_job_ratelimit_get_delay(&job->common, job->bytes_read);
-    job->bytes_read = 0;
-    job_sleep_ns(&job->common.job, delay_ns);
+    BackupBlockJob *s = opaque;
 
-    if (job_is_cancelled(&job->common.job)) {
-        return true;
+    if (s->wait) {
+        s->wait = false;
+        aio_co_wake(s->common.job.co);
+    } else {
+        job_enter(&s->common.job);
     }
-
-    return false;
 }
 
 static int coroutine_fn backup_loop(BackupBlockJob *job)
 {
-    bool error_is_read;
-    int64_t offset;
-    BdrvDirtyBitmapIter *bdbi;
+    BlockCopyCallState *s = NULL;
     int ret = 0;
+    bool error_is_read;
+    BlockErrorAction act;
+
+    while (true) { /* retry loop */
+        job->bg_bcs_call = s = block_copy_async(job->bcs, 0,
+                QEMU_ALIGN_UP(job->len, job->cluster_size),
+                job->perf.max_workers, job->perf.max_chunk,
+                backup_block_copy_callback, job);
+
+        while (!block_copy_call_finished(s) &&
+               !job_is_cancelled(&job->common.job))
+        {
+            job_yield(&job->common.job);
+        }
 
-    bdbi = bdrv_dirty_iter_new(block_copy_dirty_bitmap(job->bcs));
-    while ((offset = bdrv_dirty_iter_next(bdbi)) != -1) {
-        do {
-            if (yield_and_check(job)) {
-                goto out;
-            }
-            ret = backup_do_cow(job, offset, job->cluster_size, &error_is_read);
-            if (ret < 0 && backup_error_action(job, error_is_read, -ret) ==
-                           BLOCK_ERROR_ACTION_REPORT)
-            {
-                goto out;
-            }
-        } while (ret < 0);
+        if (!block_copy_call_finished(s)) {
+            assert(job_is_cancelled(&job->common.job));
+            /*
+             * Note that we can't use job_yield() here, as it doesn't work for
+             * cancelled job.
+             */
+            block_copy_call_cancel(s);
+            job->wait = true;
+            qemu_coroutine_yield();
+            assert(block_copy_call_finished(s));
+            ret = 0;
+            goto out;
+        }
+
+        if (job_is_cancelled(&job->common.job) ||
+            block_copy_call_succeeded(s))
+        {
+            ret = 0;
+            goto out;
+        }
+
+        if (block_copy_call_cancelled(s)) {
+            /*
+             * Job is not cancelled but only block-copy call. This is possible
+             * after job pause. Now the pause is finished, start new block-copy
+             * iteration.
+             */
+            block_copy_call_free(s);
+            continue;
+        }
+
+        /* The only remaining case is failed block-copy call. */
+        assert(block_copy_call_failed(s));
+
+        ret = block_copy_call_status(s, &error_is_read);
+        act = backup_error_action(job, error_is_read, -ret);
+        switch (act) {
+        case BLOCK_ERROR_ACTION_REPORT:
+            goto out;
+        case BLOCK_ERROR_ACTION_STOP:
+            /*
+             * Go to pause prior to starting new block-copy call on the next
+             * iteration.
+             */
+            job_pause_point(&job->common.job);
+            break;
+        case BLOCK_ERROR_ACTION_IGNORE:
+            /* Proceed to new block-copy call to retry. */
+            break;
+        default:
+            abort();
+        }
+
+        block_copy_call_free(s);
     }
 
- out:
-    bdrv_dirty_iter_free(bdbi);
+out:
+    block_copy_call_free(s);
+    job->bg_bcs_call = NULL;
     return ret;
 }
 
@@ -245,7 +263,13 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
         int64_t count;
 
         for (offset = 0; offset < s->len; ) {
-            if (yield_and_check(s)) {
+            if (job_is_cancelled(job)) {
+                return -ECANCELED;
+            }
+
+            job_pause_point(job);
+
+            if (job_is_cancelled(job)) {
                 return -ECANCELED;
             }
 
@@ -278,6 +302,33 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     return 0;
 }
 
+static void coroutine_fn backup_pause(Job *job)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+
+    if (s->bg_bcs_call && !block_copy_call_finished(s->bg_bcs_call)) {
+        block_copy_call_cancel(s->bg_bcs_call);
+        s->wait = true;
+        qemu_coroutine_yield();
+    }
+}
+
+static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common);
+
+    /*
+     * block_job_set_speed() is called first from block_job_create(), when we
+     * don't yet have s->bcs.
+     */
+    if (s->bcs) {
+        block_copy_set_speed(s->bcs, speed);
+        if (s->bg_bcs_call) {
+            block_copy_kick(s->bg_bcs_call);
+        }
+    }
+}
+
 static const BlockJobDriver backup_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(BackupBlockJob),
@@ -288,7 +339,9 @@ static const BlockJobDriver backup_job_driver = {
         .commit                 = backup_commit,
         .abort                  = backup_abort,
         .clean                  = backup_clean,
-    }
+        .pause                  = backup_pause,
+    },
+    .set_speed = backup_set_speed,
 };
 
 static int64_t backup_calculate_cluster_size(BlockDriverState *target,
@@ -485,8 +538,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
-    block_copy_set_progress_callback(bcs, backup_progress_bytes_callback, job);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
+    block_copy_set_speed(bcs, speed);
 
     /* Required permissions are already taken by backup-top target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
-- 
2.29.2


