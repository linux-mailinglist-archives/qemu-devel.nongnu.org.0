Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899541A2BE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:11:42 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyqb-000337-Kz
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybj-0002iN-Sl
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybg-0002ym-GJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vdh1hb7y00u4QhopaI/tHMIt6EpwFydgNaJ0WXDkmX0=;
 b=bRn2qMt0BgopuXSru3TkD399VKVV+lQgWQ1eGoeEqEHK1FxHQe60dlfL8xV/Y2pE4LTLhm
 UgOLrC84P1FnAFSHwtrJEad4yC0TZ4UdrjonWL7tThMHWvZWILdh8Vudqk2gz5XKkKk0ux
 L1g8SmKkgjqTWjyjJnM09XOXsdl5CC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-RQG-ffpIMyGgUfZoe8Gr7w-1; Mon, 27 Sep 2021 17:56:12 -0400
X-MC-Unique: RQG-ffpIMyGgUfZoe8Gr7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAC235074B;
 Mon, 27 Sep 2021 21:56:10 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA2575D9D5;
 Mon, 27 Sep 2021 21:56:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] block: use int64_t instead of int in driver discard
 handlers
Date: Mon, 27 Sep 2021 16:55:36 -0500
Message-Id: <20210927215545.3930309-12-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 "open list:blkdebug" <qemu-block@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Lieven <pl@kamp.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:GLUSTER" <integration@gluster.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
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

So, convert driver discard handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_pdiscard in
block/io.c. It is already prepared to work with 64bit requests, but
pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.

Let's look at all updated functions:

blkdebug: all calculations are still OK, thanks to
  bdrv_check_qiov_request().
  both rule_check and bdrv_co_pdiscard are 64bit

blklogwrites: pass to blk_loc_writes_co_log which is 64bit

blkreplay, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK

copy-before-write: pass to bdrv_co_pdiscard which is 64bit and to
  cbw_do_copy_before_write which is 64bit

file-posix: one handler calls raw_account_discard() is 64bit and both
  handlers calls raw_do_pdiscard(). Update raw_do_pdiscard, which pass
  to RawPosixAIOData::aio_nbytes, which is 64bit (and calls
  raw_account_discard())

gluster: somehow, third argument of glfs_discard_async is size_t.
  Let's set max_pdiscard accordingly.

iscsi: iscsi_allocmap_set_invalid is 64bit,
  !is_byte_request_lun_aligned is 64bit.
  list.num is uint32_t. Let's clarify max_pdiscard and
  pdiscard_alignment.

mirror_top: pass to bdrv_mirror_top_do_write() which is
  64bit

nbd: protocol limitation. max_pdiscard is alredy set strict enough,
  keep it as is for now.

nvme: buf.nlb is uint32_t and we do shift. So, add corresponding limits
  to nvme_refresh_limits().

preallocate: pass to bdrv_co_pdiscard() which is 64bit.

rbd: pass to qemu_rbd_start_co() which is 64bit.

qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
  qcow2_cluster_discard() is 64bit.

raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.

throttle: pass to bdrv_co_pdiscard() which is 64bit and to
  throttle_group_co_io_limits_intercept() which is 64bit as well.

test-block-iothread: bytes argument is unused

Great! Now all drivers are prepared to handle 64bit discard requests,
or else have explicit max_pdiscard limits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210903102807.27127-11-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h        |  2 +-
 block/blkdebug.c                 |  2 +-
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/copy-before-write.c        |  2 +-
 block/copy-on-read.c             |  2 +-
 block/file-posix.c               |  7 ++++---
 block/filter-compress.c          |  2 +-
 block/gluster.c                  |  7 +++++--
 block/iscsi.c                    | 16 +++++++++++-----
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  6 ++++--
 block/nvme.c                     | 14 +++++++++++++-
 block/preallocate.c              |  2 +-
 block/qcow2.c                    |  2 +-
 block/raw-format.c               |  2 +-
 block/rbd.c                      |  4 ++--
 block/throttle.c                 |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 block/trace-events               |  4 ++--
 20 files changed, 55 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 9b4e0748bc86..ffe86068d4d5 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -303,7 +303,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int bytes);
