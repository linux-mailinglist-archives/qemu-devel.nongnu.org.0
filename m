Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C03FFD4A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:38:09 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5eC-0000BD-O0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM5cn-0006ch-Qz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:36:41 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM5cm-0006mL-5k
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:36:41 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H1CHl6C9bz8xWT;
 Fri,  3 Sep 2021 17:32:19 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 17:36:36 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 3 Sep 2021 17:36:35 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in live
 migration
Date: Fri, 3 Sep 2021 17:36:10 +0800
Message-ID: <20210903093611.1159-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210903093611.1159-1-jiangkunkun@huawei.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
vfio_pci_write_config to improve IO performance.
The MemoryRegions of destination VM will not be expanded
successful in live migration, because their addresses have
been updated in vmstate_load_state (vfio_pci_load_config).

Remove the restriction on base address change in
vfio_pci_write_config for correct mmapping sub-page MMIO
BARs. Accroding to my analysis, the remaining parameter
verification is enough.

Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI devices)
Reported-by: Nianyao Tang <tangnianyao@huawei.com>
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/pci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23..891b211ddf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1189,18 +1189,12 @@ void vfio_pci_write_config(PCIDevice *pdev,
         }
     } else if (ranges_overlap(addr, len, PCI_BASE_ADDRESS_0, 24) ||
         range_covers_byte(addr, len, PCI_COMMAND)) {
-        pcibus_t old_addr[PCI_NUM_REGIONS - 1];
         int bar;
 
-        for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
-            old_addr[bar] = pdev->io_regions[bar].addr;
-        }
-
         pci_default_write_config(pdev, addr, val, len);
 
         for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
-            if (old_addr[bar] != pdev->io_regions[bar].addr &&
-                vdev->bars[bar].region.size > 0 &&
+            if (vdev->bars[bar].region.size > 0 &&
                 vdev->bars[bar].region.size < qemu_real_host_page_size) {
                 vfio_sub_page_bar_update_mapping(pdev, bar);
             }
-- 
2.23.0


