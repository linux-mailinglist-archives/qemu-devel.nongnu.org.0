Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02D41DDA0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy4N-0006bj-J3
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjR-0000Ik-Hv
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjN-000430-BF
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id v25so61333wra.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h8MNT+gke2zd6+3WRfBNIerS/9ED4qUqaYzEGl7mX60=;
 b=Nqgt0M77GtGwj7g/80ObbDL6woEabD+GA8jLuisERUydPdNAKJ5zsAKAbPrQ5GdMbp
 YwNOeLTikH7wC1MjjRu2HX2/M/DGFdFnALUU8FOiO5e3brquYhuuN42dOOtbDHIPtf2D
 dJyZ2gYZk/j/YhNr1b146bVluP3mQNUlC5M459g7pgRgWEhBamNvccutb6VzFS7Lyg42
 NuLrLB4i+ASTzy0TM29HJT5q04cKDoK8MvZrbiLN59UvLMizJ/NLRUF25r6Ok2tkM0Zp
 ZqU8dCuKA/varOW8m5gDkaHorHnsybubN96lKSRd+FUDMu6BiTQQbZGJrr67+MF79It3
 51fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8MNT+gke2zd6+3WRfBNIerS/9ED4qUqaYzEGl7mX60=;
 b=GAniuAuIe2fOLuIVfabw/UgGRAdMW2tJ+s6VBMC9HDES7d9HjMAcmTwggg+PuJLzWZ
 h2fzwcuOpeD0YcQrL+EPKy82jjLRs6chF8+JpdSxUWQyenMguIuKvvYSFpwaf9gok1NW
 /wPhxfMHqehWQFjvoJrrL6IpUA7eBcpSy08pn4jZQzFB9JHQlVz+pFIZcbIj5cckACrd
 VNgA5F2TtbAf6v8n2qhpdQKFj4qEsMWmV1oPb8Gq8/vf5U/yxeRM2Zb+dWMpWednO/uw
 IGkaRuZ1UsUVKRqPlK++acEYjbyp96jj5T2sLVRpjPdMSrUsZI88wfSFHtZuzQA/Rjbh
 x4GA==
X-Gm-Message-State: AOAM533HhQI4TigByDwWtJGs95pPCZrIrNzVHBTO8xclH7WoBh/rttAc
 jrJ1QsnZZ4ctw6wFttTJLtr/lY60QmSgQw==
X-Google-Smtp-Source: ABdhPJwchH1iv0Sx7tRmyNGWaGBk8y7k3dD3VDfUa80uZNG5UTgx3E9udyfqvPmDVTVFcNujsuNJNQ==
X-Received: by 2002:adf:a147:: with SMTP id r7mr6161791wrr.52.1633014735522;
 Thu, 30 Sep 2021 08:12:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] target/arm: Move gdbstub related code out of helper.c
Date: Thu, 30 Sep 2021 16:11:53 +0100
Message-Id: <20210930151201.9407-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently helper.c includes some code which is part of the arm
target's gdbstub support.  This code has a better home: in gdbstub.c
and gdbstub64.c.  Move it there.

Because aarch64_fpu_gdb_get_reg() and aarch64_fpu_gdb_set_reg() move
into gdbstub64.c, this means that they're now compiled only for
TARGET_AARCH64 rather than always.  That is the only case when they
would ever be used, but it does mean that the ifdef in
arm_cpu_register_gdb_regs_for_features() needs to be adjusted to
match.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210921162901.17508-4-peter.maydell@linaro.org
---
 target/arm/internals.h |   7 ++
 target/arm/gdbstub.c   | 130 ++++++++++++++++++++
 target/arm/gdbstub64.c | 140 +++++++++++++++++++++
 target/arm/helper.c    | 271 -----------------------------------------
 4 files changed, 277 insertions(+), 271 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9fbb3649682..3612107ab28 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1270,4 +1270,11 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
   return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
 }
 
