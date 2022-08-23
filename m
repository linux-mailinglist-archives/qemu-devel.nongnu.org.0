Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373259CB6A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:28:22 +0200 (CEST)
Received: from localhost ([::1]:52072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQFu9-00084r-4Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqR-0001dB-DP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqP-0004ai-CU
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35+5La3uFg1fCLNHdu+nIiQ9CxD1kv3EB5WgePqet3A=;
 b=MRSmm0ajzaIIvmQUVzjIv9pr0hJvbZOmVW+q+q9dTe1AFczI7+wbd5dwzoeFm9WawvDYzs
 a7TgGd2pJqcbp0Y1smFWc/Oqc4qnODWLkg/BkoXVait6mx04aZDkrsGO3d7kwm2WOBTDYd
 kxh8kmZH2ubrlsShLll3sM5oTDu3NIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-wlae_vcpMWmp2cRGmRFDXw-1; Mon, 22 Aug 2022 18:24:22 -0400
X-MC-Unique: wlae_vcpMWmp2cRGmRFDXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB45D3C0D842;
 Mon, 22 Aug 2022 22:24:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47967141511A;
 Mon, 22 Aug 2022 22:24:21 +0000 (UTC)
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
Subject: [RFC v4 06/11] block: return errors from bdrv_register_buf()
Date: Mon, 22 Aug 2022 18:23:57 -0400
Message-Id: <20220822222402.176088-7-stefanha@redhat.com>
In-Reply-To: <20220822222402.176088-1-stefanha@redhat.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
index de04594299..1c3392c7f6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3307,17 +3307,45 @@ void bdrv_io_unplug(BlockDriverState *bs)
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
index b8a8818ddb..3f2927f5b4 100644
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
2.37.2


