Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F281D261B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 06:56:47 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ5vK-00025p-T6
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 00:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lr-0001X7-FJ; Thu, 14 May 2020 00:46:59 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lq-0003l9-GC; Thu, 14 May 2020 00:46:59 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 8D6B5BFE3B;
 Thu, 14 May 2020 04:46:34 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 11/20] hw/block/nvme: factor out property/constraint checks
Date: Thu, 14 May 2020 06:46:02 +0200
Message-Id: <20200514044611.734782-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514044611.734782-1-its@irrelevant.dk>
References: <20200514044611.734782-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 00:46:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e93ed729aef5..1d4fbba9c5da 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1356,24 +1356,19 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 {
-    NvmeCtrl *n = NVME(pci_dev);
-    NvmeIdCtrl *id = &n->id_ctrl;
+    NvmeParams *params = &n->params;
 
-    int i;
-    int64_t bs_size;
-    uint8_t *pci_conf;
-
-    if (n->params.num_queues) {
+    if (params->num_queues) {
         warn_report("num_queues is deprecated; please use max_ioqpairs "
                     "instead");
 
-        n->params.max_ioqpairs = n->params.num_queues - 1;
+        params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->params.max_ioqpairs < 1 ||
-        n->params.max_ioqpairs > PCI_MSIX_FLAGS_QSIZE) {
+    if (params->max_ioqpairs < 1 ||
+        params->max_ioqpairs > PCI_MSIX_FLAGS_QSIZE) {
         error_setg(errp, "max_ioqpairs must be between 1 and %d",
                    PCI_MSIX_FLAGS_QSIZE);
         return;
@@ -1384,13 +1379,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
-    bs_size = blk_getlength(n->conf.blk);
-    if (bs_size < 0) {
-        error_setg(errp, "could not get backing file size");
-        return;
-    }
-
-    if (!n->params.serial) {
+    if (!params->serial) {
         error_setg(errp, "serial property not set");
         return;
     }
@@ -1410,6 +1399,29 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
         host_memory_backend_set_mapped(n->pmrdev, true);
     }
+}
+
+static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+    NvmeIdCtrl *id = &n->id_ctrl;
+    Error *local_err = NULL;
+
+    int i;
+    int64_t bs_size;
+    uint8_t *pci_conf;
+
+    nvme_check_constraints(n, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    bs_size = blk_getlength(n->conf.blk);
+    if (bs_size < 0) {
+        error_setg(errp, "could not get backing file size");
+        return;
+    }
 
     blkconf_blocksizes(&n->conf);
     if (!blkconf_apply_backend_options(&n->conf, blk_is_read_only(n->conf.blk),
-- 
2.26.2


