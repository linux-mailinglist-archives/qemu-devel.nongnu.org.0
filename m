Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB153170BF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:57:14 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9vbt-0006Q1-Aq
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vYB-0002uv-53; Wed, 10 Feb 2021 14:53:23 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9vY8-0006dh-7P; Wed, 10 Feb 2021 14:53:22 -0500
Received: by mail-pl1-x630.google.com with SMTP id g3so1820416plp.2;
 Wed, 10 Feb 2021 11:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5e2a4NCdGhsywMPhtlhVywKRAeacADJw06Qqp7M3tw0=;
 b=F0ZfR0vJVBGI/IPuPG5pcjXaZRtBz3onYDj82+OPSryDnA0YTeP7lMdRF+vJEr5Kxt
 FfA1LGowi+Xmr/zydA4UviIcWkWUT6RaouS9RiLeUPJRWgLxFNNOnjdNWjl8Eh6rvcNZ
 6lbUTZ+Z/N5iuE5N1jHNF8qXcmJnMA5ez6gtIEqzwDi1Aa/OAtutTxoKz3bKlOTKquTR
 MmcY79br5Rc5FNJCLckfEOhbqAW/B0g7bZz5sCMsPCTsdtWxUJitItgCA5uFS/9Gnj0D
 lt+tN1U7PJhYdJXmSNhkgU7FdxNCBQbgI93FiuaX1nO14Ihd4CJGefTyXAPDZuB6Dui8
 Nihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5e2a4NCdGhsywMPhtlhVywKRAeacADJw06Qqp7M3tw0=;
 b=eVLCmfaomozd1RwANF6lwrnAMDofywoxOp7gSTZY2ILJke+nN/KxKpOvqkGaCprU23
 0hzRJGhf6Bp+PV3V9y/WspuxOKJ+hbK+geNy2rnyFutdqSk+RvPz3sPiz9Ig/9lh/sL7
 7jNfjVgGC3N5mHFEsueBNB2UGb13f5oKMzddtbR2gH8PLo/TUsP2atLb7+kX7YJ0h4lI
 8DTCFS7cmAjqTfu9ecz56TrG2GloQnKKE89KjWM5HQpfNy1FPHuyJXkWJ0bBxROaD50V
 alZiQ/lIorcyb+GAAixfy+4LEcXdWA5UiGV5oVyVrg2enLR2/drmgs1oQlHT8Ae/8ZnT
 YRUQ==
X-Gm-Message-State: AOAM533bn1rb+YLefMs//qZ65LHiP3Zk4QsFc1oF80R5iBXO9oKYgV4r
 nstDo3nJqLVCQDQBwg+IZ8edpQ8nVPE0Hw==
X-Google-Smtp-Source: ABdhPJznM324pR0JaoGvKF3NtV+OJDTznfLvE8vDjiZTq/z7mByXe9gjswdlYHiejk04p1wUV+dsoQ==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr532826pjr.134.1612986798063; 
 Wed, 10 Feb 2021 11:53:18 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id e26sm3221773pfm.87.2021.02.10.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 11:53:17 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 1/3] hw/block/nvme: set NVME_DNR in a single place
Date: Thu, 11 Feb 2021 04:52:50 +0900
Message-Id: <20210210195252.19339-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set NVME_DNR in the CQ entry status field right before writing the CQ
entry: in nvme_post_cqes().  We have put NVME_DNR for all CQ entry
status for all error cases.  This patch is a former patch to support
command retry feature.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 192 ++++++++++++++++++++++++------------------------
 1 file changed, 97 insertions(+), 95 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 93345bf3c1fc..816e0e8e5205 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -270,12 +270,12 @@ static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
     if (ns->params.max_active_zones != 0 &&
         ns->nr_active_zones + act > ns->params.max_active_zones) {
         trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones);
