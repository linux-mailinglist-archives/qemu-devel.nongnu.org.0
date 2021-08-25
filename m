Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72413F70CA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:58:29 +0200 (CEST)
Received: from localhost ([::1]:35404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInno-0001uG-Ma
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmM-0007YK-5I
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmI-0005ct-Ji
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:57 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GvdZt6b8bz1DDHL;
 Wed, 25 Aug 2021 15:56:06 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:39 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:39 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>
Subject: [PATCH 4/5] kvm: irqchip: support defer to commit the route
Date: Wed, 25 Aug 2021 15:56:19 +0800
Message-ID: <20210825075620.2607-5-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The kvm_irqchip_commit_routes() is relatively expensive, so
provide the users a choice to commit the route immediately
or not when they add msi/msix route.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 accel/kvm/kvm-all.c    | 10 +++++++---
 accel/stubs/kvm-stub.c |  3 ++-
 hw/misc/ivshmem.c      |  2 +-
 hw/vfio/pci.c          |  2 +-
 hw/virtio/virtio-pci.c |  2 +-
 include/sysemu/kvm.h   |  4 +++-
 target/i386/kvm/kvm.c  |  2 +-
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17..1f788a2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1950,7 +1950,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     return kvm_set_irq(s, route->kroute.gsi, 1);
 }
 
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
+                              bool defer_commit)
 {
     struct kvm_irq_routing_entry kroute = {};
     int virq;
@@ -1993,7 +1994,9 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 
     kvm_add_routing_entry(s, &kroute);
     kvm_arch_add_msi_route_post(&kroute, vector, dev);
-    kvm_irqchip_commit_routes(s);
+    if (!defer_commit) {
+        kvm_irqchip_commit_routes(s);
+    }
 
     return virq;
 }
@@ -2151,7 +2154,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     abort();
 }
 
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
+                              bool defer_commit)
 {
     return -ENOSYS;
 }
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5b1d00a..d5caaca 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -81,7 +81,8 @@ int kvm_on_sigbus(int code, void *addr)
 }
 
 #ifndef CONFIG_USER_ONLY
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
+                              bool defer_commit)
 {
     return -ENOSYS;
 }
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 1ba4a98..98b14cc 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -429,7 +429,7 @@ static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector,
     IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
     assert(!s->msi_vectors[vector].pdev);
 
-    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev);
+    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev, false);
     if (ret < 0) {
         error_setg(errp, "kvm_irqchip_add_msi_route failed");
         return;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ca37fb7..3ab67d6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -427,7 +427,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
+    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
     if (virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
         return;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 433060a..7e2d021 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -684,7 +684,7 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
     int ret;
 
     if (irqfd->users == 0) {
-        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
+        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev, false);
         if (ret < 0) {
             return ret;
         }
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee..1932dc0 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -473,9 +473,11 @@ void kvm_init_cpu_signals(CPUState *cpu);
  *          message.
  * @dev:    Owner PCI device to add the route. If @dev is specified
  *          as @NULL, an empty MSI message will be inited.
+ * @defer_commit:   Defer to commit new route to the KVM core.
  * @return: virq (>=0) when success, errno (<0) when failed.
  */
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
+int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
+                              bool defer_commit);
 int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e69abe4..896406b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4724,7 +4724,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
         /* If the ioapic is in QEMU and the lapics are in KVM, reserve
            MSI routes for signaling interrupts to the local apics. */
         for (i = 0; i < IOAPIC_NUM_PINS; i++) {
-            if (kvm_irqchip_add_msi_route(s, 0, NULL) < 0) {
+            if (kvm_irqchip_add_msi_route(s, 0, NULL, false) < 0) {
                 error_report("Could not enable split IRQ mode.");
                 exit(1);
             }
-- 
1.8.3.1


