Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E6689B9B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:30:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4h-0006sw-Kq; Fri, 03 Feb 2023 09:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4a-0006i5-HG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4W-00056k-0l
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so6145870wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VBGtDc2wO9Pk/ZYyPMtUfkQ3djSTk8nYlVlddOC0ytw=;
 b=jCUaoMW7ivOpngoOHqdg3DkwyWcFQyiXj1MO66B3H/BJUuvqfaUSrf+Hf/Jhuao2RK
 KQUxOD7g7EHmAaEKC+EHU6XughHMUsLVStBkDMWmM3yScT+We4V5dvZPZssIrDrdfSxD
 Rc/83m0wTE0puV4lR/Jom5mwTMWD/Cbm9Gf+dvD2YTJAUZIKT4ThaYm4j+xhw66uUsU2
 BHDpV1imuUSeWBn6+He8GGpkKb3mazxedvT2r/EH+dLpMGFhhMBD+SP/iS+KGrj4wppN
 ulGYBJTSpSi9C7G/zdTsF/io6di5JDofvR0R6Kx9u+UwPgkf2A6MgCJNH10s/mNWxhuP
 QxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBGtDc2wO9Pk/ZYyPMtUfkQ3djSTk8nYlVlddOC0ytw=;
 b=B8G2FxpBPI3DbaSmPFrw39FGwDUk1ViDX7TDKRS4veZ+nm+0OcOjTsj+9mRELES00x
 8T2urEt6XUr8CpYDaEbnqC/5qxyQe6oFkbTHs1Jmfd6wqpHOlyHa1NT38JMoQSSQ6Vhz
 gk7etZ+V+YkgI/cVHEw1qrD+tu3AGfLXOYFW2ujRcSnIjdeGcm7ntGv0oskRfgKzDG98
 feEk87BPVsCebB1J0QxXZaVqsvM3T+bONvfzF0mVf9CUyqTUcZVduG/d6B1WGCUFuMU1
 /btVRA+GER9BhYfPfR4yxgyeMld7KCC8AcKcG2jE3C6eXQhxSmKGjEsEM0K/lR7/7ptu
 /3GA==
X-Gm-Message-State: AO0yUKVsUwhg6tTBB1QM/ZjyM8htuUtzGwB0aTCkI++xISGrder/MkLz
 LhTJju8xxNxbiI4fdSgPIdXV4MCQ89IvKyan
X-Google-Smtp-Source: AK7set/IGXo7c83ybfgORHdtldLy0pnq9noZ/n9Th9YMmUgM/YjbYIW0wy30YMYV5jMMSEvxalJCXQ==
X-Received: by 2002:a05:600c:c13:b0:3dc:496f:ad56 with SMTP id
 fm19-20020a05600c0c1300b003dc496fad56mr9707779wmb.14.1675434585138; 
 Fri, 03 Feb 2023 06:29:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] target/arm: Implement FGT trapping infrastructure
Date: Fri,  3 Feb 2023 14:29:13 +0000
Message-Id: <20230203142927.834793-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implement the machinery for fine-grained traps on normal sysregs.
Any sysreg with a fine-grained trap will set the new field to
indicate which FGT register bit it should trap on.

FGT traps only happen when an AArch64 EL2 enables them for
an AArch64 EL1. They therefore are only relevant for AArch32
cpregs when the cpreg can be accessed from EL0. The logic
in access_check_cp_reg() will check this, so it is safe to
add a .fgt marking to an ARM_CP_STATE_BOTH ARMCPRegInfo.

The DO_BIT and DO_REV_BIT macros define enum constants FGT_##bitname
which can be used to specify the FGT bit, eg
   .fgt = FGT_AFSR0_EL1
