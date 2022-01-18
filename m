Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54E492CA8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:51:04 +0100 (CET)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sdI-0008Ud-JA
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1n9sbS-0007F9-IW
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:49:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1n9sbQ-0001hg-Aa
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:49:06 -0500
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jdbly6cLwz67YZ9;
 Wed, 19 Jan 2022 01:45:50 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 18 Jan 2022 18:48:56 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 18 Jan 2022 17:48:56 +0000
To: Marcel Apfelbaum <marcel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
CC: Jiahui Cen <cenjiahui@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH] hw/pci-bridge/pxb: Fix missing swizzle
Date: Tue, 18 Jan 2022 17:48:55 +0000
Message-ID: <20220118174855.19325-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

pxb_map_irq_fn() handled the necessary removal of the swizzle
applied to the PXB interrupts by the bus to which it was attached
but neglected to apply the normal swizzle for PCI root ports
on the expander bridge.

Result of this was on ARM virt, the PME interrupts for a second
RP on a PXB instance were miss-routed to #45 rather than #46.

Tested with a selection of different configurations with 1 to 5
RP per PXB instance.  Note on my x86 test setup the PME interrupts
are not triggered so I haven't been able to test this.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 10e6e7c2ab..de932286b5 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -192,6 +192,12 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 {
     PCIDevice *pxb = pci_get_bus(pci_dev)->parent_dev;
 
+    /*
+     * First carry out normal swizzle to handle
+     * multple root ports on a pxb instance.
+     */
+    pin = pci_swizzle_map_irq_fn(pci_dev, pin);
+
     /*
      * The bios does not index the pxb slot number when
      * it computes the IRQ because it resides on bus 0
-- 
2.32.0


