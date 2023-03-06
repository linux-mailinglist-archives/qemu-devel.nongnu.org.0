Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1946AB418
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyE-0003rn-1O; Sun, 05 Mar 2023 19:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxb-0002Ry-Tk
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:16 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxY-0007Kk-VP
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:15 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6394263pjb.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IeZjPvY/sKXUGuVFHKcT8jgWfoE6skv8X6qXw8JeNE=;
 b=Uv8AY66xMyRJ2xwyx2Ch+GG/RcXShvm1NQo0X8KRH80y9VI7slCejxmIa3Hw0O4Pi7
 M4PnmY9TG1EA2JurwaLuvSn+xh3buXxczMFMZTeXaWd15nPmOABCxnYK6ljyGvLCBhEC
 +xCCJemGKJywELyxPrQcQ2m7IBakHNOYARoAYC9Qd51++WjYR6eIfF8/AotTd2g9/Cjm
 K4yj3I6+6+QyoB9Vinm1wDk5p8kKf5j5IqU409UAvoKEAe1dwxNSXxvRUuNV36afnH5H
 Uy/wEtV5WpTWxgKZdAUNhLLREZ/441d12XB31ILUNKnHlGItNJSjfJPzVCP9K50dRBl5
 ELeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IeZjPvY/sKXUGuVFHKcT8jgWfoE6skv8X6qXw8JeNE=;
 b=k/9yNHTJD/+5NB+RKYQGjHrH4wUrSam6Ihy21itfrkDp3bqyialDhBm7va+tycnips
 HjYU4+KTjKCaU0q4K4RlUIms1FKD7zzxp1Fot3y644sLM7fNVEisHjlysEwL5MFNs+Tn
 C1u0LA+xTUT8bEAsnCU/rcAWHf5ZOa5BaD1yIjDN7v0JGi+2EzjKI64uecVm+lPJC9EH
 6YRJRNG7OZMbwL4rFw/+UjrFsqxnV5x+03ZBHpk9sLE1kIuAJe5DfYh5LzcGWkbJMQwG
 Yc8r09y5mRuvylf2kh3W3J/FrO6UpEZi3sO8hrQxSxNEGgvJghObn+5sEI8u6Jjpnk8W
 peHQ==
X-Gm-Message-State: AO0yUKWaiscAWAHXcdT3Vs2OK2ENHUeuPbifSzIkapFaTDmlqn0B2+QN
 PNRzgBxTtj995n9L9Eu9R8enVXaujk1liUomD4CbWwXU
X-Google-Smtp-Source: AK7set+d5QEU3IH/mPbazLYgD08IZbQ2sP5CTzqc6SNUUhiSpfnoqSH2GZUUfDaqLHMZr473TxPwrA==
X-Received: by 2002:a05:6a20:63a1:b0:c7:4bf5:fa0a with SMTP id
 m33-20020a056a2063a100b000c74bf5fa0amr7544575pzg.48.1678063451492; 
 Sun, 05 Mar 2023 16:44:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 62/84] target/i386: Drop tcg_temp_free
Date: Sun,  5 Mar 2023 16:39:32 -0800
Message-Id: <20230306003954.1866998-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c      | 41 --------------------------------
 target/i386/tcg/decode-new.c.inc | 15 ------------
 target/i386/tcg/emit.c.inc       |  6 -----
 3 files changed, 62 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index defbc43deb..2f3842663d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -899,10 +899,6 @@ static void gen_compute_eflags(DisasContext *s)
     gen_update_cc_op(s);
     gen_helper_cc_compute_all(cpu_cc_src, dst, src1, src2, cpu_cc_op);
     set_cc_op(s, CC_OP_EFLAGS);
-
-    if (dead) {
-        tcg_temp_free(zero);
-    }
 }
 
 typedef struct CCPrepare {
@@ -1650,7 +1646,6 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     } else {
         tcg_gen_mov_tl(cpu_cc_src, shm1);
     }
-    tcg_temp_free(z_tl);
 
     /* Get the two potential CC_OP values into temporaries.  */
     tcg_gen_movi_i32(s->tmp2_i32, (is_right ? CC_OP_SARB : CC_OP_SHLB) + ot);
@@ -1666,8 +1661,6 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     s32 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(s32, count);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, s32, z32, s->tmp2_i32, oldop);
-    tcg_temp_free_i32(z32);
-    tcg_temp_free_i32(s32);
 
     /* The CC_OP value is no longer predictable.  */
     set_cc_op(s, CC_OP_DYNAMIC);
