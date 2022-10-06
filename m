Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA705F7087
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:48:52 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYjb-00060v-QH
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWz-0003J0-HO
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWw-0006w2-ND
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xyQ3dNcj+VIHXj8KVmFi/+Zy4OsKueHp9mB73k0+zw=;
 b=RFO/03KtwsSUjy8Cqi8oxK2aU4DU5i4COUswOKRl/lIfJaO/+3KGZu+CzGTTys+U8M/Bhs
 mQ8AaYYpVTtkPgI1IwFl1aOm0oxcVLM7XXoW7aoeBx3Wr12JDw5BdjKC8/n4obYynoTw+W
 jZXIWOH00fQBNjrQZucMYu63NgoAqHQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-vdKRpJwHMNqqa15WvT47uQ-1; Thu, 06 Oct 2022 17:35:42 -0400
X-MC-Unique: vdKRpJwHMNqqa15WvT47uQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D9FB811E67;
 Thu,  6 Oct 2022 21:35:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C774B535939;
 Thu,  6 Oct 2022 21:35:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 12/13] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Date: Thu,  6 Oct 2022 17:35:06 -0400
Message-Id: <20221006213507.645402-13-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/blkio.c | 183 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 3 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index 9a79789a39..5ce61d5d94 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -11,9 +11,13 @@
 #include "qemu/osdep.h"
 #include <blkio.h>
 #include "block/block_int.h"
+#include "exec/memory.h"
+#include "exec/cpu-common.h" /* for qemu_ram_get_fd() */
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
+#include "exec/memory.h" /* for ram_block_discard_disable() */
 
 /*
  * Keep the QEMU BlockDriver names identical to the libblkio driver names.
@@ -73,6 +77,12 @@ typedef struct {
 
     /* Can we skip adding/deleting blkio_mem_regions? */
     bool needs_mem_regions;
+
+    /* Are file descriptors necessary for blkio_mem_regions? */
+    bool needs_mem_region_fd;
+
+    /* Are madvise(MADV_DONTNEED)-style operations unavailable? */
+    bool mem_regions_pinned;
 } BDRVBlkioState;
 
 /* Called with s->bounce_lock held */
@@ -347,7 +357,8 @@ blkio_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
         .coroutine = qemu_coroutine_self(),
     };
     BDRVBlkioState *s = bs->opaque;
-    bool use_bounce_buffer = s->needs_mem_regions;
+    bool use_bounce_buffer =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     BlkioBounceBuf bounce;
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
@@ -390,7 +401,8 @@ static int coroutine_fn blkio_co_pwritev(BlockDriverState *bs, int64_t offset,
         .coroutine = qemu_coroutine_self(),
     };
     BDRVBlkioState *s = bs->opaque;
-    bool use_bounce_buffer = s->needs_mem_regions;
+    bool use_bounce_buffer =
+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
     BlkioBounceBuf bounce;
     struct iovec *iov = qiov->iov;
     int iovcnt = qiov->niov;
@@ -473,6 +485,130 @@ static void blkio_io_unplug(BlockDriverState *bs)
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
+    /*
+     * Mapping memory regions conflicts with RAM discard (virtio-mem) when
+     * there is pinning, so only do it when necessary.
+     */
+    if (!s->needs_mem_regions && s->mem_regions_pinned) {
+        return true;
+    }
+
+    region_result = blkio_mem_region_from_host(bs, host, size, &region, errp);
+    if (region_result == BMRR_SKIP) {
+        return true;
+    } else if (region_result != BMRR_OK) {
+        return false;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
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
+    /* See blkio_register_buf() */
+    if (!s->needs_mem_regions && s->mem_regions_pinned) {
+        return;
+    }
+
+    if (blkio_mem_region_from_host(bs, host, size, &region, NULL) != BMRR_OK) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkio_unmap_mem_region(s->blkio, &region);
+    }
+}
+
 static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
                                Error **errp)
 {
@@ -609,6 +745,17 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
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
@@ -620,15 +767,39 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    ret = blkio_get_bool(s->blkio,
+                         "mem-regions-pinned",
+                         &s->mem_regions_pinned);
+    if (ret < 0) {
+        /* Be conservative (assume pinning) if the property is not supported */
+        s->mem_regions_pinned = s->needs_mem_regions;
+    }
+
+    /*
+     * Notify if libblkio drivers pin memory and prevent features like
+     * virtio-mem from working.
+     */
+    if (s->mem_regions_pinned) {
+        ret = ram_block_discard_disable(true);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "ram_block_discard_disable() failed");
+            blkio_destroy(&s->blkio);
+            return ret;
+        }
+    }
+
     ret = blkio_start(s->blkio);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "blkio_start failed: %s",
                          blkio_get_error_msg());
         blkio_destroy(&s->blkio);
+        if (s->mem_regions_pinned) {
+            ram_block_discard_disable(false);
+        }
         return ret;
     }
 
-    bs->supported_write_flags = BDRV_REQ_FUA;
+    bs->supported_write_flags = BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;
     bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
                                BDRV_REQ_NO_FALLBACK;
 
@@ -652,6 +823,10 @@ static void blkio_close(BlockDriverState *bs)
     qemu_mutex_destroy(&s->blkio_lock);
     blkio_detach_aio_context(bs);
     blkio_destroy(&s->blkio);
+
+    if (s->mem_regions_pinned) {
+        ram_block_discard_disable(false);
+    }
 }
 
 static int64_t blkio_getlength(BlockDriverState *bs)
@@ -798,6 +973,8 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .bdrv_co_pwrite_zeroes   = blkio_co_pwrite_zeroes, \
         .bdrv_io_unplug          = blkio_io_unplug, \
         .bdrv_refresh_limits     = blkio_refresh_limits, \
+        .bdrv_register_buf       = blkio_register_buf, \
+        .bdrv_unregister_buf     = blkio_unregister_buf, \
         __VA_ARGS__ \
     }
 
-- 
2.37.3


