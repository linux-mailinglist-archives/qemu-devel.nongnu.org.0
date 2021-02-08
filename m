Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67769312F2A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 11:37:46 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l93vM-0003zc-Rf
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 05:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgX-0007xj-Dm; Mon, 08 Feb 2021 01:06:09 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37505 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgU-000636-25; Mon, 08 Feb 2021 01:06:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwVt1lxVz9sWL; Mon,  8 Feb 2021 17:05:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764342;
 bh=aAac4u8eAT095LojHu2zV6djlFRQd15K3tYUapECTxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XYDBgui6iodDeonCEWscS0Jgqx/ytHJmSXEj+H8oC97o5aB1bU+I4tzGn6eOyRSCU
 qWDhbotH1wqknfiS9HPzOyIkfd+pB10JRopBLeiysG82i5jWB/RY85+e6wyN2dwVBV
 IiMR3OSf8fIfQBubHjaQxg7Zc4acV94i+Ln9lLh8=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, dgilbert@redhat.com, pair@us.ibm.com,
 qemu-devel@nongnu.org, brijesh.singh@amd.com
Subject: [PULL v9 10/13] spapr: Add PEF based confidential guest support
Date: Mon,  8 Feb 2021 17:05:35 +1100
Message-Id: <20210208060538.39276-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, jun.nakajima@intel.com,
 andi.kleen@intel.com, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some upcoming POWER machines have a system called PEF (Protected
Execution Facility) which uses a small ultravisor to allow guests to
run in a way that they can't be eavesdropped by the hypervisor.  The
effect is roughly similar to AMD SEV, although the mechanisms are
quite different.

Most of the work of this is done between the guest, KVM and the
ultravisor, with little need for involvement by qemu.  However qemu
does need to tell KVM to allow secure VMs.

Because the availability of secure mode is a guest visible difference
which depends on having the right hardware and firmware, we don't
enable this by default.  In order to run a secure guest you need to
create a "pef-guest" object and set the confidential-guest-support
property to point to it.

Note that this just *allows* secure guests, the architecture of PEF is
such that the guest still needs to talk to the ultravisor to enter
secure mode.  Qemu has no direct way of knowing if the guest is in
secure mode, and certainly can't know until well after machine
creation time.

To start a PEF-capable guest, use the command line options:
    -object pef-guest,id=pef0 -machine confidential-guest-support=pef0

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 docs/confidential-guest-support.txt |   3 +
 docs/papr-pef.txt                   |  30 +++++++
 hw/ppc/meson.build                  |   1 +
 hw/ppc/pef.c                        | 133 ++++++++++++++++++++++++++++
 hw/ppc/spapr.c                      |   8 +-
 include/hw/ppc/pef.h                |  17 ++++
 target/ppc/kvm.c                    |  18 ----
 target/ppc/kvm_ppc.h                |   6 --
 8 files changed, 191 insertions(+), 25 deletions(-)
 create mode 100644 docs/papr-pef.txt
 create mode 100644 hw/ppc/pef.c
 create mode 100644 include/hw/ppc/pef.h

diff --git a/docs/confidential-guest-support.txt b/docs/confidential-guest-support.txt
index bd439ac800..4da4c91bd3 100644
--- a/docs/confidential-guest-support.txt
+++ b/docs/confidential-guest-support.txt
@@ -40,4 +40,7 @@ Currently supported confidential guest mechanisms are:
 AMD Secure Encrypted Virtualization (SEV)
     docs/amd-memory-encryption.txt
 
+POWER Protected Execution Facility (PEF)
+    docs/papr-pef.txt
+
 Other mechanisms may be supported in future.
diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
new file mode 100644
index 0000000000..72550e9bf8
--- /dev/null
+++ b/docs/papr-pef.txt
@@ -0,0 +1,30 @@
+POWER (PAPR) Protected Execution Facility (PEF)
+===============================================
+
+Protected Execution Facility (PEF), also known as Secure Guest support
+is a feature found on IBM POWER9 and POWER10 processors.
+
+If a suitable firmware including an Ultravisor is installed, it adds
+an extra memory protection mode to the CPU.  The ultravisor manages a
+pool of secure memory which cannot be accessed by the hypervisor.
+
+When this feature is enabled in QEMU, a guest can use ultracalls to
+enter "secure mode".  This transfers most of its memory to secure
+memory, where it cannot be eavesdropped by a compromised hypervisor.
+
+Launching
+---------
+
+To launch a guest which will be permitted to enter PEF secure mode:
+
+# ${QEMU} \
+    -object pef-guest,id=pef0 \
+    -machine confidential-guest-support=pef0 \
+    ...
+
+Live Migration
+----------------
+
+Live migration is not yet implemented for PEF guests.  For
+consistency, we currently prevent migration if the PEF feature is
+enabled, whether or not the guest has actually entered secure mode.
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index ffa2ec37fa..218631c883 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -27,6 +27,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_nvdimm.c',
   'spapr_rtas_ddw.c',
   'spapr_numa.c',
