Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F25F0F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:55:45 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIMa-0007Dg-B8
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oeIJU-0003h1-J1
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:52:32 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:45126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1oeIJL-00042X-8p
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:52:32 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1oeIJ7-0005Ou-Ls; Fri, 30 Sep 2022 17:52:09 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3] hyperv: fix SynIC SINT assertion failure on guest reset
Date: Fri, 30 Sep 2022 17:52:03 +0200
Message-Id: <cb57cee2e29b20d06f81dce054cbcea8b5d497e8.1664552976.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
handler via a new x86_cpu_after_reset() function co-located with
the existing x86_cpu_reset() in target/i386/cpu.c.
Opportunistically move the APIC reset handler there, too.

Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") # exposed the bug
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---

Changes from v2:
Make sure that the microvm machine reset handler also calls
x86_cpu_after_reset().
Opportunistically move the APIC reset handler to x86_cpu_after_reset().

 hw/i386/microvm.c          |  4 +---
 hw/i386/pc.c               |  5 ++---
 target/i386/cpu.c          | 13 +++++++++++++
 target/i386/cpu.h          |  2 ++
 target/i386/kvm/hyperv.c   |  4 ++++
 target/i386/kvm/kvm.c      | 24 +++++++++++++++++-------
 target/i386/kvm/kvm_i386.h |  1 +
 7 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 52cafa003d..a3ff915b71 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -485,9 +485,7 @@ static void microvm_machine_reset(MachineState *machine)
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
 
-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
+        x86_cpu_after_reset(cpu);
     }
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e6..768982ae9a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,6 +92,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
+#include "target/i386/cpu.h"
 #include "qapi/qmp/qerror.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
@@ -1859,9 +1860,7 @@ static void pc_machine_reset(MachineState *machine)
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
 
-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
+        x86_cpu_after_reset(cpu);
     }
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1db1278a59..ddb4fce2e0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6034,6 +6034,19 @@ static void x86_cpu_reset(DeviceState *dev)
 #endif
 }
 
+void x86_cpu_after_reset(X86CPU *cpu)
+{
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_arch_after_reset_vcpu(cpu);
+    }
+
+    if (cpu->apic_state) {
+        device_legacy_reset(cpu->apic_state);
+    }
+#endif
+}
+
 static void mce_init(X86CPU *cpu)
 {
     CPUX86State *cenv = &cpu->env;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..c67d98e1a9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2079,6 +2079,8 @@ typedef struct PropValue {
 } PropValue;
 void x86_cpu_apply_props(X86CPU *cpu, PropValue *props);
 
+void x86_cpu_after_reset(X86CPU *cpu);
+
 uint32_t cpu_x86_virtual_addr_width(CPUX86State *env);
 
 /* cpu.c other functions (cpuid) */
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
index a1fd1f5379..774484c588 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2203,20 +2203,30 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
         env->mp_state = KVM_MP_STATE_RUNNABLE;
     }
 
+    /* enabled by default */
+    env->poll_control_msr = 1;
+
+    kvm_init_nested_state(env);
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
-    kvm_init_nested_state(env);
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

