Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE05064D2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:47:10 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghdl-0004C9-Hs
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmH-0001FQ-19
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmC-0004Us-Im
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u3so20942135wrg.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=27xdJaPz4NvX98ZpHETWjtvAmSpQNFYyyaWuEI4zDqg=;
 b=WJbXhPIwBpe+nxvo26fId0oZ3ms0UtS9QGiHnjA7k8UhbgQ0Ox2I1mFtVxzkAw2rR6
 emg5AVKj5o+/bNTyz3Q97CNn+Av5Q7Gpf31fo60EtgvcR/wzUyAHPR1KVSFofb1K9c5a
 MkeGQtG5aR4It16Dd65yTxyu/7rjKD4oJ5HQqZs0N9kTWhvEUNQjD6P63u4r6dDyFZjy
 CGfW4u5alaFbOhzMC+v5hlIcMKHGca0Xzo74cDEJcYtTXJqe42AraJ8QQQI1YmpYFxAa
 JhwJLzZDO0meBZhau9Ceaj0gTdcdadCz5Yt8QkNQFPj3fVcYz/IOz/18wWj6/il+j0+T
 as9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=27xdJaPz4NvX98ZpHETWjtvAmSpQNFYyyaWuEI4zDqg=;
 b=7Tn5YcPOXD0x22cp7kfKhIdYOPKupfL2+GwGVGCkYO2zmgTvpgT4pcIW40JvYfjROr
 M2lBwV1cUPfS80ude9A3wC0tvVEdlfAyg8C4eZPmm9bfVM3ArelOvJt2tvEGcHadZ3hF
 BHmQaZKYoqIYYMFrVHQd8ddJ5y7DS/0jimyDyG2NwYy9VN4LKvBU8WKYZE2NZuvYJ56L
 2dKbv0/COZ5u7lRzKZ1JVym8W948nVM4SZa8o9B71UFkU+tN6fSdEFShg1DTfLMD7mNv
 l8mv1AKSFPjYzY0myMzIqPSC+IGRbtVtoIB95cRzfuspNw7nhDPgdkXv3Fzs+cQVEwwK
 eLng==
X-Gm-Message-State: AOAM530NyuIcm6bAhckgPuE9QrDo1sN4VwnAlfjMAh7lBYi43ykveekf
 BnKhj2n0WByfMvHEPYBooiUaZShOSym/xw==
X-Google-Smtp-Source: ABdhPJxZd59pKqoFBGZXKnH4eGh1Kd2pEP77rpei8iUDXejuFrck/z4ytaT6ZAzN0UI90VbiroH2WA==
X-Received: by 2002:a5d:58ea:0:b0:20a:9874:641b with SMTP id
 f10-20020a5d58ea000000b0020a9874641bmr5447463wrd.47.1650347506778; 
 Mon, 18 Apr 2022 22:51:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/53] whpx: Added support for breakpoints and stepping
Date: Tue, 19 Apr 2022 07:50:55 +0200
Message-Id: <20220419055109.142788-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ivan Shcherbakov <ivan@sysprogs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Shcherbakov <ivan@sysprogs.com>

Below is the updated version of the patch adding debugging support to WHPX.
It incorporates feedback from Alex Bennée and Peter Maydell regarding not
changing the emulation logic depending on the gdb connection status.

Instead of checking for an active gdb connection to determine whether QEMU
should intercept the INT1 exceptions, it now checks whether any breakpoints
have been set, or whether gdb has explicitly requested one or more CPUs to
do single-stepping. Having none of these condition present now has the same
effect as not using gdb at all.

