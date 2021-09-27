Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE741A293
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:06:02 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyl7-0000kq-8d
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybc-0002dQ-UN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybW-0002rR-Ve
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sscteo6jh3KrzgAMHYZDwXQ2tB+Qdlw6bmtddzUmkoI=;
 b=WmSx0o5aJh+njlsazKm91UDltYfrZiJwOx/LXcb9E/jP6JzcMZ33ktNw9GiNUxnL1RMEWM
 LveMBZK8516xxi8dCCiLMlta/8i2TW3RRrE2+9eJaYOy8lG1FDYAX1SOP8SlC8ykuWeuJQ
 Sjb0Xx7CA+r5COWirgvACgAw14oFkls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Mz7Ooj-1OpKn4OTSaLa-OA-1; Mon, 27 Sep 2021 17:56:04 -0400
X-MC-Unique: Mz7Ooj-1OpKn4OTSaLa-OA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8AC1084684;
 Mon, 27 Sep 2021 21:56:03 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3F61850E;
 Mon, 27 Sep 2021 21:56:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] block: use int64_t instead of uint64_t in driver write
 handlers
Date: Mon, 27 Sep 2021 16:55:30 -0500
Message-Id: <20210927215545.3930309-6-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:blkdebug" <qemu-block@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Peter Lieven <pl@kamp.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver write handlers parameters which are already 64bit to
signed type.

While being here, convert also flags parameter to be BdrvRequestFlags.

Now let's consider all callers. Simple

  git grep '\->bdrv_\(aio\|co\)_pwritev\(_part\)\?'

shows that's there three callers of driver function:

 bdrv_driver_pwritev() and bdrv_driver_pwritev_compressed() in
 block/io.c, both pass int64_t, checked by bdrv_check_qiov_request() to
 be non-negative.

 qcow2_save_vmstate() does bdrv_check_qiov_request().

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_\(aio\|co\)_pwritev\(_part\)\?\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

shows several callers:

qcow2:
  qcow2_co_truncate() write at most up to @offset, which is checked in
    generic qcow2_co_truncate() by bdrv_check_request().
  qcow2_co_pwritev_compressed_task() pass the request (or part of the
    request) that already went through normal write path, so it should
    be OK

qcow:
  qcow_co_pwritev_compressed() pass int64_t, it's updated by this patch

quorum:
  quorum_co_pwrite_zeroes() pass int64_t and int - OK

throttle:
  throttle_co_pwritev_compressed() pass int64_t, it's updated by this
  patch

vmdk:
  vmdk_co_pwritev_compressed() pass int64_t, it's updated by this
  patch

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210903102807.27127-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h        | 16 ++++++++--------
 block/io.c                       |  6 ++++--
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/copy-before-write.c        |  7 ++++---
 block/copy-on-read.c             | 11 ++++++-----
 block/crypto.c                   |  4 ++--
 block/file-posix.c               |  6 +++---
 block/file-win32.c               |  4 ++--
 block/filter-compress.c          |  7 ++++---
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  5 +++--
 block/nfs.c                      |  6 +++---
 block/null.c                     |  9 +++++----
 block/nvme.c                     |  5 +++--
 block/preallocate.c              |  6 +++---
 block/qcow.c                     | 10 +++++-----
 block/qcow2.c                    |  6 +++---
 block/quorum.c                   |  5 +++--
 block/raw-format.c               |  8 ++++----
 block/rbd.c                      |  6 +++---
 block/throttle.c                 |  9 +++++----
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  8 ++++----
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-block-iothread.c |  4 ++--
 block/trace-events               |  2 +-
 30 files changed, 94 insertions(+), 84 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 9b1a276fa1c9..2cf5f1722a7f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -238,8 +238,8 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
