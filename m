Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC3E1FAD4D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:00:55 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8Ok-00043l-9k
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8LJ-0007HD-Jl
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:57:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8LH-000425-Cg
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:57:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id u26so1881918wmn.1
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d7cEsgwpvRU2TW3zHAQvhmmsiX9gJU2CU19aFla+ln0=;
 b=QVQoUfciahBgoDCcCLlZvs72EeHLvhdL23Ude7Y8FvdjMbqaMD7YZQoP5TXGTvrLZS
 tjEKmZAmJk1GNB0e/wgB2Jka0ICLa3Bf29+aIuavlbn8gvUd2Si4dcGCE1NYBXuEs/9b
 wC9b2TiyhHhkxR4+DyW+eX8WhMLj6wIgA/pElaM8/T3N0HV/Bd1PctbUs8Mj9Y3oHHjm
 D+aUFRsIWkTNb3GPsZuW7uUXv/4s2lVysGKh2SDQTY8SlG9HimHv00X+ri4l0mkCNqIq
 7xa5AAzlA6ieIHaYVDf8+excgDyL4Cm37Enmtnxlsh+wDeeUQcyt4x8rIb33gQyJExZ5
 Hzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d7cEsgwpvRU2TW3zHAQvhmmsiX9gJU2CU19aFla+ln0=;
 b=UYIu5wpptC4i80cPtu1b/9mGJ7b6R9CTgy6F0dltdc/ERAJkkVFkb0Ra7OhOh4AqRS
 Nr+DrwBPvc0B6ttS5nFKTP72GKOAJyFP9WKW64OWa+s2MgsC0WkfsXtsRDh00vXYSymy
 4hEXVdahvqAqVewdZ82U0NP99uZi8p2vpKUuUgb7rmfyegQY57me3O9MfruVSVxUCtV7
 kZeq7kmUmETLIgzUtdDmjUTDn5XgQsMJtNmvgvHb9CiOW4+rxCRyMQ0SUq5T7A9nvrw4
 0jjL0p7iwOwAV46KjyPne7Pp7SvIpb/kQOljPfNPC7AJYLxjK8YOf5fcnxVsCyAQARp7
 emBQ==
X-Gm-Message-State: AOAM530CSn3OPHgiZaSwrDRPIBR6jvT/vmxe2MXmbJSJpmfc/BQkYlM9
 x/Q/lpeRLPsC2ApewUtNCECyvLeZhfm6Kg==
X-Google-Smtp-Source: ABdhPJyL32aEFAQ7bmFnFkIghE7qrFOYwcXfWzEeHS1OaDGPDv6XSCWtLDxjsrsE/xD8LV4BOS4NiQ==
X-Received: by 2002:a1c:3286:: with SMTP id y128mr2232655wmy.29.1592301437384; 
 Tue, 16 Jun 2020 02:57:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z12sm31090851wrg.9.2020.06.16.02.57.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:57:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] target/arm: Convert Neon 2-reg-scalar integer multiplies
 to decodetree
Date: Tue, 16 Jun 2020 10:56:49 +0100
Message-Id: <20200616095702.25848-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616095702.25848-1-peter.maydell@linaro.org>
References: <20200616095702.25848-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Convert the VMLA, VMLS and VMUL insns in the Neon "2 registers and a
scalar" group to decodetree.  These are 32x32->32 operations where
one of the inputs is the scalar, followed by a possible accumulate
operation of the 32-bit result.

The refactoring removes some of the oddities of the old decoder:
 * operands to the operation and accumulation were often
   reversed (taking advantage of the fact that most of these ops
   are commutative); the new code follows the pseudocode order
 * the Q bit in the insn was in a local variable 'u'; in the
   new code it is decoded into a->q

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  15 ++++
 target/arm/translate-neon.inc.c | 133 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          |  77 ++----------------
 3 files changed, 154 insertions(+), 71 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index ed49726abf5..983747b785f 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -467,5 +467,20 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
     VQDMULL_3d   1111 001 0 1 . .. .... .... 1101 . 0 . 0 .... @3diff
 
     VMULL_P_3d   1111 001 0 1 . .. .... .... 1110 . 0 . 0 .... @3diff
