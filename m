Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131536A2854
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:24:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjk-0008TN-Db; Sat, 25 Feb 2023 04:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj7-0006IV-Lc
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:23 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiz-0003B2-SS
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:18 -0500
Received: by mail-pf1-x429.google.com with SMTP id z11so856435pfh.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPwMW2lc5iErfBt1KgVvJou/xHE1y7R42IZvzcmsBVM=;
 b=lbFL1JQqdiRnK/XuSis1zpnH72vTqWM7dW3JnWiNgS8jinyHzq6VZuJW2Yz2qyWiXJ
 ri2sZAHJdUaUQicB9lbokYV5zEhf+i/uDQC3BGynrtSOBZX3vHOj+XSYoOAXT+NVMigP
 22ocH/i0Tf4wXym+t6kUojm/DKkut1eJaoINSIofaP0GqEv5FRC4WR/FZB2HnLpH+5Sy
 wNvDAIRk9EGQGSPnNBb3UGvLVUDkDVRY/e9ENIxF31EAqFB6JieO85k94kiv0pmKLnzw
 ON76LfCGLxCBlq7oPxPDPt11HYIDlTpUGhfURvw2V5Av7qviIu/FVptvle293PwQ4Z8T
 QYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPwMW2lc5iErfBt1KgVvJou/xHE1y7R42IZvzcmsBVM=;
 b=S5fy+dWL4uzMmYiCOSkskGLHn5pEjy9sigx80iaK8VhOIzyceqjH+DfZ0+geVnVxLQ
 cUDNum+OMYm1Zgne5mf8zEQLQcTLvUJ0ZwgQqBrdbIxLz4JL7Yvlhk6sJ3tc6dze9bWu
 UZEdS0Eq74gszSoOvsulX5HfLfG7Z6pfspOm/YBfY8z+Aax5UyVoxkKfwKG2+Nedu1fT
 lZBGpXJ5Tz9VtyZsc/M89FbhytjlbQj7Y/5zT0SWfdzTgK2DVV4Nya8wGmbZrR2rJfcA
 C08CdS/DgYa+IWhEaXUSk2WVynbEahG5Ub+8ZwWkbxqjZsvtGvXagLqyl7MLhhQyJ1au
 vjrw==
X-Gm-Message-State: AO0yUKUGgB4YzgWszeVfJrOayQ7zNTmLcumEExcDied+B4Zw09onJAHf
 Qowcw7fl6PvmCueTNK/0Vw3VwNqQkoFCDqn9tqU=
X-Google-Smtp-Source: AK7set8S9/Hh0mHthBq4NaSWqyLOz4IqFG2dcGzhMRtfCi8aVawM8LeHscFaXEi9CUmFSquRsfX4cA==
X-Received: by 2002:a05:6a00:1a54:b0:5a9:cad5:b283 with SMTP id
 h20-20020a056a001a5400b005a9cad5b283mr2437636pfv.14.1677316812037; 
 Sat, 25 Feb 2023 01:20:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 61/76] target/s390x: Drop tcg_temp_free from translate.c
Date: Fri, 24 Feb 2023 23:14:12 -1000
Message-Id: <20230225091427.1817156-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
 target/s390x/tcg/translate.c | 105 -----------------------------------
 1 file changed, 105 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 76a1233946..beccd3429e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -306,8 +306,6 @@ static TCGv_i128 load_freg_128(int reg)
     TCGv_i128 r = tcg_temp_new_i128();
 
     tcg_gen_concat_i64_i128(r, l, h);
-    tcg_temp_free_i64(h);
-    tcg_temp_free_i64(l);
     return r;
 }
 
@@ -1263,10 +1261,8 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             TCGv_i64 z = tcg_constant_i64(0);
             tcg_gen_setcond_i32(c->cond, t0, c->u.s32.a, c->u.s32.b);
             tcg_gen_extu_i32_i64(t1, t0);
-            tcg_temp_free_i32(t0);
             tcg_gen_movcond_i64(TCG_COND_NE, psw_addr, t1, z, cdest, next);
             per_branch_cond(s, TCG_COND_NE, t1, z);
-            tcg_temp_free_i64(t1);
         }
 
         ret = DISAS_PC_UPDATED;
@@ -1525,7 +1521,6 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     tcg_gen_extu_i32_i64(t, cc_op);
     tcg_gen_shli_i64(t, t, 28);
     tcg_gen_or_i64(o->out, o->out, t);
