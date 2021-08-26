Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B813F8F49
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:55:35 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLTJ-0005Y5-SK
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOj-0005i2-U4
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOg-0003Ah-Fm
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNKmqePd9nD6kB4TAflUms7TAcM03nxgZUc5G0laZ78=;
 b=Xj1nNq3zoitcmiGPs0aYRUPBEN5t9MQGj+DZ1Owv/QdNluhNtbcoQn3fm+P+EFvlvt0jt4
 XTIrLoKCJzn5+17Gm1l0kzrL4cA/2Bo4lw9RVpV0CMlJ+fq2uRuDMPMCCuow44gsBBnq2P
 9xVyvQZ+JkJ4J75hAe9DWgYAhBTD7Wc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-hm7fiXMXMEGgWnVH8_XkfA-1; Thu, 26 Aug 2021 15:50:44 -0400
X-MC-Unique: hm7fiXMXMEGgWnVH8_XkfA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a13-20020adfed0d000000b00156fd70137aso1209984wro.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNKmqePd9nD6kB4TAflUms7TAcM03nxgZUc5G0laZ78=;
 b=f4h2zcsXPPsfUaJb15Gycyi/Eb7hoQ/a5s+qhzW4xGjagGud1uXXO/8E6le9MSLkrD
 pPoNOHaYYSNyYq1Gvn8DjE9tCX7e3CypjY3ALL8Yv4yg6fYl8L6aEF5ZobJDgW6LIqrl
 TL4h9e000bduEeypD3DBBDu+W2rFMOhx9Ssg5PyYxhXY+4ZSSEgci7SUvQ5E9sqxzv9H
 oaq8PIDciVdb0w3gayWKPLA2p6Bl/C3BnW3opPohPc0DPzTtWrY617HRpGzLIRrxA+Wz
 CoVhhga6d1cZ62FF8VfmFrHJ3KrBJsj7s6tXWRrpPPZIwvUD/0cC5iHXoHhRHnqJIh0p
 Ei2w==
X-Gm-Message-State: AOAM530xT2YvUC2oxIzLexkFOLGRfTKot1aNEc5WEcSe4X1CWw7JpLrQ
 40806d/ztvdfmrsY8SYfRE05/Lh5gl9L6/KER3kDNnN0Ws9inY17RktBGy0FpQtq3y0K3Wno1ns
 XBcxx0N3f2NlObSfLVI7SevI++Tjiu3RNekLb1OEVqJq5hjWluq+bHcZailU1P0UA
X-Received: by 2002:a1c:20d7:: with SMTP id
 g206mr16487950wmg.153.1630007442903; 
 Thu, 26 Aug 2021 12:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4ikk6NdIGdn/N8EhcUbRj/Guyxy9oh+MatSjdS8sHMUKZllpGQe5cK/7HvtJCbRZ8YDmYMA==
X-Received: by 2002:a1c:20d7:: with SMTP id
 g206mr16487927wmg.153.1630007442694; 
 Thu, 26 Aug 2021 12:50:42 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m4sm9324912wml.28.2021.08.26.12.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Date: Thu, 26 Aug 2021 21:50:09 +0200
Message-Id: <20210826195014.2180369-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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


