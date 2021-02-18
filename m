Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8631F0EA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:23:24 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCppb-0002nP-5z
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiD-0005HR-BW
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiA-0000HN-UT
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbxOVseHrBBO3iTKLsPMDeo7I0onuR+B2h9y93y/HgE=;
 b=APRzaypP+Ovn7mGnW3Kk9FkxLsXZ8rZvkKDD9KBgJS4GOzWhOjiRxKw9cViYkTwvJP3BJD
 sCczav66AhHDpOqkrvL7pDJFUKkHRuCU4xqFIDEOkGMrROp0T9mk7e5ZL03rtekwrdzx2d
 Qv+YizHiHsPsMWqp52iaM3VAGAQEy5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-NvoyDVBKPoWJQAtUhkIcwQ-1; Thu, 18 Feb 2021 15:15:38 -0500
X-MC-Unique: NvoyDVBKPoWJQAtUhkIcwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36A3427E3;
 Thu, 18 Feb 2021 20:15:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1489950C0E;
 Thu, 18 Feb 2021 20:15:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] nbd/server: Avoid unaligned read/block_status from backing
Date: Thu, 18 Feb 2021 14:15:26 -0600
Message-Id: <20210218201528.127099-4-eblake@redhat.com>
In-Reply-To: <20210218201528.127099-1-eblake@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NBD server code used bdrv_block_status_above() to determine where
to fragment structured read and block status replies, and similarly
used bdrv_is_allocated_above() for the qemu:allocation-depth context.
However, the protocol can only advertise the active layer's minimum
block size; if the active layer is backed by another file with smaller
alignment, then we can end up leaking unaligned results back through
to the client, in violation of the spec.

Fix this by exposing a new bdrv_block_status_aligned() function around
the recently-added internal bdrv_co_block_status_aligned, to guarantee
that all block status answers from backing layers are rounded up to
the alignment of the current layer.  Note that the underlying function
still requires aligned boundaries, but the public function copes with
unaligned inputs.

