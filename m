Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F244D387656
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:21:37 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwr3-0006dW-15
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweD-0002mS-W2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweB-0007h5-VH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lZ83aft9SpgzX0qL/+FL99/aJ1UNdMSfOcWCB4ES+I=;
 b=NxdS06Srx5aZFfAwxNRPJJYPP9MSWJaO8sOlznwN8UYkW8h6vJkOzIsLAbEipb2NA3PdAd
 +T7J7oDm5sZzjcOpHB5R8+hyVUfNukxS6mOHfyuZp+kdu3eipVuc9cl2vcpU8rC5ksnrKv
 1uypXRjoFNiBUDkRZsKHQgTP7VTNFzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167--cQIQgs_NDu03ZIDUQy-RA-1; Tue, 18 May 2021 06:08:17 -0400
X-MC-Unique: -cQIQgs_NDu03ZIDUQy-RA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41E3100747E;
 Tue, 18 May 2021 10:08:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 340BC687C1;
 Tue, 18 May 2021 10:08:05 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
Date: Tue, 18 May 2021 12:07:51 +0200
Message-Id: <20210518100757.31243-2-eesposit@redhat.com>
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
References: <20210518100757.31243-1-eesposit@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Put the logic to determine the copy size in a separate function, so
that there is a simple state machine for the possible methods of
copying data from one BlockDriverState to the other.

While at it, store the common computation of block_copy_max_transfer
into a new field of BlockCopyState, and make sure that we always
obey max_transfer; that's more efficient even for the
COPY_RANGE_READ_WRITE case.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 37c8e8504b..10ce51a244 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -28,6 +28,13 @@
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
 
+typedef enum {
+    COPY_READ_WRITE_CLUSTER,
+    COPY_READ_WRITE,
+    COPY_RANGE_SMALL,
+    COPY_RANGE_FULL
+} BlockCopyMethod;
+
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
@@ -85,8 +92,8 @@ typedef struct BlockCopyState {
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
@@ -148,6 +155,23 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
     return true;
 }
 
+static inline int64_t block_copy_chunk_size(BlockCopyState *s)
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
+        abort();
+    }
+}
+
 /*
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
@@ -157,8 +181,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
                                              int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
-    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
+    int64_t max_chunk = block_copy_chunk_size(s);
 
+    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
                                            max_chunk, &offset, &bytes))
@@ -265,28 +290,27 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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
@@ -369,30 +393,25 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         return ret;
     }
 
-    if (s->use_copy_range) {
+    if (s->method >= COPY_RANGE_SMALL) {
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, offset, ret);
-            s->use_copy_range = false;
-            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+            s->method = COPY_READ_WRITE;
             /* Fallback to read+write with allocated buffer */
         } else {
-            if (s->use_copy_range) {
+            if (s->method == COPY_RANGE_SMALL) {
                 /*
                  * Successful copy-range. Now increase copy_size.  copy_range
                  * does not respect max_transfer (it's a TODO), so we factor
                  * that in here.
                  *
-                 * Note: we double-check s->use_copy_range for the case when
+                 * Note: we double-check s->method for the case when
                  * parallel block-copy request unsets it during previous
                  * bdrv_co_copy_range call.
                  */
-                s->copy_size =
-                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                            QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
-                                                                    s->target),
-                                            s->cluster_size));
+                s->method = COPY_RANGE_FULL;
             }
             goto out;
         }
-- 
2.30.2


