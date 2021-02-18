Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FD31F0E2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:19:48 +0100 (CET)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpm7-00076z-VF
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpi9-0005BV-M2
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpi6-0000Ex-Jf
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M4YMKl+P7NllAPbt944VL6IzDLVPLHmcKIYqeBHbN4=;
 b=YOP5NWcZid7ml6nLFU+hevZqG1VvgZjIzJiLhvvnkJ3eodoylmlTKPDDWHP5xMJIW33MY+
 LiFajk2JLH/l4GjOIqv9uODCin5cPSDSwKP6kS/SkACXzTbD5x7zSTD7XjNIPo/jl7+h9R
 +6YfMwr5t/bTGMsMwumCntMYte6kZvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-ncKaCDrLN2eI2Oj3cQ3TFg-1; Thu, 18 Feb 2021 15:15:35 -0500
X-MC-Unique: ncKaCDrLN2eI2Oj3cQ3TFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA63107ACE4;
 Thu, 18 Feb 2021 20:15:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F8B650C0E;
 Thu, 18 Feb 2021 20:15:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] block: Fix BDRV_BLOCK_RAW status to honor alignment
Date: Thu, 18 Feb 2021 14:15:25 -0600
Message-Id: <20210218201528.127099-3-eblake@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous patches mentioned how the blkdebug filter driver demonstrates
a bug present in our NBD server (for example, commit b0245d64); the
bug is also present with the raw format driver when probing
occurs. Basically, if we specify a particular alignment > 1, but defer
the actual block status to the underlying file, and the underlying
file has a smaller alignment, then the use of BDRV_BLOCK_RAW to defer
to the underlying file can end up with status split at an alignment
unacceptable to our layer.  Many callers don't care, but NBD does - it
is a violation of the NBD protocol to send status or read results
split on an unaligned boundary (in 737d3f5244, we taught our 4.0
client to be tolerant of such violations because the problem was even
more pronounced with qemu 3.1 as server; but we still need to fix our
server for the sake of other stricter clients).

This patch lays the groundwork - it adjusts bdrv_block_status to
ensure that any time one layer defers to another via BDRV_BLOCK_RAW,
the deferral is either truncated down to an aligned boundary, or
multiple sub-aligned requests are coalesced into a single
representative answer (using an implicit hole beyond EOF as
needed). Iotest 241 exposes the effect (when format probing occurred,
we don't want block status to subdivide the initial sector, and thus
not any other sector either). Similarly, iotest 221 is a good
candidate to amend to specifically track the effects; a change to a
hole at EOF is not visible if an upper layer does not want alignment
smaller than 512. However, this patch alone is not a complete fix - it
is still possible to have an active layer with large alignment
constraints backed by another layer with smaller constraints; so the
next patch will complete the task.

In particular, the next patch will introduce some mutual recursion
(bdrv_co_common_block_status_above will call this new function rather
than directly into bdrv_co_block_status), so some conditions added
here (such as a NULL pointer for map or handling a length-0 request)
are not reachable until that point.

There is one interesting corner case: prior to this patch, ALLOCATED
was never returned without either DATA or ZERO also set. But now, if
we have two subregions where the first reports status 0 (not
allocated), and the second reports ZERO|ALLOCATED but not DATA
(preallocated, read sees zero but underlying file has indeterminate
contents), then we can end up with a result of just
ALLOCATED. However, looking at callers of bdrv_is_allocated does not
find any problem with this new return value. What's more, this
situation doesn't really happen until the next patch adds support for
getting aligned status from backing files (as the use of aligned
status in this patch tends to be limited to just the protocol child of
a format driver, yet protocol drivers tend to report fully allocated,
and only format drivers have unallocated clusters that defer to a
backing file in the first place).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c                 | 142 +++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/221     |  13 ++++
 tests/qemu-iotests/221.out |   9 +++
 tests/qemu-iotests/241.out |   3 +-
 4 files changed, 161 insertions(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index ca2dca30070e..4bca775c96b4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2325,6 +2325,132 @@ int bdrv_flush_all(void)
     return result;
 }

