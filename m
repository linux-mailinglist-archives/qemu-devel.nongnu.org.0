Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F76404581
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:15:08 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODL1-0001St-Ee
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCk-0004Dn-Gf
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:34 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-00065E-QN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:34 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H4pLh3tLlzQvHV;
 Thu,  9 Sep 2021 14:02:20 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:22 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:21 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2 9/9] vfio: defer to commit kvm irq routing when enable
 msi/msix
Date: Thu, 9 Sep 2021 14:06:13 +0800
Message-ID: <20210909060613.2815-10-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210909060613.2815-1-longpeng2@huawei.com>
References: <20210909060613.2815-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In migration resume phase, all unmasked msix vectors need to be
setup when load the VF state. However, the setup operation would
take longer if the VM has more VFs and each VF has more unmasked
vectors.

The hot spot is kvm_irqchip_commit_routes, it'll scan and update
all irqfds that already assigned each invocation, so more vectors
means need more time to process them.

vfio_pci_load_config
  vfio_msix_enable
    msix_set_vector_notifiers
      for (vector = 0; vector < dev->msix_entries_nr; vector++) {
        vfio_msix_vector_do_use
          vfio_add_kvm_msi_virq
            kvm_irqchip_commit_routes <-- expensive
      }

We can reduce the cost by only commit once outside the loop. The
routes is cached in kvm_state, we commit them first and then bind
irqfd for each vector.

The test VM has 128 vcpus and 8 VF (each one has 65 vectors),
we measure the cost of the vfio_msix_enable for each VF, and
we can see 90+% costs can be reduce.

VF      Count of irqfds[*]  Original        With this patch

1st           65            8               2
2nd           130           15              2
3rd           195           22              2
4th           260           24              3
5th           325           36              2
6th           390           44              3
7th           455           51              3
8th           520           58              4
Total                       258ms           21ms

[*] Count of irqfds
How many irqfds that already assigned and need to process in this
round.

The optimition can be applied to msi type too.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4aedb5a..cc85cc1 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -512,11 +512,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
      * increase them as needed.
      */
     if (vdev->nr_vectors < nr + 1) {
-        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
         vdev->nr_vectors = nr + 1;
-        ret = vfio_enable_vectors(vdev, true);
-        if (ret) {
-            error_report("vfio: failed to enable vectors, %d", ret);
+        if (!vdev->defer_kvm_irq_routing) {
+            vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
+            ret = vfio_enable_vectors(vdev, true);
+            if (ret) {
+                error_report("vfio: failed to enable vectors, %d", ret);
+            }
         }
     } else {
         Error *err = NULL;
@@ -608,6 +610,9 @@ static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
+    PCIDevice *pdev = &vdev->pdev;
+    int ret;
+
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -630,11 +635,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
     vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
     vfio_msix_vector_release(&vdev->pdev, 0);
 
-    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
-                                  vfio_msix_vector_release, NULL)) {
+    vdev->defer_kvm_irq_routing = true;
+
+    ret = msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
+                                    vfio_msix_vector_release, NULL);
+    if (ret < 0) {
         error_report("vfio: msix_set_vector_notifiers failed");
+    } else if (!pdev->msix_function_masked) {
+        vfio_commit_kvm_msi_virq(vdev);
+        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
+        ret = vfio_enable_vectors(vdev, true);
+        if (ret) {
+            error_report("vfio: failed to enable vectors, %d", ret);
+        }
     }
 
+    vdev->defer_kvm_irq_routing = false;
     trace_vfio_msix_enable(vdev->vbasedev.name);
 }
 
@@ -643,6 +659,7 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
     int ret, i;
 
     vfio_disable_interrupts(vdev);
+    vdev->defer_kvm_irq_routing = true;
 
     vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
 retry:
@@ -669,6 +686,8 @@ retry:
         vfio_add_kvm_msi_virq(vdev, vector, i, false);
     }
 
+    vfio_commit_kvm_msi_virq(vdev);
+
     /* Set interrupt type prior to possible interrupts */
     vdev->interrupt = VFIO_INT_MSI;
 
@@ -695,9 +714,11 @@ retry:
          */
         error_report("vfio: Error: Failed to enable MSI");
 
+        vdev->defer_kvm_irq_routing = false;
         return;
     }
 
+    vdev->defer_kvm_irq_routing = false;
     trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
 }
 
-- 
1.8.3.1


