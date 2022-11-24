Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A78637D6A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdN-0002jy-77; Thu, 24 Nov 2022 10:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd9-0002VR-3W; Thu, 24 Nov 2022 10:59:15 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd5-0005JT-Kd; Thu, 24 Nov 2022 10:59:14 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 607A641203;
 Thu, 24 Nov 2022 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1669305545; x=1671119946; bh=pXAQF+K2VPh3wKQFgPdhszwcM
 LBaSQYAevMWzwia36Y=; b=aAEbkHNebADmjsiB9QoGIErlS5MshM9QHm69LRk0A
 NblfSPld/QhEQJVwPavghaWtV0xoAwV860l1jwZUE2M+0LEOpv/r5pUSSKRXGsF4
 Y+EocudMq9lZIAcNe528AElAfNwCW74zNFjmW7SRQnDQcaQodBQb6xn+FQTxB3CD
 Es=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qe5NDYxprIEg; Thu, 24 Nov 2022 18:59:05 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4DBAB4014D;
 Thu, 24 Nov 2022 18:59:05 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:59:05 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:59:03 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 5/5] hw/nvme: extend pi pass capable commands
Date: Thu, 24 Nov 2022 18:58:21 +0300
Message-ID: <20221124155821.1501969-6-d.tihov@yadro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124155821.1501969-1-d.tihov@yadro.com>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add protection information block level passthrough support to compare,
dataset management, verify and copy nvme commands.

Signed-off-by: Dmitry Tihov <d.tihov@yadro.com>
---
 hw/nvme/ctrl.c       | 348 +++++++++++++++++++++++++++++++++++++++----
 hw/nvme/trace-events |   2 +
 2 files changed, 325 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c646345bcc..950d773d59 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -197,6 +197,7 @@
 #include "hw/pci/msix.h"
 #include "hw/pci/pcie_sriov.h"
 #include "migration/vmstate.h"
+#include "qemu/memalign.h"
 
 #include "nvme.h"
 #include "dif.h"
@@ -2168,6 +2169,50 @@ out:
     nvme_verify_cb(ctx, ret);
 }
 