+static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
+                                             bool want_zero,
+                                             int64_t offset, int64_t bytes,
+                                             int64_t *pnum, int64_t *map,
+                                             BlockDriverState **file);
+
+/*
+ * Returns an aligned allocation status of the specified disk region.
+ *
+ * Wrapper around bdrv_co_block_status() which requires the initial
+ * @offset and @count to be aligned to @align (must be power of 2),
+ * and guarantees the resulting @pnum will also be aligned; this may
+ * require piecing together multiple sub-aligned queries into an
+ * appropriate coalesced answer, as follows:
+ *
+ * - BDRV_BLOCK_DATA is set if the flag is set for at least one subregion
+ * - BDRV_BLOCK_ZERO is set only if the flag is set for all subregions
+ * - BDRV_BLOCK_OFFSET_VALID is set only if all subregions are contiguous
+ *   from the same file (@map and @file are then from the first subregion)
+ * - BDRV_BLOCK_ALLOCATED is set if the flag is set for at least one subregion
+ * - BDRV_BLOCK_EOF is set if the last subregion queried set it (any
+ *   remaining bytes to reach alignment are treated as an implicit hole)
+ * - BDRV_BLOCK_RAW is never set
+ */
+static int coroutine_fn bdrv_co_block_status_aligned(BlockDriverState *bs,
+                                                     uint32_t align,
+                                                     bool want_zero,
+                                                     int64_t offset,
+                                                     int64_t bytes,
+                                                     int64_t *pnum,
+                                                     int64_t *map,
+                                                     BlockDriverState **file)
+{
+    int ret;
+
+    assert(is_power_of_2(align) && QEMU_IS_ALIGNED(offset | bytes, align));
+    ret = bdrv_co_block_status(bs, want_zero, offset, bytes, pnum, map, file);
+    if (ret < 0) {
+        return ret;
+    }
+    /* 0-length return only possible for 0-length query or beyond EOF */
+    if (!*pnum) {
+        assert(!bytes || ret & BDRV_BLOCK_EOF);
+        return ret;
+    }
+    assert(!(ret & BDRV_BLOCK_RAW));
+
+    /*
+     * If initial query ended at EOF, round up to align: the post-EOF
+     * tail is an implicit hole, but our rules say we can treat that
+     * like the initial subregion.
+     */
+    if (ret & BDRV_BLOCK_EOF) {
+        *pnum = QEMU_ALIGN_UP(*pnum, align);
+        assert(*pnum <= bytes);
+        return ret;
+    }
+
+    /*
+     * If result is unaligned but not at EOF, it's easier to return
+     * the aligned subset and then compute the coalesced version over
+     * just align bytes.
+     */
+    if (*pnum >= align) {
+        *pnum = QEMU_ALIGN_DOWN(*pnum, align);
+        return ret;
+    }
+
+    /*
+     * If we got here, we have to merge status for multiple
+     * subregions. We can't detect if offsets are contiguous unless
+     * map and file are non-NULL.
+     */
+    if (!map || !file) {
+        ret &= ~BDRV_BLOCK_OFFSET_VALID;
+    }
+    while (*pnum < align) {
+        int ret2;
+        int64_t pnum2;
+        int64_t map2;
+        BlockDriverState *file2;
+
+        ret2 = bdrv_co_block_status(bs, want_zero, offset + *pnum,
+                                    align - *pnum, &pnum2, &map2, &file2);
+        if (ret2 < 0) {
+            return ret2;
+        }
+        assert(!(ret2 & BDRV_BLOCK_RAW));
+        /*
+         * A 0-length answer here is a bug - we should not be querying
+         * beyond EOF. Our rules allow any further bytes in implicit
+         * hole past EOF to have same treatment as the subregion just
+         * before EOF.
+         */
+        assert(pnum2 && pnum2 <= align - *pnum);
+        if (ret2 & BDRV_BLOCK_EOF) {
+            ret |= BDRV_BLOCK_EOF;
+            pnum2 = align - *pnum;
+        }
+
+        /* Now merge the status */
+        if (ret2 & BDRV_BLOCK_DATA) {
+            ret |= BDRV_BLOCK_DATA;
+        }
+        if (!(ret2 & BDRV_BLOCK_ZERO)) {
+            ret &= ~BDRV_BLOCK_ZERO;
+        }
+        if ((ret & BDRV_BLOCK_OFFSET_VALID) &&
+            (!(ret2 & BDRV_BLOCK_OFFSET_VALID) ||
+             *map + *pnum != map2 || *file != file2)) {
+            ret &= ~BDRV_BLOCK_OFFSET_VALID;
+            if (map) {
+                *map = 0;
+            }
+            if (file) {
+                *file = NULL;
+            }
+        }
+        if (ret2 & BDRV_BLOCK_ALLOCATED) {
+            ret |= BDRV_BLOCK_ALLOCATED;
+        }
+        *pnum += pnum2;
+    }
+    return ret;
+}
+
 /*
  * Returns the allocation status of the specified sectors.
  * Drivers not implementing the functionality are assumed to not support
@@ -2438,7 +2564,17 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
      */
     assert(*pnum && QEMU_IS_ALIGNED(*pnum, align) &&
            align > offset - aligned_offset);