-        BlockCompletionFunc *cb, void *opaque);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_flush)(BlockDriverState *bs,
         BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
@@ -288,10 +288,11 @@ struct BlockDriver {
      * The buffer in @qiov may point directly to guest memory.
      */
     int coroutine_fn (*bdrv_co_pwritev)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pwritev_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
+        BdrvRequestFlags flags);

     /*
      * Efficiently zero a region of the disk image.  Typically an image format
@@ -438,10 +439,9 @@ struct BlockDriver {
                                       Error **errp);

     int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov);
     int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
-        size_t qiov_offset);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);

     int (*bdrv_snapshot_create)(BlockDriverState *bs,
                                 QEMUSnapshotInfo *sn_info);
diff --git a/block/io.c b/block/io.c
index a4f124f75577..aa6f7b075e78 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1230,7 +1230,8 @@ out:
 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
                                             int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     int64_t sector_num;
@@ -2073,7 +2074,8 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
  */
 static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
-    int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
+    int64_t align, QEMUIOVector *qiov, size_t qiov_offset,
+    BdrvRequestFlags flags)
 {
     BlockDriverState *bs = child->bs;
     BlockDriver *drv = bs->drv;
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 12b84190656e..e686cd97993d 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -652,8 +652,8 @@ blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }

 static int coroutine_fn
-blkdebug_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int err;

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index de3d4ba2b6dc..ca174ab135a0 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -460,8 +460,8 @@ blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
 }

 static int coroutine_fn
-blk_log_writes_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                          QEMUIOVector *qiov, int flags)
+blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return blk_log_writes_co_log(bs, offset, bytes, qiov, flags,
                                  blk_log_writes_co_do_file_pwritev, 0, false);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 13ea2166bb69..7ba62dcac12a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -83,7 +83,7 @@ static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
 }

 static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
diff --git a/block/blkverify.c b/block/blkverify.c
index 5e35744b8aff..d1facf5ba90b 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -250,8 +250,8 @@ blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }

 static int coroutine_fn
-blkverify_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                     QEMUIOVector *qiov, int flags)
+blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlkverifyRequest r;
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 591cc3ac7519..74360b48536f 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -86,9 +86,10 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
-                                       uint64_t offset,
-                                       uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset,
+                                       int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index d34add447622..b2ec36b6fc7f 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -181,10 +181,11 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,


 static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
-                                            uint64_t offset,
-                                            uint64_t bytes,
+                                            int64_t offset,
+                                            int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags);
@@ -207,8 +208,8 @@ static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,


 static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
-                                                  uint64_t offset,
-                                                  uint64_t bytes,
+                                                  int64_t offset,
+                                                  int64_t bytes,
                                                   QEMUIOVector *qiov)
 {
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov,
diff --git a/block/crypto.c b/block/crypto.c
index a732a36d1001..c8ba4681e200 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -460,8 +460,8 @@ block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,


 static coroutine_fn int
-block_crypto_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                        QEMUIOVector *qiov, int flags)
+block_crypto_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlockCrypto *crypto = bs->opaque;
     uint64_t cur_bytes; /* number of bytes in current iteration */
diff --git a/block/file-posix.c b/block/file-posix.c
index df4a67f8b247..994f1c26ca7b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2084,9 +2084,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
 }

-static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     assert(flags == 0);
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
diff --git a/block/file-win32.c b/block/file-win32.c
index 4e8947009bcc..ec9d64d0e4e2 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -455,8 +455,8 @@ static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
 }

 static BlockAIOCB *raw_aio_pwritev(BlockDriverState *bs,
-                                   uint64_t offset, uint64_t bytes,
-                                   QEMUIOVector *qiov, int flags,
+                                   int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, BdrvRequestFlags flags,
                                    BlockCompletionFunc *cb, void *opaque)
 {
     BDRVRawState *s = bs->opaque;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 54a16c6c64ad..505822a44fe2 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -74,10 +74,11 @@ static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,


 static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
-                                                 uint64_t offset,
-                                                 uint64_t bytes,
+                                                 int64_t offset,
+                                                 int64_t bytes,
                                                  QEMUIOVector *qiov,
-                                                 size_t qiov_offset, int flags)
+                                                 size_t qiov_offset,
+                                                 BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags | BDRV_REQ_WRITE_COMPRESSED);
diff --git a/block/mirror.c b/block/mirror.c
index e24d0aedd5f3..c4c623ceed85 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1456,7 +1456,7 @@ out:
 }

 static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     MirrorBDSOpaque *s = bs->opaque;
     QEMUIOVector bounce_qiov;
