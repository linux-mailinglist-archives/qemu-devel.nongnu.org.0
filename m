Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E760C5EAFE2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:29:04 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsqm-0000aS-0s
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrau-0005sW-KD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrar-0005Y0-Um
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93NqxUBzqtR+qWg0afY6r5SHGvcxi46alUqnhuxG3QA=;
 b=FH9xNND810aCICD6+5bB5Xc/X6/x6I9xz9dlm/TkNvNRTh3ptYYD2c17B9vGjKlARjYvjr
 VIDqR700y1+ZQwErePYtfq2GIdfE+j8rQbR04SSLyX7sjZ5Yrbm+/JsFHNr/1xVTozSVtd
 e8K0Rb77XtnM9RJAZoBzBbHlD3K2zfk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-IzpAIzktN7WLGMDhFoNQow-1; Mon, 26 Sep 2022 13:08:27 -0400
X-MC-Unique: IzpAIzktN7WLGMDhFoNQow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761DE29ABA2B;
 Mon, 26 Sep 2022 17:08:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE56D140EBF4;
 Mon, 26 Sep 2022 17:08:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PULL 08/14] s390x/pci: enable for load/store interpretation
Date: Mon, 26 Sep 2022 19:07:58 +0200
Message-Id: <20220926170804.453855-9-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Matthew Rosato <mjrosato@linux.ibm.com>

If the ZPCI_OP ioctl reports that is is available and usable, then the
underlying KVM host will enable load/store intepretation for any guest
device without a SHM bit in the guest function handle.  For a device that
will be using interpretation support, ensure the guest function handle
matches the host function handle; this value is re-checked every time the
guest issues a SET PCI FN to enable the guest device as it is the only
opportunity to reflect function handle changes.

By default, unless interpret=off is specified, interpretation support will
always be assumed and exploited if the necessary ioctl and features are
available on the host kernel.  When these are unavailable, we will silently
revert to the interception model; this allows existing guest configurations
to work unmodified on hosts with and without zPCI interpretation support,
allowing QEMU to choose the best support model available.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220902172737.170349-4-mjrosato@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/s390-pci-bus.h |  1 +
 include/hw/s390x/s390-pci-kvm.h | 24 ++++++++++++
 target/s390x/kvm/kvm_s390x.h    |  1 +
 hw/s390x/s390-pci-bus.c         | 66 ++++++++++++++++++++++++++++++++-
 hw/s390x/s390-pci-inst.c        | 16 ++++++++
 hw/s390x/s390-pci-kvm.c         | 22 +++++++++++
 target/s390x/kvm/kvm.c          |  7 ++++
 hw/s390x/meson.build            |  1 +
 8 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/s390x/s390-pci-kvm.h
 create mode 100644 hw/s390x/s390-pci-kvm.c

diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index da3cde2bb4..a9843dfe97 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -350,6 +350,7 @@ struct S390PCIBusDevice {
     IndAddr *indicator;
     bool pci_unplug_request_processed;
     bool unplug_requested;
+    bool interp;
     QTAILQ_ENTRY(S390PCIBusDevice) link;
 };
 
diff --git a/include/hw/s390x/s390-pci-kvm.h b/include/hw/s390x/s390-pci-kvm.h
new file mode 100644
index 0000000000..80a2e7d0ca
--- /dev/null
+++ b/include/hw/s390x/s390-pci-kvm.h
@@ -0,0 +1,24 @@
+/*
+ * s390 PCI KVM interfaces
+ *
+ * Copyright 2022 IBM Corp.
+ * Author(s): Matthew Rosato <mjrosato@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#ifndef HW_S390_PCI_KVM_H
+#define HW_S390_PCI_KVM_H
+
+#ifdef CONFIG_KVM
+bool s390_pci_kvm_interp_allowed(void);
+#else
+static inline bool s390_pci_kvm_interp_allowed(void)
+{
+    return false;
+}
+#endif
+
+#endif
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index 05a5e1e6f4..aaae8570de 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -27,6 +27,7 @@ void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage_1m(void);
 int kvm_s390_get_ri(void);
+int kvm_s390_get_zpci_op(void);
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
 int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_clock);
 int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_clock);
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 4b2bdd94b3..156051e6e9 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -16,6 +16,7 @@
 #include "qapi/visitor.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/s390-pci-inst.h"
+#include "hw/s390x/s390-pci-kvm.h"
 #include "hw/s390x/s390-pci-vfio.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
@@ -971,12 +972,51 @@ static void s390_pci_update_subordinate(PCIDevice *dev, uint32_t nr)
     }
 }
 
+static int s390_pci_interp_plug(S390pciState *s, S390PCIBusDevice *pbdev)
+{
+    uint32_t idx, fh;
+
+    if (!s390_pci_get_host_fh(pbdev, &fh)) {
+        return -EPERM;
+    }
+
+    /*
+     * The host device is already in an enabled state, but we always present
+     * the initial device state to the guest as disabled (ZPCI_FS_DISABLED).
+     * Therefore, mask off the enable bit from the passthrough handle until
+     * the guest issues a CLP SET PCI FN later to enable the device.
+     */
+    pbdev->fh = fh & ~FH_MASK_ENABLE;
+
+    /* Next, see if the idx is already in-use */
+    idx = pbdev->fh & FH_MASK_INDEX;
+    if (pbdev->idx != idx) {
+        if (s390_pci_find_dev_by_idx(s, idx)) {
+            return -EINVAL;
+        }
+        /*
+         * Update the idx entry with the passed through idx
+         * If the relinquished idx is lower than next_idx, use it
+         * to replace next_idx
+         */
+        g_hash_table_remove(s->zpci_table, &pbdev->idx);
+        if (idx < s->next_idx) {
+            s->next_idx = idx;
+        }
+        pbdev->idx = idx;
+        g_hash_table_insert(s->zpci_table, &pbdev->idx, pbdev);
+    }
+
+    return 0;
+}
+
 static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
     S390pciState *s = S390_PCI_HOST_BRIDGE(hotplug_dev);
     PCIDevice *pdev = NULL;
     S390PCIBusDevice *pbdev = NULL;
