Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98F25F98E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:35:09 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFQS-0002YV-7z
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3C-0004A2-8r
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47584
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF39-0008JA-Vd
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeaLWVHNRycD65UpoA7dprHEkXLaROaEJVhg8h14LaM=;
 b=WvX9izcyceAXSCF0aq/++pNq4lnxGkl6Kk35rao8n+/Ru8EbIExjndk1854nnKcZ4WSBOG
 7WYBeUh/5W1b3y1DlCRI8q25Ss6FCeV6H0/TLgvtoSNjSxJKF+YAVMdlN6VVtJydW2cDNT
 67I6OWsDEW3T9RpJmDSD+5M0hA5CLTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-iE0jkGfHPt-AwkUGk8U1lQ-1; Mon, 07 Sep 2020 07:10:53 -0400
X-MC-Unique: iE0jkGfHPt-AwkUGk8U1lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDAA61007466;
 Mon,  7 Sep 2020 11:10:51 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB1099CBA;
 Mon,  7 Sep 2020 11:10:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 52/64] block: Inline bdrv_co_block_status_from_*()
Date: Mon,  7 Sep 2020 13:09:24 +0200
Message-Id: <20200907110936.261684-53-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

With bdrv_filter_bs(), we can easily handle this default filter behavior
in bdrv_co_block_status().

blkdebug wants to have an additional assertion, so it keeps its own
implementation, except bdrv_co_block_status_from_file() needs to be
inlined there.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 22 -----------------
 block/backup-top.c        |  2 --
 block/blkdebug.c          |  7 ++++--
 block/blklogwrites.c      |  1 -
 block/commit.c            |  1 -
 block/copy-on-read.c      |  2 --
 block/filter-compress.c   |  2 --
 block/io.c                | 51 +++++++++++++--------------------------
 block/mirror.c            |  1 -
 block/throttle.c          |  1 -
 10 files changed, 22 insertions(+), 68 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index bb3d1c8a8c..8b9d769e14 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1303,28 +1303,6 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
                         uint64_t perm, uint64_t shared,
                         uint64_t *nperm, uint64_t *nshared);
 
-/*
- * Default implementation for drivers to pass bdrv_co_block_status() to
- * their file.
- */
-int coroutine_fn bdrv_co_block_status_from_file(BlockDriverState *bs,
-                                                bool want_zero,
-                                                int64_t offset,
-                                                int64_t bytes,
-                                                int64_t *pnum,
-                                                int64_t *map,
-                                                BlockDriverState **file);
-/*
- * Default implementation for drivers to pass bdrv_co_block_status() to
- * their backing file.
- */
-int coroutine_fn bdrv_co_block_status_from_backing(BlockDriverState *bs,
-                                                   bool want_zero,
-                                                   int64_t offset,
-                                                   int64_t bytes,
-                                                   int64_t *pnum,
-                                                   int64_t *map,
-                                                   BlockDriverState **file);
 const char *bdrv_get_parent_name(const BlockDriverState *bs);
 void blk_dev_change_media_cb(BlockBackend *blk, bool load, Error **errp);
 bool blk_dev_has_removable_media(BlockBackend *blk);