diff --git a/block/nbd.c b/block/nbd.c
index c816933d7da5..caee396525ab 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1381,8 +1381,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret ? ret : request_ret;
 }

-static int nbd_client_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                 uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                 int64_t bytes, QEMUIOVector *qiov,
+                                 BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
diff --git a/block/nfs.c b/block/nfs.c
index 27f9ab8307f6..577aea1d222a 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -296,9 +296,9 @@ static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
     return 0;
 }

-static int coroutine_fn nfs_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *iov,
-                                       int flags)
+static int coroutine_fn nfs_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *iov,
+                                       BdrvRequestFlags flags)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task;
diff --git a/block/null.c b/block/null.c
index 343dbb580d46..75f7d0db40c4 100644
--- a/block/null.c
+++ b/block/null.c
@@ -130,8 +130,9 @@ static coroutine_fn int null_co_preadv(BlockDriverState *bs,
 }

 static coroutine_fn int null_co_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags)
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     return null_co_common(bs);
 }
@@ -203,8 +204,8 @@ static BlockAIOCB *null_aio_preadv(BlockDriverState *bs,
 }

 static BlockAIOCB *null_aio_pwritev(BlockDriverState *bs,
-                                    uint64_t offset, uint64_t bytes,
-                                    QEMUIOVector *qiov, int flags,
+                                    int64_t offset, int64_t bytes,
+                                    QEMUIOVector *qiov, BdrvRequestFlags flags,
                                     BlockCompletionFunc *cb,
                                     void *opaque)
 {
diff --git a/block/nvme.c b/block/nvme.c
index f812eb1cc2a9..c44db1893909 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1259,8 +1259,9 @@ static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
 }

 static coroutine_fn int nvme_co_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags)
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     return nvme_co_prw(bs, offset, bytes, qiov, true, flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index 57094436124a..c19885af17a8 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -349,11 +349,11 @@ static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
-                                                    uint64_t offset,
-                                                    uint64_t bytes,
+                                                    int64_t offset,
+                                                    int64_t bytes,
                                                     QEMUIOVector *qiov,
                                                     size_t qiov_offset,
-                                                    int flags)
+                                                    BdrvRequestFlags flags)
 {
     handle_write(bs, offset, bytes, false);

diff --git a/block/qcow.c b/block/qcow.c
index 1151b8d79bd7..c39940f33ebe 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -714,9 +714,9 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret;
 }

-static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                        uint64_t bytes, QEMUIOVector *qiov,
-                                        int flags)
+static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                        int64_t bytes, QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
@@ -1047,8 +1047,8 @@ static int qcow_make_empty(BlockDriverState *bs)
 /* XXX: put compressed sectors first, then all the cluster aligned
    tables to avoid losing bytes in alignment */
 static coroutine_fn int
-qcow_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                           uint64_t bytes, QEMUIOVector *qiov)
+qcow_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           QEMUIOVector *qiov)
 {
     BDRVQcowState *s = bs->opaque;
     z_stream strm;
diff --git a/block/qcow2.c b/block/qcow2.c
index 680ef705323e..bb5455ed3dee 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2597,8 +2597,8 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 }

 static coroutine_fn int qcow2_co_pwritev_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int offset_in_cluster;
@@ -4631,7 +4631,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
  */
 static coroutine_fn int
 qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
