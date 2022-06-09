Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB454517C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:03:01 +0200 (CEST)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKce-0001P2-KY
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJsT-0004Oc-Jz
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJsM-0006ep-Cw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654787708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOOcsxkUdjw8nV1yLW8EydVksEhxm/cM2ulWbW6fH5s=;
 b=fOWXwWFvqxfEpTeMkz5znf/JJ1muqR86sO75cQ1G4jNHNXq2RuKroCiv9ssO4cBlGith7H
 dZJhyPEr7CzKcGgi/ZvyfYWB3JYxd2o4SQxdQOyzc7ypBxuS5OB2hnhkoJbhZJqVCDNokf
 zNpnhhSYTMDqecZmn6QG1h8zLqY1vgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-m9JPAjQtOWms-RJfnIWSvA-1; Thu, 09 Jun 2022 11:15:05 -0400
X-MC-Unique: m9JPAjQtOWms-RJfnIWSvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 177D8801756;
 Thu,  9 Jun 2022 15:15:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7612026D64;
 Thu,  9 Jun 2022 15:14:59 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ari Sundholm <ari@tuxera.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 02/10] block: Change bdrv_{pread, pwrite,
 pwrite_sync}() param order
Date: Thu,  9 Jun 2022 16:14:43 +0100
Message-Id: <20220609151451.3883195-3-afaria@redhat.com>
In-Reply-To: <20220609151451.3883195-1-afaria@redhat.com>
References: <20220609151451.3883195-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Swap 'buf' and 'bytes' around for consistency with
bdrv_co_{pread,pwrite}(), and in preparation to implement these
functions using generated_co_wrapper.

Callers were updated using this Coccinelle script:

    @@ expression child, offset, buf, bytes, flags; @@
    - bdrv_pread(child, offset, buf, bytes, flags)
    + bdrv_pread(child, offset, bytes, buf, flags)

    @@ expression child, offset, buf, bytes, flags; @@
    - bdrv_pwrite(child, offset, buf, bytes, flags)
    + bdrv_pwrite(child, offset, bytes, buf, flags)

    @@ expression child, offset, buf, bytes, flags; @@
    - bdrv_pwrite_sync(child, offset, buf, bytes, flags)
    + bdrv_pwrite_sync(child, offset, bytes, buf, flags)