-    if (ret & BDRV_BLOCK_RECURSE) {
+    if (ret & BDRV_BLOCK_RAW) {
+        assert(local_file);
+        ret = bdrv_co_block_status_aligned(local_file, align, want_zero,
+                                           local_map, *pnum, pnum, &local_map,
+                                           &local_file);
+        if (ret < 0) {
+            goto out;
+        }
+        assert(!(ret & BDRV_BLOCK_RAW));
+        ret |= BDRV_BLOCK_RAW;
+    } else if (ret & BDRV_BLOCK_RECURSE) {
         assert(ret & BDRV_BLOCK_DATA);
         assert(ret & BDRV_BLOCK_OFFSET_VALID);
         assert(!(ret & BDRV_BLOCK_ZERO));
@@ -2453,9 +2589,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     }

     if (ret & BDRV_BLOCK_RAW) {
-        assert(ret & BDRV_BLOCK_OFFSET_VALID && local_file);
-        ret = bdrv_co_block_status(local_file, want_zero, local_map,
-                                   *pnum, pnum, &local_map, &local_file);
+        ret &= ~BDRV_BLOCK_RAW;
         goto out;
     }

diff --git a/tests/qemu-iotests/221 b/tests/qemu-iotests/221
index c463fd4b113e..6a15e0160b24 100755
--- a/tests/qemu-iotests/221
+++ b/tests/qemu-iotests/221
@@ -46,6 +46,12 @@ echo
 echo "=== Check mapping of unaligned raw image ==="
 echo

+# Note that when we enable format probing by omitting -f, the raw
+# layer forces 512-byte alignment and the bytes past EOF take on the
+# same status as the rest of the sector; otherwise, we can see the
+# implicit hole visible past EOF thanks to the block layer rounding
+# sizes up.
+
 _make_test_img 65537 # qemu-img create rounds size up

 # file-posix allocates the first block of any images when it is created;
@@ -55,15 +61,22 @@ _make_test_img 65537 # qemu-img create rounds size up
 $QEMU_IO -c 'discard 0 65537' "$TEST_IMG" | _filter_qemu_io

 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
+$QEMU_IMG map -f $IMGFMT --output=json "$TEST_IMG" | _filter_qemu_img_map
+echo

 truncate --size=65537 "$TEST_IMG" # so we resize it and check again
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
+$QEMU_IMG map -f $IMGFMT --output=json "$TEST_IMG" | _filter_qemu_img_map
+echo

 $QEMU_IO -c 'w 65536 1' "$TEST_IMG" | _filter_qemu_io # writing also rounds up
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
+$QEMU_IMG map -f $IMGFMT --output=json "$TEST_IMG" | _filter_qemu_img_map
+echo

 truncate --size=65537 "$TEST_IMG" # so we resize it and check again
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
+$QEMU_IMG map -f $IMGFMT --output=json "$TEST_IMG" | _filter_qemu_img_map

 # success, all done
 echo '*** done'
diff --git a/tests/qemu-iotests/221.out b/tests/qemu-iotests/221.out
index 93846c7dabb6..d22b5e00d4f8 100644
--- a/tests/qemu-iotests/221.out
+++ b/tests/qemu-iotests/221.out
@@ -7,11 +7,20 @@ discard 65537/65537 bytes at offset 0
 64.001 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 [{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+
+[{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+[{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+
 wrote 1/1 bytes at offset 65536
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
+{ "start": 65536, "length": 512, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
+[{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 65536, "length": 1, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 65537, "length": 511, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+
+[{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
+{ "start": 65536, "length": 512, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 65536, "length": 1, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 65537, "length": 511, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 67aaeed34f50..56d3796cf3ac 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -22,8 +22,7 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed

   size:  1024
   min block: 1
-[{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+[{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)

 === Encrypted qcow2 file backed by unaligned raw image ===
-- 
2.30.1