-    tcg_temp_free_i64(t);
 }
 
 static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
@@ -1589,7 +1584,6 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     c.u.s32.a = tcg_temp_new_i32();
     c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
-    tcg_temp_free_i64(t);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
@@ -1611,7 +1605,6 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
     c.u.s32.a = tcg_temp_new_i32();
     c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
-    tcg_temp_free_i64(t);
 
     return help_branch(s, &c, 1, imm, o->in2);
 }
@@ -1652,7 +1645,6 @@ static DisasJumpType op_bx32(DisasContext *s, DisasOps *o)
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_gen_extrl_i64_i32(c.u.s32.b, regs[r3 | 1]);
     store_reg32_i64(r1, t);
-    tcg_temp_free_i64(t);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
@@ -1971,11 +1963,9 @@ static DisasJumpType op_cksm(DisasContext *s, DisasOps *o)
     gen_helper_cksm(pair, cpu_env, o->in1, o->in2, regs[r2 + 1]);
     set_cc_static(s);
     tcg_gen_extr_i128_i64(o->out, len, pair);
-    tcg_temp_free_i128(pair);
 
     tcg_gen_add_i64(regs[r2], regs[r2], len);
     tcg_gen_sub_i64(regs[r2 + 1], regs[r2 + 1], len);
-    tcg_temp_free_i64(len);
 
     return DISAS_NEXT;
 }
@@ -2077,7 +2067,6 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
     tcg_gen_extrl_i64_i32(t1, o->in1);
     gen_helper_clm(cc_op, cpu_env, t1, m3, o->in2);
     set_cc_static(s);
-    tcg_temp_free_i32(t1);
     return DISAS_NEXT;
 }
 
@@ -2087,7 +2076,6 @@ static DisasJumpType op_clst(DisasContext *s, DisasOps *o)
 
     gen_helper_clst(pair, cpu_env, regs[0], o->in1, o->in2);
     tcg_gen_extr_i128_i64(o->in2, o->in1, pair);
-    tcg_temp_free_i128(pair);
 
     set_cc_static(s);
     return DISAS_NEXT;
@@ -2099,7 +2087,6 @@ static DisasJumpType op_cps(DisasContext *s, DisasOps *o)
     tcg_gen_andi_i64(t, o->in1, 0x8000000000000000ull);
     tcg_gen_andi_i64(o->out, o->in2, 0x7fffffffffffffffull);
     tcg_gen_or_i64(o->out, o->out, t);
-    tcg_temp_free_i64(t);
     return DISAS_NEXT;
 }
 
@@ -2115,14 +2102,12 @@ static DisasJumpType op_cs(DisasContext *s, DisasOps *o)
     addr = get_address(s, 0, b2, d2);
     tcg_gen_atomic_cmpxchg_i64(o->out, addr, o->in2, o->in1,
                                get_mem_index(s), s->insn->data | MO_ALIGN);
-    tcg_temp_free_i64(addr);
 
     /* Are the memory and expected values (un)equal?  Note that this setcond
        produces the output CC value, thus the NE sense of the test.  */
     cc = tcg_temp_new_i64();
     tcg_gen_setcond_i64(TCG_COND_NE, cc, o->in2, o->out);
     tcg_gen_extrl_i64_i32(cc_op, cc);
-    tcg_temp_free_i64(cc);
     set_cc_static(s);
 
     return DISAS_NEXT;
@@ -2182,7 +2167,6 @@ static DisasJumpType op_csp(DisasContext *s, DisasOps *o)
     tcg_gen_andi_i64(addr, o->in2, -1ULL << (mop & MO_SIZE));
     tcg_gen_atomic_cmpxchg_i64(old, addr, o->in1, o->out2,
                                get_mem_index(s), mop | MO_ALIGN);
-    tcg_temp_free_i64(addr);
 
     /* Are the memory and expected values (un)equal?  */
     cc = tcg_temp_new_i64();
@@ -2196,14 +2180,12 @@ static DisasJumpType op_csp(DisasContext *s, DisasOps *o)
     } else {
         tcg_gen_mov_i64(o->out, old);
     }
-    tcg_temp_free_i64(old);
 
     /* If the comparison was equal, and the LSB of R2 was set,
        then we need to flush the TLB (for all cpus).  */
     tcg_gen_xori_i64(cc, cc, 1);
     tcg_gen_and_i64(cc, cc, o->in2);
     tcg_gen_brcondi_i64(TCG_COND_EQ, cc, 0, lab);