diff --git a/block/backup-top.c b/block/backup-top.c
index 430d1be068..fe6883cc97 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -175,8 +175,6 @@ BlockDriver bdrv_backup_top_filter = {
     .bdrv_co_pdiscard           = backup_top_co_pdiscard,
     .bdrv_co_flush              = backup_top_co_flush,
 
-    .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
-
     .bdrv_refresh_filename      = backup_top_refresh_filename,
 
     .bdrv_child_perm            = backup_top_child_perm,
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 9c08d8a005..eecbf3e5c4 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -752,8 +752,11 @@ static int coroutine_fn blkdebug_co_block_status(BlockDriverState *bs,
         return err;
     }
 
-    return bdrv_co_block_status_from_file(bs, want_zero, offset, bytes,
-                                          pnum, map, file);
+    assert(bs->file && bs->file->bs);
+    *pnum = bytes;
+    *map = offset;
+    *file = bs->file->bs;
+    return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
 }
 
 static void blkdebug_close(BlockDriverState *bs)
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 57315f56b4..13ae63983b 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -515,7 +515,6 @@ static BlockDriver bdrv_blk_log_writes = {
     .bdrv_co_pwrite_zeroes  = blk_log_writes_co_pwrite_zeroes,
     .bdrv_co_flush_to_disk  = blk_log_writes_co_flush_to_disk,
     .bdrv_co_pdiscard       = blk_log_writes_co_pdiscard,
-    .bdrv_co_block_status   = bdrv_co_block_status_from_file,
 
     .is_filter              = true,
     .strong_runtime_opts    = blk_log_writes_strong_runtime_opts,
diff --git a/block/commit.c b/block/commit.c
index 2b9929aed9..1e85c306cc 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -238,7 +238,6 @@ static void bdrv_commit_top_child_perm(BlockDriverState *bs, BdrvChild *c,
 static BlockDriver bdrv_commit_top = {
     .format_name                = "commit_top",
     .bdrv_co_preadv             = bdrv_commit_top_preadv,
-    .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_commit_top_refresh_filename,
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index a6a864f147..2816e61afe 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -146,8 +146,6 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_eject                         = cor_eject,
     .bdrv_lock_medium                   = cor_lock_medium,
 
-    .bdrv_co_block_status               = bdrv_co_block_status_from_file,
-
     .has_variable_length                = true,
     .is_filter                          = true,
 };
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 8ec1991c1f..5136371bf8 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -146,8 +146,6 @@ static BlockDriver bdrv_compress = {
     .bdrv_eject                         = compress_eject,
     .bdrv_lock_medium                   = compress_lock_medium,
 
-    .bdrv_co_block_status               = bdrv_co_block_status_from_file,
-
     .has_variable_length                = true,
     .is_filter                          = true,
 };
diff --git a/block/io.c b/block/io.c
index 916464f089..a2389bb38c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2255,36 +2255,6 @@ typedef struct BdrvCoBlockStatusData {
     BlockDriverState **file;
 } BdrvCoBlockStatusData;
 
-int coroutine_fn bdrv_co_block_status_from_file(BlockDriverState *bs,
-                                                bool want_zero,
-                                                int64_t offset,
-                                                int64_t bytes,
-                                                int64_t *pnum,
-                                                int64_t *map,
-                                                BlockDriverState **file)
-{
-    assert(bs->file && bs->file->bs);
-    *pnum = bytes;
-    *map = offset;
-    *file = bs->file->bs;
-    return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
-}
-
-int coroutine_fn bdrv_co_block_status_from_backing(BlockDriverState *bs,
-                                                   bool want_zero,
-                                                   int64_t offset,
-                                                   int64_t bytes,
-                                                   int64_t *pnum,
-                                                   int64_t *map,
-                                                   BlockDriverState **file)
-{
-    assert(bs->backing && bs->backing->bs);
-    *pnum = bytes;
-    *map = offset;
-    *file = bs->backing->bs;
-    return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
-}
-
 /*
  * Returns the allocation status of the specified sectors.
  * Drivers not implementing the functionality are assumed to not support
@@ -2325,6 +2295,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     BlockDriverState *local_file = NULL;
     int64_t aligned_offset, aligned_bytes;
     uint32_t align;
+    bool has_filtered_child;
 
     assert(pnum);
     *pnum = 0;
@@ -2350,7 +2321,8 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
 
     /* Must be non-NULL or bdrv_getlength() would have failed */
     assert(bs->drv);
-    if (!bs->drv->bdrv_co_block_status) {
+    has_filtered_child = bdrv_filter_child(bs);
+    if (!bs->drv->bdrv_co_block_status && !has_filtered_child) {
         *pnum = bytes;
         ret = BDRV_BLOCK_DATA | BDRV_BLOCK_ALLOCATED;
         if (offset + bytes == total_size) {
@@ -2371,9 +2343,20 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     aligned_offset = QEMU_ALIGN_DOWN(offset, align);
     aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
 
-    ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
-                                        aligned_bytes, pnum, &local_map,
-                                        &local_file);
+    if (bs->drv->bdrv_co_block_status) {
+        ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
+                                            aligned_bytes, pnum, &local_map,
+                                            &local_file);
+    } else {
+        /* Default code for filters */
+
+        local_file = bdrv_filter_bs(bs);
+        assert(local_file);
+
+        *pnum = aligned_bytes;
+        local_map = aligned_offset;
+        ret = BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
+    }
     if (ret < 0) {
         *pnum = 0;
         goto out;
diff --git a/block/mirror.c b/block/mirror.c
index f16b0d62bc..26acf4af6f 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1531,7 +1531,6 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_co_pwrite_zeroes      = bdrv_mirror_top_pwrite_zeroes,
     .bdrv_co_pdiscard           = bdrv_mirror_top_pdiscard,
     .bdrv_co_flush              = bdrv_mirror_top_flush,
-    .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_mirror_top_refresh_filename,
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
diff --git a/block/throttle.c b/block/throttle.c
index b21ee42d98..9a0f38149a 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -260,7 +260,6 @@ static BlockDriver bdrv_throttle = {
     .bdrv_reopen_prepare                =   throttle_reopen_prepare,
     .bdrv_reopen_commit                 =   throttle_reopen_commit,
     .bdrv_reopen_abort                  =   throttle_reopen_abort,
-    .bdrv_co_block_status               =   bdrv_co_block_status_from_file,
 
     .bdrv_co_drain_begin                =   throttle_co_drain_begin,
     .bdrv_co_drain_end                  =   throttle_co_drain_end,
-- 
2.25.4


