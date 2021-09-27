Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450F41A2A7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:07:55 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUymw-00068d-CP
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybj-0002hw-2e
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybb-0002u3-H9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK+JkXMDrCeU92/HHiVItUB5YHQ8TjLB1xHQ9ZGLLxI=;
 b=EPGj/KUpJbJH7o8Nj8YrKqjTDBzhEJ7IpfFwQxZyQgm1zBOug8o/PElh4TnLtndBOXRk7+
 nK4xIZ1wn6x56uMucD3OnXe94T6G/GdjMOv6uJKZt4HQjVc/Y0sP7jSYJ6xgmsToJ69BW9
 zLA0Ish7CVgR8DTjPjjJpRfo6UjG0m8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-E06j1wQfOCeZPQT-jCBkNQ-1; Mon, 27 Sep 2021 17:56:09 -0400
X-MC-Unique: E06j1wQfOCeZPQT-jCBkNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B757A802C87;
 Mon, 27 Sep 2021 21:56:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 782855D9D5;
 Mon, 27 Sep 2021 21:56:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] block: use int64_t instead of int in driver write_zeroes
 handlers
Date: Mon, 27 Sep 2021 16:55:33 -0500
Message-Id: <20210927215545.3930309-9-eblake@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Alberto Garcia <berto@igalia.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
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

So, convert driver write_zeroes handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_do_pwrite_zeroes().

bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
max_write_zeroes is limited to INT_MAX. So, updated functions all are
safe, they will not get "bytes" larger than before.

Still, let's look through all updated functions, and add assertions to
the ones which are actually unprepared to values larger than INT_MAX.
For these drivers also set explicit max_pwrite_zeroes limit.

Let's go:

blkdebug: calculations can't overflow, thanks to
  bdrv_check_qiov_request() in generic layer. rule_check() and
  bdrv_co_pwrite_zeroes() both have 64bit argument.

blklogwrites: pass to blk_log_writes_co_log() with 64bit argument.

blkreplay, copy-on-read, filter-compress: pass to
  bdrv_co_pwrite_zeroes() which is OK

copy-before-write: Calls cbw_do_copy_before_write() and
  bdrv_co_pwrite_zeroes, both have 64bit argument.

file-posix: both handler calls raw_do_pwrite_zeroes, which is updated.
  In raw_do_pwrite_zeroes() calculations are OK due to
  bdrv_check_qiov_request(), bytes go to RawPosixAIOData::aio_nbytes
  which is uint64_t.
  Check also where that uint64_t gets handed:
  handle_aiocb_write_zeroes_block() passes a uint64_t[2] to
  ioctl(BLKZEROOUT), handle_aiocb_write_zeroes() calls do_fallocate()
  which takes off_t (and we compile to always have 64-bit off_t), as
  does handle_aiocb_write_zeroes_unmap. All look safe.

gluster: bytes go to GlusterAIOCB::size which is int64_t and to
  glfs_zerofill_async works with off_t.

iscsi: Aha, here we deal with iscsi_writesame16_task() that has
  uint32_t num_blocks argument and iscsi_writesame16_task() has
  uint16_t argument. Make comments, add assertions and clarify
  max_pwrite_zeroes calculation.
  iscsi_allocmap_() functions already has int64_t argument
  is_byte_request_lun_aligned is simple to update, do it.

mirror_top: pass to bdrv_mirror_top_do_write which has uint64_t
  argument

nbd: Aha, here we have protocol limitation, and NBDRequest::len is
  uint32_t. max_pwrite_zeroes is cleanly set to 32bit value, so we are
  OK for now.

nvme: Again, protocol limitation. And no inherent limit for
  write-zeroes at all. But from code that calculates cdw12 it's obvious
  that we do have limit and alignment. Let's clarify it. Also,
  obviously the code is not prepared to handle bytes=0. Let's handle
  this case too.
  trace events already 64bit

preallocate: pass to handle_write() and bdrv_co_pwrite_zeroes(), both
  64bit.

rbd: pass to qemu_rbd_start_co() which is 64bit.

qcow2: offset + bytes and alignment still works good (thanks to
  bdrv_check_qiov_request()), so tail calculation is OK
  qcow2_subcluster_zeroize() has 64bit argument, should be OK
  trace events updated

qed: qed_co_request wants int nb_sectors. Also in code we have size_t
  used for request length which may be 32bit. So, let's just keep
  INT_MAX as a limit (aligning it down to pwrite_zeroes_alignment) and
  don't care.

raw-format: Is OK. raw_adjust_offset and bdrv_co_pwrite_zeroes are both
  64bit.