+static void nvme_dif_pass_verify_cb(void *opaque, int ret)
+{
+    NvmeBounceContext *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+
+    trace_pci_nvme_dif_pass_verify_cb(nvme_cid(req));
+    if (trace_event_get_state_backends(TRACE_PCI_NVME_DIF_DUMP_PASS_PI)) {
+        nvme_dif_pass_dump(ns, ctx->data.iov.dif.iov_base,
+                           ctx->data.iov.dif.iov_len);
+    }
+
+    if (unlikely(ret == -EILSEQ)) {
+        req->status = nvme_dif_pass_check(ns, ctx->data.bounce,
+                          ctx->data.iov.size, ctx->data.iov.dif.iov_base,
+                          prinfo, slba, reftag);
+        if (req->status) {
+            /* zero out ret to allow req->status passthrough */
+            ret = 0;
+        }
+        goto out;
+    }
+
+    if (ret) {
+        goto out;
+    }
+
+    req->status = nvme_dif_pass_apptag_check(ns, ctx->data.iov.dif.iov_base,
+                      ctx->data.iov.dif.iov_len, prinfo, apptag, appmask);
+
+out:
+    qemu_iovec_destroy_pi(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+    g_free(ctx);
+
+    nvme_rw_complete_cb(req, ret);
+}
+
 struct nvme_compare_ctx {
     struct {
         QEMUIOVector iov;
@@ -2331,6 +2376,83 @@ out:
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_dif_pass_compare_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    size_t mlen = nvme_m2b(ns, nlb);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    struct nvme_compare_ctx *ctx = req->opaque;
+    g_autofree uint8_t *buf = NULL;
+    uint16_t status;
+
+    trace_pci_nvme_dif_pass_compare_cb(nvme_cid(req));
+    if (trace_event_get_state_backends(TRACE_PCI_NVME_DIF_DUMP_PASS_PI)) {
+        nvme_dif_pass_dump(ns, ctx->data.iov.dif.iov_base,
+                           ctx->data.iov.dif.iov_len);
+    }
+
+    if (unlikely(ret == -EILSEQ)) {
+        status = nvme_dif_pass_check(ns, ctx->data.bounce, ctx->data.iov.size,
+                                     ctx->data.iov.dif.iov_base, prinfo, slba,
+                                     reftag);
+        if (status) {
+            /* zero out ret to allow req->status passthrough */
+            ret = 0;
+            req->status = status;
+        }
+        goto out;
+    }
+
+    if (ret) {
+        goto out;
+    }
+
+    status = nvme_dif_pass_apptag_check(ns, ctx->data.iov.dif.iov_base,
+                      ctx->data.iov.dif.iov_len, prinfo, apptag, appmask);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    buf = g_malloc(ctx->data.iov.size);
+    status = nvme_bounce_data(n, buf, ctx->data.iov.size,
+                              NVME_TX_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+    if (memcmp(buf, ctx->data.bounce, ctx->data.iov.size)) {
+        req->status = NVME_CMP_FAILURE;
+        goto out;
+    }
+
+    ctx->mdata.bounce = g_malloc(mlen);
+    status = nvme_bounce_mdata(n, ctx->mdata.bounce, mlen,
+                               NVME_TX_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+    if (memcmp(ctx->mdata.bounce, ctx->data.iov.dif.iov_base, mlen)) {
+        req->status = NVME_CMP_FAILURE;
+    }
+
+out:
+    qemu_iovec_destroy_pi(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+    g_free(ctx);
+
+    nvme_rw_complete_cb(req, ret);
+}
+
 typedef struct NvmeDSMAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
@@ -2395,7 +2517,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         goto done;
     }
 
-    if (!ns->lbaf.ms) {
+    if (!ns->lbaf.ms || ns->pip) {
         nvme_dsm_cb(iocb, 0);
         return;
     }
@@ -2556,19 +2678,35 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    ctx = g_new0(NvmeBounceContext, 1);
-    ctx->req = req;
+    if (ns->pip) {
+        ctx = g_new0(NvmeBounceContext, 1);
+        ctx->req = req;
 
-    ctx->data.bounce = g_malloc(len);
+        ctx->data.bounce = qemu_memalign(qemu_real_host_page_size(), len);
 
-    qemu_iovec_init(&ctx->data.iov, 1);
-    qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, len);
+        qemu_iovec_init_pi(&ctx->data.iov, 1, nlb);
+        qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, len);
 
-    block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
-                     BLOCK_ACCT_READ);
+        block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
+                         BLOCK_ACCT_READ);
+
+        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+                                    nvme_dif_pass_verify_cb, ctx);
+    } else {
+        ctx = g_new0(NvmeBounceContext, 1);
+        ctx->req = req;
+
+        ctx->data.bounce = g_malloc(len);
+
+        qemu_iovec_init(&ctx->data.iov, 1);
+        qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, len);
+
+        block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
+                         BLOCK_ACCT_READ);
 
-    req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
-                                nvme_verify_mdata_in_cb, ctx);
+        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+                                    nvme_verify_mdata_in_cb, ctx);
+    }
     return NVME_NO_COMPLETE;
 }
 
@@ -2625,7 +2763,11 @@ static void nvme_copy_bh(void *opaque)
         req->cqe.result = cpu_to_le32(iocb->idx);
     }
 
-    qemu_iovec_destroy(&iocb->iov);
+    if (ns->pip) {
+        qemu_iovec_destroy_pi(&iocb->iov);
+    } else {
+        qemu_iovec_destroy(&iocb->iov);
+    }
     g_free(iocb->bounce);
 
     qemu_bh_delete(iocb->bh);
@@ -2737,10 +2879,29 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
     uint32_t nlb;
+    uint16_t status;
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, NULL,
                                  &nlb, NULL, NULL, NULL);
 
