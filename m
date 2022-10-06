Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B25F707B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:41:43 +0200 (CEST)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYcg-00054f-8e
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWn-0003HN-Jv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWj-0006pF-FP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWJEAddlsW6NvFzA/02L7xBOr8LNdfkCsyt91eMdQ+s=;
 b=GQjkd3RRQXS5WxkjQLs7kDjKUi0K4mTmSFCGlom3Pv/sQ3EPssvj7J6K4ecgnjO5BQUKpM
 MpvUAw+1BTek7P73YjyrugUC6G0EXzqS5b0BxgR6QiWWMKKSPySc4BtPqsRoBZd9Dk1aWa
 JrkneEu3OiGze5l8/Ka2RLOX/WTno7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-rzp-n09DMwyeKjLwtujL5A-1; Thu, 06 Oct 2022 17:35:29 -0400
X-MC-Unique: rzp-n09DMwyeKjLwtujL5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5FB6185A7A3;
 Thu,  6 Oct 2022 21:35:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18334535939;
 Thu,  6 Oct 2022 21:35:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 06/13] block: add BDRV_REQ_REGISTERED_BUF request flag
Date: Thu,  6 Oct 2022 17:35:00 -0400
Message-Id: <20221006213507.645402-7-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block drivers may optimize I/O requests accessing buffers previously
registered with bdrv_register_buf(). Checking whether all elements of a
request's QEMUIOVector are within previously registered buffers is
expensive, so we need a hint from the user to avoid costly checks.

Add a BDRV_REQ_REGISTERED_BUF request flag to indicate that all
QEMUIOVector elements in an I/O request are known to be within
previously registered buffers.

Always pass the flag through to driver read/write functions. There is
little harm in passing the flag to a driver that does not use it.
Passing the flag to drivers avoids changes across many block drivers.
Filter drivers would need to explicitly support the flag and pass
through to their children when the children support it. That's a lot of
code changes and it's hard to remember to do that everywhere, leading to
silent reduced performance when the flag is accidentally dropped.

The only problematic scenario with the approach in this patch is when a
driver passes the flag through to internal I/O requests that don't use
the same I/O buffer. In that case the hint may be set when it should
actually be clear. This is a rare case though so the risk is low.

Some drivers have assert(!flags), which no longer works when
BDRV_REQ_REGISTERED_BUF is passed in. These assertions aren't very
useful anyway since the functions are called almost exclusively by
bdrv_driver_preadv/pwritev() so if we get flags handling right there
then the assertion is not needed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-common.h |  9 ++++++
 block.c                      | 14 +++++++++
 block/blkverify.c            |  4 +--
 block/crypto.c               |  4 +--
 block/file-posix.c           |  1 -
 block/gluster.c              |  1 -
 block/io.c                   | 61 ++++++++++++++++++++++--------------
 block/mirror.c               |  2 ++
 block/nbd.c                  |  1 -
 block/parallels.c            |  1 -
 block/qcow.c                 |  2 --
 block/qed.c                  |  1 -
 block/raw-format.c           |  2 ++
 block/replication.c          |  1 -
 block/ssh.c                  |  1 -
 block/vhdx.c                 |  1 -
 16 files changed, 69 insertions(+), 37 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..061606e867 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -80,6 +80,15 @@ typedef enum {
      */
     BDRV_REQ_MAY_UNMAP          = 0x4,
 
+    /*
+     * An optimization hint when all QEMUIOVector elements are within
+     * previously registered bdrv_register_buf() memory ranges.
+     *
+     * Code that replaces the user's QEMUIOVector elements with bounce buffers
+     * must take care to clear this flag.
+     */
+    BDRV_REQ_REGISTERED_BUF     = 0x8,
+
     BDRV_REQ_FUA                = 0x10,
     BDRV_REQ_WRITE_COMPRESSED   = 0x20,
 
diff --git a/block.c b/block.c
index bc85f46eed..70abbf774e 100644
--- a/block.c
+++ b/block.c
@@ -1640,6 +1640,20 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         goto open_failed;
     }
 
