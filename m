Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542194CADAB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:36:23 +0100 (CET)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTpm-0002qi-Cn
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS7-0006xM-DQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:57 -0500
Received: from [2a00:1450:4864:20::332] (port=44625
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS5-0008RE-FQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1772637wmb.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KylYBeizrlE5Gp5mZ41VKSCYaKhs9BRVgkz2yfqUuz4=;
 b=IvZ1OOHRnZOSg2ml9uwIKo2vCJyFb1EETF25+oQ9SAg6a3wa9/iA+RpA39NGhuZFUa
 lQX6BiEf5ZYLJeUUTcYpCvylzu1q5N/sCnFHIXKiR909m5EPBqTqDa4gfsREaoW3MKPd
 payWnqi8k+bZuVN0EVI8aZcgmOSS5fG2O4pfVSGzNYacH18UtpOYkx9u6SXu95AeBzDF
 AhRdFOhQXczet69fboHDFv7kE57SBGhYrCr5nYmZxtbvpUTor52OD/EnSLGR6IzzsE3f
 9U1edupIDVdV4f/oDuqV2OmdekCa0iiH+pLulPDM9IegDtwkiSo5y3QTsAgm+j7yn7oH
 Hedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KylYBeizrlE5Gp5mZ41VKSCYaKhs9BRVgkz2yfqUuz4=;
 b=qgIqJZV8kvGDH6Wc00iw4waFdlGk2eUfpHFivMKueJzLpEKRr7VD0dIgDr86nM1nhV
 QpQ6jKbOoEvF0oPt/KOB0WHOb6lyB9ynKmt1GWLJZ6n5lDasP7ZOHS2EBUABgnub5hWk
 gnJH2X8B2Sy6xup/RhMWtUvmzsuom3kQA4g9pYSZJ+k5CKMQwqNrfHck46FHb7nS5fnX
 ud4dlCua6Jb922DlUNGNgo/iEPUM59rfXrOnyUXazUtwMl1j7RGs4I/6RwfVbJoEFf0p
 GbdUCLNObJVu+UV7RCAs5VDwKDrStODIfKRTm9hud4JnHqH4si102Q/oVwMLnc+v3ep3
 Cjow==
X-Gm-Message-State: AOAM531Ksn7RfEr7rIHsWgj/Z4S1j1sYQT0hDN73GbJ7abq6Ug4BVig0
 b39hMT86AD2kF0CXFBMfShrbK71dqf8=
X-Google-Smtp-Source: ABdhPJyFI8yEiL7CYdfOchyyQWf8LVXAsIq4dCBpvrKEvs4zrRASiuDqHQd542PbLDBGj7ChXdSk0w==
X-Received: by 2002:a05:600c:3d93:b0:381:81d1:8e75 with SMTP id
 bi19-20020a05600c3d9300b0038181d18e75mr869945wmb.60.1646244712113; 
 Wed, 02 Mar 2022 10:11:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] kvm/msi: do explicit commit when adding msi routes
Date: Wed,  2 Mar 2022 19:11:32 +0100
Message-Id: <20220302181134.285107-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Longpeng(Mike)" <longpeng2@huawei.com>

We invoke the kvm_irqchip_commit_routes() for each addition to MSI route
table, which is not efficient if we are adding lots of routes in some cases.

