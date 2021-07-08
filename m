Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586333BFAC5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:58:08 +0200 (CEST)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TbT-0007pa-E2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZJ-0004Lh-Gg; Thu, 08 Jul 2021 08:55:53 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005ZY-0W; Thu, 08 Jul 2021 08:55:53 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GLGN843d1z1CGSF;
 Thu,  8 Jul 2021 20:50:00 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:30 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:30 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 5/9] hw/pci: Add pci_bus_range() to get PCI bus number range
Date: Thu, 8 Jul 2021 12:55:15 +0000
Message-ID: <1625748919-52456-6-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangxingang5@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This helps to get the min and max bus number of a PCI bus hierarchy.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci/pci.c         | 16 ++++++++++++++++
 include/hw/pci/pci.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 27d588e268..23d2ae2ab2 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,22 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+/* Returns the min and max bus numbers of a PCI bus hierarchy */
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


