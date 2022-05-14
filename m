Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E1526DC0
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 03:31:00 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npgcU-00071G-Mj
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 21:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1npgb5-0006J0-5u
 for qemu-devel@nongnu.org; Fri, 13 May 2022 21:29:31 -0400
Received: from sysprogs.com ([45.79.83.98]:50412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1npgb2-0005Oa-U3
 for qemu-devel@nongnu.org; Fri, 13 May 2022 21:29:30 -0400
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id 5F7E311A1FB;
 Sat, 14 May 2022 01:29:27 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: <qemu-devel@nongnu.org>
Cc: "'Paolo Bonzini'" <pbonzini@redhat.com>
Subject: [PATCH] whpx: Added support for saving/restoring VM state
Date: Fri, 13 May 2022 18:29:24 -0700
Message-ID: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdhnMf7AmGxQLTpWS8a1Gn3BLhZ6HQ==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for the savevm/loadvm commands when using WHPX.

It saves the XSAVE state and the relevant internal registers that were
not otherwise captured into a separate "whpx/cpustate" object in the
snapshot, and restores them when the snapshot is loaded.

Note that due to the XSAVE format differences between the WHPX API and
QEMU, the XSAVE state captured from WHPX is not reflected in the X86CPU
structure, and is instead saved to the snapshots "as is".

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
---
 target/i386/cpu.h                |   2 +-
 target/i386/whpx/whpx-all.c      | 205 +++++++++++++++++++++++++++++--
 target/i386/whpx/whpx-internal.h |   7 +-
 3 files changed, 201 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9661f9fbd1..9c16199679 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1698,7 +1698,7 @@ typedef struct CPUArchState {
     int64_t user_tsc_khz; /* for sanity check only */
     uint64_t apic_bus_freq;
     uint64_t tsc;
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF) || defined(CONFIG_WHPX)
     void *xsave_buf;
     uint32_t xsave_buf_len;
 #endif
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..6f95e9c780 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -26,6 +26,9 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
+#include "migration/register.h"
+#include "migration/qemu-file-types.h"
+#include "qemu/memalign.h"
 #include <winerror.h>
 
 #include "whpx-internal.h"
@@ -242,6 +245,10 @@ struct whpx_vcpu {
     WHV_RUN_VP_EXIT_CONTEXT exit_ctx;
 };
 
+enum {
+    WHPX_XSAVE_AREA_ALIGNMENT = 4096,
+};
+
 static bool whpx_allowed;
 static bool whp_dispatch_initialized;
 static HMODULE hWinHvPlatform, hWinHvEmulation;
@@ -251,6 +258,29 @@ static WHV_PROCESSOR_XSAVE_FEATURES whpx_xsave_cap;
 struct whpx_state whpx_global;
 struct WHPDispatch whp_dispatch;
 
+static void whpx_xsave_save(QEMUFile *f, void *opaque);
+static int whpx_xsave_load(QEMUFile *f, void *opaque, int version_id);
+
+/*
+ * As of Windows 10 21H1, the layout of the XSAVE data returned by the WHPX
API
+ * does not match the layout used by QEMU.
+ *
+ * Specifically, trying to pass the state returned by
x86_cpu_xsave_all_areas()
+ * to WHvSetVirtualProcessorXsaveState() causes it to return an error.
+ *
+ * As a result, we do not reflect the captured XSAVE state in the X86CPU
+ * structure, and instead manually save it to the snapshots via the
+ * whpx_xsave_xxxx() callbacks.
+ *
+ * Note that unlike the device drivers that can use the new
VMStateDescription
+ * mechanism via 'DeviceClass::vmsd' field, AccelClass objects cannot
easily
+ * do it. Hence, we rely on the legacy state management API.
+ */
+static SaveVMHandlers savevm_whpx = {
+    .save_state = whpx_xsave_save,
+    .load_state = whpx_xsave_load,
+};
+
 static bool whpx_has_xsave(void)
 {
     return whpx_xsave_cap.XsaveSupport;
@@ -307,18 +337,35 @@ static SegmentCache whpx_seg_h2q(const
WHV_X64_SEGMENT_REGISTER *hs)
 }
 
 /* X64 Extended Control Registers */
-static void whpx_set_xcrs(CPUState *cpu)
+static void whpx_set_xsave(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     WHV_REGISTER_VALUE xcr0;
     WHV_REGISTER_NAME xcr0_name = WHvX64RegisterXCr0;
+    void *xsave = X86_CPU(cpu)->env.xsave_buf;
+    uint32_t xsave_len = X86_CPU(cpu)->env.xsave_buf_len;
 
     if (!whpx_has_xsave()) {
         return;
     }
 
+    if (xsave) {
+        /*
+         *  See the comment on 'savevm_whpx' for an explanation why
+         *  we cannot do this:
+         *      x86_cpu_xsave_all_areas(X86_CPU(cpu), xsave, xsave_len);
+         */
+
+        hr = whp_dispatch.WHvSetVirtualProcessorXsaveState(
+            whpx->partition, cpu->cpu_index, xsave, xsave_len);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to set xsave state, hr=%08lx", hr);
+        }
+    }
+
     /* Only xcr0 is supported by the hypervisor currently */
     xcr0.Reg64 = env->xcr0;
     hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
@@ -326,6 +373,7 @@ static void whpx_set_xcrs(CPUState *cpu)
     if (FAILED(hr)) {
         error_report("WHPX: Failed to set register xcr0, hr=%08lx", hr);
     }
+
 }
 
 static int whpx_set_tsc(CPUState *cpu)
