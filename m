Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C02EE69E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:18:16 +0100 (CET)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbjb-0002eT-E7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgT-0000e4-LK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:01 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgR-0001OR-G3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id n3so4519308pjm.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cOc/EO426UcFq+Ds2TZQxNrDdGfPnqOjFWRfHCKoV4=;
 b=u/Ao3UOqU1FVOC33ZsbV7ldA4r761erIKxVFUH1/eSM20KWZrDE5ReX3L8wJxBz+iU
 s1o5tO57KqGonFQ6/SWsNsEcqbIm5hMRIw/ajXo0uVRqsK8CGl/pBJpbISC0A3PnPka1
 BsRsh6dQr6LEB94+7YwdXI1Ej3NNCcZfbvtqpaKe0fkjfyXKVZq0hW/53lEFqkwezBdM
 8Rxt5YBnqi7spYb5Zz4WFOcG9lqMKBq2ZaD5OdBLL6YVlLXnWDQqhhFhBniuBYs/gY23
 7lRU2mIUc2VpwCJwLmlMKApOeXwL6rbBg9lC29C8Hq52P0n7vH3p7zbH8NjTUNo/hPTF
 T6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cOc/EO426UcFq+Ds2TZQxNrDdGfPnqOjFWRfHCKoV4=;
 b=g7ScK1L+nUSmR5MX7z8kVV/JymQ4oZeRmQBbdAr14qFdDaqmBCRY6BBx/Assgf7HxX
 yWRmfbuGD9hKoY85ywLvde5UIz7fKcueUBbHRBeL8nCxnO9Z84hUhurcy7PooPk90ed3
 BedefzE90NYARYExNOi44Xi8iEe9/M/MvAlto3HZh+jrS5tTVeK+ONEFN7nr1cSfqOAo
 ol8gRPnCxtmss2oQh6a6iEjX/DDTIScOny4+D1fLkoArrCBNBytd4+QLn16FZZ6re2Cs
 3ZA6+egTogybyRaYxZfbaCKxEtC81ZdAB2joRO3Cgp++WEPIDTQrw+hQEbzCR/zt/fsJ
 RN8g==
X-Gm-Message-State: AOAM533o6Opwzjvb/73eU4sxpHvhqf6rY8sdlAlBpD7SyTizzHCBnsQL
 y8C7VKJ25/bNhaKUuMF+pU/yvOPEVkU9bw==
X-Google-Smtp-Source: ABdhPJzkhXGX4iwvOnL6VceIZioJOiA7Fm3FEyPU7mNAXD4T1lM+hyvN1yH1jC9QhGH8KfZmFYpqDA==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr163357pjs.95.1610050497641; 
 Thu, 07 Jan 2021 12:14:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:14:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/47] tcg: Introduce INDEX_op_qemu_st8_i32
Date: Thu,  7 Jan 2021 10:14:04 -1000
Message-Id: <20210107201448.1152301-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable this on i386 to restrict the set of input registers
for an 8-bit store, as required by the architecture.  This
removes the last use of scratch registers for user-only mode.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h     |  5 +++++
 tcg/aarch64/tcg-target.h  |  1 +
 tcg/arm/tcg-target.h      |  1 +
 tcg/i386/tcg-target.h     |  3 +++
 tcg/mips/tcg-target.h     |  1 +
 tcg/ppc/tcg-target.h      |  1 +
 tcg/riscv/tcg-target.h    |  1 +
 tcg/s390/tcg-target.h     |  1 +
 tcg/sparc/tcg-target.h    |  1 +
 tcg/tci/tcg-target.h      |  1 +
 tcg/optimize.c            |  1 +
 tcg/tcg-op.c              |  6 +++++-
 tcg/tcg.c                 |  4 ++++
 tcg/i386/tcg-target.c.inc | 29 ++++++++++++++++++-----------
 tcg/README                |  5 +++++
 15 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 67092e82c6..70a76646c4 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -211,6 +211,11 @@ DEF(qemu_ld_i64, DATA64_ARGS, TLADDR_ARGS, 1,
 DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT)
 
