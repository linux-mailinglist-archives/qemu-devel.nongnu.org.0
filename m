Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4D225DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:50:43 +0200 (CEST)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxUJe-0007vv-OZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7o-0008BJ-QX; Mon, 20 Jul 2020 07:38:28 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7k-0005Bm-6B; Mon, 20 Jul 2020 07:38:28 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D98B0BFB1E;
 Mon, 20 Jul 2020 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595245082;
 bh=zNne+NiV3CJC/jm5tvMYdE+rFa0IL4qpEdFF4gpG/Wg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qHWBgMcjF2awQmjXTicoQjvdILZ2/7otzKOqloPj1x8p6ofiVXXbdSk5dFahaXrmP
 aqcjIGkCcQWFludid8vCun7AKjqFzGfASMSM75HTxEZZebM6vf/uHGw/nyaMTQhC/Q
 2NFnbPYsh5WnPAeuUXE7eJdnlXlL5zSqDDssggMKimF1W/D41rkdJyAoUKB+ji0wUW
 5VZurQ2G8QtytDvfHJXwp2PuzCGMsMu6F9wMGDEqBRY36SQidKp7X/U/JJhnF/IXlm
 MlMCGSBlQUfXRv6NsSfIP8/WvOTz5NM8+TnjcO7khLaHcFNHR5OSCjMRlvXy+FHv8h
 FwEkmC9NdC7AA==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/16] hw/block/nvme: add a namespace reference in NvmeRequest
Date: Mon, 20 Jul 2020 13:37:45 +0200
Message-Id: <20200720113748.322965-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720113748.322965-1-its@irrelevant.dk>
References: <20200720113748.322965-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 07:37:55
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Instead of passing around the NvmeNamespace, add it as a member in the
NvmeRequest structure.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 21 ++++++++++-----------
 hw/block/nvme.h |  1 +
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 431f26c2f589..54cd20f1ce22 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -211,6 +211,7 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
 
 static void nvme_req_clear(NvmeRequest *req)
 {
+    req->ns = NULL;
     memset(&req->cqe, 0x0, sizeof(req->cqe));
 }
 
@@ -610,8 +611,7 @@ static void nvme_rw_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(cq, req);
 }
 
-static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
          BLOCK_ACCT_FLUSH);
@@ -620,10 +620,10 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     return NVME_NO_COMPLETE;
 }
 
-static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)cmd;
+    NvmeNamespace *ns = req->ns;
     const uint8_t lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     const uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
     uint64_t slba = le64_to_cpu(rw->slba);
@@ -647,10 +647,10 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     return NVME_NO_COMPLETE;
 }
 
-static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)cmd;
+    NvmeNamespace *ns = req->ns;
     uint32_t nlb  = le32_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
 
@@ -706,7 +706,6 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
 
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
-    NvmeNamespace *ns;
     uint32_t nsid = le32_to_cpu(cmd->nsid);
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req), cmd->opcode);
@@ -716,15 +715,15 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    ns = &n->namespaces[nsid - 1];
+    req->ns = &n->namespaces[nsid - 1];
     switch (cmd->opcode) {
     case NVME_CMD_FLUSH:
-        return nvme_flush(n, ns, cmd, req);
+        return nvme_flush(n, cmd, req);
     case NVME_CMD_WRITE_ZEROES:
-        return nvme_write_zeroes(n, ns, cmd, req);
+        return nvme_write_zeroes(n, cmd, req);
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
-        return nvme_rw(n, ns, cmd, req);
+        return nvme_rw(n, cmd, req);
     default:
         trace_pci_nvme_err_invalid_opc(cmd->opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 137cd8c2bf20..586fd3d62700 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -21,6 +21,7 @@ typedef struct NvmeAsyncEvent {
 
 typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
+    struct NvmeNamespace    *ns;
     BlockAIOCB              *aiocb;
     uint16_t                status;
     NvmeCqe                 cqe;
-- 
2.27.0


