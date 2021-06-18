Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3983F3ACD5D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:17:27 +0200 (CEST)
Received: from localhost ([::1]:37992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFJG-0008OB-3z
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCq-0007bN-CX
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCV-0001zI-H6
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d11so8561769wrm.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pdDFPpgX1DSvL1znGtOeU+Ms4xKNu5wOownWiji9ZnU=;
 b=AuaBHIMyju4hJnW94jAAuFQLjoexiqfWc6xI/fvoKkJvlN4A+MMnaWH21LBpqcZE8X
 W7vPwPtmpO5KhTz1H4u+W9P4leTQxMccJoK5thB5I5oet7TsBKPd6VNcuR/2fw87zSBB
 OVvCtee6fyOkmk5oif3qgshSvx7dRdBxU63IFWu8HaJupeEID52YDRRCKKLqlPLQW0Vf
 VjLsue0xpo/Dn6X1KVbqSu3NhlVYF7G/USqp1O4NGQY+FY+6nhL114hTU37VFdv6vkvh
 +HarR4VP+DfOPdb2Dl+5WOP8dn2TKNWIiUaqyPjMZfFFBL3crA1qQuWVuIxQzApwzr9z
 tScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdDFPpgX1DSvL1znGtOeU+Ms4xKNu5wOownWiji9ZnU=;
 b=JXtxnszMPzHUQ4n/FRhGTBB49dadXhjDyjqRxaSmsjs33BHolEYAtDBx6UGzU9bpL9
 MkoT9sL9BpMrUU1e9vXGC++P3KVNlA3aFkhSRz94bThRavpNswyK8vf0N2qODWLr32YH
 s1Wh0okPcPSjk+isDyv3WkRXKfgUAXtNFksY5Tlxue6FJOsGyEJ5lC8aOMCi9rCElT+j
 qqBsGaz6Vn4B8PvKwr/uQWGSZZqOmG/ueKR/T8NBYKPJWGFB55koAZJ93iGqc8Cchwlu
 iB4PFQyUsHwn8/h7iV8pm6XxaYwlBan7+Sdq9EhFl6ztHciberSS/c8RjaFZNnhLHur1
 7S+A==
X-Gm-Message-State: AOAM532KPj5LSXXGG6Q9I9LMqeF2KAgemV//zfy7lpENpkdqJ8TCnb2F
 McaEXq192ur3fYTetJfW03IC2fzlpe+kBVGQ
X-Google-Smtp-Source: ABdhPJxwvUsJhyrBRDi00DI2E61DSv0Q0JR/k4wGPB6vDJZqeL/OFx+4I8gtYop2bALJFm14qOzHyw==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr12817612wrr.71.1624025424444; 
 Fri, 18 Jun 2021 07:10:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/7] target/arm: Don't NOCP fault for FPCXT_NS accesses
Date: Fri, 18 Jun 2021 15:10:15 +0100
Message-Id: <20210618141019.10671-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The M-profile architecture requires that accesses to FPCXT_NS when
there is no active FP state must not take a NOCP fault even if the
FPU is disabled. We were not implementing this correctly, because
in our decode we catch the NOCP faults early in m-nocp.decode.

Fix this bug by moving all the handling of M-profile FP system
register accesses from vfp.decode into m-nocp.decode and putting
it above the NOCP blocks. This provides the correct behaviour:
 * for accesses other than FPCXT_NS the trans functions call
   vfp_access_check(), which will check for FPU disabled and
   raise a NOCP exception if necessary
 * for FPCXT_NS we have the special case code that doesn't
   call vfp_access_check()
 * when these trans functions want to raise an UNDEF they return
   false, so the decoder will fall through into the NOCP blocks.
   This means that NOCP correctly takes precedence over UNDEF
   for these insns. (This is a difference from the other insns
   handled by m-nocp.decode, where UNDEF takes precedence and
   which we implement by having those trans functions call
   unallocated_encoding() in the appropriate places.)

[Note for backport to stable: this commit has a semantic dependency
on commit 9a486856e9173af, which was not marked as cc-stable because
we didn't know we'd need it for a for-stable bugfix.]

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A big patch, but it's almost entirely code movement.
---
 target/arm/translate-a32.h    |   1 +
 target/arm/m-nocp.decode      |  24 ++
 target/arm/vfp.decode         |  14 -
 target/arm/translate-m-nocp.c | 514 +++++++++++++++++++++++++++++++++
 target/arm/translate-vfp.c    | 517 +---------------------------------
 5 files changed, 542 insertions(+), 528 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 0a0053949f5..abb3ecb6bc9 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -32,6 +32,7 @@ bool disas_neon_shared(DisasContext *s, uint32_t insn);
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
 bool vfp_access_check(DisasContext *s);