-                                 uint64_t offset, uint64_t bytes,
+                                 int64_t offset, int64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/quorum.c b/block/quorum.c
index 57c73b215643..f4b76ea010c0 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -714,8 +714,9 @@ static void write_quorum_entry(void *opaque)
     }
 }

-static int quorum_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
+                             int64_t bytes, QEMUIOVector *qiov,
+                             BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index a5728e7b0ca7..d223298dfc26 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -216,9 +216,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }

-static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     void *buf = NULL;
     BlockDriver *drv;
@@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
         qiov = &local_qiov;
     }

-    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         goto fail;
     }
diff --git a/block/rbd.c b/block/rbd.c
index 21438dfb7c4f..efc0835ee7b0 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1172,9 +1172,9 @@ coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, int64_t offset,
 }

 static int
-coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                 uint64_t bytes, QEMUIOVector *qiov,
-                                 int flags)
+coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                 int64_t bytes, QEMUIOVector *qiov,
+                                 BdrvRequestFlags flags)
 {
     BDRVRBDState *s = bs->opaque;
     /*
diff --git a/block/throttle.c b/block/throttle.c
index 20362b5fe58f..1330e844c391 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -124,8 +124,9 @@ static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
 }

 static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
-                                            QEMUIOVector *qiov, int flags)
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
@@ -153,8 +154,8 @@ static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
 }

 static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
-                                                       uint64_t offset,
-                                                       uint64_t bytes,
+                                                       int64_t offset,
+                                                       int64_t bytes,
                                                        QEMUIOVector *qiov)
 {
     return throttle_co_pwritev(bs, offset, bytes, qiov,
diff --git a/block/vdi.c b/block/vdi.c
index b394cf6ca638..bdc58d726ee1 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -600,8 +600,8 @@ vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }

 static int coroutine_fn
-vdi_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVdiState *s = bs->opaque;
     QEMUIOVector local_qiov;
diff --git a/block/vmdk.c b/block/vmdk.c
index 78592160d039..8d49e54bdd90 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2068,8 +2068,8 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
 }

 static int coroutine_fn
-vmdk_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+vmdk_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVmdkState *s = bs->opaque;
@@ -2080,8 +2080,8 @@ vmdk_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }

 static int coroutine_fn
-vmdk_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                           uint64_t bytes, QEMUIOVector *qiov)
+vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           QEMUIOVector *qiov)
 {
     if (bytes == 0) {
         /* The caller will write bytes 0 to signal EOF.
diff --git a/block/vpc.c b/block/vpc.c
index 29c8517ff83f..1b4c7333af0e 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -658,8 +658,8 @@ fail:
 }

 static int coroutine_fn
-vpc_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vpc_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVPCState *s = bs->opaque;
     int64_t image_offset;
diff --git a/block/vvfat.c b/block/vvfat.c
index 9c53c2d0a4f1..05e78e3c2756 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3061,8 +3061,8 @@ DLOG(checkpoint());
 }

 static int coroutine_fn
-vvfat_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                 QEMUIOVector *qiov, int flags)
+vvfat_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVVFATState *s = bs->opaque;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index f18fa6e0fba2..c86954c7baa1 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -40,9 +40,9 @@ static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
 }

 static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
-                                             uint64_t offset, uint64_t bytes,
+                                             int64_t offset, int64_t bytes,
                                              QEMUIOVector *qiov,
-                                             int flags)
+                                             BdrvRequestFlags flags)
 {
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index f4f1267c8c01..983dd54830a5 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -75,7 +75,7 @@ luring_resubmit_short_read(void *s, void *luringcb, int nread) "LuringState %p l

 # qcow2.c
 qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t host_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
-qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offset 0x%" PRIx64 " bytes %d"
+qcow2_writev_start_req(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
 qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
 qcow2_writev_done_part(void *co, int cur_bytes) "co %p cur_bytes %d"
-- 
2.31.1


