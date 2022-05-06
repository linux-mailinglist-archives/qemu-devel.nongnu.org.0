Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1551E058
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:51:22 +0200 (CEST)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4v3-0006zD-6X
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4rS-0000Pk-3k
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4rQ-0005kc-0A
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lE3gOnyGxh/AIC3swK3bcvMvaXjz20T86n5l+mQoXKc=;
 b=imLQbIFt5PNQU0Fa5ymnYXOnCEibGZIKIDU1+BXnrIouAYLwBASM3GLOQ66UFgyR6kTjmT
 n8KHdulZwWkk4Up0lvsyllbdu3GmejNKmbjjVWd0eBShird9FoV8zF03jx4OoLNRasdnQe
 UagH0OSW93KiltG8yxMe4AGVTC6lyZc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-MAqfPQZ3PUe04_08Vmxssw-1; Fri, 06 May 2022 16:47:32 -0400
X-MC-Unique: MAqfPQZ3PUe04_08Vmxssw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14232185A7BA;
 Fri,  6 May 2022 20:47:32 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF1CD40CF8E8;
 Fri,  6 May 2022 20:47:31 +0000 (UTC)
Subject: [PULL 05/11] vfio: defer to commit kvm irq routing when enable
 msi/msix
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Longpeng (Mike)" <longpeng2@huawei.com>
Date: Fri, 06 May 2022 14:47:31 -0600
Message-ID: <165187004945.4166595.9260740531192655745.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Longpeng(Mike) <longpeng2@huawei.com>

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
Link: https://lore.kernel.org/r/20220326060226.1892-6-longpeng2@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |  130 +++++++++++++++++++++++++++++++++++++++++++--------------
 hw/vfio/pci.h |    2 +
 2 files changed, 99 insertions(+), 33 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8bc36f081afd..ef9d7bf326de 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -45,6 +45,9 @@
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
+/* Protected by BQL */
+static KVMRouteChange vfio_route_change;
+
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
@@ -413,33 +416,36 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
                                   int vector_n, bool msix)
 {
-    KVMRouteChange c;
-    int virq;
-
     if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    vector->virq = kvm_irqchip_add_msi_route(&vfio_route_change,
+                                             vector_n, &vdev->pdev);
+}
+
+static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector)
+{
+    if (vector->virq < 0) {
         return;
     }
 
-    c = kvm_irqchip_begin_route_changes(kvm_state);
-    virq = kvm_irqchip_add_msi_route(&c, vector_n, &vdev->pdev);
-    if (virq < 0) {
-        event_notifier_cleanup(&vector->kvm_interrupt);
-        return;
+    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+        goto fail_notifier;
     }
-    kvm_irqchip_commit_route_changes(&c);
 
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
-                                       NULL, virq) < 0) {
-        kvm_irqchip_release_virq(kvm_state, virq);
-        event_notifier_cleanup(&vector->kvm_interrupt);
-        return;
+                                           NULL, vector->virq) < 0) {
+        goto fail_kvm;
     }
 
-    vector->virq = virq;
+    return;
+
+fail_kvm:
+    event_notifier_cleanup(&vector->kvm_interrupt);
+fail_notifier:
+    kvm_irqchip_release_virq(kvm_state, vector->virq);
+    vector->virq = -1;
 }
 
 static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
@@ -494,7 +500,14 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            if (vdev->defer_kvm_irq_routing) {
+                vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            } else {
+                vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
+                vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+                kvm_irqchip_commit_route_changes(&vfio_route_change);
+                vfio_connect_kvm_msi_virq(vector);
+            }
         }
     }
 
@@ -504,11 +517,13 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
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
@@ -570,6 +585,27 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
     }
 }
 
+static void vfio_prepare_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
+{
+    assert(!vdev->defer_kvm_irq_routing);
+    vdev->defer_kvm_irq_routing = true;
+    vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
+}
+
+static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
+{
+    int i;
+
+    assert(vdev->defer_kvm_irq_routing);
+    vdev->defer_kvm_irq_routing = false;
+
+    kvm_irqchip_commit_route_changes(&vfio_route_change);
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        vfio_connect_kvm_msi_virq(&vdev->msi_vectors[i]);
+    }
+}
+
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
     vfio_disable_interrupts(vdev);
@@ -579,26 +615,45 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
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
 
@@ -608,6 +663,13 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
 
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
@@ -633,6 +695,8 @@ retry:
         vfio_add_kvm_msi_virq(vdev, vector, i, false);
     }
 
+    vfio_commit_kvm_msi_virq_batch(vdev);
+
     /* Set interrupt type prior to possible interrupts */
     vdev->interrupt = VFIO_INT_MSI;
 
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 64777516d16d..7c236a52f4bf 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -19,6 +19,7 @@
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "sysemu/kvm.h"
 
 #define PCI_ANY_ID (~0)
 
@@ -171,6 +172,7 @@ struct VFIOPCIDevice {
     bool no_kvm_ioeventfd;
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
+    bool defer_kvm_irq_routing;
     VFIODisplay *dpy;
     Notifier irqchip_change_notifier;
 };