+void gen_preserve_fp_state(DisasContext *s);
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
 void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
 void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index 6699626d7cb..b65c801c97c 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -34,6 +34,14 @@
 
 &nocp cp
 
+# M-profile VLDR/VSTR to sysreg
+%vldr_sysreg 22:1 13:3
+%imm7_0x4 0:7 !function=times_4
+
+&vldr_sysreg rn reg imm a w p
+@vldr_sysreg .... ... . a:1 . . . rn:4 ... . ... .. ....... \
+             reg=%vldr_sysreg imm=%imm7_0x4 &vldr_sysreg
+
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
   VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 op:1 000 0000
@@ -41,6 +49,22 @@
   VSCCLRM      1110 1100 1.01 1111 .... 1011 imm:7 0   vd=%vd_dp size=3
   VSCCLRM      1110 1100 1.01 1111 .... 1010 imm:8     vd=%vd_sp size=2
 
+  # FP system register accesses: these are a special case because accesses
+  # to FPCXT_NS succeed even if the FPU is disabled. We therefore need
+  # to handle them before the big NOCP blocks. Note that within these
+  # insns NOCP still has higher priority than UNDEFs; this is implemented
+  # by their returning 'false' for UNDEF so as to fall through into the
+  # NOCP check (in contrast to VLLDM etc, which call unallocated_encoding()
+  # for the UNDEFs there that must take precedence over NOCP.)
+
+  VMSR_VMRS    ---- 1110 111 l:1 reg:4 rt:4 1010 0001 0000
+
+  # P=0 W=0 is SEE "Related encodings", so split into two patterns
+  VLDR_sysreg  ---- 110 1 . . w:1 1 .... ... 0 111 11 ....... @vldr_sysreg p=1
+  VLDR_sysreg  ---- 110 0 . . 1   1 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+  VSTR_sysreg  ---- 110 1 . . w:1 0 .... ... 0 111 11 ....... @vldr_sysreg p=1
+  VSTR_sysreg  ---- 110 0 . . 1   0 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+
   NOCP         111- 1110 ---- ---- ---- cp:4 ---- ---- &nocp
   NOCP         111- 110- ---- ---- ---- cp:4 ---- ---- &nocp
   # From v8.1M onwards this range will also NOCP:
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 52535d9b0b8..5405e80197b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -84,20 +84,6 @@ VLDR_VSTR_hp ---- 1101 u:1 .0 l:1 rn:4 .... 1001 imm:8      vd=%vd_sp
 VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8      vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8      vd=%vd_dp
 
-# M-profile VLDR/VSTR to sysreg
-%vldr_sysreg 22:1 13:3
-%imm7_0x4 0:7 !function=times_4
-
-&vldr_sysreg rn reg imm a w p
-@vldr_sysreg .... ... . a:1 . . . rn:4 ... . ... .. ....... \
-             reg=%vldr_sysreg imm=%imm7_0x4 &vldr_sysreg
-
-# P=0 W=0 is SEE "Related encodings", so split into two patterns
-VLDR_sysreg  ---- 110 1 . . w:1 1 .... ... 0 111 11 ....... @vldr_sysreg p=1
-VLDR_sysreg  ---- 110 0 . . 1   1 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
-VSTR_sysreg  ---- 110 1 . . w:1 0 .... ... 0 111 11 ....... @vldr_sysreg p=1
-VSTR_sysreg  ---- 110 0 . . 1   0 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
-
 # We split the load/store multiple up into two patterns to avoid
 # overlap with other insns in the "Advanced SIMD load/store and 64-bit move"
 # grouping:
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 09b3be4ed31..17fd2bf2fb9 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "translate.h"
 #include "translate-a32.h"
 
@@ -191,6 +192,519 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     return true;
 }
 
