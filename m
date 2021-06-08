Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C941939EFA1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:35:17 +0200 (CEST)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWGa-0005JS-SJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFK-00033r-OH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFG-00056a-An
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623137633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLsc5GbcLneb2563Wriv6NoNTNHHrrCGWGrRkTihdOc=;
 b=RUbvYxaOXHPolZk3NFdPyrY6FztYxVG4yuOC9iRj0p5P9JqKE0QRXnYFRNG4BGKPbypybw
 QwxEjMrNhi+s08AVrajgqEeJNOaIKMuelSsiZ9g167tqyW6004Oh4zZckAav+5CZlon6H+
 Aw5r2vT5EvNFa57tpsgOanADbpaTLv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Rf9p69omP7qT7lS6QvVcHA-1; Tue, 08 Jun 2021 03:33:51 -0400
X-MC-Unique: Rf9p69omP7qT7lS6QvVcHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A94B9126B;
 Tue,  8 Jun 2021 07:33:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-225.ams2.redhat.com
 [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62E8160CCF;
 Tue,  8 Jun 2021 07:33:48 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/5] block-copy: streamline choice of copy_range vs.
 read/write
Date: Tue,  8 Jun 2021 09:33:40 +0200
Message-Id: <20210608073344.53637-2-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Put the logic to determine the copy size in a separate function, so
that there is a simple state machine for the possible methods of
copying data from one BlockDriverState to the other.

Use .method instead of .copy_range as in-out argument, and
include also .zeroes as an additional copy method.

While at it, store the common computation of block_copy_max_transfer
into a new field of BlockCopyState, and make sure that we always
obey max_transfer; that's more efficient even for the
COPY_RANGE_READ_WRITE case.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-copy.c | 171 ++++++++++++++++++++++-----------------------
 1 file changed, 85 insertions(+), 86 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 943e30b7e6..d58051288b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -28,6 +28,14 @@
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
 
+typedef enum {
+    COPY_READ_WRITE_CLUSTER,
+    COPY_READ_WRITE,
+    COPY_WRITE_ZEROES,
+    COPY_RANGE_SMALL,
+    COPY_RANGE_FULL
+} BlockCopyMethod;
+
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
@@ -64,8 +72,7 @@ typedef struct BlockCopyTask {
     BlockCopyCallState *call_state;
     int64_t offset;
     int64_t bytes;
-    bool zeroes;
-    bool copy_range;
+    BlockCopyMethod method;
     QLIST_ENTRY(BlockCopyTask) list;
     CoQueue wait_queue; /* coroutines blocked on this task */
 } BlockCopyTask;
@@ -86,8 +93,8 @@ typedef struct BlockCopyState {
     BdrvDirtyBitmap *copy_bitmap;
     int64_t in_flight_bytes;
     int64_t cluster_size;
-    bool use_copy_range;
-    int64_t copy_size;
+    BlockCopyMethod method;
+    int64_t max_transfer;
     uint64_t len;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
@@ -149,6 +156,24 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
     return true;
 }
 
+static int64_t block_copy_chunk_size(BlockCopyState *s)
+{
+    switch (s->method) {
+    case COPY_READ_WRITE_CLUSTER:
+        return s->cluster_size;
+    case COPY_READ_WRITE:
+    case COPY_RANGE_SMALL:
+        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
+                   s->max_transfer);
+    case COPY_RANGE_FULL:
+        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                   s->max_transfer);
+    default:
+        /* Cannot have COPY_WRITE_ZEROES here.  */
+        abort();
+    }
+}
+
 /*
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
@@ -158,8 +183,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
                                              int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
-    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
+    int64_t max_chunk = block_copy_chunk_size(s);
 
+    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
                                            max_chunk, &offset, &bytes))
@@ -183,7 +209,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         .call_state = call_state,
         .offset = offset,
         .bytes = bytes,
-        .copy_range = s->use_copy_range,
+        .method = s->method,
     };
     qemu_co_queue_init(&task->wait_queue);
     QLIST_INSERT_HEAD(&s->tasks, task, list);
@@ -267,28 +293,27 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
         .write_flags = write_flags,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
+        .max_transfer = QEMU_ALIGN_DOWN(block_copy_max_transfer(source, target)
+                                        , cluster_size),
     };
 
-    if (block_copy_max_transfer(source, target) < cluster_size) {
+    if (s->max_transfer < cluster_size) {
         /*
          * copy_range does not respect max_transfer. We don't want to bother
          * with requests smaller than block-copy cluster size, so fallback to
          * buffered copying (read and write respect max_transfer on their
          * behalf).
          */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;
     } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
         /* Compression supports only cluster-size writes and no copy-range. */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;
     } else {
         /*
          * We enable copy-range, but keep small copy_size, until first
          * successful copy_range (look at block_copy_do_copy).
          */
-        s->use_copy_range = use_copy_range;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
     }
 
     ratelimit_init(&s->rate_limit);
