Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4445F5FE0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:02:42 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI5p-0000u4-QD
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoD-00041D-Uq
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHo9-0003rM-Va
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q9so748417pgq.8
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yXkCBYrfoDbv6R3Ql1mig8anM1tQMKUy4v7BwF3MXa0=;
 b=FXwtwP7fPlWJ8AIzUFnCDhdagy5PY1sTCzWQED4vPF09YslO6Wl14BquT6LVTHiXLO
 tCPUkj81wo6t9S8ENeW9SfaaPxZN0AWLnnXfJhoq5H26RoR3ZBAeu4bMUAkDMLKDzd7c
 PSErZxpkVj2IvJA0wVpuKzGH/IpA1nd9J7GuJJADjTEKMbGjBvRasYs1p/sqEqzzpjkB
 6SKlQS6c63O0fSMThbZENjF84HggJEcDCH4HXIwmRS+9ARl3UYmTZyNtLqD+ffV2I1F0
 /WOS3ImHXs/CkChGlNHG0C4kTqVNXG8vuUS67EdAkRF253cqDVGqQ6R4mOP5A//lzLZ0
 3gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yXkCBYrfoDbv6R3Ql1mig8anM1tQMKUy4v7BwF3MXa0=;
 b=UBKJ+6LNpZpMyZU6ihoIDxMqNf532cxGOiTTNRyxV60BBN1zLHzSD+89S0wTpn9Vx3
 Wfnq9omOrvjNtjKz3BcckYXEP7AYFyhh3aHR3kxi99C7P+CG8ft7SyvpT7lwzZKBDkb+
 gkACcKo9pVjQcD2QnTKHLUnnTshufeoKM+pJb1BusE/0XIa4vTgG524VnKo/FIr7SulG
 AGjhakANWg/E8uuAQsBpchOVzem9mjcxIZK/CKiGjmkpkX1ugEEZn/+UTV4GnbGMGWs2
 l77tUGC7euDFIUihcXP9DayRlnFVxuoheKSR4sXclZKGsLARy4fZYlwTv5JloE79EIy1
 5a2w==
X-Gm-Message-State: ACrzQf18hMNgipzXwsfuJ835uGAqeB9QgSpOKbIIrVJ/lhWSJaajR7FK
 UMGc39PQCOYz79mAEnZgwqzTYO+N0TAHtw==
X-Google-Smtp-Source: AMsMyM60c8Z7++gfTO0FL88//FUbxQ+e83pYMMMyaMK6776A3rj2qqD35YEQku3Z+Jm2qEH5MBH5ow==
X-Received: by 2002:a63:18f:0:b0:43c:24d2:c0f7 with SMTP id
 137-20020a63018f000000b0043c24d2c0f7mr2702464pgb.470.1665027864396; 
 Wed, 05 Oct 2022 20:44:24 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/26] target/s390x: Use tcg_constant_* in local contexts
Date: Wed,  5 Oct 2022 20:43:56 -0700
Message-Id: <20221006034421.1179141-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace tcg_const_* with tcg_constant_* in contexts
where the free to remove is nearby.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 408 +++++++++++++----------------------
 1 file changed, 145 insertions(+), 263 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..890d1f1db3 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -171,8 +171,6 @@ static uint64_t inline_branch_miss[CC_OP_MAX];
 
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
 {
-    TCGv_i64 tmp;
-
     if (s->base.tb->flags & FLAG_MASK_32) {
         if (s->base.tb->flags & FLAG_MASK_64) {
             tcg_gen_movi_i64(out, pc);
@@ -181,9 +179,7 @@ static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
         pc |= 0x80000000;
     }
     assert(!(s->base.tb->flags & FLAG_MASK_64));
-    tmp = tcg_const_i64(pc);
-    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
-    tcg_temp_free_i64(tmp);
+    tcg_gen_deposit_i64(out, out, tcg_constant_i64(pc), 0, 32);
 }
 
 static TCGv_i64 psw_addr;
@@ -348,11 +344,8 @@ static void per_branch(DisasContext *s, bool to_next)
     tcg_gen_movi_i64(gbea, s->base.pc_next);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 next_pc = to_next ? tcg_const_i64(s->pc_tmp) : psw_addr;
+        TCGv_i64 next_pc = to_next ? tcg_constant_i64(s->pc_tmp) : psw_addr;
         gen_helper_per_branch(cpu_env, gbea, next_pc);
-        if (to_next) {
-            tcg_temp_free_i64(next_pc);
-        }
     }
 #endif
 }