+/*
+ * M-profile provides two different sets of instructions that can
+ * access floating point system registers: VMSR/VMRS (which move
+ * to/from a general purpose register) and VLDR/VSTR sysreg (which
+ * move directly to/from memory). In some cases there are also side
+ * effects which must happen after any write to memory (which could
+ * cause an exception). So we implement the common logic for the
+ * sysreg access in gen_M_fp_sysreg_write() and gen_M_fp_sysreg_read(),
+ * which take pointers to callback functions which will perform the
+ * actual "read/write general purpose register" and "read/write
+ * memory" operations.
+ */
+
+/*
+ * Emit code to store the sysreg to its final destination; frees the
+ * TCG temp 'value' it is passed.
+ */
+typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
+/*
+ * Emit code to load the value to be copied to the sysreg; returns
+ * a new TCG temporary
+ */
+typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
+
+/* Common decode/access checks for fp sysreg read/write */
+typedef enum FPSysRegCheckResult {
+    FPSysRegCheckFailed, /* caller should return false */
+    FPSysRegCheckDone, /* caller should return true */
+    FPSysRegCheckContinue, /* caller should continue generating code */
+} FPSysRegCheckResult;
+
+static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
+{
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
+        return FPSysRegCheckFailed;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+    case QEMU_VFP_FPSCR_NZCV:
+        break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return FPSysRegCheckFailed;
+        }
+        break;
+    case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return FPSysRegCheckFailed;
+        }
+        if (!s->v8m_secure) {
+            return FPSysRegCheckFailed;
+        }
+        break;
+    case ARM_VFP_VPR:
+    case ARM_VFP_P0:
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return FPSysRegCheckFailed;
+        }
+        break;
+    default:
+        return FPSysRegCheckFailed;
+    }
+
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * So we don't call vfp_access_check() and the callers must handle this.
+     */
+    if (regno != ARM_VFP_FPCXT_NS && !vfp_access_check(s)) {
+        return FPSysRegCheckDone;
+    }
+    return FPSysRegCheckContinue;
+}
+
+static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
+                                  TCGLabel *label)
+{
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * We don't have a TB flag that matches the fpInactive check, so we
+     * do it at runtime as we don't expect FPCXT_NS accesses to be frequent.
+     *
+     * Emit code that checks fpInactive and does a conditional
+     * branch to label based on it:
+     *  if cond is TCG_COND_NE then branch if fpInactive != 0 (ie if inactive)
+     *  if cond is TCG_COND_EQ then branch if fpInactive == 0 (ie if active)
+     */
+    assert(cond == TCG_COND_EQ || cond == TCG_COND_NE);
+
+    /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
+    TCGv_i32 aspen, fpca;
+    aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
+    fpca = load_cpu_field(v7m.control[M_REG_S]);
+    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
+    tcg_gen_or_i32(fpca, fpca, aspen);
+    tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
+    tcg_temp_free_i32(aspen);
+    tcg_temp_free_i32(fpca);
+}
+
+static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
+                                  fp_sysreg_loadfn *loadfn,
+                                  void *opaque)
+{
+    /* Do a write to an M-profile floating point system register */
+    TCGv_i32 tmp;
+    TCGLabel *lab_end = NULL;
+
+    switch (fp_sysreg_checks(s, regno)) {
+    case FPSysRegCheckFailed:
+        return false;
+    case FPSysRegCheckDone:
+        return true;
+    case FPSysRegCheckContinue:
+        break;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+        tmp = loadfn(s, opaque);
+        gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        tcg_temp_free_i32(tmp);
+        gen_lookup_tb(s);
+        break;
+    case ARM_VFP_FPSCR_NZCVQC:
+    {
+        TCGv_i32 fpscr;
+        tmp = loadfn(s, opaque);
+        if (dc_isar_feature(aa32_mve, s)) {
+            /* QC is only present for MVE; otherwise RES0 */
+            TCGv_i32 qc = tcg_temp_new_i32();
+            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
+            /*
+             * The 4 vfp.qc[] fields need only be "zero" vs "non-zero";
+             * here writing the same value into all elements is simplest.
+             */
+            tcg_gen_gvec_dup_i32(MO_32, offsetof(CPUARMState, vfp.qc),
+                                 16, 16, qc);
+        }
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
+        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
+        tcg_gen_or_i32(fpscr, fpscr, tmp);
+        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
+    case ARM_VFP_FPCXT_NS:
+        lab_end = gen_new_label();
+        /* fpInactive case: write is a NOP, so branch to end */
+        gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS writes
+         * behave the same as FPCXT_S writes.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
+        gen_preserve_fp_state(s);
+        /* fall through */
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 sfpa, control;
+        /*
+         * Set FPSCR and CONTROL.SFPA from value; the new FPSCR takes
+         * bits [27:0] from value and zeroes bits [31:28].
+         */
+        tmp = loadfn(s, opaque);
+        sfpa = tcg_temp_new_i32();
+        tcg_gen_shri_i32(sfpa, tmp, 31);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_deposit_i32(control, control, sfpa,
+                            R_V7M_CONTROL_SFPA_SHIFT, 1);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        tcg_temp_free_i32(tmp);
+        tcg_temp_free_i32(sfpa);
+        break;
+    }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = loadfn(s, opaque);
+        store_cpu_field(tmp, v7m.vpr);
+        break;
+    case ARM_VFP_P0:
+    {
+        TCGv_i32 vpr;
+        tmp = loadfn(s, opaque);
+        vpr = load_cpu_field(v7m.vpr);
+        tcg_gen_deposit_i32(vpr, vpr, tmp,
+                            R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        store_cpu_field(vpr, v7m.vpr);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
+    default:
+        g_assert_not_reached();
+    }
+    if (lab_end) {
+        gen_set_label(lab_end);
+    }
+    return true;
+}
+
+static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
+                                 fp_sysreg_storefn *storefn,
+                                 void *opaque)
+{
+    /* Do a read from an M-profile floating point system register */
+    TCGv_i32 tmp;
+    TCGLabel *lab_end = NULL;
+    bool lookup_tb = false;
+
+    switch (fp_sysreg_checks(s, regno)) {
+    case FPSysRegCheckFailed:
+        return false;
+    case FPSysRegCheckDone:
+        return true;
+    case FPSysRegCheckContinue:
+        break;
+    }
+
+    if (regno == ARM_VFP_FPSCR_NZCVQC && !dc_isar_feature(aa32_mve, s)) {
+        /* QC is RES0 without MVE, so NZCVQC simplifies to NZCV */
+        regno = QEMU_VFP_FPSCR_NZCV;
+    }
+
+    switch (regno) {
+    case ARM_VFP_FPSCR:
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        storefn(s, opaque, tmp);
+        break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
+        storefn(s, opaque, tmp);
+        break;
+    case QEMU_VFP_FPSCR_NZCV:
+        /*
+         * Read just NZCV; this is a special case to avoid the
+         * helper call for the "VMRS to CPSR.NZCV" insn.
+         */
+        tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
+        storefn(s, opaque, tmp);
+        break;
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 control, sfpa, fpscr;
+        /* Bits [27:0] from FPSCR, bit [31] from CONTROL.SFPA */
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(sfpa);
+        /*
+         * Store result before updating FPSCR etc, in case
+         * it is a memory write which causes an exception.
+         */
+        storefn(s, opaque, tmp);
+        /*
+         * Now we must reset FPSCR from FPDSCR_NS, and clear
+         * CONTROL.SFPA; so we'll end the TB here.
+         */
+        tcg_gen_andi_i32(control, control, ~R_V7M_CONTROL_SFPA_MASK);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(fpscr);
+        lookup_tb = true;
+        break;
+    }
+    case ARM_VFP_FPCXT_NS:
+    {
+        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
+        TCGLabel *lab_active = gen_new_label();
+
+        lookup_tb = true;
+
+        gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
+        /* fpInactive case: reads as FPDSCR_NS */
+        TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        storefn(s, opaque, tmp);
+        lab_end = gen_new_label();
+        tcg_gen_br(lab_end);
+
+        gen_set_label(lab_active);
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS
+         * reads the same as FPCXT_S.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
+        gen_preserve_fp_state(s);
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        fpscr = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(fpscr, cpu_env);
+        tcg_gen_andi_i32(tmp, fpscr, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(control);
+        /* Store result before updating FPSCR, in case it faults */
+        storefn(s, opaque, tmp);
+        /* If SFPA is zero then set FPSCR from FPDSCR_NS */
+        fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        zero = tcg_const_i32(0);
+        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(zero);
+        tcg_temp_free_i32(sfpa);
+        tcg_temp_free_i32(fpdscr);
+        tcg_temp_free_i32(fpscr);
+        break;
+    }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = load_cpu_field(v7m.vpr);
+        storefn(s, opaque, tmp);
+        break;
+    case ARM_VFP_P0:
+        tmp = load_cpu_field(v7m.vpr);
+        tcg_gen_extract_i32(tmp, tmp, R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        storefn(s, opaque, tmp);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (lab_end) {
+        gen_set_label(lab_end);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
+    return true;
+}
+
+static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value)
+{
+    arg_VMSR_VMRS *a = opaque;
+
+    if (a->rt == 15) {
+        /* Set the 4 flag bits in the CPSR */
+        gen_set_nzcv(value);
+        tcg_temp_free_i32(value);
+    } else {
+        store_reg(s, a->rt, value);
+    }
+}
+
+static TCGv_i32 gpr_to_fp_sysreg(DisasContext *s, void *opaque)
+{
+    arg_VMSR_VMRS *a = opaque;
+
+    return load_reg(s, a->rt);
+}
+
+static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
+{
+    /*
+     * Accesses to R15 are UNPREDICTABLE; we choose to undef.
+     * FPSCR -> r15 is a special case which writes to the PSR flags;
+     * set a->reg to a special value to tell gen_M_fp_sysreg_read()
+     * we only care about the top 4 bits of FPSCR there.
+     */
+    if (a->rt == 15) {
+        if (a->l && a->reg == ARM_VFP_FPSCR) {
+            a->reg = QEMU_VFP_FPSCR_NZCV;
+        } else {
+            return false;
+        }
+    }
+
+    if (a->l) {
+        /* VMRS, move FP system register to gp register */
+        return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_gpr, a);
+    } else {
+        /* VMSR, move gp register to FP system register */
+        return gen_M_fp_sysreg_write(s, a->reg, gpr_to_fp_sysreg, a);
+    }
+}
+
+static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+
+    if (!a->a) {
+        offset = -offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
+    tcg_temp_free_i32(value);
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+}
+
+static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+    TCGv_i32 value = tcg_temp_new_i32();
+
+    if (!a->a) {
+        offset = -offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_ld_i32(s, value, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+    return value;
+}
+
+static bool trans_VLDR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_write(s, a->reg, memory_to_fp_sysreg, a);
+}
+
+static bool trans_VSTR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_memory, a);
+}
+
 static bool trans_NOCP(DisasContext *s, arg_nocp *a)
 {
     /*
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 107d6143be8..8987ef2e5b9 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -109,7 +109,7 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
  * Generate code for M-profile lazy FP state preservation if needed;
  * this corresponds to the pseudocode PreserveFPState() function.
  */
-static void gen_preserve_fp_state(DisasContext *s)
+void gen_preserve_fp_state(DisasContext *s)
 {
     if (s->v7m_lspact) {
         /*
@@ -663,435 +663,14 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
-/*
- * M-profile provides two different sets of instructions that can
- * access floating point system registers: VMSR/VMRS (which move
- * to/from a general purpose register) and VLDR/VSTR sysreg (which
- * move directly to/from memory). In some cases there are also side
- * effects which must happen after any write to memory (which could
- * cause an exception). So we implement the common logic for the
- * sysreg access in gen_M_fp_sysreg_write() and gen_M_fp_sysreg_read(),
- * which take pointers to callback functions which will perform the
- * actual "read/write general purpose register" and "read/write
- * memory" operations.
- */
-
-/*
- * Emit code to store the sysreg to its final destination; frees the
- * TCG temp 'value' it is passed.
- */
-typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
-/*
- * Emit code to load the value to be copied to the sysreg; returns
- * a new TCG temporary
- */
-typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
-
-/* Common decode/access checks for fp sysreg read/write */
-typedef enum FPSysRegCheckResult {
-    FPSysRegCheckFailed, /* caller should return false */
-    FPSysRegCheckDone, /* caller should return true */
-    FPSysRegCheckContinue, /* caller should continue generating code */
-} FPSysRegCheckResult;
-
-static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
-{
-    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
-        return FPSysRegCheckFailed;
-    }
-
-    switch (regno) {
-    case ARM_VFP_FPSCR:
-    case QEMU_VFP_FPSCR_NZCV:
-        break;
-    case ARM_VFP_FPSCR_NZCVQC:
-        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return FPSysRegCheckFailed;
-        }
-        break;
-    case ARM_VFP_FPCXT_S:
-    case ARM_VFP_FPCXT_NS:
-        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return FPSysRegCheckFailed;
-        }
-        if (!s->v8m_secure) {
-            return FPSysRegCheckFailed;
-        }
-        break;
-    case ARM_VFP_VPR:
-    case ARM_VFP_P0:
-        if (!dc_isar_feature(aa32_mve, s)) {
-            return FPSysRegCheckFailed;
-        }
-        break;
-    default:
-        return FPSysRegCheckFailed;
-    }
-
-    /*
-     * FPCXT_NS is a special case: it has specific handling for
-     * "current FP state is inactive", and must do the PreserveFPState()
-     * but not the usual full set of actions done by ExecuteFPCheck().
-     * So we don't call vfp_access_check() and the callers must handle this.
-     */
-    if (regno != ARM_VFP_FPCXT_NS && !vfp_access_check(s)) {
-        return FPSysRegCheckDone;
-    }
-    return FPSysRegCheckContinue;
-}
-
-static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
-                                  TCGLabel *label)
-{
-    /*
-     * FPCXT_NS is a special case: it has specific handling for
-     * "current FP state is inactive", and must do the PreserveFPState()
-     * but not the usual full set of actions done by ExecuteFPCheck().
-     * We don't have a TB flag that matches the fpInactive check, so we
-     * do it at runtime as we don't expect FPCXT_NS accesses to be frequent.
-     *
-     * Emit code that checks fpInactive and does a conditional
-     * branch to label based on it:
-     *  if cond is TCG_COND_NE then branch if fpInactive != 0 (ie if inactive)
-     *  if cond is TCG_COND_EQ then branch if fpInactive == 0 (ie if active)
-     */
-    assert(cond == TCG_COND_EQ || cond == TCG_COND_NE);
-
-    /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
-    TCGv_i32 aspen, fpca;
-    aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
-    fpca = load_cpu_field(v7m.control[M_REG_S]);
-    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
-    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
-    tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
-    tcg_gen_or_i32(fpca, fpca, aspen);
-    tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
-    tcg_temp_free_i32(aspen);
-    tcg_temp_free_i32(fpca);
-}
-
-static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
-                                  fp_sysreg_loadfn *loadfn,
-                                  void *opaque)
-{
-    /* Do a write to an M-profile floating point system register */
-    TCGv_i32 tmp;
-    TCGLabel *lab_end = NULL;
-
-    switch (fp_sysreg_checks(s, regno)) {
-    case FPSysRegCheckFailed:
-        return false;
-    case FPSysRegCheckDone:
-        return true;
-    case FPSysRegCheckContinue:
-        break;
-    }
-
-    switch (regno) {
-    case ARM_VFP_FPSCR:
-        tmp = loadfn(s, opaque);
-        gen_helper_vfp_set_fpscr(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
-        gen_lookup_tb(s);
-        break;
-    case ARM_VFP_FPSCR_NZCVQC:
-    {
-        TCGv_i32 fpscr;
-        tmp = loadfn(s, opaque);
-        if (dc_isar_feature(aa32_mve, s)) {
-            /* QC is only present for MVE; otherwise RES0 */
-            TCGv_i32 qc = tcg_temp_new_i32();
-            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
-            /*
-             * The 4 vfp.qc[] fields need only be "zero" vs "non-zero";
-             * here writing the same value into all elements is simplest.
-             */
-            tcg_gen_gvec_dup_i32(MO_32, offsetof(CPUARMState, vfp.qc),
-                                 16, 16, qc);
-        }
-        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
-        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
-        tcg_gen_or_i32(fpscr, fpscr, tmp);
-        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_temp_free_i32(tmp);
-        break;
-    }
-    case ARM_VFP_FPCXT_NS:
-        lab_end = gen_new_label();
-        /* fpInactive case: write is a NOP, so branch to end */
-        gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
-        /*
-         * !fpInactive: if FPU disabled, take NOCP exception;
-         * otherwise PreserveFPState(), and then FPCXT_NS writes
-         * behave the same as FPCXT_S writes.
-         */
-        if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
-            /*
-             * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
-             */
-            s->base.is_jmp = DISAS_NEXT;
-            break;
-        }
-        gen_preserve_fp_state(s);
-        /* fall through */
-    case ARM_VFP_FPCXT_S:
-    {
-        TCGv_i32 sfpa, control;
-        /*
-         * Set FPSCR and CONTROL.SFPA from value; the new FPSCR takes
-         * bits [27:0] from value and zeroes bits [31:28].
-         */
-        tmp = loadfn(s, opaque);
-        sfpa = tcg_temp_new_i32();
-        tcg_gen_shri_i32(sfpa, tmp, 31);
-        control = load_cpu_field(v7m.control[M_REG_S]);
-        tcg_gen_deposit_i32(control, control, sfpa,
-                            R_V7M_CONTROL_SFPA_SHIFT, 1);
-        store_cpu_field(control, v7m.control[M_REG_S]);
-        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
-        gen_helper_vfp_set_fpscr(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(sfpa);
-        break;
-    }
-    case ARM_VFP_VPR:
-        /* Behaves as NOP if not privileged */
-        if (IS_USER(s)) {
-            break;
-        }
-        tmp = loadfn(s, opaque);
-        store_cpu_field(tmp, v7m.vpr);
-        break;
-    case ARM_VFP_P0:
-    {
-        TCGv_i32 vpr;
-        tmp = loadfn(s, opaque);
-        vpr = load_cpu_field(v7m.vpr);
-        tcg_gen_deposit_i32(vpr, vpr, tmp,
-                            R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
-        store_cpu_field(vpr, v7m.vpr);
-        tcg_temp_free_i32(tmp);
-        break;
-    }
-    default:
-        g_assert_not_reached();
-    }
-    if (lab_end) {
-        gen_set_label(lab_end);
-    }
-    return true;
-}
-
-static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
-                                 fp_sysreg_storefn *storefn,
-                                 void *opaque)
-{
-    /* Do a read from an M-profile floating point system register */
-    TCGv_i32 tmp;
-    TCGLabel *lab_end = NULL;
-    bool lookup_tb = false;
-
-    switch (fp_sysreg_checks(s, regno)) {
-    case FPSysRegCheckFailed:
-        return false;
-    case FPSysRegCheckDone:
-        return true;
-    case FPSysRegCheckContinue:
-        break;
-    }
-
-    if (regno == ARM_VFP_FPSCR_NZCVQC && !dc_isar_feature(aa32_mve, s)) {
-        /* QC is RES0 without MVE, so NZCVQC simplifies to NZCV */
-        regno = QEMU_VFP_FPSCR_NZCV;
-    }
-
-    switch (regno) {
-    case ARM_VFP_FPSCR:
-        tmp = tcg_temp_new_i32();
-        gen_helper_vfp_get_fpscr(tmp, cpu_env);
-        storefn(s, opaque, tmp);
-        break;
-    case ARM_VFP_FPSCR_NZCVQC:
-        tmp = tcg_temp_new_i32();
-        gen_helper_vfp_get_fpscr(tmp, cpu_env);
-        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
-        storefn(s, opaque, tmp);
-        break;
-    case QEMU_VFP_FPSCR_NZCV:
-        /*
-         * Read just NZCV; this is a special case to avoid the
-         * helper call for the "VMRS to CPSR.NZCV" insn.
-         */
-        tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
-        storefn(s, opaque, tmp);
-        break;
-    case ARM_VFP_FPCXT_S:
-    {
-        TCGv_i32 control, sfpa, fpscr;
-        /* Bits [27:0] from FPSCR, bit [31] from CONTROL.SFPA */
-        tmp = tcg_temp_new_i32();
-        sfpa = tcg_temp_new_i32();
-        gen_helper_vfp_get_fpscr(tmp, cpu_env);
-        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
-        control = load_cpu_field(v7m.control[M_REG_S]);
-        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
-        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
-        tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(sfpa);
-        /*
-         * Store result before updating FPSCR etc, in case
-         * it is a memory write which causes an exception.
-         */
-        storefn(s, opaque, tmp);
-        /*
-         * Now we must reset FPSCR from FPDSCR_NS, and clear
-         * CONTROL.SFPA; so we'll end the TB here.
-         */
-        tcg_gen_andi_i32(control, control, ~R_V7M_CONTROL_SFPA_MASK);
-        store_cpu_field(control, v7m.control[M_REG_S]);
-        fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(fpscr);
-        lookup_tb = true;
-        break;
-    }
-    case ARM_VFP_FPCXT_NS:
-    {
-        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
-        TCGLabel *lab_active = gen_new_label();
-
-        lookup_tb = true;
-
-        gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
-        /* fpInactive case: reads as FPDSCR_NS */
-        TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        storefn(s, opaque, tmp);
-        lab_end = gen_new_label();
-        tcg_gen_br(lab_end);
-
-        gen_set_label(lab_active);
-        /*
-         * !fpInactive: if FPU disabled, take NOCP exception;
-         * otherwise PreserveFPState(), and then FPCXT_NS
-         * reads the same as FPCXT_S.
-         */
-        if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
-            /*
-             * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
-             */
-            s->base.is_jmp = DISAS_NEXT;
-            break;
-        }
-        gen_preserve_fp_state(s);
-        tmp = tcg_temp_new_i32();
-        sfpa = tcg_temp_new_i32();
-        fpscr = tcg_temp_new_i32();
-        gen_helper_vfp_get_fpscr(fpscr, cpu_env);
-        tcg_gen_andi_i32(tmp, fpscr, ~FPCR_NZCV_MASK);
-        control = load_cpu_field(v7m.control[M_REG_S]);
-        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
-        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
-        tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(control);
-        /* Store result before updating FPSCR, in case it faults */
-        storefn(s, opaque, tmp);
-        /* If SFPA is zero then set FPSCR from FPDSCR_NS */
-        fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        zero = tcg_const_i32(0);
-        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
-        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(zero);
-        tcg_temp_free_i32(sfpa);
-        tcg_temp_free_i32(fpdscr);
-        tcg_temp_free_i32(fpscr);
-        break;
-    }
-    case ARM_VFP_VPR:
-        /* Behaves as NOP if not privileged */
-        if (IS_USER(s)) {
-            break;
-        }
-        tmp = load_cpu_field(v7m.vpr);
-        storefn(s, opaque, tmp);
-        break;
-    case ARM_VFP_P0:
-        tmp = load_cpu_field(v7m.vpr);
-        tcg_gen_extract_i32(tmp, tmp, R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
-        storefn(s, opaque, tmp);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (lab_end) {
-        gen_set_label(lab_end);
-    }
-    if (lookup_tb) {
-        gen_lookup_tb(s);
-    }
-    return true;
-}
-
-static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value)
-{
-    arg_VMSR_VMRS *a = opaque;
-
-    if (a->rt == 15) {
-        /* Set the 4 flag bits in the CPSR */
-        gen_set_nzcv(value);
-        tcg_temp_free_i32(value);
-    } else {
-        store_reg(s, a->rt, value);
-    }
-}
-
-static TCGv_i32 gpr_to_fp_sysreg(DisasContext *s, void *opaque)
-{
-    arg_VMSR_VMRS *a = opaque;
-
-    return load_reg(s, a->rt);
-}
-
-static bool gen_M_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
-{
-    /*
-     * Accesses to R15 are UNPREDICTABLE; we choose to undef.
-     * FPSCR -> r15 is a special case which writes to the PSR flags;
-     * set a->reg to a special value to tell gen_M_fp_sysreg_read()
-     * we only care about the top 4 bits of FPSCR there.
-     */
-    if (a->rt == 15) {
-        if (a->l && a->reg == ARM_VFP_FPSCR) {
-            a->reg = QEMU_VFP_FPSCR_NZCV;
-        } else {
-            return false;
-        }
-    }
-
-    if (a->l) {
-        /* VMRS, move FP system register to gp register */
-        return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_gpr, a);
-    } else {
-        /* VMSR, move gp register to FP system register */
-        return gen_M_fp_sysreg_write(s, a->reg, gpr_to_fp_sysreg, a);
-    }
-}
-
 static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
 {
     TCGv_i32 tmp;
     bool ignore_vfp_enabled = false;
 
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        return gen_M_VMSR_VMRS(s, a);
+        /* M profile version was already handled in m-nocp.decode */
+        return false;
     }
 
     if (!dc_isar_feature(aa32_fpsp_v2, s)) {
@@ -1227,96 +806,6 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     return true;
 }
 