-    tcg_temp_free_i64(cc);
 
     gen_helper_purge(cpu_env);
     gen_set_label(lab);
@@ -2218,9 +2200,7 @@ static DisasJumpType op_cvd(DisasContext *s, DisasOps *o)
     TCGv_i32 t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, o->in1);
     gen_helper_cvd(t1, t2);
-    tcg_temp_free_i32(t2);
     tcg_gen_qemu_st64(t1, o->in2, get_mem_index(s));
-    tcg_temp_free_i64(t1);
     return DISAS_NEXT;
 }
 
@@ -2322,7 +2302,6 @@ static DisasJumpType op_divs64(DisasContext *s, DisasOps *o)
 
     gen_helper_divs64(t, cpu_env, o->in1, o->in2);
     tcg_gen_extr_i128_i64(o->out2, o->out, t);
-    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
@@ -2332,7 +2311,6 @@ static DisasJumpType op_divu64(DisasContext *s, DisasOps *o)
 
     gen_helper_divu64(t, cpu_env, o->out, o->out2, o->in2);
     tcg_gen_extr_i128_i64(o->out2, o->out, t);
-    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
@@ -2387,8 +2365,6 @@ static DisasJumpType op_epsw(DisasContext *s, DisasOps *o)
     if (r2 != 0) {
         store_reg32_i64(r2, psw_mask);
     }
-
-    tcg_temp_free_i64(t);
     return DISAS_NEXT;
 }
 
@@ -2528,7 +2504,6 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
 
     tcg_gen_movi_i64(tmp, ccm);
     gen_op_update2_cc_i64(s, CC_OP_ICM, tmp, o->out);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -2551,8 +2526,6 @@ static DisasJumpType op_ipm(DisasContext *s, DisasOps *o)
     tcg_gen_extu_i32_i64(t2, cc_op);
     tcg_gen_deposit_i64(t1, t1, t2, 4, 60);
     tcg_gen_deposit_i64(o->out, o->out, t1, 24, 8);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
     return DISAS_NEXT;
 }
 
@@ -2892,11 +2865,9 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
 
         t = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t, t32);
-        tcg_temp_free_i32(t32);
 
         z = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_NE, o->out, t, z, o->in2, o->in1);
-        tcg_temp_free_i64(t);
     }
 
     return DISAS_NEXT;
@@ -2953,8 +2924,6 @@ static DisasJumpType op_lpsw(DisasContext *s, DisasOps *o)
     /* Convert the 32-bit PSW_MASK into the 64-bit PSW_MASK.  */
     tcg_gen_shli_i64(t1, t1, 32);
     gen_helper_load_psw(cpu_env, t1, t2);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
     return DISAS_NORETURN;
 }
 
@@ -2971,8 +2940,6 @@ static DisasJumpType op_lpswe(DisasContext *s, DisasOps *o)
     tcg_gen_addi_i64(o->in2, o->in2, 8);
     tcg_gen_qemu_ld64(t2, o->in2, get_mem_index(s));
     gen_helper_load_psw(cpu_env, t1, t2);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
     return DISAS_NORETURN;
 }
 #endif
@@ -2997,7 +2964,6 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
     if (unlikely(r1 == r3)) {
         tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
         store_reg32_i64(r1, t1);
-        tcg_temp_free(t1);
         return DISAS_NEXT;
     }
 
@@ -3012,8 +2978,6 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
 
     /* Only two registers to read. */
     if (((r1 + 1) & 15) == r3) {
-        tcg_temp_free(t2);
-        tcg_temp_free(t1);
         return DISAS_NEXT;
     }
 
@@ -3026,9 +2990,6 @@ static DisasJumpType op_lm32(DisasContext *s, DisasOps *o)
         tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
         store_reg32_i64(r1, t1);
     }
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-
     return DISAS_NEXT;
 }
 
@@ -3043,7 +3004,6 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
     if (unlikely(r1 == r3)) {
         tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
         store_reg32h_i64(r1, t1);
-        tcg_temp_free(t1);
         return DISAS_NEXT;
     }
 
@@ -3058,8 +3018,6 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
 
     /* Only two registers to read. */
     if (((r1 + 1) & 15) == r3) {
-        tcg_temp_free(t2);
-        tcg_temp_free(t1);
         return DISAS_NEXT;
     }
 
