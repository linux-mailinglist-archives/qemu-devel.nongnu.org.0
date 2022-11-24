Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222B637D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdL-0002im-4m; Thu, 24 Nov 2022 10:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd7-0002Sa-IE; Thu, 24 Nov 2022 10:59:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd3-0005Iu-Mj; Thu, 24 Nov 2022 10:59:13 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 69BE341209;
 Thu, 24 Nov 2022 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1669305544; x=1671119945; bh=PeK7GEWSt4ex34y1OeCRvDLCe
 Au0hEUvqmhyVLMM5mU=; b=oFaAXMnzbYdlNx4Ox9NLE9QuY/1iSET2cAlkJ32Cy
 LHRUxknlANMTm4o2Ca5tUozhLcz76xKoqRAupXk6se/0wfFH44QtAdfZxXliSsOT
 wT8RAQcYEAr2Kr4UY5GH4C+UkfdI+aBBcd1cTC18xIlRNWg89W/jILguG+QZQHRB
 E0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8f3lHSOos6H; Thu, 24 Nov 2022 18:59:04 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (T-EXCH-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 20C4041203;
 Thu, 24 Nov 2022 18:59:04 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:59:03 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:59:02 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 4/5] hw/nvme: implement pi pass read/write/wrz commands
Date: Thu, 24 Nov 2022 18:58:20 +0300
Message-ID: <20221124155821.1501969-5-d.tihov@yadro.com>
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

This patch adds ability for read, write and write zeroes commands
to submit single request with data and integrity directly to underlying
device using block-level transfer of protection information. Block
level supports only type1/type3 protection types and for the type1
protection type guard/reftag are always checked, while for the type3
protection type guardtag is always checked. This way NVME PRCHK field
can not be used to disable checking of guard/reftag properly, so error
from block level is caught and reported for cases of unset 02/00 bits
in PRCHK and invalid guard/reftag. Also, because apptag is never
checked by block devices, check it explicitly in case of set 01 bit in
PRCHK.

Signed-off-by: Dmitry Tihov <d.tihov@yadro.com>
---
 hw/nvme/ctrl.c       |  13 +-
 hw/nvme/dif.c        | 303 +++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/dif.h        |  18 +++
 hw/nvme/trace-events |   4 +
 4 files changed, 335 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..c646345bcc 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2045,7 +2045,7 @@ static void nvme_rw_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ns->lbaf.ms) {
+    if (ns->lbaf.ms && !ns->pip) {
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
@@ -3349,7 +3349,9 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (ns->pip) {
+        return nvme_dif_pass_rw(n, req);
+    } else if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
         return nvme_dif_rw(n, req);
     }
 
@@ -3379,6 +3381,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint16_t ctrl = le16_to_cpu(rw->control);
     uint8_t prinfo = NVME_RW_PRINFO(ctrl);
+    bool pract = !!(prinfo & NVME_PRINFO_PRACT);
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
@@ -3483,7 +3486,11 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     data_offset = nvme_l2b(ns, slba);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (ns->pip) {
+        if (!wrz || pract) {
+            return nvme_dif_pass_rw(n, req);
+        }
+    } else if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
         return nvme_dif_rw(n, req);
     }
 
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 63c44c86ab..0b562cf45a 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "sysemu/block-backend.h"
+#include "qemu/memalign.h"
 
 #include "nvme.h"
 #include "dif.h"
@@ -714,3 +715,305 @@ err:
 
     return status;
 }