+  'pef.c',
 ))
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
new file mode 100644
index 0000000000..f9fd1f2a71
--- /dev/null
+++ b/hw/ppc/pef.c
@@ -0,0 +1,133 @@
+/*
+ * PEF (Protected Execution Facility) for POWER support
+ *
+ * Copyright Red Hat.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/kvm.h"
+#include "migration/blocker.h"
+#include "exec/confidential-guest-support.h"
+#include "hw/ppc/pef.h"
+
+#define TYPE_PEF_GUEST "pef-guest"
+OBJECT_DECLARE_SIMPLE_TYPE(PefGuest, PEF_GUEST)
+
+typedef struct PefGuest PefGuest;
+typedef struct PefGuestClass PefGuestClass;
+
+struct PefGuestClass {
+    ConfidentialGuestSupportClass parent_class;
+};
+
+/**
+ * PefGuest:
+ *
+ * The PefGuest object is used for creating and managing a PEF
+ * guest.
+ *
+ * # $QEMU \
+ *         -object pef-guest,id=pef0 \
+ *         -machine ...,confidential-guest-support=pef0
+ */
+struct PefGuest {
+    ConfidentialGuestSupport parent_obj;
+};
+
+static int kvmppc_svm_init(Error **errp)
+{
+#ifdef CONFIG_KVM
+    if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
+        error_setg(errp,
+                   "KVM implementation does not support Secure VMs (is an ultravisor running?)");
+        return -1;
+    } else {
+        int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_PPC_SECURE_GUEST, 0, 1);
+
+        if (ret < 0) {
+            error_setg(errp,
+                       "Error enabling PEF with KVM");
+            return -1;
+        }
+    }
+
+    return 0;
+#else
+    g_assert_not_reached();
+#endif
+}
+
+/*
+ * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
+ * that don't support this ioctl.
+ */
+static int kvmppc_svm_off(Error **errp)
+{
+#ifdef CONFIG_KVM
+    int rc;
+
+    rc = kvm_vm_ioctl(KVM_STATE(current_accel()), KVM_PPC_SVM_OFF);
+    if (rc && rc != -ENOTTY) {
+        error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
+        return rc;
+    }
+    return 0;
+#else
+    g_assert_not_reached();
+#endif
+}
+
+int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(cgs), TYPE_PEF_GUEST)) {
+        return 0;
+    }
+
+    if (!kvm_enabled()) {
+        error_setg(errp, "PEF requires KVM");
+        return -1;
+    }
+
+    return kvmppc_svm_init(errp);
+}
+
+int pef_kvm_reset(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(cgs), TYPE_PEF_GUEST)) {
+        return 0;
+    }
+
+    /*
+     * If we don't have KVM we should never have been able to
+     * initialize PEF, so we should never get this far
+     */
+    assert(kvm_enabled());
+
+    return kvmppc_svm_off(errp);
+}
+
+OBJECT_DEFINE_TYPE_WITH_INTERFACES(PefGuest,
+                                   pef_guest,
+                                   PEF_GUEST,
+                                   CONFIDENTIAL_GUEST_SUPPORT,
+                                   { TYPE_USER_CREATABLE },
+                                   { NULL })
+
+static void pef_guest_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static void pef_guest_init(Object *obj)
+{
+}
+
+static void pef_guest_finalize(Object *obj)
+{
+}
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6c47466fc2..612356e9ec 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -83,6 +83,7 @@
 #include "hw/ppc/spapr_tpm_proxy.h"
 #include "hw/ppc/spapr_nvdimm.h"
 #include "hw/ppc/spapr_numa.h"
+#include "hw/ppc/pef.h"
 
 #include "monitor/monitor.h"
 
@@ -1574,7 +1575,7 @@ static void spapr_machine_reset(MachineState *machine)
     void *fdt;
     int rc;
 
-    kvmppc_svm_off(&error_fatal);
+    pef_kvm_reset(machine->cgs, &error_fatal);
     spapr_caps_apply(spapr);
 
     first_ppc_cpu = POWERPC_CPU(first_cpu);
@@ -2658,6 +2659,11 @@ static void spapr_machine_init(MachineState *machine)
     char *filename;
     Error *resize_hpt_err = NULL;
 
+    /*
+     * if Secure VM (PEF) support is configured, then initialize it
+     */
+    pef_kvm_init(machine->cgs, &error_fatal);
+
     msi_nonbroken = true;
 
     QLIST_INIT(&spapr->phbs);
diff --git a/include/hw/ppc/pef.h b/include/hw/ppc/pef.h
new file mode 100644
index 0000000000..707dbe524c
--- /dev/null
+++ b/include/hw/ppc/pef.h
@@ -0,0 +1,17 @@
+/*
+ * PEF (Protected Execution Facility) for POWER support
+ *
+ * Copyright Red Hat.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_PPC_PEF_H
+#define HW_PPC_PEF_H
+
+int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+int pef_kvm_reset(ConfidentialGuestSupport *cgs, Error **errp);
+
+#endif /* HW_PPC_PEF_H */
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index daf690a678..0c5056dd5b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2929,21 +2929,3 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset)
         kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &tb_offset);
     }
 }
-
-/*
- * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
- * that don't support this ioctl.
- */
-void kvmppc_svm_off(Error **errp)
-{
-    int rc;
-
-    if (!kvm_enabled()) {
-        return;
-    }
-
-    rc = kvm_vm_ioctl(KVM_STATE(current_accel()), KVM_PPC_SVM_OFF);
-    if (rc && rc != -ENOTTY) {
-        error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
-    }
-}
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 73ce2bc951..989f61ace0 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -39,7 +39,6 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu);
 target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
                                      bool radix, bool gtse,
                                      uint64_t proc_tbl);
-void kvmppc_svm_off(Error **errp);
 #ifndef CONFIG_USER_ONLY
 bool kvmppc_spapr_use_multitce(void);
 int kvmppc_spapr_enable_inkernel_multitce(void);
@@ -216,11 +215,6 @@ static inline target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
     return 0;
 }
 
-static inline void kvmppc_svm_off(Error **errp)
-{
-    return;
-}
-
 static inline void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu,
                                              unsigned int online)
 {
-- 
2.29.2