The portion of iotest 241 using an encrypted qcow2 file does not
change in output, but running it manually with traces shows the
improved behavior; furthermore, reverting 737d3f5244 but leaving this
patch in place lets the test pass (whereas before the test would fail
because the client had to work around the server's non-compliance).
Meanwhile, the portion running with blkdebug shows that
qemu:allocation-depth now shows the desired output.

Note that while this fixes NBD_CMD_READ and NBD_CMD_BLOCK_STATUS for
base:allocation and qemu:allocation-depth (because those rely on
bdrv_block_status*), we still have a compliance problem with
NBD_CMD_BLOCK_STATUS for qemu:dirty-bitmap:NN when visiting a bitmap
created at a smaller granularity than what we advertised. That will be
addressed in the next patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/coroutines.h         |  2 ++
 include/block/block.h      |  2 ++
 block/io.c                 | 68 +++++++++++++++++++++++++++++++++-----
 block/quorum.c             |  7 ++--
 nbd/server.c               | 12 +++----
 tests/qemu-iotests/241     |  9 +++--
 tests/qemu-iotests/241.out |  2 +-
 7 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 4cfb4946e65e..1c0d761c669e 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -41,6 +41,7 @@ bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
 int coroutine_fn
 bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   BlockDriverState *base,
+                                  uint32_t align,
                                   bool include_base,
                                   bool want_zero,
                                   int64_t offset,
@@ -52,6 +53,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
+                               uint32_t align,
                                bool include_base,
                                bool want_zero,
                                int64_t offset,
diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d49d..fcfd3514701e 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -517,6 +517,8 @@ int bdrv_block_status(BlockDriverState *bs, int64_t offset,
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file);
+int bdrv_block_status_aligned(BlockDriverState *bs, int64_t offset,
+                              int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
diff --git a/block/io.c b/block/io.c
index 4bca775c96b4..d239282b4763 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2656,6 +2656,7 @@ early_out:
 int coroutine_fn
 bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   BlockDriverState *base,
+                                  uint32_t align,
                                   bool include_base,
                                   bool want_zero,
                                   int64_t offset,
@@ -2698,8 +2699,8 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     for (p = bdrv_filter_or_cow_bs(bs); include_base || p != base;
          p = bdrv_filter_or_cow_bs(p))
     {
-        ret = bdrv_co_block_status(p, want_zero, offset, bytes, pnum, map,
-                                   file);
+        ret = bdrv_co_block_status_aligned(p, align, want_zero, offset, bytes,
+                                           pnum, map, file);
         ++*depth;
         if (ret < 0) {
             return ret;
@@ -2758,8 +2759,8 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file)
 {
-    return bdrv_common_block_status_above(bs, base, false, true, offset, bytes,
-                                          pnum, map, file, NULL);
+    return bdrv_common_block_status_above(bs, base, 1, false, true, offset,
+                                          bytes, pnum, map, file, NULL);
 }

 int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
@@ -2786,7 +2787,7 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
         return 1;
     }

-    ret = bdrv_common_block_status_above(bs, NULL, false, false, offset,
+    ret = bdrv_common_block_status_above(bs, NULL, 1, false, false, offset,
                                          bytes, &pnum, NULL, NULL, NULL);

     if (ret < 0) {
@@ -2796,13 +2797,47 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     return (pnum == bytes) && (ret & BDRV_BLOCK_ZERO);
 }

+/*
+ * Similar to bdrv_block_status_above(bs, NULL, ...), but ensures that
+ * the answer matches the minimum alignment of bs (smaller alignments
+ * in layers above will not leak through to the active layer). It is
+ * assumed that callers do not care about the resulting mapping of
+ * offsets to an underlying BDS.
+ */
+int bdrv_block_status_aligned(BlockDriverState *bs, int64_t offset,
+                              int64_t bytes, int64_t *pnum)
+{
+    /* Widen the request to aligned boundaries */
+    int64_t aligned_offset, aligned_bytes;
+    uint32_t align = bs->bl.request_alignment;
+    int ret;
+
+    assert(pnum);
+    aligned_offset = QEMU_ALIGN_DOWN(offset, align);
+    aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
+    ret = bdrv_common_block_status_above(bs, NULL, align, false, true,
+                                         aligned_offset, aligned_bytes,
+                                         pnum, NULL, NULL, NULL);
+    if (ret < 0) {
+        *pnum = 0;
+        return ret;
+    }
+    assert(*pnum && QEMU_IS_ALIGNED(*pnum, align) &&
+           align > offset - aligned_offset);
+    *pnum -= offset - aligned_offset;
+    if (*pnum > bytes) {
+        *pnum = bytes;
+    }
+    return ret;
+}
+
 int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
                                    int64_t bytes, int64_t *pnum)
 {
     int ret;
     int64_t dummy;

-    ret = bdrv_common_block_status_above(bs, bs, true, false, offset,
+    ret = bdrv_common_block_status_above(bs, bs, 1, true, false, offset,
                                          bytes, pnum ? pnum : &dummy, NULL,
                                          NULL, NULL);
     if (ret < 0) {
@@ -2833,13 +2868,28 @@ int bdrv_is_allocated_above(BlockDriverState *top,
                             bool include_base, int64_t offset,
                             int64_t bytes, int64_t *pnum)
 {
+    /* Widen the request to aligned boundaries */
+    int64_t aligned_offset, aligned_bytes;
+    uint32_t align = top->bl.request_alignment;
     int depth;
-    int ret = bdrv_common_block_status_above(top, base, include_base, false,
-                                             offset, bytes, pnum, NULL, NULL,
-                                             &depth);
+    int ret;
+
+    assert(pnum);
+    aligned_offset = QEMU_ALIGN_DOWN(offset, align);
+    aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
+    ret = bdrv_common_block_status_above(top, base, align, include_base, false,
+                                         aligned_offset, aligned_bytes, pnum,
+                                         NULL, NULL, &depth);
     if (ret < 0) {
+        *pnum = 0;
         return ret;
     }
+    assert(*pnum && QEMU_IS_ALIGNED(*pnum, align) &&
+           align > offset - aligned_offset);
+    *pnum -= offset - aligned_offset;
+    if (*pnum > bytes) {
+        *pnum = bytes;
+    }

     if (ret & BDRV_BLOCK_ALLOCATED) {
         return depth;
diff --git a/block/quorum.c b/block/quorum.c
index 0bd75450de97..feea9ad8fa87 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1230,9 +1230,10 @@ static int coroutine_fn quorum_co_block_status(BlockDriverState *bs,

     for (i = 0; i < s->num_children; i++) {
         int64_t bytes;
-        ret = bdrv_co_common_block_status_above(s->children[i]->bs, NULL, false,
-                                                want_zero, offset, count,
-                                                &bytes, NULL, NULL, NULL);
+        ret = bdrv_co_common_block_status_above(s->children[i]->bs, NULL, 1,
+                                                false, want_zero, offset,
+                                                count, &bytes, NULL, NULL,
+                                                NULL);
         if (ret < 0) {
             quorum_report_bad(QUORUM_OP_TYPE_READ, offset, count,
                               s->children[i]->bs->node_name, ret);
diff --git a/nbd/server.c b/nbd/server.c
index 7229f487d296..40847276ca64 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1923,7 +1923,7 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
 }

 /* Do a sparse read and send the structured reply to the client.
- * Returns -errno if sending fails. bdrv_block_status_above() failure is
+ * Returns -errno if sending fails. bdrv_block_status_aligned() failure is
  * reported to the client, at which point this function succeeds.
  */
 static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
@@ -1939,10 +1939,9 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,

     while (progress < size) {
         int64_t pnum;
-        int status = bdrv_block_status_above(blk_bs(exp->common.blk), NULL,
-                                             offset + progress,
-                                             size - progress, &pnum, NULL,
-                                             NULL);
+        int status = bdrv_block_status_aligned(blk_bs(exp->common.blk),
+                                               offset + progress,
+                                               size - progress, &pnum);
         bool final;

         if (status < 0) {
@@ -2080,8 +2079,7 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
     while (bytes) {
         uint32_t flags;
         int64_t num;
-        int ret = bdrv_block_status_above(bs, NULL, offset, bytes, &num,
-                                          NULL, NULL);
+        int ret = bdrv_block_status_aligned(bs, offset, bytes, &num);

         if (ret < 0) {
             return ret;
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index 5217af82dc65..49e2bc09e5bc 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -129,11 +129,10 @@ $QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
 # is wrong unless the entire 4k is clean.
 $QEMU_IMG map --output=json --image-opts \
 	  "$TEST_IMG",x-dirty-bitmap=qemu:dirty-bitmap:b0 | _filter_qemu_img_map
-
-# FIXME: this should report a single 4k block of "zero":true,"data":true,
-# meaning allocated from the backing chain.  Using "zero":false,"data":false
-# (allocated in active layer) or "zero":false,"data":true (entire region
-# unallocated) is wrong.
+# Reports a single 4k block of "zero":true,"data":true, meaning allocated
+# from the backing chain.  Reporting "zero":false,"data":false would be wrong
+# (nothing is allocated in the active layer), and as would reporting
+# "zero":false,"data":true (the entire region is not unallocated).
 $QEMU_IMG map --output=json --image-opts \
   "$TEST_IMG",x-dirty-bitmap=qemu:allocation-depth | _filter_qemu_img_map
 nbd_server_stop
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 56d3796cf3ac..12a899ba9181 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -44,5 +44,5 @@ Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=4096 backing_file=TEST_DIR/
   size:  4096
   min block: 4096
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
+[{ "start": 0, "length": 4096, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
 *** done
-- 
2.30.1