Message-Id: <0e7f01d82e9e$00e9c360$02bd4a20$@sysprogs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 2c804d5066..a3ff8702ce 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -518,7 +518,15 @@ static int gdb_continue_partial(char *newstates)
     int flag = 0;
 
     if (!runstate_needs_reset()) {
-        if (vm_prepare_start()) {
+        bool step_requested = false;
+        CPU_FOREACH(cpu) {
+            if (newstates[cpu->cpu_index] == 's') {
+                step_requested = true;
+                break;
+            }
+        }
+
+        if (vm_prepare_start(step_requested)) {
             return 0;
         }
 
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 6013c9444c..a0572ea87a 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -38,6 +38,7 @@ struct AccelOpsClass {
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
     void (*synchronize_pre_loadvm)(CPUState *cpu);
+    void (*synchronize_pre_resume)(bool step_pending);
 
     void (*handle_interrupt)(CPUState *cpu, int mask);
 
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index c3f445dd26..f3ed52548e 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -34,7 +34,13 @@ static inline bool shutdown_caused_by_guest(ShutdownCause cause)
 }
 
 void vm_start(void);
-int vm_prepare_start(void);
+
+/**
+ * vm_prepare_start: Prepare for starting/resuming the VM
+ *
+ * @step_pending: whether any of the CPUs is about to be single-stepped by gdb
+ */
+int vm_prepare_start(bool step_pending);
 int vm_stop(RunState state);
 int vm_stop_force_state(RunState state);
 int vm_shutdown(void);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 668bef9b4d..23b30484b2 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -672,7 +672,7 @@ int vm_stop(RunState state)
  * Returns -1 if the vCPUs are not to be restarted (e.g. if they are already
  * running or in case of an error condition), 0 otherwise.
  */
-int vm_prepare_start(void)
+int vm_prepare_start(bool step_pending)
 {
     RunState requested;
 
@@ -692,6 +692,14 @@ int vm_prepare_start(void)
         return -1;
     }
 
+    /*
+     * WHPX accelerator needs to know whether we are going to step
+     * any CPUs, before starting the first one.
+     */
+    if (cpus_accel->synchronize_pre_resume) {
+        cpus_accel->synchronize_pre_resume(step_pending);
+    }
+
     /* We are sending this now, but the CPUs will be resumed shortly later */
     qapi_event_send_resume();
 
@@ -703,7 +711,7 @@ int vm_prepare_start(void)
 
 void vm_start(void)
 {
-    if (!vm_prepare_start()) {
+    if (!vm_prepare_start(false)) {
         resume_all_vcpus();
     }
 }
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index dd2a9f7657..e8dc4b3a47 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -100,6 +100,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+    ops->synchronize_pre_resume = whpx_cpu_synchronize_pre_resume;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
diff --git a/target/i386/whpx/whpx-accel-ops.h b/target/i386/whpx/whpx-accel-ops.h
index 2dee6d61ea..b5102dd1ee 100644
--- a/target/i386/whpx/whpx-accel-ops.h
+++ b/target/i386/whpx/whpx-accel-ops.h
@@ -21,6 +21,7 @@ void whpx_cpu_synchronize_state(CPUState *cpu);
 void whpx_cpu_synchronize_post_reset(CPUState *cpu);
 void whpx_cpu_synchronize_post_init(CPUState *cpu);
 void whpx_cpu_synchronize_pre_loadvm(CPUState *cpu);
+void whpx_cpu_synchronize_pre_resume(bool step_pending);
 
 /* state subset only touched by the VCPU itself during runtime */
 #define WHPX_SET_RUNTIME_STATE   1
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 5560a22ea5..b625ad5bbb 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -12,6 +12,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/ioport.h"
+#include "exec/gdbstub.h"
 #include "qemu/accel.h"
 #include "sysemu/whpx.h"
 #include "sysemu/cpus.h"
@@ -147,6 +148,87 @@ struct whpx_register_set {
     WHV_REGISTER_VALUE values[RTL_NUMBER_OF(whpx_register_names)];
 };
 
+/*
+ * The current implementation of instruction stepping sets the TF flag
+ * in RFLAGS, causing the CPU to raise an INT1 after each instruction.
+ * This corresponds to the WHvX64ExceptionTypeDebugTrapOrFault exception.
+ *
+ * This approach has a few limitations:
+ *     1. Stepping over a PUSHF/SAHF instruction will save the TF flag
+ *        along with the other flags, possibly restoring it later. It would
+ *        result in another INT1 when the flags are restored, triggering
+ *        a stop in gdb that could be cleared by doing another step.
+ *
+ *        Stepping over a POPF/LAHF instruction will let it overwrite the
+ *        TF flags, ending the stepping mode.
+ *
+ *     2. Stepping over an instruction raising an exception (e.g. INT, DIV,
+ *        or anything that could result in a page fault) will save the flags
+ *        to the stack, clear the TF flag, and let the guest execute the
+ *        handler. Normally, the guest will restore the original flags,
+ *        that will continue single-stepping.
+ *
+ *     3. Debuggers running on the guest may wish to set TF to do instruction
+ *        stepping. INT1 events generated by it would be intercepted by us,
+ *        as long as the gdb is connected to QEMU.
+ *
+ * In practice this means that:
+ *     1. Stepping through flags-modifying instructions may cause gdb to
+ *        continue or stop in unexpected places. This will be fully recoverable
+ *        and will not crash the target.
+ *
+ *     2. Stepping over an instruction that triggers an exception will step
+ *        over the exception handler, not into it.
+ *
+ *     3. Debugging the guest via gdb, while running debugger on the guest
+ *        at the same time may lead to unexpected effects. Removing all
+ *        breakpoints set via QEMU will prevent any further interference
+ *        with the guest-level debuggers.
+ *
+ * The limitations can be addressed as shown below:
+ *     1. PUSHF/SAHF/POPF/LAHF/IRET instructions can be emulated instead of
+ *        stepping through them. The exact semantics of the instructions is
+ *        defined in the "Combined Volume Set of Intel 64 and IA-32
+ *        Architectures Software Developer's Manuals", however it involves a
+ *        fair amount of corner cases due to compatibility with real mode,
+ *        virtual 8086 mode, and differences between 64-bit and 32-bit modes.
+ *
+ *     2. We could step into the guest's exception handlers using the following
+ *        sequence:
+ *          a. Temporarily enable catching of all exception types via
+ *             whpx_set_exception_exit_bitmap().
+ *          b. Once an exception is intercepted, read the IDT/GDT and locate
+ *             the original handler.
+ *          c. Patch the original handler, injecting an INT3 at the beginning.
+ *          d. Update the exception exit bitmap to only catch the
+ *             WHvX64ExceptionTypeBreakpointTrap exception.
+ *          e. Let the affected CPU run in the exclusive mode.
+ *          f. Restore the original handler and the exception exit bitmap.
+ *        Note that handling all corner cases related to IDT/GDT is harder
+ *        than it may seem. See x86_cpu_get_phys_page_attrs_debug() for a
+ *        rough idea.
+ *
+ *     3. In order to properly support guest-level debugging in parallel with
+ *        the QEMU-level debugging, we would need to be able to pass some INT1
+ *        events to the guest. This could be done via the following methods:
+ *          a. Using the WHvRegisterPendingEvent register. As of Windows 21H1,
+ *             it seems to only work for interrupts and not software
+ *             exceptions.
+ *          b. Locating and patching the original handler by parsing IDT/GDT.
+ *             This involves relatively complex logic outlined in the previous
+ *             paragraph.
+ *          c. Emulating the exception invocation (i.e. manually updating RIP,
+ *             RFLAGS, and pushing the old values to stack). This is even more
+ *             complicated than the previous option, since it involves checking
+ *             CPL, gate attributes, and doing various adjustments depending
+ *             on the current CPU mode, whether the CPL is changing, etc.
+ */
+typedef enum WhpxStepMode {
+    WHPX_STEP_NONE = 0,
+    /* Halt other VCPUs */
+    WHPX_STEP_EXCLUSIVE,
+} WhpxStepMode;
+
 struct whpx_vcpu {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
@@ -785,6 +867,517 @@ static int whpx_handle_portio(CPUState *cpu,
     return 0;
 }
 
+/*
+ * Controls whether we should intercept various exceptions on the guest,
+ * namely breakpoint/single-step events.
+ *
+ * The 'exceptions' argument accepts a bitmask, e.g:
+ * (1 << WHvX64ExceptionTypeDebugTrapOrFault) | (...)
+ */
+static HRESULT whpx_set_exception_exit_bitmap(UINT64 exceptions)
+{
+    struct whpx_state *whpx = &whpx_global;
+    WHV_PARTITION_PROPERTY prop = { 0, };
+    HRESULT hr;
+
+    if (exceptions == whpx->exception_exit_bitmap) {
+        return S_OK;
+    }
+
+    prop.ExceptionExitBitmap = exceptions;
+
+    hr = whp_dispatch.WHvSetPartitionProperty(
+        whpx->partition,
+        WHvPartitionPropertyCodeExceptionExitBitmap,
+        &prop,
+        sizeof(WHV_PARTITION_PROPERTY));
+
+    if (SUCCEEDED(hr)) {
+        whpx->exception_exit_bitmap = exceptions;
+    }
+
+    return hr;
+}
+
+
+/*
+ * This function is called before/after stepping over a single instruction.
+ * It will update the CPU registers to arm/disarm the instruction stepping
+ * accordingly.
+ */
+static HRESULT whpx_vcpu_configure_single_stepping(CPUState *cpu,
+    bool set,
+    uint64_t *exit_context_rflags)
+{
+    WHV_REGISTER_NAME reg_name;
+    WHV_REGISTER_VALUE reg_value;
+    HRESULT hr;
+    struct whpx_state *whpx = &whpx_global;
+
+    /*
+     * If we are trying to step over a single instruction, we need to set the
+     * TF bit in rflags. Otherwise, clear it.
+     */
+    reg_name = WHvX64RegisterRflags;
+    hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
+        whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to get rflags, hr=%08lx", hr);
+        return hr;
+    }
+
+    if (exit_context_rflags) {
+        assert(*exit_context_rflags == reg_value.Reg64);
+    }
+
+    if (set) {
+        /* Raise WHvX64ExceptionTypeDebugTrapOrFault after each instruction */
+        reg_value.Reg64 |= TF_MASK;
+    } else {
+        reg_value.Reg64 &= ~TF_MASK;
+    }
+
+    if (exit_context_rflags) {
+        *exit_context_rflags = reg_value.Reg64;
+    }
+
+    hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+        whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set rflags,"
+            " hr=%08lx",
+            hr);
+        return hr;
+    }
+
+    reg_name = WHvRegisterInterruptState;
+    reg_value.Reg64 = 0;
+
+    /* Suspend delivery of hardware interrupts during single-stepping. */
+    reg_value.InterruptState.InterruptShadow = set != 0;
+
+    hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+    whpx->partition,
+        cpu->cpu_index,
+        &reg_name,
+        1,
+        &reg_value);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set InterruptState,"
+            " hr=%08lx",
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
+        reg_name = WHvX64RegisterPendingDebugException;
+        hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
+        whpx->partition,
+            cpu->cpu_index,
+            &reg_name,
+            1,
+            &reg_value);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to get pending debug exceptions,"
+                         "hr=%08lx", hr);
+            return hr;
+        }
+
+        if (reg_value.PendingDebugException.SingleStep) {
+            reg_value.PendingDebugException.SingleStep = 0;
+
+            hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+                whpx->partition,
+                cpu->cpu_index,
+                &reg_name,
+                1,
+                &reg_value);
+
+            if (FAILED(hr)) {
+                error_report("WHPX: Failed to clear pending debug exceptions,"
+                             "hr=%08lx", hr);
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
+static struct whpx_breakpoint *whpx_lookup_breakpoint_by_addr(uint64_t address)
+{
+    struct whpx_state *whpx = &whpx_global;
+    int i;
+
+    if (whpx->breakpoints.breakpoints) {
+        for (i = 0; i < whpx->breakpoints.breakpoints->used; i++) {
+            if (address == whpx->breakpoints.breakpoints->data[i].address) {
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
+static const uint8_t whpx_breakpoint_instruction = 0xF1;
+
+/*
+ * The WHPX QEMU backend implements breakpoints by writing the INT1
+ * instruction into memory (ignoring the DRx registers). This raises a few
+ * issues that need to be carefully handled:
+ *
+ * 1. Although unlikely, other parts of QEMU may set multiple breakpoints
+ *    at the same location, and later remove them in arbitrary order.
+ *    This should not cause memory corruption, and should only remove the
+ *    physical breakpoint instruction when the last QEMU breakpoint is gone.
+ *
+ * 2. Writing arbitrary virtual memory may fail if it's not mapped to a valid
+ *    physical location. Hence, physically adding/removing a breakpoint can
+ *    theoretically fail at any time. We need to keep track of it.
+ *
+ * The function below rebuilds a list of low-level breakpoints (one per
+ * address, tracking the original instruction and any errors) from the list of
+ * high-level breakpoints (set via cpu_breakpoint_insert()).
+ *
+ * In order to optimize performance, this function stores the list of
+ * high-level breakpoints (a.k.a. CPU breakpoints) used to compute the
+ * low-level ones, so that it won't be re-invoked until these breakpoints
+ * change.
+ *
+ * Note that this function decides which breakpoints should be inserted into,
+ * memory, but doesn't actually do it. The memory accessing is done in
+ * whpx_apply_breakpoints().
+ */
+static void whpx_translate_cpu_breakpoints(
+    struct whpx_breakpoints *breakpoints,
+    CPUState *cpu,
+    int cpu_breakpoint_count)
+{
+    CPUBreakpoint *bp;
+    int cpu_bp_index = 0;
+
+    breakpoints->original_addresses =
+        g_renew(vaddr, breakpoints->original_addresses, cpu_breakpoint_count);
+
+    breakpoints->original_address_count = cpu_breakpoint_count;
+
+    int max_breakpoints = cpu_breakpoint_count +
+        (breakpoints->breakpoints ? breakpoints->breakpoints->used : 0);
+
+    struct whpx_breakpoint_collection *new_breakpoints =
+        (struct whpx_breakpoint_collection *)g_malloc0(
+        sizeof(struct whpx_breakpoint_collection) +
+            max_breakpoints * sizeof(struct whpx_breakpoint));
+
+    new_breakpoints->allocated = max_breakpoints;
+    new_breakpoints->used = 0;
+
+    /*
+     * 1. Preserve all old breakpoints that could not be automatically
+     * cleared when the CPU got stopped.
+     */
+    if (breakpoints->breakpoints) {
+        int i;
+        for (i = 0; i < breakpoints->breakpoints->used; i++) {
+            if (breakpoints->breakpoints->data[i].state != WHPX_BP_CLEARED) {
+                new_breakpoints->data[new_breakpoints->used++] =
+                    breakpoints->breakpoints->data[i];
+            }
+        }
+    }
+
+    /* 2. Map all CPU breakpoints to WHPX breakpoints */
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        int i;
+        bool found = false;
+
+        /* This will be used to detect changed CPU breakpoints later. */
+        breakpoints->original_addresses[cpu_bp_index++] = bp->pc;
+
+        for (i = 0; i < new_breakpoints->used; i++) {
+            /*
+             * WARNING: This loop has O(N^2) complexity, where N is the
+             * number of breakpoints. It should not be a bottleneck in
+             * real-world scenarios, since it only needs to run once after
+             * the breakpoints have been modified.
+             * If this ever becomes a concern, it can be optimized by storing
+             * high-level breakpoint objects in a tree or hash map.
+             */
+
+            if (new_breakpoints->data[i].address == bp->pc) {
+                /* There was already a breakpoint at this address. */
+                if (new_breakpoints->data[i].state == WHPX_BP_CLEAR_PENDING) {
+                    new_breakpoints->data[i].state = WHPX_BP_SET;
+                } else if (new_breakpoints->data[i].state == WHPX_BP_SET) {
+                    new_breakpoints->data[i].state = WHPX_BP_SET_PENDING;
+                }
+
+                found = true;
+                break;
+            }
+        }
+
+        if (!found && new_breakpoints->used < new_breakpoints->allocated) {
+            /* No WHPX breakpoint at this address. Create one. */
+            new_breakpoints->data[new_breakpoints->used].address = bp->pc;
+            new_breakpoints->data[new_breakpoints->used].state =
+                WHPX_BP_SET_PENDING;
+            new_breakpoints->used++;
+        }
+    }
+
+    if (breakpoints->breakpoints) {
+        /*
+         * Free the previous breakpoint list. This can be optimized by keeping
+         * it as shadow buffer for the next computation instead of freeing
+         * it immediately.
+         */
+        g_free(breakpoints->breakpoints);
+    }
+
+    breakpoints->breakpoints = new_breakpoints;
+}
+
+/*
+ * Physically inserts/removes the breakpoints by reading and writing the
+ * physical memory, keeping a track of the failed attempts.
+ *
+ * Passing resuming=true  will try to set all previously unset breakpoints.
+ * Passing resuming=false will remove all inserted ones.
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
+    for (i = 0; i < breakpoints->used; i++) {
+        /* Decide what to do right now based on the last known state. */
+        WhpxBreakpointState state = breakpoints->data[i].state;
+        switch (state) {
+        case WHPX_BP_CLEARED:
+            if (resuming) {
+                state = WHPX_BP_SET_PENDING;
+            }
+            break;
+        case WHPX_BP_SET_PENDING:
+            if (!resuming) {
+                state = WHPX_BP_CLEARED;
+            }
+            break;
+        case WHPX_BP_SET:
+            if (!resuming) {
+                state = WHPX_BP_CLEAR_PENDING;
+            }
+            break;
+        case WHPX_BP_CLEAR_PENDING:
+            if (resuming) {
+                state = WHPX_BP_SET;
+            }
+            break;
+        }
+
+        if (state == WHPX_BP_SET_PENDING) {
+            /* Remember the original instruction. */
+            rc = cpu_memory_rw_debug(cpu,
+                breakpoints->data[i].address,
+                &breakpoints->data[i].original_instruction,
+                1,
+                false);
+
+            if (!rc) {
+                /* Write the breakpoint instruction. */
+                rc = cpu_memory_rw_debug(cpu,
+                    breakpoints->data[i].address,
+                    (void *)&whpx_breakpoint_instruction,
+                    1,
+                    true);
+            }
+
+            if (!rc) {
+                state = WHPX_BP_SET;
+            }
+
+        }
+
+        if (state == WHPX_BP_CLEAR_PENDING) {
+            /* Restore the original instruction. */
+            rc = cpu_memory_rw_debug(cpu,
+                breakpoints->data[i].address,
+                &breakpoints->data[i].original_instruction,
+                1,
+                true);
+
+            if (!rc) {
+                state = WHPX_BP_CLEARED;
+            }
+        }
+
+        breakpoints->data[i].state = state;
+    }
+}
+
+/*
+ * This function is called when the a VCPU is about to start and no other
+ * VCPUs have been started so far. Since the VCPU start order could be
+ * arbitrary, it doesn't have to be VCPU#0.
+ *
+ * It is used to commit the breakpoints into memory, and configure WHPX
+ * to intercept debug exceptions.
+ *
+ * Note that whpx_set_exception_exit_bitmap() cannot be called if one or
+ * more VCPUs are already running, so this is the best place to do it.
+ */
+static int whpx_first_vcpu_starting(CPUState *cpu)
+{
+    struct whpx_state *whpx = &whpx_global;
+    HRESULT hr;
+
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (!QTAILQ_EMPTY(&cpu->breakpoints) ||
+            (whpx->breakpoints.breakpoints &&
+             whpx->breakpoints.breakpoints->used)) {
+        CPUBreakpoint *bp;
+        int i = 0;
+        bool update_pending = false;
+
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            if (i >= whpx->breakpoints.original_address_count ||
+                bp->pc != whpx->breakpoints.original_addresses[i]) {
+                update_pending = true;
+            }
+
+            i++;
+        }
+
+        if (i != whpx->breakpoints.original_address_count) {
+            update_pending = true;
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
+        whpx_apply_breakpoints(whpx->breakpoints.breakpoints, cpu, true);
+    }
+
+    uint64_t exception_mask;
+    if (whpx->step_pending ||
+        (whpx->breakpoints.breakpoints &&
+         whpx->breakpoints.breakpoints->used)) {
+        /*
+         * We are either attempting to single-step one or more CPUs, or
+         * have one or more breakpoints enabled. Both require intercepting
+         * the WHvX64ExceptionTypeBreakpointTrap exception.
+         */
+
+        exception_mask = 1UL << WHvX64ExceptionTypeDebugTrapOrFault;
+    } else {
+        /* Let the guest handle all exceptions. */
+        exception_mask = 0;
+    }
+
+    hr = whpx_set_exception_exit_bitmap(exception_mask);
+    if (!SUCCEEDED(hr)) {
+        error_report("WHPX: Failed to update exception exit mask,"
+                     "hr=%08lx.", hr);
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
+    whpx_apply_breakpoints(whpx_global.breakpoints.breakpoints, cpu, false);
+    return 0;
+}
+
+/* Returns the address of the next instruction that is about to be executed. */
+static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
+{
+    if (cpu->vcpu_dirty) {
+        /* The CPU registers have been modified by other parts of QEMU. */
+        CPUArchState *env = (CPUArchState *)(cpu->env_ptr);
+        return env->eip;
+    } else if (exit_context_valid) {
+        /*
+         * The CPU registers have not been modified by neither other parts
+         * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
+         * This is the most common case.
+         */
+        struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+        return vcpu->exit_ctx.VpContext.Rip;
+    } else {
+        /*
+         * The CPU registers have been modified by a call to
+         * WHvSetVirtualProcessorRegisters() and must be re-queried from
+         * the target.
+         */
+        WHV_REGISTER_VALUE reg_value;
+        WHV_REGISTER_NAME reg_name = WHvX64RegisterRip;
+        HRESULT hr;
+        struct whpx_state *whpx = &whpx_global;
+
+        hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
+            whpx->partition,
+            cpu->cpu_index,
+            &reg_name,
+            1,
+            &reg_value);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to get PC, hr=%08lx", hr);
+            return 0;
+        }
+
+        return reg_value.Reg64;
+    }
+}
+
 static int whpx_handle_halt(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
@@ -996,17 +1589,75 @@ static int whpx_vcpu_run(CPUState *cpu)
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct whpx_breakpoint *stepped_over_bp = NULL;
+    WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
 
-    whpx_vcpu_process_async_events(cpu);
-    if (cpu->halted && !whpx_apic_in_platform()) {
-        cpu->exception_index = EXCP_HLT;
-        qatomic_set(&cpu->exit_request, false);
-        return 0;
+    g_assert(qemu_mutex_iothread_locked());
+
+    if (whpx->running_cpus++ == 0) {
+        /* Insert breakpoints into memory, update exception exit bitmap. */
+        ret = whpx_first_vcpu_starting(cpu);
+        if (ret != 0) {
+            return ret;
+        }
+    }
+
+    if (whpx->breakpoints.breakpoints &&
+        whpx->breakpoints.breakpoints->used > 0)
+    {
+        uint64_t pc = whpx_vcpu_get_pc(cpu, true);
+        stepped_over_bp = whpx_lookup_breakpoint_by_addr(pc);
+        if (stepped_over_bp && stepped_over_bp->state != WHPX_BP_SET) {
+            stepped_over_bp = NULL;
+        }
+
+        if (stepped_over_bp) {
+            /*
+             * We are trying to run the instruction overwritten by an active
+             * breakpoint. We will temporarily disable the breakpoint, suspend
+             * other CPUs, and step over the instruction.
+             */
+            exclusive_step_mode = WHPX_STEP_EXCLUSIVE;
+        }
+    }
+
+    if (exclusive_step_mode == WHPX_STEP_NONE) {
+        whpx_vcpu_process_async_events(cpu);
+        if (cpu->halted && !whpx_apic_in_platform()) {
+            cpu->exception_index = EXCP_HLT;
+            qatomic_set(&cpu->exit_request, false);
+            return 0;
+        }
     }
 
     qemu_mutex_unlock_iothread();
-    cpu_exec_start(cpu);
+
+    if (exclusive_step_mode != WHPX_STEP_NONE) {
+        start_exclusive();
+        g_assert(cpu == current_cpu);
+        g_assert(!cpu->running);
+        cpu->running = true;
+
+        hr = whpx_set_exception_exit_bitmap(
+            1UL << WHvX64ExceptionTypeDebugTrapOrFault);
+        if (!SUCCEEDED(hr)) {
+            error_report("WHPX: Failed to update exception exit mask, "
+                         "hr=%08lx.", hr);
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
 
     do {
         if (cpu->vcpu_dirty) {
@@ -1014,10 +1665,16 @@ static int whpx_vcpu_run(CPUState *cpu)
             cpu->vcpu_dirty = false;
         }
 
-        whpx_vcpu_pre_run(cpu);
+        if (exclusive_step_mode == WHPX_STEP_NONE) {
+            whpx_vcpu_pre_run(cpu);
 
-        if (qatomic_read(&cpu->exit_request)) {
-            whpx_vcpu_kick(cpu);
+            if (qatomic_read(&cpu->exit_request)) {
+                whpx_vcpu_kick(cpu);
+            }
+        }
+
+        if (exclusive_step_mode != WHPX_STEP_NONE || cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu, true, NULL);
         }
 
         hr = whp_dispatch.WHvRunVirtualProcessor(
@@ -1031,6 +1688,12 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
         }
 
+        if (exclusive_step_mode != WHPX_STEP_NONE || cpu->singlestep_enabled) {
+            whpx_vcpu_configure_single_stepping(cpu,
+                false,
+                &vcpu->exit_ctx.VpContext.Rflags);
+        }
+
         whpx_vcpu_post_run(cpu);
 
         switch (vcpu->exit_ctx.ExitReason) {
@@ -1054,6 +1717,10 @@ static int whpx_vcpu_run(CPUState *cpu)
             break;
 
         case WHvRunVpExitReasonX64Halt:
+            /*
+             * WARNING: as of build 19043.1526 (21H1), this exit reason is no
+             * longer used.
+             */
             ret = whpx_handle_halt(cpu);
             break;
 
@@ -1152,10 +1819,19 @@ static int whpx_vcpu_run(CPUState *cpu)
         }
 
         case WHvRunVpExitReasonCanceled:
-            cpu->exception_index = EXCP_INTERRUPT;
-            ret = 1;
+            if (exclusive_step_mode != WHPX_STEP_NONE) {
+                /*
+                 * We are trying to step over a single instruction, and
+                 * likely got a request to stop from another thread.
+                 * Delay it until we are done stepping
+                 * over.
+                 */
+                ret = 0;
+            } else {
+                cpu->exception_index = EXCP_INTERRUPT;
+                ret = 1;
+            }
             break;
-
         case WHvRunVpExitReasonX64MsrAccess: {
             WHV_REGISTER_VALUE reg_values[3] = {0};
             WHV_REGISTER_NAME reg_names[3];
@@ -1259,11 +1935,36 @@ static int whpx_vcpu_run(CPUState *cpu)
             ret = 0;
             break;
         }
+        case WHvRunVpExitReasonException:
+            whpx_get_registers(cpu);
+
+            if ((vcpu->exit_ctx.VpException.ExceptionType ==
+                 WHvX64ExceptionTypeDebugTrapOrFault) &&
+                (vcpu->exit_ctx.VpException.InstructionByteCount >= 1) &&
+                (vcpu->exit_ctx.VpException.InstructionBytes[0] ==
+                 whpx_breakpoint_instruction)) {
+                /* Stopped at a software breakpoint. */
+                cpu->exception_index = EXCP_DEBUG;
+            } else if ((vcpu->exit_ctx.VpException.ExceptionType ==
+                        WHvX64ExceptionTypeDebugTrapOrFault) &&
+                       !cpu->singlestep_enabled) {
+                /*
+                 * Just finished stepping over a breakpoint, but the
+                 * gdb does not expect us to do single-stepping.
+                 * Don't do anything special.
+                 */
+                cpu->exception_index = EXCP_INTERRUPT;
+            } else {
+                /* Another exception or debug event. Report it to GDB. */
+                cpu->exception_index = EXCP_DEBUG;
+            }
+
+            ret = 1;
+            break;
         case WHvRunVpExitReasonNone:
         case WHvRunVpExitReasonUnrecoverableException:
         case WHvRunVpExitReasonInvalidVpRegisterValue:
         case WHvRunVpExitReasonUnsupportedFeature:
-        case WHvRunVpExitReasonException:
         default:
             error_report("WHPX: Unexpected VP exit code %d",
                          vcpu->exit_ctx.ExitReason);
@@ -1276,10 +1977,32 @@ static int whpx_vcpu_run(CPUState *cpu)
 
     } while (!ret);
 
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
+    if (exclusive_step_mode != WHPX_STEP_NONE) {
+        g_assert(cpu_in_exclusive_context(cpu));
+        cpu->running = false;
+        end_exclusive();
+
+        exclusive_step_mode = WHPX_STEP_NONE;
+    } else {
+        cpu_exec_end(cpu);
+    }
+
     qemu_mutex_lock_iothread();
     current_cpu = cpu;
 
+    if (--whpx->running_cpus == 0) {
+        whpx_last_vcpu_stopping(cpu);
+    }
+
     qatomic_set(&cpu->exit_request, false);
 
     return ret < 0;
@@ -1339,6 +2062,11 @@ void whpx_cpu_synchronize_pre_loadvm(CPUState *cpu)
     run_on_cpu(cpu, do_whpx_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
 }
 
+void whpx_cpu_synchronize_pre_resume(bool step_pending)
+{
+    whpx_global.step_pending = step_pending;
+}
+
 /*
  * Vcpu support.
  */
@@ -1838,6 +2566,7 @@ static int whpx_accel_init(MachineState *ms)
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
     prop.ExtendedVmExits.X64MsrExit = 1;
     prop.ExtendedVmExits.X64CpuidExit = 1;
+    prop.ExtendedVmExits.ExceptionExit = 1;
     if (whpx_apic_in_platform()) {
         prop.ExtendedVmExits.X64ApicInitSipiExitTrap = 1;
     }
@@ -1866,6 +2595,19 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
 
+    /*
+     * We do not want to intercept any exceptions from the guest,
+     * until we actually start debugging with gdb.
+     */
+    whpx->exception_exit_bitmap = -1;
+    hr = whpx_set_exception_exit_bitmap(0);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set exception exit bitmap, hr=%08lx", hr);
+        ret = -EINVAL;
+        goto error;
+    }
+
     hr = whp_dispatch.WHvSetupPartition(whpx->partition);
     if (FAILED(hr)) {
         error_report("WHPX: Failed to setup partition, hr=%08lx", hr);
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index 908ababf6d..2416ec7922 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -5,9 +5,39 @@
 #include <WinHvPlatform.h>
 #include <WinHvEmulation.h>
 
+typedef enum WhpxBreakpointState {
+    WHPX_BP_CLEARED = 0,
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
-- 
2.35.1



