Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854F620A70
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 08:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osJDJ-0007Bp-81; Tue, 08 Nov 2022 02:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1osJDH-0007BD-56
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:40:03 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1osJDD-0005xH-KT
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:40:02 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N60Nh0tFVzHvkt;
 Tue,  8 Nov 2022 15:39:32 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 15:39:55 +0800
To: <alex.williamson@redhat.com>, <maz@kernel.org>
CC: <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>, <linuxarm@huawei.com>,
 Xiang Chen <chenxiang66@hisilicon.com>
Subject: [PATCH] vfio/pci: Add system call KVM_VERIFY_MSI to verify every MSI
 vector
Date: Tue, 8 Nov 2022 16:10:45 +0800
Message-ID: <1667895045-175508-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  chenxiang <chenxiang66@hisilicon.com>
From:  chenxiang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiang Chen <chenxiang66@hisilicon.com>

Currently the numbers of MSI vectors come from register PCI_MSI_FLAGS
which should be power-of-2, but in some scenaries it is not the same as
the number that driver requires in guest, for example, a PCI driver wants
to allocate 6 MSI vecotrs in guest, but as the limitation, it will allocate
8 MSI vectors. So it requires 8 MSI vectors in qemu while the driver in
guest only wants to allocate 6 MSI vectors.

When GICv4.1 is enabled, we can see some exception print as following for
above scenaro:
vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration fails:66311

To avoid the issue, add system call KVM_VERIFY_MSI to verify whether every
MSI vecotor is valid and adjust the numver of MSI vectors.

This is qemu part of adding system call KVM_VERIFY_MSI.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 accel/kvm/kvm-all.c       | 19 +++++++++++++++++++
 hw/vfio/pci.c             | 13 +++++++++++++
 include/sysemu/kvm.h      |  2 ++
 linux-headers/linux/kvm.h |  1 +
 4 files changed, 35 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0be..19c8b84 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1918,6 +1918,25 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
     return kvm_set_irq(s, route->kroute.gsi, 1);
 }
 
+int kvm_irqchip_verify_msi_route(KVMState *s, int vector, PCIDevice *dev)
+{
+    if (pci_available && dev && kvm_msi_devid_required()) {
+	MSIMessage msg = {0, 0};
+	struct kvm_msi msi;
+
+	msg = pci_get_msi_message(dev, vector);
+	msi.address_lo = (uint32_t)msg.address;
+	msi.address_hi = msg.address >> 32;
+	msi.devid = pci_requester_id(dev);
+	msi.data = le32_to_cpu(msg.data);
+	msi.flags = KVM_MSI_VALID_DEVID;
+	memset(msi.pad, 0, sizeof(msi.pad));
+
+	return kvm_vm_ioctl(s, KVM_VERIFY_MSI, &msi);
+    }
+    return 0;
+}
+
 int kvm_irqchip_add_msi_route(KVMRouteChange *c, int vector, PCIDevice *dev)
 {
     struct kvm_irq_routing_entry kroute = {};
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3..8dae0e4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -660,6 +660,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
 static void vfio_msi_enable(VFIOPCIDevice *vdev)
 {
     int ret, i;
+    int msi_invalid = 0;
 
     vfio_disable_interrupts(vdev);
 
@@ -671,6 +672,18 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
     vfio_prepare_kvm_msi_virq_batch(vdev);
 
     vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
+
+    /*
+     * Verify whether every msi interrupt is valid as the number of
+     * MSI vectors comes from PCI device registers which may be not the
+     * same as the number of vectors that driver requires.
+     */
+    for (i = 0; i < vdev->nr_vectors; i++) {
+	ret = kvm_irqchip_verify_msi_route(kvm_state, i, &vdev->pdev);
+	if (ret < 0)
+	    msi_invalid++;
+    }
+    vdev->nr_vectors -= msi_invalid;
 retry:
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->nr_vectors);
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97ed..aca6e5b 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -482,6 +482,8 @@ void kvm_cpu_synchronize_state(CPUState *cpu);
 
 void kvm_init_cpu_signals(CPUState *cpu);
 
+int kvm_irqchip_verify_msi_route(KVMState *s, int vector, PCIDevice *dev);
+
 /**
  * kvm_irqchip_add_msi_route - Add MSI route for specific vector
  * @c:      KVMRouteChange instance.
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa5..ac59350 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1540,6 +1540,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_VERIFY_MSI            _IOW(KVMIO,  0xb5, struct kvm_msi)
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
-- 
2.8.1