+    int rc;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
         PCIBridge *pb = PCI_BRIDGE(dev);
@@ -1022,12 +1062,35 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         set_pbdev_info(pbdev);
 
         if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
-            pbdev->fh |= FH_SHM_VFIO;
+            /*
+             * By default, interpretation is always requested; if the available
+             * facilities indicate it is not available, fallback to the
+             * interception model.
+             */
+            if (pbdev->interp) {
+                if (s390_pci_kvm_interp_allowed()) {
+                    rc = s390_pci_interp_plug(s, pbdev);
+                    if (rc) {
+                        error_setg(errp, "Plug failed for zPCI device in "
+                                   "interpretation mode: %d", rc);
+                        return;
+                    }
+                } else {
+                    DPRINTF("zPCI interpretation facilities missing.\n");
+                    pbdev->interp = false;
+                }
+            }
             pbdev->iommu->dma_limit = s390_pci_start_dma_count(s, pbdev);
             /* Fill in CLP information passed via the vfio region */
             s390_pci_get_clp_info(pbdev);
+            if (!pbdev->interp) {
+                /* Do vfio passthrough but intercept for I/O */
+                pbdev->fh |= FH_SHM_VFIO;
+            }
         } else {
             pbdev->fh |= FH_SHM_EMUL;
+            /* Always intercept emulated devices */
+            pbdev->interp = false;
         }
 
         if (s390_pci_msix_init(pbdev)) {
@@ -1360,6 +1423,7 @@ static Property s390_pci_device_properties[] = {
     DEFINE_PROP_UINT16("uid", S390PCIBusDevice, uid, UID_UNDEFINED),
     DEFINE_PROP_S390_PCI_FID("fid", S390PCIBusDevice, fid),
     DEFINE_PROP_STRING("target", S390PCIBusDevice, target),
+    DEFINE_PROP_BOOL("interpret", S390PCIBusDevice, interp, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 6d400d4147..651ec38635 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -18,6 +18,8 @@
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
+#include "hw/s390x/s390-pci-kvm.h"
+#include "hw/s390x/s390-pci-vfio.h"
 #include "hw/s390x/tod.h"
 
 #ifndef DEBUG_S390PCI_INST
@@ -246,6 +248,20 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
                 goto out;
             }
 
+            /*
+             * Take this opportunity to make sure we still have an accurate
+             * host fh.  It's possible part of the handle changed while the
+             * device was disabled to the guest (e.g. vfio hot reset for
+             * ISM during plug)
+             */
+            if (pbdev->interp) {
+                /* Take this opportunity to make sure we are sync'd with host */
+                if (!s390_pci_get_host_fh(pbdev, &pbdev->fh) ||
+                    !(pbdev->fh & FH_MASK_ENABLE)) {
+                    stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FH);
+                    goto out;
+                }
+            }
             pbdev->fh |= FH_MASK_ENABLE;
             pbdev->state = ZPCI_FS_ENABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
new file mode 100644
index 0000000000..0f16104a74
--- /dev/null
+++ b/hw/s390x/s390-pci-kvm.c
@@ -0,0 +1,22 @@
+/*
+ * s390 zPCI KVM interfaces
+ *
+ * Copyright 2022 IBM Corp.
+ * Author(s): Matthew Rosato <mjrosato@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "kvm/kvm_s390x.h"
+#include "hw/s390x/pv.h"
+#include "hw/s390x/s390-pci-kvm.h"
+#include "cpu_models.h"
+
+bool s390_pci_kvm_interp_allowed(void)
+{
+    return kvm_s390_get_zpci_op() && !s390_is_pv();
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7bd8db0e7b..6a8dbadf7e 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -157,6 +157,7 @@ static int cap_ri;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
+static int cap_zpci_op;
 
 static bool mem_op_storage_key_support;
 
@@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
+    cap_zpci_op = kvm_check_extension(s, KVM_CAP_S390_ZPCI_OP);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
@@ -2574,3 +2576,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_s390_get_zpci_op(void)
+{
+    return cap_zpci_op;
+}
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index feefe0717e..f291016fee 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -23,6 +23,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   's390-skeys-kvm.c',
   's390-stattrib-kvm.c',
   'pv.c',
+  's390-pci-kvm.c',
 ))
 s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
   'tod-tcg.c',
-- 
2.31.1


