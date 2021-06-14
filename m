Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51E3A5DCE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:39:09 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshBc-000629-NM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6w-0005jP-HZ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6u-00056O-Hb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623656056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmubNJaaWOZmDxPXbzCNnNArMjoF1vbOQWWhxx6eZEI=;
 b=bU1mLFXlpH/LxGtCEASUp96gpq9CN1Huf6qD7RBZyy4aixNV4TZry3RlkN/tByR4BO2JPc
 j9HD8qXVTA0J0HzDYogUzBPsYSizSOZ5lwupUAu0rIP0d7aJ4qvPkCUmBPBHWukT4/0Xe3
 0/CHOmPnP41Zv7XmYxRLJNkbkJsUaV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-uIphKUlvMK6ffkpgQBzDFw-1; Mon, 14 Jun 2021 03:34:12 -0400
X-MC-Unique: uIphKUlvMK6ffkpgQBzDFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B07801ADF;
 Mon, 14 Jun 2021 07:34:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 013E85D6A8;
 Mon, 14 Jun 2021 07:34:08 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 5/6] block-copy: add a CoMutex
Date: Mon, 14 Jun 2021 09:33:49 +0200
Message-Id: <20210614073350.17048-6-eesposit@redhat.com>
In-Reply-To: <20210614073350.17048-1-eesposit@redhat.com>
References: <20210614073350.17048-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a CoMutex to protect concurrent access of block-copy
data structures.

This mutex also protects .copy_bitmap, because its thread-safe
API does not prevent it from assigning two tasks to the same
bitmap region.

.finished, .cancelled and reads to .ret and .error_is_read will be
protected in the following patch, because are used also outside
coroutines.

Also set block_copy_task_create as coroutine_fn because:
1) it is static and only invoked by coroutine functions
2) this patch introduces and uses a CoMutex lock there

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c         | 79 +++++++++++++++++++++++++++++---------
 include/block/block-copy.h |  2 +
 2 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index afa2f484f0..6416929abd 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -61,6 +61,7 @@ typedef struct BlockCopyCallState {
 
     /* OUT parameters */
     bool cancelled;
+    /* Fields protected by lock in BlockCopyState */
     bool error_is_read;
     int ret;
 } BlockCopyCallState;
@@ -77,8 +78,12 @@ typedef struct BlockCopyTask {
     int64_t offset;
     BlockCopyMethod method;
 
-    /* State */
+    /* State. Protected by lock in BlockCopyState */
     CoQueue wait_queue; /* coroutines blocked on this task */
+    /*
+     * Only protect the case of parallel read while updating @bytes
+     * value in block_copy_task_shrink().
+     */
     int64_t bytes;
     QLIST_ENTRY(BlockCopyTask) list;
 } BlockCopyTask;
@@ -97,7 +102,8 @@ typedef struct BlockCopyState {
     BdrvChild *source;
     BdrvChild *target;
 
-    /* State */
+    /* State. Protected by lock */
+    CoMutex lock;
     int64_t in_flight_bytes;
     BlockCopyMethod method;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
@@ -137,6 +143,7 @@ typedef struct BlockCopyState {
     bool skip_unallocated;
 } BlockCopyState;
 
+/* Called with lock held */
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
                                             int64_t offset, int64_t bytes)
 {
@@ -154,6 +161,8 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 /*
  * If there are no intersecting tasks return false. Otherwise, wait for the
  * first found intersecting tasks to finish and return true.
+ *
+ * Called with lock held.
  */
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
@@ -164,7 +173,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->lock);
 
     return true;
 }
@@ -191,14 +200,15 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
  */
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
-                                             BlockCopyCallState *call_state,
-                                             int64_t offset, int64_t bytes)
+static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
+                                                BlockCopyCallState *call_state,
+                                                int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
-    int64_t max_chunk = block_copy_chunk_size(s);
+    int64_t max_chunk;
 
-    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
+    QEMU_LOCK_GUARD(&s->lock);
+    max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
                                            max_chunk, &offset, &bytes))
@@ -240,6 +250,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
 static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
                                                 int64_t new_bytes)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     if (new_bytes == task->bytes) {
         return;
     }
@@ -256,6 +267,7 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     task->s->in_flight_bytes -= task->bytes;
     if (ret < 0) {
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
@@ -334,12 +346,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     ratelimit_init(&s->rate_limit);
+    qemu_co_mutex_init(&s->lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
     return s;
 }
 
+/* Only set before running the job, so it is thread safe to call. */
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
 {
     s->progress = pm;
@@ -480,16 +494,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     int ret;
 
     ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
-    if (s->method == t->method) {
-        s->method = method;
-    }
-    if (ret < 0) {
-        if (!t->call_state->ret) {
-            t->call_state->ret = ret;
-            t->call_state->error_is_read = error_is_read;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        if (s->method == t->method) {
+            s->method = method;
+        }
+
+        if (ret < 0) {
+            if (!t->call_state->ret) {
+                t->call_state->ret = ret;
+                t->call_state->error_is_read = error_is_read;
+            }
+        } else {
+            progress_work_done(s->progress, t->bytes);
         }
-    } else {
-        progress_work_done(s->progress, t->bytes);
     }
     co_put_to_shres(s->mem, t->bytes);
     block_copy_task_end(t, ret);
@@ -591,10 +609,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
+        qemu_co_mutex_lock(&s->lock);
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
         progress_set_remaining(s->progress,
                                bdrv_get_dirty_count(s->copy_bitmap) +
                                s->in_flight_bytes);
+        qemu_co_mutex_unlock(&s->lock);
     }
 
     *count = bytes;
@@ -734,14 +754,33 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     int ret;
     BlockCopyState *s = call_state->s;
 
+    qemu_co_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->calls, call_state, list);
+    qemu_co_mutex_unlock(&s->lock);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0 && !call_state->cancelled) {
-            ret = block_copy_wait_one(s, call_state->offset,
-                                      call_state->bytes);
+            WITH_QEMU_LOCK_GUARD(&s->lock) {
+                /*
+                 * Check that there is no task we still need to
+                 * wait to complete
+                 */
+                ret = block_copy_wait_one(s, call_state->offset,
+                                          call_state->bytes);
+                if (ret == 0) {
+                    /*
+                     * No pending tasks, but check again the bitmap in this
+                     * same critical section, since a task might have failed
+                     * between this and the critical section in
+                     * block_copy_dirty_clusters().
+                     */
+                    ret = bdrv_dirty_bitmap_next_dirty(s->copy_bitmap,
+                                                       call_state->offset,
+                                                       call_state->bytes) > 0;
+                }
+            }
         }
 
         /*
@@ -761,7 +800,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_co_mutex_lock(&s->lock);
     QLIST_REMOVE(call_state, list);
+    qemu_co_mutex_unlock(&s->lock);
 
     return ret;
 }
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 338f2ea7fd..bf8f0c679f 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -18,6 +18,8 @@
 #include "block/block.h"
 #include "qemu/co-shared-resource.h"
 
+/* All APIs are thread-safe*/
+
 typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
-- 
2.31.1


