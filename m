Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2971251453
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 10:36:27 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAURO-00088z-Sb
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 04:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOQ-0002qw-TN
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21934
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOO-0000XW-Fb
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598344399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+F2AzkOgujLPcGdLG1lO0Ag60pKbUxn5nJrV9PKMDl0=;
 b=IQiG5ClVDy05w0JV75kcpC9SNDii8I787g5EuSjfV2IMgFJP7DNHsZzY0dcnIfngEQfqU0
 asInEHaDk7CYt8yc+91QXXESEva6i25NkhIDliSGzQQjlqz0bYwyZrTrR+GqwFHuEQWWTO
 RpyxJUy8kVa7QK67NP+n9htDIx0kXhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-zuj1rxYpP76snOzBu_KTEg-1; Tue, 25 Aug 2020 04:33:16 -0400
X-MC-Unique: zuj1rxYpP76snOzBu_KTEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA38E10051D4;
 Tue, 25 Aug 2020 08:33:15 +0000 (UTC)
Received: from localhost (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1EE60FC2;
 Tue, 25 Aug 2020 08:33:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/34] qcow2: Make Qcow2AioTask store the full host offset
Date: Tue, 25 Aug 2020 10:32:38 +0200
Message-Id: <20200825083311.1098442-2-mreitz@redhat.com>
In-Reply-To: <20200825083311.1098442-1-mreitz@redhat.com>
References: <20200825083311.1098442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

The file_cluster_offset field of Qcow2AioTask stores a cluster-aligned
host offset. In practice this is not very useful because all users(*)
of this structure need the final host offset into the cluster, which
they calculate using

   host_offset = file_cluster_offset + offset_into_cluster(s, offset)

There is no reason why Qcow2AioTask cannot store host_offset directly
and that is what this patch does.

