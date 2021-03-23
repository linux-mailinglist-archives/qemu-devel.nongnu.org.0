Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A183464D0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:20:01 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjlA-00012x-FV
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFX-00071C-SS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:54348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFP-0000iL-M1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B763AF27;
 Tue, 23 Mar 2021 15:46:52 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 20/55] target/arm: split vfp state setting from tcg helpers
Date: Tue, 23 Mar 2021 16:46:04 +0100
Message-Id: <20210323154639.23477-13-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu-vfp.c: vfp_get_fpsr and vfp_set_fpsr are needed also for KVM,
           so create a new cpu-vfp.c

tcg/cpu-vfp.c: vfp_get_fpscr_from_host and vv are TCG-only, so we
               move the implementation to tcg/cpu-vfp.c

kvm/helper-stubs.c: vfp_get_fpscr_from_host and vv stubs for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-vfp.h          |  29 +++++
 target/arm/cpu-vfp.c          |  92 +++++++++++++++
 target/arm/kvm/helper-stubs.c |  10 ++
 target/arm/tcg/cpu-vfp.c      | 146 +++++++++++++++++++++++
 target/arm/tcg/vfp_helper.c   | 210 +---------------------------------
 target/arm/meson.build        |   1 +
 target/arm/tcg/meson.build    |   1 +
 7 files changed, 281 insertions(+), 208 deletions(-)
 create mode 100644 target/arm/cpu-vfp.h
 create mode 100644 target/arm/cpu-vfp.c
 create mode 100644 target/arm/tcg/cpu-vfp.c

diff --git a/target/arm/cpu-vfp.h b/target/arm/cpu-vfp.h
new file mode 100644
index 0000000000..41e0d710a0
--- /dev/null
+++ b/target/arm/cpu-vfp.h
@@ -0,0 +1,29 @@
+/*
+ * ARM VFP floating-point operations internals
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_VFP_H
+#define CPU_VFP_H
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+uint32_t vfp_get_fpscr_from_host(CPUARMState *env);
+void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val);
+
+#endif /* CPU_VFP_H */
diff --git a/target/arm/cpu-vfp.c b/target/arm/cpu-vfp.c
new file mode 100644
index 0000000000..216618a7c5
--- /dev/null
+++ b/target/arm/cpu-vfp.c
@@ -0,0 +1,92 @@
+/*
+ * ARM VFP floating-point operations
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "cpu-vfp.h"
+
+uint32_t vfp_get_fpscr(CPUARMState *env)
+{
+    uint32_t i, fpscr;
+
+    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
+            | (env->vfp.vec_len << 16)
+            | (env->vfp.vec_stride << 20);
+
+    /*
+     * M-profile LTPSIZE overlaps A-profile Stride; whichever of the
+     * two is not applicable to this CPU will always be zero.
+     */
+    fpscr |= env->v7m.ltpsize << 16;
+
+    fpscr |= vfp_get_fpscr_from_host(env);
+
+    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
+    fpscr |= i ? FPCR_QC : 0;
+
+    return fpscr;
+}
+
+void vfp_set_fpscr(CPUARMState *env, uint32_t val)
+{
+    /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
+    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
+        val &= ~FPCR_FZ16;
+    }
+
+    vfp_set_fpscr_to_host(env, val);
+
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        /*
+         * Short-vector length and stride; on M-profile these bits
+         * are used for different purposes.
+         * We can't make this conditional be "if MVFR0.FPShVec != 0",
+         * because in v7A no-short-vector-support cores still had to
+         * allow Stride/Len to be written with the only effect that
+         * some insns are required to UNDEF if the guest sets them.
+         *
+         * TODO: if M-profile MVE implemented, set LTPSIZE.
+         */
+        env->vfp.vec_len = extract32(val, 16, 3);
+        env->vfp.vec_stride = extract32(val, 20, 2);
+    }
+
+    if (arm_feature(env, ARM_FEATURE_NEON)) {
+        /*
+         * The bit we set within fpscr_q is arbitrary; the register as a
+         * whole being zero/non-zero is what counts.
+         * TODO: M-profile MVE also has a QC bit.
+         */
+        env->vfp.qc[0] = val & FPCR_QC;
+        env->vfp.qc[1] = 0;
+        env->vfp.qc[2] = 0;
+        env->vfp.qc[3] = 0;
+    }
+
+    /*
+     * We don't implement trapped exception handling, so the
+     * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
+     *
+     * The exception flags IOC|DZC|OFC|UFC|IXC|IDC are stored in
+     * fp_status; QC, Len and Stride are stored separately earlier.
+     * Clear out all of those and the RES0 bits: only NZCV, AHP, DN,
+     * FZ, RMode and FZ16 are kept in vfp.xregs[FPSCR].
+     */
+    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
+}
diff --git a/target/arm/kvm/helper-stubs.c b/target/arm/kvm/helper-stubs.c
index a646da7acc..3c73ccdfc2 100644
--- a/target/arm/kvm/helper-stubs.c
+++ b/target/arm/kvm/helper-stubs.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "cpu-vfp.h"
 
 /* return the effective value of HCR_EL2. For KVM, always 0. */
 uint64_t arm_hcr_el2_eff(CPUARMState *env)
