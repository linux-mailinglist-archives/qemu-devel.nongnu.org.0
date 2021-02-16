Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425431C55E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:17:50 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpvx-0007tH-C7
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptC-0005ue-Kq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:58 -0500
Received: from mga17.intel.com ([192.55.52.151]:25640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptA-0001b1-80
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:58 -0500
IronPort-SDR: 9RG1ua9ciGiaTBgCHJ8uNA1Y3y6pu6gIHKyWxT46seQVFjQVo0+g1dCM74WHN6EvItkcHd3Mor
 XwOclWNvmkYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558754"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558754"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
IronPort-SDR: aTNyBS7eceh72gSzvZV6B8fjU/EpU4WVOEmRcUXZWUG5Z5kn+r3fTwbxPN3wzkFjrxLwxxL6up
 q2F+VBAlJNgg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705398"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 06/23] hw/i386: Introduce kvm-type for TDX guest
Date: Mon, 15 Feb 2021 18:13:02 -0800
Message-Id: <0fa997434b359c38a2e9f98758bee174e9e0be40.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Introduce a machine property, kvm-type, to allow the user to create a
Trusted Domain eXtensions (TDX) VM, a.k.a. a Trusted Domain (TD), e.g.:

 # $QEMU \
	-machine ...,kvm-type=tdx \
	...

Only two types are supported: "legacy" and "tdx", with "legacy" being
the default.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 default-configs/devices/i386-softmmu.mak |  1 +
 hw/i386/Kconfig                          |  5 +++
 hw/i386/x86.c                            | 46 ++++++++++++++++++++++++
 include/hw/i386/x86.h                    |  1 +
 include/sysemu/tdx.h                     | 10 ++++++
 target/i386/kvm/kvm-stub.c               |  5 +++
 target/i386/kvm/kvm.c                    | 15 ++++++++
 target/i386/kvm/kvm_i386.h               |  1 +
 target/i386/kvm/meson.build              |  1 +
 target/i386/kvm/tdx-stub.c               | 10 ++++++
 target/i386/kvm/tdx.c                    | 30 ++++++++++++++++
 11 files changed, 125 insertions(+)
 create mode 100644 include/sysemu/tdx.h
 create mode 100644 target/i386/kvm/tdx-stub.c
 create mode 100644 target/i386/kvm/tdx.c

diff --git a/default-configs/devices/i386-softmmu.mak b/default-configs/devices/i386-softmmu.mak
index 84d1a2487c..6e805407b8 100644
--- a/default-configs/devices/i386-softmmu.mak
+++ b/default-configs/devices/i386-softmmu.mak
@@ -18,6 +18,7 @@
 #CONFIG_QXL=n
 #CONFIG_SEV=n
 #CONFIG_SGA=n
+#CONFIG_TDX=n
 #CONFIG_TEST_DEVICES=n
 #CONFIG_TPM_CRB=n
 #CONFIG_TPM_TIS_ISA=n
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877..bc79e1e84a 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -2,6 +2,10 @@ config SEV
     bool
     depends on KVM
 
+config TDX
+    bool
+    depends on KVM
+
 config PC
     bool
     imply APPLESMC
@@ -17,6 +21,7 @@ config PC
     imply PVPANIC_ISA
     imply QXL
     imply SEV
+    imply TDX
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef9..a4a0cc83dd 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -21,6 +21,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include <linux/kvm.h>
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/cutils.h"
@@ -31,6 +32,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
+#include "sysemu/kvm_int.h"
 #include "sysemu/qtest.h"
 #include "sysemu/whpx.h"
 #include "sysemu/numa.h"
@@ -1199,6 +1201,43 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
 }
 
