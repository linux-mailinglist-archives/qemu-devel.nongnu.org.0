Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E820D5D9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:55:00 +0200 (CEST)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzrn-0005Ey-Kc
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznW-0007BF-Lx; Mon, 29 Jun 2020 15:50:34 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznS-0005wg-KB; Mon, 29 Jun 2020 15:50:34 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 76651BF803;
 Mon, 29 Jun 2020 19:50:26 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 07/17] hw/block/nvme: add request mapping helper
Date: Mon, 29 Jun 2020 21:50:07 +0200
Message-Id: <20200629195017.1217056-8-its@irrelevant.dk>
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

Introduce the nvme_map helper to remove some noise in the main nvme_rw
function.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e7b7a1900b0b..d236a3cdee54 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -378,6 +378,15 @@ static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return status;
 }
 
+static uint16_t nvme_map(NvmeCtrl *n, NvmeCmd *cmd, size_t len,
+                         NvmeRequest *req)
+{
+    uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
+
+    return nvme_map_prp(n, &req->qsg, &req->iov, prp1, prp2, len, req);
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -565,8 +574,6 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     NvmeRwCmd *rw = (NvmeRwCmd *)cmd;
     uint32_t nlb  = le32_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint64_t prp1 = le64_to_cpu(rw->dptr.prp1);
-    uint64_t prp2 = le64_to_cpu(rw->dptr.prp2);
 
     uint8_t lba_index  = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
@@ -583,7 +590,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
-    if (nvme_map_prp(n, &req->qsg, &req->iov, prp1, prp2, data_size, req)) {
+    if (nvme_map(n, cmd, data_size, req)) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
-- 
2.27.0


