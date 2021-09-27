Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF541A298
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:06:10 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUylF-0001H2-QD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUyba-0002aq-6n
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybW-0002rH-Bk
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oDVb2Be5KoMlJSXYL0jlY9mZmT4doJahB/5Pv9hrpw=;
 b=HpW864gXQu5bw/A89LuHMnPH8N864E/qVP1Nz9WXbUBBofzJo4uyfu7QBM8L8p4KYIo5DB
 KG7V5/4sitQrD+HQ7F2X2SR4rQ5rtEZk76MLjHAplRChXlpK1VfkWzKMYjHqDDKk1dpeI1
 AKUXlSAmH2Ik4JSB1Vss1l53JmUPcag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-r5UAJaQCNMisFmxKfqMvlw-1; Mon, 27 Sep 2021 17:56:04 -0400
X-MC-Unique: r5UAJaQCNMisFmxKfqMvlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7131E18125C0;
 Mon, 27 Sep 2021 21:56:01 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EE65D9D5;
 Mon, 27 Sep 2021 21:55:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] block: use int64_t instead of uint64_t in driver read
 handlers
Date: Mon, 27 Sep 2021 16:55:29 -0500
Message-Id: <20210927215545.3930309-5-eblake@redhat.com>
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

So, convert driver read handlers parameters which are already 64bit to
signed type.

While being here, convert also flags parameter to be BdrvRequestFlags.

Now let's consider all callers. Simple

  git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'

shows that's there three callers of driver function:

 bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
   bdrv_check_qiov_request() to be non-negative.

 qcow2_load_vmstate() does bdrv_check_qiov_request().

 do_perform_cow_read() has uint64_t argument. And a lot of things in
 qcow2 driver are uint64_t, so converting it is big job. But we must
 not work with requests that don't satisfy bdrv_check_qiov_request(),
 so let's just assert it here.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

The only one such caller:

    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
    ...
    ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);

in tests/unit/test-bdrv-drain.c, and it's OK obviously.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210903102807.27127-4-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: fix typos]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h        | 11 ++++++-----
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/bochs.c                    |  4 ++--
 block/cloop.c                    |  4 ++--
 block/commit.c                   |  2 +-
 block/copy-before-write.c        |  4 ++--
 block/copy-on-read.c             |  4 ++--
 block/crypto.c                   |  4 ++--
 block/curl.c                     |  3 ++-
 block/dmg.c                      |  4 ++--
 block/file-posix.c               |  6 +++---
 block/file-win32.c               |  4 ++--
 block/filter-compress.c          |  4 ++--
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  5 +++--
 block/nfs.c                      |  6 +++---
 block/null.c                     |  9 +++++----
 block/nvme.c                     |  5 +++--
 block/preallocate.c              |  4 ++--
 block/qcow.c                     |  6 +++---
 block/qcow2-cluster.c            | 14 +++++++++++++-
 block/qcow2.c                    |  5 +++--
 block/quorum.c                   |  4 ++--
 block/raw-format.c               | 20 ++++++++++----------
 block/rbd.c                      |  6 +++---
 block/throttle.c                 |  5 +++--
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  4 ++--
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-bdrv-drain.c     | 16 +++++++++-------
 tests/unit/test-block-iothread.c | 19 ++++++++++++++-----
 35 files changed, 120 insertions(+), 90 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index ed60495938a6..9b1a276fa1c9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -235,8 +235,8 @@ struct BlockDriver {

     /* aio */
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
-        BlockCompletionFunc *cb, void *opaque);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
         BlockCompletionFunc *cb, void *opaque);
@@ -265,10 +265,11 @@ struct BlockDriver {
      * The buffer in @qiov may point directly to guest memory.
      */
     int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags);