+static char *x86_get_kvm_type(Object *obj, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    return g_strdup(x86ms->kvm_type);
+}
+
+
+static void x86_set_kvm_type(Object *obj, const char *value, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    g_free(x86ms->kvm_type);
+    x86ms->kvm_type = g_strdup(value);
+}
+
+static int x86_kvm_type(MachineState *ms, const char *vm_type)
+{
+    int kvm_type;
+
+    if (!vm_type || !strcmp(vm_type, "") ||
+        !g_ascii_strcasecmp(vm_type, "legacy")) {
+        kvm_type = KVM_X86_LEGACY_VM;
+    } else if (!g_ascii_strcasecmp(vm_type, "tdx")) {
+        kvm_type = KVM_X86_TDX_VM;
+    } else {
+        error_report("Unknown kvm-type specified '%s'", vm_type);
+        exit(1);
+    }
+    if (kvm_set_vm_type(ms, kvm_type)) {
+        error_report("kvm-type '%s' not supported by KVM", vm_type);
+        exit(1);
+    }
+
+    return kvm_type;
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1207,6 +1246,12 @@ static void x86_machine_initfn(Object *obj)
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->smp_dies = 1;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
+
+
+    object_property_add_str(obj, "kvm-type",
+                            x86_get_kvm_type, x86_set_kvm_type);
+    object_property_set_description(obj, "kvm-type",
+                                    "KVM guest type (legacy, tdx)");
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
@@ -1218,6 +1263,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->kvm_type = x86_kvm_type;
     x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 56080bd1fb..05e3b738d1 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -56,6 +56,7 @@ struct X86MachineState {
 
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
+    char *kvm_type;
 
     /* CPU and apic information: */
     bool apic_xrupt_override;
diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
new file mode 100644
index 0000000000..60ebded851
--- /dev/null
+++ b/include/sysemu/tdx.h
@@ -0,0 +1,10 @@
+#ifndef QEMU_TDX_H
+#define QEMU_TDX_H
+
+#ifndef CONFIG_USER_ONLY
+#include "sysemu/kvm.h"
+
+bool kvm_has_tdx(KVMState *s);
+#endif
+
+#endif
diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
index 92f49121b8..e9221de76f 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -39,3 +39,8 @@ bool kvm_hv_vpindex_settable(void)
 {
     return false;
 }
+
+int kvm_set_vm_type(MachineState *ms, int kvm_type)
+{
+    return 0;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index bb241d8aa1..ab7a896bd2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -26,6 +26,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
+#include "sysemu/tdx.h"
 #include "kvm_i386.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
@@ -129,6 +130,20 @@ static bool has_msr_mcg_ext_ctl;
 static struct kvm_cpuid2 *cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
+static int vm_type;
+
+int kvm_set_vm_type(MachineState *ms, int kvm_type)
+{
+    if (kvm_type == KVM_X86_LEGACY_VM ||
+        (kvm_type == KVM_X86_TDX_VM &&
+         kvm_has_tdx(KVM_STATE(ms->accelerator)))) {
+        vm_type = kvm_type;
+        return 0;
+    }
+
+    return -ENOTSUP;
+}
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index c9a92578b1..8e63365162 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -41,6 +41,7 @@ bool kvm_has_adjust_clock(void);
 bool kvm_has_adjust_clock_stable(void);
 bool kvm_has_exception_payload(void);
 void kvm_synchronize_all_tsc(void);
+int kvm_set_vm_type(MachineState *ms, int kvm_type);
 void kvm_arch_reset_vcpu(X86CPU *cs);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 1d66559187..03575e66ce 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,3 +1,4 @@
 i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
+i386_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'), if_false: files('tdx-stub.c'))
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
new file mode 100644
index 0000000000..e1eb09cae1
--- /dev/null
+++ b/target/i386/kvm/tdx-stub.c
@@ -0,0 +1,10 @@
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "sysemu/tdx.h"
+
+#ifndef CONFIG_USER_ONLY
+bool kvm_has_tdx(KVMState *s)
+{
+        return false;
+}
+#endif
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
new file mode 100644
index 0000000000..e62a570f75
--- /dev/null
+++ b/target/i386/kvm/tdx.c
@@ -0,0 +1,30 @@
+/*
+ * QEMU TDX support
+ *
+ * Copyright Intel
+ *
+ * Author:
+ *      Xiaoyao Li <xiaoyao.li@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include <linux/kvm.h>
+
+#include "cpu.h"
+#include "hw/boards.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
+#include "sysemu/tdx.h"
+
+bool kvm_has_tdx(KVMState *s)
+{
+    return !!(kvm_check_extension(s, KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
+}
-- 
2.17.1


