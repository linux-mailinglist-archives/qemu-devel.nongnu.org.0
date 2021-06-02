Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682EC398B48
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:01:32 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRR5-0001h0-G1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCm-0002hf-6y
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCh-0007Wd-7F
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cZFslVqg6Ig1nveOg6RxDE4vGb312vYDATw+rpf21Q=;
 b=Ee5undhbitbtfdLEz83xWGoxKPs9ZR/wpqUMEV5FkIkpFhcFGqU8VswFJzIl81P30CLIaa
 uSulOTSvKphvxn2lrJpx2I0yGo6hiHuWwwfhm9LfVWIB7DxfSsBxK8U4IEY7gwRzHyYrao
 eed3yFvy66vy4KCICZIAhrq6aFfb1yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-p3dWscg7NFujUOvPrgpfzQ-1; Wed, 02 Jun 2021 09:46:36 -0400
X-MC-Unique: p3dWscg7NFujUOvPrgpfzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B91C84C5;
 Wed,  2 Jun 2021 13:45:58 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B2560BD9;
 Wed,  2 Jun 2021 13:45:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/20] block-copy: refactor copy_range handling
Date: Wed,  2 Jun 2021 15:45:28 +0200
Message-Id: <20210602134529.231756-20-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Currently we update s->use_copy_range and s->copy_size in
block_copy_do_copy().

It's not very good:

1. block_copy_do_copy() is intended to be a simple function, that wraps
bdrv_co_<io> functions for need of block copy. That's why we don't pass
BlockCopyTask into it. So, block_copy_do_copy() is bad place for
manipulation with generic state of block-copy process

2. We are going to make block-copy thread-safe. So, it's good to move
manipulation with state of block-copy to the places where we'll need
critical sections anyway, to not introduce extra synchronization
primitives in block_copy_do_copy().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210528141628.44287-3-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-copy.c | 72 +++++++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index f9e871b64f..5808cfe657 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -65,6 +65,7 @@ typedef struct BlockCopyTask {
     int64_t offset;
     int64_t bytes;
     bool zeroes;
+    bool copy_range;
     QLIST_ENTRY(BlockCopyTask) list;
     CoQueue wait_queue; /* coroutines blocked on this task */
 } BlockCopyTask;
@@ -183,6 +184,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         .call_state = call_state,
         .offset = offset,
         .bytes = bytes,
+        .copy_range = s->use_copy_range,
     };
     qemu_co_queue_init(&task->wait_queue);
     QLIST_INSERT_HEAD(&s->tasks, task, list);
@@ -342,11 +344,18 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  *
  * No sync here: nor bitmap neighter intersecting requests handling, only copy.
  *
+ * @copy_range is an in-out argument: if *copy_range is false, copy_range is not
+ * done. If *copy_range is true, copy_range is attempted. If the copy_range
+ * attempt fails, the function falls back to the usual read+write and
+ * *copy_range is set to false. *copy_range and zeroes must not be true
+ * simultaneously.
+ *
  * Returns 0 on success.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
-                                           bool zeroes, bool *error_is_read)
+                                           bool zeroes, bool *copy_range,
+                                           bool *error_is_read)
 {
     int ret;
     int64_t nbytes = MIN(offset + bytes, s->len) - offset;
@@ -359,6 +368,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     assert(offset + bytes <= s->len ||
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
+    assert(!(*copy_range && zeroes));
 
     if (zeroes) {
         ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
@@ -370,32 +380,15 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         return ret;
     }
 
-    if (s->use_copy_range) {
+    if (*copy_range) {
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, offset, ret);
-            s->use_copy_range = false;
-            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+            *copy_range = false;
             /* Fallback to read+write with allocated buffer */
         } else {
-            if (s->use_copy_range) {
-                /*
-                 * Successful copy-range. Now increase copy_size.  copy_range
-                 * does not respect max_transfer (it's a TODO), so we factor
-                 * that in here.
-                 *
-                 * Note: we double-check s->use_copy_range for the case when
-                 * parallel block-copy request unsets it during previous
-                 * bdrv_co_copy_range call.
-                 */
-                s->copy_size =
-                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                            QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
-                                                                    s->target),
-                                            s->cluster_size));
-            }
-            goto out;
+            return 0;
         }
     }
 
@@ -431,14 +424,44 @@ out:
     return ret;
 }
 
+static void block_copy_handle_copy_range_result(BlockCopyState *s,
+                                                bool is_success)
+{
+    if (!s->use_copy_range) {
+        /* already disabled */
+        return;
+    }
+
+    if (is_success) {
+        /*
+         * Successful copy-range. Now increase copy_size.  copy_range
+         * does not respect max_transfer (it's a TODO), so we factor
+         * that in here.
+         */
+        s->copy_size =
+                MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                    QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
+                                                            s->target),
+                                    s->cluster_size));
+    } else {
+        /* Copy-range failed, disable it. */
+        s->use_copy_range = false;
+        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+    }
+}
+
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
     bool error_is_read = false;
+    bool copy_range = t->copy_range;
     int ret;
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
-                             &error_is_read);
+                             &copy_range, &error_is_read);
+    if (t->copy_range) {
+        block_copy_handle_copy_range_result(t->s, copy_range);
+    }
     if (ret < 0) {
         if (!t->call_state->ret) {
             t->call_state->ret = ret;
@@ -619,7 +642,10 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             g_free(task);
             continue;
         }
-        task->zeroes = ret & BDRV_BLOCK_ZERO;
+        if (ret & BDRV_BLOCK_ZERO) {
+            task->zeroes = true;
+            task->copy_range = false;
+        }
 
         if (s->speed) {
             if (!call_state->ignore_ratelimit) {
-- 
2.30.2


