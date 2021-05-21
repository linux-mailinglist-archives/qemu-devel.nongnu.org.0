Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D138BD79
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 06:36:39 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljwtp-0008Pm-Ms
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 00:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1ljwsq-0007ga-MM
 for qemu-devel@nongnu.org; Fri, 21 May 2021 00:35:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:14842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1ljwsn-0004tB-E2
 for qemu-devel@nongnu.org; Fri, 21 May 2021 00:35:36 -0400
IronPort-SDR: I4bDKrdqigmq1StcQYmz1Nls0XzGJF1LWK3YGiX5xrXASHC6yLaWE9nAcq3L7P48fP3Dwzs3L/
 7iidZzrU58Pg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="201109797"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="201109797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 21:35:24 -0700
IronPort-SDR: iWSZcdC3s92ukL9XEMZM21oDwvNVFk8bLwM0vgU0QCQDpYq6MhB2BSIJhnhYMmsQh/FimflQ4Y
 TryoR/nobEpg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="474343511"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 21:35:21 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
Date: Fri, 21 May 2021 12:38:20 +0800
Message-Id: <20210521043820.29678-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=chenyi.qiang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A bus lock is acquired through either split locked access to writeback
(WB) memory or any locked access to non-WB memory. It is typically >1000
cycles slower than an atomic operation within a cache and can also
disrupts performance on other cores.

Virtual Machines can exploit bus locks to degrade the performance of
system. To address this kind of performance DOS attack coming from the
VMs, bus lock VM exit is introduced in KVM and it can report the bus
locks detected in guest. If enabled in KVM, it would exit to the
userspace to let the user enforce throttling policies once bus locks
acquired in VMs.

The availability of bus lock VM exit can be detected through the
KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
bitmap is the only supported strategy at present. It indicates that KVM
will exit to userspace to handle the bus locks.

This patch adds a ratelimit on the bus locks acquired in guest as a
mitigation policy.

Introduce a new field "bus_lock_ratelimit" to record the limited speed
of bus locks in the target VM. The user can specify it through the
"bus-lock-ratelimit" as a machine property. In current implementation,
the default value of the speed is 0 per second, which means no
restrictions on the bus locks.

As for ratelimit on detected bus locks, simply set the ratelimit
interval to 1s and restrict the quota of bus lock occurence to the value
of "bus_lock_ratelimit". A potential alternative is to introduce the
time slice as a property which can help the user achieve more precise
control.

The detail of bus lock VM exit can be found in spec:
https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>

---
Changes from v3:
  - change bus_lock_ratelimit_ctrl to a static variable to avoid calling
    qdev_get_machine(). (Eduardo)
  - 4951967d84a0ratelimit is thread safe by commit 4951967d84a0, remove
    the ratelimit mutex in previous patch.(Eduardo)
  - v3: https://lore.kernel.org/qemu-devel/20210430103305.28849-1-chenyi.qiang@intel.com/

Changes from v2:
  - do some rename work (bus-lock-ratelimit and BUS_LOCK_TIME_SLICE).
    (Eduardo)
  - change to register a class property at the x86_machine_class_init()
    and write the gettter/setter for the bus_lock_ratelimit property.
    (Eduardo)
  - add the lock to access the Ratelimit instance to avoid vcpu thread
    race condition. (Eduardo)
  - v2: https://lore.kernel.org/qemu-devel/20210420093736.17613-1-chenyi.qiang@intel.com/

Changes from RFC v1:
  - Remove the rip info output, as the rip can't reflect the bus lock
    position correctly. (Xiaoyao)
  - RFC v1: https://lore.kernel.org/qemu-devel/20210317084709.15605-1-chenyi.qiang@intel.com/
---
 hw/i386/x86.c         | 24 ++++++++++++++++++++++++
 include/hw/i386/x86.h |  8 ++++++++
 target/i386/kvm/kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed796fe6ba..d30cf27e29 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1246,6 +1246,23 @@ static void x86_machine_set_oem_table_id(Object *obj, const char *value,
     strncpy(x86ms->oem_table_id, value, 8);
 }
 
+static void x86_machine_get_bus_lock_ratelimit(Object *obj, Visitor *v,
+                                const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    uint64_t bus_lock_ratelimit = x86ms->bus_lock_ratelimit;
+
+    visit_type_uint64(v, name, &bus_lock_ratelimit, errp);
+}
+
+static void x86_machine_set_bus_lock_ratelimit(Object *obj, Visitor *v,
+                               const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_uint64(v, name, &x86ms->bus_lock_ratelimit, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1256,6 +1273,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    x86ms->bus_lock_ratelimit = 0;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
@@ -1299,6 +1317,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
                                           "Override the default value of field OEM Table ID "
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
+
+    object_class_property_add(oc, X86_MACHINE_BUS_LOCK_RATELIMIT, "uint64_t",
+                                x86_machine_get_bus_lock_ratelimit,
+                                x86_machine_set_bus_lock_ratelimit, NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_BUS_LOCK_RATELIMIT,
+            "Set the ratelimit for the bus locks acquired in VMs");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index c09b648dff..25a1f16f01 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -74,12 +74,20 @@ struct X86MachineState {
      * will be translated to MSI messages in the address space.
      */
     AddressSpace *ioapic_as;
+
+    /*
+     * Ratelimit enforced on detected bus locks in guest.
+     * The default value of the bus_lock_ratelimit is 0 per second,
+     * which means no limitation on the guest's bus locks.
+     */
+    uint64_t bus_lock_ratelimit;
 };
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
+#define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d972eb4705..af328068b3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -131,6 +131,9 @@ static bool has_msr_mcg_ext_ctl;
 static struct kvm_cpuid2 *cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
+#define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
+static RateLimit bus_lock_ratelimit_ctrl;
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
@@ -2268,6 +2271,28 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+        X86MachineState *x86ms = X86_MACHINE(ms);
+
+        if (x86ms->bus_lock_ratelimit > 0) {
+            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
+            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
+                error_report("kvm: bus lock detection unsupported");
+                return -ENOTSUP;
+            }
+            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
+                                    KVM_BUS_LOCK_DETECTION_EXIT);
+            if (ret < 0) {
+                error_report("kvm: Failed to enable bus lock detection cap: %s",
+                             strerror(-ret));
+                return ret;
+            }
+            ratelimit_init(&bus_lock_ratelimit_ctrl);
+            ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
+                                x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
+        }
+    }
+
     return 0;
 }
 
@@ -4222,6 +4247,15 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
     }
 }
 
+static void kvm_rate_limit_on_bus_lock(void)
+{
+    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
+
+    if (delay_ns) {
+        g_usleep(delay_ns / SCALE_US);
+    }
+}
+
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
     } else {
         env->eflags &= ~IF_MASK;
     }
+    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
+        kvm_rate_limit_on_bus_lock();
+    }
 
     /* We need to protect the apic state against concurrent accesses from
      * different threads in case the userspace irqchip is used. */
@@ -4595,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ioapic_eoi_broadcast(run->eoi.vector);
         ret = 0;
         break;
+    case KVM_EXIT_X86_BUS_LOCK:
+        /* already handled in kvm_arch_post_run */
+        ret = 0;
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
-- 
2.17.1