+#ifdef TARGET_AARCH64
+int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
+int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+#endif
+
 #endif
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b3415..cbf156d192f 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "exec/gdbstub.h"
 
 typedef struct RegisterSysregXmlParam {
@@ -124,6 +125,98 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
+
+    /* VFP data registers are always little-endian.  */
+    if (reg < nregs) {
+        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
+    }
+    if (arm_feature(env, ARM_FEATURE_NEON)) {
+        /* Aliases for Q regs.  */
+        nregs += 16;
+        if (reg < nregs) {
+            uint64_t *q = aa32_vfp_qreg(env, reg - 32);
+            return gdb_get_reg128(buf, q[0], q[1]);
+        }
+    }
+    switch (reg - nregs) {
+    case 0:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
+    case 1:
+        return gdb_get_reg32(buf, vfp_get_fpscr(env));
+    case 2:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
+    }
+    return 0;
+}
+
+static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
+
+    if (reg < nregs) {
+        *aa32_vfp_dreg(env, reg) = ldq_le_p(buf);
+        return 8;
+    }
+    if (arm_feature(env, ARM_FEATURE_NEON)) {
+        nregs += 16;
+        if (reg < nregs) {
+            uint64_t *q = aa32_vfp_qreg(env, reg - 32);
+            q[0] = ldq_le_p(buf);
+            q[1] = ldq_le_p(buf + 8);
+            return 16;
+        }
+    }
+    switch (reg - nregs) {
+    case 0:
+        env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
+        return 4;
+    case 1:
+        vfp_set_fpscr(env, ldl_p(buf));
+        return 4;
+    case 2:
+        env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30);
+        return 4;
+    }
+    return 0;
+}
+
+/**
+ * arm_get/set_gdb_*: get/set a gdb register
+ * @env: the CPU state
+ * @buf: a buffer to copy to/from
+ * @reg: register number (offset from start of group)
+ *
+ * We return the number of bytes copied
+ */
+
+static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    const ARMCPRegInfo *ri;
+    uint32_t key;
+
+    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
+    ri = get_arm_cp_reginfo(cpu->cp_regs, key);
+    if (ri) {
+        if (cpreg_field_is_64bit(ri)) {
+            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
+        } else {
+            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
+        }
+    }
+    return 0;
+}
+
+static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    return 0;
+}
+
 static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
                                        int bitsize, int regnum)
@@ -319,3 +412,40 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     }
     return NULL;
 }
+
+void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        /*
+         * The lower part of each SVE register aliases to the FPU
+         * registers so we don't need to include both.
+         */
+#ifdef TARGET_AARCH64
+        if (isar_feature_aa64_sve(&cpu->isar)) {
+            gdb_register_coprocessor(cs, arm_gdb_get_svereg, arm_gdb_set_svereg,
+                                     arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs),
+                                     "sve-registers.xml", 0);
+        } else {
+            gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
+                                     aarch64_fpu_gdb_set_reg,
+                                     34, "aarch64-fpu.xml", 0);
+        }
+#endif
+    } else if (arm_feature(env, ARM_FEATURE_NEON)) {
+        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                 51, "arm-neon.xml", 0);
+    } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                 35, "arm-vfp3.xml", 0);
+    } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
+        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
+                                 19, "arm-vfp.xml", 0);
+    }
+    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
+                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
+                             "system-registers.xml", 0);
+
+}
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 251539ef799..596878666d7 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -17,7 +17,9 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
+#include "internals.h"
 #include "exec/gdbstub.h"
 
 int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
@@ -69,3 +71,141 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     /* Unknown register.  */
     return 0;
 }