@@ -474,7 +522,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
      * Extended control registers needs to be handled separately depending
      * on whether xsave is supported/enabled or not.
      */
-    whpx_set_xcrs(cpu);
+    whpx_set_xsave(cpu);
 
     /* 16 XMM registers */
     assert(whpx_register_names[idx] == WHvX64RegisterXmm0);
@@ -582,28 +630,57 @@ static int whpx_get_tsc(CPUState *cpu)
     return 0;
 }
 
-/* X64 Extended Control Registers */
-static void whpx_get_xcrs(CPUState *cpu)
+/* X64 Extended Control Registers & XSAVE state */
+static void whpx_get_xsave(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     WHV_REGISTER_VALUE xcr0;
     WHV_REGISTER_NAME xcr0_name = WHvX64RegisterXCr0;
+    void *xsave = X86_CPU(cpu)->env.xsave_buf;
+    uint32_t xsave_len = X86_CPU(cpu)->env.xsave_buf_len;
+    uint32_t xsave_done;
 
     if (!whpx_has_xsave()) {
         return;
     }
 
+    if (!xsave) {
+        hr = whp_dispatch.WHvGetVirtualProcessorXsaveState(
+            whpx->partition, cpu->cpu_index, NULL, 0, &xsave_done);
+
+        if (hr != WHV_E_INSUFFICIENT_BUFFER || !xsave_done) {
+            error_report("WHPX: Failed to get xsave area size, hr=%08lx",
hr);
+        } else {
+            X86_CPU(cpu)->env.xsave_buf_len = xsave_len = xsave_done;
+            X86_CPU(cpu)->env.xsave_buf = xsave =
+                qemu_memalign(WHPX_XSAVE_AREA_ALIGNMENT,
+                    X86_CPU(cpu)->env.xsave_buf_len);
+        }
+    }
+
     /* Only xcr0 is supported by the hypervisor currently */
     hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
         whpx->partition, cpu->cpu_index, &xcr0_name, 1, &xcr0);
     if (FAILED(hr)) {
         error_report("WHPX: Failed to get register xcr0, hr=%08lx", hr);
-        return;
     }
 
     env->xcr0 = xcr0.Reg64;