@@ -370,9 +363,8 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
         gen_set_label(lab);
     } else {
-        TCGv_i64 pc = tcg_const_i64(s->base.pc_next);
+        TCGv_i64 pc = tcg_constant_i64(s->base.pc_next);
         tcg_gen_movcond_i64(cond, gbea, arg1, arg2, gbea, pc);
-        tcg_temp_free_i64(pc);
     }
 #endif
 }
@@ -426,23 +418,17 @@ static int get_mem_index(DisasContext *s)
 
 static void gen_exception(int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_program_exception(DisasContext *s, int code)
 {
-    TCGv_i32 tmp;
-
     /* Remember what pgm exeption this was.  */
-    tmp = tcg_const_i32(code);
-    tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUS390XState, int_pgm_code));
-    tcg_temp_free_i32(tmp);
+    tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
+                   offsetof(CPUS390XState, int_pgm_code));
 
-    tmp = tcg_const_i32(s->ilen);
-    tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUS390XState, int_pgm_ilen));
-    tcg_temp_free_i32(tmp);
+    tcg_gen_st_i32(tcg_constant_i32(s->ilen), cpu_env,
+                   offsetof(CPUS390XState, int_pgm_ilen));
 
     /* update the psw */
     update_psw_addr(s);
@@ -461,9 +447,7 @@ static inline void gen_illegal_opcode(DisasContext *s)
 
 static inline void gen_data_exception(uint8_t dxc)
 {
-    TCGv_i32 tmp = tcg_const_i32(dxc);
-    gen_helper_data_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_data_exception(cpu_env, tcg_constant_i32(dxc));
 }
 
 static inline void gen_trap(DisasContext *s)
@@ -584,13 +568,13 @@ static void gen_op_calc_cc(DisasContext *s)
 
     switch (s->cc_op) {
     default:
-        dummy = tcg_const_i64(0);
+        dummy = tcg_constant_i64(0);
         /* FALLTHRU */
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-        local_cc_op = tcg_const_i32(s->cc_op);
+        local_cc_op = tcg_constant_i32(s->cc_op);
         break;
     case CC_OP_CONST0:
     case CC_OP_CONST1:
@@ -660,13 +644,6 @@ static void gen_op_calc_cc(DisasContext *s)
         tcg_abort();
     }
 
-    if (local_cc_op) {
-        tcg_temp_free_i32(local_cc_op);
-    }
-    if (dummy) {
-        tcg_temp_free_i64(dummy);
-    }
-
     /* We now have cc in cc_op as constant */
     set_cc_static(s);
 }
@@ -1284,9 +1261,9 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
            Most commonly we're single-stepping or some other condition that
            disables all use of goto_tb.  Just update the PC and exit.  */
 
-        TCGv_i64 next = tcg_const_i64(s->pc_tmp);
+        TCGv_i64 next = tcg_constant_i64(s->pc_tmp);
         if (is_imm) {
-            cdest = tcg_const_i64(dest);
+            cdest = tcg_constant_i64(dest);
         }
 
         if (c->is_64) {
@@ -1296,21 +1273,15 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         } else {
             TCGv_i32 t0 = tcg_temp_new_i32();
             TCGv_i64 t1 = tcg_temp_new_i64();
-            TCGv_i64 z = tcg_const_i64(0);
+            TCGv_i64 z = tcg_constant_i64(0);
             tcg_gen_setcond_i32(c->cond, t0, c->u.s32.a, c->u.s32.b);
             tcg_gen_extu_i32_i64(t1, t0);
             tcg_temp_free_i32(t0);
             tcg_gen_movcond_i64(TCG_COND_NE, psw_addr, t1, z, cdest, next);
             per_branch_cond(s, TCG_COND_NE, t1, z);
             tcg_temp_free_i64(t1);
-            tcg_temp_free_i64(z);
         }
 
-        if (is_imm) {
-            tcg_temp_free_i64(cdest);
-        }
-        tcg_temp_free_i64(next);
-
         ret = DISAS_PC_UPDATED;
     }
 
@@ -1394,10 +1365,9 @@ static DisasJumpType op_addc64(DisasContext *s, DisasOps *o)
 {
     compute_carry(s);
 
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, zero);
     tcg_gen_add2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
