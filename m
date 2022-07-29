Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37C585333
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:12:42 +0200 (CEST)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSbP-0001id-Pg
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oHSR2-0007VG-Tp
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:01:56 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:57394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oHSR0-00029G-LU
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:01:56 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1oHSQe-0001k4-76; Fri, 29 Jul 2022 18:01:32 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hyperv: fix SynIC SINT assertion failure on guest reset
Date: Fri, 29 Jul 2022 18:01:26 +0200
Message-Id: <e132e1fbf2bcc3f6f4ba339a5b36d938aca083fa.1659110405.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU
assertion failure:
hw/hyperv/hyperv.c:131: synic_reset: Assertion `QLIST_EMPTY(&synic->sint_routes)' failed.

This happens both on normal guest reboot or when using "system_reset" HMP
command.

The failing assertion was introduced by commit 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc")
to catch dangling SINT routes on SynIC reset.

The root cause of this problem is that the SynIC itself is reset before
devices using SINT routes have chance to clean up these routes.

Since there seems to be no existing mechanism to force reset callbacks (or
methods) to be executed in specific order let's use a similar method that
is already used to reset another interrupt controller (APIC) after devices
have been reset - by invoking the SynIC reset from the machine reset
handler via a new "after_reset" X86 CPU method.

Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") # exposed the bug
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 hw/i386/pc.c               |  6 ++++++
 target/i386/cpu-qom.h      |  2 ++
 target/i386/cpu.c          | 10 ++++++++++
 target/i386/kvm/hyperv.c   |  4 ++++
 target/i386/kvm/kvm.c      | 20 +++++++++++++++-----
 target/i386/kvm/kvm_i386.h |  1 +
 6 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7280c02ce3..6a76d320f6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1847,6 +1847,7 @@ static void pc_machine_reset(MachineState *machine)
 {
     CPUState *cs;
     X86CPU *cpu;
+    const X86CPUClass *cpuc;
 
     qemu_devices_reset();
 
@@ -1855,6 +1856,11 @@ static void pc_machine_reset(MachineState *machine)
      */
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
+        cpuc = X86_CPU_GET_CLASS(cpu);
+
+        if (cpuc->after_reset) {
+            cpuc->after_reset(cpu);
+        }
 
         if (cpu->apic_state) {
             device_legacy_reset(cpu->apic_state);
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index c557a522e1..339d23006a 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -43,6 +43,7 @@ typedef struct X86CPUModel X86CPUModel;
  * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
  * @parent_reset: The parent class' reset handler.
+ * @after_reset: Reset handler to be called only after all other devices have been reset.
  *
  * An x86 CPU model or family.
  */
@@ -68,6 +69,7 @@ struct X86CPUClass {
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
     DeviceReset parent_reset;
+    void (*after_reset)(X86CPU *cpu);
 };
 
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..a7b5945efd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6029,6 +6029,15 @@ static void x86_cpu_reset(DeviceState *dev)
 #endif
 }
 
+static void x86_cpu_after_reset(X86CPU *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_arch_after_reset_vcpu(cpu);
+    }
+#endif
+}
+
 static void mce_init(X86CPU *cpu)
 {
     CPUX86State *cenv = &cpu->env;
@@ -7094,6 +7103,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, x86_cpu_properties);
 
     device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
+    xcc->after_reset = x86_cpu_after_reset;
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
index 9026ef3a81..e3ac978648 100644
--- a/target/i386/kvm/hyperv.c
+++ b/target/i386/kvm/hyperv.c
@@ -23,6 +23,10 @@ int hyperv_x86_synic_add(X86CPU *cpu)
     return 0;
 }
 
+/*
+ * All devices possibly using SynIC have to be reset before calling this to let
+ * them remove their SINT routes first.
+ */
 void hyperv_x86_synic_reset(X86CPU *cpu)
 {
     hyperv_synic_reset(CPU(cpu));
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52f..00736abeea 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2188,18 +2188,28 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
         env->mp_state = KVM_MP_STATE_RUNNABLE;
     }
 
+    /* enabled by default */
+    env->poll_control_msr = 1;
+
+    sev_es_set_reset_vector(CPU(cpu));
+}
+
+void kvm_arch_after_reset_vcpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int i;
+
+    /*
+     * Reset SynIC after all other devices have been reset to let them remove
+     * their SINT routes first.
+     */
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
-        int i;
         for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
             env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
         }
 
         hyperv_x86_synic_reset(cpu);
     }
-    /* enabled by default */
-    env->poll_control_msr = 1;
-
-    sev_es_set_reset_vector(CPU(cpu));
 }
 
 void kvm_arch_do_init_vcpu(X86CPU *cpu)
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 4124912c20..096a5dd781 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -38,6 +38,7 @@ bool kvm_has_adjust_clock_stable(void);
 bool kvm_has_exception_payload(void);
 void kvm_synchronize_all_tsc(void);
 void kvm_arch_reset_vcpu(X86CPU *cs);
+void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value);