+/* Only used by i386 to cope with stupid register constraints. */
+DEF(qemu_st8_i32, 0, TLADDR_ARGS + 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS |
+    IMPL(TCG_TARGET_HAS_qemu_st8_i32))
+
 /* Host vector support.  */
 
 #define IMPLVEC  TCG_OPF_VECTOR | IMPL(TCG_TARGET_MAYBE_vec)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 8a6b97598e..108a1fa969 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -88,6 +88,7 @@ typedef enum {
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
 #define TCG_TARGET_HAS_goto_ptr         1
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index f1955ce4ac..1e18fefd0e 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -126,6 +126,7 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 enum {
     TCG_AREG0 = TCG_REG_R6,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b1ada9777a..f3836a4d0c 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -172,6 +172,9 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_muls2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_qemu_st8_i32     0
+#else
+#define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
 /* We do not support older SSE systems, only beginning with AVX1.  */
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 92c1d63da3..624248b81e 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -169,6 +169,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_clz_i32          use_mips32r2_instructions
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_movcond_i64      use_movnz_instructions
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index a509a19628..301173c97e 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -108,6 +108,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index c1bd52bb9a..888288d54c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -119,6 +119,7 @@ typedef enum {
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_movcond_i64      0
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index b4feb2f55a..69576f4a9a 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -97,6 +97,7 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_extrh_i64_i32  0
 #define TCG_TARGET_HAS_goto_ptr       1
 #define TCG_TARGET_HAS_direct_jump    (s390_facilities & FACILITY_GEN_INST_EXT)
+#define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
 #define TCG_TARGET_HAS_rot_i64        1
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index d8b0e32e2e..9dce305253 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -126,6 +126,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
 #define TCG_TARGET_HAS_extrh_i64_i32    1
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index b84480f989..e8277caee2 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -88,6 +88,7 @@
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         0
 #define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 7ca71de956..1fb42eb2a9 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1541,6 +1541,7 @@ void tcg_optimize(TCGContext *s)
             case INDEX_op_qemu_ld_i32:
             case INDEX_op_qemu_ld_i64:
             case INDEX_op_qemu_st_i32:
+            case INDEX_op_qemu_st8_i32:
             case INDEX_op_qemu_st_i64:
             case INDEX_op_call:
                 /* Opcodes that touch guest memory stop the optimization.  */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 4b8a473fad..af7ce91ffa 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2883,7 +2883,11 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     }
 
     addr = plugin_prep_mem_callbacks(addr);
-    gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
+    if (TCG_TARGET_HAS_qemu_st8_i32 && (memop & MO_SIZE) == MO_8) {
+        gen_ldst_i32(INDEX_op_qemu_st8_i32, val, addr, memop, idx);
+    } else {
+        gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
+    }
     plugin_gen_mem_callbacks(addr, info);
 
     if (swap) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ebb9466ffc..95aacc8597 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1427,6 +1427,9 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_qemu_st_i64:
         return true;
 
+    case INDEX_op_qemu_st8_i32:
+        return TCG_TARGET_HAS_qemu_st8_i32;
+
     case INDEX_op_goto_ptr:
         return TCG_TARGET_HAS_goto_ptr;
 
@@ -2087,6 +2090,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 break;
             case INDEX_op_qemu_ld_i32:
             case INDEX_op_qemu_st_i32:
+            case INDEX_op_qemu_st8_i32:
             case INDEX_op_qemu_ld_i64:
             case INDEX_op_qemu_st_i64:
                 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 01588cdcb4..f8e9a24e3b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -245,11 +245,21 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
         ct->regs |= ALL_VECTOR_REGS;
         break;
 
-        /* qemu_ld/st address constraint */
     case 'L':
+        /* qemu_ld/st data+address constraint */
         ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
+#ifdef CONFIG_SOFTMMU
         tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
         tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
+#endif
+        break;
+    case 's':
+        /* qemu_st8_i32 data constraint */
+        ct->regs = 0xf;
+#ifdef CONFIG_SOFTMMU
+        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
+        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
+#endif
         break;
 
     case 'e':
@@ -2120,7 +2130,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
                                    int seg, MemOp memop)
 {
-    const TCGReg scratch = TCG_REG_L0;
     bool use_movbe = false;
     int movop = OPC_MOVL_EvGv;
 
@@ -2136,15 +2145,8 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     switch (memop & MO_SIZE) {
     case MO_8:
-        /*
-         * In 32-bit mode, 8-bit stores can only happen from [abcd]x.
-         * TODO: Adjust constraints such that this is is forced,
-         * then we won't need a scratch at all for user-only.
-         */
-        if (TCG_TARGET_REG_BITS == 32 && datalo >= 4) {
-            tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
-            datalo = scratch;
-        }
+        /* This is handled with constraints on INDEX_op_qemu_st8_i32. */
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || datalo < 4);
         tcg_out_modrm_sib_offset(s, OPC_MOVB_EvGv + P_REXB_R + seg,
                                  datalo, base, index, 0, ofs);
         break;
@@ -2491,6 +2493,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_ld(s, args, 1);
         break;
     case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st8_i32:
         tcg_out_qemu_st(s, args, 0);
         break;
     case INDEX_op_qemu_st_i64:
@@ -2949,9 +2952,11 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     static const TCGTargetOpDef r_0_ci = { .args_ct_str = { "r", "0", "ci" } };
     static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
     static const TCGTargetOpDef L_L = { .args_ct_str = { "L", "L" } };
+    static const TCGTargetOpDef s_L = { .args_ct_str = { "s", "L" } };
     static const TCGTargetOpDef r_L_L = { .args_ct_str = { "r", "L", "L" } };
     static const TCGTargetOpDef r_r_L = { .args_ct_str = { "r", "r", "L" } };
     static const TCGTargetOpDef L_L_L = { .args_ct_str = { "L", "L", "L" } };
+    static const TCGTargetOpDef s_L_L = { .args_ct_str = { "s", "L", "L" } };
     static const TCGTargetOpDef r_r_L_L
         = { .args_ct_str = { "r", "r", "L", "L" } };
     static const TCGTargetOpDef L_L_L_L
@@ -3145,6 +3150,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
         return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
     case INDEX_op_qemu_st_i32:
         return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &L_L : &L_L_L;
+    case INDEX_op_qemu_st8_i32:
+        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &s_L : &s_L_L;
     case INDEX_op_qemu_ld_i64:
         return (TCG_TARGET_REG_BITS == 64 ? &r_L
                 : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_r_L
diff --git a/tcg/README b/tcg/README
index 2f051e5c97..0cf9e2727c 100644
--- a/tcg/README
+++ b/tcg/README
@@ -502,6 +502,7 @@ goto_ptr opcode, emitting this op is equivalent to emitting exit_tb(0).
 
 * qemu_ld_i32/i64 t0, t1, flags, memidx
 * qemu_st_i32/i64 t0, t1, flags, memidx
+* qemu_st8_i32 t0, t1, flags, memidx
 
 Load data at the guest address t1 into t0, or store data in t0 at guest
 address t1.  The _i32/_i64 size applies to the size of the input/output
@@ -518,6 +519,10 @@ of the memory access.
 For a 32-bit host, qemu_ld/st_i64 is guaranteed to only be used with a
 64-bit memory access specified in flags.
 
+For i386, qemu_st8_i32 is exactly like qemu_st_i32, except the size of
+the memory operation is known to be 8-bit.  This allows the backend to
+provide a different set of register constraints.
+
 ********* Host vector operations
 
 All of the vector ops have two parameters, TCGOP_VECL & TCGOP_VECE.
-- 
2.25.1