Resulting overly-long lines were then fixed by hand.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blklogwrites.c             |  6 ++--
 block/bochs.c                    | 10 +++---
 block/cloop.c                    | 10 +++---
 block/crypto.c                   |  4 +--
 block/dmg.c                      | 26 +++++++--------
 block/io.c                       | 12 +++----
 block/parallels-ext.c            |  6 ++--
 block/parallels.c                | 10 +++---
 block/qcow.c                     | 34 +++++++++----------
 block/qcow2-bitmap.c             | 14 ++++----
 block/qcow2-cache.c              |  8 ++---
 block/qcow2-cluster.c            | 22 ++++++-------
 block/qcow2-refcount.c           | 56 +++++++++++++++++---------------
 block/qcow2-snapshot.c           | 48 +++++++++++++--------------
 block/qcow2.c                    | 47 ++++++++++++++-------------
 block/qed.c                      |  8 ++---
 block/vdi.c                      | 14 ++++----
 block/vhdx-log.c                 | 18 +++++-----
 block/vhdx.c                     | 28 ++++++++--------
 block/vmdk.c                     | 50 ++++++++++++++--------------
 block/vpc.c                      | 22 ++++++-------
 block/vvfat.c                    | 10 +++---
 include/block/block-io.h         | 10 +++---
 tests/unit/test-block-iothread.c |  8 ++---
 24 files changed, 242 insertions(+), 239 deletions(-)

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index c5c021e6f8..e3c6c4039c 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -107,8 +107,8 @@ static uint64_t blk_log_writes_find_cur_log_sector(BdrvChild *log,
     struct log_write_entry cur_entry;
 
     while (cur_idx < nr_entries) {
-        int read_ret = bdrv_pread(log, cur_sector << sector_bits, &cur_entry,
-                                  sizeof(cur_entry), 0);
+        int read_ret = bdrv_pread(log, cur_sector << sector_bits,
+                                  sizeof(cur_entry), &cur_entry, 0);
         if (read_ret < 0) {
             error_setg_errno(errp, -read_ret,
                              "Failed to read log entry %"PRIu64, cur_idx);
@@ -190,7 +190,7 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
             log_sb.nr_entries = cpu_to_le64(0);
             log_sb.sectorsize = cpu_to_le32(BDRV_SECTOR_SIZE);
         } else {
-            ret = bdrv_pread(s->log_file, 0, &log_sb, sizeof(log_sb), 0);
+            ret = bdrv_pread(s->log_file, 0, sizeof(log_sb), &log_sb, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "Could not read log superblock");
                 goto fail_log;
diff --git a/block/bochs.c b/block/bochs.c
index 46d0f6a693..b76f34fe03 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -116,7 +116,7 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    ret = bdrv_pread(bs->file, 0, &bochs, sizeof(bochs), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(bochs), &bochs, 0);
     if (ret < 0) {
         return ret;
     }
@@ -150,8 +150,8 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return -ENOMEM;
     }
 
-    ret = bdrv_pread(bs->file, le32_to_cpu(bochs.header), s->catalog_bitmap,
-                     s->catalog_size * 4, 0);
+    ret = bdrv_pread(bs->file, le32_to_cpu(bochs.header), s->catalog_size * 4,
+                     s->catalog_bitmap, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -224,8 +224,8 @@ static int64_t seek_to_sector(BlockDriverState *bs, int64_t sector_num)
         (s->extent_blocks + s->bitmap_blocks));
 
     /* read in bitmap for current extent */
-    ret = bdrv_pread(bs->file, bitmap_offset + (extent_offset / 8),
-                     &bitmap_entry, 1, 0);
+    ret = bdrv_pread(bs->file, bitmap_offset + (extent_offset / 8), 1,
+                     &bitmap_entry, 0);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/cloop.c b/block/cloop.c
index 208a58ebb1..9a2334495e 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -78,7 +78,7 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* read header */
-    ret = bdrv_pread(bs->file, 128, &s->block_size, 4, 0);
+    ret = bdrv_pread(bs->file, 128, 4, &s->block_size, 0);
     if (ret < 0) {
         return ret;
     }
@@ -104,7 +104,7 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    ret = bdrv_pread(bs->file, 128 + 4, &s->n_blocks, 4, 0);
+    ret = bdrv_pread(bs->file, 128 + 4, 4, &s->n_blocks, 0);
     if (ret < 0) {
         return ret;
     }
@@ -135,7 +135,7 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return -ENOMEM;
     }
 
-    ret = bdrv_pread(bs->file, 128 + 4 + 4, s->offsets, offsets_size, 0);
+    ret = bdrv_pread(bs->file, 128 + 4 + 4, offsets_size, s->offsets, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -220,8 +220,8 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
         int ret;
         uint32_t bytes = s->offsets[block_num + 1] - s->offsets[block_num];
 
-        ret = bdrv_pread(bs->file, s->offsets[block_num], s->compressed_block,
-                         bytes, 0);
+        ret = bdrv_pread(bs->file, s->offsets[block_num], bytes,
+                         s->compressed_block, 0);
         if (ret != bytes) {
             return -1;
         }
diff --git a/block/crypto.c b/block/crypto.c
index d0c22e9549..deec7fae2f 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -65,7 +65,7 @@ static ssize_t block_crypto_read_func(QCryptoBlock *block,
     BlockDriverState *bs = opaque;
     ssize_t ret;
 
-    ret = bdrv_pread(bs->file, offset, buf, buflen, 0);
+    ret = bdrv_pread(bs->file, offset, buflen, buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return ret;
@@ -83,7 +83,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock *block,
     BlockDriverState *bs = opaque;
     ssize_t ret;
 
-    ret = bdrv_pwrite(bs->file, offset, buf, buflen, 0);
+    ret = bdrv_pwrite(bs->file, offset, buflen, buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
diff --git a/block/dmg.c b/block/dmg.c
index ddd1d23005..5a460c3eb1 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -77,7 +77,7 @@ static int read_uint64(BlockDriverState *bs, int64_t offset, uint64_t *result)
     uint64_t buffer;
     int ret;
 
-    ret = bdrv_pread(bs->file, offset, &buffer, 8, 0);
+    ret = bdrv_pread(bs->file, offset, 8, &buffer, 0);
     if (ret < 0) {
         return ret;
     }
@@ -91,7 +91,7 @@ static int read_uint32(BlockDriverState *bs, int64_t offset, uint32_t *result)
     uint32_t buffer;
     int ret;
 
-    ret = bdrv_pread(bs->file, offset, &buffer, 4, 0);
+    ret = bdrv_pread(bs->file, offset, 4, &buffer, 0);
     if (ret < 0) {
         return ret;
     }
@@ -172,7 +172,7 @@ static int64_t dmg_find_koly_offset(BdrvChild *file, Error **errp)
         offset = length - 511 - 512;
     }
     length = length < 515 ? length : 515;
-    ret = bdrv_pread(file, offset, buffer, length, 0);
+    ret = bdrv_pread(file, offset, length, buffer, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed while reading UDIF trailer");
         return ret;
@@ -352,7 +352,7 @@ static int dmg_read_resource_fork(BlockDriverState *bs, DmgHeaderState *ds,
         offset += 4;
 
         buffer = g_realloc(buffer, count);
-        ret = bdrv_pread(bs->file, offset, buffer, count, 0);
+        ret = bdrv_pread(bs->file, offset, count, buffer, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -389,7 +389,7 @@ static int dmg_read_plist_xml(BlockDriverState *bs, DmgHeaderState *ds,
 
     buffer = g_malloc(info_length + 1);
     buffer[info_length] = '\0';
-    ret = bdrv_pread(bs->file, info_begin, buffer, info_length, 0);
+    ret = bdrv_pread(bs->file, info_begin, info_length, buffer, 0);
     if (ret != info_length) {
         ret = -EINVAL;
         goto fail;
@@ -609,8 +609,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
         case UDZO: { /* zlib compressed */
             /* we need to buffer, because only the chunk as whole can be
              * inflated. */
-            ret = bdrv_pread(bs->file, s->offsets[chunk], s->compressed_chunk,
-                             s->lengths[chunk], 0);
+            ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
+                             s->compressed_chunk, 0);
             if (ret != s->lengths[chunk]) {
                 return -1;
             }
@@ -635,8 +635,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
             }
             /* we need to buffer, because only the chunk as whole can be
              * inflated. */
-            ret = bdrv_pread(bs->file, s->offsets[chunk], s->compressed_chunk,
-                             s->lengths[chunk], 0);
+            ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
+                             s->compressed_chunk, 0);
             if (ret != s->lengths[chunk]) {
                 return -1;
             }
@@ -656,8 +656,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
             }
             /* we need to buffer, because only the chunk as whole can be
              * inflated. */
-            ret = bdrv_pread(bs->file, s->offsets[chunk], s->compressed_chunk,
-                             s->lengths[chunk], 0);
+            ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
+                             s->compressed_chunk, 0);
             if (ret != s->lengths[chunk]) {
                 return -1;
             }
@@ -672,8 +672,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
             }
             break;
         case UDRW: /* copy */
-            ret = bdrv_pread(bs->file, s->offsets[chunk],
-                             s->uncompressed_chunk, s->lengths[chunk], 0);
+            ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
+                             s->uncompressed_chunk, 0);
             if (ret != s->lengths[chunk]) {
                 return -1;
             }
diff --git a/block/io.c b/block/io.c
index 008e5c90bf..2ed963d9e0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1112,7 +1112,7 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
 }
 
 /* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes,
+int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
                BdrvRequestFlags flags)
 {
     int ret;
@@ -1134,8 +1134,8 @@ int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes,
   -EINVAL      Invalid offset or number of bytes
   -EACCES      Trying to write a read-only device
 */
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
-                int64_t bytes, BdrvRequestFlags flags)
+int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
+                const void *buf, BdrvRequestFlags flags)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1156,13 +1156,13 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
  *
  * Returns 0 on success, -errno in error cases.
  */
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int64_t count, BdrvRequestFlags flags)
+int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
+                     const void *buf, BdrvRequestFlags flags)
 {
     int ret;
     IO_CODE();
 
-    ret = bdrv_pwrite(child, offset, buf, count, flags);
+    ret = bdrv_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
index f737104d12..c9dbbf5089 100644
--- a/block/parallels-ext.c
+++ b/block/parallels-ext.c
@@ -93,8 +93,8 @@ static int parallels_load_bitmap_data(BlockDriverState *bs,
         if (entry == 1) {
             bdrv_dirty_bitmap_deserialize_ones(bitmap, offset, count, false);
         } else {
-            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS, buf,
-                             s->cluster_size, 0);
+            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS,
+                             s->cluster_size, buf, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "Failed to read bitmap data cluster");
@@ -286,7 +286,7 @@ int parallels_read_format_extension(BlockDriverState *bs,
 
     assert(ext_off > 0);
 
-    ret = bdrv_pread(bs->file, ext_off, ext_cluster, s->cluster_size, 0);
+    ret = bdrv_pread(bs->file, ext_off, s->cluster_size, ext_cluster, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to read Format Extension cluster");
         goto out;
diff --git a/block/parallels.c b/block/parallels.c
index 6ab82764b2..f22444efff 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -277,7 +277,7 @@ static coroutine_fn int parallels_co_flush_to_os(BlockDriverState *bs)
         if (off + to_write > s->header_size) {
             to_write = s->header_size - off;
         }
-        ret = bdrv_pwrite(bs->file, off, (uint8_t *)s->header + off, to_write,
+        ret = bdrv_pwrite(bs->file, off, to_write, (uint8_t *)s->header + off,
                           0);
         if (ret < 0) {
             qemu_co_mutex_unlock(&s->lock);
@@ -481,7 +481,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     ret = 0;
     if (flush_bat) {
-        ret = bdrv_pwrite_sync(bs->file, 0, s->header, s->header_size, 0);
+        ret = bdrv_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
         if (ret < 0) {
             res->check_errors++;
             goto out;
@@ -723,7 +723,7 @@ static int parallels_update_header(BlockDriverState *bs)
     if (size > s->header_size) {
         size = s->header_size;
     }
-    return bdrv_pwrite_sync(bs->file, 0, s->header, size, 0);
+    return bdrv_pwrite_sync(bs->file, 0, size, s->header, 0);
 }
 
 static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
@@ -742,7 +742,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -798,7 +798,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         s->header_size = size;
     }
 
-    ret = bdrv_pread(bs->file, 0, s->header, s->header_size, 0);
+    ret = bdrv_pread(bs->file, 0, s->header_size, s->header, 0);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow.c b/block/qcow.c
index 20fb94c18b..c94524b814 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -128,7 +128,7 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, 0, &header, sizeof(header), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -260,8 +260,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, s->l1_table_offset, s->l1_table,
-                     s->l1_size * sizeof(uint64_t), 0);
+    ret = bdrv_pread(bs->file, s->l1_table_offset,
+                     s->l1_size * sizeof(uint64_t), s->l1_table, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -291,8 +291,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
             ret = -EINVAL;
             goto fail;
         }
-        ret = bdrv_pread(bs->file, header.backing_file_offset,
-                         bs->auto_backing_file, len, 0);
+        ret = bdrv_pread(bs->file, header.backing_file_offset, len,
+                         bs->auto_backing_file, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -383,7 +383,7 @@ static int get_cluster_offset(BlockDriverState *bs,
         BLKDBG_EVENT(bs->file, BLKDBG_L1_UPDATE);
         ret = bdrv_pwrite_sync(bs->file,
                                s->l1_table_offset + l1_index * sizeof(tmp),
-                               &tmp, sizeof(tmp), 0);
+                               sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -414,14 +414,14 @@ static int get_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_L2_LOAD);
     if (new_l2_table) {
         memset(l2_table, 0, s->l2_size * sizeof(uint64_t));
-        ret = bdrv_pwrite_sync(bs->file, l2_offset, l2_table,
-                               s->l2_size * sizeof(uint64_t), 0);
+        ret = bdrv_pwrite_sync(bs->file, l2_offset,
+                               s->l2_size * sizeof(uint64_t), l2_table, 0);
         if (ret < 0) {
             return ret;
         }
     } else {
-        ret = bdrv_pread(bs->file, l2_offset, l2_table,
-                         s->l2_size * sizeof(uint64_t), 0);
+        ret = bdrv_pread(bs->file, l2_offset, s->l2_size * sizeof(uint64_t),
+                         l2_table, 0);
         if (ret < 0) {
             return ret;
         }
@@ -453,8 +453,8 @@ static int get_cluster_offset(BlockDriverState *bs,
             cluster_offset = QEMU_ALIGN_UP(cluster_offset, s->cluster_size);
             /* write the cluster content */
             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-            ret = bdrv_pwrite(bs->file, cluster_offset, s->cluster_cache,
-                              s->cluster_size, 0);
+            ret = bdrv_pwrite(bs->file, cluster_offset, s->cluster_size,
+                              s->cluster_cache, 0);
             if (ret < 0) {
                 return ret;
             }
@@ -493,8 +493,8 @@ static int get_cluster_offset(BlockDriverState *bs,
                             }
                             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
                             ret = bdrv_pwrite(bs->file, cluster_offset + i,
-                                              s->cluster_data,
-                                              BDRV_SECTOR_SIZE, 0);
+                                              BDRV_SECTOR_SIZE,
+                                              s->cluster_data, 0);
                             if (ret < 0) {
                                 return ret;
                             }
@@ -515,7 +515,7 @@ static int get_cluster_offset(BlockDriverState *bs,
             BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE);
         }
         ret = bdrv_pwrite_sync(bs->file, l2_offset + l2_index * sizeof(tmp),
-                               &tmp, sizeof(tmp), 0);
+                               sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -596,7 +596,7 @@ static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
         csize = cluster_offset >> (63 - s->cluster_bits);
         csize &= (s->cluster_size - 1);
         BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
-        ret = bdrv_pread(bs->file, coffset, s->cluster_data, csize, 0);
+        ret = bdrv_pread(bs->file, coffset, csize, s->cluster_data, 0);
         if (ret != csize)
             return -1;
         if (decompress_buffer(s->cluster_cache, s->cluster_size,
@@ -1029,7 +1029,7 @@ static int qcow_make_empty(BlockDriverState *bs)
     int ret;
 
     memset(s->l1_table, 0, l1_length);
-    if (bdrv_pwrite_sync(bs->file, s->l1_table_offset, s->l1_table, l1_length,
+    if (bdrv_pwrite_sync(bs->file, s->l1_table_offset, l1_length, s->l1_table,
                          0) < 0)
         return -1;
     ret = bdrv_truncate(bs->file, s->l1_table_offset + l1_length, false,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 6aa4739820..e98bafe0f4 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -234,8 +234,8 @@ static int bitmap_table_load(BlockDriverState *bs, Qcow2BitmapTable *tb,
     }
 
     assert(tb->size <= BME_MAX_TABLE_SIZE);
-    ret = bdrv_pread(bs->file, tb->offset, table,
-                     tb->size * BME_TABLE_ENTRY_SIZE, 0);
+    ret = bdrv_pread(bs->file, tb->offset, tb->size * BME_TABLE_ENTRY_SIZE,
+                     table, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -317,7 +317,7 @@ static int load_bitmap_data(BlockDriverState *bs,
                  * already cleared */
             }
         } else {
-            ret = bdrv_pread(bs->file, data_offset, buf, s->cluster_size, 0);
+            ret = bdrv_pread(bs->file, data_offset, s->cluster_size, buf, 0);
             if (ret < 0) {
                 goto finish;
             }
@@ -575,7 +575,7 @@ static Qcow2BitmapList *bitmap_list_load(BlockDriverState *bs, uint64_t offset,
     }
     dir_end = dir + size;
 
-    ret = bdrv_pread(bs->file, offset, dir, size, 0);
+    ret = bdrv_pread(bs->file, offset, size, dir, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to read bitmap directory");
         goto fail;
@@ -798,7 +798,7 @@ static int bitmap_list_store(BlockDriverState *bs, Qcow2BitmapList *bm_list,
         goto fail;
     }
 
-    ret = bdrv_pwrite(bs->file, dir_offset, dir, dir_size, 0);
+    ret = bdrv_pwrite(bs->file, dir_offset, dir_size, dir, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -1339,7 +1339,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
             goto fail;
         }
 
-        ret = bdrv_pwrite(bs->file, off, buf, s->cluster_size, 0);
+        ret = bdrv_pwrite(bs->file, off, s->cluster_size, buf, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
                              bm_name);
@@ -1402,7 +1402,7 @@ static int store_bitmap(BlockDriverState *bs, Qcow2Bitmap *bm, Error **errp)
     }
 
     bitmap_table_to_be(tb, tb_size);
-    ret = bdrv_pwrite(bs->file, tb_offset, tb, tb_size * sizeof(tb[0]), 0);
+    ret = bdrv_pwrite(bs->file, tb_offset, tb_size * sizeof(tb[0]), tb, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
                          bm_name);
diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c
index e562e00c5c..54b2d5f4de 100644
--- a/block/qcow2-cache.c
+++ b/block/qcow2-cache.c
@@ -223,8 +223,8 @@ static int qcow2_cache_entry_flush(BlockDriverState *bs, Qcow2Cache *c, int i)
         BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE);
     }
 
-    ret = bdrv_pwrite(bs->file, c->entries[i].offset,
-                      qcow2_cache_get_table_addr(c, i), c->table_size, 0);
+    ret = bdrv_pwrite(bs->file, c->entries[i].offset, c->table_size,
+                      qcow2_cache_get_table_addr(c, i), 0);
     if (ret < 0) {
         return ret;
     }
@@ -379,8 +379,8 @@ static int qcow2_cache_do_get(BlockDriverState *bs, Qcow2Cache *c,
             BLKDBG_EVENT(bs->file, BLKDBG_L2_LOAD);
         }
 
-        ret = bdrv_pread(bs->file, offset, qcow2_cache_get_table_addr(c, i),
-                         c->table_size, 0);
+        ret = bdrv_pread(bs->file, offset, c->table_size,
+                         qcow2_cache_get_table_addr(c, i), 0);
         if (ret < 0) {
             return ret;
         }
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index ad7107a795..fd32316d6f 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -159,8 +159,8 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
     BLKDBG_EVENT(bs->file, BLKDBG_L1_GROW_WRITE_TABLE);
     for(i = 0; i < s->l1_size; i++)
         new_l1_table[i] = cpu_to_be64(new_l1_table[i]);
-    ret = bdrv_pwrite_sync(bs->file, new_l1_table_offset, new_l1_table,
-                           new_l1_size2, 0);
+    ret = bdrv_pwrite_sync(bs->file, new_l1_table_offset, new_l1_size2,
+                           new_l1_table, 0);
     if (ret < 0)
         goto fail;
     for(i = 0; i < s->l1_size; i++)
@@ -170,8 +170,8 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
     BLKDBG_EVENT(bs->file, BLKDBG_L1_GROW_ACTIVATE_TABLE);
     stl_be_p(data, new_l1_size);
     stq_be_p(data + 4, new_l1_table_offset);
-    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, l1_size), data,
-                           sizeof(data), 0);
+    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, l1_size),
+                           sizeof(data), data, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -249,7 +249,7 @@ int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index)
     BLKDBG_EVENT(bs->file, BLKDBG_L1_UPDATE);
     ret = bdrv_pwrite_sync(bs->file,
                            s->l1_table_offset + L1E_SIZE * l1_start_index,
-                           buf, bufsize, 0);
+                           bufsize, buf, 0);
     if (ret < 0) {
         return ret;
     }
@@ -2260,8 +2260,8 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                                       (void **)&l2_slice);
             } else {
                 /* load inactive L2 tables from disk */
-                ret = bdrv_pread(bs->file, slice_offset, l2_slice,
-                                 slice_size2, 0);
+                ret = bdrv_pread(bs->file, slice_offset, slice_size2,
+                                 l2_slice, 0);
             }
             if (ret < 0) {
                 goto fail;
@@ -2377,8 +2377,8 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         goto fail;
                     }
 
-                    ret = bdrv_pwrite(bs->file, slice_offset, l2_slice,
-                                      slice_size2, 0);
+                    ret = bdrv_pwrite(bs->file, slice_offset, slice_size2,
+                                      l2_slice, 0);
                     if (ret < 0) {
                         goto fail;
                     }
@@ -2471,8 +2471,8 @@ int qcow2_expand_zero_clusters(BlockDriverState *bs,
 
         l1_table = new_l1_table;
 
-        ret = bdrv_pread(bs->file, s->snapshots[i].l1_table_offset, l1_table,
-                         l1_size2, 0);
+        ret = bdrv_pread(bs->file, s->snapshots[i].l1_table_offset, l1_size2,
+                         l1_table, 0);
         if (ret < 0) {
             goto fail;
         }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 5aa2b61b6c..c4d99817b6 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -119,7 +119,7 @@ int qcow2_refcount_init(BlockDriverState *bs)
         }
         BLKDBG_EVENT(bs->file, BLKDBG_REFTABLE_LOAD);
         ret = bdrv_pread(bs->file, s->refcount_table_offset,
-                         s->refcount_table, refcount_table_size2, 0);
+                         refcount_table_size2, s->refcount_table, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -439,7 +439,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
         BLKDBG_EVENT(bs->file, BLKDBG_REFBLOCK_ALLOC_HOOKUP);
         ret = bdrv_pwrite_sync(bs->file, s->refcount_table_offset +
                                refcount_table_index * REFTABLE_ENTRY_SIZE,
-            &data64, sizeof(data64), 0);
+            sizeof(data64), &data64, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -684,8 +684,8 @@ int64_t qcow2_refcount_area(BlockDriverState *bs, uint64_t start_offset,
     }
 
     BLKDBG_EVENT(bs->file, BLKDBG_REFBLOCK_ALLOC_WRITE_TABLE);
-    ret = bdrv_pwrite_sync(bs->file, table_offset, new_table,
-                           table_size * REFTABLE_ENTRY_SIZE, 0);
+    ret = bdrv_pwrite_sync(bs->file, table_offset,
+                           table_size * REFTABLE_ENTRY_SIZE, new_table, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -703,8 +703,8 @@ int64_t qcow2_refcount_area(BlockDriverState *bs, uint64_t start_offset,
     data.d32 = cpu_to_be32(table_clusters);
     BLKDBG_EVENT(bs->file, BLKDBG_REFBLOCK_ALLOC_SWITCH_TABLE);
     ret = bdrv_pwrite_sync(bs->file,
-                           offsetof(QCowHeader, refcount_table_offset), &data,
-                           sizeof(data), 0);
+                           offsetof(QCowHeader, refcount_table_offset),
+                           sizeof(data), &data, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -1274,7 +1274,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
         }
         l1_allocated = true;
 
-        ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2, 0);
+        ret = bdrv_pread(bs->file, l1_table_offset, l1_size2, l1_table, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -1435,7 +1435,7 @@ fail:
             cpu_to_be64s(&l1_table[i]);
         }
 
-        ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2,
+        ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_size2, l1_table,
                                0);
 
         for (i = 0; i < l1_size; i++) {
@@ -1633,8 +1633,8 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
         goto fail;
     }
 
-    ret = bdrv_pwrite_sync(bs->file, l2e_offset, &l2_table[idx],
-                           l2_entry_size(s), 0);
+    ret = bdrv_pwrite_sync(bs->file, l2e_offset, l2_entry_size(s),
+                           &l2_table[idx], 0);
     if (ret < 0) {
         fprintf(stderr, "ERROR: Failed to overwrite L2 "
                 "table entry: %s\n", strerror(-ret));
@@ -1672,7 +1672,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     bool metadata_overlap;
 
     /* Read L2 table from disk */
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes, 0);
+    ret = bdrv_pread(bs->file, l2_offset, l2_size_bytes, l2_table, 0);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
@@ -1888,7 +1888,7 @@ static int check_refcounts_l1(BlockDriverState *bs,
     }
 
     /* Read L1 table entries from disk */
-    ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size_bytes, 0);
+    ret = bdrv_pread(bs->file, l1_table_offset, l1_size_bytes, l1_table, 0);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
         res->check_errors++;