+
+int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    switch (reg) {
+    case 0 ... 31:
+    {
+        /* 128 bit FP register - quads are in LE order */
+        uint64_t *q = aa64_vfp_qreg(env, reg);
+        return gdb_get_reg128(buf, q[1], q[0]);
+    }
+    case 32:
+        /* FPSR */
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 33:
+        /* FPCR */
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+    default:
+        return 0;
+    }
+}
+
+int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    switch (reg) {
+    case 0 ... 31:
+        /* 128 bit FP register */
+        {
+            uint64_t *q = aa64_vfp_qreg(env, reg);
+            q[0] = ldq_le_p(buf);
+            q[1] = ldq_le_p(buf + 8);
+            return 16;
+        }
+    case 32:
+        /* FPSR */
+        vfp_set_fpsr(env, ldl_p(buf));
+        return 4;
+    case 33:
+        /* FPCR */
+        vfp_set_fpcr(env, ldl_p(buf));
+        return 4;
+    default:
+        return 0;
+    }
+}
+
+int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            len += gdb_get_reg128(buf,
+                                  env->vfp.zregs[reg].d[vq * 2 + 1],
+                                  env->vfp.zregs[reg].d[vq * 2]);
+        }
+        return len;
+    }
+    case 32:
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 33:
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+    /* then 16 predicates and the ffr */
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
+        }
+        return len;
+    }
+    case 51:
+    {
+        /*
+         * We report in Vector Granules (VG) which is 64bit in a Z reg
+         * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
+         */
+        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        return gdb_get_reg64(buf, vq * 2);
+    }
+    default:
+        /* gdbstub asked for something out our range */
+        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
+        break;
+    }
+
+    return 0;
+}
+
+int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* The first 32 registers are the zregs */
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
+            env->vfp.zregs[reg].d[vq * 2] = *p++;
+            len += 16;
+        }
+        return len;
+    }
+    case 32:
+        vfp_set_fpsr(env, *(uint32_t *)buf);
+        return 4;
+    case 33:
+        vfp_set_fpcr(env, *(uint32_t *)buf);
+        return 4;
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            env->vfp.pregs[preg].p[vq / 4] = *p++;
+            len += 8;
+        }
+        return len;
+    }
+    case 51:
+        /* cannot set vg via gdbstub */
+        return 0;
+    default:
+        /* gdbstub asked for something out our range */
+        break;
+    }
+
+    return 0;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 84bba9a2244..9b317899a66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
@@ -54,110 +53,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 static void switch_mode(CPUARMState *env, int mode);
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 
-static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
-
-    /* VFP data registers are always little-endian.  */
-    if (reg < nregs) {
-        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
-    }
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
-        /* Aliases for Q regs.  */
-        nregs += 16;
-        if (reg < nregs) {
-            uint64_t *q = aa32_vfp_qreg(env, reg - 32);
-            return gdb_get_reg128(buf, q[0], q[1]);
-        }
-    }
-    switch (reg - nregs) {
-    case 0:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
-    case 1:
-        return gdb_get_reg32(buf, vfp_get_fpscr(env));
-    case 2:
-        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
-    }
-    return 0;
-}
-
-static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
-
-    if (reg < nregs) {
-        *aa32_vfp_dreg(env, reg) = ldq_le_p(buf);
-        return 8;
-    }
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
-        nregs += 16;
-        if (reg < nregs) {
-            uint64_t *q = aa32_vfp_qreg(env, reg - 32);
-            q[0] = ldq_le_p(buf);
-            q[1] = ldq_le_p(buf + 8);
-            return 16;
-        }
-    }
-    switch (reg - nregs) {
-    case 0:
-        env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
-        return 4;
-    case 1:
-        vfp_set_fpscr(env, ldl_p(buf));
-        return 4;
-    case 2:
-        env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30);
-        return 4;
-    }
-    return 0;
-}
-
-static int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
-{
-    switch (reg) {
-    case 0 ... 31:
-    {
-        /* 128 bit FP register - quads are in LE order */
-        uint64_t *q = aa64_vfp_qreg(env, reg);
-        return gdb_get_reg128(buf, q[1], q[0]);
-    }
-    case 32:
-        /* FPSR */
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
-    case 33:
-        /* FPCR */
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
-    default:
-        return 0;
-    }
-}
-
-static int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
-{
-    switch (reg) {
-    case 0 ... 31:
-        /* 128 bit FP register */
-        {
-            uint64_t *q = aa64_vfp_qreg(env, reg);
-            q[0] = ldq_le_p(buf);
-            q[1] = ldq_le_p(buf + 8);
-            return 16;
-        }
-    case 32:
-        /* FPSR */
-        vfp_set_fpsr(env, ldl_p(buf));
-        return 4;
-    case 33:
-        /* FPCR */
-        vfp_set_fpcr(env, ldl_p(buf));
-        return 4;
-    default:
-        return 0;
-    }
-}
-
 static uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     assert(ri->fieldoffset);
