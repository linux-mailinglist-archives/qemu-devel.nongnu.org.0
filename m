Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F9232772
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:13:18 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uK5-0000Iy-Rt
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uEG-0007rE-Se; Wed, 29 Jul 2020 18:07:16 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uEB-000061-FD; Wed, 29 Jul 2020 18:07:16 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 9A286BFD7B;
 Wed, 29 Jul 2020 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596060408;
 bh=13gLR0nxXCYQ5uI4XwvKB+Igk3iPm/yL5WVNoA8QheY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sMdcv1plczxqbRheXbJ121z2iry0ULUmwWkN+O9dXDKAfvpq1ad8rXEK+lstUBHU1
 3y/eanxJRcCEeik9Y0+bs4QI+ICNHT0Kesm2zJfxl4SRXmDiChB/zdLk6YeK1Eu0VF
 3m2XiWgdDB77GNl0eGzDvmQDoJcL1frPrejqjbJYIR+7jR6RWME3zbmoGJ/qkydWRe
 w/KU3fo642D4bXf422EdxZ/S+IYiLjPDNR/EqJz87z+xWcj1AafOWzJspGXmQtIdKO
 s3Te2kuJTcNhjznJYkBuF86iIQPpjKoCikVBQNCMHgTjF5yLvpCW9GyEOgSu2KNi0E
 0eqQk6UtrGvAA==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] hw/block/nvme: consolidate qsg/iov clearing
Date: Thu, 30 Jul 2020 00:06:36 +0200
Message-Id: <20200729220638.344477-15-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729220638.344477-1-its@irrelevant.dk>
References: <20200729220638.344477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Always destroy the request qsg/iov at the end of request use.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 52 ++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3d7275eae369..045dd55376a5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -217,6 +217,17 @@ static void nvme_req_clear(NvmeRequest *req)
     memset(&req->cqe, 0x0, sizeof(req->cqe));
 }
 
+static void nvme_req_exit(NvmeRequest *req)
+{
+    if (req->qsg.sg) {
+        qemu_sglist_destroy(&req->qsg);
+    }
+
+    if (req->iov.iov) {
+        qemu_iovec_destroy(&req->iov);
+    }
+}
+
 static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
                                   size_t len)
 {
@@ -297,15 +308,14 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
 
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
@@ -326,13 +336,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
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
@@ -345,14 +353,13 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
 
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
@@ -361,27 +368,16 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
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
@@ -466,6 +462,7 @@ static void nvme_post_cqes(void *opaque)
         nvme_inc_cq_tail(cq);
         pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
             sizeof(req->cqe));
+        nvme_req_exit(req);
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
@@ -602,13 +599,6 @@ static void nvme_rw_cb(void *opaque, int ret)
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