(We assume that there is no bit name duplication across the FGT
registers, for brevity's sake.)

Subsequent commits will add the .fgt fields to the relevant register
definitions and define the FGT_nnn values for them.

Note that some of the FGT traps are for instructions that we don't
handle via the cpregs mechanisms (mostly these are instruction traps).
Those we will have to handle separately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-10-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-10-peter.maydell@linaro.org
---
 target/arm/cpregs.h        | 72 ++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h           |  1 +
 target/arm/internals.h     | 20 +++++++++++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        |  9 +++++
 target/arm/op_helper.c     | 30 ++++++++++++++++
 target/arm/translate-a64.c |  3 +-
 target/arm/translate.c     |  2 ++
 8 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index cb3dc567819..8cc12045af6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -515,6 +515,73 @@ FIELD(HDFGWTR_EL2, NBRBCTL, 60, 1)
 FIELD(HDFGWTR_EL2, NBRBDATA, 61, 1)
 FIELD(HDFGWTR_EL2, NPMSNEVFR_EL1, 62, 1)
 
+/* Which fine-grained trap bit register to check, if any */
+FIELD(FGT, TYPE, 10, 3)
+FIELD(FGT, REV, 9, 1) /* Is bit sense reversed? */
+FIELD(FGT, IDX, 6, 3) /* Index within a uint64_t[] array */
+FIELD(FGT, BITPOS, 0, 6) /* Bit position within the uint64_t */
+
+/*
+ * Macros to define FGT_##bitname enum constants to use in ARMCPRegInfo::fgt
+ * fields. We assume for brevity's sake that there are no duplicated
+ * bit names across the various FGT registers.
+ */
+#define DO_BIT(REG, BITNAME)                                    \
+    FGT_##BITNAME = FGT_##REG | R_##REG##_EL2_##BITNAME##_SHIFT
+
+/* Some bits have reversed sense, so 0 means trap and 1 means not */
+#define DO_REV_BIT(REG, BITNAME)                                        \
+    FGT_##BITNAME = FGT_##REG | FGT_REV | R_##REG##_EL2_##BITNAME##_SHIFT
+
+typedef enum FGTBit {
+    /*
+     * These bits tell us which register arrays to use:
+     * if FGT_R is set then reads are checked against fgt_read[];
+     * if FGT_W is set then writes are checked against fgt_write[];
+     * if FGT_EXEC is set then all accesses are checked against fgt_exec[].
+     *
+     * For almost all bits in the R/W register pairs, the bit exists in
+     * both registers for a RW register, in HFGRTR/HDFGRTR for a RO register
+     * with the corresponding HFGWTR/HDFGTWTR bit being RES0, and vice-versa
+     * for a WO register. There are unfortunately a couple of exceptions
+     * (PMCR_EL0, TRFCR_EL1) where the register being trapped is RW but
+     * the FGT system only allows trapping of writes, not reads.
+     *
+     * Note that we arrange these bits so that a 0 FGTBit means "no trap".
+     */
+    FGT_R = 1 << R_FGT_TYPE_SHIFT,
+    FGT_W = 2 << R_FGT_TYPE_SHIFT,
+    FGT_EXEC = 4 << R_FGT_TYPE_SHIFT,
+    FGT_RW = FGT_R | FGT_W,
+    /* Bit to identify whether trap bit is reversed sense */
+    FGT_REV = R_FGT_REV_MASK,
+
+    /*
+     * If a bit exists in HFGRTR/HDFGRTR then either the register being
+     * trapped is RO or the bit also exists in HFGWTR/HDFGWTR, so we either
+     * want to trap for both reads and writes or else it's harmless to mark
+     * it as trap-on-writes.
+     * If a bit exists only in HFGWTR/HDFGWTR then either the register being
+     * trapped is WO, or else it is one of the two oddball special cases
+     * which are RW but have only a write trap. We mark these as only
+     * FGT_W so we get the right behaviour for those special cases.
+     * (If a bit was added in future that provided only a read trap for an
+     * RW register we'd need to do something special to get the FGT_R bit
+     * only. But this seems unlikely to happen.)
+     *
+     * So for the DO_BIT/DO_REV_BIT macros: use FGT_HFGRTR/FGT_HDFGRTR if
+     * the bit exists in that register. Otherwise use FGT_HFGWTR/FGT_HDFGWTR.
+     */
+    FGT_HFGRTR = FGT_RW | (FGTREG_HFGRTR << R_FGT_IDX_SHIFT),
+    FGT_HFGWTR = FGT_W | (FGTREG_HFGWTR << R_FGT_IDX_SHIFT),
+    FGT_HDFGRTR = FGT_RW | (FGTREG_HDFGRTR << R_FGT_IDX_SHIFT),
+    FGT_HDFGWTR = FGT_W | (FGTREG_HDFGWTR << R_FGT_IDX_SHIFT),
+    FGT_HFGITR = FGT_EXEC | (FGTREG_HFGITR << R_FGT_IDX_SHIFT),
+} FGTBit;
+
+#undef DO_BIT
+#undef DO_REV_BIT
+
 typedef struct ARMCPRegInfo ARMCPRegInfo;
 
 /*
@@ -569,6 +636,11 @@ struct ARMCPRegInfo {
     CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     CPSecureState secure;
+    /*
+     * Which fine-grained trap register bit to check, if any. This
+     * value encodes both the trap register and bit within it.
+     */
+    FGTBit fgt;
     /*
      * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 063024508af..5cc81bec9bf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3170,6 +3170,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
 FIELD(TBFLAG_ANY, ALIGN_MEM, 10, 1)
 FIELD(TBFLAG_ANY, PSTATE__IL, 11, 1)
+FIELD(TBFLAG_ANY, FGT_ACTIVE, 12, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9555309df0..e1e018da463 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1377,4 +1377,24 @@ static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
      (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
 
+/*
+ * Return true if it is possible to take a fine-grained-trap to EL2.
+ */
+static inline bool arm_fgt_active(CPUARMState *env, int el)
+{
+    /*
+     * The Arm ARM only requires the "{E2H,TGE} != {1,1}" test for traps
+     * that can affect EL0, but it is harmless to do the test also for
+     * traps on registers that are only accessible at EL1 because if the test
+     * returns true then we can't be executing at EL1 anyway.
+     * FGT traps only happen when EL2 is enabled and EL1 is AArch64;
+     * traps from AArch32 only happen for the EL0 is AArch32 case.
+     */
+    return cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+        el < 2 && arm_is_el2_enabled(env) &&
+        arm_el_is_aa64(env, 1) &&
+        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE) &&
+        (!arm_feature(env, ARM_FEATURE_EL3) || (env->cp15.scr_el3 & SCR_FGTEN));
+}
+
 #endif
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f17f095cbe2..599902016dc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -130,6 +130,8 @@ typedef struct DisasContext {
     bool is_nonstreaming;
     /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
     bool mve_no_pred;
+    /* True if fine-grained traps are active */
+    bool fgt_active;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20527995359..2389e41bd07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11689,6 +11689,7 @@ static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
     if (arm_singlestep_active(env)) {
         DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
     }
+
     return flags;
 }
 