+
+    ##################################################################
+    # 2-regs-plus-scalar grouping:
+    # 1111 001 Q 1 D sz!=11 Vn:4 Vd:4 opc:4 N 1 M 0 Vm:4
+    ##################################################################
+    &2scalar vm vn vd size q
+
+    @2scalar     .... ... q:1 . . size:2 .... .... .... . . . . .... \
+                 &2scalar vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+    VMLA_2sc     1111 001 . 1 . .. .... .... 0000 . 1 . 0 .... @2scalar
+
+    VMLS_2sc     1111 001 . 1 . .. .... .... 0100 . 1 . 0 .... @2scalar
+
+    VMUL_2sc     1111 001 . 1 . .. .... .... 1000 . 1 . 0 .... @2scalar
   ]
 }
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index f2c241a87e9..478a0dd5c1d 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -2348,3 +2348,136 @@ static bool trans_VMULL_P_3d(DisasContext *s, arg_3diff *a)
                        16, 16, 0, fn_gvec);
     return true;
 }
+
+static void gen_neon_dup_low16(TCGv_i32 var)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_ext16u_i32(var, var);
+    tcg_gen_shli_i32(tmp, var, 16);
+    tcg_gen_or_i32(var, var, tmp);
+    tcg_temp_free_i32(tmp);
+}
+
+static void gen_neon_dup_high16(TCGv_i32 var)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_andi_i32(var, var, 0xffff0000);
+    tcg_gen_shri_i32(tmp, var, 16);
+    tcg_gen_or_i32(var, var, tmp);
+    tcg_temp_free_i32(tmp);
+}
+
+static inline TCGv_i32 neon_get_scalar(int size, int reg)
+{
+    TCGv_i32 tmp;
+    if (size == 1) {
+        tmp = neon_load_reg(reg & 7, reg >> 4);
+        if (reg & 8) {
+            gen_neon_dup_high16(tmp);
+        } else {
+            gen_neon_dup_low16(tmp);
+        }
+    } else {
+        tmp = neon_load_reg(reg & 15, reg >> 4);
+    }
+    return tmp;
+}
+
+static bool do_2scalar(DisasContext *s, arg_2scalar *a,
+                       NeonGenTwoOpFn *opfn, NeonGenTwoOpFn *accfn)
+{
+    /*
+     * Two registers and a scalar: perform an operation between
+     * the input elements and the scalar, and then possibly
+     * perform an accumulation operation of that result into the
+     * destination.
+     */
+    TCGv_i32 scalar;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!opfn) {
+        /* Bad size (including size == 3, which is a different insn group) */
+        return false;
+    }
+
+    if (a->q && ((a->vd | a->vn) & 1)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    scalar = neon_get_scalar(a->size, a->vm);
+
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        TCGv_i32 tmp = neon_load_reg(a->vn, pass);
+        opfn(tmp, tmp, scalar);
+        if (accfn) {
+            TCGv_i32 rd = neon_load_reg(a->vd, pass);
+            accfn(tmp, rd, tmp);
+            tcg_temp_free_i32(rd);
+        }
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    tcg_temp_free_i32(scalar);
+    return true;
+}
+
+static bool trans_VMUL_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenTwoOpFn * const opfn[] = {
+        NULL,
+        gen_helper_neon_mul_u16,
+        tcg_gen_mul_i32,
+        NULL,
+    };
+
+    return do_2scalar(s, a, opfn[a->size], NULL);
+}
+
+static bool trans_VMLA_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenTwoOpFn * const opfn[] = {
+        NULL,
+        gen_helper_neon_mul_u16,
+        tcg_gen_mul_i32,
+        NULL,
+    };
+    static NeonGenTwoOpFn * const accfn[] = {
+        NULL,
+        gen_helper_neon_add_u16,
+        tcg_gen_add_i32,
+        NULL,
+    };
+
+    return do_2scalar(s, a, opfn[a->size], accfn[a->size]);
+}
+
+static bool trans_VMLS_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenTwoOpFn * const opfn[] = {
+        NULL,
+        gen_helper_neon_mul_u16,
+        tcg_gen_mul_i32,
+        NULL,
+    };
+    static NeonGenTwoOpFn * const accfn[] = {
+        NULL,
+        gen_helper_neon_sub_u16,
+        tcg_gen_sub_i32,
+        NULL,
+    };
+
+    return do_2scalar(s, a, opfn[a->size], accfn[a->size]);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f459fad8646..e9cc237ef80 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2624,24 +2624,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
 #define VFP_DREG_N(reg, insn) VFP_DREG(reg, insn, 16,  7)
 #define VFP_DREG_M(reg, insn) VFP_DREG(reg, insn,  0,  5)
 
