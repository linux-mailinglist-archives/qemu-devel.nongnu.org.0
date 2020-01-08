Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF113409A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 12:35:55 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip9cw-0007pG-6A
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 06:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1ip9Zu-0005JC-5w
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 06:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1ip9Zs-0002hR-Eb
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 06:32:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58890 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1ip9Zo-0002b3-EY; Wed, 08 Jan 2020 06:32:40 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BC598886670BA7D29E56;
 Wed,  8 Jan 2020 19:32:37 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 19:32:31 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <pbonzini@redhat.com>, <gengdongjiu@huawei.com>, <mst@redhat.com>,
 <imammedo@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
 <ehabkost@redhat.com>, <mtosatti@redhat.com>, <xuwei5@huawei.com>,
 <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v22 8/9] target-arm: kvm64: handle SIGBUS signal from kernel
 or KVM
Date: Wed, 8 Jan 2020 19:32:22 +0800
Message-ID: <1578483143-14905-9-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: zhengxiang9@huawei.com, linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a SIGBUS signal handler. In this handler, it checks the SIGBUS type,
translates the host VA delivered by host to guest PA, then fills this PA
to guest APEI GHES memory, then notifies guest according to the SIGBUS
type.

When guest accesses the poisoned memory, it will generate a Synchronous
External Abort(SEA). Then host kernel gets an APEI notification and calls
memory_failure() to unmapped the affected page in stage 2, finally
returns to guest.

Guest continues to access the PG_hwpoison page, it will trap to KVM as
stage2 fault, then a SIGBUS_MCEERR_AR synchronous signal is delivered to
Qemu, Qemu records this error address into guest APEI GHES memory and
notifes guest using Synchronous-External-Abort(SEA).

In order to inject a vSEA, we introduce the kvm_inject_arm_sea() function
in which we can setup the type of exception and the syndrome information.
When switching to guest, the target vcpu will jump to the synchronous
external abort vector table entry.

The ESR_ELx.DFSC is set to synchronous external abort(0x10), and the
ESR_ELx.FnV is set to not valid(0x1), which will tell guest that FAR is
not valid and hold an UNKNOWN value. These values will be set to KVM
register structures through KVM_SET_ONE_REG IOCTL.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 include/sysemu/kvm.h    |  3 +--
 target/arm/cpu.h        |  4 +++
 target/arm/helper.c     |  2 +-
 target/arm/internals.h  |  5 ++--
 target/arm/kvm64.c      | 66 +++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/tlb_helper.c |  2 +-
 target/i386/cpu.h       |  2 ++
 7 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 141342d..3b22504 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -379,8 +379,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
 
-#ifdef TARGET_I386
-#define KVM_HAVE_MCE_INJECTION 1
+#ifdef KVM_HAVE_MCE_INJECTION
 void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 #endif
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5f70e9e..723bdb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -28,6 +28,10 @@
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
 
+#ifdef TARGET_AARCH64
+#define KVM_HAVE_MCE_INJECTION 1
+#endif
+
 #define EXCP_UDEF            1   /* undefined instruction */
 #define EXCP_SWI             2   /* software interrupt */
 #define EXCP_PREFETCH_ABORT  3
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5074b5f..05bffd3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3045,7 +3045,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
              * Report exception with ESR indicating a fault due to a
              * translation table walk for a cache maintenance instruction.
              */
-            syn = syn_data_abort_no_iss(current_el == target_el,
+            syn = syn_data_abort_no_iss(current_el == target_el, 0,
                                         fi.ea, 1, fi.s1ptw, 1, fsc);
             env->exception.vaddress = value;
             env->exception.fsr = fsr;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f5313dd..28b8451 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -451,13 +451,14 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
         | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
-static inline uint32_t syn_data_abort_no_iss(int same_el,
+static inline uint32_t syn_data_abort_no_iss(int same_el, int fnv,
                                              int ea, int cm, int s1ptw,
                                              int wnr, int fsc)
 {
     return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
            | ARM_EL_IL
-           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+           | (fnv << 10) | (ea << 9) | (cm << 8) | (s1ptw << 7)
+           | (wnr << 6) | fsc;
 }
 
 static inline uint32_t syn_data_abort_with_iss(int same_el,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 876184b..f3b05c1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -28,6 +28,8 @@
 #include "kvm_arm.h"
 #include "hw/boards.h"
 #include "internals.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/ghes.h"
 
 static bool have_guest_debug;
 
@@ -843,6 +845,30 @@ int kvm_arm_cpreg_level(uint64_t regidx)
     return KVM_PUT_RUNTIME_STATE;
 }
 
+/* Callers must hold the iothread mutex lock */
+static void kvm_inject_arm_sea(CPUState *c)
+{
+    ARMCPU *cpu = ARM_CPU(c);
+    CPUARMState *env = &cpu->env;
+    CPUClass *cc = CPU_GET_CLASS(c);
+    uint32_t esr;
+    bool same_el;
+
+    c->exception_index = EXCP_DATA_ABORT;
+    env->exception.target_el = 1;
+
+    /*
+     * Set the DFSC to synchronous external abort and set FnV to not valid,
+     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
+     */
+    same_el = arm_current_el(env) == env->exception.target_el;
+    esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, 0, 0x10);
+
+    env->exception.syndrome = esr;
+
+    cc->do_interrupt(c);
+}
+
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
@@ -1295,6 +1321,46 @@ int kvm_arch_get_registers(CPUState *cs)
     return ret;
 }
 
+void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
+{
+    ram_addr_t ram_addr;
+    hwaddr paddr;
+
+    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
+
+    if (acpi_enabled && addr &&
+            object_property_get_bool(qdev_get_machine(), "ras", NULL)) {
+        ram_addr = qemu_ram_addr_from_host(addr);
+        if (ram_addr != RAM_ADDR_INVALID &&
+            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
+            kvm_hwpoison_page_add(ram_addr);
+            /*
+             * Asynchronous signal will be masked by main thread, so
+             * only handle synchronous signal.
+             */
+            if (code == BUS_MCEERR_AR) {
+                kvm_cpu_synchronize_state(c);
+                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                    kvm_inject_arm_sea(c);
+                } else {
+                    error_report("failed to record the error");
+                    abort();
+                }
+            }
+            return;
+        }
+        if (code == BUS_MCEERR_AO) {
+            error_report("Hardware memory error at addr %p for memory used by "
+                "QEMU itself instead of guest system!", addr);
+        }
+    }
+
+    if (code == BUS_MCEERR_AR) {
+        error_report("Hardware memory error!");
+        exit(1);
+    }
+}
+
 /* C6.6.29 BRK instruction */
 static const uint32_t brk_insn = 0xd4200000;
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 5feb312..499672e 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -33,7 +33,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * ISV field.
      */
     if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
-        syn = syn_data_abort_no_iss(same_el,
+        syn = syn_data_abort_no_iss(same_el, 0,
                                     ea, 0, s1ptw, is_write, fsc);
     } else {
         /*
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index af28293..1a0dbc1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -29,6 +29,8 @@
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
+#define KVM_HAVE_MCE_INJECTION 1
+
 /* Maximum instruction code size */
 #define TARGET_MAX_INSN_SIZE 16
 
-- 
1.8.3.1


