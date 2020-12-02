Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2332CB697
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:17:42 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNKX-0003Gc-JS
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC8-0002RD-9J
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC3-0003Yz-Mh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LpCbRfhUGl9rIWa5QP0bNWz8U8C84+G4L60FjY3CEg=;
 b=M7csxlTBY62atrcizUP4MtuHYbLFO7uTAnOMH1UkJUntwHWUSUQBufrrjNZINgJ7NtbGNc
 lRlkZukpwTuDxsWvJMxJ5+5M+PJTQmPCgAE9Ogz7MNnt35wiswRHIEQBdOTl14OOUzRUHV
 2rKQtyb9fd00E/62LIfhPmsuNlqkuBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-cAaV3nyZNlqrjdVZO2mmug-1; Wed, 02 Dec 2020 03:08:52 -0500
X-MC-Unique: cAaV3nyZNlqrjdVZO2mmug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB4E5708B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B63C810013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 004/113] WHPX: support for the kernel-irqchip on/off
Date: Wed,  2 Dec 2020 03:07:00 -0500
Message-Id: <20201202080849.4125477-5-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sunil Muthuswamy <sunilmut@microsoft.com>

This patch adds support the kernel-irqchip option for
WHPX with on or off value. 'split' value is not supported
for the option. The option only works for the latest version
of Windows (ones that are coming out on Insiders). The
change maintains backward compatibility on older version of
Windows where this option is not supported.

Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>
Message-Id: <SN4PR2101MB0880B13258DA9251F8459F4DC0170@SN4PR2101MB0880.namprd21.prod.outlook.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                |   1 +
 hw/i386/x86.c              |   6 +-
 include/sysemu/whpx.h      |  22 +++
 softmmu/cpus.c             |   3 +-
 softmmu/vl.c               |   8 +-
 target/i386/cpu.c          |   3 +
 target/i386/meson.build    |   1 +
 target/i386/whp-dispatch.h |   9 +-
 target/i386/whpx-all.c     | 291 ++++++++++++++++++++++++++++++++-----
 target/i386/whpx-apic.c    | 274 ++++++++++++++++++++++++++++++++++
 10 files changed, 578 insertions(+), 40 deletions(-)
 create mode 100644 target/i386/whpx-apic.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41..15113505b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -452,6 +452,7 @@ WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
 S: Supported
 F: target/i386/whpx-all.c
+F: target/i386/whpx-apic.c
 F: target/i386/whpx-cpus.c
 F: target/i386/whp-dispatch.h
 F: accel/stubs/whpx-stub.c
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 5944fc44ed..6d5c1432f2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
 #include "sysemu/qtest.h"
+#include "sysemu/whpx.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
@@ -532,7 +533,8 @@ static void pic_irq_request(void *opaque, int irq, int level)
     X86CPU *cpu = X86_CPU(cs);
 
     trace_x86_pic_interrupt(irq, level);