@@ -1827,8 +1820,6 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
     tcg_gen_movi_i32(s->tmp3_i32, CC_OP_EFLAGS);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, t1, t0,
                         s->tmp2_i32, s->tmp3_i32);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(t1);
 
     /* The CC_OP value is no longer predictable.  */
     set_cc_op(s, CC_OP_DYNAMIC);
@@ -2049,7 +2040,6 @@ static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
     gen_op_st_rm_T0_A0(s, ot, op1);
 
     gen_shift_flags(s, ot, s->T0, s->tmp0, count, is_right);
-    tcg_temp_free(count);
 }
 
 static void gen_shift(DisasContext *s1, int op, MemOp ot, int d, int s)
@@ -2513,13 +2503,6 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
     tcg_gen_movcond_tl(cc.cond, s->T0, cc.reg, cc.reg2,
                        s->T0, cpu_regs[reg]);
     gen_op_mov_reg_v(s, ot, reg, s->T0);
-
-    if (cc.mask != -1) {
-        tcg_temp_free(cc.reg);
-    }
-    if (!cc.use_reg2) {
-        tcg_temp_free(cc.reg2);
-    }
 }
 
 static inline void gen_op_movl_T0_seg(DisasContext *s, X86Seg seg_reg)
@@ -2748,7 +2731,6 @@ static void gen_set_hflag(DisasContext *s, uint32_t mask)
         tcg_gen_ld_i32(t, cpu_env, offsetof(CPUX86State, hflags));
         tcg_gen_ori_i32(t, t, mask);
         tcg_gen_st_i32(t, cpu_env, offsetof(CPUX86State, hflags));
-        tcg_temp_free_i32(t);
         s->flags |= mask;
     }
 }
@@ -2760,7 +2742,6 @@ static void gen_reset_hflag(DisasContext *s, uint32_t mask)
         tcg_gen_ld_i32(t, cpu_env, offsetof(CPUX86State, hflags));
         tcg_gen_andi_i32(t, t, ~mask);
         tcg_gen_st_i32(t, cpu_env, offsetof(CPUX86State, hflags));
-        tcg_temp_free_i32(t);
         s->flags &= ~mask;
     }
 }
@@ -2772,7 +2753,6 @@ static void gen_set_eflags(DisasContext *s, target_ulong mask)
     tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
     tcg_gen_ori_tl(t, t, mask);
     tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
-    tcg_temp_free(t);
 }
 
 static void gen_reset_eflags(DisasContext *s, target_ulong mask)
@@ -2782,7 +2762,6 @@ static void gen_reset_eflags(DisasContext *s, target_ulong mask)
     tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
     tcg_gen_andi_tl(t, t, ~mask);
     tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
-    tcg_temp_free(t);
 }
 
 /* Clear BND registers during legacy branches.  */
@@ -3015,13 +2994,11 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
         tcg_gen_nonatomic_cmpxchg_i64(old, s->A0, cmp, val,
                                       s->mem_index, MO_TEUQ);
     }
-    tcg_temp_free_i64(val);
 
     /* Set tmp0 to match the required value of Z. */
     tcg_gen_setcond_i64(TCG_COND_EQ, cmp, old, cmp);
     Z = tcg_temp_new();
     tcg_gen_trunc_i64_tl(Z, cmp);
-    tcg_temp_free_i64(cmp);
 
     /*
      * Extract the result values for the register pair.
@@ -3042,12 +3019,10 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EDX], Z, zero,
                            s->T1, cpu_regs[R_EDX]);
     }
-    tcg_temp_free_i64(old);
 
     /* Update Z. */
     gen_compute_eflags(s);
     tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, Z, ctz32(CC_Z), 1);
-    tcg_temp_free(Z);
 }
 
 #ifdef TARGET_X86_64
@@ -3072,8 +3047,6 @@ static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
     }
 
     tcg_gen_extr_i128_i64(s->T0, s->T1, val);
-    tcg_temp_free_i128(cmp);
-    tcg_temp_free_i128(val);
 
     /* Determine success after the fact. */
     t0 = tcg_temp_new_i64();
@@ -3081,13 +3054,11 @@ static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
     tcg_gen_xor_i64(t0, s->T0, cpu_regs[R_EAX]);
     tcg_gen_xor_i64(t1, s->T1, cpu_regs[R_EDX]);
     tcg_gen_or_i64(t0, t0, t1);
-    tcg_temp_free_i64(t1);
 
     /* Update Z. */
     gen_compute_eflags(s);
     tcg_gen_setcondi_i64(TCG_COND_EQ, t0, t0, 0);
     tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, t0, ctz32(CC_Z), 1);
