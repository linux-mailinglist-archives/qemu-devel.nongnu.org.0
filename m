Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3083956B153
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:21:41 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fUq-0006EC-9D
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSp-0003d5-W2
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSo-0000MK-0H
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1deBwnpNjSq9Xt6LKlX/UdBwzqO6LBadYyKsO3v2PY=;
 b=G6XoAgDdmMsIKnWN9nJrzKPMpGFAKI5N2oFVJGER80kpTjVgdymxJsy5edDGSRk7OUtJ5O
 uXJFblxq5FGmWw2GT4O4cEX6OO2OoI4HOH5+/o1MvE75A4JoAoj1vUJU+Gt7A9Kyn6Bgz9
 F7YbIn95qdfdyx4I/yfOY2o8bbawmgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-UBVVi__fPpqcNg9djzxLPw-1; Fri, 08 Jul 2022 00:19:30 -0400
X-MC-Unique: UBVVi__fPpqcNg9djzxLPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B775811E76;
 Fri,  8 Jul 2022 04:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4172FC2811A;
 Fri,  8 Jul 2022 04:19:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC v3 4/8] block: add BDRV_REQ_REGISTERED_BUF request flag
Date: Fri,  8 Jul 2022 05:17:33 +0100
Message-Id: <20220708041737.1768521-5-stefanha@redhat.com>
In-Reply-To: <20220708041737.1768521-1-stefanha@redhat.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

bdrv_aligned_preadv() is strict in validating supported read flags and
its assertions fail when it sees BDRV_REQ_REGISTERED_BUF. There is no
harm in passing BDRV_REQ_REGISTERED_BUF to block drivers that do not
support it, so update the assertions to ignore BDRV_REQ_REGISTERED_BUF.

Care must be taken to clear the flag when the block layer or filter
drivers replace QEMUIOVector elements with bounce buffers since these
have not been registered with bdrv_register_buf(). A lot of the changes
in this commit deal with clearing the flag in those cases.

Ensuring that the flag is cleared properly is somewhat invasive to
implement across the block layer and it's hard to spot when future code
changes accidentally break it. Another option might be to add a flag to
QEMUIOVector itself and clear it in qemu_iovec_*() functions that modify
elements. That is more robust but somewhat of a layering violation, so I
haven't attempted that.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-common.h |  9 +++++++++
 block/blkverify.c            |  4 ++--
 block/crypto.c               |  2 ++
 block/io.c                   | 30 +++++++++++++++++++++++-------
 block/mirror.c               |  2 ++
 block/raw-format.c           |  2 ++
 6 files changed, 40 insertions(+), 9 deletions(-)

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
index 1ba82984ef..c900355adb 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -473,6 +473,8 @@ block_crypto_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     uint64_t sector_size = qcrypto_block_get_sector_size(crypto->block);
     uint64_t payload_offset = qcrypto_block_get_payload_offset(crypto->block);
 
+    flags &= ~BDRV_REQ_REGISTERED_BUF;
+
     assert(!(flags & ~BDRV_REQ_FUA));
     assert(payload_offset < INT64_MAX);
     assert(QEMU_IS_ALIGNED(offset, sector_size));
diff --git a/block/io.c b/block/io.c
index e7f4117fe7..83b8259227 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1541,11 +1541,14 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
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
@@ -1586,7 +1589,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         goto out;
     }
 
-    assert(!(flags & ~bs->supported_read_flags));
+    assert(!(flags & ~(bs->supported_read_flags | BDRV_REQ_REGISTERED_BUF)));
 
     max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
     if (bytes <= max_bytes && bytes <= max_transfer) {
@@ -1775,7 +1778,8 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
 static int bdrv_pad_request(BlockDriverState *bs,
                             QEMUIOVector **qiov, size_t *qiov_offset,
                             int64_t *offset, int64_t *bytes,
-                            BdrvRequestPadding *pad, bool *padded)
+                            BdrvRequestPadding *pad, bool *padded,
+                            BdrvRequestFlags *flags)
 {
     int ret;
 
@@ -1803,6 +1807,10 @@ static int bdrv_pad_request(BlockDriverState *bs,
     if (padded) {
         *padded = true;
     }
+    if (flags) {
+        /* Can't use optimization hint with bounce buffer */
+        *flags &= ~BDRV_REQ_REGISTERED_BUF;
+    }
 
     return 0;
 }
@@ -1857,7 +1865,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     }
 
     ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
-                           NULL);
+                           NULL, &flags);
     if (ret < 0) {
         goto fail;
     }
@@ -1902,6 +1910,11 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
         return -ENOTSUP;
     }
 
+    /* By definition there is no user buffer so this flag doesn't make sense */
+    if (flags & BDRV_REQ_REGISTERED_BUF) {
+        return -EINVAL;
+    }
+
     /* Invalidate the cached block-status data range if this write overlaps */
     bdrv_bsc_invalidate_range(bs, offset, bytes);
 
@@ -2187,6 +2200,9 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
     bool padding;
     BdrvRequestPadding pad;
 
+    /* This flag doesn't make sense for padding or zero writes */
+    flags &= ~BDRV_REQ_REGISTERED_BUF;
+
     padding = bdrv_init_padding(bs, offset, bytes, &pad);
     if (padding) {
         assert(!(flags & BDRV_REQ_NO_WAIT));
@@ -2304,7 +2320,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
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
diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..9bae3dd7f2 100644
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
-- 
2.36.1