-    tcg_temp_free_i64(zero);
 
     return DISAS_NEXT;
 }
@@ -2077,9 +2047,8 @@ static DisasJumpType op_clc(DisasContext *s, DisasOps *o)
         tcg_gen_qemu_ld64(cc_dst, o->in2, get_mem_index(s));
         break;
     default:
-        vl = tcg_const_i32(l);
+        vl = tcg_constant_i32(l);
         gen_helper_clc(cc_op, cpu_env, vl, o->addr1, o->in2);
-        tcg_temp_free_i32(vl);
         set_cc_static(s);
         return DISAS_NEXT;
     }
@@ -2099,11 +2068,9 @@ static DisasJumpType op_clcl(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t2 = tcg_const_i32(r2);
+    t1 = tcg_constant_i32(r1);
+    t2 = tcg_constant_i32(r2);
     gen_helper_clcl(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2120,11 +2087,9 @@ static DisasJumpType op_clcle(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_clcle(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2141,24 +2106,22 @@ static DisasJumpType op_clclu(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_clclu(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 m3 = tcg_const_i32(get_field(s, m3));
+    TCGv_i32 m3 = tcg_constant_i32(get_field(s, m3));
     TCGv_i32 t1 = tcg_temp_new_i32();
+
     tcg_gen_extrl_i64_i32(t1, o->in1);
     gen_helper_clm(cc_op, cpu_env, t1, m3, o->in2);
     set_cc_static(s);
     tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(m3);
     return DISAS_NEXT;
 }
 
@@ -2217,8 +2180,8 @@ static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
 
     /* Note that R1:R1+1 = expected value and R3:R3+1 = new value.  */
     addr = get_address(s, 0, b2, d2);
-    t_r1 = tcg_const_i32(r1);
-    t_r3 = tcg_const_i32(r3);
+    t_r1 = tcg_constant_i32(r1);
+    t_r3 = tcg_constant_i32(r3);
     if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
         gen_helper_cdsg(cpu_env, addr, t_r1, t_r3);
     } else if (HAVE_CMPXCHG128) {
@@ -2228,8 +2191,6 @@ static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
         ret = DISAS_NORETURN;
     }
     tcg_temp_free_i64(addr);
-    tcg_temp_free_i32(t_r1);
-    tcg_temp_free_i32(t_r3);
 
     set_cc_static(s);
     return ret;
@@ -2238,14 +2199,13 @@ static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
 static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
 {
     int r3 = get_field(s, r3);
-    TCGv_i32 t_r3 = tcg_const_i32(r3);
+    TCGv_i32 t_r3 = tcg_constant_i32(r3);
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_csst_parallel(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     } else {
         gen_helper_csst(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     }
-    tcg_temp_free_i32(t_r3);
 
     set_cc_static(s);
     return DISAS_NEXT;
@@ -2343,9 +2303,9 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
         m3 = 0;
     }
 
-    tr1 = tcg_const_i32(r1);
-    tr2 = tcg_const_i32(r2);
-    chk = tcg_const_i32(m3);
+    tr1 = tcg_constant_i32(r1);
+    tr2 = tcg_constant_i32(r2);
+    chk = tcg_constant_i32(m3);
 
     switch (s->insn->data) {
     case 12:
@@ -2370,9 +2330,6 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
         g_assert_not_reached();
     }
 
-    tcg_temp_free_i32(tr1);
-    tcg_temp_free_i32(tr2);
-    tcg_temp_free_i32(chk);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2380,15 +2337,11 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
-    TCGv_i32 func_code = tcg_const_i32(get_field(s, i2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+    TCGv_i32 func_code = tcg_constant_i32(get_field(s, i2));
 
     gen_helper_diag(cpu_env, r1, r3, func_code);
-
-    tcg_temp_free_i32(func_code);
-    tcg_temp_free_i32(r3);
-    tcg_temp_free_i32(r1);
     return DISAS_NEXT;
 }
 #endif
@@ -2494,18 +2447,13 @@ static DisasJumpType op_ex(DisasContext *s, DisasOps *o)
     update_cc_op(s);
 
     if (r1 == 0) {
-        v1 = tcg_const_i64(0);
+        v1 = tcg_constant_i64(0);
     } else {
         v1 = regs[r1];
     }
 
-    ilen = tcg_const_i32(s->ilen);
+    ilen = tcg_constant_i32(s->ilen);
     gen_helper_ex(cpu_env, ilen, v1, o->in2);
-    tcg_temp_free_i32(ilen);
-
-    if (r1 == 0) {
-        tcg_temp_free_i64(v1);
-    }
 
     return DISAS_PC_CC_UPDATED;
 }
@@ -2657,12 +2605,11 @@ static DisasJumpType op_idte(DisasContext *s, DisasOps *o)
     TCGv_i32 m4;
 
     if (s390_has_feat(S390_FEAT_LOCAL_TLB_CLEARING)) {
-        m4 = tcg_const_i32(get_field(s, m4));
+        m4 = tcg_constant_i32(get_field(s, m4));
     } else {
-        m4 = tcg_const_i32(0);
+        m4 = tcg_constant_i32(0);
     }
     gen_helper_idte(cpu_env, o->in1, o->in2, m4);
-    tcg_temp_free_i32(m4);
     return DISAS_NEXT;
 }
 
@@ -2671,12 +2618,11 @@ static DisasJumpType op_ipte(DisasContext *s, DisasOps *o)
     TCGv_i32 m4;
 
     if (s390_has_feat(S390_FEAT_LOCAL_TLB_CLEARING)) {
-        m4 = tcg_const_i32(get_field(s, m4));
+        m4 = tcg_constant_i32(get_field(s, m4));
     } else {
-        m4 = tcg_const_i32(0);
+        m4 = tcg_constant_i32(0);
     }
     gen_helper_ipte(cpu_env, o->in1, o->in2, m4);
-    tcg_temp_free_i32(m4);
     return DISAS_NEXT;
 }
 
@@ -2732,16 +2678,12 @@ static DisasJumpType op_msa(DisasContext *s, DisasOps *o)
         g_assert_not_reached();
     };
 
-    t_r1 = tcg_const_i32(r1);
-    t_r2 = tcg_const_i32(r2);
-    t_r3 = tcg_const_i32(r3);
-    type = tcg_const_i32(s->insn->data);
+    t_r1 = tcg_constant_i32(r1);
+    t_r2 = tcg_constant_i32(r2);
+    t_r3 = tcg_constant_i32(r3);
+    type = tcg_constant_i32(s->insn->data);
     gen_helper_msa(cc_op, cpu_env, t_r1, t_r2, t_r3, type);
     set_cc_static(s);
-    tcg_temp_free_i32(t_r1);
-    tcg_temp_free_i32(t_r2);
-    tcg_temp_free_i32(t_r3);
-    tcg_temp_free_i32(type);
     return DISAS_NEXT;
 }
 
@@ -3002,10 +2944,9 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
         tcg_gen_extu_i32_i64(t, t32);
         tcg_temp_free_i32(t32);
 
-        z = tcg_const_i64(0);
+        z = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_NE, o->out, t, z, o->in2, o->in1);
         tcg_temp_free_i64(t);
