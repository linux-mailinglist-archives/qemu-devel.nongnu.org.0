Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1CB5F1CE6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:40:23 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedfC-00018N-CL
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCY-0003V3-Cs
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:46 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCV-0004GN-94
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:46 -0400
Received: by mail-qv1-xf33.google.com with SMTP id g9so701895qvo.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1Hce11Nn8itC4nTvYRhZlWUTG2ShBRBkDeBMRp0AJxw=;
 b=G223zGm9JKNBxIMtaChxHDqQoCjiXeoTM47v6/rk/Ptiun6X6a2Tb8MdS/1FO+DAT+
 /v1t2FGLtVv3m13bk1603skFvZoi/9vEnO1y0Dw5/dRcsBtVZAmpOidoKMth8HIutq7K
 S3GLOZb4nh0BJM4pQploHKOrhnVnM0gFc79hoCk+izq718sRKj7DKc3Ui9ApC2TFPEJR
 iElhzy3Ey2tOXfhyTmc5tnflDjbXF0rrTTnWeo49o5u8TELKLQHKT0WMjj7pzIHD+Sx8
 SUzOA3ZvPdrZx8XYNWgucXVh9t2sLvtK6QwUHHeiM51NjAEK6qZbtzGO/ZlMm5IiFD7M
 zcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1Hce11Nn8itC4nTvYRhZlWUTG2ShBRBkDeBMRp0AJxw=;
 b=h/6jNEvjzBClipExe3f8ZLUb4FdzVlyZxkGuAwXvWZGqojqw8FN2qju8wRovZK4gb3
 MM9xZb650gd5M/bqRSI8liVW+yZkG2nGUApO3IEtTG5FReh+7Kq5uTytUfu/sKqkcxEd
 cyuO4sdFOv7ghO/REG9rj9CAsjYOge2xutE41mnmTZ3nDljKoF1Dgg6RfEuM/6Gj8jKb
 2vbA8Wd8Rt7Lb+XcIElSs1vTT3sQm5d/+ZkVbgmq8fX4BiuPaCvd8KT3SezibLpXQS41
 G2V3pOCi038XeN6PbOUtbpLOOktSxOSF4gxoA32zY4OtVk8c8reI5F8+yQ+Un1JPZaRc
 SSMg==
X-Gm-Message-State: ACrzQf18Y0Cddr1345nFpuKmIaWY9k0Vv1OBErfdbIOgABnRUVlePavo
 iyI5ldY7ri6PlSI21S0GHATcQ3nnwsXDbWQ/
X-Google-Smtp-Source: AMsMyM5WO9BxwDM4jbDaiGLLjkiSLElsCnoE05vwYOM//Eb+xWEUEPbHQqowtCqm6dCJTrf0t4rNLQ==
X-Received: by 2002:a05:6214:b6a:b0:4ad:68bf:1b8b with SMTP id
 ey10-20020a0562140b6a00b004ad68bf1b8bmr11333207qvb.2.1664633441997; 
 Sat, 01 Oct 2022 07:10:41 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 26/26] target/i386: Enable TARGET_TB_PCREL
Date: Sat,  1 Oct 2022 07:09:35 -0700
Message-Id: <20221001140935.465607-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-param.h     |   4 ++
 target/i386/tcg/tcg-cpu.c   |   8 ++-
 target/i386/tcg/translate.c | 130 ++++++++++++++++++++++++++++--------
 3 files changed, 113 insertions(+), 29 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 9740bd7abd..1e79389761 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -25,4 +25,8 @@
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 3
 
+#ifndef CONFIG_USER_ONLY
+# define TARGET_TB_PCREL 1
+#endif
+
 #endif
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6cf14c83ff..828244abe2 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,9 +49,11 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static void x86_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
-    X86CPU *cpu = X86_CPU(cs);
-
-    cpu->env.eip = tb_pc(tb) - tb->cs_base;
+    /* The instruction pointer is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUX86State *env = cs->env_ptr;
+        env->eip = tb_pc(tb) - tb->cs_base;
+    }
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 689a45256c..279a3ae999 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -78,6 +78,7 @@ typedef struct DisasContext {
 
     target_ulong pc;       /* pc = eip + cs_base */
     target_ulong cs_base;  /* base of CS segment */
+    target_ulong pc_save;
 
     MemOp aflag;
     MemOp dflag;
@@ -480,9 +481,10 @@ static void gen_add_A0_im(DisasContext *s, int val)
     }
 }
 
-static inline void gen_op_jmp_v(TCGv dest)
+static inline void gen_op_jmp_v(DisasContext *s, TCGv dest)
 {
     tcg_gen_mov_tl(cpu_eip, dest);
+    s->pc_save = -1;
 }
 
 static inline
