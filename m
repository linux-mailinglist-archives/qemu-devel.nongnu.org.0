Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DD4F19B8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:22:19 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbRLG-0005EW-2m
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:22:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRH4-0000GR-Eg; Mon, 04 Apr 2022 14:17:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53742
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRH2-0007Hc-0O; Mon, 04 Apr 2022 14:17:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234HpSpF003879; 
 Mon, 4 Apr 2022 18:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ps71fX/fT5agjkw7e9QW9oVGPuM75ZyukAiQgCrVKHU=;
 b=nULJUO8nOGMTJeLNBC80CWeHdfkBYEM65oF8WJZ7rkcWNmXcOq6vCBXW6UXVg60KCMI9
 75yBI5oUjSIS77iY34WtY7baZ5JEppBSqssOqNWfQp9xFQp8wL3lowr3fjBQlzy8xTI0
 UPbRqK9L8bAdnvxCSq6iF5BzRNtzC1A/UDGU8PUXq5TUU4R/fgrpqNcLP2UNCB1Xv1iE
 3POl707TaCV5BOZ6s9EqC5YLckBMKrQWhaZduMS0cOrCqw3zjZMDqG52jXvONhtU+PY5
 r+bK/QKUawMQctdhAIExUcBp5Zchgckgd318raQtSRqy+0ikmt1tja1QvyaV3Y0K4qWJ vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f6yv6d8vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:54 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234IBQnF010877;
 Mon, 4 Apr 2022 18:17:53 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f6yv6d8v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:53 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234IGxmf029340;
 Mon, 4 Apr 2022 18:17:53 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3f6e49dpxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 234IHqeM30867866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 18:17:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13571AE062;
 Mon,  4 Apr 2022 18:17:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66101AE063;
 Mon,  4 Apr 2022 18:17:49 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.125]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 18:17:49 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v5 5/9] s390x/pci: enable for load/store intepretation
Date: Mon,  4 Apr 2022 14:17:22 -0400
Message-Id: <20220404181726.60291-6-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220404181726.60291-1-mjrosato@linux.ibm.com>
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bJoIL88hCo58e0JzOG0ooKf0NnGNtEAh
X-Proofpoint-GUID: TX1PgMpy4glKQ23f6XjvVESBxN23z85k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040103
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the appropriate CPU facilty is available as well as the necessary
ZPCI_OP ioctl, then the underlying KVM host will enable load/store
intepretation for any guest device without a SHM bit in the guest
function handle.  For a device that will be using interpretation
support, ensure the guest function handle matches the host function
handle; this value is re-checked every time the guest issues a SET PCI FN
to enable the guest device as it is the only opportunity to reflect
function handle changes.

By default, unless interpret=off is specified, interpretation support will
always be assumed and exploited if the necessary ioctl and features are
available on the host kernel.  When these are unavailable, we will silently
revert to the interception model; this allows existing guest configurations
to work unmodified on hosts with and without zPCI interpretation support,
allowing QEMU to choose the best support model available.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/meson.build            |  1 +
 hw/s390x/s390-pci-bus.c         | 66 ++++++++++++++++++++++++++++++++-
 hw/s390x/s390-pci-inst.c        | 12 ++++++
 hw/s390x/s390-pci-kvm.c         | 21 +++++++++++
 include/hw/s390x/s390-pci-bus.h |  1 +
 include/hw/s390x/s390-pci-kvm.h | 24 ++++++++++++
 target/s390x/kvm/kvm.c          |  7 ++++
 target/s390x/kvm/kvm_s390x.h    |  1 +
 8 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 hw/s390x/s390-pci-kvm.c
 create mode 100644 include/hw/s390x/s390-pci-kvm.h

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 28484256ec..6e6e47fcda 100644
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
index 6d400d4147..c898c8abe9 100644
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
@@ -246,6 +248,16 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
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
+                s390_pci_get_host_fh(pbdev, &pbdev->fh);
+            }
             pbdev->fh |= FH_MASK_ENABLE;
             pbdev->state = ZPCI_FS_ENABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
new file mode 100644
index 0000000000..8bfce9ef18
--- /dev/null
+++ b/hw/s390x/s390-pci-kvm.c
@@ -0,0 +1,21 @@
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
+#include "hw/s390x/s390-pci-kvm.h"
+#include "cpu_models.h"
+
+bool s390_pci_kvm_interp_allowed(void)
+{
+    return s390_has_feat(S390_FEAT_ZPCI_INTERP) && kvm_s390_get_zpci_op();
+}
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
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 0357bfda89..288fbd1d75 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -157,6 +157,7 @@ static int cap_ri;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
+static int cap_zpci_op;
 
 static int active_cmma;
 
@@ -358,6 +359,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
+    cap_zpci_op = kvm_check_extension(s, KVM_CAP_S390_ZPCI_OP);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
@@ -2567,3 +2569,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_s390_get_zpci_op(void)
+{
+    return cap_zpci_op;
+}
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
-- 
2.27.0