+
+    hr = whp_dispatch.WHvGetVirtualProcessorXsaveState(
+        whpx->partition, cpu->cpu_index, xsave, xsave_len, &xsave_done);
+
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to get xsave state, hr=%08lx", hr);
+    }
+
+    /*
+     * See the comment on 'savevm_whpx' for an explanation why
+     *  we cannot do this:
+     *      x86_cpu_xrstor_all_areas(X86_CPU(cpu), xsave, xsave_len);
+     */
 }
 
 static void whpx_get_registers(CPUState *cpu)
@@ -703,7 +780,7 @@ static void whpx_get_registers(CPUState *cpu)
      * Extended control registers needs to be handled separately depending
      * on whether xsave is supported/enabled or not.
      */
-    whpx_get_xcrs(cpu);
+    whpx_get_xsave(cpu);
 
     /* 16 XMM registers */
     assert(whpx_register_names[idx] == WHvX64RegisterXmm0);
@@ -2164,10 +2241,15 @@ int whpx_init_vcpu(CPUState *cpu)
     UINT64 freq = 0;
     int ret;
 
-    /* Add migration blockers for all unsupported features of the
-     * Windows Hypervisor Platform
-     */
-    if (whpx_migration_blocker == NULL) {
+    ret = register_savevm_live("whpx/cpustate", cpu->cpu_index,
+        1, &savevm_whpx, cpu);
+
+    if (ret && whpx_migration_blocker == NULL) {
+        /*
+         * Failed to register the callbacks for saving the CPU state.
+         * Add migration blockers for all unsupported features of the
+         * Windows Hypervisor Platform
+         */
         error_setg(&whpx_migration_blocker,
                "State blocked due to non-migratable CPUID feature support,"
                "dirty memory tracking support, and XSAVE/XRSTOR support");
@@ -2300,10 +2382,16 @@ void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    void *xsave = X86_CPU(cpu)->env.xsave_buf;
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition,
cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
     g_free(cpu->hax_vcpu);
+
+    if (xsave) {
+        qemu_vfree(xsave);
+    }
+
     return;
 }
 
@@ -2799,4 +2887,101 @@ error:
     return false;
 }
 
+static void whpx_xsave_save(QEMUFile *f, void *opaque)
+{
+    CPUState *cpu = (CPUState *)opaque;
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    void *xsave = x86_cpu->env.xsave_buf;
+    uint32_t xsave_len = x86_cpu->env.xsave_buf_len;
+    int i;
+
+    /*
+     * Initially, all WHPX CPUs except #0 start suspended (with
+     * WHV_INTERNAL_ACTIVITY_REGISTER::StartupSuspend set).
+     * Restoring a snapshot with multiple active CPUs will not
+     * automatically start them unless we explicitly reset this
+     * flag (or preserve it in the snapshot).
+     */
+    WHV_REGISTER_NAME savedRegisters[] = {
+        WHvRegisterInternalActivityState
+    };
+
+    if (xsave && xsave_len) {
+        qemu_put_be32(f, xsave_len);
+        qemu_put_buffer(f, xsave, xsave_len);
+    } else {
+        qemu_put_be32(f, 0);
+    }
+
+    /* Save 0 or more [name]=[value] pairs followed by [0] */
+    for (i = 0; i < sizeof(savedRegisters) / sizeof(savedRegisters[0]);
i++) {
+        HRESULT hr;
+        WHV_REGISTER_NAME name = savedRegisters[i];
+        WHV_REGISTER_VALUE value;
+
+        /* 0 marks the end of saved register list */
+        assert(name != 0);
+
+        hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
+            whpx_global.partition, cpu->cpu_index,
+            &name, 1, &value);
+
+        if (SUCCEEDED(hr)) {
+            qemu_put_be32(f, name);
+            qemu_put_buffer(f, (uint8_t *)&value, sizeof(value));
+        }
+    }
+
+    qemu_put_be32(f, 0);
+}
+
+static int whpx_xsave_load(QEMUFile *f, void *opaque, int version_id)
+{
+    CPUState *cpu = (CPUState *)opaque;
+    X86CPU *x86_cpu = X86_CPU(cpu);
+
+    uint32_t saved_xsave_len = qemu_get_be32(f);
+    if (saved_xsave_len) {
+        if (saved_xsave_len != x86_cpu->env.xsave_buf_len) {
+            if (x86_cpu->env.xsave_buf) {
+                qemu_vfree(x86_cpu->env.xsave_buf);
+            }
+
+            x86_cpu->env.xsave_buf_len = saved_xsave_len;
+            x86_cpu->env.xsave_buf =
qemu_memalign(WHPX_XSAVE_AREA_ALIGNMENT,
+                x86_cpu->env.xsave_buf_len);
+        }
+
+        qemu_get_buffer(f, x86_cpu->env.xsave_buf, saved_xsave_len);
+    } else if (x86_cpu->env.xsave_buf) {
+        qemu_vfree(x86_cpu->env.xsave_buf);
+        x86_cpu->env.xsave_buf = NULL;
+        x86_cpu->env.xsave_buf_len = 0;
+    }
+
+    for (;;) {
+        HRESULT hr;
+        WHV_REGISTER_NAME name = qemu_get_be32(f);
+        WHV_REGISTER_VALUE value;
+
+        if (name == 0) {
+            break;
+        }
+
+        qemu_get_buffer(f, (uint8_t *)&value, sizeof(value));
+
+        hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+            whpx_global.partition, cpu->cpu_index,
+            &name, 1, &value);
+
+        if (FAILED(hr)) {
+            error_report("WHPX: Failed to restore register #%08x,
hr=%08lx",
+                name, hr);
+        }
+    }
+
+    return 0;
+}
+
+
 type_init(whpx_type_init);