@@ -11761,6 +11762,10 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
+    if (arm_fgt_active(env, el)) {
+        DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
+    }
+
     if (env->uncached_cpsr & CPSR_IL) {
         DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
     }
@@ -11895,6 +11900,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
     }
 
+    if (arm_fgt_active(env, el)) {
+        DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
+    }
+
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
         /*
          * Set MTE_ACTIVE if any access may be Checked, and leave clear
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index dec03310ad5..3baf8004f64 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -680,6 +680,36 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         }
     }
 
+    /*
+     * Fine-grained traps also are lower priority than undef-to-EL1,
+     * higher priority than trap-to-EL3, and we don't care about priority
+     * order with other EL2 traps because the syndrome value is the same.
+     */
+    if (arm_fgt_active(env, arm_current_el(env))) {
+        uint64_t trapword = 0;
+        unsigned int idx = FIELD_EX32(ri->fgt, FGT, IDX);
+        unsigned int bitpos = FIELD_EX32(ri->fgt, FGT, BITPOS);
+        bool rev = FIELD_EX32(ri->fgt, FGT, REV);
+        bool trapbit;
+
+        if (ri->fgt & FGT_EXEC) {
+            assert(idx < ARRAY_SIZE(env->cp15.fgt_exec));
+            trapword = env->cp15.fgt_exec[idx];
+        } else if (isread && (ri->fgt & FGT_R)) {
+            assert(idx < ARRAY_SIZE(env->cp15.fgt_read));
+            trapword = env->cp15.fgt_read[idx];
+        } else if (!isread && (ri->fgt & FGT_W)) {
+            assert(idx < ARRAY_SIZE(env->cp15.fgt_write));
+            trapword = env->cp15.fgt_write[idx];
+        }
+
+        trapbit = extract64(trapword, bitpos, 1);
+        if (trapbit != rev) {
+            res = CP_ACCESS_TRAP_EL2;
+            goto fail;
+        }
+    }
+
     if (likely(res == CP_ACCESS_OK)) {
         return ri;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 52b1b8a1f0a..a47dab4f1dd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1962,7 +1962,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     }
 
-    if (ri->accessfn) {
+    if (ri->accessfn || (ri->fgt && s->fgt_active)) {
         /* Emit code to perform further access permissions checks at
          * runtime; this may result in an exception.
          */
@@ -14741,6 +14741,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
+    dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f4bfe55158e..3f51dc6a6bf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4815,6 +4815,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     }
 
     if ((s->hstr_active && s->current_el == 0) || ri->accessfn ||
+        (ri->fgt && s->fgt_active) ||
         (arm_dc_feature(s, ARM_FEATURE_XSCALE) && cpnum < 14)) {
         /*
          * Emit code to perform further access permissions checks at
@@ -9415,6 +9416,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
+    dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.34.1


