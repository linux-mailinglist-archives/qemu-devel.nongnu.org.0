Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B83B2880
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:24:44 +0200 (CEST)
Received: from localhost ([::1]:47080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJj9-0002Hh-Nt
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lwJfh-0004GQ-P2
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lwJfe-0001hQ-CP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624519265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1eH6vbaR4Zmf+Ul+pfdiaLXyd6nUwUIdHbSLThgB/E=;
 b=E3nTIYMhObcGcVofywuK6m6WEPM5DPp2OybxPyNOqdA5i14/5GBVLSN0CvvZRtPch++1NQ
 BcuthG9k54WQg2RqET2l97GgcT5n4gYlUfz4bT3pJU+HaWj90vdWIahOpMPrbAYuh65G9N
 oDtVN99wj6s1Gu+zXdzQv/7lt7MkfiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-g7-MrgyaN_iRXwkn4s1gfg-1; Thu, 24 Jun 2021 03:21:01 -0400
X-MC-Unique: g7-MrgyaN_iRXwkn4s1gfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B46FB800D55;
 Thu, 24 Jun 2021 07:21:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-3.ams2.redhat.com
 [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A58E5C1D1;
 Thu, 24 Jun 2021 07:20:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 4/5] block-copy: add CoMutex lock
Date: Thu, 24 Jun 2021 09:20:42 +0200
Message-Id: <20210624072043.180494-5-eesposit@redhat.com>
In-Reply-To: <20210624072043.180494-1-eesposit@redhat.com>
References: <20210624072043.180494-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

Group various structures fields, to better understand what we need to
protect with a lock and what doesn't need it.
Then, add a CoMutex to protect concurrent access of block-copy
data structures. This mutex also protects .copy_bitmap, because its thread-safe
API does not prevent it from assigning two tasks to the same
bitmap region.

Exceptions to the lock:
- .sleep_state is handled in the series "coroutine: new sleep/wake API"
and thus here left as TODO.

- .finished, .cancelled and reads to .ret and .error_is_read will be
protected in the following patch, because are used also outside
coroutines.

- .skip_unallocated is atomic. Including it under the mutex would
increase the critical sections and make them also much more complex.
We can have it as atomic since it is only written from outside and
read by block-copy coroutines.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 155 +++++++++++++++++++++++++++++++++------------
 1 file changed, 116 insertions(+), 39 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index d44c41549e..52878ba57a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -39,7 +39,7 @@ typedef enum {
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
-    /* IN parameters. Initialized in block_copy_async() and never changed. */
+    /* Fields initialized in block_copy_async() and never changed. */
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
@@ -48,33 +48,60 @@ typedef struct BlockCopyCallState {
     bool ignore_ratelimit;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
-
     /* Coroutine where async block-copy is running */
     Coroutine *co;
 
-    /* To reference all call states from BlockCopyState */
-    QLIST_ENTRY(BlockCopyCallState) list;
-
-    /* State */
-    int ret;
+    /* Fields whose state changes throughout the execution */
     bool finished;
-    QemuCoSleep sleep;
+    QemuCoSleep sleep; /* TODO: protect API with a lock */
     bool cancelled;
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyCallState) list;
 
-    /* OUT parameters */
+    /*
+     * Fields that report information about return values and erros.
+     * Protected by lock in BlockCopyState.
+     */
     bool error_is_read;
+    /*
+     * @ret is set concurrently by tasks under mutex. Only set once by first
+     * failed task (and untouched if no task failed).
+     * After finishing (call_state->finished is true), it is not modified
+     * anymore and may be safely read without mutex.
+     */
+    int ret;
 } BlockCopyCallState;
 
 typedef struct BlockCopyTask {
     AioTask task;
 
+    /*
+     * Fields initialized in block_copy_task_create()
+     * and never changed.
+     */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
     int64_t offset;
-    int64_t bytes;
+    /*
+     * @method can also be set again in the while loop of
+     * block_copy_dirty_clusters(), but it is never accessed concurrently
+     * because the only other function that reads it is
+     * block_copy_task_entry() and it is invoked afterwards in the same
+     * iteration.
+     */
     BlockCopyMethod method;
-    QLIST_ENTRY(BlockCopyTask) list;
+
+    /*
+     * Fields whose state changes throughout the execution
+     * Protected by lock in BlockCopyState.
+     */
     CoQueue wait_queue; /* coroutines blocked on this task */
+    /*
+     * Only protect the case of parallel read while updating @bytes
+     * value in block_copy_task_shrink().
+     */
+    int64_t bytes;
+    QLIST_ENTRY(BlockCopyTask) list;
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
@@ -90,17 +117,25 @@ typedef struct BlockCopyState {
      */
     BdrvChild *source;
     BdrvChild *target;
-    BdrvDirtyBitmap *copy_bitmap;
-    int64_t in_flight_bytes;
+
+    /*
+     * Fields initialized in block_copy_state_new()
+     * and never changed.
+     */
     int64_t cluster_size;
-    BlockCopyMethod method;
     int64_t max_transfer;
     uint64_t len;
-    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
-    QLIST_HEAD(, BlockCopyCallState) calls;
-
     BdrvRequestFlags write_flags;
 
+    /*
+     * Fields whose state changes throughout the execution
+     * Protected by lock.
+     */
+    CoMutex lock;
+    int64_t in_flight_bytes;
+    BlockCopyMethod method;
+    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    QLIST_HEAD(, BlockCopyCallState) calls;
     /*
      * skip_unallocated:
      *
@@ -115,15 +150,15 @@ typedef struct BlockCopyState {
      * skip unallocated regions, clear them in the copy_bitmap, and invoke
      * block_copy_reset_unallocated() every time it does.
      */
-    bool skip_unallocated;
-
+    bool skip_unallocated; /* atomic */
+    /* State fields that use a thread-safe API */
+    BdrvDirtyBitmap *copy_bitmap;
     ProgressMeter *progress;
-
     SharedResource *mem;
-
     RateLimit rate_limit;
 } BlockCopyState;
 
+/* Called with lock held */
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
                                             int64_t offset, int64_t bytes)
 {
@@ -141,6 +176,9 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 /*
  * If there are no intersecting tasks return false. Otherwise, wait for the
  * first found intersecting tasks to finish and return true.
+ *
+ * Called with lock held. May temporary release the lock.
+ * Return value of 0 proves that lock was NOT released.
  */
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
@@ -151,11 +189,12 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->lock);
 
     return true;
 }
 
