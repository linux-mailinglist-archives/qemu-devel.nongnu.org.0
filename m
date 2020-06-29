Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229820D5DE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:56:34 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpztJ-0000IO-HG
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznq-0007SI-Pk; Mon, 29 Jun 2020 15:50:54 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpzno-0005z4-9H; Mon, 29 Jun 2020 15:50:54 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 98239BF814;
 Mon, 29 Jun 2020 19:50:28 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 13/17] hw/block/nvme: consolidate qsg/iov clearing
Date: Mon, 29 Jun 2020 21:50:13 +0200
Message-Id: <20200629195017.1217056-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629195017.1217056-1-its@irrelevant.dk>
References: <20200629195017.1217056-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Always destroy the request qsg/iov at the end of request use.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 48 +++++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3d38f61b61e5..c6c2c4670f7d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -178,6 +178,14 @@ static void nvme_req_clear(NvmeRequest *req)
 {
     req->ns = NULL;
     memset(&req->cqe, 0x0, sizeof(req->cqe));
+
+    if (req->qsg.sg) {
+        qemu_sglist_destroy(&req->qsg);
+    }
+
+    if (req->iov.iov) {
+        qemu_iovec_destroy(&req->iov);
+    }
 }
 
 static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
@@ -262,15 +270,14 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 
     status = nvme_map_addr(n, qsg, iov, prp1, trans_len);
     if (status) {
-        goto unmap;
+        return status;
     }
 
     len -= trans_len;
     if (len) {
         if (unlikely(!prp2)) {
             trace_pci_nvme_err_invalid_prp2_missing();
-            status = NVME_INVALID_FIELD | NVME_DNR;
-            goto unmap;
+            return NVME_INVALID_FIELD | NVME_DNR;
         }
 
         if (len > n->page_size) {
@@ -291,13 +298,11 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
                 if (i == n->max_prp_ents - 1 && len > n->page_size) {
                     if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                        status = NVME_INVALID_FIELD | NVME_DNR;
-                        goto unmap;
+                        return NVME_INVALID_FIELD | NVME_DNR;
                     }
 
                     if (prp_list_in_cmb != nvme_addr_is_cmb(n, prp_ent)) {
-                        status = NVME_INVALID_USE_OF_CMB | NVME_DNR;
-                        goto unmap;
+                        return NVME_INVALID_USE_OF_CMB | NVME_DNR;
                     }
 
                     i = 0;
@@ -310,14 +315,13 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 
                 if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) {
                     trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                    status = NVME_INVALID_FIELD | NVME_DNR;
-                    goto unmap;
+                    return NVME_INVALID_FIELD | NVME_DNR;
                 }
 
                 trans_len = MIN(len, n->page_size);
                 status = nvme_map_addr(n, qsg, iov, prp_ent, trans_len);
                 if (status) {
-                    goto unmap;
+                    return status;
                 }
 
                 len -= trans_len;
@@ -326,27 +330,16 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         } else {
             if (unlikely(prp2 & (n->page_size - 1))) {
                 trace_pci_nvme_err_invalid_prp2_align(prp2);
-                status = NVME_INVALID_FIELD | NVME_DNR;
-                goto unmap;
+                return NVME_INVALID_FIELD | NVME_DNR;
             }
             status = nvme_map_addr(n, qsg, iov, prp2, len);
             if (status) {
-                goto unmap;
+                return status;
             }
         }
     }
+
     return NVME_SUCCESS;
-
-unmap:
-    if (iov && iov->iov) {
-        qemu_iovec_destroy(iov);
-    }
-
-    if (qsg && qsg->sg) {
-        qemu_sglist_destroy(qsg);
-    }
-
-    return status;
 }
 
 static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
@@ -566,13 +559,6 @@ static void nvme_rw_cb(void *opaque, int ret)
         req->status = NVME_INTERNAL_DEV_ERROR;
     }
 
-    if (req->qsg.nalloc) {
-        qemu_sglist_destroy(&req->qsg);
-    }
-    if (req->iov.nalloc) {
-        qemu_iovec_destroy(&req->iov);
-    }
-
     nvme_enqueue_req_completion(cq, req);
 }
 
-- 
2.27.0


