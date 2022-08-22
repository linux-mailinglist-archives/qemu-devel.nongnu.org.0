Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA059CB9E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:41:07 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG6U-0006Bt-A5
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqf-0002BA-Qu
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqX-0004cH-Vw
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2R0iRNXrjBHd100CoIGDUAallZK+wQOgIgZJ8ae35U=;
 b=P6TBSSVSQmPAlFtor0i16khvWInehcRrm3LWwR7UbQPWl+/bvcZUfg6SiULeSteJgcN6z4
 9a6ygMS7oKoutUT5qDSaAEhz54BTlPZXfC3qkKlYSkGSoj9j2zve4049c3mZ/R7qoRGRNK
 Yi8NmGkogkSPOgGlNixyK+5eBWaclfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-fNpGBn2ePkekiDikc6vxsg-1; Mon, 22 Aug 2022 18:24:32 -0400
X-MC-Unique: fNpGBn2ePkekiDikc6vxsg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58E9D299E776;
 Mon, 22 Aug 2022 22:24:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B01492C3B;
 Mon, 22 Aug 2022 22:24:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
Subject: [RFC v4 10/11] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Date: Mon, 22 Aug 2022 18:24:01 -0400
Message-Id: <20220822222402.176088-11-stefanha@redhat.com>
In-Reply-To: <20220822222402.176088-1-stefanha@redhat.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 block/blkio.c | 142 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 3 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index cdcba1b63e..976d37705c 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -11,7 +11,10 @@
 #include "qemu/osdep.h"
 #include <blkio.h>
 #include "block/block_int.h"
+#include "exec/memory.h"
+#include "exec/cpu-common.h" /* for qemu_ram_get_fd() */
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
 
@@ -46,6 +49,9 @@ typedef struct {
 
     /* Can we skip adding/deleting blkio_mem_regions? */
     bool needs_mem_regions;
+
+    /* Are file descriptors necessary for blkio_mem_regions? */
+    bool needs_mem_region_fd;
 } BDRVBlkioState;
 
 static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
@@ -226,6 +232,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
         BlockCompletionFunc *cb, void *opaque)
 {
     BDRVBlkioState *s = bs->opaque;
+    bool needs_mem_regions =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
     BlkioAIOCB *acb;
@@ -234,7 +242,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
 
     acb = blkio_aiocb_get(bs, cb, opaque);
 
-    if (s->needs_mem_regions) {
+    if (needs_mem_regions) {
         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
             qemu_aio_unref(&acb->common);
             return NULL;
@@ -258,6 +266,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
 {
     uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
     BDRVBlkioState *s = bs->opaque;
+    bool needs_mem_regions =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
     BlkioAIOCB *acb;
@@ -266,7 +276,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
 
     acb = blkio_aiocb_get(bs, cb, opaque);
 
-    if (s->needs_mem_regions) {
+    if (needs_mem_regions) {
         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
             qemu_aio_unref(&acb->common);
             return NULL;
@@ -352,6 +362,117 @@ static void blkio_io_unplug(BlockDriverState *bs)
     }
 }
 
+typedef enum {
+    BMRR_OK,
+    BMRR_SKIP,
+    BMRR_FAIL,
+} BlkioMemRegionResult;
+
+/*
+ * Produce a struct blkio_mem_region for a given address and size.
+ *
+ * This function produces identical results when called multiple times with the
+ * same arguments. This property is necessary because blkio_unmap_mem_region()
+ * must receive the same struct blkio_mem_region field values that were passed
+ * to blkio_map_mem_region().
+ */
+static BlkioMemRegionResult
+blkio_mem_region_from_host(BlockDriverState *bs,
+                           void *host, size_t size,
+                           struct blkio_mem_region *region,
+                           Error **errp)
+{
+    BDRVBlkioState *s = bs->opaque;
+    int fd = -1;
+    ram_addr_t fd_offset = 0;
+
+    if (((uintptr_t)host | size) % s->mem_region_alignment) {
+        error_setg(errp, "unaligned buf %p with size %zu", host, size);
+        return BMRR_FAIL;
+    }
+
+    /* Attempt to find the fd for the underlying memory */
+    if (s->needs_mem_region_fd) {
+        RAMBlock *ram_block;
+        RAMBlock *end_block;
+        ram_addr_t offset;
+
+        /*
+         * bdrv_register_buf() is called with the BQL held so mr lives at least
+         * until this function returns.
+         */
+        ram_block = qemu_ram_block_from_host(host, false, &fd_offset);
+        if (ram_block) {
+            fd = qemu_ram_get_fd(ram_block);
+        }
+        if (fd == -1) {
+            /*
+             * Ideally every RAMBlock would have an fd. pc-bios and other
+             * things don't. Luckily they are usually not I/O buffers and we
+             * can just ignore them.
+             */
+            return BMRR_SKIP;
+        }
+
+        /* Make sure the fd covers the entire range */
+        end_block = qemu_ram_block_from_host(host + size - 1, false, &offset);
+        if (ram_block != end_block) {
+            error_setg(errp, "registered buffer at %p with size %zu extends "
+                       "beyond RAMBlock", host, size);
+            return BMRR_FAIL;
+        }
+    }
+
+    *region = (struct blkio_mem_region){
+        .addr = host,
+        .len = size,
+        .fd = fd,
+        .fd_offset = fd_offset,
+    };
+    return BMRR_OK;
+}
+
+static bool blkio_register_buf(BlockDriverState *bs, void *host, size_t size,
+                               Error **errp)
+{
+    BDRVBlkioState *s = bs->opaque;
+    struct blkio_mem_region region;
+    BlkioMemRegionResult region_result;
+    int ret;
+
+    region_result = blkio_mem_region_from_host(bs, host, size, &region, errp);
+    if (region_result == BMRR_SKIP) {
+        return true;
+    } else if (region_result != BMRR_OK) {
+        return false;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        ret = blkio_map_mem_region(s->blkio, &region);
+    }
+
+    if (ret < 0) {
+        error_setg(errp, "Failed to add blkio mem region %p with size %zu: %s",
+                   host, size, blkio_get_error_msg());
+        return false;
+    }
+    return true;
+}
+
+static void blkio_unregister_buf(BlockDriverState *bs, void *host, size_t size)
+{
+    BDRVBlkioState *s = bs->opaque;
+    struct blkio_mem_region region;
+
+    if (blkio_mem_region_from_host(bs, host, size, &region, NULL) != BMRR_OK) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        blkio_unmap_mem_region(s->blkio, &region);
+    }
+}
+
 static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
                                Error **errp)
 {
@@ -490,6 +611,17 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
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
@@ -509,7 +641,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->supported_write_flags = BDRV_REQ_FUA;
+    bs->supported_write_flags = BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;
     bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
                                BDRV_REQ_NO_FALLBACK;
 
@@ -673,6 +805,8 @@ static BlockDriver bdrv_io_uring = {
     .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
     .bdrv_io_unplug             = blkio_io_unplug,
     .bdrv_refresh_limits        = blkio_refresh_limits,
+    .bdrv_register_buf          = blkio_register_buf,
+    .bdrv_unregister_buf        = blkio_unregister_buf,
 };
 
 static BlockDriver bdrv_virtio_blk_vhost_user = {
@@ -713,6 +847,8 @@ static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
     .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
     .bdrv_io_unplug             = blkio_io_unplug,
     .bdrv_refresh_limits        = blkio_refresh_limits,
+    .bdrv_register_buf          = blkio_register_buf,
+    .bdrv_unregister_buf        = blkio_unregister_buf,
 };
 
 static void bdrv_blkio_init(void)
-- 
2.37.2