@@ -2004,8 +2004,8 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
             }
         }
 
-        ret = bdrv_pread(bs->file, l2_offset, l2_table,
-                         s->l2_size * l2_entry_size(s), 0);
+        ret = bdrv_pread(bs->file, l2_offset, s->l2_size * l2_entry_size(s),
+                         l2_table, 0);
         if (ret < 0) {
             fprintf(stderr, "ERROR: Could not read L2 table: %s\n",
                     strerror(-ret));
@@ -2058,7 +2058,7 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
                 goto fail;
             }
 
-            ret = bdrv_pwrite(bs->file, l2_offset, l2_table, s->cluster_size,
+            ret = bdrv_pwrite(bs->file, l2_offset, s->cluster_size, l2_table,
                               0);
             if (ret < 0) {
                 fprintf(stderr, "ERROR: Could not write L2 table: %s\n",
@@ -2577,8 +2577,8 @@ static int rebuild_refcounts_write_refblocks(
         on_disk_refblock = (void *)((char *) *refcount_table +
                                     refblock_index * s->cluster_size);
 
-        ret = bdrv_pwrite(bs->file, refblock_offset, on_disk_refblock,
-                          s->cluster_size, 0);
+        ret = bdrv_pwrite(bs->file, refblock_offset, s->cluster_size,
+                          on_disk_refblock, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "ERROR writing refblock");
             return ret;
@@ -2733,8 +2733,8 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
     }
 
     assert(reftable_length < INT_MAX);
-    ret = bdrv_pwrite(bs->file, reftable_offset, on_disk_reftable,
-                      reftable_length, 0);
+    ret = bdrv_pwrite(bs->file, reftable_offset, reftable_length,
+                      on_disk_reftable, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "ERROR writing reftable");
         goto fail;
@@ -2746,8 +2746,8 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
         cpu_to_be32(reftable_clusters);
     ret = bdrv_pwrite_sync(bs->file,
                            offsetof(QCowHeader, refcount_table_offset),
-                           &reftable_offset_and_clusters,
-                           sizeof(reftable_offset_and_clusters), 0);
+                           sizeof(reftable_offset_and_clusters),
+                           &reftable_offset_and_clusters, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "ERROR setting reftable");
         goto fail;
@@ -3009,7 +3009,7 @@ int qcow2_check_metadata_overlap(BlockDriverState *bs, int ign, int64_t offset,
                 return -ENOMEM;
             }
 
-            ret = bdrv_pread(bs->file, l1_ofs, l1, l1_sz2, 0);
+            ret = bdrv_pread(bs->file, l1_ofs, l1_sz2, l1, 0);
             if (ret < 0) {
                 g_free(l1);
                 return ret;
@@ -3180,7 +3180,7 @@ static int flush_refblock(BlockDriverState *bs, uint64_t **reftable,
             return ret;
         }
 
-        ret = bdrv_pwrite(bs->file, offset, refblock, s->cluster_size, 0);
+        ret = bdrv_pwrite(bs->file, offset, s->cluster_size, refblock, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write refblock");
             return ret;
@@ -3452,8 +3452,9 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
         cpu_to_be64s(&new_reftable[i]);
     }
 
-    ret = bdrv_pwrite(bs->file, new_reftable_offset, new_reftable,
-                      new_reftable_size * REFTABLE_ENTRY_SIZE, 0);
+    ret = bdrv_pwrite(bs->file, new_reftable_offset,
+                      new_reftable_size * REFTABLE_ENTRY_SIZE, new_reftable,
+                      0);
 
     for (i = 0; i < new_reftable_size; i++) {
         be64_to_cpus(&new_reftable[i]);
@@ -3656,8 +3657,9 @@ int qcow2_shrink_reftable(BlockDriverState *bs)
         reftable_tmp[i] = unused_block ? 0 : cpu_to_be64(s->refcount_table[i]);
     }
 
-    ret = bdrv_pwrite_sync(bs->file, s->refcount_table_offset, reftable_tmp,
-                           s->refcount_table_size * REFTABLE_ENTRY_SIZE, 0);
+    ret = bdrv_pwrite_sync(bs->file, s->refcount_table_offset,
+                           s->refcount_table_size * REFTABLE_ENTRY_SIZE,
+                           reftable_tmp, 0);
     /*
      * If the write in the reftable failed the image may contain a partially
      * overwritten reftable. In this case it would be better to clear the
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index dc62b0197c..60e0461632 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -108,7 +108,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read statically sized part of the snapshot header */
         offset = ROUND_UP(offset, 8);
-        ret = bdrv_pread(bs->file, offset, &h, sizeof(h), 0);
+        ret = bdrv_pread(bs->file, offset, sizeof(h), &h, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -146,8 +146,8 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
         }
 
         /* Read known extra data */
-        ret = bdrv_pread(bs->file, offset, &extra,
-                         MIN(sizeof(extra), sn->extra_data_size), 0);
+        ret = bdrv_pread(bs->file, offset,
+                         MIN(sizeof(extra), sn->extra_data_size), &extra, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -184,8 +184,8 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
             /* Store unknown extra data */
             unknown_extra_data_size = sn->extra_data_size - sizeof(extra);
             sn->unknown_extra_data = g_malloc(unknown_extra_data_size);
-            ret = bdrv_pread(bs->file, offset, sn->unknown_extra_data,
-                             unknown_extra_data_size, 0);
+            ret = bdrv_pread(bs->file, offset, unknown_extra_data_size,
+                             sn->unknown_extra_data, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "Failed to read snapshot table");
@@ -196,7 +196,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read snapshot ID */
         sn->id_str = g_malloc(id_str_size + 1);
-        ret = bdrv_pread(bs->file, offset, sn->id_str, id_str_size, 0);
+        ret = bdrv_pread(bs->file, offset, id_str_size, sn->id_str, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -206,7 +206,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read snapshot name */
         sn->name = g_malloc(name_size + 1);
-        ret = bdrv_pread(bs->file, offset, sn->name, name_size, 0);
+        ret = bdrv_pread(bs->file, offset, name_size, sn->name, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -349,13 +349,13 @@ int qcow2_write_snapshots(BlockDriverState *bs)
         h.name_size = cpu_to_be16(name_size);
         offset = ROUND_UP(offset, 8);
 
-        ret = bdrv_pwrite(bs->file, offset, &h, sizeof(h), 0);
+        ret = bdrv_pwrite(bs->file, offset, sizeof(h), &h, 0);
         if (ret < 0) {
             goto fail;
         }
         offset += sizeof(h);
 
-        ret = bdrv_pwrite(bs->file, offset, &extra, sizeof(extra), 0);
+        ret = bdrv_pwrite(bs->file, offset, sizeof(extra), &extra, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -369,21 +369,21 @@ int qcow2_write_snapshots(BlockDriverState *bs)
             assert(unknown_extra_data_size <= BDRV_REQUEST_MAX_BYTES);
             assert(sn->unknown_extra_data);
 
-            ret = bdrv_pwrite(bs->file, offset, sn->unknown_extra_data,
-                              unknown_extra_data_size, 0);
+            ret = bdrv_pwrite(bs->file, offset, unknown_extra_data_size,
+                              sn->unknown_extra_data, 0);
             if (ret < 0) {
                 goto fail;
             }
             offset += unknown_extra_data_size;
         }
 
-        ret = bdrv_pwrite(bs->file, offset, sn->id_str, id_str_size, 0);
+        ret = bdrv_pwrite(bs->file, offset, id_str_size, sn->id_str, 0);
         if (ret < 0) {
             goto fail;
         }
         offset += id_str_size;
 
-        ret = bdrv_pwrite(bs->file, offset, sn->name, name_size, 0);
+        ret = bdrv_pwrite(bs->file, offset, name_size, sn->name, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -406,7 +406,7 @@ int qcow2_write_snapshots(BlockDriverState *bs)
     header_data.snapshots_offset    = cpu_to_be64(snapshots_offset);
 
     ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
-                           &header_data, sizeof(header_data), 0);
+                           sizeof(header_data), &header_data, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -442,7 +442,7 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
 
     /* qcow2_do_open() discards this information in check mode */
     ret = bdrv_pread(bs->file, offsetof(QCowHeader, nb_snapshots),
-                     &snapshot_table_pointer, sizeof(snapshot_table_pointer),
+                     sizeof(snapshot_table_pointer), &snapshot_table_pointer,
                      0);
     if (ret < 0) {
         result->check_errors++;
@@ -513,8 +513,8 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
 
         snapshot_table_pointer.nb_snapshots = cpu_to_be32(s->nb_snapshots);
         ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
-                               &snapshot_table_pointer.nb_snapshots,
-                               sizeof(snapshot_table_pointer.nb_snapshots), 0);
+                               sizeof(snapshot_table_pointer.nb_snapshots),
+                               &snapshot_table_pointer.nb_snapshots, 0);
         if (ret < 0) {
             result->check_errors++;
             fprintf(stderr, "ERROR failed to update the snapshot count in the "
@@ -694,8 +694,8 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
         goto fail;
     }
 
-    ret = bdrv_pwrite(bs->file, sn->l1_table_offset, l1_table,
-                      s->l1_size * L1E_SIZE, 0);
+    ret = bdrv_pwrite(bs->file, sn->l1_table_offset, s->l1_size * L1E_SIZE,
+                      l1_table, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -830,7 +830,7 @@ int qcow2_snapshot_goto(BlockDriverState *bs, const char *snapshot_id)
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, sn->l1_table_offset, sn_l1_table, sn_l1_bytes,
+    ret = bdrv_pread(bs->file, sn->l1_table_offset, sn_l1_bytes, sn_l1_table,
                      0);
     if (ret < 0) {
         goto fail;
@@ -849,8 +849,8 @@ int qcow2_snapshot_goto(BlockDriverState *bs, const char *snapshot_id)
         goto fail;
     }
 
-    ret = bdrv_pwrite_sync(bs->file, s->l1_table_offset, sn_l1_table,
-                           cur_l1_bytes, 0);
+    ret = bdrv_pwrite_sync(bs->file, s->l1_table_offset, cur_l1_bytes,
+                           sn_l1_table, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -1052,8 +1052,8 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
         return -ENOMEM;
     }
 
-    ret = bdrv_pread(bs->file, sn->l1_table_offset, new_l1_table,
-                     new_l1_bytes, 0);
+    ret = bdrv_pread(bs->file, sn->l1_table_offset, new_l1_bytes,
+                     new_l1_table, 0);
     if (ret < 0) {
         error_setg(errp, "Failed to read l1 table for snapshot");
         qemu_vfree(new_l1_table);
diff --git a/block/qcow2.c b/block/qcow2.c
index 99192d1242..5493e6b847 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -107,7 +107,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
         return -1;
     }
 
-    ret = bdrv_pread(bs->file, s->crypto_header.offset + offset, buf, buflen,
+    ret = bdrv_pread(bs->file, s->crypto_header.offset + offset, buflen, buf,
                      0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read encryption header");
@@ -168,7 +168,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
         return -1;
     }
 
-    ret = bdrv_pwrite(bs->file, s->crypto_header.offset + offset, buf, buflen,
+    ret = bdrv_pwrite(bs->file, s->crypto_header.offset + offset, buflen, buf,
                       0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read encryption header");
@@ -227,7 +227,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         printf("attempting to read extended header in offset %lu\n", offset);
 #endif
 
-        ret = bdrv_pread(bs->file, offset, &ext, sizeof(ext), 0);
+        ret = bdrv_pread(bs->file, offset, sizeof(ext), &ext, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "qcow2_read_extension: ERROR: "
                              "pread fail from offset %" PRIu64, offset);
@@ -255,7 +255,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                            sizeof(bs->backing_format));
                 return 2;
             }
-            ret = bdrv_pread(bs->file, offset, bs->backing_format, ext.len, 0);
+            ret = bdrv_pread(bs->file, offset, ext.len, bs->backing_format, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "ERROR: ext_backing_format: "
                                  "Could not read format name");
@@ -271,7 +271,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         case QCOW2_EXT_MAGIC_FEATURE_TABLE:
             if (p_feature_table != NULL) {
                 void *feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
-                ret = bdrv_pread(bs->file, offset, feature_table, ext.len, 0);
+                ret = bdrv_pread(bs->file, offset, ext.len, feature_table, 0);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: ext_feature_table: "
                                      "Could not read table");
@@ -296,7 +296,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 return -EINVAL;
             }
 
-            ret = bdrv_pread(bs->file, offset, &s->crypto_header, ext.len, 0);
+            ret = bdrv_pread(bs->file, offset, ext.len, &s->crypto_header, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "Unable to read CRYPTO header extension");
@@ -352,7 +352,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 break;
             }
 
-            ret = bdrv_pread(bs->file, offset, &bitmaps_ext, ext.len, 0);
+            ret = bdrv_pread(bs->file, offset, ext.len, &bitmaps_ext, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "bitmaps_ext: "
                                  "Could not read ext header");
@@ -416,7 +416,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         case QCOW2_EXT_MAGIC_DATA_FILE:
         {
             s->image_data_file = g_malloc0(ext.len + 1);
-            ret = bdrv_pread(bs->file, offset, s->image_data_file, ext.len, 0);
+            ret = bdrv_pread(bs->file, offset, ext.len, s->image_data_file, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "ERROR: Could not read data file name");
@@ -440,7 +440,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 uext->len = ext.len;
                 QLIST_INSERT_HEAD(&s->unknown_header_ext, uext, next);
 
-                ret = bdrv_pread(bs->file, offset, uext->data, uext->len, 0);
+                ret = bdrv_pread(bs->file, offset, uext->len, uext->data, 0);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: unknown extension: "
                                      "Could not read data");
@@ -517,7 +517,7 @@ int qcow2_mark_dirty(BlockDriverState *bs)
 
     val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
     ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
-                      &val, sizeof(val), 0);
+                      sizeof(val), &val, 0);
     if (ret < 0) {
         return ret;
     }
@@ -1308,7 +1308,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     uint64_t l1_vm_state_index;
     bool update_header = false;
 
-    ret = bdrv_pread(bs->file, 0, &header, sizeof(header), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read qcow2 header");
         goto fail;
@@ -1384,8 +1384,9 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     if (header.header_length > sizeof(header)) {
         s->unknown_header_fields_size = header.header_length - sizeof(header);
         s->unknown_header_fields = g_malloc(s->unknown_header_fields_size);
-        ret = bdrv_pread(bs->file, sizeof(header), s->unknown_header_fields,
-                         s->unknown_header_fields_size, 0);
+        ret = bdrv_pread(bs->file, sizeof(header),
+                         s->unknown_header_fields_size,
+                         s->unknown_header_fields, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read unknown qcow2 header "
                              "fields");
@@ -1580,8 +1581,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -ENOMEM;
             goto fail;
         }
-        ret = bdrv_pread(bs->file, s->l1_table_offset, s->l1_table,
-                         s->l1_size * L1E_SIZE, 0);
+        ret = bdrv_pread(bs->file, s->l1_table_offset, s->l1_size * L1E_SIZE,
+                         s->l1_table, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read L1 table");
             goto fail;
@@ -1698,8 +1699,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -EINVAL;
             goto fail;
         }
-        ret = bdrv_pread(bs->file, header.backing_file_offset,
-                         bs->auto_backing_file, len, 0);
+        ret = bdrv_pread(bs->file, header.backing_file_offset, len,
+                         bs->auto_backing_file, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read backing file name");
             goto fail;
@@ -3081,7 +3082,7 @@ int qcow2_update_header(BlockDriverState *bs)
     }
 
     /* Write the new header */
-    ret = bdrv_pwrite(bs->file, 0, header, s->cluster_size, 0);
+    ret = bdrv_pwrite(bs->file, 0, s->cluster_size, header, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -4550,8 +4551,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
 
     /* write updated header.size */
     offset = cpu_to_be64(offset);
-    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, size), &offset,
-                           sizeof(offset), 0);
+    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, size),
+                           sizeof(offset), &offset, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to update the image size");
         goto fail;
@@ -4828,7 +4829,7 @@ static int make_completely_empty(BlockDriverState *bs)
     l1_ofs_rt_ofs_cls.reftable_offset = cpu_to_be64(s->cluster_size);
     l1_ofs_rt_ofs_cls.reftable_clusters = cpu_to_be32(1);
     ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, l1_table_offset),
-                           &l1_ofs_rt_ofs_cls, sizeof(l1_ofs_rt_ofs_cls), 0);
+                           sizeof(l1_ofs_rt_ofs_cls), &l1_ofs_rt_ofs_cls, 0);
     if (ret < 0) {
         goto fail_broken_refcounts;
     }