+    if (ns->pip) {
+        if (iocb->iov.dif.iov_len) {
+            NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+            uint64_t slba = le64_to_cpu(copy->sdlba);
+            uint16_t prinfo = ((copy->control[2] >> 2) & 0xf);
+            size_t len = nvme_l2b(ns, nlb);
+            if (unlikely(ret == -EILSEQ)) {
+                status = nvme_dif_pass_check(ns, iocb->bounce, len,
+                             iocb->iov.dif.iov_base, prinfo, slba,
+                             iocb->reftag);
+                if (status) {
+                    goto invalid;
+                }
+            }
+        }
+
+        iocb->reftag += nlb;
+    }
     if (ret < 0) {
         iocb->ret = ret;
         goto out;
@@ -2754,8 +2915,17 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
 
     iocb->idx++;
     iocb->slba += nlb;
+
 out:
     nvme_copy_cb(iocb, iocb->ret);
+    return;
+
+invalid:
+    req->status = status;
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
 }
 
 static void nvme_copy_out_cb(void *opaque, int ret)
@@ -2900,6 +3070,99 @@ out:
     nvme_copy_cb(iocb, ret);
 }
 
+static void nvme_dif_pass_copy_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
+    uint16_t prinfow = ((copy->control[2] >> 2) & 0xf);
+    uint32_t nlb;
+    size_t len;
+    uint16_t status;
+    uint64_t slba;
+    uint16_t apptag;
+    uint16_t appmask;
+    uint64_t reftag;
+
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
+                                 &nlb, &apptag, &appmask, &reftag);
+    len = nvme_l2b(ns, nlb);
+
+    if (unlikely(ret == -EILSEQ)) {
+        status = nvme_dif_pass_check(ns, iocb->bounce, len,
+                                     iocb->iov.dif.iov_base, prinfor, slba,
+                                     reftag);
+        if (status) {
+            goto invalid;
+        }
+    }
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto out;
+    } else if (iocb->ret < 0) {
+        goto out;
+    }
+
+    status = nvme_dif_pass_apptag_check(ns, iocb->iov.dif.iov_base,
+                                        nvme_m2b(ns, nlb), prinfor, apptag,
+                                        appmask);
+    if (status) {
+        goto invalid;
+    }
+
+    status = nvme_check_prinfo(ns, prinfow, iocb->slba, iocb->reftag);
+    if (status) {
+        goto invalid;
+    }
+    status = nvme_check_bounds(ns, iocb->slba, nlb);
+    if (status) {
+        goto invalid;
+    }
+
+    if (ns->params.zoned) {
+        status = nvme_check_zone_write(ns, iocb->zone, iocb->slba, nlb);
+        if (status) {
+            goto invalid;
+        }
+
+        iocb->zone->w_ptr += nlb;
+    }
+
+    if (prinfow & NVME_PRINFO_PRACT) {
+        qemu_iovec_reset(&iocb->iov);
+        qemu_iovec_add(&iocb->iov, iocb->bounce, len);
+    } else {
+        appmask = le16_to_cpu(copy->appmask);
+        apptag = le16_to_cpu(copy->apptag);
+        status = nvme_dif_pass_apptag_check(ns, iocb->iov.dif.iov_base,
+                                            nvme_m2b(ns, nlb), prinfow, apptag,
+                                            appmask);
+        if (status) {
+            goto invalid;
+        }
+    }
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, iocb->slba),
+                                  &iocb->iov, 0, nvme_copy_out_completed_cb,
+                                  iocb);
+
+    return;
+
+invalid:
+    req->status = status;
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
+
+    return;
+
+out:
+    nvme_copy_cb(iocb, ret);
+}
+
 static void nvme_copy_in_cb(void *opaque, int ret)
 {
     NvmeCopyAIOCB *iocb = opaque;
@@ -2943,6 +3206,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     NvmeNamespace *ns = req->ns;
     uint64_t slba;
     uint32_t nlb;
+    uint64_t reftag;
     size_t len;
     uint16_t status;
 
@@ -2958,7 +3222,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     }
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
-                                 &nlb, NULL, NULL, NULL);
+                                 &nlb, NULL, NULL, &reftag);
     len = nvme_l2b(ns, nlb);
 
     trace_pci_nvme_copy_source_range(slba, nlb);
