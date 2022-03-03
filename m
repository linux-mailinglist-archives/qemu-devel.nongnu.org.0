Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C258F4CB448
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 02:32:15 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPaKE-00074y-Cj
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 20:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nPaGn-0006I7-49
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 20:28:41 -0500
Received: from sysprogs.com ([45.79.83.98]:51316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nPaGj-0004Vl-Hb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 20:28:40 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id C940B11A358;
 Thu,  3 Mar 2022 01:28:35 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] whpx: Added support for breakpoints and stepping
Date: Wed, 2 Mar 2022 17:28:33 -0800
Message-ID: <0e7f01d82e9e$00e9c360$02bd4a20$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdgunKz/tBYC1j2YSVm1qNOzHwiXrQ==
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 =?iso-8859-1?Q?'Alex_Benn=E9e'?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Below is the updated version of the patch adding debugging support to =
WHPX.
It incorporates feedback from Alex Benn=E9e and Peter Maydell regarding =
not
changing the emulation logic depending on the gdb connection status.

Instead of checking for an active gdb connection to determine whether =
QEMU
should intercept the INT1 exceptions, it now checks whether any =
breakpoints
have been set, or whether gdb has explicitly requested one or more CPUs =
to
do single-stepping. Having none of these condition present now has the =
same
effect as not using gdb at all.=20

---

This adds support for breakpoints and stepping when debugging
WHPX-accelerated guests with gdb.
It enables reliable debugging of the Linux kernel in both single-CPU and =
SMP
modes.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
---
 gdbstub.c                         |  10 +-
 include/sysemu/accel-ops.h        |   1 +
 include/sysemu/runstate.h         |   8 +-
 softmmu/cpus.c                    |  12 +-
 target/i386/whpx/whpx-accel-ops.c |   1 +
 target/i386/whpx/whpx-accel-ops.h |   1 +
 target/i386/whpx/whpx-all.c       | 770 +++++++++++++++++++++++++++++-
 target/i386/whpx/whpx-internal.h  |  30 ++
 8 files changed, 815 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..ab3cd44f72 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -519,7 +519,15 @@ static int gdb_continue_partial(char *newstates)
     int flag =3D 0;
