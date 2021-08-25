Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5683F70CE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:59:34 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInos-0006Bs-0Z
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmO-0007hJ-L4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:57:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmI-0005eK-7J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:57:00 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GvdW73xNtzbj4g;
 Wed, 25 Aug 2021 15:52:51 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:41 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:40 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>
Subject: [PATCH 5/5] vfio: defer to commit kvm route in migraiton resume phase
Date: Wed, 25 Aug 2021 15:56:20 +0800
Message-ID: <20210825075620.2607-6-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210825075620.2607-1-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In migration resume phase, all unmasked msix vectors need to be
setup when load the VF state. However, the setup operation would
takes longer if the VF has more unmasked vectors.

In our case, the VF has 65 vectors and each one spend at most 0.8ms
on setup operation the total cost of the VF is about 8-58ms. For a
VM that has 8 VFs of this type, the total cost is more than 250ms.

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

The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
we mesure the cost of the vfio_msix_enable for each one, and
we can see 90+% costs can be reduce.

        Origin          Apply this patch
                        and vfio enable optimization
1st     8               2
2nd     15              2
3rd     22              2
4th     24              3
5th     36              2
6th     44              3
7th     51              3
8th     58              4
Total   258ms           21ms

The optimition can be also applied to msi type.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 3ab67d6..50e7ec7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -427,12 +427,17 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
+    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev,
+                                     vdev->defer_add_virq);
     if (virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
         return;
     }
 
+    if (vdev->defer_add_virq) {
+        goto out;
+    }
+
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                        NULL, virq) < 0) {
         kvm_irqchip_release_virq(kvm_state, virq);
@@ -440,6 +445,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
+out:
     vector->virq = virq;
 }
 
@@ -577,6 +583,36 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
     }
 }
 
+static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
+{
+    int i;
+    VFIOMSIVector *vector;
+    bool commited = false;
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        vector = &vdev->msi_vectors[i];
+
+        if (vector->virq < 0) {
+            continue;
+        }
+
+        /* Commit cached route entries to KVM core first if not yet */
+        if (!commited) {
+            kvm_irqchip_commit_routes(kvm_state);
+            commited = true;
+        }
+
+        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                               &vector->kvm_interrupt,
+                                               NULL, vector->virq) < 0) {
+            kvm_irqchip_release_virq(kvm_state, vector->virq);
+            event_notifier_cleanup(&vector->kvm_interrupt);
+            vector->virq = -1;
+            return;
+        }
+    }
+}
+
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
     PCIDevice *pdev = &vdev->pdev;
@@ -624,6 +660,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
     if (!pdev->msix_function_masked && vdev->defer_add_virq) {
         int ret;
         vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
+        vfio_commit_kvm_msi_virq(vdev);
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
             error_report("vfio: failed to enable vectors, %d", ret);
@@ -664,6 +701,10 @@ retry:
         vfio_add_kvm_msi_virq(vdev, vector, i, false);
     }
 
+    if (vdev->defer_add_virq){
+        vfio_commit_kvm_msi_virq(vdev);
+    }
+
     /* Set interrupt type prior to possible interrupts */
     vdev->interrupt = VFIO_INT_MSI;
 
@@ -2473,13 +2514,13 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
     vfio_pci_write_config(pdev, PCI_COMMAND,
                           pci_get_word(pdev->config + PCI_COMMAND), 2);
 
+    vdev->defer_add_virq = true;
     if (msi_enabled(pdev)) {
         vfio_msi_enable(vdev);
     } else if (msix_enabled(pdev)) {
-        vdev->defer_add_virq = true;
         vfio_msix_enable(vdev);
-        vdev->defer_add_virq = false;
     }
+    vdev->defer_add_virq = false;
 
     return ret;
 }
-- 
1.8.3.1