@@ -4859,8 +4860,8 @@ static int make_completely_empty(BlockDriverState *bs)
 
     /* Enter the first refblock into the reftable */
     rt_entry = cpu_to_be64(2 * s->cluster_size);
-    ret = bdrv_pwrite_sync(bs->file, s->cluster_size, &rt_entry,
-                           sizeof(rt_entry), 0);
+    ret = bdrv_pwrite_sync(bs->file, s->cluster_size, sizeof(rt_entry),
+                           &rt_entry, 0);
     if (ret < 0) {
         goto fail_broken_refcounts;
     }
diff --git a/block/qed.c b/block/qed.c
index ad86079941..ba93e99570 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -90,7 +90,7 @@ int qed_write_header_sync(BDRVQEDState *s)
     int ret;
 
     qed_header_cpu_to_le(&s->header, &le);
-    ret = bdrv_pwrite(s->bs->file, 0, &le, sizeof(le), 0);
+    ret = bdrv_pwrite(s->bs->file, 0, sizeof(le), &le, 0);
     if (ret != sizeof(le)) {
         return ret;
     }
@@ -207,7 +207,7 @@ static int qed_read_string(BdrvChild *file, uint64_t offset, size_t n,
     if (n >= buflen) {
         return -EINVAL;
     }
-    ret = bdrv_pread(file, offset, buf, n, 0);
+    ret = bdrv_pread(file, offset, n, buf, 0);
     if (ret < 0) {
         return ret;
     }
@@ -392,7 +392,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
     int64_t file_size;
     int ret;
 
-    ret = bdrv_pread(bs->file, 0, &le_header, sizeof(le_header), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         error_setg(errp, "Failed to read QED header");
         return ret;
@@ -1545,7 +1545,7 @@ static int bdrv_qed_change_backing_file(BlockDriverState *bs,
     }
 
     /* Write new header */
-    ret = bdrv_pwrite_sync(bs->file, 0, buffer, buffer_len, 0);
+    ret = bdrv_pwrite_sync(bs->file, 0, buffer_len, buffer, 0);
     g_free(buffer);
     if (ret == 0) {
         memcpy(&s->header, &new_header, sizeof(new_header));
diff --git a/block/vdi.c b/block/vdi.c
index 76cec1b883..9ef55a117a 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -385,7 +385,7 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
 
     logout("\n");
 
-    ret = bdrv_pread(bs->file, 0, &header, sizeof(header), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -485,8 +485,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, header.offset_bmap, s->bmap,
-                     bmap_size * SECTOR_SIZE, 0);
+    ret = bdrv_pread(bs->file, header.offset_bmap, bmap_size * SECTOR_SIZE,
+                     s->bmap, 0);
     if (ret < 0) {
         goto fail_free_bmap;
     }
@@ -664,7 +664,7 @@ vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
              * so this full-cluster write does not overlap a partial write
              * of the same cluster, issued from the "else" branch.
              */
-            ret = bdrv_pwrite(bs->file, data_offset, block, s->block_size, 0);
+            ret = bdrv_pwrite(bs->file, data_offset, s->block_size, block, 0);
             qemu_co_rwlock_unlock(&s->bmap_lock);
         } else {
 nonallocating_write:
@@ -709,7 +709,7 @@ nonallocating_write:
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header), 0);
+        ret = bdrv_pwrite(bs->file, 0, sizeof(*header), header, 0);
         g_free(header);
 
         if (ret < 0) {
@@ -726,8 +726,8 @@ nonallocating_write:
         base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
         logout("will write %u block map sectors starting from entry %u\n",
                n_sectors, bmap_first);
-        ret = bdrv_pwrite(bs->file, offset * SECTOR_SIZE, base,
-                          n_sectors * SECTOR_SIZE, 0);
+        ret = bdrv_pwrite(bs->file, offset * SECTOR_SIZE,
+                          n_sectors * SECTOR_SIZE, base, 0);
     }
 
     return ret < 0 ? ret : 0;
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index da0057000b..572582b87b 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -84,7 +84,7 @@ static int vhdx_log_peek_hdr(BlockDriverState *bs, VHDXLogEntries *log,
 
     offset = log->offset + read;
 
-    ret = bdrv_pread(bs->file, offset, hdr, sizeof(VHDXLogEntryHeader), 0);
+    ret = bdrv_pread(bs->file, offset, sizeof(VHDXLogEntryHeader), hdr, 0);
     if (ret < 0) {
         goto exit;
     }
@@ -144,7 +144,7 @@ static int vhdx_log_read_sectors(BlockDriverState *bs, VHDXLogEntries *log,
         }
         offset = log->offset + read;
 
-        ret = bdrv_pread(bs->file, offset, buffer, VHDX_LOG_SECTOR_SIZE, 0);
+        ret = bdrv_pread(bs->file, offset, VHDX_LOG_SECTOR_SIZE, buffer, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -194,7 +194,7 @@ static int vhdx_log_write_sectors(BlockDriverState *bs, VHDXLogEntries *log,
             /* full */
             break;
         }
-        ret = bdrv_pwrite(bs->file, offset, buffer_tmp, VHDX_LOG_SECTOR_SIZE,
+        ret = bdrv_pwrite(bs->file, offset, VHDX_LOG_SECTOR_SIZE, buffer_tmp,
                           0);
         if (ret < 0) {
             goto exit;
@@ -466,8 +466,8 @@ static int vhdx_log_flush_desc(BlockDriverState *bs, VHDXLogDescriptor *desc,
 
     /* count is only > 1 if we are writing zeroes */
     for (i = 0; i < count; i++) {
-        ret = bdrv_pwrite_sync(bs->file, file_offset, buffer,
-                               VHDX_LOG_SECTOR_SIZE, 0);
+        ret = bdrv_pwrite_sync(bs->file, file_offset, VHDX_LOG_SECTOR_SIZE,
+                               buffer, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -970,8 +970,8 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVVHDXState *s,
 
         if (i == 0 && leading_length) {
             /* partial sector at the front of the buffer */
-            ret = bdrv_pread(bs->file, file_offset, merged_sector,
-                             VHDX_LOG_SECTOR_SIZE, 0);
+            ret = bdrv_pread(bs->file, file_offset, VHDX_LOG_SECTOR_SIZE,
+                             merged_sector, 0);
             if (ret < 0) {
                 goto exit;
             }
@@ -981,8 +981,8 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVVHDXState *s,
         } else if (i == sectors - 1 && trailing_length) {
             /* partial sector at the end of the buffer */
             ret = bdrv_pread(bs->file, file_offset,
-                             merged_sector + trailing_length,
-                             VHDX_LOG_SECTOR_SIZE - trailing_length, 0);
+                             VHDX_LOG_SECTOR_SIZE - trailing_length,
+                             merged_sector + trailing_length, 0);
             if (ret < 0) {
                 goto exit;
             }
diff --git a/block/vhdx.c b/block/vhdx.c
index f5c812c9cf..12f5261f80 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -326,7 +326,7 @@ static int vhdx_write_header(BdrvChild *file, VHDXHeader *hdr,
     buffer = qemu_blockalign(bs_file, VHDX_HEADER_SIZE);
     if (read) {
         /* if true, we can't assume the extra reserved bytes are 0 */
-        ret = bdrv_pread(file, offset, buffer, VHDX_HEADER_SIZE, 0);
+        ret = bdrv_pread(file, offset, VHDX_HEADER_SIZE, buffer, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -340,7 +340,7 @@ static int vhdx_write_header(BdrvChild *file, VHDXHeader *hdr,
     vhdx_header_le_export(hdr, header_le);
     vhdx_update_checksum(buffer, VHDX_HEADER_SIZE,
                          offsetof(VHDXHeader, checksum));
-    ret = bdrv_pwrite_sync(file, offset, header_le, sizeof(VHDXHeader), 0);
+    ret = bdrv_pwrite_sync(file, offset, sizeof(VHDXHeader), header_le, 0);
 
 exit:
     qemu_vfree(buffer);
@@ -440,7 +440,7 @@ static void vhdx_parse_header(BlockDriverState *bs, BDRVVHDXState *s,
     /* We have to read the whole VHDX_HEADER_SIZE instead of
      * sizeof(VHDXHeader), because the checksum is over the whole
      * region */
-    ret = bdrv_pread(bs->file, VHDX_HEADER1_OFFSET, buffer, VHDX_HEADER_SIZE,
+    ret = bdrv_pread(bs->file, VHDX_HEADER1_OFFSET, VHDX_HEADER_SIZE, buffer,
                      0);
     if (ret < 0) {
         goto fail;
@@ -457,7 +457,7 @@ static void vhdx_parse_header(BlockDriverState *bs, BDRVVHDXState *s,
         }
     }
 
-    ret = bdrv_pread(bs->file, VHDX_HEADER2_OFFSET, buffer, VHDX_HEADER_SIZE,
+    ret = bdrv_pread(bs->file, VHDX_HEADER2_OFFSET, VHDX_HEADER_SIZE, buffer,
                      0);
     if (ret < 0) {
         goto fail;
@@ -531,8 +531,8 @@ static int vhdx_open_region_tables(BlockDriverState *bs, BDRVVHDXState *s)
      * whole block */
     buffer = qemu_blockalign(bs, VHDX_HEADER_BLOCK_SIZE);
 
-    ret = bdrv_pread(bs->file, VHDX_REGION_TABLE_OFFSET, buffer,
-                     VHDX_HEADER_BLOCK_SIZE, 0);
+    ret = bdrv_pread(bs->file, VHDX_REGION_TABLE_OFFSET,
+                     VHDX_HEADER_BLOCK_SIZE, buffer, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -644,8 +644,8 @@ static int vhdx_parse_metadata(BlockDriverState *bs, BDRVVHDXState *s)
 
     buffer = qemu_blockalign(bs, VHDX_METADATA_TABLE_MAX_SIZE);
 
-    ret = bdrv_pread(bs->file, s->metadata_rt.file_offset, buffer,
-                     VHDX_METADATA_TABLE_MAX_SIZE, 0);
+    ret = bdrv_pread(bs->file, s->metadata_rt.file_offset,
+                     VHDX_METADATA_TABLE_MAX_SIZE, buffer, 0);
     if (ret < 0) {
         goto exit;
     }
@@ -750,8 +750,8 @@ static int vhdx_parse_metadata(BlockDriverState *bs, BDRVVHDXState *s)
     ret = bdrv_pread(bs->file,
                      s->metadata_entries.file_parameters_entry.offset
                                          + s->metadata_rt.file_offset,
-                     &s->params,
                      sizeof(s->params),
+                     &s->params,
                      0);
 
     if (ret < 0) {
@@ -786,8 +786,8 @@ static int vhdx_parse_metadata(BlockDriverState *bs, BDRVVHDXState *s)
     ret = bdrv_pread(bs->file,
                      s->metadata_entries.virtual_disk_size_entry.offset
                                            + s->metadata_rt.file_offset,
-                     &s->virtual_disk_size,
                      sizeof(uint64_t),
+                     &s->virtual_disk_size,
                      0);
     if (ret < 0) {
         goto exit;
@@ -795,8 +795,8 @@ static int vhdx_parse_metadata(BlockDriverState *bs, BDRVVHDXState *s)
     ret = bdrv_pread(bs->file,
                      s->metadata_entries.logical_sector_size_entry.offset
                                              + s->metadata_rt.file_offset,
-                     &s->logical_sector_size,
                      sizeof(uint32_t),
+                     &s->logical_sector_size,
                      0);
     if (ret < 0) {
         goto exit;
@@ -804,8 +804,8 @@ static int vhdx_parse_metadata(BlockDriverState *bs, BDRVVHDXState *s)
     ret = bdrv_pread(bs->file,
                      s->metadata_entries.phys_sector_size_entry.offset
                                           + s->metadata_rt.file_offset,
-                     &s->physical_sector_size,
                      sizeof(uint32_t),
+                     &s->physical_sector_size,
                      0);
     if (ret < 0) {
         goto exit;
@@ -1014,7 +1014,7 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     QLIST_INIT(&s->regions);
 
     /* validate the file signature */
-    ret = bdrv_pread(bs->file, 0, &signature, sizeof(uint64_t), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(uint64_t), &signature, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -1073,7 +1073,7 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, s->bat_offset, s->bat, s->bat_rt.length, 0);
+    ret = bdrv_pread(bs->file, s->bat_offset, s->bat_rt.length, s->bat, 0);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 4ad09ca07b..aacea1095f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -307,7 +307,7 @@ static int vmdk_read_cid(BlockDriverState *bs, int parent, uint32_t *pcid)
     int ret;
 
     desc = g_malloc0(DESC_SIZE);
-    ret = bdrv_pread(bs->file, s->desc_offset, desc, DESC_SIZE, 0);
+    ret = bdrv_pread(bs->file, s->desc_offset, DESC_SIZE, desc, 0);
     if (ret < 0) {
         goto out;
     }
@@ -348,7 +348,7 @@ static int vmdk_write_cid(BlockDriverState *bs, uint32_t cid)
 
     desc = g_malloc0(DESC_SIZE);
     tmp_desc = g_malloc0(DESC_SIZE);
-    ret = bdrv_pread(bs->file, s->desc_offset, desc, DESC_SIZE, 0);
+    ret = bdrv_pread(bs->file, s->desc_offset, DESC_SIZE, desc, 0);
     if (ret < 0) {
         goto out;
     }
@@ -368,7 +368,7 @@ static int vmdk_write_cid(BlockDriverState *bs, uint32_t cid)
         pstrcat(desc, DESC_SIZE, tmp_desc);
     }
 
-    ret = bdrv_pwrite_sync(bs->file, s->desc_offset, desc, DESC_SIZE, 0);
+    ret = bdrv_pwrite_sync(bs->file, s->desc_offset, DESC_SIZE, desc, 0);
 
 out:
     g_free(desc);
@@ -469,7 +469,7 @@ static int vmdk_parent_open(BlockDriverState *bs)
     int ret;
 
     desc = g_malloc0(DESC_SIZE + 1);
-    ret = bdrv_pread(bs->file, s->desc_offset, desc, DESC_SIZE, 0);
+    ret = bdrv_pread(bs->file, s->desc_offset, DESC_SIZE, desc, 0);
     if (ret < 0) {
         goto out;
     }
@@ -589,8 +589,8 @@ static int vmdk_init_tables(BlockDriverState *bs, VmdkExtent *extent,
         return -ENOMEM;
     }
 
-    ret = bdrv_pread(extent->file, extent->l1_table_offset, extent->l1_table,
-                     l1_size, 0);
+    ret = bdrv_pread(extent->file, extent->l1_table_offset, l1_size,
+                     extent->l1_table, 0);
     if (ret < 0) {
         bdrv_refresh_filename(extent->file->bs);
         error_setg_errno(errp, -ret,
@@ -615,7 +615,7 @@ static int vmdk_init_tables(BlockDriverState *bs, VmdkExtent *extent,
             goto fail_l1;
         }
         ret = bdrv_pread(extent->file, extent->l1_backup_table_offset,
-                         extent->l1_backup_table, l1_size, 0);
+                         l1_size, extent->l1_backup_table, 0);
         if (ret < 0) {
             bdrv_refresh_filename(extent->file->bs);
             error_setg_errno(errp, -ret,
@@ -647,7 +647,7 @@ static int vmdk_open_vmfs_sparse(BlockDriverState *bs,
     VMDK3Header header;
     VmdkExtent *extent = NULL;
 
-    ret = bdrv_pread(file, sizeof(magic), &header, sizeof(header), 0);
+    ret = bdrv_pread(file, sizeof(magic), sizeof(header), &header, 0);
     if (ret < 0) {
         bdrv_refresh_filename(file->bs);
         error_setg_errno(errp, -ret,
@@ -811,7 +811,7 @@ static int vmdk_open_se_sparse(BlockDriverState *bs,
 
     assert(sizeof(const_header) == SECTOR_SIZE);
 
-    ret = bdrv_pread(file, 0, &const_header, sizeof(const_header), 0);
+    ret = bdrv_pread(file, 0, sizeof(const_header), &const_header, 0);
     if (ret < 0) {
         bdrv_refresh_filename(file->bs);
         error_setg_errno(errp, -ret,
@@ -829,7 +829,7 @@ static int vmdk_open_se_sparse(BlockDriverState *bs,
     assert(sizeof(volatile_header) == SECTOR_SIZE);
 
     ret = bdrv_pread(file, const_header.volatile_header_offset * SECTOR_SIZE,
-                     &volatile_header, sizeof(volatile_header), 0);
+                     sizeof(volatile_header), &volatile_header, 0);
     if (ret < 0) {
         bdrv_refresh_filename(file->bs);
         error_setg_errno(errp, -ret,
@@ -899,7 +899,7 @@ static char *vmdk_read_desc(BdrvChild *file, uint64_t desc_offset, Error **errp)
     size = MIN(size, (1 << 20) - 1);  /* avoid unbounded allocation */
     buf = g_malloc(size + 1);
 
-    ret = bdrv_pread(file, desc_offset, buf, size, 0);
+    ret = bdrv_pread(file, desc_offset, size, buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read from file");
         g_free(buf);
@@ -923,7 +923,7 @@ static int vmdk_open_vmdk4(BlockDriverState *bs,
     int64_t l1_backup_offset = 0;
     bool compressed;
 
-    ret = bdrv_pread(file, sizeof(magic), &header, sizeof(header), 0);
+    ret = bdrv_pread(file, sizeof(magic), sizeof(header), &header, 0);
     if (ret < 0) {
         bdrv_refresh_filename(file->bs);
         error_setg_errno(errp, -ret,
@@ -975,7 +975,7 @@ static int vmdk_open_vmdk4(BlockDriverState *bs,
         } QEMU_PACKED footer;
 
         ret = bdrv_pread(file, bs->file->bs->total_sectors * 512 - 1536,
-                         &footer, sizeof(footer), 0);
+                         sizeof(footer), &footer, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read footer");
             return ret;
@@ -1442,16 +1442,16 @@ static int get_whole_cluster(BlockDriverState *bs,
         if (copy_from_backing) {
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
-            ret = bdrv_pread(bs->backing, offset, whole_grain,
-                             skip_start_bytes, 0);
+            ret = bdrv_pread(bs->backing, offset, skip_start_bytes,
+                             whole_grain, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
             }
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
-        ret = bdrv_pwrite(extent->file, cluster_offset, whole_grain,
-                          skip_start_bytes, 0);
+        ret = bdrv_pwrite(extent->file, cluster_offset, skip_start_bytes,
+                          whole_grain, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1463,8 +1463,8 @@ static int get_whole_cluster(BlockDriverState *bs,
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
             ret = bdrv_pread(bs->backing, offset + skip_end_bytes,
-                             whole_grain + skip_end_bytes,
-                             cluster_bytes - skip_end_bytes, 0);
+                             cluster_bytes - skip_end_bytes,
+                             whole_grain + skip_end_bytes, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
@@ -1472,8 +1472,8 @@ static int get_whole_cluster(BlockDriverState *bs,
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
         ret = bdrv_pwrite(extent->file, cluster_offset + skip_end_bytes,
-                          whole_grain + skip_end_bytes,
-                          cluster_bytes - skip_end_bytes, 0);
+                          cluster_bytes - skip_end_bytes,
+                          whole_grain + skip_end_bytes, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1495,7 +1495,7 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
     if (bdrv_pwrite(extent->file,
                 ((int64_t)m_data->l2_offset * 512)
                     + (m_data->l2_index * sizeof(offset)),
-                &offset, sizeof(offset), 0) < 0) {
+                sizeof(offset), &offset, 0) < 0) {
         return VMDK_ERROR;
     }
     /* update backup L2 table */
@@ -1504,7 +1504,7 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
         if (bdrv_pwrite(extent->file,
                     ((int64_t)m_data->l2_offset * 512)
                         + (m_data->l2_index * sizeof(offset)),
-                    &offset, sizeof(offset), 0) < 0) {
+                    sizeof(offset), &offset, 0) < 0) {
             return VMDK_ERROR;
         }
     }
@@ -1627,8 +1627,8 @@ static int get_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(extent->file, BLKDBG_L2_LOAD);
     if (bdrv_pread(extent->file,
                 (int64_t)l2_offset * 512,
-                l2_table,
                 l2_size_bytes,
+                l2_table,
                 0
             ) != l2_size_bytes) {
         return VMDK_ERROR;
@@ -1898,7 +1898,7 @@ static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
     cluster_buf = g_malloc(buf_bytes);
     uncomp_buf = g_malloc(cluster_bytes);
     BLKDBG_EVENT(extent->file, BLKDBG_READ_COMPRESSED);
-    ret = bdrv_pread(extent->file, cluster_offset, cluster_buf, buf_bytes, 0);
+    ret = bdrv_pread(extent->file, cluster_offset, buf_bytes, cluster_buf, 0);
     if (ret < 0) {
         goto out;
     }
diff --git a/block/vpc.c b/block/vpc.c
index 1ccdfb0557..7f20820193 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -252,7 +252,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    ret = bdrv_pread(bs->file, 0, &s->footer, sizeof(s->footer), 0);
+    ret = bdrv_pread(bs->file, 0, sizeof(s->footer), &s->footer, 0);
     if (ret < 0) {
         error_setg(errp, "Unable to read VHD header");
         goto fail;
@@ -272,8 +272,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         }
 
         /* If a fixed disk, the footer is found only at the end of the file */
-        ret = bdrv_pread(bs->file, offset - sizeof(*footer), footer,
-                         sizeof(*footer), 0);
+        ret = bdrv_pread(bs->file, offset - sizeof(*footer), sizeof(*footer),
+                         footer, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -347,7 +347,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (disk_type == VHD_DYNAMIC) {
         ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
-                         &dyndisk_header, sizeof(dyndisk_header), 0);
+                         sizeof(dyndisk_header), &dyndisk_header, 0);
         if (ret < 0) {
             error_setg(errp, "Error reading dynamic VHD header");
             goto fail;
@@ -401,8 +401,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
 
         s->bat_offset = be64_to_cpu(dyndisk_header.table_offset);
 
-        ret = bdrv_pread(bs->file, s->bat_offset, s->pagetable,
-                         pagetable_size, 0);
+        ret = bdrv_pread(bs->file, s->bat_offset, pagetable_size,
+                         s->pagetable, 0);
         if (ret < 0) {
             error_setg(errp, "Error reading pagetable");
             goto fail;
@@ -516,7 +516,7 @@ static inline int64_t get_image_offset(BlockDriverState *bs, uint64_t offset,
 
         s->last_bitmap_offset = bitmap_offset;
         memset(bitmap, 0xff, s->bitmap_size);
-        r = bdrv_pwrite_sync(bs->file, bitmap_offset, bitmap, s->bitmap_size,
+        r = bdrv_pwrite_sync(bs->file, bitmap_offset, s->bitmap_size, bitmap,
                              0);
         if (r < 0) {
             *err = r;
@@ -539,7 +539,7 @@ static int rewrite_footer(BlockDriverState *bs)
     BDRVVPCState *s = bs->opaque;
     int64_t offset = s->free_data_block_offset;
 
-    ret = bdrv_pwrite_sync(bs->file, offset, &s->footer, sizeof(s->footer), 0);
+    ret = bdrv_pwrite_sync(bs->file, offset, sizeof(s->footer), &s->footer, 0);
     if (ret < 0)
         return ret;
 
@@ -573,8 +573,8 @@ static int64_t alloc_block(BlockDriverState *bs, int64_t offset)
 
     /* Initialize the block's bitmap */
     memset(bitmap, 0xff, s->bitmap_size);
-    ret = bdrv_pwrite_sync(bs->file, s->free_data_block_offset, bitmap,
-                           s->bitmap_size, 0);
+    ret = bdrv_pwrite_sync(bs->file, s->free_data_block_offset,
+                           s->bitmap_size, bitmap, 0);
     if (ret < 0) {
         return ret;
     }
@@ -588,7 +588,7 @@ static int64_t alloc_block(BlockDriverState *bs, int64_t offset)
     /* Write BAT entry to disk */
     bat_offset = s->bat_offset + (4 * index);
     bat_value = cpu_to_be32(s->pagetable[index]);
-    ret = bdrv_pwrite_sync(bs->file, bat_offset, &bat_value, 4, 0);
+    ret = bdrv_pwrite_sync(bs->file, bat_offset, 4, &bat_value, 0);
     if (ret < 0)
         goto fail;
 
diff --git a/block/vvfat.c b/block/vvfat.c
index 87595dfc69..d6dd919683 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1488,8 +1488,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
                 DLOG(fprintf(stderr, "sectors %" PRId64 "+%" PRId64
                              " allocated\n", sector_num,
                              n >> BDRV_SECTOR_BITS));
-                if (bdrv_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE,
-                               buf + i * 0x200, n, 0) < 0) {
+                if (bdrv_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE, n,
+                               buf + i * 0x200, 0) < 0) {
                     return -1;
                 }
                 i += (n >> BDRV_SECTOR_BITS) - 1;
@@ -1978,7 +1978,7 @@ static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
                             return -1;
                         }
                         res = bdrv_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
-                                          s->cluster_buffer, BDRV_SECTOR_SIZE,
+                                          BDRV_SECTOR_SIZE, s->cluster_buffer,
                                           0);
                         if (res < 0) {
                             return -2;
@@ -3063,8 +3063,8 @@ DLOG(checkpoint());
      * Use qcow backend. Commit later.
      */
 DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sectors));
-    ret = bdrv_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE, buf,
-                      nb_sectors * BDRV_SECTOR_SIZE, 0);
+    ret = bdrv_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE,
+                      nb_sectors * BDRV_SECTOR_SIZE, buf, 0);
     if (ret < 0) {
         fprintf(stderr, "Error writing to qcow backend\n");
         return ret;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 900ab19545..879221cebe 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -42,12 +42,12 @@
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
                        int64_t bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes,
+int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
                BdrvRequestFlags flags);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
-                int64_t bytes, BdrvRequestFlags flags);
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int64_t bytes, BdrvRequestFlags flags);
+int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
+                const void *buf, BdrvRequestFlags flags);
+int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
+                     const void *buf, BdrvRequestFlags flags);
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 4db1ad5dfe..49fb1ef1ea 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -88,11 +88,11 @@ static void test_sync_op_pread(BdrvChild *c)
     int ret;
 
     /* Success */
-    ret = bdrv_pread(c, 0, buf, sizeof(buf), 0);
+    ret = bdrv_pread(c, 0, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, 512);
 
     /* Early error: Negative offset */
-    ret = bdrv_pread(c, -2, buf, sizeof(buf), 0);
+    ret = bdrv_pread(c, -2, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
@@ -102,11 +102,11 @@ static void test_sync_op_pwrite(BdrvChild *c)
     int ret;
 
     /* Success */
-    ret = bdrv_pwrite(c, 0, buf, sizeof(buf), 0);
+    ret = bdrv_pwrite(c, 0, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, 512);
 
     /* Early error: Negative offset */
-    ret = bdrv_pwrite(c, -2, buf, sizeof(buf), 0);
+    ret = bdrv_pwrite(c, -2, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
-- 
2.35.3


