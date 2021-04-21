Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8C3666CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:11:58 +0200 (CEST)
Received: from localhost ([::1]:57092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7xl-0000z4-RQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7ra-00019W-Mj; Wed, 21 Apr 2021 04:05:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rY-00023y-4X; Wed, 21 Apr 2021 04:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQCjW61nrzlYrH;
 Wed, 21 Apr 2021 16:03:27 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:16 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 5/8] hw/pci: Add pci_bus_range to get bus number range
Date: Wed, 21 Apr 2021 08:05:00 +0000
Message-ID: <1618992303-19556-6-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This helps to get the bus number range of a pci bridge hierarchy.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci/pci.c         | 15 +++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 301addfb35..2ac3b8d76c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -538,6 +538,21 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
+{
+    int i;
+    *min_bus = *max_bus = pci_bus_num(bus);
+
+    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
+        PCIDevice *dev = bus->devices[i];
+
+        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
+            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
+            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
+        }
+    }
+}
+
 int pci_bus_numa_node(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f4d51b672b..d0f4266e37 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 }
 int pci_bus_num(PCIBus *s);
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
 static inline int pci_dev_bus_num(const PCIDevice *dev)
 {
     return pci_bus_num(pci_get_bus(dev));
-- 
2.19.1