-        return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
+        return NVME_ZONE_TOO_MANY_ACTIVE;
     }
     if (ns->params.max_open_zones != 0 &&
         ns->nr_open_zones + opn > ns->params.max_open_zones) {
         trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
-        return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
+        return NVME_ZONE_TOO_MANY_OPEN;
     }
 
     return NVME_SUCCESS;
@@ -492,7 +492,7 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 
     if (cmb || pmr) {
         if (qsg && qsg->sg) {
-            return NVME_INVALID_USE_OF_CMB | NVME_DNR;
+            return NVME_INVALID_USE_OF_CMB;
         }
 
         assert(iov);
@@ -509,7 +509,7 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     }
 
     if (iov && iov->iov) {
-        return NVME_INVALID_USE_OF_CMB | NVME_DNR;
+        return NVME_INVALID_USE_OF_CMB;
     }
 
     assert(qsg);
@@ -568,7 +568,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 if (i == n->max_prp_ents - 1 && len > n->page_size) {
                     if (unlikely(prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                        return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                        return NVME_INVALID_PRP_OFFSET;
                     }
 
                     i = 0;
@@ -585,7 +585,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
                 if (unlikely(prp_ent & (n->page_size - 1))) {
                     trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                    return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                    return NVME_INVALID_PRP_OFFSET;
                 }
 
                 trans_len = MIN(len, n->page_size);
@@ -600,7 +600,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
         } else {
             if (unlikely(prp2 & (n->page_size - 1))) {
                 trace_pci_nvme_err_invalid_prp2_align(prp2);
-                return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                return NVME_INVALID_PRP_OFFSET;
             }
             status = nvme_map_addr(n, qsg, iov, prp2, len);
             if (status) {
@@ -637,9 +637,9 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
             break;
         case NVME_SGL_DESCR_TYPE_SEGMENT:
         case NVME_SGL_DESCR_TYPE_LAST_SEGMENT:
-            return NVME_INVALID_NUM_SGL_DESCRS | NVME_DNR;
+            return NVME_INVALID_NUM_SGL_DESCRS;
         default:
-            return NVME_SGL_DESCR_TYPE_INVALID | NVME_DNR;
+            return NVME_SGL_DESCR_TYPE_INVALID;
         }
 
         dlen = le32_to_cpu(segment[i].len);
@@ -660,7 +660,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
             }
 
             trace_pci_nvme_err_invalid_sgl_excess_length(nvme_cid(req));
-            return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
+            return NVME_DATA_SGL_LEN_INVALID;
         }
 
         trans_len = MIN(*len, dlen);
@@ -672,7 +672,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
         addr = le64_to_cpu(segment[i].addr);
 
         if (UINT64_MAX - addr < dlen) {
-            return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
+            return NVME_DATA_SGL_LEN_INVALID;
         }
 
         status = nvme_map_addr(n, qsg, iov, addr, trans_len);
@@ -731,7 +731,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         case NVME_SGL_DESCR_TYPE_LAST_SEGMENT:
             break;
         default:
-            return NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
+            return NVME_INVALID_SGL_SEG_DESCR;
         }
 
         seg_len = le32_to_cpu(sgld->len);
@@ -739,11 +739,11 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         /* check the length of the (Last) Segment descriptor */
         if ((!seg_len || seg_len & 0xf) &&
             (NVME_SGL_TYPE(sgld->type) != NVME_SGL_DESCR_TYPE_BIT_BUCKET)) {
-            return NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
+            return NVME_INVALID_SGL_SEG_DESCR;
         }
 
         if (UINT64_MAX - addr < seg_len) {
-            return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
+            return NVME_DATA_SGL_LEN_INVALID;
         }
 
         nsgld = seg_len / sizeof(NvmeSglDescriptor);
@@ -798,7 +798,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
          * current segment must not be a Last Segment.
          */
         if (NVME_SGL_TYPE(sgld->type) == NVME_SGL_DESCR_TYPE_LAST_SEGMENT) {
-            status = NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
+            status = NVME_INVALID_SGL_SEG_DESCR;
             goto unmap;
         }
 