=20
     if (!runstate_needs_reset()) {
-        if (vm_prepare_start()) {
+        bool step_requested =3D false;
+        CPU_FOREACH(cpu) {
+            if (newstates[cpu->cpu_index] =3D=3D 's') {
+                step_requested =3D true;
+                break;
+            }
+        }
+
+        if (vm_prepare_start(step_requested)) {
             return 0;
         }
=20
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d7..f40ca4c033 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -35,6 +35,7 @@ struct AccelOpsClass {
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
     void (*synchronize_pre_loadvm)(CPUState *cpu);
+    void (*synchronize_pre_resume)(bool step_pending);
=20
     void (*handle_interrupt)(CPUState *cpu, int mask);
=20
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691573..798ba13ecb 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -34,7 +34,13 @@ static inline bool =
shutdown_caused_by_guest(ShutdownCause
cause)
 }
=20
 void vm_start(void);
-int vm_prepare_start(void);
+
+/**
+ * vm_prepare_start: Prepare for starting/resuming the VM
+ *
+ * @step_pending: whether any of the CPUs is about to be single-stepped =
by
gdb
+ */
+int vm_prepare_start(bool step_pending);
 int vm_stop(RunState state);
 int vm_stop_force_state(RunState state);
 int vm_shutdown(void);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 035395ae13..acd695a229 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -662,7 +662,7 @@ int vm_stop(RunState state)
  * Returns -1 if the vCPUs are not to be restarted (e.g. if they are
already
  * running or in case of an error condition), 0 otherwise.
  */
-int vm_prepare_start(void)
+int vm_prepare_start(bool step_pending)
 {
     RunState requested;
=20
@@ -682,6 +682,14 @@ int vm_prepare_start(void)
         return -1;
     }
=20
+    /*
+     * WHPX accelerator needs to know whether we are going to step
+     * any CPUs, before starting the first one.
+     */
+    if (cpus_accel->synchronize_pre_resume) {
+        cpus_accel->synchronize_pre_resume(step_pending);
+    }
+
     /* We are sending this now, but the CPUs will be resumed shortly =
later
*/
     qapi_event_send_resume();
=20
@@ -693,7 +701,7 @@ int vm_prepare_start(void)
=20
 void vm_start(void)
 {
-    if (!vm_prepare_start()) {
+    if (!vm_prepare_start(false)) {
         resume_all_vcpus();
     }
 }
diff --git a/target/i386/whpx/whpx-accel-ops.c
b/target/i386/whpx/whpx-accel-ops.c
index 6bc47c5309..1a859a084d 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -94,6 +94,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc,
void *data)
     ops->synchronize_post_init =3D whpx_cpu_synchronize_post_init;
     ops->synchronize_state =3D whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm =3D whpx_cpu_synchronize_pre_loadvm;
+    ops->synchronize_pre_resume =3D whpx_cpu_synchronize_pre_resume;
 }
=20
 static const TypeInfo whpx_accel_ops_type =3D {
diff --git a/target/i386/whpx/whpx-accel-ops.h
b/target/i386/whpx/whpx-accel-ops.h
index 2dee6d61ea..b5102dd1ee 100644
--- a/target/i386/whpx/whpx-accel-ops.h
+++ b/target/i386/whpx/whpx-accel-ops.h
@@ -21,6 +21,7 @@ void whpx_cpu_synchronize_state(CPUState *cpu);
 void whpx_cpu_synchronize_post_reset(CPUState *cpu);
 void whpx_cpu_synchronize_post_init(CPUState *cpu);
 void whpx_cpu_synchronize_pre_loadvm(CPUState *cpu);
+void whpx_cpu_synchronize_pre_resume(bool step_pending);
=20
 /* state subset only touched by the VCPU itself during runtime */
 #define WHPX_SET_RUNTIME_STATE   1
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 8a8b5d55d1..10811e142e 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -12,6 +12,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
+#include "exec/gdbstub.h"
 #include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/whpx.h"
@@ -148,6 +149,87 @@ struct whpx_register_set {
     WHV_REGISTER_VALUE values[RTL_NUMBER_OF(whpx_register_names)];
 };
=20
+/*
+ * The current implementation of instruction stepping sets the TF flag
+ * in RFLAGS, causing the CPU to raise an INT1 after each instruction.
+ * This corresponds to the WHvX64ExceptionTypeDebugTrapOrFault =
exception.
+ *
+ * This approach has a few limitations:
+ *     1. Stepping over a PUSHF/SAHF instruction will save the TF flag
+ *        along with the other flags, possibly restoring it later. It =
would
+ *        result in another INT1 when the flags are restored, =
triggering
+ *        a stop in gdb that could be cleared by doing another step.
+ *
+ *        Stepping over a POPF/LAHF instruction will let it overwrite =
the
+ *        TF flags, ending the stepping mode.
+ *
+ *     2. Stepping over an instruction raising an exception (e.g. INT, =
DIV,
+ *        or anything that could result in a page fault) will save the
flags
+ *        to the stack, clear the TF flag, and let the guest execute =
the
+ *        handler. Normally, the guest will restore the original flags,
+ *        that will continue single-stepping.
+ *
+ *     3. Debuggers running on the guest may wish to set TF to do
instruction
+ *        stepping. INT1 events generated by it would be intercepted by =
us,
+ *        as long as the gdb is connected to QEMU.
+ *
+ * In practice this means that:
+ *     1. Stepping through flags-modifying instructions may cause gdb =
to
+ *        continue or stop in unexpected places. This will be fully
recoverable
+ *        and will not crash the target.
+ *
+ *     2. Stepping over an instruction that triggers an exception will =
step
+ *        over the exception handler, not into it.
+ *
+ *     3. Debugging the guest via gdb, while running debugger on the =
guest
+ *        at the same time may lead to unexpected effects. Removing all
+ *        breakpoints set via QEMU will prevent any further =
interference
+ *        with the guest-level debuggers.
+ *
+ * The limitations can be addressed as shown below:
+ *     1. PUSHF/SAHF/POPF/LAHF/IRET instructions can be emulated =
instead of
+ *        stepping through them. The exact semantics of the =
instructions is
+ *        defined in the "Combined Volume Set of Intel 64 and IA-32
+ *        Architectures Software Developer's Manuals", however it =
involves
a
+ *        fair amount of corner cases due to compatibility with real =
mode,
+ *        virtual 8086 mode, and differences between 64-bit and 32-bit
modes.
+ *
+ *     2. We could step into the guest's exception handlers using the
following
+ *        sequence:
+ *          a. Temporarily enable catching of all exception types via
+ *             whpx_set_exception_exit_bitmap().
+ *          b. Once an exception is intercepted, read the IDT/GDT and
locate
+ *             the original handler.
+ *          c. Patch the original handler, injecting an INT3 at the
beginning.
+ *          d. Update the exception exit bitmap to only catch the
+ *             WHvX64ExceptionTypeBreakpointTrap exception.
+ *          e. Let the affected CPU run in the exclusive mode.
+ *          f. Restore the original handler and the exception exit =
bitmap.
+ *        Note that handling all corner cases related to IDT/GDT is =
harder
+ *        than it may seem. See x86_cpu_get_phys_page_attrs_debug() for =
a
+ *        rough idea.
+ *
+ *     3. In order to properly support guest-level debugging in =
parallel
with
+ *        the QEMU-level debugging, we would need to be able to pass =
some
INT1
+ *        events to the guest. This could be done via the following
methods:
+ *          a. Using the WHvRegisterPendingEvent register. As of =
Windows
21H1,
+ *             it seems to only work for interrupts and not software
+ *             exceptions.
+ *          b. Locating and patching the original handler by parsing
IDT/GDT.
+ *             This involves relatively complex logic outlined in the
previous
+ *             paragraph.
+ *          c. Emulating the exception invocation (i.e. manually =
updating
RIP,
+ *             RFLAGS, and pushing the old values to stack). This is =
even
more
+ *             complicated than the previous option, since it involves
checking
+ *             CPL, gate attributes, and doing various adjustments
depending
+ *             on the current CPU mode, whether the CPL is changing, =
etc.
+ */
+typedef enum WhpxStepMode {
+    WHPX_STEP_NONE =3D 0,
+    /* Halt other VCPUs */
+    WHPX_STEP_EXCLUSIVE,
+} WhpxStepMode;
+
 struct whpx_vcpu {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
@@ -793,6 +875,517 @@ static int whpx_handle_portio(CPUState *cpu,
     return 0;
 }
=20
+/*
+ * Controls whether we should intercept various exceptions on the =
guest,
+ * namely breakpoint/single-step events.
+ *
+ * The 'exceptions' argument accepts a bitmask, e.g:
+ * (1 << WHvX64ExceptionTypeDebugTrapOrFault) | (...)
+ */
+static HRESULT whpx_set_exception_exit_bitmap(UINT64 exceptions)
+{
+    struct whpx_state *whpx =3D &whpx_global;
+    WHV_PARTITION_PROPERTY prop =3D { 0, };
+    HRESULT hr;
+
+    if (exceptions =3D=3D whpx->exception_exit_bitmap) {
+        return S_OK;
+    }
+
+    prop.ExceptionExitBitmap =3D exceptions;
+
+    hr =3D whp_dispatch.WHvSetPartitionProperty(
+        whpx->partition,
+        WHvPartitionPropertyCodeExceptionExitBitmap,
+        &prop,
+        sizeof(WHV_PARTITION_PROPERTY));
+
+    if (SUCCEEDED(hr)) {
+        whpx->exception_exit_bitmap =3D exceptions;
+    }
+
+    return hr;
+}
+
+
+/*
+ * This function is called before/after stepping over a single =
instruction.
+ * It will update the CPU registers to arm/disarm the instruction =
stepping
+ * accordingly.
+ */
+static HRESULT whpx_vcpu_configure_single_stepping(CPUState *cpu,
+    bool set,
+    uint64_t *exit_context_rflags)
+{
+    WHV_REGISTER_NAME reg_name;
+    WHV_REGISTER_VALUE reg_value;
+    HRESULT hr;
+    struct whpx_state *whpx =3D &whpx_global;
+
+    /*
+     * If we are trying to step over a single instruction, we need to =
set
the
+     * TF bit in rflags. Otherwise, clear it.
+     */
+    reg_name =3D WHvX64RegisterRflags;
+    hr =3D whp_dispatch.WHvGetVirtualProcessorRegisters(
+        whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to get rflags, hr=3D%08lx", hr);
+        return hr;
+    }
+
+    if (exit_context_rflags) {
+        assert(*exit_context_rflags =3D=3D reg_value.Reg64);
+    }
+
+    if (set) {
+        /* Raise WHvX64ExceptionTypeDebugTrapOrFault after each =
instruction
*/
+        reg_value.Reg64 |=3D TF_MASK;
+    } else {
+        reg_value.Reg64 &=3D ~TF_MASK;
+    }
+
+    if (exit_context_rflags) {
+        *exit_context_rflags =3D reg_value.Reg64;
+    }
+
+    hr =3D whp_dispatch.WHvSetVirtualProcessorRegisters(
+        whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set rflags,"
+            " hr=3D%08lx",
+            hr);
+        return hr;
+    }
+
+    reg_name =3D WHvRegisterInterruptState;
+    reg_value.Reg64 =3D 0;
+
+    /* Suspend delivery of hardware interrupts during single-stepping. =
*/
+    reg_value.InterruptState.InterruptShadow =3D set !=3D 0;
+
+    hr =3D whp_dispatch.WHvSetVirtualProcessorRegisters(
+    whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set InterruptState,"
+            " hr=3D%08lx",
+            hr);
+        return hr;
+    }
+
+    if (!set) {
+        /*
+         * We have just finished stepping over a single instruction,
+         * and intercepted the INT1 generated by it.
+         * We need to now hide the INT1 from the guest,
+         * as it would not be expecting it.
+         */
+
+        reg_name =3D WHvX64RegisterPendingDebugException;
+        hr =3D whp_dispatch.WHvGetVirtualProcessorRegisters(
+        whpx->partition,
+            cpu->cpu_index,
+            &reg_name,
+            1,
+            &reg_value);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to get pending debug =
exceptions,"
+                         "hr=3D%08lx", hr);
+            return hr;
+        }
+
+        if (reg_value.PendingDebugException.SingleStep) {
+            reg_value.PendingDebugException.SingleStep =3D 0;
+
+            hr =3D whp_dispatch.WHvSetVirtualProcessorRegisters(
+                whpx->partition,
+                cpu->cpu_index,
+                &reg_name,
+                1,
+                &reg_value);
+
+            if (FAILED(hr)) {
+                error_report("WHPX: Failed to clear pending debug
exceptions,"
+                             "hr=3D%08lx", hr);
+             return hr;
+            }
+        }
+
+    }
+
+    return S_OK;
+}
+
+/* Tries to find a breakpoint at the specified address. */
+static struct whpx_breakpoint *whpx_lookup_breakpoint_by_addr(uint64_t
address)
+{
+    struct whpx_state *whpx =3D &whpx_global;
+    int i;
+
+    if (whpx->breakpoints.breakpoints) {
+        for (i =3D 0; i < whpx->breakpoints.breakpoints->used; i++) {
+            if (address =3D=3D =
whpx->breakpoints.breakpoints->data[i].address)
{
+                return &whpx->breakpoints.breakpoints->data[i];
+            }
+        }
+    }
+
+    return NULL;
+}
+
+/*
+ * Linux uses int3 (0xCC) during startup (see int3_selftest()) and for
+ * debugging user-mode applications. Since the WHPX API does not offer
+ * an easy way to pass the intercepted exception back to the guest, we
+ * resort to using INT1 instead, and let the guest always handle INT3.
+ */
+static const uint8_t whpx_breakpoint_instruction =3D 0xF1;
+
+/*
+ * The WHPX QEMU backend implements breakpoints by writing the INT1
+ * instruction into memory (ignoring the DRx registers). This raises a =
few
+ * issues that need to be carefully handled:
+ *
+ * 1. Although unlikely, other parts of QEMU may set multiple =
breakpoints
+ *    at the same location, and later remove them in arbitrary order.
+ *    This should not cause memory corruption, and should only remove =
the
+ *    physical breakpoint instruction when the last QEMU breakpoint is
gone.
+ *
+ * 2. Writing arbitrary virtual memory may fail if it's not mapped to a
valid
+ *    physical location. Hence, physically adding/removing a breakpoint =
can
+ *    theoretically fail at any time. We need to keep track of it.
+ *
+ * The function below rebuilds a list of low-level breakpoints (one per
+ * address, tracking the original instruction and any errors) from the =
list
of
+ * high-level breakpoints (set via cpu_breakpoint_insert()).
+ *
+ * In order to optimize performance, this function stores the list of
+ * high-level breakpoints (a.k.a. CPU breakpoints) used to compute the
+ * low-level ones, so that it won't be re-invoked until these =
breakpoints
+ * change.
+ *
+ * Note that this function decides which breakpoints should be inserted
into,
+ * memory, but doesn't actually do it. The memory accessing is done in
+ * whpx_apply_breakpoints().
+ */
+static void whpx_translate_cpu_breakpoints(
+    struct whpx_breakpoints *breakpoints,
+    CPUState *cpu,
+    int cpu_breakpoint_count)
+{
+    CPUBreakpoint *bp;
+    int cpu_bp_index =3D 0;
+
+    breakpoints->original_addresses =3D
+        g_renew(vaddr, breakpoints->original_addresses,
cpu_breakpoint_count);
+
+    breakpoints->original_address_count =3D cpu_breakpoint_count;
+
+    int max_breakpoints =3D cpu_breakpoint_count +
+        (breakpoints->breakpoints ? breakpoints->breakpoints->used : =
0);
+
+    struct whpx_breakpoint_collection *new_breakpoints =3D
+        (struct whpx_breakpoint_collection *)g_malloc0(
+        sizeof(struct whpx_breakpoint_collection) +
+            max_breakpoints * sizeof(struct whpx_breakpoint));
+
+    new_breakpoints->allocated =3D max_breakpoints;
+    new_breakpoints->used =3D 0;
+
+    /*
+     * 1. Preserve all old breakpoints that could not be automatically
+     * cleared when the CPU got stopped.
+     */
+    if (breakpoints->breakpoints) {
+        int i;
+        for (i =3D 0; i < breakpoints->breakpoints->used; i++) {
+            if (breakpoints->breakpoints->data[i].state !=3D =
WHPX_BP_CLEARED)
{
+                new_breakpoints->data[new_breakpoints->used++] =3D
+                    breakpoints->breakpoints->data[i];
+            }
+        }
+    }
+
+    /* 2. Map all CPU breakpoints to WHPX breakpoints */
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        int i;
+        bool found =3D false;
+
+        /* This will be used to detect changed CPU breakpoints later. =
*/
+        breakpoints->original_addresses[cpu_bp_index++] =3D bp->pc;
+
+        for (i =3D 0; i < new_breakpoints->used; i++) {
+            /*
+             * WARNING: This loop has O(N^2) complexity, where N is the
+             * number of breakpoints. It should not be a bottleneck in
+             * real-world scenarios, since it only needs to run once =
after
+             * the breakpoints have been modified.
+             * If this ever becomes a concern, it can be optimized by
storing
+             * high-level breakpoint objects in a tree or hash map.
+             */
+
+            if (new_breakpoints->data[i].address =3D=3D bp->pc) {
+                /* There was already a breakpoint at this address. */
+                if (new_breakpoints->data[i].state =3D=3D
WHPX_BP_CLEAR_PENDING) {
+                    new_breakpoints->data[i].state =3D WHPX_BP_SET;
+                } else if (new_breakpoints->data[i].state =3D=3D =
WHPX_BP_SET) {
+                    new_breakpoints->data[i].state =3D =
WHPX_BP_SET_PENDING;
+                }
+
+                found =3D true;
+                break;
+            }
+        }
+
+        if (!found && new_breakpoints->used < =
new_breakpoints->allocated) {
+            /* No WHPX breakpoint at this address. Create one. */
+            new_breakpoints->data[new_breakpoints->used].address =3D =
bp->pc;
+            new_breakpoints->data[new_breakpoints->used].state =3D
+                WHPX_BP_SET_PENDING;
+            new_breakpoints->used++;
+        }
+    }
+
+    if (breakpoints->breakpoints) {
+        /*
+         * Free the previous breakpoint list. This can be optimized by
keeping
+         * it as shadow buffer for the next computation instead of =
freeing
+         * it immediately.
+         */
+        g_free(breakpoints->breakpoints);
+    }
+
+    breakpoints->breakpoints =3D new_breakpoints;
+}
+
+/*
+ * Physically inserts/removes the breakpoints by reading and writing =
the
+ * physical memory, keeping a track of the failed attempts.
+ *
+ * Passing resuming=3Dtrue  will try to set all previously unset =
breakpoints.
+ * Passing resuming=3Dfalse will remove all inserted ones.
+ */
+static void whpx_apply_breakpoints(
+    struct whpx_breakpoint_collection *breakpoints,
+    CPUState *cpu,
+    bool resuming)
+{
+    int i, rc;
+    if (!breakpoints) {
+        return;
+    }
+
+    for (i =3D 0; i < breakpoints->used; i++) {
+        /* Decide what to do right now based on the last known state. =
*/
+        WhpxBreakpointState state =3D breakpoints->data[i].state;
+        switch (state) {
+        case WHPX_BP_CLEARED:
+            if (resuming) {
+                state =3D WHPX_BP_SET_PENDING;
+            }
+            break;
+        case WHPX_BP_SET_PENDING:
+            if (!resuming) {
+                state =3D WHPX_BP_CLEARED;
+            }
+            break;
+        case WHPX_BP_SET:
+            if (!resuming) {
+                state =3D WHPX_BP_CLEAR_PENDING;
+            }
+            break;
+        case WHPX_BP_CLEAR_PENDING:
+            if (resuming) {
+                state =3D WHPX_BP_SET;
+            }
+            break;
+        }
+
+        if (state =3D=3D WHPX_BP_SET_PENDING) {
+            /* Remember the original instruction. */
+            rc =3D cpu_memory_rw_debug(cpu,
+                breakpoints->data[i].address,
+                &breakpoints->data[i].original_instruction,
+                1,
+                false);
+
+            if (!rc) {
+                /* Write the breakpoint instruction. */
+                rc =3D cpu_memory_rw_debug(cpu,
+                    breakpoints->data[i].address,
+                    (void *)&whpx_breakpoint_instruction,
+                    1,
+                    true);
+            }
+
+            if (!rc) {
+                state =3D WHPX_BP_SET;
+            }
+
+        }
+
+        if (state =3D=3D WHPX_BP_CLEAR_PENDING) {
+            /* Restore the original instruction. */
+            rc =3D cpu_memory_rw_debug(cpu,
+                breakpoints->data[i].address,
+                &breakpoints->data[i].original_instruction,
+                1,
+                true);
+
+            if (!rc) {
+                state =3D WHPX_BP_CLEARED;
+            }
+        }
+
+        breakpoints->data[i].state =3D state;
+    }
+}
+
+/*
+ * This function is called when the a VCPU is about to start and no =
other
+ * VCPUs have been started so far. Since the VCPU start order could be
+ * arbitrary, it doesn't have to be VCPU#0.
+ *
+ * It is used to commit the breakpoints into memory, and configure WHPX
+ * to intercept debug exceptions.
+ *
+ * Note that whpx_set_exception_exit_bitmap() cannot be called if one =
or
+ * more VCPUs are already running, so this is the best place to do it.
+ */
+static int whpx_first_vcpu_starting(CPUState *cpu)
+{
+    struct whpx_state *whpx =3D &whpx_global;
+    HRESULT hr;
+
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (!QTAILQ_EMPTY(&cpu->breakpoints) ||
+            (whpx->breakpoints.breakpoints &&
+             whpx->breakpoints.breakpoints->used)) {
+        CPUBreakpoint *bp;
+        int i =3D 0;
+        bool update_pending =3D false;
+
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            if (i >=3D whpx->breakpoints.original_address_count ||
+                bp->pc !=3D whpx->breakpoints.original_addresses[i]) {
+                update_pending =3D true;
+            }
+
+            i++;
+        }
+
+        if (i !=3D whpx->breakpoints.original_address_count) {
+            update_pending =3D true;
+        }
+
+        if (update_pending) {
+            /*
+             * The CPU breakpoints have changed since the last call to
+             * whpx_translate_cpu_breakpoints(). WHPX breakpoints must
+             * now be recomputed.
+             */
+            whpx_translate_cpu_breakpoints(&whpx->breakpoints, cpu, i);
+        }
+
+        /* Actually insert the breakpoints into the memory. */
+        whpx_apply_breakpoints(whpx->breakpoints.breakpoints, cpu, =
true);
+    }
+
+    uint64_t exception_mask;
+    if (whpx->step_pending ||
+        (whpx->breakpoints.breakpoints &&
+         whpx->breakpoints.breakpoints->used)) {
+        /*
+         * We are either attempting to single-step one or more CPUs, or
+         * have one or more breakpoints enabled. Both require =
intercepting
+         * the WHvX64ExceptionTypeBreakpointTrap exception.
+         */
+
+        exception_mask =3D 1UL << WHvX64ExceptionTypeDebugTrapOrFault;
+    } else {
+        /* Let the guest handle all exceptions. */
+        exception_mask =3D 0;
+    }
+
+    hr =3D whpx_set_exception_exit_bitmap(exception_mask);
+    if (!SUCCEEDED(hr)) {
+        error_report("WHPX: Failed to update exception exit mask,"
+                     "hr=3D%08lx.", hr);
+        return 1;
+    }
+
+    return 0;
+}
+
+/*
+ * This function is called when the last VCPU has finished running.
+ * It is used to remove any previously set breakpoints from memory.
+ */
+static int whpx_last_vcpu_stopping(CPUState *cpu)
+{
+    whpx_apply_breakpoints(whpx_global.breakpoints.breakpoints, cpu,
false);
+    return 0;
+}
+
+/* Returns the address of the next instruction that is about to be
executed. */
+static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
+{
+    if (cpu->vcpu_dirty) {
+        /* The CPU registers have been modified by other parts of QEMU. =
*/
+        struct CPUX86State *env =3D (CPUArchState *)(cpu->env_ptr);
+        return env->eip;
+    } else if (exit_context_valid) {
+        /*
+         * The CPU registers have not been modified by neither other =
parts
+         * of QEMU, nor this port by calling
WHvSetVirtualProcessorRegisters().
+         * This is the most common case.
+         */
+        struct whpx_vcpu *vcpu =3D get_whpx_vcpu(cpu);
+        return vcpu->exit_ctx.VpContext.Rip;
+    } else {
+        /*
+         * The CPU registers have been modified by a call to
+         * WHvSetVirtualProcessorRegisters() and must be re-queried =
from
+         * the target.
+         */
+        WHV_REGISTER_VALUE reg_value;
+        WHV_REGISTER_NAME reg_name =3D WHvX64RegisterRip;
+        HRESULT hr;
+        struct whpx_state *whpx =3D &whpx_global;
+
+        hr =3D whp_dispatch.WHvGetVirtualProcessorRegisters(
+            whpx->partition,
+            cpu->cpu_index,
+            &reg_name,
+            1,
+            &reg_value);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to get PC, hr=3D%08lx", hr);
+            return 0;
+        }
+
+        return reg_value.Reg64;
+    }
+}
+
 static int whpx_handle_halt(CPUState *cpu)
 {
     struct CPUX86State *env =3D (CPUArchState *)(cpu->env_ptr);
@@ -1004,17 +1597,75 @@ static int whpx_vcpu_run(CPUState *cpu)
     HRESULT hr;
     struct whpx_state *whpx =3D &whpx_global;
     struct whpx_vcpu *vcpu =3D get_whpx_vcpu(cpu);
+    struct whpx_breakpoint *stepped_over_bp =3D NULL;
+    WhpxStepMode exclusive_step_mode =3D WHPX_STEP_NONE;
     int ret;
=20
-    whpx_vcpu_process_async_events(cpu);
-    if (cpu->halted && !whpx_apic_in_platform()) {
-        cpu->exception_index =3D EXCP_HLT;
-        qatomic_set(&cpu->exit_request, false);
-        return 0;
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (whpx->running_cpus++ =3D=3D 0) {
+        /* Insert breakpoints into memory, update exception exit =
bitmap. */
+        ret =3D whpx_first_vcpu_starting(cpu);
+        if (ret !=3D 0) {
+            return ret;
+        }
+    }
+
+    if (whpx->breakpoints.breakpoints &&
+        whpx->breakpoints.breakpoints->used > 0)
+    {
+        uint64_t pc =3D whpx_vcpu_get_pc(cpu, true);
+        stepped_over_bp =3D whpx_lookup_breakpoint_by_addr(pc);
+        if (stepped_over_bp && stepped_over_bp->state !=3D WHPX_BP_SET) =
{
+            stepped_over_bp =3D NULL;
+        }
+
+        if (stepped_over_bp) {
+            /*
+             * We are trying to run the instruction overwritten by an
active
+             * breakpoint. We will temporarily disable the breakpoint,
suspend
+             * other CPUs, and step over the instruction.
+             */
+            exclusive_step_mode =3D WHPX_STEP_EXCLUSIVE;
+        }
+    }
+
+    if (exclusive_step_mode =3D=3D WHPX_STEP_NONE) {
+        whpx_vcpu_process_async_events(cpu);
+        if (cpu->halted && !whpx_apic_in_platform()) {
+            cpu->exception_index =3D EXCP_HLT;
+            qatomic_set(&cpu->exit_request, false);
+            return 0;
+        }
     }
=20
     qemu_mutex_unlock_iothread();
-    cpu_exec_start(cpu);
+
+    if (exclusive_step_mode !=3D WHPX_STEP_NONE) {
+        start_exclusive();
+        g_assert(cpu =3D=3D current_cpu);
+        g_assert(!cpu->running);
+        cpu->running =3D true;
+
+        hr =3D whpx_set_exception_exit_bitmap(
+            1UL << WHvX64ExceptionTypeDebugTrapOrFault);
+        if (!SUCCEEDED(hr)) {
+            error_report("WHPX: Failed to update exception exit mask, "
+                         "hr=3D%08lx.", hr);
+            return 1;
+        }
+
+        if (stepped_over_bp) {
+            /* Temporarily disable the triggered breakpoint. */
+            cpu_memory_rw_debug(cpu,
+                stepped_over_bp->address,
+                &stepped_over_bp->original_instruction,
+                1,
+                true);
+        }
+    } else {
+        cpu_exec_start(cpu);
+    }
=20
     do {
         if (cpu->vcpu_dirty) {
@@ -1022,10 +1673,16 @@ static int whpx_vcpu_run(CPUState *cpu)
             cpu->vcpu_dirty =3D false;
         }
=20
-        whpx_vcpu_pre_run(cpu);
+        if (exclusive_step_mode =3D=3D WHPX_STEP_NONE) {
+            whpx_vcpu_pre_run(cpu);
+
+            if (qatomic_read(&cpu->exit_request)) {
+                whpx_vcpu_kick(cpu);
+            }
+        }
=20
-        if (qatomic_read(&cpu->exit_request)) {
-            whpx_vcpu_kick(cpu);
+        if (exclusive_step_mode !=3D WHPX_STEP_NONE ||
cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu, true, NULL);
         }
=20
         hr =3D whp_dispatch.WHvRunVirtualProcessor(
@@ -1039,6 +1696,12 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
         }
=20
+        if (exclusive_step_mode !=3D WHPX_STEP_NONE ||
cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu,
+                false,
+                &vcpu->exit_ctx.VpContext.Rflags);
+        }
+
         whpx_vcpu_post_run(cpu);
=20
         switch (vcpu->exit_ctx.ExitReason) {
@@ -1062,6 +1725,10 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
=20
         case WHvRunVpExitReasonX64Halt:
+            /*
+             * WARNING: as of build 19043.1526 (21H1), this exit reason =
is
no
+             * longer used.
+             */
             ret =3D whpx_handle_halt(cpu);
             break;
=20
@@ -1160,10 +1827,19 @@ static int whpx_vcpu_run(CPUState *cpu)
         }
=20
         case WHvRunVpExitReasonCanceled:
-            cpu->exception_index =3D EXCP_INTERRUPT;
-            ret =3D 1;
+            if (exclusive_step_mode !=3D WHPX_STEP_NONE) {
+                /*
+                 * We are trying to step over a single instruction, and
+                 * likely got a request to stop from another thread.
+                 * Delay it until we are done stepping
+                 * over.
+                 */
+                ret =3D 0;
+            } else {
+                cpu->exception_index =3D EXCP_INTERRUPT;
+                ret =3D 1;
+            }
             break;
-
         case WHvRunVpExitReasonX64MsrAccess: {
             WHV_REGISTER_VALUE reg_values[3] =3D {0};
             WHV_REGISTER_NAME reg_names[3];
@@ -1267,11 +1943,36 @@ static int whpx_vcpu_run(CPUState *cpu)
             ret =3D 0;
             break;
         }
+        case WHvRunVpExitReasonException:
+            whpx_get_registers(cpu);
+
+            if ((vcpu->exit_ctx.VpException.ExceptionType =3D=3D
+                 WHvX64ExceptionTypeDebugTrapOrFault) &&
+                (vcpu->exit_ctx.VpException.InstructionByteCount >=3D =
1) &&
+                (vcpu->exit_ctx.VpException.InstructionBytes[0] =3D=3D
+                 whpx_breakpoint_instruction)) {
+                /* Stopped at a software breakpoint. */
+                cpu->exception_index =3D EXCP_DEBUG;
+            } else if ((vcpu->exit_ctx.VpException.ExceptionType =3D=3D
+                        WHvX64ExceptionTypeDebugTrapOrFault) &&
+                       !cpu->singlestep_enabled) {
+                /*
+                 * Just finished stepping over a breakpoint, but the
+                 * gdb does not expect us to do single-stepping.
+                 * Don't do anything special.
+                 */
+                cpu->exception_index =3D EXCP_INTERRUPT;
+            } else {
+                /* Another exception or debug event. Report it to GDB. =
*/
+                cpu->exception_index =3D EXCP_DEBUG;
+            }
+
+            ret =3D 1;
+            break;
         case WHvRunVpExitReasonNone:
         case WHvRunVpExitReasonUnrecoverableException:
         case WHvRunVpExitReasonInvalidVpRegisterValue:
         case WHvRunVpExitReasonUnsupportedFeature:
-        case WHvRunVpExitReasonException:
         default:
             error_report("WHPX: Unexpected VP exit code %d",
                          vcpu->exit_ctx.ExitReason);
@@ -1284,10 +1985,32 @@ static int whpx_vcpu_run(CPUState *cpu)
=20
     } while (!ret);
=20
-    cpu_exec_end(cpu);
+    if (stepped_over_bp) {
+        /* Restore the breakpoint we stepped over */
+        cpu_memory_rw_debug(cpu,
+            stepped_over_bp->address,
+            (void *)&whpx_breakpoint_instruction,
+            1,
+            true);
+    }
+
+    if (exclusive_step_mode !=3D WHPX_STEP_NONE) {
+        g_assert(cpu_in_exclusive_context(cpu));
+        cpu->running =3D false;
+        end_exclusive();
+
+        exclusive_step_mode =3D WHPX_STEP_NONE;
+    } else {
+        cpu_exec_end(cpu);
+    }
+
     qemu_mutex_lock_iothread();
     current_cpu =3D cpu;
=20
+    if (--whpx->running_cpus =3D=3D 0) {
+        whpx_last_vcpu_stopping(cpu);
+    }
+
     qatomic_set(&cpu->exit_request, false);
=20
     return ret < 0;
@@ -1347,6 +2070,11 @@ void whpx_cpu_synchronize_pre_loadvm(CPUState =
*cpu)
     run_on_cpu(cpu, do_whpx_cpu_synchronize_pre_loadvm, =
RUN_ON_CPU_NULL);
 }
