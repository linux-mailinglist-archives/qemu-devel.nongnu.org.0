Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C85A4D1690
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:45:58 +0100 (CET)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYHs-00065u-Bs
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:45:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7X-0007ni-4Z
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:18 -0500
Received: from [2a00:1450:4864:20::52d] (port=44567
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7N-0005yk-82
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:06 -0500
Received: by mail-ed1-x52d.google.com with SMTP id x5so24000623edd.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3zthCmeyt4QJJ9aYC7aOp9Xf/zP8eFpxlfDRT6T3X0=;
 b=JL3J0PgevASDMubAz1FD/ZjIAzn9clu+YI3SBLFw0C4Ub4A4Frl5e1jzb51e6yzDh9
 ETjYMcvdup74JmePwRUdOJH0lYX/YYNCyQlQiec2yB/gl1s3wviRbLj+i8X93pGlSore
 Ey3fOXWwrfOh3U+aT5jj0xOu2fcMEsP/hpfsPR0ciGxN4o15q5k8lJYQGxyA0qHowOLI
 afqqcoIaXW2P3Cm4yxxZ3nxO4qo3lo1Uf+wkIvl08NubBlhMfEKOBUiVXdOLdt6vjJNN
 KJAHsWIvQvN4d9qOuwpBVx+S1CEPEQ4XnVRgnOdvzbrUcisLr9vRJV3fKHV4yVD/4HrI
 p8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E3zthCmeyt4QJJ9aYC7aOp9Xf/zP8eFpxlfDRT6T3X0=;
 b=B4cGGwREhDBZ89FtYXAfpNrJHmCsPh6eBgX8uFzIk2iVEOEwz18j7PT3BgZoFWckFT
 JLvQlSs8lkXvJsV9+jNODuHmhSaYgEYBNnt2YXiKBp08BiqM9py9RAKtuwjkiDY97vgv
 TeyRh8RhiaJfxZ7lyh19i7Tw/ucmY4OxGjeQw4+/+4c+X/5+UqtpcPFSuWv15SBP1l3Z
 4cpJSHdMem6aKAOFjjD4gKEP/4ZB9+h5BZ46gvRfJw7EkaK3FYtkA/J1M8EYuy5tHeRx
 1ca0+aQyrRcINOlxYDWf0QsMABxcXFjy/YLMiyfCiSK1NIiA6Px/Ub/ZlSxL3TMkaYcY
 1o8w==
X-Gm-Message-State: AOAM530KudCqFWvhlkhDWDH+msQVQGw9+/GwMJFZIwik9NbeP4kFJQK9
 yuqeDTKmzX1GI6AqaUIoib1vZpqGZR0=
X-Google-Smtp-Source: ABdhPJxhwzhmZHjmNhZHtDDOtINh9cEYngYOR2J0Cb6F+fyPmn7wjz4zbt8HkBh/Yx3mLcNyeLRfIw==
X-Received: by 2002:a05:6402:17c4:b0:415:ed36:52cb with SMTP id
 s4-20020a05640217c400b00415ed3652cbmr15676359edy.379.1646739303844; 
 Tue, 08 Mar 2022 03:35:03 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/22] kvm/msi: do explicit commit when adding msi routes
Date: Tue,  8 Mar 2022 12:34:32 +0100
Message-Id: <20220308113445.859669-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
2.35.1



