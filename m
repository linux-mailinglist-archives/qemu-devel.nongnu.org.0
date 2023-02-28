Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A256A5600
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:41:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwSq-0002Qe-6x; Tue, 28 Feb 2023 04:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWwSn-0002LF-3U
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:40:01 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pWwSi-0003Bf-Bb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:40:00 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PQshd3tBjz16NxQ;
 Tue, 28 Feb 2023 17:37:05 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 17:39:42 +0800
To: <mst@redhat.com>, <jasowang@redhat.com>, <pbonzini@redhat.com>
CC: <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <eperezma@redhat.com>,
 <alex.williamson@redhat.com>, <mtosatti@redhat.com>, <clg@redhat.com>,
 <qemu-devel@nongnu.org>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v1 2/3] kvm-irqchip: use KVMRouteChange API to update msi route
Date: Tue, 28 Feb 2023 17:39:36 +0800
Message-ID: <20230228093937.2515-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20230228093937.2515-1-longpeng2@huawei.com>
References: <20230228093937.2515-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

The KVMRouteChange API is added by commit 9568690868e ("kvm-irqchip:
introduce new API to support route change"). We can also apply it on
kvm_irqchip_update_msi_route(), there are no functional changes and
we can optimize the virtio-pci core base on this change in the next
patch.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 accel/kvm/kvm-all.c    | 10 ++++++----
 accel/stubs/kvm-stub.c |  2 +-
 hw/intc/ioapic.c       |  5 +++--
 hw/misc/ivshmem.c      |  6 ++++--
 hw/vfio/pci.c          |  5 +++--
 hw/virtio/virtio-pci.c |  7 +++++--
 include/sysemu/kvm.h   |  2 +-
 target/i386/kvm/kvm.c  |  6 ++++--
 8 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9b26582655..1ed0dc4c9d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1820,10 +1820,11 @@ static void kvm_add_routing_entry(KVMState *s,
     set_gsi(s, entry->gsi);
 }
 
-static int kvm_update_routing_entry(KVMState *s,
+static int kvm_update_routing_entry(KVMRouteChange *c,
                                     struct kvm_irq_routing_entry *new_entry)
 {
     struct kvm_irq_routing_entry *entry;
+    KVMState *s = c->s;
     int n;
 
     for (n = 0; n < s->irq_routes->nr; n++) {
@@ -1837,6 +1838,7 @@ static int kvm_update_routing_entry(KVMState *s,
         }
 
         *entry = *new_entry;
+        c->changes++;
 
         return 0;
     }
@@ -2046,7 +2048,7 @@ int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
     return virq;
 }
 
-int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
+int kvm_irqchip_update_msi_route(KVMRouteChange *c, int virq, MSIMessage msg,
                                  PCIDevice *dev)
 {
     struct kvm_irq_routing_entry kroute = {};
@@ -2075,7 +2077,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
 
     trace_kvm_irqchip_update_msi_route(virq);
 
-    return kvm_update_routing_entry(s, &kroute);
+    return kvm_update_routing_entry(c, &kroute);
 }
 
 static int kvm_irqchip_assign_irqfd(KVMState *s, EventNotifier *event,
@@ -2221,7 +2223,7 @@ static int kvm_irqchip_assign_irqfd(KVMState *s, EventNotifier *event,
     abort();
 }
 
-int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg)
+int kvm_irqchip_update_msi_route(KVMRouteChange *c, int virq, MSIMessage msg)
 {
     return -ENOSYS;
 }
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5d2dd8f351..5bcf98b9ab 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -69,7 +69,7 @@ void kvm_irqchip_release_virq(KVMState *s, int virq)
 {
 }
 
-int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
+int kvm_irqchip_update_msi_route(KVMRouteChange *c, int virq, MSIMessage msg,
                                  PCIDevice *dev)
 {
     return -ENOSYS;
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 264262959d..07b9cf7705 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -195,6 +195,7 @@ static void ioapic_update_kvm_routes(IOAPICCommonState *s)
     int i;
 
     if (kvm_irqchip_is_split()) {
+        KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
         for (i = 0; i < IOAPIC_NUM_PINS; i++) {
             MSIMessage msg;
             struct ioapic_entry_info info;
@@ -202,10 +203,10 @@ static void ioapic_update_kvm_routes(IOAPICCommonState *s)
             if (!info.masked) {
                 msg.address = info.addr;
                 msg.data = info.data;
-                kvm_irqchip_update_msi_route(kvm_state, i, msg, NULL);
+                kvm_irqchip_update_msi_route(&c, i, msg, NULL);
             }
         }
-        kvm_irqchip_commit_routes(kvm_state);
+        kvm_irqchip_commit_route_changes(&c);
     }
 #endif
 }
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index d66d912172..0e9427be42 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -278,6 +278,7 @@ static int ivshmem_vector_unmask(PCIDevice *dev, unsigned vector,
     IVShmemState *s = IVSHMEM_COMMON(dev);
     EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
     MSIVector *v = &s->msi_vectors[vector];
+    KVMRouteChange c;
     int ret;
 
     IVSHMEM_DPRINTF("vector unmask %p %d\n", dev, vector);
@@ -287,11 +288,12 @@ static int ivshmem_vector_unmask(PCIDevice *dev, unsigned vector,
     }
     assert(!v->unmasked);
 
-    ret = kvm_irqchip_update_msi_route(kvm_state, v->virq, msg, dev);
+    c = kvm_irqchip_begin_route_changes(kvm_state);
+    ret = kvm_irqchip_update_msi_route(&c, v->virq, msg, dev);
     if (ret < 0) {
         return ret;
     }
-    kvm_irqchip_commit_routes(kvm_state);
+    kvm_irqchip_commit_route_changes(&c);
 
     ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, v->virq);
     if (ret < 0) {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..fb69cc9965 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -460,8 +460,9 @@ static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
 static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
                                      PCIDevice *pdev)
 {
-    kvm_irqchip_update_msi_route(kvm_state, vector->virq, msg, pdev);
-    kvm_irqchip_commit_routes(kvm_state);
+    KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
+    kvm_irqchip_update_msi_route(&c, vector->virq, msg, pdev);
+    kvm_irqchip_commit_route_changes(&c);
 }
 
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 22e76e3902..5fd02b7cb8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -990,12 +990,15 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
     if (proxy->vector_irqfd) {
         irqfd = &proxy->vector_irqfd[vector];
         if (irqfd->msg.data != msg.data || irqfd->msg.address != msg.address) {
-            ret = kvm_irqchip_update_msi_route(kvm_state, irqfd->virq, msg,
+            virtio_pci_begin_route_changes();
+            ret = kvm_irqchip_update_msi_route(&virtio_pci_route_change,
+                                               irqfd->virq, msg,
                                                &proxy->pci_dev);
             if (ret < 0) {
+                virtio_pci_commit_route_changes();
                 return ret;
             }
-            kvm_irqchip_commit_routes(kvm_state);
+            virtio_pci_commit_route_changes();
         }
     }
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..4c52a39efa 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -494,7 +494,7 @@ void kvm_init_cpu_signals(CPUState *cpu);
  * @return: virq (>=0) when success, errno (<0) when failed.
  */
 int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev);
-int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
+int kvm_irqchip_update_msi_route(KVMRouteChange *c, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5870301991..ceb61badb4 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5532,9 +5532,11 @@ static void kvm_update_msi_routes_all(void *private, bool global,
 {
     int cnt = 0, vector;
     MSIRouteEntry *entry;
+    KVMRouteChange c;
     MSIMessage msg;
     PCIDevice *dev;
 
+    c = kvm_irqchip_begin_route_changes(kvm_state);
     /* TODO: explicit route update */
     QLIST_FOREACH(entry, &msi_route_list, list) {
         cnt++;
@@ -5551,9 +5553,9 @@ static void kvm_update_msi_routes_all(void *private, bool global,
              */
             continue;
         }
-        kvm_irqchip_update_msi_route(kvm_state, entry->virq, msg, dev);
+        kvm_irqchip_update_msi_route(&c, entry->virq, msg, dev);
     }
-    kvm_irqchip_commit_routes(kvm_state);
+    kvm_irqchip_commit_route_changes(&c);
     trace_kvm_x86_update_msi_routes(cnt);
 }
 
-- 
2.23.0