+    assert(!(bs->supported_read_flags & ~BDRV_REQ_MASK));
+    assert(!(bs->supported_write_flags & ~BDRV_REQ_MASK));
+
+    /*
+     * Always allow the BDRV_REQ_REGISTERED_BUF optimization hint. This saves
+     * drivers that pass read/write requests through to a child the trouble of
+     * declaring support explicitly.
+     *
+     * Drivers must not propagate this flag accidentally when they initiate I/O
+     * to a bounce buffer. That case should be rare though.
+     */
+    bs->supported_read_flags |= BDRV_REQ_REGISTERED_BUF;
+    bs->supported_write_flags |= BDRV_REQ_REGISTERED_BUF;
+
     ret = refresh_total_sectors(bs, bs->total_sectors);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
diff --git a/block/blkverify.c b/block/blkverify.c
index e4a37af3b2..d624f4fd05 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -235,8 +235,8 @@ blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     qemu_iovec_init(&raw_qiov, qiov->niov);
     qemu_iovec_clone(&raw_qiov, qiov, buf);
 
-    ret = blkverify_co_prwv(bs, &r, offset, bytes, qiov, &raw_qiov, flags,
-                            false);
+    ret = blkverify_co_prwv(bs, &r, offset, bytes, qiov, &raw_qiov,
+                            flags & ~BDRV_REQ_REGISTERED_BUF, false);
 
     cmp_offset = qemu_iovec_compare(qiov, &raw_qiov);
     if (cmp_offset != -1) {
diff --git a/block/crypto.c b/block/crypto.c
index 7a57774b76..c7365598a7 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -410,7 +410,6 @@ block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     uint64_t sector_size = qcrypto_block_get_sector_size(crypto->block);
     uint64_t payload_offset = qcrypto_block_get_payload_offset(crypto->block);
 
-    assert(!flags);
     assert(payload_offset < INT64_MAX);
     assert(QEMU_IS_ALIGNED(offset, sector_size));
     assert(QEMU_IS_ALIGNED(bytes, sector_size));
@@ -473,7 +472,8 @@ block_crypto_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     uint64_t sector_size = qcrypto_block_get_sector_size(crypto->block);
     uint64_t payload_offset = qcrypto_block_get_payload_offset(crypto->block);
 
-    assert(!(flags & ~BDRV_REQ_FUA));
+    flags &= ~BDRV_REQ_REGISTERED_BUF;
+
     assert(payload_offset < INT64_MAX);
     assert(QEMU_IS_ALIGNED(offset, sector_size));
     assert(QEMU_IS_ALIGNED(bytes, sector_size));
diff --git a/block/file-posix.c b/block/file-posix.c
index 66fdb07820..f2a960143d 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2142,7 +2142,6 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
                                        int64_t bytes, QEMUIOVector *qiov,
                                        BdrvRequestFlags flags)
 {
-    assert(flags == 0);
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
 }
 
diff --git a/block/gluster.c b/block/gluster.c
index bb1144cf6a..7c90f7ba4b 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1236,7 +1236,6 @@ static coroutine_fn int qemu_gluster_co_writev(BlockDriverState *bs,
                                                QEMUIOVector *qiov,
                                                int flags)
 {
-    assert(!flags);
     return qemu_gluster_co_rw(bs, sector_num, nb_sectors, qiov, 1);
 }
 
diff --git a/block/io.c b/block/io.c
index fa34e6c61d..1d7220a68f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1130,8 +1130,7 @@ static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
     int ret;
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
-    assert(!(flags & ~BDRV_REQ_MASK));
-    assert(!(flags & BDRV_REQ_NO_FALLBACK));
+    assert(!(flags & ~bs->supported_read_flags));
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -1195,23 +1194,29 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
                                             BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
+    bool emulate_fua = false;
     int64_t sector_num;
     unsigned int nb_sectors;
     QEMUIOVector local_qiov;
     int ret;
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
-    assert(!(flags & ~BDRV_REQ_MASK));
-    assert(!(flags & BDRV_REQ_NO_FALLBACK));
 
     if (!drv) {
         return -ENOMEDIUM;
     }
 
+    if ((flags & BDRV_REQ_FUA) &&
+        (~bs->supported_write_flags & BDRV_REQ_FUA)) {
+        flags &= ~BDRV_REQ_FUA;
+        emulate_fua = true;
+    }
+
+    flags &= bs->supported_write_flags;
+
     if (drv->bdrv_co_pwritev_part) {
         ret = drv->bdrv_co_pwritev_part(bs, offset, bytes, qiov, qiov_offset,
-                                        flags & bs->supported_write_flags);
-        flags &= ~bs->supported_write_flags;
+                                        flags);
         goto emulate_flags;
     }
 