=20
+void whpx_cpu_synchronize_pre_resume(bool step_pending)
+{
+    whpx_global.step_pending =3D step_pending;
+}
+
 /*
  * Vcpu support.
  */
@@ -1846,6 +2574,7 @@ static int whpx_accel_init(MachineState *ms)
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
     prop.ExtendedVmExits.X64MsrExit =3D 1;
     prop.ExtendedVmExits.X64CpuidExit =3D 1;
+    prop.ExtendedVmExits.ExceptionExit =3D 1;
     if (whpx_apic_in_platform()) {
         prop.ExtendedVmExits.X64ApicInitSipiExitTrap =3D 1;
     }
@@ -1874,6 +2603,19 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
=20
+    /*
+     * We do not want to intercept any exceptions from the guest,
+     * until we actually start debugging with gdb.
+     */
+    whpx->exception_exit_bitmap =3D -1;
+    hr =3D whpx_set_exception_exit_bitmap(0);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set exception exit bitmap, =
hr=3D%08lx",
hr);
+        ret =3D -EINVAL;
+        goto error;
+    }
+
     hr =3D whp_dispatch.WHvSetupPartition(whpx->partition);
     if (FAILED(hr)) {
         error_report("WHPX: Failed to setup partition, hr=3D%08lx", =
hr);
diff --git a/target/i386/whpx/whpx-internal.h
b/target/i386/whpx/whpx-internal.h
index 908ababf6d..2416ec7922 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -5,9 +5,39 @@
 #include <WinHvPlatform.h>
 #include <WinHvEmulation.h>
=20
+typedef enum WhpxBreakpointState {
+    WHPX_BP_CLEARED =3D 0,
+    WHPX_BP_SET_PENDING,
+    WHPX_BP_SET,
+    WHPX_BP_CLEAR_PENDING,
+} WhpxBreakpointState;
+
+struct whpx_breakpoint {
+    vaddr address;
+    WhpxBreakpointState state;
+    uint8_t original_instruction;
+};
+
+struct whpx_breakpoint_collection {
+    int allocated, used;
+    struct whpx_breakpoint data[0];
+};
+
+struct whpx_breakpoints {
+    int original_address_count;
+    vaddr *original_addresses;
+
+    struct whpx_breakpoint_collection *breakpoints;
+};
+
 struct whpx_state {
     uint64_t mem_quota;
     WHV_PARTITION_HANDLE partition;
+    uint64_t exception_exit_bitmap;
+    int32_t running_cpus;
+    struct whpx_breakpoints breakpoints;
+    bool step_pending;
+
     bool kernel_irqchip_allowed;
     bool kernel_irqchip_required;
     bool apic_in_platform;
--=20



