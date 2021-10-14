Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11AC42CFB5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 02:54:23 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map0o-0006aH-Qi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 20:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1maow5-00076E-90
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 20:49:30 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1maow2-0003TL-TA
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 20:49:29 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HV9fJ046jzbn4k;
 Thu, 14 Oct 2021 08:44:56 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 08:49:24 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 08:49:24 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v4 6/6] vfio: defer to commit kvm irq routing when enable
 msi/msix
Date: Thu, 14 Oct 2021 08:48:52 +0800
Message-ID: <20211014004852.1293-7-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20211014004852.1293-1-longpeng2@huawei.com>
References: <20211014004852.1293-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
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
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In migration resume phase, all unmasked msix vectors need to be
setup when loading the VF state. However, the setup operation would
take longer if the VM has more VFs and each VF has more unmasked
vectors.

The hot spot is kvm_irqchip_commit_routes, it'll scan and update
all irqfds that are already assigned each invocation, so more
vectors means need more time to process them.

vfio_pci_load_config
  vfio_msix_enable
    msix_set_vector_notifiers
      for (vector = 0; vector < dev->msix_entries_nr; vector++) {
        vfio_msix_vector_do_use
          vfio_add_kvm_msi_virq
            kvm_irqchip_commit_routes <-- expensive
      }

We can reduce the cost by only committing once outside the loop.
The routes are cached in kvm_state, we commit them first and then
bind irqfd for each vector.

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

The optimization can be applied to msi type too.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++------------
 hw/vfio/pci.h |   1 +
 2 files changed, 105 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0bd832b..dca2d0c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -413,8 +413,6 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
                                   int vector_n, bool msix)
 {
-    int virq;
-
     if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
         return;
     }
@@ -423,20 +421,31 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
-    if (virq < 0) {
+    vector->virq = kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n,
+                                                      &vdev->pdev);
+    if (vector->virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
+        vector->virq = -1;
+        return;
+    }
+
+    if (vdev->defer_kvm_irq_routing) {
+        /*
+         * The vector->virq will be reset to -1 if we fail to add the
+         * corresponding irqfd in vfio_commit_kvm_msi_virq_batch().
+         */
         return;
     }
 
+    kvm_irqchip_commit_routes(kvm_state);
+
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
-                                       NULL, virq) < 0) {
-        kvm_irqchip_release_virq(kvm_state, virq);
+                                           NULL, vector->virq) < 0) {
+        kvm_irqchip_release_virq(kvm_state, vector->virq);
         event_notifier_cleanup(&vector->kvm_interrupt);
+        vector->virq = -1;
         return;
     }
-
-    vector->virq = virq;
 }
 
 static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
@@ -501,11 +510,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
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
@@ -567,6 +578,46 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
     }
 }
 
+static void vfio_prepare_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
+{
+    assert(!vdev->defer_kvm_irq_routing);
+    vdev->defer_kvm_irq_routing = true;
+}
+
+static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
+{
+    VFIOMSIVector *vector;
+    int i;
+
+    if (!vdev->defer_kvm_irq_routing) {
+        return;
+    }
+
+    vdev->defer_kvm_irq_routing = false;
+
+    if (!vdev->nr_vectors) {
+        return;
+    }
+
+    kvm_irqchip_commit_routes(kvm_state);
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        vector = &vdev->msi_vectors[i];
+
+        if (!vector->use || vector->virq < 0) {
+            continue;
+        }
+
+        if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                               &vector->kvm_interrupt,
+                                               NULL, vector->virq) < 0) {
+            kvm_irqchip_release_virq(kvm_state, vector->virq);
+            event_notifier_cleanup(&vector->kvm_interrupt);
+            vector->virq = -1;
+        }
+    }
+}
+
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
     vfio_disable_interrupts(vdev);
@@ -576,26 +627,45 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
     vdev->interrupt = VFIO_INT_MSIX;
 
     /*
-     * Some communication channels between VF & PF or PF & fw rely on the
-     * physical state of the device and expect that enabling MSI-X from the
-     * guest enables the same on the host.  When our guest is Linux, the
-     * guest driver call to pci_enable_msix() sets the enabling bit in the
-     * MSI-X capability, but leaves the vector table masked.  We therefore
-     * can't rely on a vector_use callback (from request_irq() in the guest)
-     * to switch the physical device into MSI-X mode because that may come a
-     * long time after pci_enable_msix().  This code enables vector 0 with
-     * triggering to userspace, then immediately release the vector, leaving
-     * the physical device with no vectors enabled, but MSI-X enabled, just
-     * like the guest view.
+     * Setting vector notifiers triggers synchronous vector-use
+     * callbacks for each active vector.  Deferring to commit the KVM
+     * routes once rather than per vector provides a substantial
+     * performance improvement.
      */
-    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
-    vfio_msix_vector_release(&vdev->pdev, 0);
+    vfio_prepare_kvm_msi_virq_batch(vdev);
 
     if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
         error_report("vfio: msix_set_vector_notifiers failed");
     }
 
+    vfio_commit_kvm_msi_virq_batch(vdev);
+
+    if (vdev->nr_vectors) {
+        int ret;
+
+        ret = vfio_enable_vectors(vdev, true);
+        if (ret) {
+            error_report("vfio: failed to enable vectors, %d", ret);
+        }
+    } else {
+        /*
+         * Some communication channels between VF & PF or PF & fw rely on the
+         * physical state of the device and expect that enabling MSI-X from the
+         * guest enables the same on the host.  When our guest is Linux, the
+         * guest driver call to pci_enable_msix() sets the enabling bit in the
+         * MSI-X capability, but leaves the vector table masked.  We therefore
+         * can't rely on a vector_use callback (from request_irq() in the guest)
+         * to switch the physical device into MSI-X mode because that may come a
+         * long time after pci_enable_msix().  This code enables vector 0 with
+         * triggering to userspace, then immediately release the vector, leaving
+         * the physical device with no vectors enabled, but MSI-X enabled, just
+         * like the guest view.
+         */
+        vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
+        vfio_msix_vector_release(&vdev->pdev, 0);
+    }
+
     trace_vfio_msix_enable(vdev->vbasedev.name);
 }
 
@@ -605,6 +675,13 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
 
     vfio_disable_interrupts(vdev);
 
+    /*
+     * Setting vector notifiers needs to enable route for each vector.
+     * Deferring to commit the KVM routes once rather than per vector
+     * provides a substantial performance improvement.
+     */
+    vfio_prepare_kvm_msi_virq_batch(vdev);
+
     vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
 retry:
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->nr_vectors);
@@ -630,6 +707,8 @@ retry:
         vfio_add_kvm_msi_virq(vdev, vector, i, false);
     }
 
+    vfio_commit_kvm_msi_virq_batch(vdev);
+
     /* Set interrupt type prior to possible interrupts */
     vdev->interrupt = VFIO_INT_MSI;
 
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 6477751..d3c5177 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -171,6 +171,7 @@ struct VFIOPCIDevice {
     bool no_kvm_ioeventfd;
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
+    bool defer_kvm_irq_routing;
     VFIODisplay *dpy;
     Notifier irqchip_change_notifier;
 };
-- 
1.8.3.1


