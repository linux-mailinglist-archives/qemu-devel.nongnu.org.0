Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAAC2CE7D1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:51:26 +0100 (CET)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl405-0005a4-5F
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tY-0004FM-2m; Fri, 04 Dec 2020 00:44:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59163 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tV-00006H-9C; Fri, 04 Dec 2020 00:44:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8h73V6z9sWB; Fri,  4 Dec 2020 16:44:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060661;
 bh=l7oNIOTM8IaM6054OYmH+xyQea5im/8alI0goaX7NZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WwQ8lvIwtdHR+Hk9TJJtb/vYMawRrb5D8NYdX2aOFZSk8I5t2T6aXyBVV7rnLihRX
 dq7Vf0oCDEfiWNGe33zzh43mb28ukkl/b5jK+skpcdmsRfuBgPVvPuhIyv1TELpomK
 6D5HsFqO9vqHsxcG08tLnRMMXXyH5c65GvhEXyDc=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 10/13] spapr: Add PEF based securable guest memory
Date: Fri,  4 Dec 2020 16:44:12 +1100
Message-Id: <20201204054415.579042-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, Ram Pai <linuxram@us.ibm.com>, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
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
create a "pef-guest" object and set the securable-guest-memory machine
property to point to it.

Note that this just *allows* secure guests, the architecture of PEF is
such that the guest still needs to talk to the ultravisor to enter
secure mode.  Qemu has no directl way of knowing if the guest is in
secure mode, and certainly can't know until well after machine
creation time.

To start a PEF-capable guest, use the command line options:
    -object pef-guest,id=pef0 -machine securable-guest-memory=pef0

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Ram Pai <linuxram@us.ibm.com>
---
 hw/ppc/meson.build   |   1 +
 hw/ppc/pef.c         | 115 +++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr.c       |  10 ++++
 include/hw/ppc/pef.h |  26 ++++++++++
 target/ppc/kvm.c     |  18 -------
 target/ppc/kvm_ppc.h |   6 ---
 6 files changed, 152 insertions(+), 24 deletions(-)
 create mode 100644 hw/ppc/pef.c
 create mode 100644 include/hw/ppc/pef.h

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
index 0000000000..3ae3059cfe
--- /dev/null
+++ b/hw/ppc/pef.c
@@ -0,0 +1,115 @@
+/*
+ * PEF (Protected Execution Facility) for POWER support
+ *
+ * Copyright David Gibson, Redhat Inc. 2020
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
+#include "exec/securable-guest-memory.h"
+#include "hw/ppc/pef.h"
+
+#define TYPE_PEF_GUEST "pef-guest"
+#define PEF_GUEST(obj)                                  \
+    OBJECT_CHECK(PefGuestState, (obj), TYPE_PEF_GUEST)
+
+typedef struct PefGuestState PefGuestState;
+
+/**
+ * PefGuestState:
+ *
+ * The PefGuestState object is used for creating and managing a PEF
+ * guest.
+ *
+ * # $QEMU \
+ *         -object pef-guest,id=pef0 \
+ *         -machine ...,securable-guest-memory=pef0
+ */
+struct PefGuestState {
+    Object parent_obj;
+};
+
+#ifdef CONFIG_KVM
+static int kvmppc_svm_init(Error **errp)
+{
+    if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURABLE_GUEST)) {
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
+}
+
+/*
+ * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
+ * that don't support this ioctl.
+ */
+void kvmppc_svm_off(Error **errp)
+{
+    int rc;
+
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    rc = kvm_vm_ioctl(KVM_STATE(current_accel()), KVM_PPC_SVM_OFF);
+    if (rc && rc != -ENOTTY) {
+        error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
+    }
+}
+#else
+static int kvmppc_svm_init(Error **errp)
+{
+    g_assert_not_reached();
+}
+#endif
+
+int pef_kvm_init(SecurableGuestMemory *sgm, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(sgm), TYPE_PEF_GUEST)) {
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
+static const TypeInfo pef_guest_info = {
+    .parent = TYPE_OBJECT,
+    .name = TYPE_PEF_GUEST,
+    .instance_size = sizeof(PefGuestState),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_SECURABLE_GUEST_MEMORY },
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void
+pef_register_types(void)
+{
+    type_register_static(&pef_guest_info);
+}
+
+type_init(pef_register_types);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 12a012d9dd..d95b60f712 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -82,6 +82,7 @@
 #include "hw/ppc/spapr_tpm_proxy.h"
 #include "hw/ppc/spapr_nvdimm.h"
 #include "hw/ppc/spapr_numa.h"
+#include "hw/ppc/pef.h"
 
 #include "monitor/monitor.h"
 
@@ -2665,6 +2666,15 @@ static void spapr_machine_init(MachineState *machine)
     long load_limit, fw_size;
     char *filename;
     Error *resize_hpt_err = NULL;
+    Error *local_err = NULL;
+
+    /*
+     * if Secure VM (PEF) support is configured, then initialize it
+     */
+    if (pef_kvm_init(machine->sgm, &local_err) < 0) {
+        error_report_err(local_err);
+        exit(1);
+    }
 
     msi_nonbroken = true;
 
diff --git a/include/hw/ppc/pef.h b/include/hw/ppc/pef.h
new file mode 100644
index 0000000000..63c3475859
--- /dev/null
+++ b/include/hw/ppc/pef.h
@@ -0,0 +1,26 @@
+/*
+ * PEF (Protected Execution Facility) for POWER support
+ *
+ * Copyright David Gibson, Redhat Inc. 2020
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_PPC_PEF_H
+#define HW_PPC_PEF_H
+
+int pef_kvm_init(SecurableGuestMemory *sgm, Error **errp);
+
+#ifdef CONFIG_KVM
+void kvmppc_svm_off(Error **errp);
+#else
+static inline void kvmppc_svm_off(Error **errp)
+{
+}
+#endif
+
+
+#endif /* HW_PPC_PEF_H */
+
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
2.28.0