+        int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_writev)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov, int flags);
     /**
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8b67554bec91..12b84190656e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -631,8 +631,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }

 static int coroutine_fn
-blkdebug_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                   QEMUIOVector *qiov, int flags)
+blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int err;

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index b7579370a30a..de3d4ba2b6dc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -301,8 +301,8 @@ static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **errp)
 }

 static int coroutine_fn
-blk_log_writes_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                         QEMUIOVector *qiov, int flags)
+blk_log_writes_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 4a247752fd8f..13ea2166bb69 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -72,7 +72,7 @@ static void block_request_create(uint64_t reqid, BlockDriverState *bs,
 }

 static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
diff --git a/block/blkverify.c b/block/blkverify.c
index 188d7632faec..5e35744b8aff 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -221,8 +221,8 @@ blkverify_co_prwv(BlockDriverState *bs, BlkverifyRequest *r, uint64_t offset,
 }

 static int coroutine_fn
-blkverify_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlkverifyRequest r;
     QEMUIOVector raw_qiov;
diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a1c..4d68658087bd 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -238,8 +238,8 @@ static int64_t seek_to_sector(BlockDriverState *bs, int64_t sector_num)
 }

 static int coroutine_fn
-bochs_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+bochs_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVBochsState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/cloop.c b/block/cloop.c
index c99192a57f45..b8c6d0eccdba 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -245,8 +245,8 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 }

 static int coroutine_fn
-cloop_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+cloop_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVCloopState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/commit.c b/block/commit.c
index 42792b45562a..10cc5ff4518a 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -207,7 +207,7 @@ static const BlockJobDriver commit_job_driver = {
 };

 static int coroutine_fn bdrv_commit_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a5e57decaa1..591cc3ac7519 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -40,8 +40,8 @@ typedef struct BDRVCopyBeforeWriteState {
 } BDRVCopyBeforeWriteState;

 static coroutine_fn int cbw_co_preadv(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index c42868227233..d34add447622 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -128,10 +128,10 @@ static int64_t cor_getlength(BlockDriverState *bs)


 static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            QEMUIOVector *qiov,
                                            size_t qiov_offset,
-                                           int flags)
+                                           BdrvRequestFlags flags)
 {
     int64_t n;
     int local_flags;
diff --git a/block/crypto.c b/block/crypto.c
index 1d30fde38e55..a732a36d1001 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -397,8 +397,8 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
 #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)

 static coroutine_fn int
-block_crypto_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                       QEMUIOVector *qiov, int flags)
+block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlockCrypto *crypto = bs->opaque;
     uint64_t cur_bytes; /* number of bytes in current iteration */
diff --git a/block/curl.c b/block/curl.c
index 50e741a0d7a5..4a8ae2b26986 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -896,7 +896,8 @@ out:
 }

 static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags)
 {
     CURLAIOCB acb = {
         .co = qemu_coroutine_self(),
diff --git a/block/dmg.c b/block/dmg.c
index ef35a505f266..447901fbb875 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -689,8 +689,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
 }

 static int coroutine_fn
-dmg_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+dmg_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVDMGState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/file-posix.c b/block/file-posix.c
index d81e15efa475..df4a67f8b247 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2077,9 +2077,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
 }

-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
 }
diff --git a/block/file-win32.c b/block/file-win32.c
index b97c58d642f8..4e8947009bcc 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -440,8 +440,8 @@ fail:
 }

 static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
-                                  uint64_t offset, uint64_t bytes,
-                                  QEMUIOVector *qiov, int flags,
+                                  int64_t offset, int64_t bytes,
+                                  QEMUIOVector *qiov, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
     BDRVRawState *s = bs->opaque;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 5136371bf8b9..54a16c6c64ad 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -63,10 +63,10 @@ static int64_t compress_getlength(BlockDriverState *bs)


 static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
+                                                int64_t offset, int64_t bytes,
                                                 QEMUIOVector *qiov,
                                                 size_t qiov_offset,
-                                                int flags)
+                                                BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/mirror.c b/block/mirror.c
index 85b781bc2169..e24d0aedd5f3 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1402,7 +1402,7 @@ static void coroutine_fn active_write_settle(MirrorOp *op)
 }

 static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/nbd.c b/block/nbd.c
index f6ff1c4fb472..c816933d7da5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1322,8 +1322,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
     return ret ? ret : request_ret;
 }

-static int nbd_client_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
diff --git a/block/nfs.c b/block/nfs.c
index 9aeaefb3644f..27f9ab8307f6 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -262,9 +262,9 @@ nfs_co_generic_cb(int ret, struct nfs_context *nfs, void *data,
                                      nfs_co_generic_bh_cb, task);
 }