@@ -1221,9 +1226,7 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     }
 
     if (drv->bdrv_co_pwritev) {
-        ret = drv->bdrv_co_pwritev(bs, offset, bytes, qiov,
-                                   flags & bs->supported_write_flags);
-        flags &= ~bs->supported_write_flags;
+        ret = drv->bdrv_co_pwritev(bs, offset, bytes, qiov, flags);
         goto emulate_flags;
     }
 
@@ -1233,10 +1236,8 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
             .coroutine = qemu_coroutine_self(),
         };
 
-        acb = drv->bdrv_aio_pwritev(bs, offset, bytes, qiov,
-                                    flags & bs->supported_write_flags,
+        acb = drv->bdrv_aio_pwritev(bs, offset, bytes, qiov, flags,
                                     bdrv_co_io_em_complete, &co);
-        flags &= ~bs->supported_write_flags;
         if (acb == NULL) {
             ret = -EIO;
         } else {
@@ -1254,12 +1255,10 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     assert(bytes <= BDRV_REQUEST_MAX_BYTES);
 
     assert(drv->bdrv_co_writev);
-    ret = drv->bdrv_co_writev(bs, sector_num, nb_sectors, qiov,
-                              flags & bs->supported_write_flags);
-    flags &= ~bs->supported_write_flags;
+    ret = drv->bdrv_co_writev(bs, sector_num, nb_sectors, qiov, flags);
 
 emulate_flags:
-    if (ret == 0 && (flags & BDRV_REQ_FUA)) {
+    if (ret == 0 && emulate_fua) {
         ret = bdrv_co_flush(bs);
     }
 
@@ -1487,11 +1486,14 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     max_transfer = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_transfer, INT_MAX),
                                    align);
 
-    /* TODO: We would need a per-BDS .supported_read_flags and
+    /*
+     * TODO: We would need a per-BDS .supported_read_flags and
      * potential fallback support, if we ever implement any read flags
      * to pass through to drivers.  For now, there aren't any
-     * passthrough flags.  */
-    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));
+     * passthrough flags except the BDRV_REQ_REGISTERED_BUF optimization hint.
+     */
+    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH |
+                       BDRV_REQ_REGISTERED_BUF)));
 
     /* Handle Copy on Read and associated serialisation */
     if (flags & BDRV_REQ_COPY_ON_READ) {
@@ -1532,7 +1534,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         goto out;
     }
 
-    assert(!(flags & ~bs->supported_read_flags));
+    assert(!(flags & ~(bs->supported_read_flags | BDRV_REQ_REGISTERED_BUF)));
 
     max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
     if (bytes <= max_bytes && bytes <= max_transfer) {
@@ -1721,7 +1723,8 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
 static int bdrv_pad_request(BlockDriverState *bs,
                             QEMUIOVector **qiov, size_t *qiov_offset,
                             int64_t *offset, int64_t *bytes,
-                            BdrvRequestPadding *pad, bool *padded)
+                            BdrvRequestPadding *pad, bool *padded,
+                            BdrvRequestFlags *flags)
 {
     int ret;
 
@@ -1749,6 +1752,10 @@ static int bdrv_pad_request(BlockDriverState *bs,
     if (padded) {
         *padded = true;
     }
+    if (flags) {
+        /* Can't use optimization hint with bounce buffer */
+        *flags &= ~BDRV_REQ_REGISTERED_BUF;
+    }
 
     return 0;
 }
@@ -1803,7 +1810,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     }
 
     ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
-                           NULL);
+                           NULL, &flags);
     if (ret < 0) {
         goto fail;
     }
@@ -1848,6 +1855,11 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
         return -ENOTSUP;
     }
 
+    /* By definition there is no user buffer so this flag doesn't make sense */
+    if (flags & BDRV_REQ_REGISTERED_BUF) {
+        return -EINVAL;
+    }
+
     /* Invalidate the cached block-status data range if this write overlaps */
     bdrv_bsc_invalidate_range(bs, offset, bytes);
 
@@ -2133,6 +2145,9 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
     bool padding;
     BdrvRequestPadding pad;
 