-static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
-{
-    arg_vldr_sysreg *a = opaque;
-    uint32_t offset = a->imm;
-    TCGv_i32 addr;
-
-    if (!a->a) {
-        offset = -offset;
-    }
-
-    addr = load_reg(s, a->rn);
-    if (a->p) {
-        tcg_gen_addi_i32(addr, addr, offset);
-    }
-
-    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
-        gen_helper_v8m_stackcheck(cpu_env, addr);
-    }
-
-    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
-                    MO_UL | MO_ALIGN | s->be_data);
-    tcg_temp_free_i32(value);
-
-    if (a->w) {
-        /* writeback */
-        if (!a->p) {
-            tcg_gen_addi_i32(addr, addr, offset);
-        }
-        store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
-    }
-}
-
-static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
-{
-    arg_vldr_sysreg *a = opaque;
-    uint32_t offset = a->imm;
-    TCGv_i32 addr;
-    TCGv_i32 value = tcg_temp_new_i32();
-
-    if (!a->a) {
-        offset = -offset;
-    }
-
-    addr = load_reg(s, a->rn);
-    if (a->p) {
-        tcg_gen_addi_i32(addr, addr, offset);
-    }
-
-    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
-        gen_helper_v8m_stackcheck(cpu_env, addr);
-    }
-
-    gen_aa32_ld_i32(s, value, addr, get_mem_index(s),
-                    MO_UL | MO_ALIGN | s->be_data);
-
-    if (a->w) {
-        /* writeback */
-        if (!a->p) {
-            tcg_gen_addi_i32(addr, addr, offset);
-        }
-        store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
-    }
-    return value;
-}
-
-static bool trans_VLDR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
-{
-    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-        return false;
-    }
-    if (a->rn == 15) {
-        return false;
-    }
-    return gen_M_fp_sysreg_write(s, a->reg, memory_to_fp_sysreg, a);
-}
-
-static bool trans_VSTR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
-{
-    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-        return false;
-    }
-    if (a->rn == 15) {
-        return false;
-    }
-    return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_memory, a);
-}
 
 static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
 {
-- 
2.20.1