-static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *iov,
-                                      int flags)
+static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *iov,
+                                      BdrvRequestFlags flags)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task;
diff --git a/block/null.c b/block/null.c
index cc9b1d4ea720..343dbb580d46 100644
--- a/block/null.c
+++ b/block/null.c
@@ -116,8 +116,9 @@ static coroutine_fn int null_co_common(BlockDriverState *bs)
 }

 static coroutine_fn int null_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVNullState *s = bs->opaque;

@@ -187,8 +188,8 @@ static inline BlockAIOCB *null_aio_common(BlockDriverState *bs,
 }

 static BlockAIOCB *null_aio_preadv(BlockDriverState *bs,
-                                   uint64_t offset, uint64_t bytes,
-                                   QEMUIOVector *qiov, int flags,
+                                   int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, BdrvRequestFlags flags,
                                    BlockCompletionFunc *cb,
                                    void *opaque)
 {
diff --git a/block/nvme.c b/block/nvme.c
index abfe305baf2f..f812eb1cc2a9 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1251,8 +1251,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }

 static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     return nvme_co_prw(bs, offset, bytes, qiov, false, flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index b6192063046d..57094436124a 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -227,8 +227,8 @@ static void preallocate_reopen_abort(BDRVReopenState *state)
 }

 static coroutine_fn int preallocate_co_preadv_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/qcow.c b/block/qcow.c
index f8919a44d193..1151b8d79bd7 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -617,9 +617,9 @@ static void qcow_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.request_alignment = BDRV_SECTOR_SIZE;
 }

-static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 4ebb49a087df..5727f92dcb39 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -505,7 +505,19 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
         return -ENOMEDIUM;
     }

-    /* Call .bdrv_co_readv() directly instead of using the public block-layer
+    /*
+     * We never deal with requests that don't satisfy
+     * bdrv_check_qiov_request(), and aligning requests to clusters never
+     * breaks this condition. So, do some assertions before calling
+     * bs->drv->bdrv_co_preadv_part() which has int64_t arguments.
+     */
+    assert(src_cluster_offset <= INT64_MAX);
+    assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
+    assert(qiov->size <= INT64_MAX);
+    bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
+                            qiov, 0, &error_abort);
+    /*
+     * Call .bdrv_co_readv() directly instead of using the public block-layer
      * interface.  This avoids double I/O throttling and request tracking,
      * which can lead to deadlock when block layer copy-on-read is enabled.
      */
diff --git a/block/qcow2.c b/block/qcow2.c
index 1c3cf7f91d86..680ef705323e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2310,9 +2310,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 }

 static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
-                                             uint64_t offset, uint64_t bytes,
+                                             int64_t offset, int64_t bytes,
                                              QEMUIOVector *qiov,
-                                             size_t qiov_offset, int flags)
+                                             size_t qiov_offset,
+                                             BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
diff --git a/block/quorum.c b/block/quorum.c
index f2c08050000e..57c73b215643 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -663,8 +663,8 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }

-static int quorum_co_preadv(BlockDriverState *bs, uint64_t offset,
-                            uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index c26f493688fc..a5728e7b0ca7 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -181,8 +181,8 @@ static void raw_reopen_abort(BDRVReopenState *state)
 }

 /* Check and adjust the offset, against 'offset' and 'size' options. */
-static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
-                                    uint64_t bytes, bool is_write)
+static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
+                                    int64_t bytes, bool is_write)
 {
     BDRVRawState *s = bs->opaque;

@@ -201,9 +201,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
     return 0;
 }

-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     int ret;

@@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
         qiov = &local_qiov;
     }

-    ret = raw_adjust_offset(bs, &offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
     if (ret) {
         goto fail;
     }
@@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 {
     int ret;

-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -306,7 +306,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
 {
     int ret;

-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -541,7 +541,7 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
 {
     int ret;

-    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
+    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
     if (ret) {
         return ret;
     }
@@ -560,7 +560,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
 {
     int ret;

-    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
     if (ret) {
         return ret;
     }
diff --git a/block/rbd.c b/block/rbd.c
index dcf82b15b802..21438dfb7c4f 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1164,9 +1164,9 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
 }

 static int
-coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, uint64_t offset,
-                               uint64_t bytes, QEMUIOVector *qiov,
-                               int flags)
+coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags)
 {
     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_READ);
 }
diff --git a/block/throttle.c b/block/throttle.c
index b685166ad4a9..20362b5fe58f 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -112,8 +112,9 @@ static int64_t throttle_getlength(BlockDriverState *bs)
 }

 static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