This patch lets callers invoke the kvm_irqchip_commit_routes(), so the
callers can decide how to optimize.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00967.html

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20220222141116.2091-3-longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c    | 7 ++++---
 accel/stubs/kvm-stub.c | 2 +-
 hw/misc/ivshmem.c      | 5 ++++-
 hw/vfio/pci.c          | 5 ++++-
 hw/virtio/virtio-pci.c | 4 +++-
 include/sysemu/kvm.h   | 4 ++--
 target/i386/kvm/kvm.c  | 4 +++-
 7 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb497..27864dfaea 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1961,10 +1961,11 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     return kvm_set_irq(s, route->kroute.gsi, 1);
 }
 
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
 {
     struct kvm_irq_routing_entry kroute = {};
     int virq;
+    KVMState *s = c->s;
     MSIMessage msg = {0, 0};
 
     if (pci_available && dev) {
@@ -2004,7 +2005,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 
     kvm_add_routing_entry(s, &kroute);
     kvm_arch_add_msi_route_post(&kroute, vector, dev);
-    kvm_irqchip_commit_routes(s);
+    c->changes++;
 
     return virq;
 }
@@ -2162,7 +2163,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     abort();
 }
 
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
 }
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e00..ae6e8e9aa7 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -81,7 +81,7 @@ int kvm_on_sigbus(int code, void *addr)
 }
 
 #ifndef CONFIG_USER_ONLY
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
+int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
 }
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 299837e5c1..2307f4a513 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -424,16 +424,19 @@ static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector,
                                      Error **errp)
 {
     PCIDevice *pdev = PCI_DEVICE(s);
+    KVMRouteChange c;
     int ret;
 
     IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
     assert(!s->msi_vectors[vector].pdev);
 
-    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev);
+    c = kvm_irqchip_begin_route_changes(kvm_state);
+    ret = kvm_irqchip_add_msi_route(&c, vector, pdev);
     if (ret < 0) {
         error_setg(errp, "kvm_irqchip_add_msi_route failed");
         return;
     }
+    kvm_irqchip_commit_route_changes(&c);
 
     s->msi_vectors[vector].virq = ret;
     s->msi_vectors[vector].pdev = pdev;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7b45353ce2..d07a4e99b1 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -412,6 +412,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
                                   int vector_n, bool msix)
 {
+    KVMRouteChange c;
     int virq;
 
     if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
@@ -422,11 +423,13 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
+    c = kvm_irqchip_begin_route_changes(kvm_state);
+    virq = kvm_irqchip_add_msi_route(&c, vector_n, &vdev->pdev);
     if (virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
         return;
     }
+    kvm_irqchip_commit_route_changes(&c);
 
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                        NULL, virq) < 0) {
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f9cf9592fd..7cf1231c1c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -683,10 +683,12 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
     int ret;
 
     if (irqfd->users == 0) {
-        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
+        KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
+        ret = kvm_irqchip_add_msi_route(&c, vector, &proxy->pci_dev);
         if (ret < 0) {
             return ret;
         }
+        kvm_irqchip_commit_route_changes(&c);
         irqfd->virq = ret;
     }
     irqfd->users++;
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 36e6d40191..e83280521a 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -486,7 +486,7 @@ void kvm_init_cpu_signals(CPUState *cpu);
 
 /**
  * kvm_irqchip_add_msi_route - Add MSI route for specific vector
- * @s:      KVM state
+ * @c:      KVMRouteChange instance.
  * @vector: which vector to add. This can be either MSI/MSIX
  *          vector. The function will automatically detect whether
  *          MSI/MSIX is enabled, and fetch corresponding MSI
@@ -495,7 +495,7 @@ void kvm_init_cpu_signals(CPUState *cpu);
  *          as @NULL, an empty MSI message will be inited.
  * @return: virq (>=0) when success, errno (<0) when failed.
  */
-int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
+int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev);
 int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..cfef36a14e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4939,16 +4939,18 @@ void kvm_arch_init_irq_routing(KVMState *s)
     kvm_gsi_routing_allowed = true;
 
     if (kvm_irqchip_is_split()) {
+        KVMRouteChange c = kvm_irqchip_begin_route_changes(s);
         int i;
 
         /* If the ioapic is in QEMU and the lapics are in KVM, reserve
            MSI routes for signaling interrupts to the local apics. */
         for (i = 0; i < IOAPIC_NUM_PINS; i++) {
-            if (kvm_irqchip_add_msi_route(s, 0, NULL) < 0) {
+            if (kvm_irqchip_add_msi_route(&c, 0, NULL) < 0) {
                 error_report("Could not enable split IRQ mode.");
                 exit(1);
             }
         }
+        kvm_irqchip_commit_route_changes(&c);
     }
 }
 
-- 
2.34.1