+/* Called with lock held */
 static int64_t block_copy_chunk_size(BlockCopyState *s)
 {
     switch (s->method) {
@@ -178,13 +217,14 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
  */
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
-                                             BlockCopyCallState *call_state,
-                                             int64_t offset, int64_t bytes)
+static coroutine_fn BlockCopyTask *
+block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
+                       int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
     int64_t max_chunk;
 
+    QEMU_LOCK_GUARD(&s->lock);
     max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
@@ -227,6 +267,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
 static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
                                                 int64_t new_bytes)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     if (new_bytes == task->bytes) {
         return;
     }
@@ -243,6 +284,7 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     task->s->in_flight_bytes -= task->bytes;
     if (ret < 0) {
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
@@ -321,12 +363,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     ratelimit_init(&s->rate_limit);
+    qemu_co_mutex_init(&s->lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
     return s;
 }
 
+/* Only set before running the job, no need for locking. */
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
 {
     s->progress = pm;
@@ -467,16 +511,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
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
@@ -491,7 +539,7 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
     BlockDriverState *base;
     int ret;
 
-    if (s->skip_unallocated) {
+    if (qatomic_read(&s->skip_unallocated)) {
         base = bdrv_backing_chain_next(s->source->bs);
     } else {
         base = NULL;
@@ -578,10 +626,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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
@@ -639,7 +689,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         if (status_bytes < task->bytes) {
             block_copy_task_shrink(task, status_bytes);
         }
-        if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
+        if (qatomic_read(&s->skip_unallocated) &&
+            !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
@@ -721,14 +772,38 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
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
+                     *
+                     * block_copy_wait_one return value 0 also means that it
+                     * didn't relase the lock. So, we are still in the same
+                     * critical section, not interrupted by any concurrent
+                     * access to state.
+                     */
+                    ret = bdrv_dirty_bitmap_next_dirty(s->copy_bitmap,
+                                                       call_state->offset,
+                                                       call_state->bytes) >= 0;
+                }
+            }
         }
 
         /*
@@ -748,7 +823,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_co_mutex_lock(&s->lock);
     QLIST_REMOVE(call_state, list);
+    qemu_co_mutex_unlock(&s->lock);
 
     return ret;
 }
@@ -851,7 +928,7 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
-    s->skip_unallocated = skip;
+    qatomic_set(&s->skip_unallocated, skip);
 }
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
-- 
2.31.1