@@ -519,12 +521,24 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 
 static void gen_update_eip_cur(DisasContext *s)
 {
-    tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, s->base.pc_next - s->pc_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
+    }
+    s->pc_save = s->base.pc_next;
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
-    tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, s->pc - s->pc_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
+    }
+    s->pc_save = s->pc;
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -539,6 +553,7 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
 
 static TCGv_i32 eip_next_i32(DisasContext *s)
 {
+    assert(s->pc_save != -1);
     /*
      * This function has two users: lcall_real (always 16-bit mode), and
      * iret_protected (16, 32, or 64-bit mode).  IRET only uses the value
@@ -550,17 +565,38 @@ static TCGv_i32 eip_next_i32(DisasContext *s)
     if (CODE64(s)) {
         return tcg_constant_i32(-1);
     }
-    return tcg_constant_i32(s->pc - s->cs_base);
+    if (TARGET_TB_PCREL) {
+        TCGv_i32 ret = tcg_temp_new_i32();
+        tcg_gen_trunc_tl_i32(ret, cpu_eip);
+        tcg_gen_addi_i32(ret, ret, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_i32(s->pc - s->cs_base);
+    }
 }
 
 static TCGv eip_next_tl(DisasContext *s)
 {
-    return tcg_constant_tl(s->pc - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->pc - s->cs_base);
+    }
 }
 
 static TCGv eip_cur_tl(DisasContext *s)
 {
-    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->base.pc_next - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    }
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -2260,7 +2296,12 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
         ea = cpu_regs[a.base];
     }
     if (!ea) {
-        tcg_gen_movi_tl(s->A0, a.disp);
+        if (TARGET_TB_PCREL && a.base == -2) {
+            /* With cpu_eip ~= pc_save, the expression is pc-relative. */
+            tcg_gen_addi_tl(s->A0, cpu_eip, a.disp - s->pc_save);
+        } else {
+            tcg_gen_movi_tl(s->A0, a.disp);
+        }
         ea = s->A0;
     } else if (a.disp != 0) {
         tcg_gen_addi_tl(s->A0, ea, a.disp);
@@ -2748,32 +2789,58 @@ static void gen_jr(DisasContext *s)
 /* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
-    target_ulong dest = s->pc - s->cs_base + diff;
+    bool use_goto_tb = s->jmp_opt;
+    target_ulong mask = -1;
+    target_ulong new_pc = s->pc + diff;
+    target_ulong new_eip = new_pc - s->cs_base;
 
     /* In 64-bit mode, operand size is fixed at 64 bits. */
     if (!CODE64(s)) {
         if (ot == MO_16) {
-            dest &= 0xffff;
+            mask = 0xffff;
+            if (TARGET_TB_PCREL && CODE32(s)) {
+                use_goto_tb = false;
+            }
         } else {
-            dest &= 0xffffffff;
+            mask = 0xffffffff;
         }
     }
+    new_eip &= mask;
 
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
-    if (!s->jmp_opt) {
-        tcg_gen_movi_tl(cpu_eip, dest);
-        gen_eob(s);
-    } else if (translator_use_goto_tb(&s->base, dest))  {
+
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, new_pc - s->pc_save);
+        /*
+         * If we can prove the branch does not leave the page and we have
+         * no extra masking to apply (data16 branch in code32, see above),
+         * then we have also proven that the addition does not wrap.
+         */
+        if (!use_goto_tb || !is_same_page(&s->base, new_pc)) {
+            tcg_gen_andi_tl(cpu_eip, cpu_eip, mask);
+            use_goto_tb = false;
+        }
+    }
+
+    if (use_goto_tb &&
+        translator_use_goto_tb(&s->base, new_eip + s->cs_base)) {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        tcg_gen_movi_tl(cpu_eip, dest);
+        if (!TARGET_TB_PCREL) {
+            tcg_gen_movi_tl(cpu_eip, new_eip);
+        }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
-        /* jump to another page */
-        tcg_gen_movi_tl(cpu_eip, dest);
-        gen_jr(s);
+        if (!TARGET_TB_PCREL) {
+            tcg_gen_movi_tl(cpu_eip, new_eip);
+        }
+        if (s->jmp_opt) {
+            gen_jr(s);   /* jump to another page */
+        } else {
+            gen_eob(s);  /* exit to main loop */
+        }
     }
 }
 
@@ -5329,7 +5396,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_push_v(s, eip_next_tl(s));
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5359,7 +5426,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5377,7 +5444,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                           eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
-                gen_op_jmp_v(s->T1);
+                gen_op_jmp_v(s, s->T1);
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -6792,7 +6859,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_stack_update(s, val + (1 << ot));
         /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
+        gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
@@ -6800,7 +6867,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_pop_update(s, ot);
         /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
+        gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
@@ -6818,7 +6885,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_ld_v(s, dflag, s->T0, s->A0);
             /* NOTE: keeping EIP updated is not a problem in case of
                exception */
-            gen_op_jmp_v(s->T0);
+            gen_op_jmp_v(s, s->T0);
             /* pop selector */
             gen_add_A0_im(s, 1 << dflag);
             gen_op_ld_v(s, dflag, s->T0, s->A0);
@@ -8680,6 +8747,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
+    dc->pc_save = dc->base.pc_next;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
@@ -8743,9 +8811,14 @@ static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
     dc->prev_insn_end = tcg_last_op();
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
+    if (TARGET_TB_PCREL) {
+        pc_arg -= dc->cs_base;
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, dc->cc_op);
 }
 
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
@@ -8846,7 +8919,12 @@ void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     int cc_op = data[1];
-    env->eip = data[0] - tb->cs_base;
+
+    if (TARGET_TB_PCREL) {
+        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->eip = data[0] - tb->cs_base;
+    }
     if (cc_op != CC_OP_DYNAMIC) {
         env->cc_op = cc_op;
     }
-- 
2.34.1


