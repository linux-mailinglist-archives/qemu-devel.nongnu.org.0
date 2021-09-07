Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2A402507
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:21:36 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWMJ-0008NX-G0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFR-0004vI-Fm
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFO-0005q8-Pe
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HQiZUpQzhTafhnBU6B6Q8PRTOlVoSxJAHMWZjU5/K0=;
 b=M+Jsc037r+dhWvNOxR6hYLMBmP4VKBU150uXSZSEdBRF4kjQdWjoipcW7ZJo3/qOtHLua0
 SgmNoc1wwbJHgPZDEtA7jwelZQIp/SRkUAA0aoYlf3ngnT+u1R5cjns8CvYbZ31lJhv8/y
 9ncWtxeCc7hDmC5cUlEQ+WOTq4c/+EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-2Pkiad-4PySQlHBoWMGU1Q-1; Tue, 07 Sep 2021 04:14:23 -0400
X-MC-Unique: 2Pkiad-4PySQlHBoWMGU1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A192F8464CE;
 Tue,  7 Sep 2021 08:14:15 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3367760C05;
 Tue,  7 Sep 2021 08:14:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Date: Tue,  7 Sep 2021 09:13:58 +0100
Message-Id: <20210907081403.816404-7-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Currently qemu_vfio_dma_map() displays errors on stderr.
When using management interface, this information is simply
lost. Pass qemu_vfio_dma_map() an Error** handle so it can
propagate the error to callers.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-7-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/vfio-helpers.h |  2 +-
 block/nvme.c                | 22 +++++++++++-----------
 util/vfio-helpers.c         | 10 ++++++----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
index 4491c8e1a6..bde9495b25 100644
--- a/include/qemu/vfio-helpers.h
+++ b/include/qemu/vfio-helpers.h
@@ -18,7 +18,7 @@ typedef struct QEMUVFIOState QEMUVFIOState;
 QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp);
 void qemu_vfio_close(QEMUVFIOState *s);
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
-                      bool temporary, uint64_t *iova_list);
+                      bool temporary, uint64_t *iova_list, Error **errp);
 int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s);
 void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host);
 void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index,
diff --git a/block/nvme.c b/block/nvme.c
index 0786c501e4..80546b0bab 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -176,12 +176,11 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
         return false;
     }
     memset(q->queue, 0, bytes);
-    r = qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova);
+    r = qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova, errp);
     if (r) {
-        error_setg(errp, "Cannot map queue");
-        return false;
+        error_prepend(errp, "Cannot map queue: ");
     }
-    return true;
+    return r == 0;
 }
 
 static void nvme_free_queue_pair(NVMeQueuePair *q)
@@ -239,9 +238,9 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     qemu_co_queue_init(&q->free_req_queue);
     q->completion_bh = aio_bh_new(aio_context, nvme_process_completion_bh, q);
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
-                          false, &prp_list_iova);
+                          false, &prp_list_iova, errp);
     if (r) {
-        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
+        error_prepend(errp, "Cannot map buffer for DMA: ");
         goto fail;
     }
     q->free_req_head = -1;
@@ -534,9 +533,9 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
         error_setg(errp, "Cannot allocate buffer for identify response");
         goto out;
     }
-    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
+    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova, errp);
     if (r) {
-        error_setg(errp, "Cannot map buffer for DMA");
+        error_prepend(errp, "Cannot map buffer for DMA: ");
         goto out;
     }
 
@@ -1032,7 +1031,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
 try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
-                              len, true, &iova);
+                              len, true, &iova, NULL);
         if (r == -ENOSPC) {
             /*
              * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
@@ -1524,14 +1523,15 @@ static void nvme_aio_unplug(BlockDriverState *bs)
 static void nvme_register_buf(BlockDriverState *bs, void *host, size_t size)
 {
     int ret;
+    Error *local_err = NULL;
     BDRVNVMeState *s = bs->opaque;
 
-    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL);
+    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL, &local_err);
     if (ret) {
         /* FIXME: we may run out of IOVA addresses after repeated
          * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_dma_unmap
          * doesn't reclaim addresses for fixed mappings. */
-        error_report("nvme_register_buf failed: %s", strerror(-ret));
+        error_reportf_err(local_err, "nvme_register_buf failed: ");
     }
 }
 
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index e7909222cf..77cdec845d 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -463,13 +463,15 @@ static void qemu_vfio_ram_block_added(RAMBlockNotifier *n, void *host,
                                       size_t size, size_t max_size)
 {
     QEMUVFIOState *s = container_of(n, QEMUVFIOState, ram_notifier);
+    Error *local_err = NULL;
     int ret;
 
     trace_qemu_vfio_ram_block_added(s, host, max_size);
-    ret = qemu_vfio_dma_map(s, host, max_size, false, NULL);
+    ret = qemu_vfio_dma_map(s, host, max_size, false, NULL, &local_err);
     if (ret) {
-        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, max_size,
-                     strerror(-ret));
+        error_reportf_err(local_err,
+                          "qemu_vfio_dma_map(%p, %zu) failed: ",
+                          host, max_size);
     }
 }
 
@@ -725,7 +727,7 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
  * mapping status within this area is not allowed).
  */
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
-                      bool temporary, uint64_t *iova)
+                      bool temporary, uint64_t *iova, Error **errp)
 {
     int ret = 0;
     int index;
-- 
2.31.1