-static void gen_neon_dup_low16(TCGv_i32 var)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_ext16u_i32(var, var);
-    tcg_gen_shli_i32(tmp, var, 16);
-    tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
-}
-
-static void gen_neon_dup_high16(TCGv_i32 var)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_andi_i32(var, var, 0xffff0000);
-    tcg_gen_shri_i32(tmp, var, 16);
-    tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
-}
-
 static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
 {
 #ifndef CONFIG_USER_ONLY
@@ -2991,26 +2973,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
 
 #define CPU_V001 cpu_V0, cpu_V0, cpu_V1
 
-static inline void gen_neon_add(int size, TCGv_i32 t0, TCGv_i32 t1)
-{
-    switch (size) {
-    case 0: gen_helper_neon_add_u8(t0, t0, t1); break;
-    case 1: gen_helper_neon_add_u16(t0, t0, t1); break;
-    case 2: tcg_gen_add_i32(t0, t0, t1); break;
-    default: abort();
-    }
-}
-
-static inline void gen_neon_rsb(int size, TCGv_i32 t0, TCGv_i32 t1)
-{
-    switch (size) {
-    case 0: gen_helper_neon_sub_u8(t0, t1, t0); break;
-    case 1: gen_helper_neon_sub_u16(t0, t1, t0); break;
-    case 2: tcg_gen_sub_i32(t0, t1, t0); break;
-    default: return;
-    }
-}
-
 static TCGv_i32 neon_load_scratch(int scratch)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
@@ -3024,22 +2986,6 @@ static void neon_store_scratch(int scratch, TCGv_i32 var)
     tcg_temp_free_i32(var);
 }
 
-static inline TCGv_i32 neon_get_scalar(int size, int reg)
-{
-    TCGv_i32 tmp;
-    if (size == 1) {
-        tmp = neon_load_reg(reg & 7, reg >> 4);
-        if (reg & 8) {
-            gen_neon_dup_high16(tmp);
-        } else {
-            gen_neon_dup_low16(tmp);
-        }
-    } else {
-        tmp = neon_load_reg(reg & 15, reg >> 4);
-    }
-    return tmp;
-}
-
 static int gen_neon_unzip(int rd, int rm, int size, int q)
 {
     TCGv_ptr pd, pm;
@@ -5238,6 +5184,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     return 1;
                 }
                 switch (op) {
+                case 0: /* Integer VMLA scalar */
+                case 4: /* Integer VMLS scalar */
+                case 8: /* Integer VMUL scalar */
+                    return 1; /* handled by decodetree */
+
                 case 1: /* Float VMLA scalar */
                 case 5: /* Floating point VMLS scalar */
                 case 9: /* Floating point VMUL scalar */
@@ -5245,9 +5196,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         return 1;
                     }
                     /* fall through */
-                case 0: /* Integer VMLA scalar */
-                case 4: /* Integer VMLS scalar */
-                case 8: /* Integer VMUL scalar */
                 case 12: /* VQDMULH scalar */
                 case 13: /* VQRDMULH scalar */
                     if (u && ((rd | rn) & 1)) {
@@ -5270,26 +5218,16 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                             } else {
                                 gen_helper_neon_qrdmulh_s32(tmp, cpu_env, tmp, tmp2);
                             }
-                        } else if (op & 1) {
+                        } else {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
                             gen_helper_vfp_muls(tmp, tmp, tmp2, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
-                        } else {
-                            switch (size) {
-                            case 0: gen_helper_neon_mul_u8(tmp, tmp, tmp2); break;
-                            case 1: gen_helper_neon_mul_u16(tmp, tmp, tmp2); break;
-                            case 2: tcg_gen_mul_i32(tmp, tmp, tmp2); break;
-                            default: abort();
-                            }
                         }
                         tcg_temp_free_i32(tmp2);
                         if (op < 8) {
                             /* Accumulate.  */
                             tmp2 = neon_load_reg(rd, pass);
                             switch (op) {
-                            case 0:
-                                gen_neon_add(size, tmp, tmp2);
-                                break;
                             case 1:
                             {
                                 TCGv_ptr fpstatus = get_fpstatus_ptr(1);
@@ -5297,9 +5235,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                 tcg_temp_free_ptr(fpstatus);
                                 break;
                             }
-                            case 4:
-                                gen_neon_rsb(size, tmp, tmp2);
-                                break;
                             case 5:
                             {
                                 TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.20.1