+
+void nvme_dif_pass_dump(NvmeNamespace *ns, uint8_t *mdata_buf, size_t mdata_len)
+{
+    size_t i;
+    uint8_t *end = mdata_buf + mdata_len;
+    for (i = 1; mdata_buf < end; ++i, mdata_buf += ns->lbaf.ms) {
+        NvmeDifTuple *mdata = (NvmeDifTuple *) mdata_buf;
+        trace_pci_nvme_dif_dump_pass_pi(i, be16_to_cpu(mdata->g16.guard),
+                                        be16_to_cpu(mdata->g16.apptag),
+                                        be32_to_cpu(mdata->g16.reftag));
+    }
+}
+
+static void nvme_dif_pass_read_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeDifPassContext *ctx = req->opaque;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
+    bool pract = !!(prinfo & NVME_PRINFO_PRACT);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint16_t status;
+
+    trace_pci_nvme_dif_pass_read_cb(nvme_cid(req), ctx->iov.dif.iov_len >> 3);
+    if (trace_event_get_state_backends(TRACE_PCI_NVME_DIF_DUMP_PASS_PI)) {
+        nvme_dif_pass_dump(ns, ctx->iov.dif.iov_base, ctx->iov.dif.iov_len);
+    }
+
+    /* block layer returns EILSEQ in case of integrity check failure */
+    /* determine exact pi error and return status accordingly */
+    if (unlikely(ret == -EILSEQ)) {
+        req->status = nvme_dif_pass_check(ns, ctx->data.bounce, ctx->data.len,
+                          ctx->iov.dif.iov_base, prinfo, slba, reftag);
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
+    status = nvme_dif_pass_apptag_check(ns, ctx->iov.dif.iov_base,
+                 ctx->iov.dif.iov_len, prinfo, apptag, appmask);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    status = nvme_bounce_data(n, ctx->data.bounce, ctx->data.len,
+                              NVME_TX_DIRECTION_FROM_DEVICE, req);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    if (!pract) {
+        status = nvme_bounce_mdata(n, ctx->iov.dif.iov_base,
+                     ctx->iov.dif.iov_len, NVME_TX_DIRECTION_FROM_DEVICE, req);
+        if (status) {
+            req->status = status;
+        }
+    }
+
+out:
+    qemu_iovec_destroy_pi(&ctx->iov);
+    g_free(ctx->data.bounce);
+    g_free(ctx);
+
+    nvme_rw_complete_cb(req, ret);
+}
+
+static void nvme_diff_pass_write_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeDifPassContext *ctx = req->opaque;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t slba = le64_to_cpu(rw->slba);
+
+    trace_pci_nvme_dif_pass_write_cb(nvme_cid(req), ctx->iov.dif.iov_len >> 3);
+    if (trace_event_get_state_backends(TRACE_PCI_NVME_DIF_DUMP_PASS_PI)) {
+        nvme_dif_pass_dump(ns, ctx->iov.dif.iov_base, ctx->iov.dif.iov_len);
+    }
+
+    /* block layer returns EILSEQ in case of integrity check failure */
+    /* determine exact pi error and return status accordingly */
+    if (unlikely(ret == -EILSEQ)) {
+        req->status = nvme_dif_pass_check(ns, ctx->data.bounce, ctx->data.len,
+                          ctx->iov.dif.iov_base, prinfo, slba, reftag);
+        if (req->status) {
+            /* zero out ret to allow req->status passthrough */
+            ret = 0;
+        }
+    }
+
+    qemu_iovec_destroy_pi(&ctx->iov);
+    g_free(ctx->data.bounce);
+    g_free(ctx);
+
+    nvme_rw_complete_cb(req, ret);
+}
+
+uint16_t nvme_dif_pass_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint64_t reftag = le32_to_cpu(rw->reftag);
+    bool pract = !!(prinfo & NVME_PRINFO_PRACT);
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    size_t len = nvme_l2b(ns, nlb);
+    int64_t offset = nvme_l2b(ns, slba);
+    NvmeDifPassContext *ctx;
+    uint16_t status;
+
+    trace_pci_nvme_dif_pass_rw(nvme_cid(req),
+        NVME_ID_NS_DPS_TYPE(ns->id_ns.dps), prinfo, apptag, appmask, reftag);
+
+    ctx = g_new0(NvmeDifPassContext, 1);
+    qemu_iovec_init_pi(&ctx->iov, 1, nlb);
+    ctx->data.len = len;
+    ctx->data.bounce = qemu_memalign(qemu_real_host_page_size(),
+                                     ctx->data.len);
+    qemu_iovec_add(&ctx->iov, ctx->data.bounce, ctx->data.len);
+
+    req->opaque = ctx;
+
+    status = nvme_check_prinfo(ns, prinfo, slba, reftag);
+    if (status) {
+        goto err;
+    }
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
+    if (status) {
+        goto err;
+    }
+
+    if (req->cmd.opcode == NVME_CMD_READ) {
+        block_acct_start(blk_get_stats(blk), &req->acct, ctx->iov.size,
+                         BLOCK_ACCT_READ);
+
+        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                    nvme_dif_pass_read_cb, req);
+
+        return NVME_NO_COMPLETE;
+    }
+
+    if (wrz) {
+
+        assert(pract);
+
+        if (prinfo & NVME_PRINFO_PRCHK_MASK) {
+            status = NVME_INVALID_PROT_INFO | NVME_DNR;
+            goto err;
+        }
+        uint8_t *mbuf, *end;
+
+        mbuf = ctx->iov.dif.iov_base;
+        end = mbuf + ctx->iov.dif.iov_len;
+
+        for (; mbuf < end; mbuf += ns->lbaf.ms) {
+            NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf);
+
+            dif->g16.apptag = cpu_to_be16(apptag);
+            dif->g16.reftag = cpu_to_be32(reftag);
+
+            switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+            case NVME_ID_NS_DPS_TYPE_1:
+            case NVME_ID_NS_DPS_TYPE_2:
+                reftag++;
+            }
+        }
+        memset(ctx->data.bounce, 0, ctx->data.len);
+
+        req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                     nvme_diff_pass_write_cb, req);
+
+    } else {
+
+        status = nvme_bounce_data(n, ctx->data.bounce, ctx->data.len,
+                                  NVME_TX_DIRECTION_TO_DEVICE, req);
+        if (status) {
+            goto err;
+        }
+        if (pract) {
+            nvme_dif_pract_generate_dif(ns, ctx->data.bounce,
+                                        ctx->data.len, ctx->iov.dif.iov_base,
+                                        ctx->iov.dif.iov_len, apptag, &reftag);
+        } else {
+            status = nvme_bounce_mdata(n, ctx->iov.dif.iov_base,
+                         ctx->iov.dif.iov_len, NVME_TX_DIRECTION_TO_DEVICE,
+                         req);
+            if (status) {
+                goto err;
+            }
+            status = nvme_dif_pass_apptag_check(ns, ctx->iov.dif.iov_base,
+                         ctx->iov.dif.iov_len, prinfo, apptag, appmask);
+            if (status) {
+                goto err;
+            }
+        }
+
+        block_acct_start(blk_get_stats(blk), &req->acct, ctx->iov.size,
+                         BLOCK_ACCT_WRITE);
+
+        req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                     nvme_diff_pass_write_cb, req);
+
+    }
+
+    return NVME_NO_COMPLETE;
+
+err:
+    qemu_iovec_destroy_pi(&ctx->iov);
+    g_free(ctx->data.bounce);
+    g_free(ctx);
+
+    return status;
+}
+
+uint16_t nvme_dif_pass_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                             uint8_t *mbuf, uint8_t prinfo, uint64_t slba,
+                             uint32_t reftag)
+{
+    Error *local_err = NULL;
+    uint16_t status;
+
+    status = nvme_check_prinfo(ns, prinfo, slba, reftag);
+    if (status) {
+        return status;
+    }
+
+    uint8_t *end = buf + len;
+
+    for (uint8_t *bufp = buf, *mbufp = mbuf; bufp < end; bufp += ns->lbasz,
+         mbufp += ns->lbaf.ms) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)mbufp;
+
+        if (be16_to_cpu(dif->g16.guard) != crc16_t10dif(0x0, bufp, ns->lbasz)) {
+            if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
+                return NVME_E2E_GUARD_ERROR;
+            } else {
+                error_setg(&local_err, "Nvme namespace %u, backed by %s"
+                           " drive, can not pass custom guard tag",
+                           nvme_nsid(ns), blk_name(ns->blkconf.blk));
+                error_report_err(local_err);
+                return NVME_INTERNAL_DEV_ERROR;
+            }
+        }
+
+        if (be32_to_cpu(dif->g16.reftag) != reftag) {
+            if (prinfo & NVME_PRINFO_PRCHK_REF) {
+                return NVME_E2E_REF_ERROR;
+            } else if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) !=
+                       NVME_ID_NS_DPS_TYPE_3) {
+                error_setg(&local_err, "Nvme namespace %u, backed by %s"
+                           " drive can not pass custom ref tag",
+                           nvme_nsid(ns), blk_name(ns->blkconf.blk));
+                error_report_err(local_err);
+                return NVME_INTERNAL_DEV_ERROR;
+            }
+        }
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            reftag++;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+uint16_t nvme_dif_pass_apptag_check(NvmeNamespace *ns, uint8_t *mbuf,
+                                    size_t mlen, uint8_t prinfo,
+                                    uint16_t apptag, uint16_t appmask)
+{
+    if (prinfo & NVME_PRINFO_PRCHK_APP) {
+        uint8_t *end = mbuf + mlen;
+        for (uint8_t *mbufp = mbuf; mbufp < end; mbufp += ns->lbaf.ms) {
+            NvmeDifTuple *dif = (NvmeDifTuple *)mbufp;
+            if ((be16_to_cpu(dif->g16.apptag) & appmask) !=
+                (apptag & appmask)) {
+                return NVME_E2E_APP_ERROR;
+            }
+        }
+    }
+
+    return NVME_SUCCESS;
+}
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index f12e312250..08e3630461 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -188,4 +188,22 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint16_t appmask, uint64_t *reftag);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
 
