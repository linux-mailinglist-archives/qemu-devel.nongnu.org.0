Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D13FE9B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:06:40 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgo2-0000q6-Qd
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgia-0000g5-Dx
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiX-0008Bk-J9
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c0du9Xr//PiqvpruelRCxIATbcKBoWU0kKahzJtsSiw=;
 b=Q6NNduC2mTv9bzPUXsUFlEhb8vIvRJf/1cEe9r3Kxy0r60hu7I1HIHRsFFPZ8XjNCFdETr
 NP0MJaqw2M3D/zQajCtgWItPD+kvg9Ul7DVtOhgUK7vuMTeVCjX8MT+AB25jwy4LAeyimM
 yh2GkI3HDg3ZsRgrLd+gf45xdrNcMss=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-tw8g92G-MdOCSMgtXDELlQ-1; Thu, 02 Sep 2021 03:00:56 -0400
X-MC-Unique: tw8g92G-MdOCSMgtXDELlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so326601wme.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0du9Xr//PiqvpruelRCxIATbcKBoWU0kKahzJtsSiw=;
 b=ZFwVl139hkUzZHgI3n3pmi2qm6bUvg4lrYKE10El6e4Yz67MP1pYYF/b5g9Bktc9V4
 A6hJKi3P9GhOIVVk58DEFQSHzg+RKogXk8s19xaoSwqgyZjCt7kuG9rWnxJYaZmP6y/0
 jKBx0ANhY/EoRo+ekh64GmOPg/YlQTcH8BYCUVyXltfU8Kpa9dnOCnKgKxAJZXWe2KmW
 yC0qFWXpwYoQHWXFLG0GOlTEXbHPsSBh4nPrffSNDm3Bso+avvrwkUP5vz/Hi5PmbC88
 JEkBFxEeD6ZD4AlgaoirBdobUy9KNtb/D/LIGnRv1F8qUlBslYR6a6JfEtXlnxNiO9r4
 qrtQ==
X-Gm-Message-State: AOAM532EuObYpXb/ZXPzq5kHgVmjwU3R4Gz7/5krLm+32mdOFuP2blpX
 XcY9H1xoqXG5NOnAzo18//aodwl43L1c3BPHGQ6iAuMtEPdcnsJb2xRQOv7iPYvnp2zcuPXY7TM
 F8D37NLNN4ce6HuajpSh+bzKvLb+bDbQVKiHijIM62uuMkwTY5NDPZoZSbGWNn/lo
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr1527102wml.142.1630566054571; 
 Thu, 02 Sep 2021 00:00:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylnNN/kJdKCFAkAkGLauU+WQ+QrSGYfCJTQNHnYqVmFdVDVivjhcWGpNRzX1TYhGLlyxxjaA==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr1527073wml.142.1630566054301; 
 Thu, 02 Sep 2021 00:00:54 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u25sm787473wmj.10.2021.09.02.00.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Date: Thu,  2 Sep 2021 09:00:20 +0200
Message-Id: <20210902070025.197072-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently qemu_vfio_dma_map() displays errors on stderr.
When using management interface, this information is simply
lost. Pass qemu_vfio_dma_map() an Error** handle so it can
propagate the error to callers.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/vfio-helpers.h |  2 +-
 block/nvme.c                | 22 +++++++++++-----------
 util/vfio-helpers.c         | 10 ++++++----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
index 4491c8e1a6e..bde9495b254 100644
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
index 0786c501e46..80546b0babd 100644
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
index e7909222cfd..77cdec845d9 100644
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