diff --git a/target/i386/whpx/whpx-internal.h
b/target/i386/whpx/whpx-internal.h
index 06429d8ccd..157443f60c 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -46,10 +46,11 @@ struct whpx_state {
 extern struct whpx_state whpx_global;
 void whpx_apic_get(DeviceState *s);
 
-#define WHV_E_UNKNOWN_CAPABILITY 0x80370300L
+#define WHV_E_UNKNOWN_CAPABILITY  0x80370300L
 
 /* This should eventually come from the Windows SDK */
-#define WHV_E_UNKNOWN_PROPERTY 0x80370302
+#define WHV_E_UNKNOWN_PROPERTY    0x80370302L
+#define WHV_E_INSUFFICIENT_BUFFER 0x80370301L
 
 #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
   X(HRESULT, WHvGetCapability, (WHV_CAPABILITY_CODE CapabilityCode, VOID*
CapabilityBuffer, UINT32 CapabilityBufferSizeInBytes, UINT32*
WrittenSizeInBytes)) \
@@ -67,6 +68,8 @@ void whpx_apic_get(DeviceState *s);
   X(HRESULT, WHvCancelRunVirtualProcessor, (WHV_PARTITION_HANDLE Partition,
UINT32 VpIndex, UINT32 Flags)) \
   X(HRESULT, WHvGetVirtualProcessorRegisters, (WHV_PARTITION_HANDLE
Partition, UINT32 VpIndex, const WHV_REGISTER_NAME* RegisterNames, UINT32
RegisterCount, WHV_REGISTER_VALUE* RegisterValues)) \
   X(HRESULT, WHvSetVirtualProcessorRegisters, (WHV_PARTITION_HANDLE
Partition, UINT32 VpIndex, const WHV_REGISTER_NAME* RegisterNames, UINT32
RegisterCount, const WHV_REGISTER_VALUE* RegisterValues)) \
+  X(HRESULT, WHvGetVirtualProcessorXsaveState, (WHV_PARTITION_HANDLE
Partition, UINT32 VpIndex, VOID *Buffer, UINT32 BufferSizeInBytes, UINT32
*BytesWritten)) \
+  X(HRESULT, WHvSetVirtualProcessorXsaveState, (WHV_PARTITION_HANDLE
Partition, UINT32 VpIndex, const VOID *Buffer, UINT32 BufferSizeInBytes)) \
 
 /*
  * These are supplemental functions that may not be present
-- 