@@ -2990,8 +3254,21 @@ static void nvme_copy_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce, len);
 
-    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
-                                 &iocb->iov, 0, nvme_copy_in_cb, iocb);
+    if (ns->pip) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+        uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
+        status = nvme_check_prinfo(ns, prinfor, slba, reftag);
+        if (status) {
+            goto invalid;
+        }
+        iocb->iov.dif.iov_len = nvme_m2b(ns, nlb);
+        iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
+                                     &iocb->iov, 0, nvme_dif_pass_copy_cb,
+                                     iocb);
+    } else {
+        iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
+                                     &iocb->iov, 0, nvme_copy_in_cb, iocb);
+    }
     return;
 
 invalid:
@@ -3078,11 +3355,19 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     iocb->idx = 0;
     iocb->reftag = le32_to_cpu(copy->reftag);
     iocb->reftag |= (uint64_t)le32_to_cpu(copy->cdw3) << 32;
-    iocb->bounce = g_malloc_n(le16_to_cpu(ns->id_ns.mssrl),
-                              ns->lbasz + ns->lbaf.ms);
 
     qemu_iovec_init(&iocb->iov, 1);
 
+    if (ns->pip) {
+        qemu_iovec_init_pi(&iocb->iov, 1, le16_to_cpu(ns->id_ns.mssrl));
+        iocb->bounce = qemu_memalign(qemu_real_host_page_size(),
+                                     le16_to_cpu(ns->id_ns.mssrl) * ns->lbasz);
+    } else {
+        qemu_iovec_init(&iocb->iov, 1);
+        iocb->bounce = g_malloc_n(le16_to_cpu(ns->id_ns.mssrl),
+                                  ns->lbasz + ns->lbaf.ms);
+    }
+
     block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.read, 0,
                      BLOCK_ACCT_READ);
     block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.write, 0,
@@ -3145,18 +3430,31 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
         return status;
     }
 
-    ctx = g_new(struct nvme_compare_ctx, 1);
-    ctx->data.bounce = g_malloc(data_len);
+    if (ns->pip) {
+        ctx = g_new0(struct nvme_compare_ctx, 1);
+        ctx->data.bounce = qemu_memalign(qemu_real_host_page_size(), data_len);
+
+        req->opaque = ctx;
 
-    req->opaque = ctx;
+        qemu_iovec_init_pi(&ctx->data.iov, 1, nlb);
+        qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, data_len);
+        block_acct_start(blk_get_stats(blk), &req->acct, data_len,
+                         BLOCK_ACCT_READ);
+        req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
+                                    nvme_dif_pass_compare_cb, req);
+    } else {
+        ctx = g_new(struct nvme_compare_ctx, 1);
+        ctx->data.bounce = g_malloc(data_len);
 
-    qemu_iovec_init(&ctx->data.iov, 1);
-    qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, data_len);
+        req->opaque = ctx;
 
-    block_acct_start(blk_get_stats(blk), &req->acct, data_len,
-                     BLOCK_ACCT_READ);
-    req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
-                                nvme_compare_data_cb, req);
+        qemu_iovec_init(&ctx->data.iov, 1);
+        qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, data_len);
+        block_acct_start(blk_get_stats(blk), &req->acct, data_len,
+                         BLOCK_ACCT_READ);
+        req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
+                                    nvme_compare_data_cb, req);
+    }
 
     return NVME_NO_COMPLETE;
 }
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 259fa8ffa2..42c171ed72 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -41,12 +41,14 @@ pci_nvme_copy_out(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_verify(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_verify_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_verify_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_pass_verify_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_rw_complete_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint32_t nr, uint32_t attr) "nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint64_t slba, uint32_t nlb) "slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl) "nlb %"PRIu32" dmrsl %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_dif_pass_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_compare_data_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_compare_mdata_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
-- 
2.38.1