+    /* This flag doesn't make sense for padding or zero writes */
+    flags &= ~BDRV_REQ_REGISTERED_BUF;
+
     padding = bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
         assert(!(flags & BDRV_REQ_NO_WAIT));
@@ -2250,7 +2265,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
          * alignment only if there is no ZERO flag.
          */
         ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
-                               &padded);
+                               &padded, &flags);
         if (ret < 0) {
             return ret;
         }
diff --git a/block/mirror.c b/block/mirror.c
index 3c4ab1159d..8d3fc3f19b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1477,6 +1477,8 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
         qemu_iovec_init(&bounce_qiov, 1);
         qemu_iovec_add(&bounce_qiov, bounce_buf, bytes);
         qiov = &bounce_qiov;
+
+        flags &= ~BDRV_REQ_REGISTERED_BUF;
     }
 
     ret = bdrv_mirror_top_do_write(bs, MIRROR_METHOD_COPY, offset, bytes, qiov,
diff --git a/block/nbd.c b/block/nbd.c
index 97683cce27..ce2956e083 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1221,7 +1221,6 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
     };
 
     assert(bytes <= NBD_MAX_BUFFER_SIZE);
-    assert(!flags);
 
     if (!bytes) {
         return 0;
diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..7c04c6a135 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -328,7 +328,6 @@ static coroutine_fn int parallels_co_writev(BlockDriverState *bs,
     QEMUIOVector hd_qiov;
     int ret = 0;
 
-    assert(!flags);
     qemu_iovec_init(&hd_qiov, qiov->niov);
 
     while (nb_sectors > 0) {
diff --git a/block/qcow.c b/block/qcow.c
index 311aaa8705..e9180c7b61 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -628,7 +628,6 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
-    assert(!flags);
     if (qiov->niov > 1) {
         buf = orig_buf = qemu_try_blockalign(bs, qiov->size);
         if (buf == NULL) {
@@ -725,7 +724,6 @@ static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
-    assert(!flags);
     s->cluster_cache_offset = -1; /* disable compressed cache */
 
     /* We must always copy the iov when encrypting, so we
diff --git a/block/qed.c b/block/qed.c
index 324ca0e95a..254c707252 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1395,7 +1395,6 @@ static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,
                                            int64_t sector_num, int nb_sectors,
                                            QEMUIOVector *qiov, int flags)
 {
-    assert(!flags);
     return qed_co_request(bs, sector_num, qiov, nb_sectors, QED_AIOCB_WRITE);
 }
 
diff --git a/block/raw-format.c b/block/raw-format.c
index c7278e348e..34fe7f0023 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -258,6 +258,8 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
         qemu_iovec_add(&local_qiov, buf, 512);
         qemu_iovec_concat(&local_qiov, qiov, 512, qiov->size - 512);
         qiov = &local_qiov;
+
+        flags &= ~BDRV_REQ_REGISTERED_BUF;
     }
 
     ret = raw_adjust_offset(bs, &offset, bytes, true);
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..942f88b205 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -260,7 +260,6 @@ static coroutine_fn int replication_co_writev(BlockDriverState *bs,
     int ret;
     int64_t n;
 
-    assert(!flags);
     ret = replication_get_io_status(s);
     if (ret < 0) {
         goto out;
diff --git a/block/ssh.c b/block/ssh.c
index a2dc646536..a3cddc392c 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1196,7 +1196,6 @@ static coroutine_fn int ssh_co_writev(BlockDriverState *bs,
     BDRVSSHState *s = bs->opaque;
     int ret;
 
-    assert(!flags);
     qemu_co_mutex_lock(&s->lock);
     ret = ssh_write(s, bs, sector_num * BDRV_SECTOR_SIZE,
                     nb_sectors * BDRV_SECTOR_SIZE, qiov);
diff --git a/block/vhdx.c b/block/vhdx.c
index e10e78ebfd..e2344ee0b7 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1342,7 +1342,6 @@ static coroutine_fn int vhdx_co_writev(BlockDriverState *bs, int64_t sector_num,
     uint64_t bat_prior_offset = 0;
     bool bat_update = false;
 
-    assert(!flags);
     qemu_iovec_init(&hd_qiov, qiov->niov);
 
     qemu_co_mutex_lock(&s->lock);
-- 
2.37.3