@@ -3072,9 +3030,6 @@ static DisasJumpType op_lmh(DisasContext *s, DisasOps *o)
         tcg_gen_qemu_ld32u(t1, o->in2, get_mem_index(s));
         store_reg32h_i64(r1, t1);
     }
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-
     return DISAS_NEXT;
 }
 
@@ -3098,11 +3053,9 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOps *o)
     tcg_gen_addi_i64(t2, o->in2, 8 * ((r3 - r1) & 15));
     tcg_gen_qemu_ld64(regs[r3], t2, get_mem_index(s));
     tcg_gen_mov_i64(regs[r1], t1);
-    tcg_temp_free(t2);
 
     /* Only two registers to read. */
     if (((r1 + 1) & 15) == r3) {
-        tcg_temp_free(t1);
         return DISAS_NEXT;
     }
 
@@ -3114,8 +3067,6 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOps *o)
         tcg_gen_add_i64(o->in2, o->in2, t1);
         tcg_gen_qemu_ld64(regs[r1], o->in2, get_mem_index(s));
     }
-    tcg_temp_free(t1);
-
     return DISAS_NEXT;
 }
 
@@ -3137,8 +3088,6 @@ static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)
     a2 = get_address(s, 0, get_field(s, b2), get_field(s, d2));
     tcg_gen_qemu_ld_i64(o->out, a1, get_mem_index(s), mop | MO_ALIGN);
     tcg_gen_qemu_ld_i64(o->out2, a2, get_mem_index(s), mop | MO_ALIGN);
-    tcg_temp_free_i64(a1);
-    tcg_temp_free_i64(a2);
 
     /* ... and indicate that we performed them while interlocked.  */
     gen_op_movi_cc(s, 0);
@@ -3246,8 +3195,6 @@ static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
     }
 
     tcg_gen_st32_i64(ar1, cpu_env, offsetof(CPUS390XState, aregs[1]));
-    tcg_temp_free_i64(ar1);
-
     return DISAS_NEXT;
 }
 
@@ -3466,7 +3413,6 @@ static DisasJumpType op_maeb(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 r3 = load_freg32_i64(get_field(s, r3));
     gen_helper_maeb(o->out, cpu_env, o->in1, o->in2, r3);
-    tcg_temp_free_i64(r3);
     return DISAS_NEXT;
 }
 
@@ -3474,7 +3420,6 @@ static DisasJumpType op_madb(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 r3 = load_freg(get_field(s, r3));
     gen_helper_madb(o->out, cpu_env, o->in1, o->in2, r3);
-    tcg_temp_free_i64(r3);
     return DISAS_NEXT;
 }
 
@@ -3482,7 +3427,6 @@ static DisasJumpType op_mseb(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 r3 = load_freg32_i64(get_field(s, r3));
     gen_helper_mseb(o->out, cpu_env, o->in1, o->in2, r3);
-    tcg_temp_free_i64(r3);
     return DISAS_NEXT;
 }
 
@@ -3490,7 +3434,6 @@ static DisasJumpType op_msdb(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 r3 = load_freg(get_field(s, r3));
     gen_helper_msdb(o->out, cpu_env, o->in1, o->in2, r3);
-    tcg_temp_free_i64(r3);
     return DISAS_NEXT;
 }
 
@@ -3501,7 +3444,6 @@ static DisasJumpType op_nabs(DisasContext *s, DisasOps *o)
 
     tcg_gen_neg_i64(n, o->in2);
     tcg_gen_movcond_i64(TCG_COND_GE, o->out, o->in2, z, n, o->in2);
-    tcg_temp_free_i64(n);
     return DISAS_NEXT;
 }
 
@@ -3836,9 +3778,6 @@ static DisasJumpType op_rll32(DisasContext *s, DisasOps *o)
     tcg_gen_extrl_i64_i32(t2, o->in2);
     tcg_gen_rotl_i32(to, t1, t2);
     tcg_gen_extu_i32_i64(o->out, to);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(to);
     return DISAS_NEXT;
 }
 
@@ -3993,12 +3932,10 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
         h = tcg_temp_new_i64();
         tcg_gen_shri_i64(h, regs[r1], 32);
         tcg_gen_qemu_st32(h, a, get_mem_index(s));
-        tcg_temp_free_i64(h);
         break;
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free_i64(a);
 
     gen_set_label(lab);
     return DISAS_NEXT;
