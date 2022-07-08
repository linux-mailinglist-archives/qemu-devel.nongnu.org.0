Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE156B187
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:27:00 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fZz-0006Yw-JT
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSy-0003vL-MH
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSw-0000OT-Jc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JROyeDCuqRPYheOCOIiVjDQFrHQ+HPgpGEYy8Gg1Q3A=;
 b=CHxf6NC7xm991b+4mujU4xObyMmPfcnqyrIZKX+3gnzBnEl/s20jxJhqzLdd1C5m3+aB4D
 hwvKyLPDVTawF2EBSoXRAl1yt2TFVBsk9oz6vEhHnTTV2Dl6/hvSgoJHRqkXKZ1imE+mFe
 uE881BcnExnhRsucI+U58CCL0EN5ZXY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-YmTOPGAYMb2jdRK9_KjDBA-1; Fri, 08 Jul 2022 00:19:35 -0400
X-MC-Unique: YmTOPGAYMb2jdRK9_KjDBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A49603C0E22A;
 Fri,  8 Jul 2022 04:19:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB48C23DBF;
 Fri,  8 Jul 2022 04:19:34 +0000 (UTC)
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
Subject: [RFC v3 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Date: Fri,  8 Jul 2022 05:17:36 +0100
Message-Id: <20220708041737.1768521-8-stefanha@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Avoid bounce buffers when QEMUIOVector elements are within previously
registered bdrv_register_buf() buffers.

The idea is that emulated storage controllers will register guest RAM
using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
requests. Therefore no blkio_map_mem_region() calls are necessary in the
performance-critical I/O code path.

This optimization doesn't apply if the I/O buffer is internally
allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
path because BDRV_REQ_REGISTERED_BUF is not set.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/blkio.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index 7fbdbd7fae..37d593a20c 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -1,7 +1,9 @@
 #include "qemu/osdep.h"
 #include <blkio.h>
 #include "block/block_int.h"
+#include "exec/memory.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
 
@@ -28,6 +30,9 @@ typedef struct {
 
     /* Can we skip adding/deleting blkio_mem_regions? */
     bool needs_mem_regions;
+
+    /* Are file descriptors necessary for blkio_mem_regions? */
+    bool needs_mem_region_fd;
 } BDRVBlkioState;
 
 static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
@@ -198,6 +203,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
         BlockCompletionFunc *cb, void *opaque)
 {
     BDRVBlkioState *s = bs->opaque;
+    bool needs_mem_regions =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
     BlkioAIOCB *acb;
@@ -206,7 +213,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
 
     acb = blkio_aiocb_get(bs, cb, opaque);
 
-    if (s->needs_mem_regions) {
+    if (needs_mem_regions) {
         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
             qemu_aio_unref(&acb->common);
             return NULL;
@@ -230,6 +237,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
 {
     uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
     BDRVBlkioState *s = bs->opaque;
+    bool needs_mem_regions =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
     BlkioAIOCB *acb;
@@ -238,7 +247,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
 
     acb = blkio_aiocb_get(bs, cb, opaque);
 
-    if (s->needs_mem_regions) {
+    if (needs_mem_regions) {
         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
             qemu_aio_unref(&acb->common);
             return NULL;
@@ -324,6 +333,80 @@ static void blkio_io_unplug(BlockDriverState *bs)
     }
 }
 
+static void blkio_register_buf(BlockDriverState *bs, void *host, size_t size)
+{
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+    struct blkio_mem_region region = (struct blkio_mem_region){
+        .addr = host,
+        .len = size,
+        .fd = -1,
+    };
+
+    if (((uintptr_t)host | size) % s->mem_region_alignment) {
+        error_report_once("%s: skipping unaligned buf %p with size %zu",
+                          __func__, host, size);
+        return; /* skip unaligned */
+    }
+
+    /* Attempt to find the fd for a MemoryRegion */
+    if (s->needs_mem_region_fd) {
+        int fd = -1;
+        ram_addr_t offset;
+        MemoryRegion *mr;
+
+        /*
+         * bdrv_register_buf() is called with the BQL held so mr lives at least
+         * until this function returns.
+         */
+        mr = memory_region_from_host(host, &offset);
+        if (mr) {
+            fd = memory_region_get_fd(mr);
+        }
+        if (fd == -1) {
+            error_report_once("%s: skipping fd-less buf %p with size %zu",
+                              __func__, host, size);
+            return; /* skip if there is no fd */
+        }
+
+        region.fd = fd;
+        region.fd_offset = offset;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        ret = blkio_map_mem_region(s->blkio, &region);
+    }
+
+    if (ret < 0) {
+        error_report_once("Failed to add blkio mem region %p with size %zu: %s",
+                          host, size, blkio_get_error_msg());
+    }
+}
+
+static void blkio_unregister_buf(BlockDriverState *bs, void *host, size_t size)
+{
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+    struct blkio_mem_region region = (struct blkio_mem_region){
+        .addr = host,
+        .len = size,
+        .fd = -1,
+    };
+
+    if (((uintptr_t)host | size) % s->mem_region_alignment) {
+        return; /* skip unaligned */
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        ret = blkio_unmap_mem_region(s->blkio, &region);
+    }
+
+    if (ret < 0) {
+        error_report_once("Failed to delete blkio mem region %p with size %zu: %s",
+                          host, size, blkio_get_error_msg());
+    }
+}
+
 static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
                                           Error **errp)
 {
@@ -440,6 +523,17 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    ret = blkio_get_bool(s->blkio,
+                         "needs-mem-region-fd",
+                         &s->needs_mem_region_fd);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get needs-mem-region-fd: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
     ret = blkio_get_uint64(s->blkio,
                            "mem-region-alignment",
                            &s->mem_region_alignment);
@@ -459,7 +553,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->supported_write_flags = BDRV_REQ_FUA;
+    bs->supported_write_flags = BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;
     bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
                                BDRV_REQ_NO_FALLBACK;
 
@@ -627,6 +721,8 @@ static BlockDriver bdrv_io_uring = {
     .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
     .bdrv_io_unplug             = blkio_io_unplug,
     .bdrv_refresh_limits        = blkio_refresh_limits,
+    .bdrv_register_buf          = blkio_register_buf,
+    .bdrv_unregister_buf        = blkio_unregister_buf,
 };
 
 static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
@@ -648,6 +744,8 @@ static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
     .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
     .bdrv_io_unplug             = blkio_io_unplug,
     .bdrv_refresh_limits        = blkio_refresh_limits,
+    .bdrv_register_buf          = blkio_register_buf,
+    .bdrv_unregister_buf        = blkio_unregister_buf,
 };
 
 static void bdrv_blkio_init(void)
-- 
2.36.1