-        tcg_temp_free_i64(z);
     }
 
     return DISAS_NEXT;
@@ -3014,11 +2955,10 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lctl(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -3026,11 +2966,10 @@ static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lctlg(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -3090,11 +3029,10 @@ static DisasJumpType op_lpswe(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lam(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lam(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -3304,9 +3242,6 @@ static DisasJumpType op_lcbb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
 {
-#if !defined(CONFIG_USER_ONLY)
-    TCGv_i32 i2;
-#endif
     const uint16_t monitor_class = get_field(s, i2);
 
     if (monitor_class & 0xff00) {
@@ -3315,9 +3250,8 @@ static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    i2 = tcg_const_i32(monitor_class);
-    gen_helper_monitor_call(cpu_env, o->addr1, i2);
-    tcg_temp_free_i32(i2);
+    gen_helper_monitor_call(cpu_env, o->addr1,
+                            tcg_constant_i32(monitor_class));
 #endif
     /* Defaults to a NOP. */
     return DISAS_NEXT;
@@ -3381,9 +3315,9 @@ static DisasJumpType op_movx(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvc(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3395,9 +3329,9 @@ static DisasJumpType op_mvcrl(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvcin(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvcin(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3413,11 +3347,9 @@ static DisasJumpType op_mvcl(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t2 = tcg_const_i32(r2);
+    t1 = tcg_constant_i32(r1);
+    t2 = tcg_constant_i32(r2);
     gen_helper_mvcl(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3434,11 +3366,9 @@ static DisasJumpType op_mvcle(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_mvcle(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3455,11 +3385,9 @@ static DisasJumpType op_mvclu(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_mvclu(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3492,49 +3420,45 @@ static DisasJumpType op_mvcs(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvn(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvn(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvo(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvo(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvpg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 t1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 t2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_mvpg(cc_op, cpu_env, regs[0], t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 t1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 t2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_mvst(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvz(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvz(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3622,13 +3546,12 @@ static DisasJumpType op_msdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_nabs(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 z, n;
-    z = tcg_const_i64(0);
-    n = tcg_temp_new_i64();
+    TCGv_i64 z = tcg_constant_i64(0);
+    TCGv_i64 n = tcg_temp_new_i64();
+
     tcg_gen_neg_i64(n, o->in2);
     tcg_gen_movcond_i64(TCG_COND_GE, o->out, o->in2, z, n, o->in2);
     tcg_temp_free_i64(n);
-    tcg_temp_free_i64(z);
     return DISAS_NEXT;
 }
 
@@ -3653,9 +3576,9 @@ static DisasJumpType op_nabsf128(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_nc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_nc(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3687,9 +3610,9 @@ static DisasJumpType op_negf128(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_oc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_oc(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3739,9 +3662,9 @@ static DisasJumpType op_oi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_pack(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_pack(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3755,9 +3678,8 @@ static DisasJumpType op_pka(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l2);
+    l = tcg_constant_i32(l2);
     gen_helper_pka(cpu_env, o->addr1, o->in2, l);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3771,9 +3693,8 @@ static DisasJumpType op_pku(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l2);
+    l = tcg_constant_i32(l2);
     gen_helper_pku(cpu_env, o->addr1, o->in2, l);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -4020,9 +3941,8 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
     }
     s->pc_tmp &= mask;
 
-    tsam = tcg_const_i64(sam);
+    tsam = tcg_constant_i64(sam);
     tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
-    tcg_temp_free_i64(tsam);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
     return DISAS_TOO_MANY;
@@ -4083,12 +4003,11 @@ static DisasJumpType op_servc(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sigp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_sigp(cc_op, cpu_env, o->in2, r1, r3);
     set_cc_static(s);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 #endif
@@ -4357,21 +4276,19 @@ static DisasJumpType op_stckc(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stctg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stctg(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_stctl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stctl(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -4598,11 +4515,10 @@ static DisasJumpType op_st64(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stam(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stam(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -4660,7 +4576,7 @@ static DisasJumpType op_stm(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
     int size = s->insn->data;
-    TCGv_i64 tsize = tcg_const_i64(size);
+    TCGv_i64 tsize = tcg_constant_i64(size);
 
     while (1) {
         if (size == 8) {
@@ -4675,7 +4591,6 @@ static DisasJumpType op_stm(DisasContext *s, DisasOps *o)
         r1 = (r1 + 1) & 15;
     }
 
-    tcg_temp_free_i64(tsize);
     return DISAS_NEXT;
 }
 
@@ -4684,8 +4599,8 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
     TCGv_i64 t = tcg_temp_new_i64();
-    TCGv_i64 t4 = tcg_const_i64(4);
-    TCGv_i64 t32 = tcg_const_i64(32);
+    TCGv_i64 t4 = tcg_constant_i64(4);
+    TCGv_i64 t32 = tcg_constant_i64(32);
 
     while (1) {
         tcg_gen_shl_i64(t, regs[r1], t32);
@@ -4698,8 +4613,6 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
     }
 
     tcg_temp_free_i64(t);
-    tcg_temp_free_i64(t4);
-    tcg_temp_free_i64(t32);
     return DISAS_NEXT;
 }
 
@@ -4718,26 +4631,20 @@ static DisasJumpType op_stpq(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_srst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_srst(cpu_env, r1, r2);
-
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_srstu(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_srstu(cpu_env, r1, r2);
-
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4795,10 +4702,9 @@ static DisasJumpType op_subb64(DisasContext *s, DisasOps *o)
      * Borrow is {0, -1}, so add to subtract; replicate the
      * borrow input to produce 128-bit -1 for the addition.
      */
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, cc_src);
     tcg_gen_sub2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
-    tcg_temp_free_i64(zero);
 
     return DISAS_NEXT;
 }
@@ -4810,13 +4716,11 @@ static DisasJumpType op_svc(DisasContext *s, DisasOps *o)
     update_psw_addr(s);
     update_cc_op(s);
 
-    t = tcg_const_i32(get_field(s, i1) & 0xff);
+    t = tcg_constant_i32(get_field(s, i1) & 0xff);
     tcg_gen_st_i32(t, cpu_env, offsetof(CPUS390XState, int_svc_code));
-    tcg_temp_free_i32(t);
 
-    t = tcg_const_i32(s->ilen);
+    t = tcg_constant_i32(s->ilen);
     tcg_gen_st_i32(t, cpu_env, offsetof(CPUS390XState, int_svc_ilen));
-    tcg_temp_free_i32(t);
 
     gen_exception(EXCP_SVC);
     return DISAS_NORETURN;
@@ -4873,18 +4777,18 @@ static DisasJumpType op_tprot(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l1 = tcg_const_i32(get_field(s, l1) + 1);
+    TCGv_i32 l1 = tcg_constant_i32(get_field(s, l1) + 1);
+
     gen_helper_tp(cc_op, cpu_env, o->addr1, l1);
-    tcg_temp_free_i32(l1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_tr(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4899,27 +4803,27 @@ static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_trt(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_trt(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_trtr(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_trtr(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
-    TCGv_i32 sizes = tcg_const_i32(s->insn->opc & 3);
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
+    TCGv_i32 sizes = tcg_constant_i32(s->insn->opc & 3);
     TCGv_i32 tst = tcg_temp_new_i32();
     int m3 = get_field(s, m3);
 
@@ -4938,9 +4842,6 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
     }
     gen_helper_trXX(cc_op, cpu_env, r1, r2, tst, sizes);
 
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
-    tcg_temp_free_i32(sizes);
     tcg_temp_free_i32(tst);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4948,19 +4849,19 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ts(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(0xff);
+    TCGv_i32 t1 = tcg_constant_i32(0xff);
+
     tcg_gen_atomic_xchg_i32(t1, o->in2, t1, get_mem_index(s), MO_UB);
     tcg_gen_extract_i32(cc_op, t1, 7, 1);
-    tcg_temp_free_i32(t1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_unpk(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_unpk(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -4974,9 +4875,8 @@ static DisasJumpType op_unpka(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l1);
+    l = tcg_constant_i32(l1);
     gen_helper_unpka(cc_op, cpu_env, o->addr1, l, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4991,9 +4891,8 @@ static DisasJumpType op_unpku(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l1);
+    l = tcg_constant_i32(l1);
     gen_helper_unpku(cc_op, cpu_env, o->addr1, l, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5012,7 +4911,7 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
 
     /* If the addresses are identical, this is a store/memset of zero.  */
     if (b1 == b2 && d1 == d2 && (l + 1) <= 32) {
-        o->in2 = tcg_const_i64(0);
+        o->in2 = tcg_constant_i64(0);
 
         l++;
         while (l >= 8) {
@@ -5045,9 +4944,8 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
 
     /* But in general we'll defer to a helper.  */
     o->in2 = get_address(s, 0, b2, d2);
-    t32 = tcg_const_i32(l);
+    t32 = tcg_constant_i32(l);
     gen_helper_xc(cc_op, cpu_env, t32, o->addr1, o->in2);
-    tcg_temp_free_i32(t32);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5112,46 +5010,39 @@ static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_clp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_clp(cpu_env, r2);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcilg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_pcilg(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcistg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_pcistg(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_stpcifc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_stpcifc(cpu_env, r1, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5164,38 +5055,31 @@ static DisasJumpType op_sic(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_rpcit(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_rpcit(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcistb(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_pcistb(cpu_env, r1, r3, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mpcifc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_mpcifc(cpu_env, r1, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -6316,9 +6200,8 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
 
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
-        TCGv_i64 zero = tcg_const_i64(0);
-        tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
-        tcg_temp_free_i64(zero);
+        tcg_gen_st_i64(tcg_constant_i64(0), cpu_env,
+                       offsetof(CPUS390XState, ex_value));
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
@@ -6444,9 +6327,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 #ifndef CONFIG_USER_ONLY
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 addr = tcg_const_i64(s->base.pc_next);
+        TCGv_i64 addr = tcg_constant_i64(s->base.pc_next);
         gen_helper_per_ifetch(cpu_env, addr);
-        tcg_temp_free_i64(addr);
     }
 #endif
 
-- 
2.34.1


