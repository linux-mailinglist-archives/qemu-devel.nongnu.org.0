Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD4326C43
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 09:37:04 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFv5z-00063Z-4d
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 03:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3N-0004Uy-T6; Sat, 27 Feb 2021 03:34:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vz-CC; Sat, 27 Feb 2021 03:34:21 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT4NXMzjSYF;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:33:58 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 1/4] pci: Add PCI_BUS_IOMMU property
Date: Sat, 27 Feb 2021 08:33:48 +0000
Message-ID: <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This Property can be useful to check whether this bus is attached to iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 include/hw/pci/pci_bus.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..42109e8a06 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -24,6 +24,8 @@ enum PCIBusFlags {
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
+    /* Iommu is enabled on this bus */
+    PCI_BUS_IOMMU                                           = 0x0004,
 };
 
 struct PCIBus {
@@ -63,4 +65,15 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
 }
 
+static inline bool pci_bus_has_iommu(PCIBus *bus)
+{
+    PCIBus *root_bus = bus;
+
+    while (root_bus && !pci_bus_is_root(root_bus)) {
+        root_bus = pci_get_bus(root_bus->parent_dev);
+    }
+
+    return !!(root_bus->flags & PCI_BUS_IOMMU);
+}
+
 #endif /* QEMU_PCI_BUS_H */
-- 
2.19.1