@@ -4015,9 +3952,6 @@ static DisasJumpType op_sla(DisasContext *s, DisasOps *o)
         t = o->in1;
     }
     gen_op_update2_cc_i64(s, CC_OP_SLA, t, o->in2);
-    if (s->insn->data == 31) {
-        tcg_temp_free_i64(t);
-    }
     tcg_gen_shl_i64(o->out, o->in1, o->in2);
     /* The arithmetic left shift is curious in that it does not affect
        the sign bit.  Copy that over from the source unchanged.  */
@@ -4084,8 +4018,6 @@ static DisasJumpType op_srnmt(DisasContext *s, DisasOps *o)
     tcg_gen_ld32u_i64(tmp, cpu_env, offsetof(CPUS390XState, fpc));
     tcg_gen_deposit_i64(tmp, tmp, o->addr1, 4, 3);
     tcg_gen_st32_i64(tmp, cpu_env, offsetof(CPUS390XState, fpc));
-
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -4126,8 +4058,6 @@ static DisasJumpType op_ectg(DisasContext *s, DisasOps *o)
 
     /* store second operand in GR1 */
     tcg_gen_mov_i64(regs[1], o->in2);
-
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -4187,9 +4117,6 @@ static DisasJumpType op_stcke(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_st64(c1, o->in2, get_mem_index(s));
     tcg_gen_addi_i64(o->in2, o->in2, 8);
     tcg_gen_qemu_st64(c2, o->in2, get_mem_index(s));
-    tcg_temp_free_i64(c1);
-    tcg_temp_free_i64(c2);
-    tcg_temp_free_i64(todpr);
     /* ??? We don't implement clock states.  */
     gen_op_movi_cc(s, 0);
     return DISAS_NEXT;
@@ -4403,7 +4330,6 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
     t = tcg_temp_new_i64();
     tcg_gen_shri_i64(t, psw_mask, 56);
     tcg_gen_qemu_st8(t, o->addr1, get_mem_index(s));
-    tcg_temp_free_i64(t);
 
     if (s->fields.op == 0xac) {
         tcg_gen_andi_i64(psw_mask, psw_mask,
@@ -4514,7 +4440,6 @@ static DisasJumpType op_stcm(DisasContext *s, DisasOps *o)
         }
         break;
     }
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -4558,8 +4483,6 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
         tcg_gen_add_i64(o->in2, o->in2, t4);
         r1 = (r1 + 1) & 15;
     }
-
-    tcg_temp_free_i64(t);
     return DISAS_NEXT;
 }
 
@@ -4746,7 +4669,6 @@ static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 
     gen_helper_tre(pair, cpu_env, o->out, o->out2, o->in2);
     tcg_gen_extr_i128_i64(o->out2, o->out, pair);
-    tcg_temp_free_i128(pair);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4792,7 +4714,6 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
     }
     gen_helper_trXX(cc_op, cpu_env, r1, r2, tst, sizes);
 
-    tcg_temp_free_i32(tst);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5299,7 +5220,6 @@ static void wout_r1_D32(DisasContext *s, DisasOps *o)
     store_reg32_i64(r1 + 1, o->out);
     tcg_gen_shri_i64(t, o->out, 32);
     store_reg32_i64(r1, t);
-    tcg_temp_free_i64(t);
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
 
@@ -6425,31 +6345,6 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         }
     }
 
-    /* Free any temporaries created by the helpers.  */
-    if (o.out && !o.g_out) {
-        tcg_temp_free_i64(o.out);
-    }
-    if (o.out2 && !o.g_out2) {
-        tcg_temp_free_i64(o.out2);
-    }
-    if (o.in1 && !o.g_in1) {
-        tcg_temp_free_i64(o.in1);
-    }
-    if (o.in2 && !o.g_in2) {
-        tcg_temp_free_i64(o.in2);
-    }
-    if (o.addr1) {
-        tcg_temp_free_i64(o.addr1);
-    }
-    if (o.out_128) {
-        tcg_temp_free_i128(o.out_128);
-    }
-    if (o.in1_128) {
-        tcg_temp_free_i128(o.in1_128);
-    }
-    if (o.in2_128) {
-        tcg_temp_free_i128(o.in2_128);
-    }
     /* io should be the last instruction in tb when icount is enabled */
     if (unlikely(icount && ret == DISAS_NEXT)) {
         ret = DISAS_TOO_MANY;
-- 
2.34.1