throttle: Both throttle_group_co_io_limits_intercept() and
  bdrv_co_pwrite_zeroes() are 64bit.

vmdk: pass to vmdk_pwritev which is 64bit

quorum: pass to quorum_co_pwritev() which is 64bit

Hooray!

At this point all block drivers are prepared to support 64bit
write-zero requests, or have explicitly set max_pwrite_zeroes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210903102807.27127-8-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: use <= rather than < in assertions relying on max_pwrite_zeroes]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  2 +-
 block/blkdebug.c          |  2 +-
 block/blklogwrites.c      |  4 ++--
 block/blkreplay.c         |  2 +-
 block/copy-before-write.c |  2 +-
 block/copy-on-read.c      |  2 +-
 block/file-posix.c        |  6 +++---
 block/filter-compress.c   |  2 +-
 block/gluster.c           |  6 +++---
 block/iscsi.c             | 30 ++++++++++++++++++++----------
 block/mirror.c            |  2 +-
 block/nbd.c               |  6 ++++--
 block/nvme.c              | 24 +++++++++++++++++++++---
 block/preallocate.c       |  2 +-
 block/qcow2.c             |  2 +-
 block/qed.c               |  9 ++++++++-
 block/quorum.c            |  2 +-
 block/raw-format.c        |  2 +-
 block/rbd.c               |  4 ++--
 block/throttle.c          |  2 +-
 block/vmdk.c              |  2 +-
 block/trace-events        |  4 ++--
 22 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 24958acd33f4..d518703e3e59 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -301,7 +301,7 @@ struct BlockDriver {
      * will be called instead.
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags);
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
         int64_t offset, int bytes);

diff --git a/block/blkdebug.c b/block/blkdebug.c
index e686cd97993d..742b4a3834d8 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -684,7 +684,7 @@ static int blkdebug_co_flush(BlockDriverState *bs)
 }

 static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     uint32_t align = MAX(bs->bl.request_alignment,
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index ca174ab135a0..d7ae64c22d81 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -468,8 +468,8 @@ blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }

 static int coroutine_fn
-blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
-                                BdrvRequestFlags flags)
+blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_log_writes_co_log(bs, offset, bytes, NULL, flags,
                                  blk_log_writes_co_do_file_pwrite_zeroes, 0,
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 7ba62dcac12a..89d74a3cca29 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -94,7 +94,7 @@ static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
 }

 static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 74360b48536f..d210e87a4511 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -75,7 +75,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
 }

 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags)
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index b2ec36b6fc7f..f83dd83f14ed 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -193,7 +193,7 @@ static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,


 static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int bytes,
+                                             int64_t offset, int64_t bytes,
                                              BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/file-posix.c b/block/file-posix.c
index ed71e8d2dfee..f375070f25bb 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2972,7 +2972,7 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }

 static int coroutine_fn
-raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
+raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
                      BdrvRequestFlags flags, bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
@@ -3040,7 +3040,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,

 static int coroutine_fn raw_co_pwrite_zeroes(
     BlockDriverState *bs, int64_t offset,
-    int bytes, BdrvRequestFlags flags)
+    int64_t bytes, BdrvRequestFlags flags)
 {
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, false);
 }
@@ -3605,7 +3605,7 @@ hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }

 static coroutine_fn int hdev_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int rc;

diff --git a/block/filter-compress.c b/block/filter-compress.c
index 505822a44fe2..fb85686b6930 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -86,7 +86,7 @@ static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,


 static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/gluster.c b/block/gluster.c
index d51938e447c0..4e3c9cd14fd9 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1003,19 +1003,19 @@ static void qemu_gluster_reopen_abort(BDRVReopenState *state)
 #ifdef CONFIG_GLUSTERFS_ZEROFILL
 static coroutine_fn int qemu_gluster_co_pwrite_zeroes(BlockDriverState *bs,
                                                       int64_t offset,
-                                                      int size,
+                                                      int64_t bytes,
                                                       BdrvRequestFlags flags)
 {
     int ret;
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;

-    acb.size = size;
+    acb.size = bytes;
     acb.ret = 0;
     acb.coroutine = qemu_coroutine_self();
     acb.aio_context = bdrv_get_aio_context(bs);

-    ret = glfs_zerofill_async(s->fd, offset, size, gluster_finish_aiocb, &acb);
+    ret = glfs_zerofill_async(s->fd, offset, bytes, gluster_finish_aiocb, &acb);
     if (ret < 0) {
         return -errno;
     }
diff --git a/block/iscsi.c b/block/iscsi.c
index 01fdd1775f12..74ff7e307ece 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -427,14 +427,14 @@ static int64_t sector_qemu2lun(int64_t sector, IscsiLun *iscsilun)
     return sector * BDRV_SECTOR_SIZE / iscsilun->block_size;
 }

