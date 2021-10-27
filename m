Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0C43C61E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:07:38 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfeuI-0003Zd-2O
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mferg-0001NE-9a
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:04:56 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mferQ-00080y-UO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:04:56 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HfN4W36Cqz1DHtg;
 Wed, 27 Oct 2021 17:02:35 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 17:04:30 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Wed, 27 Oct 2021 17:04:30 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] vfio/pci: Add support for mmapping sub-page MMIO BARs
 after live migration
Date: Wed, 27 Oct 2021 17:04:05 +0800
Message-ID: <20211027090406.761-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20211027090406.761-1-jiangkunkun@huawei.com>
References: <20211027090406.761-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

We can expand MemoryRegions of sub-page MMIO BARs in
vfio_pci_write_config() to improve IO performance for some
devices. However, the MemoryRegions of destination VM are
not expanded any more after live migration. Because their
addresses have been updated in vmstate_load_state()
(vfio_pci_load_config) and vfio_sub_page_bar_update_mapping()
will not be called.

This may result in poor performance after live migration.
So iterate BARs in vfio_pci_load_config() and try to update
sub-page BARs.

Reported-by: Nianyao Tang <tangnianyao@huawei.com>
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/pci.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5cdf1d4298..7b45353ce2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
     PCIDevice *pdev = &vdev->pdev;
-    int ret;
+    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
+    int bar, ret;
+
+    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
+        old_addr[bar] = pdev->io_regions[bar].addr;
+    }
 
     ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
     if (ret) {
@@ -2463,6 +2468,18 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
     vfio_pci_write_config(pdev, PCI_COMMAND,
                           pci_get_word(pdev->config + PCI_COMMAND), 2);
 
+    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
+        /*
+         * The address may not be changed in some scenarios
+         * (e.g. the VF driver isn't loaded in VM).
+         */
+        if (old_addr[bar] != pdev->io_regions[bar].addr &&
+            vdev->bars[bar].region.size > 0 &&
+            vdev->bars[bar].region.size < qemu_real_host_page_size) {
+            vfio_sub_page_bar_update_mapping(pdev, bar);
+        }
+    }
+
     if (msi_enabled(pdev)) {
         vfio_msi_enable(vdev);
     } else if (msix_enabled(pdev)) {
-- 
2.23.0