-    tcg_temp_free_i64(t0);
 
     /*
      * Extract the result values for the register pair.  We may do this
@@ -3437,10 +3408,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_neg_tl(t1, t0);
                 tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
                                           s->mem_index, ot | MO_LE);
-                tcg_temp_free(t1);
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
-                tcg_temp_free(t2);
                 tcg_gen_neg_tl(s->T0, t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
@@ -3927,9 +3896,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
             tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
             set_cc_op(s, CC_OP_SUBB + ot);
-            tcg_temp_free(oldv);
-            tcg_temp_free(newv);
-            tcg_temp_free(cmpv);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
@@ -4380,7 +4346,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (shift) {
             TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
             gen_shiftd_rm_T1(s, ot, opreg, op, imm);
-            tcg_temp_free(imm);
         } else {
             gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
         }
@@ -4614,7 +4579,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     tcg_gen_st_tl(last_addr, cpu_env,
                                   offsetof(CPUX86State, fpdp));
                 }
-                tcg_temp_free(last_addr);
             } else {
                 /* register float ops */
                 opreg = rm;
@@ -6279,9 +6243,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_compute_eflags(s);
             tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
             tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t2);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
         }
         break;
     case 0x102: /* lar */
@@ -6308,7 +6269,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_mov_reg_v(s, ot, reg, t0);
             gen_set_label(label1);
             set_cc_op(s, CC_OP_EFLAGS);
-            tcg_temp_free(t0);
         }
         break;
     case 0x118:
@@ -6353,7 +6313,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 TCGv_i64 notu = tcg_temp_new_i64();
                 tcg_gen_not_i64(notu, cpu_bndu[reg]);
                 gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
-                tcg_temp_free_i64(notu);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- from reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index d5fd8d965c..4fdd87750b 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1567,20 +1567,6 @@ illegal:
     return false;
 }
 
-static void decode_temp_free(X86DecodedOp *op)
-{
-    if (op->v_ptr) {
-        tcg_temp_free_ptr(op->v_ptr);
-    }
-}
-
-static void decode_temps_free(X86DecodedInsn *decode)
-{
-    decode_temp_free(&decode->op[0]);
-    decode_temp_free(&decode->op[1]);
-    decode_temp_free(&decode->op[2]);
-}
-
 /*
  * Convert one instruction. s->base.is_jmp is set if the translation must
  * be stopped.
@@ -1835,7 +1821,6 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         decode.e.gen(s, env, &decode);
         gen_writeback(s, &decode, 0, s->T0);
     }
-    decode_temps_free(&decode);
     return;
  illegal_op:
     gen_illegal_opcode(s);
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0d01e13002..95fb4f52fa 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -629,7 +629,6 @@ static inline void gen_ternary_sse(DisasContext *s, CPUX86State *env, X86Decoded
     /* The format of the fourth input is Lx */
     tcg_gen_addi_ptr(ptr3, cpu_env, ZMM_OFFSET(op3));
     fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, ptr3);
-    tcg_temp_free_ptr(ptr3);
 }
 #define TERNARY_SSE(uname, uvname, lname)                                          \
 static void gen_##uvname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -1001,7 +1000,6 @@ static inline void gen_vsib_avx(DisasContext *s, CPUX86State *env, X86DecodedIns
         int ymmh_ofs = vector_elem_offset(&decode->op[1], MO_128, 1);
         tcg_gen_gvec_dup_imm(MO_64, ymmh_ofs, 16, 16, 0);
     }
-    tcg_temp_free_ptr(index);
 }
 #define VSIB_AVX(uname, lname)                                                     \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -1627,7 +1625,6 @@ static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
             tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);
         }
     }
-    tcg_temp_free(t);
 }
 
 static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -1762,7 +1759,6 @@ static void gen_PSRLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     } else {
         gen_helper_psrldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
     }
-    tcg_temp_free_ptr(imm_vec);
 }
 
 static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -1775,7 +1771,6 @@ static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     } else {
         gen_helper_pslldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
     }
-    tcg_temp_free_ptr(imm_vec);
 }
 
 static void gen_RORX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -2293,7 +2288,6 @@ static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
     gen_helper_memset(ptr, ptr, tcg_constant_i32(0),
                       tcg_constant_ptr(CPU_NB_REGS * sizeof(ZMMReg)));
-    tcg_temp_free_ptr(ptr);
 }
 
 static void gen_VZEROUPPER(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
-- 
2.34.1


