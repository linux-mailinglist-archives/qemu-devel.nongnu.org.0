Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9EB59CC99
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:57:33 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHIS-0002Mk-NV
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvc-0006AR-4v
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007Hu-Mo
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 20so11297537plo.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=89w0t8uvG/Xr6P47JSYwDEJn3f8tjoXZNYNMv9BRJFI=;
 b=s1gnqxeXhChrlh31mUUnqxjSkKJsW2M0XVSUD4MRgYJKGU+yDlG90q7gwXl3ecDOnM
 cfz11xOzYXu3uwmNjzGqWdmc7KxvtIvw66cuA9/0Wn8YmnQ9KlknUeBCscLLBd8dCb2K
 fZWO/mF8IdIJeib5/YPOW540D/GhjUZ8KF00P9Db1FCtwdzS1V4vGYqoR9oCnJpLbkwx
 drCAxdwzv2TPIXbmJ4S9caLig0MwRjgMjbXPEiZfZcX9grxEKVWZfCTaSoNJ7jNy5tt8
 h62eFiZlBkRo1oMp9KmxodWKNlMkN1PE9GVyssMaOi97LQBbV3Xvx233g7W+8rcNeGj8
 AK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=89w0t8uvG/Xr6P47JSYwDEJn3f8tjoXZNYNMv9BRJFI=;
 b=kFsLSyAIV7WEeNhV0KYdu6/kWiBsBZsWaGbJ33FgKU0VPEa/SftfZHvjgXFNNtnLyS
 EqfButdDZEC9SwTrwFYRa/kjJ576CKEsli5pp42Jj0mJulVOPYC8GQGBnR0LMnIE5XGM
 Dep9XaPBnKP31sG7lPdriKAXm59D0hQvU884lsUVgn8YIgbsI0AQZJ1+dDk9vHSq/3Wt
 rjZmuxOg2x/125n7qL1o6ajGEeE93Es4uUB8LE29qgq8ROpnTG5j894IvJdy0YM8ekcd
 cj/zJIFU0+CM0N6kj1ZUnB4fH3wctTBvVrRbvuIrX7ftqA48u8TSY7lPu3rZF79stc2s
 ky1w==
X-Gm-Message-State: ACgBeo2pylJUlT/fz6FPyT3X13pWcYXkcWRlj3NbdOdsz19yt2Pt+Hfp
 VZC/SeI+ttwjY+WiJEjvVBJ3i2wOXRmOmg==
X-Google-Smtp-Source: AA6agR5PkZi7MfIXFddwYhkj0ppd9QOp9IrqXlUMl9bABzgerPtqVacVRx9YQlX75+duYue7FPnyUA==
X-Received: by 2002:a17:90b:1a8f:b0:1f7:299d:9c08 with SMTP id
 ng15-20020a17090b1a8f00b001f7299d9c08mr641670pjb.190.1661211229134; 
 Mon, 22 Aug 2022 16:33:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/22] target/i386: Enable TARGET_TB_PCREL
Date: Mon, 22 Aug 2022 16:33:18 -0700
Message-Id: <20220822233318.1728621-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 target/i386/cpu-param.h     |  1 +
 target/i386/tcg/tcg-cpu.c   |  8 ++--
 target/i386/tcg/translate.c | 86 ++++++++++++++++++++++++++++++-------
 3 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 9740bd7abd..51a3f153bf 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -24,5 +24,6 @@
 #endif
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 3
+#define TARGET_TB_PCREL 1
 
 #endif
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 76989a5a9d..74333247c5 100644
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
index 6192a3e30e..5e252f26b2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -64,6 +64,7 @@
 
 /* global register indexes */
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2;
+static TCGv cpu_eip;
 static TCGv_i32 cpu_cc_op;
 static TCGv cpu_regs[CPU_NB_REGS];
 static TCGv cpu_seg_base[6];
@@ -77,6 +78,7 @@ typedef struct DisasContext {
 
     target_ulong pc;       /* pc = eip + cs_base */
     target_ulong cs_base;  /* base of CS segment */
+    target_ulong pc_save;
 
     MemOp aflag;
     MemOp dflag;
@@ -481,7 +483,7 @@ static void gen_add_A0_im(DisasContext *s, int val)
 
 static inline void gen_op_jmp_v(TCGv dest)
 {
-    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUX86State, eip));
+    tcg_gen_mov_tl(cpu_eip, dest);
 }
 
 static inline
@@ -516,24 +518,36 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static TCGv gen_eip_cur(DisasContext *s)
+static void gen_jmp_im(DisasContext *s, target_ulong eip)
 {
-    return tcg_constant_tl(s->base.pc_next - s->cs_base);
-}
-
-static void gen_jmp_im(DisasContext *s, target_ulong pc)
-{
-    gen_op_jmp_v(tcg_constant_tl(pc));
+    if (TARGET_TB_PCREL) {
+        target_ulong eip_save = s->pc_save - s->cs_base;
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, eip - eip_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, eip);
+    }
 }
 
 static void gen_update_eip_cur(DisasContext *s)
 {
     gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    s->pc_save = s->base.pc_next;
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
     gen_jmp_im(s, s->pc - s->cs_base);
+    s->pc_save = s->pc;
+}
+
+static TCGv gen_eip_cur(DisasContext *s)
+{
+    if (TARGET_TB_PCREL) {
+        gen_update_eip_cur(s);
+        return cpu_eip;
+    } else {
+        return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    }
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -548,12 +562,25 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
 
 static TCGv_i32 eip_next_i32(DisasContext *s)
 {
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
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->pc - s->cs_base);
+    }
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -2252,7 +2279,12 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
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
@@ -2366,8 +2398,13 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 
     if (translator_use_goto_tb(&s->base, pc))  {
         /* jump to same page: we can use a direct jump */
-        tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, eip);
+        if (TARGET_TB_PCREL) {
+            gen_jmp_im(s, eip);
+            tcg_gen_goto_tb(tb_num);
+        } else {
+            tcg_gen_goto_tb(tb_num);
+            gen_jmp_im(s, eip);
+        }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -8458,6 +8495,13 @@ void tcg_x86_init(void)
         [R_EDI] = "edi",
         [R_EBP] = "ebp",
         [R_ESP] = "esp",
+#endif
+    };
+    static const char eip_name[] = {
+#ifdef TARGET_X86_64
+        "rip"
+#else
+        "eip"
 #endif
     };
     static const char seg_base_names[6][8] = {
@@ -8484,6 +8528,7 @@ void tcg_x86_init(void)
                                     "cc_src");
     cpu_cc_src2 = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, cc_src2),
                                      "cc_src2");
+    cpu_eip = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, eip), eip_name);
 
     for (i = 0; i < CPU_NB_REGS; ++i) {
         cpu_regs[i] = tcg_global_mem_new(cpu_env,
@@ -8520,6 +8565,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
+    dc->pc_save = dc->base.pc_next;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
@@ -8583,9 +8629,14 @@ static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
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
@@ -8686,7 +8737,12 @@ void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
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


