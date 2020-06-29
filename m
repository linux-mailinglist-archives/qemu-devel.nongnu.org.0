Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645BA20D5E4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:59:10 +0200 (CEST)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzvp-0005E7-1o
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznr-0007TI-9x; Mon, 29 Jun 2020 15:50:55 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpznp-0005zW-Ex; Mon, 29 Jun 2020 15:50:54 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D1B4DBF450;
 Mon, 29 Jun 2020 19:50:29 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 16/17] hw/block/nvme: add nvme_check_rw helper
Date: Mon, 29 Jun 2020 21:50:16 +0200
Message-Id: <20200629195017.1217056-17-its@irrelevant.dk>
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

Move various request checks to a separate function.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d836319f068a..ec08841f74b6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -632,6 +632,28 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    size_t len = req->nlb << nvme_ns_lbads(ns);
+    uint16_t status;
+
+    status = nvme_check_mdts(n, len);
+    if (status) {
+        trace_pci_nvme_err_mdts(nvme_cid(req), len);
+        return status;
+    }
+
+    status = nvme_check_bounds(n, ns, req->slba, req->nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(req->slba, req->nlb,
+                                             ns->id_ns.nsze);
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_rw_cb(NvmeRequest *req, void *opaque)
 {
     NvmeSQueue *sq = req->sq;
@@ -822,16 +844,8 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_rw(nvme_req_is_write(req) ? "write" : "read", req->nlb,
                       len, req->slba);
 
-    status = nvme_check_mdts(n, len);
+    status = nvme_check_rw(n, req);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), len);
-        goto invalid;
-    }
-
-    status = nvme_check_bounds(n, ns, req->slba, req->nlb);
-    if (status) {
-        trace_pci_nvme_err_invalid_lba_range(req->slba, req->nlb,
-                                             ns->id_ns.nsze);
         goto invalid;
     }
 
-- 
2.27.0


