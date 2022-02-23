Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F24C1CD8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 21:08:17 +0100 (CET)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMxvs-0006EY-DF
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 15:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMxtW-0004VQ-LN
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 15:05:50 -0500
Received: from sysprogs.com ([45.79.83.98]:57206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMxtO-0003Gc-Gl
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 15:05:48 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id AEB3F11A357;
 Wed, 23 Feb 2022 20:05:30 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
	<qemu-devel@nongnu.org>
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
In-Reply-To: <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Wed, 23 Feb 2022 12:05:28 -0800
Message-ID: <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNIFN5a+FOAvRiv4eJOlcn7oK8VcgKLbPilqa1XUgA=
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
Cc: armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Thanks for getting back to me. Please see my comments below:

>Please use WhpxStepMode and likewise for WhpxBreakpointState.
No problem, I have updated the patch.

>(In the case of WhpxStepMode I would also consider simply a "bool =
exclusive" in whpx_cpu_run).
This is a leftover from prior experiments with stepping into the =
exception handlers=20
that involves reading the IDT/GDT, writing INT3 into the original =
handler, disabling INT1 interception
and instead intercepting INT3. It would be implemented via a third step =
mode. I ended up removing
it due to the unbelievable complexity of properly handling all corner =
cases, but I thought it would make
sense to keep it as an enum if someone else decides to add anything =
similar later.

>Please leave the empty line.
Oops, leftover from other experiments. Thanks for pointing out.

>Out of curiosity, does the guest see TF=3D1 if it single steps through =
a PUSHF (and then break horribly on POPF :))?
This is a very good point. It would indeed get pushed into the stack and =
popped back with POPF, raising another INT1.
I shouldn't be too horrible though: it would report another stop to gdb, =
and doing a step again would clear it.
A somewhat bigger issue would be that stepping through POPF or LAHF =
could reset the TF to 0, effectively ending the
single-stepping mode.

It could be addressed by emulating PUSHF/POPF, but there are a few =
corner cases (alignment checks, page faults on RSP,
flag translation for the virtual 8086 mode), that could make things more =
complicated. Also, PUSHF/POPF it not the only
special case. Stepping over IRET, into page fault handlers, and when the =
guest itself is running a debugger that wants
to do single-stepping would also require rather non-trivial workarounds.

I have added a detailed comment outlining the limitations of the current =
stepping logic and possible workarounds above
the definition of WhpxStepMode. The current implementation works like a =
charm for debugging real-world kernel modules
on x64 Ubuntu, and if some of these limitations end up breaking other =
debug scenarios, I would much more prefer
addressing specific narrow issues, than adding another layer of =
complexity proactively, if that's OK with you.=20

I have taken special care to make sure the new functionality won't cause =
any regressions when not debugging.
The intercepted exception mask is set to 0 when gdb is not connected, =
100% matching the behavior prior to the patch.

>Why separate the original addresses in a different array
This accommodates the case when different parts of QEMU would set =
multiple breakpoints at the same location, or when
a breakpoint removed on the QEMU level could not be removed from RAM =
(e.g. the page got swapped out).=20
Synchronizing the QEMU breakpoint list with the RAM breakpoint list =
currently has O(N^2) complexity. However, in many
cases (e.g. stopping to handle timers), the QEMU breakpoints won't =
change between the invocations, so we can just do a
quick O(N) comparison of the old breakpoint list vs. new breakpoint =
list, and avoid the O(N^2) part. You can find this logic
by searching for the 'update_pending' variable.

This could be avoided if cpu_breakpoint_insert() or =
gdb_breakpoint_insert() could invoke a WHPX-specific handler,
similar to what is currently done with kvm_insert_breakpoint(), or a =
generic callback via AccelOpsClass, that could just
mark the RAM breakpoint list dirty. But I didn't want to introduce =
unnecessary changes outside the WHPX module.

>(and why the different logic, with used/allocated for one array and an =
exact size for the other)
When we are rebuilding the memory breakpoint list, we don't know how =
many of the CPU breakpoints will refer to the same
memory addresses, or overlap with the breakpoints that could not be =
removed. So, we allocate for the worst case, and keep
a track of the actually created entries in the 'used' field.

Updated patch below. Let me know if you have any further concerns and I =
will be happy to address them.

This adds support for breakpoints and stepping when debugging =
WHPX-accelerated guests with gdb.
It enables reliable debugging of the Linux kernel in both single-CPU and =
SMP modes.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
---
 gdbstub.c                        |  10 +
 include/exec/gdbstub.h           |   8 +
 target/i386/whpx/whpx-all.c      | 763 ++++++++++++++++++++++++++++++-
 target/i386/whpx/whpx-internal.h |  29 ++
 4 files changed, 796 insertions(+), 14 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..d30cbfa478 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -373,6 +373,12 @@ typedef struct GDBState {
 } GDBState;
=20
 static GDBState gdbserver_state;
+static bool gdbserver_is_connected;
+
+bool gdb_is_connected(void)
+{
+    return gdbserver_is_connected;
+}
=20
 static void init_gdbserver_state(void)
 {
@@ -3410,6 +3416,10 @@ static void gdb_chr_event(void *opaque, =
QEMUChrEvent event)
         vm_stop(RUN_STATE_PAUSED);
         replay_gdb_attached();
         gdb_has_xml =3D false;
+        gdbserver_is_connected =3D true;
+        break;
+    case CHR_EVENT_CLOSED:
+        gdbserver_is_connected =3D false;
         break;
     default:
         break;
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..0ef54cdeb5 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -188,4 +188,12 @@ extern bool gdb_has_xml;
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
 extern const char *const xml_builtin[][2];
=20
+/**
+ * gdb_is_connected: Check whether gdb is currently connected.
+ * This function is used to determine if gdb is currently connected to =
qemu.
+ * It is used by the WHPX engine to enable interception of =
debug-related
+ * exceptions, when debugging with gdb, and pass them to the guest =
otherwise.
+ */
+bool gdb_is_connected(void);
+
 #endif
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 8a8b5d55d1..df47fb60b6 100644
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
+ *        or anything that could result in a page fault) will save the =
flags
+ *        to the stack, clear the TF flag, and let the guest execute =
the
+ *        handler. Normally, the guest will restore the original flags,
+ *        that will continue single-stepping.
+ *
+ *     3. Debuggers running on the guest may wish to set TF to do =
instruction
+ *        stepping. INT1 events generated by it would be intercepted by =
us,
+ *        as long as the gdb is connected to QEMU.
+ *
+ * In practice this means that:
+ *     1. Stepping through flags-modifying instructions may cause gdb =
to
+ *        continue or stop in unexpected places. This will be fully =
recoverable
+ *        and will not crash the target.
+ *
+ *     2. Stepping over an instruction that triggers an exception will =
step
+ *        over the exception handler, not into it.
+ *
+ *     3. Debugging the guest via gdb, while running debugger on the =
guest
+ *        at the same time may lead to unexpected effects. Detaching =
gdb from
+ *        QEMU will prevent any further interference with the =
guest-level
+ *        debuggers.
+ *
+ * The limitations can be addressed as shown below:
+ *     1. PUSHF/SAHF/POPF/LAHF/IRET instructions can be emulated =
instead of
+ *        stepping through them. The exact semantics of the =
instructions is
+ *        defined in the "Combined Volume Set of Intel 64 and IA-32=20
+ *        Architectures Software Developer's Manuals", however it =
involves a
+ *        fair amount of corner cases due to compatibility with real =
mode,
+ *        virtual 8086 mode, and differences between 64-bit and 32-bit =
modes.
+ *
+ *     2. We could step into the guest's exception handlers using the =
following
+ *        sequence:
+ *          a. Temporarily enable catching of all exception types via
+ *             whpx_set_exception_exit_bitmap().
+ *          b. Once an exception is intercepted, read the IDT/GDT and =
locate
+ *             the original handler.
+ *          c. Patch the original handler, injecting an INT3 at the =
beginning.
+ *          d. Update the exception exit bitmap to only catch the
+ *             WHvX64ExceptionTypeBreakpointTrap exception.
+ *          e. Let the affected CPU run in the exclusive mode.
+ *          f. Restore the original handler and the exception exit =
bitmap.
+ *        Note that handling all corner cases related to IDT/GDT is =
harder=20
+ *        than it may seem. See x86_cpu_get_phys_page_attrs_debug() for =
a=20
+ *        rough idea.
+ *
+ *     3. In order to properly support guest-level debugging in =
parallel with
+ *        the QEMU-level debugging, we would need to be able to pass =
some INT1
+ *        events to the guest. This could be done via the following =
methods:
+ *          a. Using the WHvRegisterPendingEvent register. As of =
Windows 21H1,
+ *             it seems to only work for interrupts and not software
+ *             exceptions.
+ *          b. Locating and patching the original handler by parsing =
IDT/GDT.
+ *             This involves relatively complex logic outlined in the =
previous
+ *             paragraph.
+ *          c. Emulating the exception invocation (i.e. manually =
updating RIP,
+ *             RFLAGS, and pushing the old values to stack). This is =
even more
+ *             complicated than the previous option, since it involves =
checking
+ *             CPL, gate attributes, and doing various adjustments =
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
@@ -793,6 +875,515 @@ static int whpx_handle_portio(CPUState *cpu,
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
set the
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
instruction */
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
+                error_report("WHPX: Failed to clear pending debug =
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
+static struct whpx_breakpoint *whpx_lookup_breakpoint_by_addr(uint64_t =
address)
+{
+    struct whpx_state *whpx =3D &whpx_global;
+    int i;
+
+    if (whpx->breakpoints.breakpoints) {
+        for (i =3D 0; i < whpx->breakpoints.breakpoints->used; i++) {
+            if (address =3D=3D =
whpx->breakpoints.breakpoints->data[i].address) {
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
+ *    physical breakpoint instruction when the last QEMU breakpoint is =
gone.
+ *
+ * 2. Writing arbitrary virtual memory may fail if it's not mapped to a =
valid
+ *    physical location. Hence, physically adding/removing a breakpoint =
can
+ *    theoretically fail at any time. We need to keep track of it.
+ *
+ * The function below rebuilds a list of low-level breakpoints (one per
+ * address, tracking the original instruction and any errors) from the =
list of
+ * high-level breakpoints (set via cpu_breakpoint_insert()).
+ *
+ * In order to optimize performance, this function stores the list of
+ * high-level breakpoints (a.k.a. CPU breakpoints) used to compute the
+ * low-level ones, so that it won't be re-invoked until these =
breakpoints
+ * change.
+ *
+ * Note that this function decides which breakpoints should be inserted =
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
+        g_renew(vaddr, breakpoints->original_addresses, =
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
WHPX_BP_CLEARED) {
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
+             * If this ever becomes a concern, it can be optimized by =
storing
+             * high-level breakpoint objects in a tree or hash map.
+             */
+
+            if (new_breakpoints->data[i].address =3D=3D bp->pc) {
+                /* There was already a breakpoint at this address. */
+                if (new_breakpoints->data[i].state =3D=3D =
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
+         * Free the previous breakpoint list. This can be optimized by =
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
+    if (gdb_is_connected()) {
+        /*
+         * GDB is connected. Intercept breakpoint/step events.
+         * Since we are using INT1 rather than INT3 for breakpoints,
+         * we don't need to intercept =
WHvX64ExceptionTypeBreakpointTrap.
+         */
+
+        exception_mask =3D 1UL << WHvX64ExceptionTypeDebugTrapOrFault;
+    } else {
+        /* GDB is not connected. Let the guest handle all exceptions. =
*/
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
+    whpx_apply_breakpoints(whpx_global.breakpoints.breakpoints, cpu, =
false);
+    return 0;
+}
+
+/* Returns the address of the next instruction that is about to be =
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
+         * of QEMU, nor this port by calling =
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
@@ -1004,17 +1595,75 @@ static int whpx_vcpu_run(CPUState *cpu)
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
+             * We are trying to run the instruction overwritten by an =
active
+             * breakpoint. We will temporarily disable the breakpoint, =
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
@@ -1022,10 +1671,16 @@ static int whpx_vcpu_run(CPUState *cpu)
             cpu->vcpu_dirty =3D false;
         }
=20
-        whpx_vcpu_pre_run(cpu);
+        if (exclusive_step_mode =3D=3D WHPX_STEP_NONE) {
+            whpx_vcpu_pre_run(cpu);
=20
-        if (qatomic_read(&cpu->exit_request)) {
-            whpx_vcpu_kick(cpu);
+            if (qatomic_read(&cpu->exit_request)) {
+                whpx_vcpu_kick(cpu);
+            }
+        }
+
+        if (exclusive_step_mode !=3D WHPX_STEP_NONE || =
cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu, true, NULL);
         }
=20
         hr =3D whp_dispatch.WHvRunVirtualProcessor(
@@ -1039,6 +1694,12 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
         }
=20
+        if (exclusive_step_mode !=3D WHPX_STEP_NONE || =
cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu,
+                false,
+                &vcpu->exit_ctx.VpContext.Rflags);
+        }
+
         whpx_vcpu_post_run(cpu);
=20
         switch (vcpu->exit_ctx.ExitReason) {
@@ -1062,6 +1723,10 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
=20
         case WHvRunVpExitReasonX64Halt:
+            /*
+             * WARNING: as of build 19043.1526 (21H1), this exit reason =
is no
+             * longer used.
+             */
             ret =3D whpx_handle_halt(cpu);
             break;
=20
@@ -1160,10 +1825,19 @@ static int whpx_vcpu_run(CPUState *cpu)
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
@@ -1267,11 +1941,36 @@ static int whpx_vcpu_run(CPUState *cpu)
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
@@ -1284,10 +1983,32 @@ static int whpx_vcpu_run(CPUState *cpu)
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
@@ -1846,6 +2567,7 @@ static int whpx_accel_init(MachineState *ms)
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
     prop.ExtendedVmExits.X64MsrExit =3D 1;
     prop.ExtendedVmExits.X64CpuidExit =3D 1;
+    prop.ExtendedVmExits.ExceptionExit =3D 1;
     if (whpx_apic_in_platform()) {
         prop.ExtendedVmExits.X64ApicInitSipiExitTrap =3D 1;
     }
@@ -1874,6 +2596,19 @@ static int whpx_accel_init(MachineState *ms)
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
hr=3D%08lx", hr);
+        ret =3D -EINVAL;
+        goto error;
+    }
+
     hr =3D whp_dispatch.WHvSetupPartition(whpx->partition);
     if (FAILED(hr)) {
         error_report("WHPX: Failed to setup partition, hr=3D%08lx", =
hr);
diff --git a/target/i386/whpx/whpx-internal.h =
b/target/i386/whpx/whpx-internal.h
index 908ababf6d..1d505d37fe 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -5,9 +5,38 @@
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
+
     bool kernel_irqchip_allowed;
     bool kernel_irqchip_required;
     bool apic_in_platform;
--=20
2.29.2.windows.3