+        int64_t offset, int64_t bytes);

     /* Map [offset, offset + nbytes) range onto a child of @bs to copy from,
      * and invoke bdrv_co_copy_range_from(child, ...), or invoke
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 742b4a3834d8..bbf294870308 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -717,7 +717,7 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     uint32_t align = bs->bl.pdiscard_alignment;
     int err;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index d7ae64c22d81..f7a251e91f9e 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -484,9 +484,9 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 }

 static int coroutine_fn
-blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int count)
+blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
-    return blk_log_writes_co_log(bs, offset, count, NULL, 0,
+    return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
                                  LOG_DISCARD_FLAG, false);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 89d74a3cca29..dcbe780ddbd3 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -105,7 +105,7 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d210e87a4511..c30a5ff8dea9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -64,7 +64,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
 }

 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index f83dd83f14ed..1fc7fb3333b1 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -201,7 +201,7 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,


 static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/file-posix.c b/block/file-posix.c
index f375070f25bb..c62e42743de1 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2942,7 +2942,8 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
 }

 static coroutine_fn int
-raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
+raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
@@ -2966,7 +2967,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
 }

 static coroutine_fn int
-raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return raw_do_pdiscard(bs, offset, bytes, false);
 }
@@ -3591,7 +3592,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 #endif /* linux */

 static coroutine_fn int
-hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index fb85686b6930..d5be538619ae 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -94,7 +94,7 @@ static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,


 static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/gluster.c b/block/gluster.c
index 4e3c9cd14fd9..398976bc66d2 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,6 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
+    bs->bl.max_pdiscard = SIZE_MAX;
 }

 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
@@ -1297,18 +1298,20 @@ error:

 #ifdef CONFIG_GLUSTERFS_DISCARD
 static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
-                                                 int64_t offset, int size)
+                                                 int64_t offset, int64_t bytes)
 {
     int ret;
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;

+    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
+
     acb.size = 0;
     acb.ret = 0;
     acb.coroutine = qemu_coroutine_self();
     acb.aio_context = bdrv_get_aio_context(bs);

-    ret = glfs_discard_async(s->fd, offset, size, gluster_finish_aiocb, &acb);
+    ret = glfs_discard_async(s->fd, offset, bytes, gluster_finish_aiocb, &acb);
     if (ret < 0) {
         return -errno;
     }
diff --git a/block/iscsi.c b/block/iscsi.c
index 74ff7e307ece..57aa07a40d7f 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1138,7 +1138,8 @@ iscsi_getlength(BlockDriverState *bs)
 }

 static int
-coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes)
 {
     IscsiLun *iscsilun = bs->opaque;
     struct IscsiTask iTask;
@@ -1154,6 +1155,12 @@ coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
         return 0;
     }

+    /*
+     * We don't want to overflow list.num which is uint32_t.
+     * We rely on our max_pdiscard.
+     */
+    assert(bytes / iscsilun->block_size <= UINT32_MAX);
+
     list.lba = offset / iscsilun->block_size;
     list.num = bytes / iscsilun->block_size;

@@ -2071,10 +2078,9 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
     }

     if (iscsilun->lbp.lbpu) {
-        if (iscsilun->bl.max_unmap < 0xffffffff / block_size) {
-            bs->bl.max_pdiscard =
-                iscsilun->bl.max_unmap * iscsilun->block_size;
-        }
+        bs->bl.max_pdiscard =
+            MIN_NON_ZERO(iscsilun->bl.max_unmap * iscsilun->block_size,
+                         (uint64_t)UINT32_MAX * iscsilun->block_size);
         bs->bl.pdiscard_alignment =
             iscsilun->bl.opt_unmap_gran * iscsilun->block_size;
     } else {
diff --git a/block/mirror.c b/block/mirror.c
index fab75087b0ba..c962e8b47128 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1508,7 +1508,7 @@ static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
 }

 static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int bytes)
+    int64_t offset, int64_t bytes)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/nbd.c b/block/nbd.c
index c0c479abe9ce..a66b2c282dc3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1457,15 +1457,17 @@ static int nbd_client_co_flush(BlockDriverState *bs)
 }

 static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int bytes)
