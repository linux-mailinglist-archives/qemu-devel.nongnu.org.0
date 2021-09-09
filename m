Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31F40458B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:18:08 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODNv-0004Sn-3h
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCl-0004F6-5z
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:35 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-000657-OT
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:34 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H4pQJ4qQKz1DGsD;
 Thu,  9 Sep 2021 14:05:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:21 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:20 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2 7/9] vfio: add infrastructure to commit the deferred kvm
 routing
Date: Thu, 9 Sep 2021 14:06:11 +0800
Message-ID: <20210909060613.2815-8-longpeng2@huawei.com>
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'defer_kvm_irq_routing' indicates whether we should defer to commit
the kvm routing.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/pci.h |  1 +
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8236cd7..dda60a5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -422,12 +422,24 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
+    virq = kvm_irqchip_add_deferred_msi_route(kvm_state, vector_n, &vdev->pdev);
     if (virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
         return;
     }
 
+    if (vdev->defer_kvm_irq_routing) {
+        /*
+         * Hold the allocated virq in vector->virq temporarily, will
+         * reset it to -1 when we fail to add the corresponding irqfd
+         * in vfio_commit_kvm_msi_virq().
+         */
+        vector->virq = virq;
+        return;
+    }
+
+    kvm_irqchip_commit_routes();
+
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                        NULL, virq) < 0) {
         kvm_irqchip_release_virq(kvm_state, virq);
@@ -566,6 +578,34 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
     }
 }
 
+static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
+{
+    int i;
+    VFIOMSIVector *vector;
+
+    if (!vdev->defer_kvm_irq_routing || !vdev->nr_vectors) {
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
     PCIDevice *pdev = &vdev->pdev;
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


