Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3A67571A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsLI-0001gW-Jo; Fri, 20 Jan 2023 09:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIsL5-0001dY-EX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:25:55 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIsL3-0006v5-Ux
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:25:55 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nz1sF4nxFz6J7Pn;
 Fri, 20 Jan 2023 22:21:53 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 20 Jan 2023 14:25:51 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, <alison.schofield@intel.com>, Mike Maslenkin
 <mike.maslenkin@gmail.com>
Subject: [PATCH v2 2/7] hw/pci/aer: Add missing routing for AER errors
Date: Fri, 20 Jan 2023 14:24:45 +0000
Message-ID: <20230120142450.16089-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120142450.16089-1-Jonathan.Cameron@huawei.com>
References: <20230120142450.16089-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PCIe r6.0 Figure 6-3 "Pseudo Logic Diagram for Selected Error Message Control
and Status Bits" includes a right hand branch under "All PCI Express devices"
that allows for messages to be generated or sent onwards without SERR#
being set as long as the appropriate per error class bit in the PCIe
Device Control Register is set.

Implement that branch thus enabling routing of ERR_COR, ERR_NONFATAL
and ERR_FATAL under OSes that set these bits appropriately (e.g. Linux)

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci/pcie_aer.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 909e027d99..103667c368 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -192,8 +192,16 @@ static void pcie_aer_update_uncor_status(PCIDevice *dev)
 static bool
 pcie_aer_msg_alldev(PCIDevice *dev, const PCIEAERMsg *msg)
 {
+    uint16_t devctl = pci_get_word(dev->config + dev->exp.exp_cap +
+                                   PCI_EXP_DEVCTL);
     if (!(pcie_aer_msg_is_uncor(msg) &&
-          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR))) {
+          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_NONFATAL_EN) &&
+          (devctl & PCI_EXP_DEVCTL_NFERE)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_COR_EN) &&
+          (devctl & PCI_EXP_DEVCTL_CERE)) &&
+        !((msg->severity == PCI_ERR_ROOT_CMD_FATAL_EN) &&
+          (devctl & PCI_EXP_DEVCTL_FERE))) {
         return false;
     }
 
-- 
2.37.2