-    if (cpu->apic_state && !kvm_irqchip_in_kernel()) {
+    if (cpu->apic_state && !kvm_irqchip_in_kernel() &&
+        !whpx_apic_in_platform()) {
         CPU_FOREACH(cs) {
             cpu = X86_CPU(cs);
             if (apic_accept_pic_intr(cpu->apic_state)) {
@@ -558,7 +560,7 @@ int cpu_get_pic_interrupt(CPUX86State *env)
     X86CPU *cpu = env_archcpu(env);
     int intno;
 
-    if (!kvm_irqchip_in_kernel()) {
+    if (!kvm_irqchip_in_kernel() && !whpx_apic_in_platform()) {
         intno = apic_get_interrupt(cpu->apic_state);
         if (intno >= 0) {
             return intno;
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 59edf13742..9346fd92e9 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,11 +15,33 @@
 
 #ifdef CONFIG_WHPX
 
+#include "whp-dispatch.h"
+
+struct whpx_state {
+    uint64_t mem_quota;
+    WHV_PARTITION_HANDLE partition;
+    bool kernel_irqchip_allowed;
+    bool kernel_irqchip_required;
+    bool apic_in_platform;
+};
+
+struct whpx_lapic_state {
+    struct {
+        uint32_t data;
+        uint32_t padding[3];
+    } fields[256];
+};
+
+extern struct whpx_state whpx_global;
 int whpx_enabled(void);
 
+void whpx_apic_get(DeviceState *s);
+#define whpx_apic_in_platform() (whpx_global.apic_in_platform)
+
 #else /* CONFIG_WHPX */
 
 #define whpx_enabled() (0)
+#define whpx_apic_in_platform() (0)
 
 #endif /* CONFIG_WHPX */
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e46ac68ad0..1dc20b9dc3 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -41,6 +41,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/whpx.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 
@@ -88,7 +89,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
         return true;
     }
     if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel()) {
+        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
         return false;
     }
     return true;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..bbe65d3742 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2501,11 +2501,15 @@ static int machine_set_property(void *opaque,
         object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
         return 0;
     }
-    if (g_str_equal(qom_name, "kvm-shadow-mem") ||
-        g_str_equal(qom_name, "kernel-irqchip")) {
+    if (g_str_equal(qom_name, "kvm-shadow-mem")) {
         object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
         return 0;
     }
+    if (g_str_equal(qom_name, "kernel-irqchip")) {
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), qom_name, value);
+        return 0;
+    }
 
     return object_parse_property_opt(opaque, name, value, "type", errp);
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b90ed05897..af48e3f79e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -30,6 +30,7 @@
 #include "sysemu/hvf.h"
 #include "sysemu/cpus.h"
 #include "sysemu/xen.h"
+#include "sysemu/whpx.h"
 #include "kvm_i386.h"
 #include "sev_i386.h"
 
@@ -6148,6 +6149,8 @@ APICCommonClass *apic_get_class(void)
         apic_type = "kvm-apic";
     } else if (xen_enabled()) {
         apic_type = "xen-apic";
+    } else if (whpx_apic_in_platform()) {
+        apic_type = "whpx-apic";
     }
 
     return APIC_COMMON_CLASS(object_class_by_name(apic_type));
diff --git a/target/i386/meson.build b/target/i386/meson.build
index a1a02f3e99..fc3ee80386 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -33,6 +33,7 @@ i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
   'whpx-all.c',
   'whpx-cpus.c',
+  'whpx-apic.c',
 ))
 i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
   'hax-all.c',
diff --git a/target/i386/whp-dispatch.h b/target/i386/whp-dispatch.h
index b18aba20ed..cef5d848bd 100644
--- a/target/i386/whp-dispatch.h
+++ b/target/i386/whp-dispatch.h
@@ -30,6 +30,14 @@
  */
 #define LIST_WINHVPLATFORM_FUNCTIONS_SUPPLEMENTAL(X) \
   X(HRESULT, WHvSuspendPartitionTime, (WHV_PARTITION_HANDLE Partition)) \
+  X(HRESULT, WHvRequestInterrupt, (WHV_PARTITION_HANDLE Partition, \
+        WHV_INTERRUPT_CONTROL* Interrupt, UINT32 InterruptControlSize)) \
+  X(HRESULT, WHvGetVirtualProcessorInterruptControllerState2, \
+        (WHV_PARTITION_HANDLE Partition, UINT32 VpIndex, PVOID State, \
+         UINT32 StateSize, UINT32* WrittenSize)) \
+  X(HRESULT, WHvSetVirtualProcessorInterruptControllerState2, \
+        (WHV_PARTITION_HANDLE Partition, UINT32 VpIndex, PVOID State, \
+         UINT32 StateSize)) \
 
 #define LIST_WINHVEMULATION_FUNCTIONS(X) \
   X(HRESULT, WHvEmulatorCreateEmulator, (const WHV_EMULATOR_CALLBACKS* Callbacks, WHV_EMULATOR_HANDLE* Emulator)) \
@@ -37,7 +45,6 @@
   X(HRESULT, WHvEmulatorTryIoEmulation, (WHV_EMULATOR_HANDLE Emulator, VOID* Context, const WHV_VP_EXIT_CONTEXT* VpContext, const WHV_X64_IO_PORT_ACCESS_CONTEXT* IoInstructionContext, WHV_EMULATOR_STATUS* EmulatorReturnStatus)) \
   X(HRESULT, WHvEmulatorTryMmioEmulation, (WHV_EMULATOR_HANDLE Emulator, VOID* Context, const WHV_VP_EXIT_CONTEXT* VpContext, const WHV_MEMORY_ACCESS_CONTEXT* MmioInstructionContext, WHV_EMULATOR_STATUS* EmulatorReturnStatus)) \
 
-
 #define WHP_DEFINE_TYPE(return_type, function_name, signature) \
     typedef return_type (WINAPI *function_name ## _t) signature;
 
diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index f4f3e33eac..3b824fc9d7 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -19,10 +19,15 @@
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
 #include "hw/boards.h"
+#include "hw/i386/ioapic.h"
+#include "hw/i386/apic_internal.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/qapi-types-common.h"
+#include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
 #include "whp-dispatch.h"
+#include <winerror.h>
 
 #include "whpx-cpus.h"
 
@@ -31,11 +36,6 @@
 
 #define HYPERV_APIC_BUS_FREQUENCY      (200000000ULL)
 
-struct whpx_state {
-    uint64_t mem_quota;
-    WHV_PARTITION_HANDLE partition;
-};
-
 static const WHV_REGISTER_NAME whpx_register_names[] = {
 
     /* X64 General purpose registers */
@@ -152,6 +152,7 @@ struct whpx_vcpu {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
+    bool ready_for_pic_interrupt;
     uint64_t tpr;
     uint64_t apic_base;
     bool interruption_pending;
@@ -163,7 +164,7 @@ struct whpx_vcpu {
 static bool whpx_allowed;
 static bool whp_dispatch_initialized;
 static HMODULE hWinHvPlatform, hWinHvEmulation;
-
+static uint32_t max_vcpu_index;
 struct whpx_state whpx_global;
 struct WHPDispatch whp_dispatch;
 
@@ -599,6 +600,10 @@ static void whpx_get_registers(CPUState *cpu)
 
     assert(idx == RTL_NUMBER_OF(whpx_register_names));
 
+    if (whpx_apic_in_platform()) {
+        whpx_apic_get(x86_cpu->apic_state);
+    }
+
     return;
 }
 
@@ -820,26 +825,42 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
     }
 
     /* Get pending hard interruption or replay one that was overwritten */
-    if (!vcpu->interruption_pending &&
-        vcpu->interruptable && (env->eflags & IF_MASK)) {
-        assert(!new_int.InterruptionPending);
-        if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
-            cpu->interrupt_request &= ~CPU_INTERRUPT_HARD;
-            irq = cpu_get_pic_interrupt(env);
-            if (irq >= 0) {
-                new_int.InterruptionType = WHvX64PendingInterrupt;
-                new_int.InterruptionPending = 1;
-                new_int.InterruptionVector = irq;
+    if (!whpx_apic_in_platform()) {
+        if (!vcpu->interruption_pending &&
+            vcpu->interruptable && (env->eflags & IF_MASK)) {
+            assert(!new_int.InterruptionPending);
+            if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
+                cpu->interrupt_request &= ~CPU_INTERRUPT_HARD;
+                irq = cpu_get_pic_interrupt(env);
+                if (irq >= 0) {
+                    new_int.InterruptionType = WHvX64PendingInterrupt;
+                    new_int.InterruptionPending = 1;
+                    new_int.InterruptionVector = irq;
+                }
             }
         }
-    }
 
-    /* Setup interrupt state if new one was prepared */
-    if (new_int.InterruptionPending) {
-        reg_values[reg_count].PendingInterruption = new_int;
-        reg_names[reg_count] = WHvRegisterPendingInterruption;
-        reg_count += 1;
-    }
+        /* Setup interrupt state if new one was prepared */
+        if (new_int.InterruptionPending) {
+            reg_values[reg_count].PendingInterruption = new_int;
+            reg_names[reg_count] = WHvRegisterPendingInterruption;
+            reg_count += 1;
+        }
+    } else if (vcpu->ready_for_pic_interrupt &&
+               (cpu->interrupt_request & CPU_INTERRUPT_HARD)) {
+        cpu->interrupt_request &= ~CPU_INTERRUPT_HARD;
+        irq = cpu_get_pic_interrupt(env);
+        if (irq >= 0) {
+            reg_names[reg_count] = WHvRegisterPendingEvent;
+            reg_values[reg_count].ExtIntEvent = (WHV_X64_PENDING_EXT_INT_EVENT)
+            {
+                .EventPending = 1,
+                .EventType = WHvX64PendingEventExtInt,
+                .Vector = irq,
+            };
+            reg_count += 1;
+        }
+     }
 
     /* Sync the TPR to the CR8 if was modified during the intercept */
     tpr = cpu_get_apic_tpr(x86_cpu->apic_state);
@@ -854,14 +875,17 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
     /* Update the state of the interrupt delivery notification */
     if (!vcpu->window_registered &&
         cpu->interrupt_request & CPU_INTERRUPT_HARD) {
-        reg_values[reg_count].DeliverabilityNotifications.InterruptNotification
-            = 1;
+        reg_values[reg_count].DeliverabilityNotifications =
+            (WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER) {
+                .InterruptNotification = 1
+            };
         vcpu->window_registered = 1;
         reg_names[reg_count] = WHvX64RegisterDeliverabilityNotifications;
         reg_count += 1;
     }
 
     qemu_mutex_unlock_iothread();
+    vcpu->ready_for_pic_interrupt = false;
 
     if (reg_count) {
         hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
@@ -948,7 +972,7 @@ static int whpx_vcpu_run(CPUState *cpu)
     int ret;
 
     whpx_vcpu_process_async_events(cpu);
-    if (cpu->halted) {
+    if (cpu->halted && !whpx_apic_in_platform()) {
         cpu->exception_index = EXCP_HLT;
         qatomic_set(&cpu->exit_request, false);
         return 0;
@@ -992,14 +1016,114 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
 
         case WHvRunVpExitReasonX64InterruptWindow:
+            vcpu->ready_for_pic_interrupt = 1;
             vcpu->window_registered = 0;
             ret = 0;
             break;
 
+        case WHvRunVpExitReasonX64ApicEoi:
+            assert(whpx_apic_in_platform());
+            ioapic_eoi_broadcast(vcpu->exit_ctx.ApicEoi.InterruptVector);
+            break;
+
         case WHvRunVpExitReasonX64Halt:
             ret = whpx_handle_halt(cpu);
             break;
 
+        case WHvRunVpExitReasonX64ApicInitSipiTrap: {
+            WHV_INTERRUPT_CONTROL ipi = {0};
+            uint64_t icr = vcpu->exit_ctx.ApicInitSipi.ApicIcr;
+            uint32_t delivery_mode =
+                (icr & APIC_ICR_DELIV_MOD) >> APIC_ICR_DELIV_MOD_SHIFT;
+            int dest_shorthand =
+                (icr & APIC_ICR_DEST_SHORT) >> APIC_ICR_DEST_SHORT_SHIFT;
+            bool broadcast = false;
+            bool include_self = false;
+            uint32_t i;
+
+            /* We only registered for INIT and SIPI exits. */
+            if ((delivery_mode != APIC_DM_INIT) &&
+                (delivery_mode != APIC_DM_SIPI)) {
+                error_report(
+                    "WHPX: Unexpected APIC exit that is not a INIT or SIPI");
+                break;
+            }
+
+            if (delivery_mode == APIC_DM_INIT) {
+                ipi.Type = WHvX64InterruptTypeInit;
+            } else {
+                ipi.Type = WHvX64InterruptTypeSipi;
+            }
+
+            ipi.DestinationMode =
+                ((icr & APIC_ICR_DEST_MOD) >> APIC_ICR_DEST_MOD_SHIFT) ?
+                    WHvX64InterruptDestinationModeLogical :
+                    WHvX64InterruptDestinationModePhysical;
+
+            ipi.TriggerMode =
+                ((icr & APIC_ICR_TRIGGER_MOD) >> APIC_ICR_TRIGGER_MOD_SHIFT) ?
+                    WHvX64InterruptTriggerModeLevel :
+                    WHvX64InterruptTriggerModeEdge;
+
+            ipi.Vector = icr & APIC_VECTOR_MASK;
+            switch (dest_shorthand) {
+            /* no shorthand. Bits 56-63 contain the destination. */
+            case 0:
+                ipi.Destination = (icr >> 56) & APIC_VECTOR_MASK;
+                hr = whp_dispatch.WHvRequestInterrupt(whpx->partition,
+                        &ipi, sizeof(ipi));
+                if (FAILED(hr)) {
+                    error_report("WHPX: Failed to request interrupt  hr=%08lx",
+                        hr);
+                }
+
+                break;
+
+            /* self */
+            case 1:
+                include_self = true;
+                break;
+
+            /* broadcast, including self */
+            case 2:
+                broadcast = true;
+                include_self = true;
+                break;
+
+            /* broadcast, excluding self */
+            case 3:
+                broadcast = true;
+                break;
+            }
+
+            if (!broadcast && !include_self) {
+                break;
+            }
+
+            for (i = 0; i <= max_vcpu_index; i++) {
+                if (i == cpu->cpu_index && !include_self) {
+                    continue;
+                }
+
+                /*
+                 * Assuming that APIC Ids are identity mapped since
+                 * WHvX64RegisterApicId & WHvX64RegisterInitialApicId registers
+                 * are not handled yet and the hypervisor doesn't allow the
+                 * guest to modify the APIC ID.
+                 */
+                ipi.Destination = i;
+                hr = whp_dispatch.WHvRequestInterrupt(whpx->partition,
+                        &ipi, sizeof(ipi));
+                if (FAILED(hr)) {
+                    error_report(
+                        "WHPX: Failed to request SIPI for %d,  hr=%08lx",
+                        i, hr);
+                }
+            }
+
+            break;
+        }
+
         case WHvRunVpExitReasonCanceled:
             cpu->exception_index = EXCP_INTERRUPT;
             ret = 1;
@@ -1314,6 +1438,7 @@ int whpx_init_vcpu(CPUState *cpu)
     vcpu->interruptable = true;
     cpu->vcpu_dirty = true;
     cpu->hax_vcpu = (struct hax_vcpu_state *)vcpu;
+    max_vcpu_index = max(max_vcpu_index, cpu->cpu_index);
     qemu_add_vm_change_state_handler(whpx_cpu_update_state, cpu->env_ptr);
 
     return 0;
@@ -1549,6 +1674,43 @@ error:
     return false;
 }
 
+static void whpx_set_kernel_irqchip(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    struct whpx_state *whpx = &whpx_global;
+    OnOffSplit mode;
+
+    if (!visit_type_OnOffSplit(v, name, &mode, errp)) {
+        return;
+    }
+
+    switch (mode) {
+    case ON_OFF_SPLIT_ON:
+        whpx->kernel_irqchip_allowed = true;
+        whpx->kernel_irqchip_required = true;
+        break;
+
+    case ON_OFF_SPLIT_OFF:
+        whpx->kernel_irqchip_allowed = false;
+        whpx->kernel_irqchip_required = false;
+        break;
+
+    case ON_OFF_SPLIT_SPLIT:
+        error_setg(errp, "WHPX: split irqchip currently not supported");
+        error_append_hint(errp,
+            "Try without kernel-irqchip or with kernel-irqchip=on|off");
+        break;
+
+    default:
+        /*
+         * The value was checked in visit_type_OnOffSplit() above. If
+         * we get here, then something is wrong in QEMU.
+         */
+        abort();
+    }
+}
+
 /*
  * Partition support
  */
@@ -1562,6 +1724,7 @@ static int whpx_accel_init(MachineState *ms)
     UINT32 whpx_cap_size;
     WHV_PARTITION_PROPERTY prop;
     UINT32 cpuidExitList[] = {1, 0x80000001};
+    WHV_CAPABILITY_FEATURES features = {0};
 
     whpx = &whpx_global;
 
@@ -1570,7 +1733,6 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
 
-    memset(whpx, 0, sizeof(struct whpx_state));
     whpx->mem_quota = ms->ram_size;
 
     hr = whp_dispatch.WHvGetCapability(
@@ -1582,6 +1744,14 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
 
+    hr = whp_dispatch.WHvGetCapability(
+        WHvCapabilityCodeFeatures, &features, sizeof(features), NULL);
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to query capabilities, hr=%08lx", hr);
+        ret = -EINVAL;
+        goto error;
+    }
+
     hr = whp_dispatch.WHvCreatePartition(&whpx->partition);
     if (FAILED(hr)) {
         error_report("WHPX: Failed to create partition, hr=%08lx", hr);
@@ -1604,18 +1774,55 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
 
+    /*
+     * Error out if WHP doesn't support apic emulation and user is requiring
+     * it.
+     */
+    if (whpx->kernel_irqchip_required && (!features.LocalApicEmulation ||
+            !whp_dispatch.WHvSetVirtualProcessorInterruptControllerState2)) {
+        error_report("WHPX: kernel irqchip requested, but unavailable. "
+            "Try without kernel-irqchip or with kernel-irqchip=off");
+        ret = -EINVAL;
+        goto error;
+    }
+
+    if (whpx->kernel_irqchip_allowed && features.LocalApicEmulation &&
+        whp_dispatch.WHvSetVirtualProcessorInterruptControllerState2) {
+        WHV_X64_LOCAL_APIC_EMULATION_MODE mode =
+            WHvX64LocalApicEmulationModeXApic;
+        printf("WHPX: setting APIC emulation mode in the hypervisor\n");
+        hr = whp_dispatch.WHvSetPartitionProperty(
+            whpx->partition,
+            WHvPartitionPropertyCodeLocalApicEmulationMode,
+            &mode,
+            sizeof(mode));
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to enable kernel irqchip hr=%08lx", hr);
+            if (whpx->kernel_irqchip_required) {
+                error_report("WHPX: kernel irqchip requested, but unavailable");
+                ret = -EINVAL;
+                goto error;
+            }
+        } else {
+            whpx->apic_in_platform = true;
+        }
+    }
+
+    /* Register for MSR and CPUID exits */
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
     prop.ExtendedVmExits.X64MsrExit = 1;
     prop.ExtendedVmExits.X64CpuidExit = 1;
-    hr = whp_dispatch.WHvSetPartitionProperty(
-        whpx->partition,
-        WHvPartitionPropertyCodeExtendedVmExits,
-        &prop,
-        sizeof(WHV_PARTITION_PROPERTY));
+    if (whpx_apic_in_platform()) {
+        prop.ExtendedVmExits.X64ApicInitSipiExitTrap = 1;
+    }
 
+    hr = whp_dispatch.WHvSetPartitionProperty(
+            whpx->partition,
+            WHvPartitionPropertyCodeExtendedVmExits,
+            &prop,
+            sizeof(WHV_PARTITION_PROPERTY));
     if (FAILED(hr)) {
-        error_report("WHPX: Failed to enable partition extended X64MsrExit and"
-                     " X64CpuidExit hr=%08lx", hr);
+        error_report("WHPX: Failed to enable MSR & CPUIDexit, hr=%08lx", hr);
         ret = -EINVAL;
         goto error;
     }
@@ -1668,11 +1875,27 @@ static void whpx_accel_class_init(ObjectClass *oc, void *data)
     ac->name = "WHPX";
     ac->init_machine = whpx_accel_init;
     ac->allowed = &whpx_allowed;
+
+    object_class_property_add(oc, "kernel-irqchip", "on|off|split",
+        NULL, whpx_set_kernel_irqchip,
+        NULL, NULL);
+    object_class_property_set_description(oc, "kernel-irqchip",
+        "Configure WHPX in-kernel irqchip");
+}
+
+static void whpx_accel_instance_init(Object *obj)
+{
+    struct whpx_state *whpx = &whpx_global;
+
+    memset(whpx, 0, sizeof(struct whpx_state));
+    /* Turn on kernel-irqchip, by default */
+    whpx->kernel_irqchip_allowed = true;
 }
 
 static const TypeInfo whpx_accel_type = {
     .name = ACCEL_CLASS_NAME("whpx"),
     .parent = TYPE_ACCEL,
+    .instance_init = whpx_accel_instance_init,
     .class_init = whpx_accel_class_init,
 };
 
diff --git a/target/i386/whpx-apic.c b/target/i386/whpx-apic.c
new file mode 100644
index 0000000000..b127a3cb8a
--- /dev/null
+++ b/target/i386/whpx-apic.c
@@ -0,0 +1,274 @@
+/*
+ * WHPX platform APIC support
+ *
+ * Copyright (c) 2011 Siemens AG
+ *
+ * Authors:
+ *  Jan Kiszka          <jan.kiszka@siemens.com>
+ *  John Starks         <jostarks@microsoft.com>
+ *
+ * This work is licensed under the terms of the GNU GPL version 2.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/i386/apic_internal.h"
+#include "hw/i386/apic-msidef.h"
+#include "hw/pci/msi.h"
+#include "sysemu/hw_accel.h"
+#include "sysemu/whpx.h"
+#include "whp-dispatch.h"
+
+static void whpx_put_apic_state(APICCommonState *s,
+                                struct whpx_lapic_state *kapic)
+{
+    int i;
+
+    memset(kapic, 0, sizeof(*kapic));
+    kapic->fields[0x2].data = s->id << 24;
+    kapic->fields[0x3].data = s->version | ((APIC_LVT_NB - 1) << 16);
+    kapic->fields[0x8].data = s->tpr;
+    kapic->fields[0xd].data = s->log_dest << 24;
+    kapic->fields[0xe].data = s->dest_mode << 28 | 0x0fffffff;
+    kapic->fields[0xf].data = s->spurious_vec;
+    for (i = 0; i < 8; i++) {
+        kapic->fields[0x10 + i].data = s->isr[i];
+        kapic->fields[0x18 + i].data = s->tmr[i];
+        kapic->fields[0x20 + i].data = s->irr[i];
+    }
+
+    kapic->fields[0x28].data = s->esr;
+    kapic->fields[0x30].data = s->icr[0];
+    kapic->fields[0x31].data = s->icr[1];
+    for (i = 0; i < APIC_LVT_NB; i++) {
+        kapic->fields[0x32 + i].data = s->lvt[i];
+    }
+
+    kapic->fields[0x38].data = s->initial_count;
+    kapic->fields[0x3e].data = s->divide_conf;
+}
+
+static void whpx_get_apic_state(APICCommonState *s,
+                                struct whpx_lapic_state *kapic)
+{
+    int i, v;
+
+    s->id = kapic->fields[0x2].data >> 24;
+    s->tpr = kapic->fields[0x8].data;
+    s->arb_id = kapic->fields[0x9].data;
+    s->log_dest = kapic->fields[0xd].data >> 24;
+    s->dest_mode = kapic->fields[0xe].data >> 28;
+    s->spurious_vec = kapic->fields[0xf].data;
+    for (i = 0; i < 8; i++) {
+        s->isr[i] = kapic->fields[0x10 + i].data;
+        s->tmr[i] = kapic->fields[0x18 + i].data;
+        s->irr[i] = kapic->fields[0x20 + i].data;
+    }
+
+    s->esr = kapic->fields[0x28].data;
+    s->icr[0] = kapic->fields[0x30].data;
+    s->icr[1] = kapic->fields[0x31].data;
+    for (i = 0; i < APIC_LVT_NB; i++) {
+        s->lvt[i] = kapic->fields[0x32 + i].data;
+    }
+
+    s->initial_count = kapic->fields[0x38].data;
+    s->divide_conf = kapic->fields[0x3e].data;
+
+    v = (s->divide_conf & 3) | ((s->divide_conf >> 1) & 4);
+    s->count_shift = (v + 1) & 7;
+
+    s->initial_count_load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    apic_next_timer(s, s->initial_count_load_time);
+}
+
+static void whpx_apic_set_base(APICCommonState *s, uint64_t val)
+{
+    s->apicbase = val;
+}
+
+static void whpx_put_apic_base(CPUState *cpu, uint64_t val)
+{
+    HRESULT hr;
+    WHV_REGISTER_VALUE reg_value = {.Reg64 = val};
+    WHV_REGISTER_NAME reg_name = WHvX64RegisterApicBase;
+
+    hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+             whpx_global.partition,
+             cpu->cpu_index,
+             &reg_name, 1,
+             &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set MSR APIC base, hr=%08lx", hr);
+    }
+}
+
+static void whpx_apic_set_tpr(APICCommonState *s, uint8_t val)
+{
+    s->tpr = val;
+}
+
+static uint8_t whpx_apic_get_tpr(APICCommonState *s)
+{
+    return s->tpr;
+}
+
+static void whpx_apic_vapic_base_update(APICCommonState *s)
+{
+    /* not implemented yet */
+}
+
+static void whpx_apic_put(CPUState *cs, run_on_cpu_data data)
+{
+    APICCommonState *s = data.host_ptr;
+    struct whpx_lapic_state kapic;
+    HRESULT hr;
+
+    whpx_put_apic_base(CPU(s->cpu), s->apicbase);
+    whpx_put_apic_state(s, &kapic);
+
+    hr = whp_dispatch.WHvSetVirtualProcessorInterruptControllerState2(
+        whpx_global.partition,
+        cs->cpu_index,
+        &kapic,
+        sizeof(kapic));
+    if (FAILED(hr)) {
+        fprintf(stderr,
+            "WHvSetVirtualProcessorInterruptControllerState failed: %08lx\n",
+             hr);
+
+        abort();
+    }
+}
+
+void whpx_apic_get(DeviceState *dev)
+{
+    APICCommonState *s = APIC_COMMON(dev);
+    CPUState *cpu = CPU(s->cpu);
+    struct whpx_lapic_state kapic;
+
+    HRESULT hr = whp_dispatch.WHvGetVirtualProcessorInterruptControllerState2(
+        whpx_global.partition,
+        cpu->cpu_index,
+        &kapic,
+        sizeof(kapic),
+        NULL);
+    if (FAILED(hr)) {
+        fprintf(stderr,
+            "WHvSetVirtualProcessorInterruptControllerState failed: %08lx\n",
+            hr);
+
+        abort();
+    }
+
+    whpx_get_apic_state(s, &kapic);
+}
+
+static void whpx_apic_post_load(APICCommonState *s)
+{
+    run_on_cpu(CPU(s->cpu), whpx_apic_put, RUN_ON_CPU_HOST_PTR(s));
+}
+
+static void whpx_apic_external_nmi(APICCommonState *s)
+{
+}
+
+static void whpx_send_msi(MSIMessage *msg)
+{
+    uint64_t addr = msg->address;
+    uint32_t data = msg->data;
+    uint8_t dest = (addr & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
+    uint8_t vector = (data & MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT;
+    uint8_t dest_mode = (addr >> MSI_ADDR_DEST_MODE_SHIFT) & 0x1;
+    uint8_t trigger_mode = (data >> MSI_DATA_TRIGGER_SHIFT) & 0x1;
+    uint8_t delivery = (data >> MSI_DATA_DELIVERY_MODE_SHIFT) & 0x7;
+
+    WHV_INTERRUPT_CONTROL interrupt = {
+        /* Values correspond to delivery modes */
+        .Type = delivery,
+        .DestinationMode = dest_mode ?
+            WHvX64InterruptDestinationModeLogical :
+            WHvX64InterruptDestinationModePhysical,
+
+        .TriggerMode = trigger_mode ?
+            WHvX64InterruptTriggerModeLevel : WHvX64InterruptTriggerModeEdge,
+        .Reserved = 0,
+        .Vector = vector,
+        .Destination = dest,
+    };
+    HRESULT hr = whp_dispatch.WHvRequestInterrupt(whpx_global.partition,
+                     &interrupt, sizeof(interrupt));
+    if (FAILED(hr)) {
+        fprintf(stderr, "whpx: injection failed, MSI (%llx, %x) delivery: %d, "
+                "dest_mode: %d, trigger mode: %d, vector: %d, lost (%08lx)\n",
+                addr, data, delivery, dest_mode, trigger_mode, vector, hr);
+    }
+}
+
+static uint64_t whpx_apic_mem_read(void *opaque, hwaddr addr,
+                                   unsigned size)
+{
+    return ~(uint64_t)0;
+}
+
+static void whpx_apic_mem_write(void *opaque, hwaddr addr,
+                                uint64_t data, unsigned size)
+{
+    MSIMessage msg = { .address = addr, .data = data };
+    whpx_send_msi(&msg);
+}
+
+static const MemoryRegionOps whpx_apic_io_ops = {
+    .read = whpx_apic_mem_read,
+    .write = whpx_apic_mem_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void whpx_apic_reset(APICCommonState *s)
+{
+    /* Not used by WHPX. */
+    s->wait_for_sipi = 0;
+
+    run_on_cpu(CPU(s->cpu), whpx_apic_put, RUN_ON_CPU_HOST_PTR(s));
+}
+
+static void whpx_apic_realize(DeviceState *dev, Error **errp)
+{
+    APICCommonState *s = APIC_COMMON(dev);
+
+    memory_region_init_io(&s->io_memory, OBJECT(s), &whpx_apic_io_ops, s,
+                          "whpx-apic-msi", APIC_SPACE_SIZE);
+
+    msi_nonbroken = true;
+}
+
+static void whpx_apic_class_init(ObjectClass *klass, void *data)
+{
+    APICCommonClass *k = APIC_COMMON_CLASS(klass);
+
+    k->realize = whpx_apic_realize;
+    k->reset = whpx_apic_reset;
+    k->set_base = whpx_apic_set_base;
+    k->set_tpr = whpx_apic_set_tpr;
+    k->get_tpr = whpx_apic_get_tpr;
+    k->post_load = whpx_apic_post_load;
+    k->vapic_base_update = whpx_apic_vapic_base_update;
+    k->external_nmi = whpx_apic_external_nmi;
+    k->send_msi = whpx_send_msi;
+}
+
+static const TypeInfo whpx_apic_info = {
+    .name = "whpx-apic",
+    .parent = TYPE_APIC_COMMON,
+    .instance_size = sizeof(APICCommonState),
+    .class_init = whpx_apic_class_init,
+};
+
+static void whpx_apic_register_types(void)
+{
+    type_register_static(&whpx_apic_info);
+}
+
+type_init(whpx_apic_register_types)
-- 
2.26.2



