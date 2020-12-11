Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025B2D7D2C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:44:42 +0100 (CET)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmTB-0005hr-8o
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvW-0004jS-Se
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlum-0002M0-8F
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUxoKtXvtL7mzdLc6eRUJf2djQkz67Cf2DjBCjlZ+wg=;
 b=A+G0+xMfYEesyMRfg3TEXIhtvrNA5BWpCWGPIDYSm1ufICRqYMdPIejTaMt0jwyqtEEwS5
 pUj7aSTUVEYJiWNDF4fdW8VTL22+aVvo+vkUI43bHJvdwsSgh27aSSBTkVujWF+YG9onY4
 C37+OjPAetZYZ/O7cauD7SLK+Hrns2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-_CsMAFlsO-G3AFVN9x0UAA-1; Fri, 11 Dec 2020 12:09:01 -0500
X-MC-Unique: _CsMAFlsO-G3AFVN9x0UAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F02800D55;
 Fri, 11 Dec 2020 17:09:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039F85D6A8;
 Fri, 11 Dec 2020 17:08:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 31/34] block: introduce BDRV_MAX_LENGTH
Date: Fri, 11 Dec 2020 18:08:09 +0100
Message-Id: <20201211170812.228643-32-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to modify block layer to work with 64bit requests. And
first step is moving to int64_t type for both offset and bytes
arguments in all block request related functions.

It's mostly safe (when widening signed or unsigned int to int64_t), but
switching from uint64_t is questionable.

So, let's first establish the set of requests we want to work with.
First signed int64_t should be enough, as off_t is signed anyway. Then,
obviously offset + bytes should not overflow.

And most interesting: (offset + bytes) being aligned up should not
overflow as well. Aligned to what alignment? First thing that comes in
mind is bs->bl.request_alignment, as we align up request to this
alignment. But there is another thing: look at
bdrv_mark_request_serialising(). It aligns request up to some given
alignment. And this parameter may be bdrv_get_cluster_size(), which is
often a lot greater than bs->bl.request_alignment.
Note also, that bdrv_mark_request_serialising() uses signed int64_t for
calculations. So, actually, we already depend on some restrictions.

Happily, bdrv_get_cluster_size() returns int and
bs->bl.request_alignment has 32bit unsigned type, but defined to be a
power of 2 less than INT_MAX. So, we may establish, that INT_MAX is
absolute maximum for any kind of alignment that may occur with the
request.

Note, that bdrv_get_cluster_size() is not documented to return power
of 2, still bdrv_mark_request_serialising() behaves like it is.
Also, backup uses bdi.cluster_size and is not prepared to it not being
power of 2.
So, let's establish that Qemu supports only power-of-2 clusters and
alignments.

So, alignment can't be greater than 2^30.