@@ -31,3 +32,12 @@ void arm_rebuild_hflags(CPUARMState *env)
 {
     g_assert_not_reached();
 }
+
+uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
+{
+    return 0;
+}
+
+void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
+{
+}
diff --git a/target/arm/tcg/cpu-vfp.c b/target/arm/tcg/cpu-vfp.c
new file mode 100644
index 0000000000..bb88abf1ba
--- /dev/null
+++ b/target/arm/tcg/cpu-vfp.c
@@ -0,0 +1,146 @@
+/*
+ * ARM VFP floating-point operations
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/log.h"
+#include "internals.h"
+#include "fpu/softfloat.h"
+#include "cpu-vfp.h"
+
+/* Convert host exception flags to vfp form.  */
+static inline int vfp_exceptbits_from_host(int host_bits)
+{
+    int target_bits = 0;
+
+    if (host_bits & float_flag_invalid) {
+        target_bits |= 1;
+    }
+    if (host_bits & float_flag_divbyzero) {
+        target_bits |= 2;
+    }
+    if (host_bits & float_flag_overflow) {
+        target_bits |= 4;
+    }
+    if (host_bits & (float_flag_underflow | float_flag_output_denormal)) {
+        target_bits |= 8;
+    }
+    if (host_bits & float_flag_inexact) {
+        target_bits |= 0x10;
+    }
+    if (host_bits & float_flag_input_denormal) {
+        target_bits |= 0x80;
+    }
+    return target_bits;
+}
+
+/* Convert vfp exception flags to target form.  */
+static inline int vfp_exceptbits_to_host(int target_bits)
+{
+    int host_bits = 0;
+
+    if (target_bits & 1) {
+        host_bits |= float_flag_invalid;
+    }
+    if (target_bits & 2) {
+        host_bits |= float_flag_divbyzero;
+    }
+    if (target_bits & 4) {
+        host_bits |= float_flag_overflow;
+    }
+    if (target_bits & 8) {
+        host_bits |= float_flag_underflow;
+    }
+    if (target_bits & 0x10) {
+        host_bits |= float_flag_inexact;
+    }
+    if (target_bits & 0x80) {
+        host_bits |= float_flag_input_denormal;
+    }
+    return host_bits;
+}
+
+uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
+{
+    uint32_t i;
+
+    i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    /* FZ16 does not generate an input denormal exception.  */
+    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
+          & ~float_flag_input_denormal);
+    i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
+          & ~float_flag_input_denormal);
+    return vfp_exceptbits_from_host(i);
+}
+
+void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
+{
+    int i;
+    uint32_t changed = env->vfp.xregs[ARM_VFP_FPSCR];
+
+    changed ^= val;
+    if (changed & (3 << 22)) {
+        i = (val >> 22) & 3;
+        switch (i) {
+        case FPROUNDING_TIEEVEN:
+            i = float_round_nearest_even;
+            break;
+        case FPROUNDING_POSINF:
+            i = float_round_up;
+            break;
+        case FPROUNDING_NEGINF:
+            i = float_round_down;
+            break;
+        case FPROUNDING_ZERO:
+            i = float_round_to_zero;
+            break;
+        }
+        set_float_rounding_mode(i, &env->vfp.fp_status);
+        set_float_rounding_mode(i, &env->vfp.fp_status_f16);
+    }
+    if (changed & FPCR_FZ16) {
+        bool ftz_enabled = val & FPCR_FZ16;
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
+        set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+    }
+    if (changed & FPCR_FZ) {
+        bool ftz_enabled = val & FPCR_FZ;
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status);
+    }
+    if (changed & FPCR_DN) {
+        bool dnan_enabled = val & FPCR_DN;
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16);
+    }
+
+    /*
+     * The exception flags are ORed together when we read fpscr so we
+     * only need to preserve the current state in one of our
+     * float_status values.
+     */
+    i = vfp_exceptbits_to_host(val);
+    set_float_exception_flags(i, &env->vfp.fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.standard_fp_status);
+    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+}
diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 01b9d8557f..521719f327 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -30,220 +30,14 @@
    Single precision routines have a "s" suffix, double precision a
    "d" suffix.  */
 