@@ -343,17 +368,14 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  *
  * No sync here: nor bitmap neighter intersecting requests handling, only copy.
  *
- * @copy_range is an in-out argument: if *copy_range is false, copy_range is not
- * done. If *copy_range is true, copy_range is attempted. If the copy_range
- * attempt fails, the function falls back to the usual read+write and
- * *copy_range is set to false. *copy_range and zeroes must not be true
- * simultaneously.
- *
+ * @method is an in-out argument, so that copy_range can be either extended to
+ * a full-size buffer or disabled if the copy_range attempt fails.  The output
+ * value of @method should be used for subsequent tasks.
  * Returns 0 on success.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
-                                           bool zeroes, bool *copy_range,
+                                           BlockCopyMethod *method,
                                            bool *error_is_read)
 {
     int ret;
@@ -367,9 +389,9 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     assert(offset + bytes <= s->len ||
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
-    assert(!(*copy_range && zeroes));
 
-    if (zeroes) {
+    switch (*method) {
+    case COPY_WRITE_ZEROES:
         ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
@@ -377,89 +399,67 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
             *error_is_read = false;
         }
         return ret;
-    }
 
-    if (*copy_range) {
+    case COPY_RANGE_SMALL:
+    case COPY_RANGE_FULL:
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
-        if (ret < 0) {
-            trace_block_copy_copy_range_fail(s, offset, ret);
-            *copy_range = false;
-            /* Fallback to read+write with allocated buffer */
-        } else {
+        if (ret >= 0) {
+            /* Successful copy-range, increase copy_size.  */
+            *method = COPY_RANGE_FULL;
             return 0;
         }
-    }
-
-    /*
-     * In case of failed copy_range request above, we may proceed with buffered
-     * request larger than BLOCK_COPY_MAX_BUFFER. Still, further requests will
-     * be properly limited, so don't care too much. Moreover the most likely
-     * case (copy_range is unsupported for the configuration, so the very first
-     * copy_range request fails) is handled by setting large copy_size only
-     * after first successful copy_range.
-     */
 
-    bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
+        trace_block_copy_copy_range_fail(s, offset, ret);
+        *method = COPY_READ_WRITE;
+        /* Fall through to read+write with allocated buffer */
 
-    ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
-    if (ret < 0) {
-        trace_block_copy_read_fail(s, offset, ret);
-        *error_is_read = true;
-        goto out;
-    }
+    default:
+        /*
+         * In case of failed copy_range request above, we may proceed with
+         * buffered request larger than BLOCK_COPY_MAX_BUFFER.
+         * Still, further requests will be properly limited, so don't care too
+         * much. Moreover the most likely case (copy_range is unsupported for
+         * the configuration, so the very first copy_range request fails)
+         * is handled by setting large copy_size only after first successful
+         * copy_range.
+         */
 
-    ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
-                         s->write_flags);
-    if (ret < 0) {
-        trace_block_copy_write_fail(s, offset, ret);
-        *error_is_read = false;
-        goto out;
-    }
+        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
 
-out:
-    qemu_vfree(bounce_buffer);
+        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
+        if (ret < 0) {
+            trace_block_copy_read_fail(s, offset, ret);
+            *error_is_read = true;
+            goto out;
+        }
 
-    return ret;
-}
+        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
+                            s->write_flags);
+        if (ret < 0) {
+            trace_block_copy_write_fail(s, offset, ret);
+            *error_is_read = false;
+            goto out;
+        }
 
-static void block_copy_handle_copy_range_result(BlockCopyState *s,
-                                                bool is_success)
-{
-    if (!s->use_copy_range) {
-        /* already disabled */
-        return;
+out:
+        qemu_vfree(bounce_buffer);
     }
 
-    if (is_success) {
-        /*
-         * Successful copy-range. Now increase copy_size.  copy_range
-         * does not respect max_transfer (it's a TODO), so we factor
-         * that in here.
-         */
-        s->copy_size =
-                MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                    QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
-                                                            s->target),
-                                    s->cluster_size));
-    } else {
-        /* Copy-range failed, disable it. */
-        s->use_copy_range = false;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
-    }
+    return ret;
 }
 
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
+    BlockCopyState *s = t->s;
     bool error_is_read = false;
-    bool copy_range = t->copy_range;
+    BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
-                             &copy_range, &error_is_read);
-    if (t->copy_range) {
-        block_copy_handle_copy_range_result(t->s, copy_range);
+    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
+    if (s->method == t->method) {
+        s->method = method;
     }
     if (ret < 0) {
         if (!t->call_state->ret) {
@@ -642,8 +642,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             continue;
         }
         if (ret & BDRV_BLOCK_ZERO) {
-            task->zeroes = true;
-            task->copy_range = false;
+            task->method = COPY_WRITE_ZEROES;
         }
 
         if (!call_state->ignore_ratelimit) {
-- 
2.30.2


