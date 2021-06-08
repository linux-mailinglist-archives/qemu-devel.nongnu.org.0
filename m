Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2D39EFA2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:35:21 +0200 (CEST)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWGe-0005VW-DQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFP-0003KL-QO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFN-0005Dx-ID
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623137640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmZTZjRes0RYYTkV41IuOafzd0h5qFCup42BWDpIB1s=;
 b=gXtedwGFhC6Tdu1T25xqy6ZwtBwGKXY1BDG16TDoy9MqaRLTxfLtKiXiSj6UYm6Nl/MTaW
 e0n5IxZpZvUGtlG46Yg2i7yDpv70+vAjxuvSjDeE1B1uj67UmcythFQbCyt3MmX3zfUsYv
 Izh7dO5yFNo2/qyvs0aW/7slpcNRQPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-JTsUYWZ2OkWyOMtYbdtoBw-1; Tue, 08 Jun 2021 03:33:59 -0400
X-MC-Unique: JTsUYWZ2OkWyOMtYbdtoBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D66D9126F;
 Tue,  8 Jun 2021 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-225.ams2.redhat.com
 [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 331F9608BA;
 Tue,  8 Jun 2021 07:33:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/5] block-copy: add a CoMutex
Date: Tue,  8 Jun 2021 09:33:43 +0200
Message-Id: <20210608073344.53637-5-eesposit@redhat.com>
In-Reply-To: <20210608073344.53637-1-eesposit@redhat.com>
References: <20210608073344.53637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/block-copy.c | 82 ++++++++++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index e2adb5b2ea..56f62913e4 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -61,6 +61,7 @@ typedef struct BlockCopyCallState {
 
     /* OUT parameters */
     bool cancelled;
+    /* Fields protected by lock in BlockCopyState */
     bool error_is_read;
     int ret;
 } BlockCopyCallState;
@@ -78,7 +79,7 @@ typedef struct BlockCopyTask {
     int64_t bytes; /* only re-set in task_shrink, before running the task */
     BlockCopyMethod method; /* initialized in block_copy_dirty_clusters() */
 
-    /* State */
+    /* State. Protected by lock in BlockCopyState */
     CoQueue wait_queue; /* coroutines blocked on this task */
 
     /* To reference all call states from BlockCopyState */
@@ -99,7 +100,8 @@ typedef struct BlockCopyState {
     BdrvChild *source;
     BdrvChild *target;
 
-    /* State */
+    /* State. Protected by lock */
+    CoMutex lock;
     int64_t in_flight_bytes;
     BlockCopyMethod method;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
@@ -139,8 +141,10 @@ typedef struct BlockCopyState {
     bool skip_unallocated;
 } BlockCopyState;
 
-static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
-                                            int64_t offset, int64_t bytes)
+/* Called with lock held */
+static BlockCopyTask *find_conflicting_task_locked(BlockCopyState *s,
+                                                   int64_t offset,
+                                                   int64_t bytes)
 {
     BlockCopyTask *t;
 
@@ -160,18 +164,22 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
 {
-    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
+    BlockCopyTask *task;
+
+    QEMU_LOCK_GUARD(&s->lock);
+    task = find_conflicting_task_locked(s, offset, bytes);
 
     if (!task) {
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->lock);
 
     return true;
 }
 
-static int64_t block_copy_chunk_size(BlockCopyState *s)
+/* Called with lock held */
+static int64_t block_copy_chunk_size_locked(BlockCopyState *s)
 {
     switch (s->method) {
     case COPY_READ_WRITE_CLUSTER:
@@ -193,14 +201,16 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)
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
+    max_chunk = MIN_NON_ZERO(block_copy_chunk_size_locked(s),
+                             call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
                                            max_chunk, &offset, &bytes))
@@ -212,7 +222,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
     bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
 
     /* region is dirty, so no existent tasks possible in it */
-    assert(!find_conflicting_task(s, offset, bytes));
+    assert(!find_conflicting_task_locked(s, offset, bytes));
 
     bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
     s->in_flight_bytes += bytes;
@@ -248,16 +258,19 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
 
     assert(new_bytes > 0 && new_bytes < task->bytes);
 
-    task->s->in_flight_bytes -= task->bytes - new_bytes;
-    bdrv_set_dirty_bitmap(task->s->copy_bitmap,
-                          task->offset + new_bytes, task->bytes - new_bytes);
-
-    task->bytes = new_bytes;
-    qemu_co_queue_restart_all(&task->wait_queue);
+    WITH_QEMU_LOCK_GUARD(&task->s->lock) {
+        task->s->in_flight_bytes -= task->bytes - new_bytes;
+        bdrv_set_dirty_bitmap(task->s->copy_bitmap,
+                              task->offset + new_bytes,
+                              task->bytes - new_bytes);
+        task->bytes = new_bytes;
+        qemu_co_queue_restart_all(&task->wait_queue);
+    }
 }
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     task->s->in_flight_bytes -= task->bytes;
     if (ret < 0) {
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
@@ -335,6 +348,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     ratelimit_init(&s->rate_limit);
+    qemu_co_mutex_init(&s->lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
@@ -390,6 +404,8 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  * a full-size buffer or disabled if the copy_range attempt fails.  The output
  * value of @method should be used for subsequent tasks.
  * Returns 0 on success.
+ *
+ * Called with lock held.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
@@ -476,16 +492,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
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
+    WITH_QEMU_LOCK_GUARD(&t->s->lock) {
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
+            progress_work_done(t->s->progress, t->bytes);
         }
-    } else {
-        progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
     block_copy_task_end(t, ret);
@@ -587,10 +607,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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
@@ -729,7 +751,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
+    qemu_co_mutex_lock(&call_state->s->lock);
     QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+    qemu_co_mutex_unlock(&call_state->s->lock);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
@@ -756,7 +780,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_co_mutex_lock(&call_state->s->lock);
     QLIST_REMOVE(call_state, list);
+    qemu_co_mutex_unlock(&call_state->s->lock);
 
     return ret;
 }
-- 
2.30.2


