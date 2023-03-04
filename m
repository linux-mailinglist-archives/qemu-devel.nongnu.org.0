Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC836AABDE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:22:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTQ-0006No-CC; Sat, 04 Mar 2023 13:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTM-0006ND-0L
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:08 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTI-0003Ly-M2
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:07 -0500
Received: by mail-pl1-x641.google.com with SMTP id u5so6067152plq.7
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMuE/uh1eMEFYuIguiY6P8bIrMUZeHI8DeF2jB/hEA4=;
 b=lz2JA8E47aU5y3UWe/Jx6uwUOXYuA7terH2q3RN5N11keltf4ImAj8/E3NmVao0Zko
 kz4/CWMEGLvaYCSjv9Vhh7J0Nx5B9y0XAtphipWPlaMY9vp0WO2bsn49Tt9EreDbDmYW
 iliEHv4sblaPD4b770YhKcJx2CeU2Se96NDcr82yKj/MmcBpg2pBikCtgXkdC02cAMch
 5fi3Bjq6vJ8Us2cKhEPWkfem4RqRYM0Vp9X/iF4WJnRLwsZXCsRpdowIfLfHJ/5db7n4
 6uDjZPUmQ9HS2+/1us5RVg1Sy0wqJ4uM9eM0II10Sr/ydJaheSb4zuJJZ8X3KwSXf+Bm
 LSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMuE/uh1eMEFYuIguiY6P8bIrMUZeHI8DeF2jB/hEA4=;
 b=eC96qNWa97jEN2F+zNZKPPuLjSwxiQEJBqZNTEJ30lAFN1k2SWk3i3LTa8hxGRLNbK
 Syasp7YjeASjh++THBafV7U3cHglRO+gwSdsHvwzX10+nuybmhdlsuWW+jKFICZPnSbP
 1ZU0cn5rL9J166TBzF6bSWzcAB0sgwrFqluP683ENKdZbZV+d1Bbwx0CDK2FDnd7CBvX
 4S/IJEMtO3E23punXRU7bAgylTt7M9jIgtRn2JgeF8vVuhYWT3YmYzIHmFgDj7DcYARX
 LgzOmHTVmhiOP+s3wAP1P4DYvn1U8VgD63xyhcDDq67NlzOkCZrq6bZH5OOA0TI78etT
 hWrQ==
X-Gm-Message-State: AO0yUKUWkY1gqYCnDde18n1XgJceKERKcb+QUTWDFmHX1FGwy6Kb6QJ2
 d9ddTaIi+ZV3iLqNhHxff9OhgWgeG548OqYdC6CaImwN
X-Google-Smtp-Source: AK7set+PYZsdkOWHRxuSSthvzXY1QR8rt4XLSpR8aNJNrxf3aUHVtBo9vnsz/ly4q0weQ58UQbByfA==
X-Received: by 2002:a05:6a20:2a29:b0:cc:75b8:7cba with SMTP id
 e41-20020a056a202a2900b000cc75b87cbamr5636283pzh.43.1677953943094; 
 Sat, 04 Mar 2023 10:19:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 01/20] target/i386: Drop tcg_temp_free
Date: Sat,  4 Mar 2023 10:18:41 -0800
Message-Id: <20230304181900.1097116-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
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