@@ -818,7 +818,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 out:
     /* if there is any residual left in len, the SGL was too short */
     if (len) {
-        status = NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
+        status = NVME_DATA_SGL_LEN_INVALID;
         goto unmap;
     }
 
@@ -850,7 +850,7 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, size_t len, NvmeRequest *req)
     case NVME_PSDT_SGL_MPTR_SGL:
         /* SGLs shall not be used for Admin commands in NVMe over PCIe */
         if (!req->sq->sqid) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
 
         return nvme_map_sgl(n, &req->qsg, &req->iov, req->cmd.dptr.sgl, len,
@@ -884,7 +884,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 
         if (unlikely(residual)) {
             trace_pci_nvme_err_invalid_dma();
-            status = NVME_INVALID_FIELD | NVME_DNR;
+            status = NVME_INVALID_FIELD;
         }
     } else {
         size_t bytes;
@@ -897,7 +897,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 
         if (unlikely(bytes != len)) {
             trace_pci_nvme_err_invalid_dma();
-            status = NVME_INVALID_FIELD | NVME_DNR;
+            status = NVME_INVALID_FIELD;
         }
     }
 
@@ -945,6 +945,11 @@ static void nvme_post_cqes(void *opaque)
 static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 {
     assert(cq->cqid == req->sq->cqid);
+
+    if (req->status != NVME_SUCCESS) {
+        req->status |= NVME_DNR;
+    }
+
     trace_pci_nvme_enqueue_req_completion(nvme_cid(req), cq->cqid,
                                           req->status);
 
@@ -1069,7 +1074,7 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     uint8_t mdts = n->params.mdts;
 
     if (mdts && len > n->page_size << mdts) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     return NVME_SUCCESS;
@@ -1081,7 +1086,7 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
-        return NVME_LBA_RANGE | NVME_DNR;
+        return NVME_LBA_RANGE;
     }
 
     return NVME_SUCCESS;
@@ -1791,11 +1796,11 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     if (!(n->id_ctrl.ocfs & (1 << format))) {
         trace_pci_nvme_err_copy_invalid_format(format);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (nr > ns->id_ns.msrc + 1) {
-        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        return NVME_CMD_SIZE_LIMIT;
     }
 
     range = g_new(NvmeCopySourceRange, nr);
@@ -1811,7 +1816,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
 
         if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
-            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+            return NVME_CMD_SIZE_LIMIT;
         }
 
         status = nvme_check_bounds(ns, slba, _nlb);
@@ -1838,7 +1843,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
-        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        return NVME_CMD_SIZE_LIMIT;
     }
 
     bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
@@ -2006,7 +2011,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
 invalid:
     block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_READ);
-    return status | NVME_DNR;
+    return status;
 }
 
 static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
@@ -2100,7 +2105,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
 invalid:
     block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_WRITE);
-    return status | NVME_DNR;
+    return status;
 }
 
 static inline uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
