Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC76412935
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:10:53 +0200 (CEST)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSR2-0004Vx-KO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIp-0005Iz-WA
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:24 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIl-0004dk-7h
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:23 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HD0R64wN1z1DH8F;
 Tue, 21 Sep 2021 07:01:06 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:14 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:13 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>, 
 <marcel.apfelbaum@gmail.com>, <mst@redhat.com>
Subject: [PATCH v3 9/9] vfio: defer to commit kvm irq routing when enable
 msi/msix
Date: Tue, 21 Sep 2021 07:02:02 +0800
Message-ID: <20210920230202.1439-10-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210920230202.1439-1-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
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
Cc: chenjiashang@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 arei.gonglei@huawei.com, qemu-devel@nongnu.org
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
 hw/vfio/pci.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2de1cc5425..b26129bddf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -513,11 +513,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
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
@@ -579,8 +581,7 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
     }
 }
 
-/* TODO: invoked when enclabe msi/msix vectors */
-static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
+static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
 {
     int i;
     VFIOMSIVector *vector;
@@ -610,6 +611,9 @@ static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
+    PCIDevice *pdev = &vdev->pdev;
+    int ret;
+
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -632,11 +636,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
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
 
@@ -645,6 +660,7 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
     int ret, i;
 
     vfio_disable_interrupts(vdev);
+    vdev->defer_kvm_irq_routing = true;
 
     vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
 retry:
@@ -671,6 +687,8 @@ retry:
         vfio_add_kvm_msi_virq(vdev, vector, i, false);
     }
 
+    vfio_commit_kvm_msi_virq(vdev);
+
     /* Set interrupt type prior to possible interrupts */
     vdev->interrupt = VFIO_INT_MSI;
 
@@ -697,9 +715,11 @@ retry:
          */
         error_report("vfio: Error: Failed to enable MSI");
 
+        vdev->defer_kvm_irq_routing = false;
         return;
     }
 
+    vdev->defer_kvm_irq_routing = false;
     trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
 }
 
-- 
2.23.0


