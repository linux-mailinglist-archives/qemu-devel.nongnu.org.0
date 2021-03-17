Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39133EBCE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 09:47:30 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMRpx-0004ZI-Cw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 04:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lMRn3-0003og-JT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:44:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:57389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lMRn0-0007MD-BF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:44:29 -0400
IronPort-SDR: KP6ZBDcd74dSdhbv+Dx3NhKB0pZ315bxDuMzMYxa3XgA3GUWsLwri1OfDQRzFXMRM1lfRrgVIK
 nb+X87xVmKRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188783380"
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; d="scan'208";a="188783380"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 01:44:16 -0700
IronPort-SDR: Di7C1I4wGpSqwTLwB+fQ9C4nF2mddisyrM5sAoue/pkweCGuPRdxCXHiXnkH3K9yyJv/3sLmuK
 duAOFAfhtdIA==
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; d="scan'208";a="412561274"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 01:44:14 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [RFC PATCH] i386: Add ratelimit for bus locks acquired in guest
Date: Wed, 17 Mar 2021 16:47:09 +0800
Message-Id: <20210317084709.15605-1-chenyi.qiang@intel.com>
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

Virtual Machines can exploit bus locks to degrade the performance of
system. To address this kind of performance DOS attack, bus lock VM exit
is introduced in KVM and it will report the bus locks detected in guest,
which can help userspace to enforce throttling policies.

The availability of bus lock VM exit can be detected through the
KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
bitmap is the only supported strategy at present. It indicates that KVM
will exit to userspace to handle the bus locks.

This patch adds a ratelimit on the bus locks acquired in guest as a
mitigation policy.

Introduce a new field "bld" to record the limited speed of bus locks in
target VM. The user can specify it through the "bus-lock-detection"
as a machine property. In current implementation, the default value of
the speed is 0 per second, which means no restriction on the bus locks.

Ratelimit enforced in data transmission uses a time slice of 100ms to
get smooth output during regular operations in block jobs. As for
ratelimit on bus lock detection, simply set the ratelimit interval to 1s
and restrict the quota of bus lock occurrence to the value of "bld". A
potential alternative is to introduce the time slice as a property
which can help the user achieve more precise control.

The detail of Bus lock VM exit can be found in spec:
https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/i386/x86.c         |  6 ++++++
 include/hw/i386/x86.h |  7 +++++++
 target/i386/kvm/kvm.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7865660e2c..a70a259e97 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1209,6 +1209,12 @@ static void x86_machine_initfn(Object *obj)
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->smp_dies = 1;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
+    x86ms->bld = 0;
+
+    object_property_add_uint64_ptr(obj, "bus-lock-detection",
+                                   &x86ms->bld, OBJ_PROP_FLAG_READWRITE);
+    object_property_set_description(obj, "bus-lock-detection",
+            "Bus lock detection ratelimit");
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 56080bd1fb..1f0ffbcfb9 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -72,6 +72,13 @@ struct X86MachineState {
      * will be translated to MSI messages in the address space.
      */
     AddressSpace *ioapic_as;
+
+    /*
+     * ratelimit enforced on detected bus locks, the default value
+     * is 0 per second
+     */
+    uint64_t bld;
+    RateLimit bld_limit;
 };
 
 #define X86_MACHINE_SMM              "smm"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c8d61daf68..724862137d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -130,6 +130,8 @@ static bool has_msr_mcg_ext_ctl;
 static struct kvm_cpuid2 *cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
+#define SLICE_TIME 1000000000ULL /* ns */
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
@@ -2267,6 +2269,27 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+        X86MachineState *x86ms = X86_MACHINE(ms);
+
+        if (x86ms->bld > 0) {
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
+
+            ratelimit_set_speed(&x86ms->bld_limit, x86ms->bld, SLICE_TIME);
+        }
+    }
+
     return 0;
 }
 
@@ -4221,6 +4244,18 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
     }
 }
 
+static void kvm_rate_limit_on_bus_lock(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(ms);
+
+    uint64_t delay_ns = ratelimit_calculate_delay(&x86ms->bld_limit, 1);
+
+    if (delay_ns) {
+        g_usleep(delay_ns / SCALE_US);
+    }
+}
+
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -4236,6 +4271,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
     } else {
         env->eflags &= ~IF_MASK;
     }
+    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
+        kvm_cpu_synchronize_state(cpu);
+        warn_report("bus lock detected at rip: 0x%lx", env->eip);
+        kvm_rate_limit_on_bus_lock();
+    }
 
     /* We need to protect the apic state against concurrent accesses from
      * different threads in case the userspace irqchip is used. */
@@ -4594,6 +4634,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
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