@@ -2126,14 +2131,14 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
 
     if (!ns->params.zoned) {
         trace_pci_nvme_err_invalid_opc(c->opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        return NVME_INVALID_OPCODE;
     }
 
     *slba = ((uint64_t)dw11) << 32 | dw10;
     if (unlikely(*slba >= ns->id_ns.nsze)) {
         trace_pci_nvme_err_invalid_lba_range(*slba, 0, ns->id_ns.nsze);
         *slba = 0;
-        return NVME_LBA_RANGE | NVME_DNR;
+        return NVME_LBA_RANGE;
     }
 
     *zone_idx = nvme_zone_idx(ns, *slba);
@@ -2364,7 +2369,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     zone = &ns->zone_array[zone_idx];
     if (slba != zone->d.zslba) {
         trace_pci_nvme_err_unaligned_zone_cmd(action, slba, zone->d.zslba);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     switch (action) {
@@ -2421,7 +2426,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ZONE_ACTION_SET_ZD_EXT:
         trace_pci_nvme_set_descriptor_extension(slba, zone_idx);
         if (all || !ns->params.zd_extension_size) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
         zd_ext = nvme_get_zd_extension(ns, zone_idx);
         status = nvme_dma(n, zd_ext, ns->params.zd_extension_size,
@@ -2447,9 +2452,6 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_zone_state_transition(action, slba,
                                                          zone->d.za);
     }
-    if (status) {
-        status |= NVME_DNR;
-    }
 
     return status;
 }
@@ -2506,19 +2508,19 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
     zra = dw13 & 0xff;
     if (zra != NVME_ZONE_REPORT && zra != NVME_ZONE_REPORT_EXTENDED) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
     if (zra == NVME_ZONE_REPORT_EXTENDED && !ns->params.zd_extension_size) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     zrasf = (dw13 >> 8) & 0xff;
     if (zrasf > NVME_ZONE_REPORT_OFFLINE) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (data_size < sizeof(NvmeZoneReportHeader)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     status = nvme_check_mdts(n, data_size);
@@ -2596,17 +2598,17 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
 
     if (!nvme_nsid_valid(n, nsid)) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     req->ns = nvme_ns(n, nsid);
     if (unlikely(!req->ns)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (!(req->ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        return NVME_INVALID_OPCODE;
     }
 
     switch (req->cmd.opcode) {
@@ -2634,7 +2636,7 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         assert(false);
     }
 
-    return NVME_INVALID_OPCODE | NVME_DNR;
+    return NVME_INVALID_OPCODE;
 }
 
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
@@ -2657,7 +2659,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
-        return NVME_INVALID_QID | NVME_DNR;
+        return NVME_INVALID_QID;
     }
 
     trace_pci_nvme_del_sq(qid);
@@ -2728,24 +2730,24 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
 
     if (unlikely(!cqid || nvme_check_cqid(n, cqid))) {
         trace_pci_nvme_err_invalid_create_sq_cqid(cqid);
-        return NVME_INVALID_CQID | NVME_DNR;
+        return NVME_INVALID_CQID;
     }
     if (unlikely(!sqid || sqid > n->params.max_ioqpairs ||
         n->sq[sqid] != NULL)) {
         trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
-        return NVME_INVALID_QID | NVME_DNR;
+        return NVME_INVALID_QID;
     }
     if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
         trace_pci_nvme_err_invalid_create_sq_size(qsize);
-        return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
+        return NVME_MAX_QSIZE_EXCEEDED;
     }
     if (unlikely(prp1 & (n->page_size - 1))) {
         trace_pci_nvme_err_invalid_create_sq_addr(prp1);
-        return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+        return NVME_INVALID_PRP_OFFSET;
     }
     if (unlikely(!(NVME_SQ_FLAGS_PC(qflags)))) {
         trace_pci_nvme_err_invalid_create_sq_qflags(NVME_SQ_FLAGS_PC(qflags));
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
     sq = g_malloc0(sizeof(*sq));
     nvme_init_sq(sq, n, prp1, sqid, cqid, qsize + 1);
@@ -2780,13 +2782,13 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     time_t current_ms;
 
     if (off >= sizeof(smart)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (nsid != 0xffffffff) {
         ns = nvme_ns(n, nsid);
         if (!ns) {
-            return NVME_INVALID_NSID | NVME_DNR;
+            return NVME_INVALID_NSID;
         }
         nvme_set_blk_stats(ns, &stats);
     } else {
@@ -2839,7 +2841,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     };
 
     if (off >= sizeof(fw_log)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
@@ -2856,7 +2858,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     NvmeErrorLog errlog;
 
     if (off >= sizeof(errlog)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (!rae) {
@@ -2879,7 +2881,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
     if (off >= sizeof(log)) {
         trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(log));
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     switch (NVME_CC_CSS(n->bar.cc)) {
@@ -2937,7 +2939,7 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
     off = (lpou << 32ULL) | lpol;
 
     if (off & 0x3) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     trace_pci_nvme_get_log(nvme_cid(req), lid, lsp, rae, len, off);
@@ -2959,7 +2961,7 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_cmd_effects(n, csi, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 }
 
@@ -2983,7 +2985,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
 
     if (unlikely(!qid || nvme_check_cqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_cq_cqid(qid);
-        return NVME_INVALID_CQID | NVME_DNR;
+        return NVME_INVALID_CQID;
     }
 
     cq = n->cq[qid];
@@ -3037,27 +3039,27 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
     if (unlikely(!cqid || cqid > n->params.max_ioqpairs ||
         n->cq[cqid] != NULL)) {
         trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
-        return NVME_INVALID_QID | NVME_DNR;
+        return NVME_INVALID_QID;
     }
     if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
         trace_pci_nvme_err_invalid_create_cq_size(qsize);
-        return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
+        return NVME_MAX_QSIZE_EXCEEDED;
     }
     if (unlikely(prp1 & (n->page_size - 1))) {
         trace_pci_nvme_err_invalid_create_cq_addr(prp1);
-        return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+        return NVME_INVALID_PRP_OFFSET;
     }
     if (unlikely(!msix_enabled(&n->parent_obj) && vector)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
-        return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
+        return NVME_INVALID_IRQ_VECTOR;
     }
     if (unlikely(vector >= n->params.msix_qsize)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
-        return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
+        return NVME_INVALID_IRQ_VECTOR;
     }
     if (unlikely(!(NVME_CQ_FLAGS_PC(qflags)))) {
         trace_pci_nvme_err_invalid_create_cq_qflags(NVME_CQ_FLAGS_PC(qflags));
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     cq = g_malloc0(sizeof(*cq));
@@ -3115,7 +3117,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
                         DMA_DIRECTION_FROM_DEVICE, req);
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return NVME_INVALID_FIELD;
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -3127,7 +3129,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_identify_ns(nsid);
 
     if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     ns = nvme_ns(n, nsid);
@@ -3140,7 +3142,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
                         DMA_DIRECTION_FROM_DEVICE, req);
     }
 
-    return NVME_INVALID_CMD_SET | NVME_DNR;
+    return NVME_INVALID_CMD_SET;
 }
 
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3152,7 +3154,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_identify_ns_csi(nsid, c->csi);
 
     if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     ns = nvme_ns(n, nsid);
@@ -3167,7 +3169,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
                         DMA_DIRECTION_FROM_DEVICE, req);
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return NVME_INVALID_FIELD;
 }
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
@@ -3189,7 +3191,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
      * in the spec (NVM Express v1.3d, Section 5.15.4).
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     for (i = 1; i <= n->num_namespaces; i++) {
@@ -3225,11 +3227,11 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
      * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are invalid.
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     if (c->csi != NVME_CSI_NVM && c->csi != NVME_CSI_ZONED) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     for (i = 1; i <= n->num_namespaces; i++) {
@@ -3272,12 +3274,12 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_identify_ns_descr_list(nsid);
 
     if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
-        return NVME_INVALID_NSID | NVME_DNR;
+        return NVME_INVALID_NSID;
     }
 
     ns = nvme_ns(n, nsid);
     if (unlikely(!ns)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     /*
@@ -3340,7 +3342,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_cmd_set(n, req);
     default:
         trace_pci_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 }
 
@@ -3350,7 +3352,7 @@ static uint16_t nvme_abort(NvmeCtrl *n, NvmeRequest *req)
 
     req->cqe.result = 1;
     if (nvme_check_sqid(n, sqid)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     return NVME_SUCCESS;
@@ -3419,7 +3421,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_getfeat(nvme_cid(req), nsid, fid, sel, dw11);
 
     if (!nvme_feature_support[fid]) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
@@ -3431,11 +3433,11 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
              * features we can always return Invalid Namespace or Format as we
              * should do for all other features.
              */
-            return NVME_INVALID_NSID | NVME_DNR;
+            return NVME_INVALID_NSID;
         }
 
         if (!nvme_ns(n, nsid)) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
     }
 
@@ -3472,15 +3474,15 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
             goto out;
         }
 
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     case NVME_ERROR_RECOVERY:
         if (!nvme_nsid_valid(n, nsid)) {
-            return NVME_INVALID_NSID | NVME_DNR;
+            return NVME_INVALID_NSID;
         }
 
         ns = nvme_ns(n, nsid);
         if (unlikely(!ns)) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
 
         result = ns->features.err_rec;
@@ -3530,7 +3532,7 @@ defaults:
     case NVME_INTERRUPT_VECTOR_CONF:
         iv = dw11 & 0xffff;
         if (iv >= n->params.max_ioqpairs + 1) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
 
         result = iv;
@@ -3582,34 +3584,34 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
 
     if (save && !(nvme_feature_cap[fid] & NVME_FEAT_CAP_SAVE)) {
-        return NVME_FID_NOT_SAVEABLE | NVME_DNR;
+        return NVME_FID_NOT_SAVEABLE;
     }
 
     if (!nvme_feature_support[fid]) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return NVME_INVALID_FIELD;
     }
 
     if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
         if (nsid != NVME_NSID_BROADCAST) {
             if (!nvme_nsid_valid(n, nsid)) {
-                return NVME_INVALID_NSID | NVME_DNR;
+                return NVME_INVALID_NSID;
             }
 
             ns = nvme_ns(n, nsid);
             if (unlikely(!ns)) {
-                return NVME_INVALID_FIELD | NVME_DNR;
+                return NVME_INVALID_FIELD;
             }
         }
     } else if (nsid && nsid != NVME_NSID_BROADCAST) {
         if (!nvme_nsid_valid(n, nsid)) {
-            return NVME_INVALID_NSID | NVME_DNR;
+            return NVME_INVALID_NSID;
         }
 
-        return NVME_FEAT_NOT_NS_SPEC | NVME_DNR;
+        return NVME_FEAT_NOT_NS_SPEC;
     }
 
     if (!(nvme_feature_cap[fid] & NVME_FEAT_CAP_CHANGE)) {
-        return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
+        return NVME_FEAT_NOT_CHANGEABLE;
     }
 
     switch (fid) {
@@ -3626,7 +3628,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             n->features.temp_thresh_low = NVME_TEMP_TMPTH(dw11);
             break;
         default:
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
 
         if ((n->temperature >= n->features.temp_thresh_hi) ||
@@ -3675,7 +3677,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
     case NVME_NUMBER_OF_QUEUES:
         if (n->qs_created) {
-            return NVME_CMD_SEQ_ERROR | NVME_DNR;
+            return NVME_CMD_SEQ_ERROR;
         }
 
         /*
@@ -3683,7 +3685,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
          * and NSQR.
          */
         if ((dw11 & 0xffff) == 0xffff || ((dw11 >> 16) & 0xffff) == 0xffff) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+            return NVME_INVALID_FIELD;
         }
 
         trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
@@ -3701,11 +3703,11 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
             trace_pci_nvme_err_invalid_iocsci(dw11 & 0x1ff);
-            return NVME_CMD_SET_CMB_REJECTED | NVME_DNR;
+            return NVME_CMD_SET_CMB_REJECTED;
         }
         break;
     default:
-        return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
+        return NVME_FEAT_NOT_CHANGEABLE;
     }
     return NVME_SUCCESS;
 }
@@ -3736,7 +3738,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
     if (!(nvme_cse_acs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
         trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        return NVME_INVALID_OPCODE;
     }
 
     switch (req->cmd.opcode) {
@@ -3764,7 +3766,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         assert(false);
     }
 
-    return NVME_INVALID_OPCODE | NVME_DNR;
+    return NVME_INVALID_OPCODE;
 }
 
 static void nvme_process_sq(void *opaque)
-- 
2.17.1