-static bool is_byte_request_lun_aligned(int64_t offset, int count,
+static bool is_byte_request_lun_aligned(int64_t offset, int64_t bytes,
                                         IscsiLun *iscsilun)
 {
-    if (offset % iscsilun->block_size || count % iscsilun->block_size) {
+    if (offset % iscsilun->block_size || bytes % iscsilun->block_size) {
         error_report("iSCSI misaligned request: "
                      "iscsilun->block_size %u, offset %" PRIi64
-                     ", count %d",
-                     iscsilun->block_size, offset, count);
+                     ", bytes %" PRIi64,
+                     iscsilun->block_size, offset, bytes);
         return false;
     }
     return true;
@@ -1202,12 +1202,12 @@ out_unlock:

 static int
 coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                    int bytes, BdrvRequestFlags flags)
+                                    int64_t bytes, BdrvRequestFlags flags)
 {
     IscsiLun *iscsilun = bs->opaque;
     struct IscsiTask iTask;
     uint64_t lba;
-    uint32_t nb_blocks;
+    uint64_t nb_blocks;
     bool use_16_for_ws = iscsilun->use_16_for_rw;
     int r = 0;

@@ -1247,11 +1247,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     iscsi_co_init_iscsitask(iscsilun, &iTask);
 retry:
     if (use_16_for_ws) {
+        /*
+         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
+         * on our max_pwrite_zeroes limit.
+         */
+        assert(nb_blocks <= UINT32_MAX);
         iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
                                             iscsilun->zeroblock, iscsilun->block_size,
                                             nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
                                             0, 0, iscsi_co_generic_cb, &iTask);
     } else {
+        /*
+         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
+         * on our max_pwrite_zeroes limit.
+         */
+        assert(nb_blocks <= UINT16_MAX);
         iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
                                             iscsilun->zeroblock, iscsilun->block_size,
                                             nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
@@ -2071,10 +2081,10 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.pdiscard_alignment = iscsilun->block_size;
     }

-    if (iscsilun->bl.max_ws_len < 0xffffffff / block_size) {
-        bs->bl.max_pwrite_zeroes =
-            iscsilun->bl.max_ws_len * iscsilun->block_size;
-    }
+    bs->bl.max_pwrite_zeroes =
+        MIN_NON_ZERO(iscsilun->bl.max_ws_len * iscsilun->block_size,
+                     max_xfer_len * iscsilun->block_size);
+
     if (iscsilun->lbp.lbpws) {
         bs->bl.pwrite_zeroes_alignment =
             iscsilun->bl.opt_unmap_gran * iscsilun->block_size;
diff --git a/block/mirror.c b/block/mirror.c
index c4c623ceed85..fab75087b0ba 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1501,7 +1501,7 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
 }

 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
diff --git a/block/nbd.c b/block/nbd.c
index caee396525ab..c0c479abe9ce 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1407,15 +1407,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
 }

 static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
         .type = NBD_CMD_WRITE_ZEROES,
         .from = offset,
-        .len = bytes,
+        .len = bytes,  /* .len is uint32_t actually */
     };

+    assert(bytes <= UINT32_MAX); /* rely on max_pwrite_zeroes */
+
     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES)) {
         return -ENOTSUP;
diff --git a/block/nvme.c b/block/nvme.c
index c44db1893909..2e0fd9e76a2d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1296,19 +1296,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)

 static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
                                               int64_t offset,
-                                              int bytes,
+                                              int64_t bytes,
                                               BdrvRequestFlags flags)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
     NVMeRequest *req;
-
-    uint32_t cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
+    uint32_t cdw12;

     if (!s->supports_write_zeroes) {
         return -ENOTSUP;
     }

+    if (bytes == 0) {
+        return 0;
+    }
+
+    cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
+    /*
+     * We should not lose information. pwrite_zeroes_alignment and
+     * max_pwrite_zeroes guarantees it.
+     */
+    assert(((cdw12 + 1) << s->blkshift) == bytes);
+
     NvmeCmd cmd = {
         .opcode = NVME_CMD_WRITE_ZEROES,
         .nsid = cpu_to_le32(s->nsid),
@@ -1472,6 +1482,14 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.opt_mem_alignment = s->page_size;
     bs->bl.request_alignment = s->page_size;
     bs->bl.max_transfer = s->max_transfer;
+
+    /*
+     * Look at nvme_co_pwrite_zeroes: after shift and decrement we should get
+     * at most 0xFFFF
+     */
+    bs->bl.max_pwrite_zeroes = 1ULL << (s->blkshift + 16);
+    bs->bl.pwrite_zeroes_alignment = MAX(bs->bl.request_alignment,
+                                         1UL << s->blkshift);
 }

 static void nvme_detach_aio_context(BlockDriverState *bs)
