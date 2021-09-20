Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40CA412929
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:04:22 +0200 (CEST)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSKj-0007OK-S1
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIo-0005Hn-Kr
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIl-0004cK-0z
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:22 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HD0RY5sCSz8tJQ;
 Tue, 21 Sep 2021 07:01:29 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:12 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:12 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>, 
 <marcel.apfelbaum@gmail.com>, <mst@redhat.com>
Subject: [PATCH v3 6/9] kvm: irqchip: extract
 kvm_irqchip_add_deferred_msi_route
Date: Tue, 21 Sep 2021 07:01:59 +0800
Message-ID: <20210920230202.1439-7-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
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
Cc: chenjiashang@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract a common helper that add MSI route for specific vector
but does not commit immediately.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 accel/kvm/kvm-all.c  | 15 +++++++++++++--
 include/sysemu/kvm.h |  6 ++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5b10dd129..d603afc44c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1950,7 +1950,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     return kvm_set_irq(s, route->kroute.gsi, 1);
 }
 
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
     struct kvm_irq_routing_entry kroute = {};
     int virq;
@@ -1993,7 +1993,18 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 
     kvm_add_routing_entry(s, &kroute);
     kvm_arch_add_msi_route_post(&kroute, vector, dev);
-    kvm_irqchip_commit_routes(s);
+
+    return virq;
+}
+
+int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+{
+    int virq;
+
+    virq = kvm_irqchip_add_deferred_msi_route(s, vector, dev);
+    if (virq >= 0) {
+        kvm_irqchip_commit_routes(s);
+    }
 
     return virq;
 }
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..8de0d9a715 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -476,6 +476,12 @@ void kvm_init_cpu_signals(CPUState *cpu);
  * @return: virq (>=0) when success, errno (<0) when failed.
  */
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
+/**
+ * Add MSI route for specific vector but does not commit to KVM
+ * immediately
+ */
+int kvm_irqchip_add_deferred_msi_route(KVMState *s, int vector,
+                                       PCIDevice *dev);
 int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
-- 
2.23.0