Finally to be safe with calculations, to not calculate different
maximums for different nodes (depending on cluster size and
request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
as absolute maximum bytes length for Qemu. Actually, it's not much less
than INT64_MAX.

OK, then, let's apply it to block/io.

Let's consider all block/io entry points of offset/bytes:

4 bytes/offset interface functions: bdrv_co_preadv_part(),
bdrv_co_pwritev_part(), bdrv_co_copy_range_internal() and
bdrv_co_pdiscard() and we check them all with bdrv_check_request().

We also have one entry point with only offset: bdrv_co_truncate().
Check the offset.

And one public structure: BdrvTrackedRequest. Happily, it has only
three external users:

 file-posix.c: adopted by this patch
 write-threshold.c: only read fields
 test-write-threshold.c: sets obviously small constant values

Better is to make the structure private and add corresponding
interfaces.. Still it's not obvious what kind of interface is needed
for file-posix.c. Let's keep it public but add corresponding
assertions.

After this patch we'll convert functions in block/io.c to int64_t bytes
and offset parameters. We can assume that offset/bytes pair always
satisfy new restrictions, and make
corresponding assertions where needed. If we reach some offset/bytes
point in block/io.c missing bdrv_check_request() it is considered a
bug. As well, if block/io.c modifies a offset/bytes request, expanding
it more then aligning up to request_alignment, it's a bug too.

For all io requests except for discard we keep for now old restriction
of 32bit request length.

iotest 206 output error message changed, as now test disk size is
larger than new limit. Add one more test case with new maximum disk
size to cover too-big-L1 case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201203222713.13507-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h        | 10 +++++++
 include/block/block_int.h    |  8 ++++++
 block.c                      | 17 +++++++++++-
 block/file-posix.c           |  6 ++---
 block/io.c                   | 51 +++++++++++++++++++++++++++++-------
 tests/test-write-threshold.c |  4 +++
 tests/qemu-iotests/206       |  2 +-
 tests/qemu-iotests/206.out   |  6 +++++
 8 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..5b81e33e94 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -142,6 +142,16 @@ typedef struct HDGeometry {
                                            INT_MAX >> BDRV_SECTOR_BITS)
 #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
 
+/*
+ * We want allow aligning requests and disk length up to any 32bit alignment
+ * and don't afraid of overflow.
+ * To achieve it, and in the same time use some pretty number as maximum disk
+ * size, let's define maximum "length" (a limit for any offset/bytes request and
+ * for disk size) to be the greatest power of 2 less than INT64_MAX.
+ */
+#define BDRV_MAX_ALIGNMENT (1L << 30)
+#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
+
 /*
  * Allocation status flags for bdrv_block_status() and friends.
  *
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 95d9333be1..1eeafc118c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -70,6 +70,12 @@ enum BdrvTrackedRequestType {
     BDRV_TRACKED_TRUNCATE,
 };
 
+/*
+ * That is not quite good that BdrvTrackedRequest structure is public,
+ * as block/io.c is very careful about incoming offset/bytes being
+ * correct. Be sure to assert bdrv_check_request() succeeded after any
+ * modification of BdrvTrackedRequest object out of block/io.c
+ */
 typedef struct BdrvTrackedRequest {
     BlockDriverState *bs;
     int64_t offset;
@@ -87,6 +93,8 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+int bdrv_check_request(int64_t offset, int64_t bytes);
+
 struct BlockDriver {
     const char *format_name;
     int instance_size;
diff --git a/block.c b/block.c
index eb16fb48c6..8f177504d4 100644
--- a/block.c
+++ b/block.c
@@ -962,6 +962,11 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
     }
 
     bs->total_sectors = hint;
+
+    if (bs->total_sectors * BDRV_SECTOR_SIZE > BDRV_MAX_LENGTH) {
+        return -EFBIG;
+    }
+
     return 0;
 }
 
@@ -5535,6 +5540,7 @@ void bdrv_get_backing_filename(BlockDriverState *bs,
 
 int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
+    int ret;
     BlockDriver *drv = bs->drv;
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
@@ -5548,7 +5554,16 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
         return -ENOTSUP;
     }
     memset(bdi, 0, sizeof(*bdi));
-    return drv->bdrv_get_info(bs, bdi);
+    ret = drv->bdrv_get_info(bs, bdi);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (bdi->cluster_size > BDRV_MAX_ALIGNMENT) {
+        return -EINVAL;
+    }
+
+    return 0;
 }
 
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
diff --git a/block/file-posix.c b/block/file-posix.c
index 9bee3d88d0..83e2cc5530 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2926,7 +2926,6 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 #ifdef CONFIG_FALLOCATE
     if (offset + bytes > bs->total_sectors * BDRV_SECTOR_SIZE) {
         BdrvTrackedRequest *req;
-        uint64_t end;
 
         /*
          * This is a workaround for a bug in the Linux XFS driver,
@@ -2950,8 +2949,9 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
         assert(req->offset <= offset);
         assert(req->offset + req->bytes >= offset + bytes);
 
-        end = INT64_MAX & -(uint64_t)bs->bl.request_alignment;
-        req->bytes = end - req->offset;
+        req->bytes = BDRV_MAX_LENGTH - req->offset;
+
+        assert(bdrv_check_request(req->offset, req->bytes) == 0);
 
         bdrv_mark_request_serialising(req, bs->bl.request_alignment);
     }
diff --git a/block/io.c b/block/io.c
index ef75a5abb4..6343d85476 100644
--- a/block/io.c
+++ b/block/io.c
@@ -176,6 +176,13 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     /* Then let the driver override it */
     if (drv->bdrv_refresh_limits) {
         drv->bdrv_refresh_limits(bs, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
+    if (bs->bl.request_alignment > BDRV_MAX_ALIGNMENT) {
+        error_setg(errp, "Driver requires too large request alignment");
     }
 }
 
@@ -884,13 +891,31 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-static int bdrv_check_byte_request(int64_t offset, size_t size)
+int bdrv_check_request(int64_t offset, int64_t bytes)
 {
-    if (size > BDRV_REQUEST_MAX_BYTES) {
+    if (offset < 0 || bytes < 0) {
         return -EIO;
     }
 
-    if (offset < 0) {
+    if (bytes > BDRV_MAX_LENGTH) {
+        return -EIO;
+    }
+
+    if (offset > BDRV_MAX_LENGTH - bytes) {
+        return -EIO;
+    }
+
+    return 0;
+}
+
+static int bdrv_check_request32(int64_t offset, int64_t bytes)
+{
+    int ret = bdrv_check_request(offset, bytes);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (bytes > BDRV_REQUEST_MAX_BYTES) {
         return -EIO;
     }
 
@@ -1641,7 +1666,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2057,7 +2082,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2787,8 +2812,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         return -EPERM;
     }
 
-    if (offset < 0 || bytes < 0 || bytes > INT64_MAX - offset) {
-        return -EIO;
+    ret = bdrv_check_request(offset, bytes);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Do nothing if disabled.  */
@@ -3047,7 +3073,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(dst_offset, bytes);
+    ret = bdrv_check_request32(dst_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3058,7 +3084,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(src_offset, bytes);
+    ret = bdrv_check_request32(src_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3188,6 +3214,13 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return -EINVAL;
     }
 
+    ret = bdrv_check_request(offset, 0);
+    if (ret < 0) {
+        error_setg(errp, "Required too big image size, it must be not greater "
+                   "than %" PRId64, BDRV_MAX_LENGTH);
+        return ret;
+    }
+
     old_size = bdrv_getlength(bs);
     if (old_size < 0) {
         error_setg_errno(errp, -old_size, "Failed to get old image size");
diff --git a/tests/test-write-threshold.c b/tests/test-write-threshold.c
index 97ca12f710..4cf032652d 100644
--- a/tests/test-write-threshold.c
+++ b/tests/test-write-threshold.c
@@ -64,6 +64,8 @@ static void test_threshold_not_trigger(void)
     req.offset = 1024;
     req.bytes = 1024;
 
+    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
     g_assert_cmpuint(amount, ==, 0);
@@ -82,6 +84,8 @@ static void test_threshold_trigger(void)
     req.offset = (4 * 1024 * 1024) - 1024;
     req.bytes = 2 * 1024;
 
+    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
     g_assert_cmpuint(amount, >=, 1024);
diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index 0a3ee5ef00..d12d7cb566 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -202,7 +202,7 @@ with iotests.FilePath('t.qcow2') as disk_path, \
 
     vm.launch()
     for size in [ 1234, 18446744073709551104, 9223372036854775808,
-                  9223372036854775296 ]:
+                  9223372036854775296, 9223372035781033984 ]:
         vm.blockdev_create({ 'driver': imgfmt,
                              'file': 'node0',
                              'size': size })
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index a100849fcb..e8a36de00b 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -180,6 +180,12 @@ Job failed: Could not resize image: Image size cannot be negative
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 9223372036854775296}}}
 {"return": {}}
+Job failed: Could not resize image: Required too big image size, it must be not greater than 9223372035781033984
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 9223372035781033984}}}
+{"return": {}}
 Job failed: Could not resize image: Failed to grow the L1 table: File too large
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-- 
2.29.2


