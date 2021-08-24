Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1703F5FF7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:13:49 +0200 (CEST)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXBU-0008Gj-1U
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXA6-0005Od-I3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXA1-0005Se-Sl
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tCh430uUATzOwz3ufEzgGlQkzhUTqSj3byRu2/z7X4=;
 b=DskTsVc3cc1nGK1/sXVWp7PWIJz+ggmJfU+Xp0Xmw8usg1rMbzDoiirsLX9G6QzqgHkiIw
 gSgOdp4b4P4lLSvIQ2lNJwnkj6igt/48h0DdEqWct7nhimh/lTe2c26OkRIFSblaPir36B
 DWhyi+PMIQSQbvCseZfXdMLiwrel6KY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-2IiTihoSNkS1wscuq5pugg-1; Tue, 24 Aug 2021 10:12:16 -0400
X-MC-Unique: 2IiTihoSNkS1wscuq5pugg-1
Received: by mail-wm1-f71.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so1317415wmc.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8tCh430uUATzOwz3ufEzgGlQkzhUTqSj3byRu2/z7X4=;
 b=sTYsWD7T1qLAhmoRQKSo03QHn/g//3WNZWHEcvhO20AG1ivj89TIU1QasQhUA/G/Sc
 muiLlbQGFa+DKS+m1D3Fb4WampUVxRNHEE1UVKT514CeEvA79tdSNieR7IFUJa2prrf1
 UL0concmHz0VBmWOtqKpzC9kZsGWUOm52lriDMIADIXCeUcDKBkOkj4E3h8ZRfR9usVT
 eaHX8EAYjxo3VbbXbLyeSJD1+okuWzOZvlEKkupyMVRD+dyiAYYT0ReJ6+pFuAs7kLQe
 PiJyGc9t4wsSfa0xEk0mH+yt3OdmjyKyPENLmuphPSbHwsCjQZz+NLm1Rf07qr62DkeL
 vXjg==
X-Gm-Message-State: AOAM533A4XJ97Nzi6eEEanwR7e+X4i2W4BQhK3iPlstClQQL/GbywLM0
 r3KN01c3njoK+VVbaPhbagpT/DRpimNAqlF1WoQhHYg4ZvZvyuXHAD3Hzu/S7JdxGiAnmqSIfVZ
 uwMGeOw1USy/PXlnPcAbjBrcEMBQka1kc66Pt+LbbCuF26BCFZJ0bF8GuGypbKn8I
X-Received: by 2002:a1c:a9d2:: with SMTP id s201mr4216063wme.81.1629814334726; 
 Tue, 24 Aug 2021 07:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx034ZwJJZpiXZvD7xl4RIZ5xJ7ppmHdks4RVo2uA5G1/qHKrfIzfwU73Itb/koCYTEuAfMYg==
X-Received: by 2002:a1c:a9d2:: with SMTP id s201mr4216014wme.81.1629814334267; 
 Tue, 24 Aug 2021 07:12:14 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 a77sm2581321wmd.31.2021.08.24.07.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Date: Tue, 24 Aug 2021 16:11:39 +0200
Message-Id: <20210824141142.1165291-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently qemu_vfio_dma_map() displays errors on stderr.
When using management interface, this information is simply
lost. Pass qemu_vfio_dma_map() an Error** handle so it can
propagate the error to callers.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Changed:
- Initialize *err before calling error_prepend (Eric Auger)
- use error_reportf_err() in nvme_register_buf()
---
 include/qemu/vfio-helpers.h |  2 +-
 block/nvme.c                | 20 ++++++++++----------
 util/vfio-helpers.c         | 13 +++++++++----
 3 files changed, 20 insertions(+), 15 deletions(-)

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
index 6642c104aa4..663e5d918fa 100644
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
@@ -239,7 +238,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     qemu_co_queue_init(&q->free_req_queue);
     q->completion_bh = aio_bh_new(aio_context, nvme_process_completion_bh, q);
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
-                          false, &prp_list_iova);
+                          false, &prp_list_iova, errp);
     if (r) {
         goto fail;
     }
@@ -533,9 +532,9 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
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
 
@@ -1031,7 +1030,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
 try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
-                              len, true, &iova);
+                              len, true, &iova, NULL);
         if (r == -ENOSPC) {
             /*
              * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
@@ -1523,14 +1522,15 @@ static void nvme_aio_unplug(BlockDriverState *bs)
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
index e7909222cfd..3e1a49bea15 100644
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
@@ -774,6 +776,9 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
         *iova = iova0;
     }
 out:
+    if (ret) {
+        error_setg_errno(errp, -ret, "Cannot map buffer for DMA");
+    }
     return ret;
 }
 
-- 
2.31.1


