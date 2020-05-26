Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122211D2613
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 06:54:13 +0200 (CEST)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ5sq-0005X4-3D
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 00:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lr-0001XR-Jr; Thu, 14 May 2020 00:46:59 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lq-0003lC-KJ; Thu, 14 May 2020 00:46:59 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id EBBD3BFE3D;
 Thu, 14 May 2020 04:46:34 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 12/20] hw/block/nvme: factor out device state setup
Date: Thu, 14 May 2020 06:46:03 +0200
Message-Id: <20200514044611.734782-13-its@irrelevant.dk>
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
 hw/block/nvme.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1d4fbba9c5da..617b2f0005df 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1401,6 +1401,17 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     }
 }
 
+static void nvme_init_state(NvmeCtrl *n)
+{
+    n->num_namespaces = 1;
+    /* add one to max_ioqpairs to account for the admin queue pair */
+    n->reg_size = pow2ceil(NVME_REG_SIZE +
+                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
+    n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
+    n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
+    n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
@@ -1417,6 +1428,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
+    nvme_init_state(n);
+
     bs_size = blk_getlength(n->conf.blk);
     if (bs_size < 0) {
         error_setg(errp, "could not get backing file size");
@@ -1435,17 +1448,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     pci_config_set_class(pci_dev->config, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
 
-    n->num_namespaces = 1;
-
-    /* add one to max_ioqpairs to account for the admin queue pair */
-    n->reg_size = pow2ceil(NVME_REG_SIZE +
-                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
     n->ns_size = bs_size / (uint64_t)n->num_namespaces;
 
-    n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
-    n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
-    n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
-
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n,
                           "nvme", n->reg_size);
     pci_register_bar(pci_dev, 0,
-- 
2.26.2