+typedef struct NvmeDifPassContext {
+    struct {
+        uint8_t *bounce;
+        size_t len;
+    } data;
+    QEMUIOVector iov;
+} NvmeDifPassContext;
+
+uint16_t nvme_dif_pass_rw(NvmeCtrl *n, NvmeRequest *req);
+void nvme_dif_pass_dump(NvmeNamespace *ns, uint8_t *mdata_buf,
+                        size_t mdata_len);
+uint16_t nvme_dif_pass_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                             uint8_t *mbuf, uint8_t prinfo, uint64_t slba,
+                             uint32_t reftag);
+uint16_t nvme_dif_pass_apptag_check(NvmeNamespace *ns, uint8_t *mbuf,
+                                    size_t mlen, uint8_t prinfo,
+                                    uint16_t apptag, uint16_t appmask);
+
 #endif /* HW_NVME_DIF_H */
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f489..259fa8ffa2 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -17,6 +17,10 @@ pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_misc_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_dif_rw(uint8_t pract, uint8_t prinfo) "pract 0x%"PRIx8" prinfo 0x%"PRIx8""
+pci_nvme_dif_pass_rw(uint16_t cid, uint8_t type, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" type %"PRIu8" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_pass_read_cb(uint16_t cid, size_t count) "cid %"PRIu16" number of DIF elements %zu"
+pci_nvme_dif_pass_write_cb(uint16_t cid, size_t count) "cid %"PRIu16" number of DIF elements %zu"
+pci_nvme_dif_dump_pass_pi(size_t dif_num, uint16_t guard, uint16_t apptag, uint32_t reftag) "DIF element %zu guard tag 0x%"PRIx16" apptag 0x%"PRIx16" reftag 0x%"PRIx32""
 pci_nvme_dif_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_out_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.38.1


