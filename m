Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918A5F707E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:44:12 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYf5-0000u1-JV
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWp-0003HR-9x
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWn-0006pY-Ba
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Yqa58k2WOoeJ6eDR3PCO4tmEWspVj546QT1YwQnLuw=;
 b=Z9d4W7WPjZWNsp5xfZc1F9QfdxMhhkdsGnLfdtwiqt08i2vsQrlaeDUoiWjghgLIoKTOnJ
 XD1EfKMDyw6iA+26EKQl8mOaXxhyZrUK8lLfJgFxdSTplheZ4v+FpoXXnJz1dgaCX3RpB5
 R8c27SwsDlGrFH0yubduvwAVTWiuc3U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-z7qyZay6NCutJcXsULl5Fg-1; Thu, 06 Oct 2022 17:35:30 -0400
X-MC-Unique: z7qyZay6NCutJcXsULl5Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 941C785D192;
 Thu,  6 Oct 2022 21:35:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA8D99D493;
 Thu,  6 Oct 2022 21:35:28 +0000 (UTC)
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
Subject: [PATCH v6 07/13] block: return errors from bdrv_register_buf()
Date: Thu,  6 Oct 2022 17:35:01 -0400
Message-Id: <20221006213507.645402-8-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Registering an I/O buffer is only a performance optimization hint but it
is still necessary to return errors when it fails.

Later patches will need to detect errors when registering buffers but an
immediate advantage is that error_report() calls are no longer needed in
block driver .bdrv_register_buf() functions.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-global-state.h          |  5 ++-
 include/block/block_int-common.h            |  5 ++-
 include/sysemu/block-backend-global-state.h |  2 +-
 block/block-backend.c                       |  4 +--
 block/io.c                                  | 34 +++++++++++++++++++--
 block/nvme.c                                | 18 +++++------
 qemu-img.c                                  |  2 +-
 7 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 7901f35863..eba4ed23b4 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -246,8 +246,11 @@ void bdrv_del_child(BlockDriverState *parent, BdrvChild *child, Error **errp);
  *
  * Buffers must not overlap and they must be unregistered with the same <host,
  * size> values that they were registered with.
+ *
+ * Returns: true on success, false on failure
  */
-void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size);
+bool bdrv_register_buf(BlockDriverState *bs, void *host, size_t size,
+                       Error **errp);
 void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size);
 
 void bdrv_cancel_in_flight(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 19798d0e77..9c569be162 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -433,8 +433,11 @@ struct BlockDriver {
      * that it can do IOMMU mapping with VFIO etc., in order to get better
      * performance. In the case of VFIO drivers, this callback is used to do
      * DMA mapping for hot buffers.
+     *
+     * Returns: true on success, false on failure
      */
-    void (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size);
+    bool (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size,
+                              Error **errp);
     void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host, size_t size);
 
     /*
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 97f7dad2c3..6858e39cb6 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -106,7 +106,7 @@ void blk_io_limits_enable(BlockBackend *blk, const char *group);
 void blk_io_limits_update_group(BlockBackend *blk, const char *group);
 void blk_set_force_allow_inactivate(BlockBackend *blk);
 
-void blk_register_buf(BlockBackend *blk, void *host, size_t size);
+bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp);
 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size);
 
 const BdrvChild *blk_root(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index 99141f8f06..34399d3b7b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2545,10 +2545,10 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
     }
 }
 
-void blk_register_buf(BlockBackend *blk, void *host, size_t size)
+bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)
 {
     GLOBAL_STATE_CODE();
-    bdrv_register_buf(blk_bs(blk), host, size);
+    return bdrv_register_buf(blk_bs(blk), host, size, errp);
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
diff --git a/block/io.c b/block/io.c
index 1d7220a68f..fe25ef6e82 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3277,17 +3277,45 @@ void bdrv_io_unplug(BlockDriverState *bs)
     }
 }
 
-void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
+/* Helper that undoes bdrv_register_buf() when it fails partway through */
+static void bdrv_register_buf_rollback(BlockDriverState *bs,
+                                       void *host,
+                                       size_t size,
+                                       BdrvChild *final_child)
+{
+    BdrvChild *child;
+
+    QLIST_FOREACH(child, &bs->children, next) {
+        if (child == final_child) {
+            break;
+        }
+
+        bdrv_unregister_buf(child->bs, host, size);
+    }
+
+    if (bs->drv && bs->drv->bdrv_unregister_buf) {
+        bs->drv->bdrv_unregister_buf(bs, host, size);
+    }
+}
+
+bool bdrv_register_buf(BlockDriverState *bs, void *host, size_t size,
+                       Error **errp)
 {
     BdrvChild *child;
 
     GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_register_buf) {
-        bs->drv->bdrv_register_buf(bs, host, size);
+        if (!bs->drv->bdrv_register_buf(bs, host, size, errp)) {
+            return false;
+        }
     }
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_register_buf(child->bs, host, size);
+        if (!bdrv_register_buf(child->bs, host, size, errp)) {
+            bdrv_register_buf_rollback(bs, host, size, child);
+            return false;
+        }
     }
+    return true;
 }
 
 void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
diff --git a/block/nvme.c b/block/nvme.c
index 696502acea..1e76fe21d3 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1577,19 +1577,19 @@ static void nvme_aio_unplug(BlockDriverState *bs)
     }
 }
 
-static void nvme_register_buf(BlockDriverState *bs, void *host, size_t size)
+static bool nvme_register_buf(BlockDriverState *bs, void *host, size_t size,
+                              Error **errp)
 {
     int ret;
-    Error *local_err = NULL;
     BDRVNVMeState *s = bs->opaque;
 
-    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL, &local_err);
-    if (ret) {
-        /* FIXME: we may run out of IOVA addresses after repeated
-         * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_dma_unmap
-         * doesn't reclaim addresses for fixed mappings. */
-        error_reportf_err(local_err, "nvme_register_buf failed: ");
-    }
+    /*
+     * FIXME: we may run out of IOVA addresses after repeated
+     * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_dma_unmap
+     * doesn't reclaim addresses for fixed mappings.
+     */
+    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL, errp);
+    return ret == 0;
 }
 
 static void nvme_unregister_buf(BlockDriverState *bs, void *host, size_t size)
diff --git a/qemu-img.c b/qemu-img.c
index 1dd5efe840..1ae1c5648e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4567,7 +4567,7 @@ static int img_bench(int argc, char **argv)
     data.buf = blk_blockalign(blk, buf_size);
     memset(data.buf, pattern, data.nrreq * data.bufsize);
 
-    blk_register_buf(blk, data.buf, buf_size);
+    blk_register_buf(blk, data.buf, buf_size, &error_fatal);
 
     data.qiov = g_new(QEMUIOVector, data.nrreq);
     for (i = 0; i < data.nrreq; i++) {
-- 
2.37.3