diff --git a/block/preallocate.c b/block/preallocate.c
index c19885af17a8..99e28d9f086e 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -337,7 +337,7 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
 }

 static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags)
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     bool want_merge_zero =
         !(flags & ~(BDRV_REQ_ZERO_WRITE | BDRV_REQ_NO_FALLBACK));
diff --git a/block/qcow2.c b/block/qcow2.c
index 520ae37a296a..4b2e8694952f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3941,7 +3941,7 @@ static bool is_zero(BlockDriverState *bs, int64_t offset, int64_t bytes)
 }

 static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qed.c b/block/qed.c
index f45c640513f5..558d3646c4b2 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -582,6 +582,7 @@ static void bdrv_qed_refresh_limits(BlockDriverState *bs, Error **errp)
     BDRVQEDState *s = bs->opaque;

     bs->bl.pwrite_zeroes_alignment = s->header.cluster_size;
+    bs->bl.max_pwrite_zeroes = QEMU_ALIGN_DOWN(INT_MAX, s->header.cluster_size);
 }

 /* We have nothing to do for QED reopen, stubs just return
@@ -1397,7 +1398,7 @@ static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,

 static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
                                                   int64_t offset,
-                                                  int bytes,
+                                                  int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     BDRVQEDState *s = bs->opaque;
@@ -1408,6 +1409,12 @@ static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
      */
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, bytes);

+    /*
+     * QED is not prepared for 63bit write-zero requests, so rely on
+     * max_pwrite_zeroes.
+     */
+    assert(bytes <= INT_MAX);
+
     /* Fall back if the request is not aligned */
     if (qed_offset_into_cluster(s, offset) ||
         qed_offset_into_cluster(s, bytes)) {
diff --git a/block/quorum.c b/block/quorum.c
index f4b76ea010c0..c28dda7baac7 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -746,7 +746,7 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
 }

 static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                   int bytes, BdrvRequestFlags flags)
+                                   int64_t bytes, BdrvRequestFlags flags)

 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
diff --git a/block/raw-format.c b/block/raw-format.c
index 345137813e5c..a2485926b8cd 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -289,7 +289,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
 }

 static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int bytes,
+                                             int64_t offset, int64_t bytes,
                                              BdrvRequestFlags flags)
 {
     int ret;
diff --git a/block/rbd.c b/block/rbd.c
index efc0835ee7b0..053eb8e48f44 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1205,9 +1205,9 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
 static int
 coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                      int count, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
-    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
+    return qemu_rbd_start_co(bs, offset, bytes, NULL, flags,
                              RBD_AIO_WRITE_ZEROES);
 }
 #endif
diff --git a/block/throttle.c b/block/throttle.c
index 1330e844c391..c13fe9067f4e 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -135,7 +135,7 @@ static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
 }

 static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
diff --git a/block/vmdk.c b/block/vmdk.c
index 8d49e54bdd90..fb4cc9da9077 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2109,7 +2109,7 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,

 static int coroutine_fn vmdk_co_pwrite_zeroes(BlockDriverState *bs,
                                               int64_t offset,
-                                              int bytes,
+                                              int64_t bytes,
                                               BdrvRequestFlags flags)
 {
     int ret;
diff --git a/block/trace-events b/block/trace-events
index 983dd54830a5..d8a08563f1ca 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -80,8 +80,8 @@ qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
 qcow2_writev_done_part(void *co, int cur_bytes) "co %p cur_bytes %d"
 qcow2_writev_data(void *co, uint64_t offset) "co %p offset 0x%" PRIx64
-qcow2_pwrite_zeroes_start_req(void *co, int64_t offset, int count) "co %p offset 0x%" PRIx64 " count %d"
-qcow2_pwrite_zeroes(void *co, int64_t offset, int count) "co %p offset 0x%" PRIx64 " count %d"
+qcow2_pwrite_zeroes_start_req(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
+qcow2_pwrite_zeroes(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
 qcow2_skip_cow(void *co, uint64_t offset, int nb_clusters) "co %p offset 0x%" PRIx64 " nb_clusters %d"

 # qcow2-cluster.c
-- 
2.31.1