+                                  int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
         .type = NBD_CMD_TRIM,
         .from = offset,
-        .len = bytes,
+        .len = bytes, /* len is uint32_t */
     };

+    assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
+
     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
         return 0;
diff --git a/block/nvme.c b/block/nvme.c
index 2e0fd9e76a2d..1cc7b62bb4b6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1360,7 +1360,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,

 static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
-                                         int bytes)
+                                         int64_t bytes)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
@@ -1387,6 +1387,14 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,

     assert(s->queue_count > 1);

+    /*
+     * Filling the @buf requires @offset and @bytes to satisfy restrictions
+     * defined in nvme_refresh_limits().
+     */
+    assert(QEMU_IS_ALIGNED(bytes, 1UL << s->blkshift));
+    assert(QEMU_IS_ALIGNED(offset, 1UL << s->blkshift));
+    assert((bytes >> s->blkshift) <= UINT32_MAX);
+
     buf = qemu_try_memalign(s->page_size, s->page_size);
     if (!buf) {
         return -ENOMEM;
@@ -1490,6 +1498,10 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.max_pwrite_zeroes = 1ULL << (s->blkshift + 16);
     bs->bl.pwrite_zeroes_alignment = MAX(bs->bl.request_alignment,
                                          1UL << s->blkshift);
+
+    bs->bl.max_pdiscard = (uint64_t)UINT32_MAX << s->blkshift;
+    bs->bl.pdiscard_alignment = MAX(bs->bl.request_alignment,
+                                    1UL << s->blkshift);
 }

 static void nvme_detach_aio_context(BlockDriverState *bs)
diff --git a/block/preallocate.c b/block/preallocate.c
index 99e28d9f086e..1d4233f73008 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -235,7 +235,7 @@ static coroutine_fn int preallocate_co_preadv_part(
 }

 static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+                                               int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index 4b2e8694952f..d50901675699 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3996,7 +3996,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-                                          int64_t offset, int bytes)
+                                          int64_t offset, int64_t bytes)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index a2485926b8cd..bda757fd1954 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -302,7 +302,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret;

diff --git a/block/rbd.c b/block/rbd.c
index 053eb8e48f44..701fbf2b0cf0 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1197,9 +1197,9 @@ static int coroutine_fn qemu_rbd_co_flush(BlockDriverState *bs)
 }

 static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int count)
+                                             int64_t offset, int64_t bytes)
 {
-    return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
+    return qemu_rbd_start_co(bs, offset, bytes, NULL, 0, RBD_AIO_DISCARD);
 }

 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
diff --git a/block/throttle.c b/block/throttle.c
index c13fe9067f4e..6e8d52fa2451 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -145,7 +145,7 @@ static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
 }

 static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index c86954c7baa1..aea660aeed86 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -48,7 +48,7 @@ static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
 }

 static int coroutine_fn bdrv_test_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index d8a08563f1ca..f2d0a9b62a7e 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -152,8 +152,8 @@ nvme_write_zeroes(void *s, uint64_t offset, uint64_t bytes, int flags) "s %p off
 nvme_qiov_unaligned(const void *qiov, int n, void *base, size_t size, int align) "qiov %p n %d base %p size 0x%zx align 0x%x"
 nvme_prw_buffered(void *s, uint64_t offset, uint64_t bytes, int niov, int is_write) "s %p offset 0x%"PRIx64" bytes %"PRId64" niov %d is_write %d"
 nvme_rw_done(void *s, int is_write, uint64_t offset, uint64_t bytes, int ret) "s %p is_write %d offset 0x%"PRIx64" bytes %"PRId64" ret %d"
-nvme_dsm(void *s, uint64_t offset, uint64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
-nvme_dsm_done(void *s, uint64_t offset, uint64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
+nvme_dsm(void *s, int64_t offset, int64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
+nvme_dsm_done(void *s, int64_t offset, int64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
 nvme_create_queue_pair(unsigned q_index, void *q, size_t size, void *aio_context, int fd) "index %u q %p size %zu aioctx %p fd %d"
-- 
2.31.1