(*) compressed clusters are the exception: in this case what
    file_cluster_offset was storing was the full compressed cluster
    descriptor (offset + size). This does not change with this patch
    but it is documented now.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <07c4b15c644dcf06c9459f98846ac1c4ea96e26f.1594396418.git.berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c      | 69 ++++++++++++++++++++++------------------------
 block/trace-events |  2 +-
 2 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 6ad6bdc166..5ab1f45fe2 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -74,7 +74,7 @@ typedef struct {
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t cluster_descriptor,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2113,7 +2113,7 @@ out:
 
 static coroutine_fn int
 qcow2_co_preadv_encrypted(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t host_offset,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2140,16 +2140,12 @@ qcow2_co_preadv_encrypted(BlockDriverState *bs,
     }
 
     BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-    ret = bdrv_co_pread(s->data_file,
-                        file_cluster_offset + offset_into_cluster(s, offset),
-                        bytes, buf, 0);
+    ret = bdrv_co_pread(s->data_file, host_offset, bytes, buf, 0);
     if (ret < 0) {
         goto fail;
     }
 
-    if (qcow2_co_decrypt(bs,
-                         file_cluster_offset + offset_into_cluster(s, offset),
-                         offset, buf, bytes) < 0)
+    if (qcow2_co_decrypt(bs, host_offset, offset, buf, bytes) < 0)
     {
         ret = -EIO;
         goto fail;
@@ -2167,7 +2163,7 @@ typedef struct Qcow2AioTask {
 
     BlockDriverState *bs;
     QCow2ClusterType cluster_type; /* only for read */
-    uint64_t file_cluster_offset;
+    uint64_t host_offset; /* or full descriptor in compressed clusters */
     uint64_t offset;
     uint64_t bytes;
     QEMUIOVector *qiov;
@@ -2180,7 +2176,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        AioTaskPool *pool,
                                        AioTaskFunc func,
                                        QCow2ClusterType cluster_type,
-                                       uint64_t file_cluster_offset,
+                                       uint64_t host_offset,
                                        uint64_t offset,
                                        uint64_t bytes,
                                        QEMUIOVector *qiov,
@@ -2195,7 +2191,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
         .bs = bs,
         .cluster_type = cluster_type,
         .qiov = qiov,
-        .file_cluster_offset = file_cluster_offset,
+        .host_offset = host_offset,
         .offset = offset,
         .bytes = bytes,
         .qiov_offset = qiov_offset,
@@ -2204,7 +2200,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 
     trace_qcow2_add_task(qemu_coroutine_self(), bs, pool,
                          func == qcow2_co_preadv_task_entry ? "read" : "write",
-                         cluster_type, file_cluster_offset, offset, bytes,
+                         cluster_type, host_offset, offset, bytes,
                          qiov, qiov_offset);
 
     if (!pool) {
@@ -2218,13 +2214,12 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 
 static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              QCow2ClusterType cluster_type,
-                                             uint64_t file_cluster_offset,
+                                             uint64_t host_offset,
                                              uint64_t offset, uint64_t bytes,
                                              QEMUIOVector *qiov,
                                              size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int offset_in_cluster = offset_into_cluster(s, offset);
 
     switch (cluster_type) {
     case QCOW2_CLUSTER_ZERO_PLAIN:
@@ -2240,19 +2235,17 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                    qiov, qiov_offset, 0);
 
     case QCOW2_CLUSTER_COMPRESSED:
-        return qcow2_co_preadv_compressed(bs, file_cluster_offset,
+        return qcow2_co_preadv_compressed(bs, host_offset,
                                           offset, bytes, qiov, qiov_offset);
 
     case QCOW2_CLUSTER_NORMAL:
-        assert(offset_into_cluster(s, file_cluster_offset) == 0);
         if (bs->encrypted) {
-            return qcow2_co_preadv_encrypted(bs, file_cluster_offset,
+            return qcow2_co_preadv_encrypted(bs, host_offset,
                                              offset, bytes, qiov, qiov_offset);
         }
 
         BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-        return bdrv_co_preadv_part(s->data_file,
-                                   file_cluster_offset + offset_in_cluster,
+        return bdrv_co_preadv_part(s->data_file, host_offset,
                                    bytes, qiov, qiov_offset, 0);
 
     default:
@@ -2268,7 +2261,7 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 
     assert(!t->l2meta);
 
-    return qcow2_co_preadv_task(t->bs, t->cluster_type, t->file_cluster_offset,
+    return qcow2_co_preadv_task(t->bs, t->cluster_type, t->host_offset,
                                 t->offset, t->bytes, t->qiov, t->qiov_offset);
 }
 
@@ -2304,11 +2297,20 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
         } else {
+            /*
+             * For compressed clusters the variable cluster_offset
+             * does not actually store the offset but the full
+             * descriptor. We need to leave it unchanged because
+             * that's what qcow2_co_preadv_compressed() expects.
+             */
+            uint64_t host_offset = (ret == QCOW2_CLUSTER_COMPRESSED) ?
+                cluster_offset :
+                cluster_offset + offset_into_cluster(s, offset);
             if (!aio && cur_bytes != bytes) {
                 aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
             }
             ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, ret,
-                                 cluster_offset, offset, cur_bytes,
+                                 host_offset, offset, cur_bytes,
                                  qiov, qiov_offset, NULL);
             if (ret < 0) {
                 goto out;
@@ -2459,7 +2461,7 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
  *           not use it somehow after qcow2_co_pwritev_task() call
  */
 static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
-                                              uint64_t file_cluster_offset,
+                                              uint64_t host_offset,
                                               uint64_t offset, uint64_t bytes,
                                               QEMUIOVector *qiov,
                                               uint64_t qiov_offset,
@@ -2468,7 +2470,6 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
     int ret;
     BDRVQcow2State *s = bs->opaque;
     void *crypt_buf = NULL;
-    int offset_in_cluster = offset_into_cluster(s, offset);
     QEMUIOVector encrypted_qiov;
 
     if (bs->encrypted) {
@@ -2481,9 +2482,7 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
         }
         qemu_iovec_to_buf(qiov, qiov_offset, crypt_buf, bytes);
 
-        if (qcow2_co_encrypt(bs, file_cluster_offset + offset_in_cluster,
-                             offset, crypt_buf, bytes) < 0)
-        {
+        if (qcow2_co_encrypt(bs, host_offset, offset, crypt_buf, bytes) < 0) {
             ret = -EIO;
             goto out_unlocked;
         }
@@ -2507,10 +2506,8 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
      */
     if (!merge_cow(offset, bytes, qiov, qiov_offset, l2meta)) {
         BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-        trace_qcow2_writev_data(qemu_coroutine_self(),
-                                file_cluster_offset + offset_in_cluster);
-        ret = bdrv_co_pwritev_part(s->data_file,
-                                   file_cluster_offset + offset_in_cluster,
+        trace_qcow2_writev_data(qemu_coroutine_self(), host_offset);
+        ret = bdrv_co_pwritev_part(s->data_file, host_offset,
                                    bytes, qiov, qiov_offset, 0);
         if (ret < 0) {
             goto out_unlocked;
@@ -2540,7 +2537,7 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 
     assert(!t->cluster_type);
 
-    return qcow2_co_pwritev_task(t->bs, t->file_cluster_offset,
+    return qcow2_co_pwritev_task(t->bs, t->host_offset,
                                  t->offset, t->bytes, t->qiov, t->qiov_offset,
                                  t->l2meta);
 }
@@ -2595,8 +2592,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
         }
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_task_entry, 0,
-                             cluster_offset, offset, cur_bytes,
-                             qiov, qiov_offset, l2meta);
+                             cluster_offset + offset_in_cluster, offset,
+                             cur_bytes, qiov, qiov_offset, l2meta);
         l2meta = NULL; /* l2meta is consumed by qcow2_co_pwritev_task() */
         if (ret < 0) {
             goto fail_nometa;
@@ -4562,7 +4559,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t cluster_descriptor,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -4574,8 +4571,8 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = file_cluster_offset & s->cluster_offset_mask;
-    nb_csectors = ((file_cluster_offset >> s->csize_shift) & s->csize_mask) + 1;
+    coffset = cluster_descriptor & s->cluster_offset_mask;
+    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
     csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
         (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
 
diff --git a/block/trace-events b/block/trace-events
index 9158335061..e1c79a910d 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -77,7 +77,7 @@ luring_io_uring_submit(void *s, int ret) "LuringState %p ret %d"
 luring_resubmit_short_read(void *s, void *luringcb, int nread) "LuringState %p luringcb %p nread %d"
 
 # qcow2.c
-qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t file_cluster_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
+qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t host_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
 qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offset 0x%" PRIx64 " bytes %d"
 qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
-- 
2.26.2