@@ -217,134 +112,6 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-/**
- * arm_get/set_gdb_*: get/set a gdb register
- * @env: the CPU state
- * @buf: a buffer to copy to/from
- * @reg: register number (offset from start of group)
- *
- * We return the number of bytes copied
- */
-
-static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    const ARMCPRegInfo *ri;
-    uint32_t key;
-
-    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
-    ri = get_arm_cp_reginfo(cpu->cp_regs, key);
-    if (ri) {
-        if (cpreg_field_is_64bit(ri)) {
-            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
-        } else {
-            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
-        }
-    }
-    return 0;
-}
-
-static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
-{
-    return 0;
-}
-
-#ifdef TARGET_AARCH64
-static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    switch (reg) {
-    /* The first 32 registers are the zregs */
-    case 0 ... 31:
-    {
-        int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            len += gdb_get_reg128(buf,
-                                  env->vfp.zregs[reg].d[vq * 2 + 1],
-                                  env->vfp.zregs[reg].d[vq * 2]);
-        }
-        return len;
-    }
-    case 32:
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
-    case 33:
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
-    /* then 16 predicates and the ffr */
-    case 34 ... 50:
-    {
-        int preg = reg - 34;
-        int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
-        }
-        return len;
-    }
-    case 51:
-    {
-        /*
-         * We report in Vector Granules (VG) which is 64bit in a Z reg
-         * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
-         */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
-        return gdb_get_reg64(buf, vq * 2);
-    }
-    default:
-        /* gdbstub asked for something out our range */
-        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
-        break;
-    }
-
-    return 0;
-}
-
-static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    /* The first 32 registers are the zregs */
-    switch (reg) {
-    /* The first 32 registers are the zregs */
-    case 0 ... 31:
-    {
-        int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
-            env->vfp.zregs[reg].d[vq * 2] = *p++;
-            len += 16;
-        }
-        return len;
-    }
-    case 32:
-        vfp_set_fpsr(env, *(uint32_t *)buf);
-        return 4;
-    case 33:
-        vfp_set_fpcr(env, *(uint32_t *)buf);
-        return 4;
-    case 34 ... 50:
-    {
-        int preg = reg - 34;
-        int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            env->vfp.pregs[preg].p[vq / 4] = *p++;
-            len += 8;
-        }
-        return len;
-    }
-    case 51:
-        /* cannot set vg via gdbstub */
-        return 0;
-    default:
-        /* gdbstub asked for something out our range */
-        break;
-    }
-
-    return 0;
-}
-#endif /* TARGET_AARCH64 */
-
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /* Return true if the regdef would cause an assertion if you called
@@ -8667,44 +8434,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif
 }
 
-void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
-{
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
-
-    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-        /*
-         * The lower part of each SVE register aliases to the FPU
-         * registers so we don't need to include both.
-         */
-#ifdef TARGET_AARCH64
-        if (isar_feature_aa64_sve(&cpu->isar)) {
-            gdb_register_coprocessor(cs, arm_gdb_get_svereg, arm_gdb_set_svereg,
-                                     arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs),
-                                     "sve-registers.xml", 0);
-        } else
-#endif
-        {
-            gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
-                                     aarch64_fpu_gdb_set_reg,
-                                     34, "aarch64-fpu.xml", 0);
-        }
-    } else if (arm_feature(env, ARM_FEATURE_NEON)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 51, "arm-neon.xml", 0);
-    } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 35, "arm-vfp3.xml", 0);
-    } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-        gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
-                                 19, "arm-vfp.xml", 0);
-    }
-    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
-                             "system-registers.xml", 0);
-
-}
-
 /* Sort alphabetically by type name, except for "any". */
 static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 {
-- 
2.20.1


