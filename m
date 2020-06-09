Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DA1F3739
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 11:47:06 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiaqX-00063G-V5
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 05:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiaov-0004vV-Rd; Tue, 09 Jun 2020 05:45:25 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiaou-0004DV-CY; Tue, 09 Jun 2020 05:45:25 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 2D33ABF66F;
 Tue,  9 Jun 2020 09:45:20 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: add msix_qsize parameter
Date: Tue,  9 Jun 2020 11:45:07 +0200
Message-Id: <20200609094508.32412-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609094508.32412-1-its@irrelevant.dk>
References: <20200609094508.32412-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 05:45:20
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

Commit 4eb9f5217a16 ("hw/block/nvme: allow use of any valid msix
vector") erronously allows any valid MSI-X vector to be used when
creating completion queues. This is bad because MSI-X is initialized
with max_ioqpairs + 1 vectors, which defaults to 64 + 1. And since
commit ccd579b2ed03 ("hw/block/nvme: Verify msix_vector_use() returned
value"), this also causes an assert if the host creates a completion
queue with an invalid vector.

Fix this by decoupling the requested maximum number of ioqpairs (param
max_ioqpairs) from the number of MSI-X interrupt vectors by introducing
a new msix_qsize parameter and initialize MSI-X with that. This allows
emulating a device that has fewer vectors than I/O queue pairs and also
allows more than 2048 queue pairs. To get the same default behaviour as
previously, msix_qsize defaults to 65 (max_ioqpairs default + 1).

This decoupling was actually suggested by Maxim some time ago in a
slightly different context, so adding a Suggested-by.

Fixes: 4eb9f5217a16 ("hw/block/nvme: allow use of any valid msix vector")
Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 +++++++++++++----
 hw/block/nvme.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 567bce75191a..acc6dbc900e2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -54,6 +54,7 @@
 #include "trace.h"
 #include "nvme.h"
 
+#define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_REG_SIZE 0x1000
 #define NVME_DB_SIZE  4
 #define NVME_CMB_BIR 2
@@ -662,7 +663,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
-    if (unlikely(vector > PCI_MSIX_FLAGS_QSIZE)) {
+    if (unlikely(vector >= n->params.msix_qsize)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
@@ -1371,9 +1372,16 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     }
 
     if (params->max_ioqpairs < 1 ||
-        params->max_ioqpairs > PCI_MSIX_FLAGS_QSIZE) {
+        params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
         error_setg(errp, "max_ioqpairs must be between 1 and %d",
-                   PCI_MSIX_FLAGS_QSIZE);
+                   NVME_MAX_IOQPAIRS);
+        return;
+    }
+
+    if (params->msix_qsize < 1 ||
+        params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
+        error_setg(errp, "msix_qsize must be between 1 and %d",
+                   PCI_MSIX_FLAGS_QSIZE + 1);
         return;
     }
 
@@ -1527,7 +1535,7 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
                           n->reg_size);
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
-    msix_init_exclusive_bar(pci_dev, n->params.max_ioqpairs + 1, 4, NULL);
+    msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, NULL);
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
@@ -1634,6 +1642,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
     DEFINE_PROP_UINT32("max_ioqpairs", NvmeCtrl, params.max_ioqpairs, 64),
+    DEFINE_PROP_UINT16("msix_qsize", NvmeCtrl, params.msix_qsize, 65),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 61dd9b23b81d..1d30c0bca283 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -7,6 +7,7 @@ typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
     uint32_t max_ioqpairs;
+    uint16_t msix_qsize;
     uint32_t cmb_size_mb;
 } NvmeParams;
 
-- 
2.27.0


