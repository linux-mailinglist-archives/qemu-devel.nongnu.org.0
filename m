Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A3C8B26
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 16:26:34 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFfaL-00082Y-K9
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 10:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iFfWx-0005hq-7W
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 10:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iFfWv-0005ba-Lu
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 10:23:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:53300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iFfWv-0005Zg-Co; Wed, 02 Oct 2019 10:23:01 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iFfWr-0003C3-BP; Wed, 02 Oct 2019 17:22:57 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 1/6] qcow2: Allow writing compressed data to multiple
 clusters
Date: Wed,  2 Oct 2019 17:22:41 +0300
Message-Id: <1570026166-748566-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570026166-748566-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1570026166-748566-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 jsnow@redhat.com, armbru@redhat.com, dgilbert@redhat.com, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently supports writing compressed data of size less than or
equal to one cluster. This patch allows writing QCOW2 compressed data
that exceed one cluster. The implementation is simple, we split buffered
data into separate clusters and write them using the existing
functionality. For unaligned requests, we use a workaround that writes
the data without compression.

Suggested-by: Pavel Butsykin <pbutsykin@virtuozzo.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/qcow2.c | 113 +++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 28 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 7961c05..54ccaf6 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4152,10 +4152,8 @@ fail:
     return ret;
 }
 
-/* XXX: put compressed sectors first, then all the cluster aligned
-   tables to avoid losing bytes in alignment */
 static coroutine_fn int
-qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
+qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
                                  uint64_t offset, uint64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
 {
@@ -4165,36 +4163,14 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
 
-    if (has_data_file(bs)) {
-        return -ENOTSUP;
-    }
-
-    if (bytes == 0) {
-        /* align end of file to a sector boundary to ease reading with
-           sector based I/Os */
-        int64_t len = bdrv_getlength(bs->file->bs);
-        if (len < 0) {
-            return len;
-        }
-        return bdrv_co_truncate(bs->file, len, PREALLOC_MODE_OFF, NULL);
-    }
-
-    if (offset_into_cluster(s, offset)) {
-        return -EINVAL;
-    }
+    assert(bytes <= s->cluster_size);
 
     buf = qemu_blockalign(bs, s->cluster_size);
-    if (bytes != s->cluster_size) {
-        if (bytes > s->cluster_size ||
-            offset + bytes != bs->total_sectors << BDRV_SECTOR_BITS)
-        {
-            qemu_vfree(buf);
-            return -EINVAL;
-        }
+    if (bytes < s->cluster_size) {
         /* Zero-pad last write if image size is not cluster aligned */
         memset(buf + bytes, 0, s->cluster_size - bytes);
     }
-    qemu_iovec_to_buf(qiov, qiov_offset, buf, bytes);
+    qemu_iovec_to_buf(qiov, qiov_offset, buf, s->cluster_size);
 
     out_buf = g_malloc(s->cluster_size);
 
@@ -4228,6 +4204,9 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
     BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
     ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+    if (ret == -ENOTSUP) {
+        ret = qcow2_co_pwritev_part(bs, offset, bytes, qiov, qiov_offset, 0);
+    }
     if (ret < 0) {
         goto fail;
     }
@@ -4239,6 +4218,84 @@ fail:
     return ret;
 }
 
+static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
+{
+    Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
+
+    assert(!t->cluster_type);
+
+    return qcow2_co_pwritev_compressed_task(t->bs, t->offset, t->bytes, t->qiov,
+                                            t->qiov_offset);
+}
+
+/*
+ * XXX: put compressed sectors first, then all the cluster aligned
+   tables to avoid losing bytes in alignment
+ */
+static coroutine_fn int
+qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
+                                 uint64_t offset, uint64_t bytes,
+                                 QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BDRVQcow2State *s = bs->opaque;
+    QCowL2Meta *l2meta = NULL;
+    AioTaskPool *aio = NULL;
+    uint64_t curr_off = 0;
+    int ret;
+
+    if (has_data_file(bs)) {
+        return -ENOTSUP;
+    }
+
+    if (bytes == 0) {
+        /*
+         * align end of file to a sector boundary to ease reading with
+         * sector based I/Os
+         */
+        int64_t cluster_offset = bdrv_getlength(bs->file->bs);
+        if (cluster_offset < 0) {
+            return cluster_offset;
+        }
+        return bdrv_co_truncate(bs->file, cluster_offset, PREALLOC_MODE_OFF,
+                                NULL);
+    }
+
+    if (offset_into_cluster(s, offset)) {
+        return -EINVAL;
+    }
+
+    while (bytes && aio_task_pool_status(aio) == 0) {
+        uint32_t chunk_size = MIN(bytes, s->cluster_size);
+
+        assert((curr_off & (BDRV_SECTOR_SIZE - 1)) == 0);
+        assert((chunk_size & (BDRV_SECTOR_SIZE - 1)) == 0);
+
+        if (!aio && chunk_size != bytes) {
+            aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
+        }
+
+        ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_compressed_task_entry,
+                             0, 0, offset + curr_off, chunk_size,
+                             qiov, qiov_offset, l2meta);
+        if (ret < 0) {
+            break;
+        }
+        qiov_offset += chunk_size;
+        curr_off += chunk_size;
+        bytes -= chunk_size;
+    }
+
+    if (aio) {
+        aio_task_pool_wait_all(aio);
+        if (ret == 0) {
+            ret = aio_task_pool_status(aio);
+        }
+        g_free(aio);
+    }
+
+    return ret;
+}
+
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
                            uint64_t file_cluster_offset,
-- 
1.8.3.1