-#ifdef CONFIG_TCG
-
-/* Convert host exception flags to vfp form.  */
-static inline int vfp_exceptbits_from_host(int host_bits)
-{
-    int target_bits = 0;
-
-    if (host_bits & float_flag_invalid) {
-        target_bits |= 1;
-    }
-    if (host_bits & float_flag_divbyzero) {
-        target_bits |= 2;
-    }
-    if (host_bits & float_flag_overflow) {
-        target_bits |= 4;
-    }
-    if (host_bits & (float_flag_underflow | float_flag_output_denormal)) {
-        target_bits |= 8;
-    }
-    if (host_bits & float_flag_inexact) {
-        target_bits |= 0x10;
-    }
-    if (host_bits & float_flag_input_denormal) {
-        target_bits |= 0x80;
-    }
-    return target_bits;
-}
-
-/* Convert vfp exception flags to target form.  */
-static inline int vfp_exceptbits_to_host(int target_bits)
-{
-    int host_bits = 0;
-
-    if (target_bits & 1) {
-        host_bits |= float_flag_invalid;
-    }
-    if (target_bits & 2) {
-        host_bits |= float_flag_divbyzero;
-    }
-    if (target_bits & 4) {
-        host_bits |= float_flag_overflow;
-    }
-    if (target_bits & 8) {
-        host_bits |= float_flag_underflow;
-    }
-    if (target_bits & 0x10) {
-        host_bits |= float_flag_inexact;
-    }
-    if (target_bits & 0x80) {
-        host_bits |= float_flag_input_denormal;
-    }
-    return host_bits;
-}
-
-static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
-{
-    uint32_t i;
-
-    i = get_float_exception_flags(&env->vfp.fp_status);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
-    /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
-    i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
-          & ~float_flag_input_denormal);
-    return vfp_exceptbits_from_host(i);
-}
-
-static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
-{
-    int i;
-    uint32_t changed = env->vfp.xregs[ARM_VFP_FPSCR];
-
-    changed ^= val;
-    if (changed & (3 << 22)) {
-        i = (val >> 22) & 3;
-        switch (i) {
-        case FPROUNDING_TIEEVEN:
-            i = float_round_nearest_even;
-            break;
-        case FPROUNDING_POSINF:
-            i = float_round_up;
-            break;
-        case FPROUNDING_NEGINF:
-            i = float_round_down;
-            break;
-        case FPROUNDING_ZERO:
-            i = float_round_to_zero;
-            break;
-        }
-        set_float_rounding_mode(i, &env->vfp.fp_status);
-        set_float_rounding_mode(i, &env->vfp.fp_status_f16);
-    }
-    if (changed & FPCR_FZ16) {
-        bool ftz_enabled = val & FPCR_FZ16;
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
-        set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
-    }
-    if (changed & FPCR_FZ) {
-        bool ftz_enabled = val & FPCR_FZ;
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status);
-    }
-    if (changed & FPCR_DN) {
-        bool dnan_enabled = val & FPCR_DN;
-        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status);
-        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16);
-    }
-
-    /*
-     * The exception flags are ORed together when we read fpscr so we
-     * only need to preserve the current state in one of our
-     * float_status values.
-     */
-    i = vfp_exceptbits_to_host(val);
-    set_float_exception_flags(i, &env->vfp.fp_status);
-    set_float_exception_flags(0, &env->vfp.fp_status_f16);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
-}
-
-#else
-
-static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
-{
-    return 0;
-}
-
-static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
-{
-}
-
-#endif
-
 uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
 {
-    uint32_t i, fpscr;
-
-    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
-            | (env->vfp.vec_len << 16)
-            | (env->vfp.vec_stride << 20);
-
-    /*
-     * M-profile LTPSIZE overlaps A-profile Stride; whichever of the
-     * two is not applicable to this CPU will always be zero.
-     */
-    fpscr |= env->v7m.ltpsize << 16;
-
-    fpscr |= vfp_get_fpscr_from_host(env);
-
-    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
-    fpscr |= i ? FPCR_QC : 0;
-
-    return fpscr;
-}
-
-uint32_t vfp_get_fpscr(CPUARMState *env)
-{
-    return HELPER(vfp_get_fpscr)(env);
+    return vfp_get_fpscr(env);
 }
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
-    /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
-        val &= ~FPCR_FZ16;
-    }
-
-    vfp_set_fpscr_to_host(env, val);
-
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        /*
-         * Short-vector length and stride; on M-profile these bits
-         * are used for different purposes.
-         * We can't make this conditional be "if MVFR0.FPShVec != 0",
-         * because in v7A no-short-vector-support cores still had to
-         * allow Stride/Len to be written with the only effect that
-         * some insns are required to UNDEF if the guest sets them.
-         *
-         * TODO: if M-profile MVE implemented, set LTPSIZE.
-         */
-        env->vfp.vec_len = extract32(val, 16, 3);
-        env->vfp.vec_stride = extract32(val, 20, 2);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
-        /*
-         * The bit we set within fpscr_q is arbitrary; the register as a
-         * whole being zero/non-zero is what counts.
-         * TODO: M-profile MVE also has a QC bit.
-         */
-        env->vfp.qc[0] = val & FPCR_QC;
-        env->vfp.qc[1] = 0;
-        env->vfp.qc[2] = 0;
-        env->vfp.qc[3] = 0;
-    }
-
-    /*
-     * We don't implement trapped exception handling, so the
-     * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
-     *
-     * The exception flags IOC|DZC|OFC|UFC|IXC|IDC are stored in
-     * fp_status; QC, Len and Stride are stored separately earlier.
-     * Clear out all of those and the RES0 bits: only NZCV, AHP, DN,
-     * FZ, RMode and FZ16 are kept in vfp.xregs[FPSCR].
-     */
-    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
-}
-
-void vfp_set_fpscr(CPUARMState *env, uint32_t val)
-{
-    HELPER(vfp_set_fpscr)(env, val);
+    vfp_set_fpscr(env, val);
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6745fab9bb..8fa0b12510 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -7,6 +7,7 @@ arm_ss.add(files(
   'cpregs.c',
   'cpustate-list.c',
   'cpu-common.c',
+  'cpu-vfp.c',
 ))
 arm_ss.add(zlib)
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 21d44404f3..6d372d44e6 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -18,6 +18,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'translate.c',
   'helper.c',
   'cpregs.c',
+  'cpu-vfp.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'neon_helper.c',
-- 
2.26.2