-                                           QEMUIOVector *qiov, int flags)
+                                           int64_t offset, int64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags)
 {

     ThrottleGroupMember *tgm = bs->opaque;
diff --git a/block/vdi.c b/block/vdi.c
index 548f8a057b87..b394cf6ca638 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -544,8 +544,8 @@ static int coroutine_fn vdi_co_block_status(BlockDriverState *bs,
 }

 static int coroutine_fn
-vdi_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVdiState *s = bs->opaque;
     QEMUIOVector local_qiov;
diff --git a/block/vmdk.c b/block/vmdk.c
index 4499f136bdff..78592160d039 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1888,8 +1888,8 @@ static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
 }

 static int coroutine_fn
-vmdk_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vmdk_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVmdkState *s = bs->opaque;
     int ret;
diff --git a/block/vpc.c b/block/vpc.c
index 17a705b482af..29c8517ff83f 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -608,8 +608,8 @@ static int vpc_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 }

 static int coroutine_fn
-vpc_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vpc_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVPCState *s = bs->opaque;
     int ret;
diff --git a/block/vvfat.c b/block/vvfat.c
index 34bf1e3a86e1..9c53c2d0a4f1 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1522,8 +1522,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
 }

 static int coroutine_fn
-vvfat_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+vvfat_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVVFATState *s = bs->opaque;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index ce071b5fc5ab..2d3c17e566f1 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -65,8 +65,9 @@ static void co_reenter_bh(void *opaque)
 }

 static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
-                                            QEMUIOVector *qiov, int flags)
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
 {
     BDRVTestState *s = bs->opaque;

@@ -1106,8 +1107,9 @@ static void bdrv_test_top_close(BlockDriverState *bs)
 }

 static int coroutine_fn bdrv_test_top_co_preadv(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
-                                                QEMUIOVector *qiov, int flags)
+                                                int64_t offset, int64_t bytes,
+                                                QEMUIOVector *qiov,
+                                                BdrvRequestFlags flags)
 {
     BDRVTestTopState *tts = bs->opaque;
     return bdrv_co_preadv(tts->wait_child, offset, bytes, qiov, flags);
@@ -1855,10 +1857,10 @@ static void bdrv_replace_test_close(BlockDriverState *bs)
  *   Set .has_read to true and return success.
  */
 static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
-                                                    uint64_t offset,
-                                                    uint64_t bytes,
+                                                    int64_t offset,
+                                                    int64_t bytes,
                                                     QEMUIOVector *qiov,
-                                                    int flags)
+                                                    BdrvRequestFlags flags)
 {
     BDRVReplaceTestState *s = bs->opaque;

diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index c39e70b2f515..f18fa6e0fba2 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -31,9 +31,18 @@
 #include "qemu/main-loop.h"
 #include "iothread.h"

-static int coroutine_fn bdrv_test_co_prwv(BlockDriverState *bs,
-                                          uint64_t offset, uint64_t bytes,
-                                          QEMUIOVector *qiov, int flags)
+static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
+{
+    return 0;
+}
+
+static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
+                                             uint64_t offset, uint64_t bytes,
+                                             QEMUIOVector *qiov,
+                                             int flags)
 {
     return 0;
 }
@@ -66,8 +75,8 @@ static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = 1,

-    .bdrv_co_preadv         = bdrv_test_co_prwv,
-    .bdrv_co_pwritev        = bdrv_test_co_prwv,
+    .bdrv_co_preadv         = bdrv_test_co_preadv,
+    .bdrv_co_pwritev        = bdrv_test_co_pwritev,
     .bdrv_co_pdiscard       = bdrv_test_co_pdiscard,
     .bdrv_co_truncate       = bdrv_test_co_truncate,
     .bdrv_co_block_status   = bdrv_test_co_block_status,
-- 
2.31.1


