Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0B3895EE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:57:13 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRNX-0000Ek-S6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyx-0004hp-E3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:47 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:45967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyh-0005q9-49
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:46 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so3212007oop.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGPkMnHncYPRjpbgxeSiThUfzvY8NqHBArvTydIYpa0=;
 b=VxCbeBaDAVJea+pkF4JkaDCYaqpgeCJBA3Aq9kzqV+D4O6Fa0CNzjW0x+7GLOHBF6P
 T3HWED9YR0n2qoBxHenV69cAKCFXvLHFBEkpvq2oIt4c58A3qQehRvvrmFd+YY9P/SIo
 4ohoCOQyDfjadtM/miTvxt8ciDpFiw9wdULfK6ND7P3qupLwvihGeRvY9bGfALwfaWnN
 grVqXOxUk5rVHZQ6VQE4z6K9yc1qLIqdVolsHM9Rp3QM6/qfKo4HAH88YFIrPio88HO9
 HOFua9bFMcABcd2Zz9Ls42XGxdm9YYTtQmON+GlDe700CM9jD3JzgS5IumJXxrYgEW/8
 blnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGPkMnHncYPRjpbgxeSiThUfzvY8NqHBArvTydIYpa0=;
 b=UVUYugKbfPSDkCEDocurHwiAkwefahZR1ksHlzgOGy0w+efEqlQ8h7wKD0ai9AE06C
 OmCQhOhP59qGktV1i01JH+zLCXxA6Nw+7eIQb+U6uhfgoWyiPK+wDWEejtJxe/Vqwct0
 La/lGmf2BcB+qzTUTrz1RJOWRqbnhf5gdcd2rXt/c68VbcfkpAe8GCv316Gbr0D5E9VA
 UAX1II1Q9dk3hvh3WAeP40ILeNgAiU96uzRIU0EFUJjXIJoxXJFuyJsh6MArJU+1iRRr
 LCRWJ1BXZQgSjMNvZjsx7UNFHMUdmphphTT4lCaMPyyQRUCH64hIcUotDo8JBj824mWY
 QG/Q==
X-Gm-Message-State: AOAM533kuKo0p72Mc9fjz0hHw+jvzfcawhlmpipIUUx6Ibn++QNL0DW5
 hZdveqAIH52JOE2NLkOU4W8kzwZKaZb+Yfk1
X-Google-Smtp-Source: ABdhPJzHl+NCsRBebWfLy+GDjtfqryz8JtfW4gtREH/7mm+ZaPGxySDorfyRf5J9gxv62N70lsFONA==
X-Received: by 2002:a4a:49c8:: with SMTP id z191mr553771ooa.62.1621449088759; 
 Wed, 19 May 2021 11:31:28 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/50] target/i386: Remove pc_start argument to
 gen_svm_check_intercept
Date: Wed, 19 May 2021 13:30:37 -0500
Message-Id: <20210519183050.875453-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When exiting helper_svm_check_intercept via exception, cpu_vmexit
calls cpu_restore_state, which will recover eip and cc_op via unwind.
Therefore we do not need to store eip or cc_op before the call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-38-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 45 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ad2e6cdd8c..3844c0342e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2423,15 +2423,12 @@ static inline int svm_is_rep(int prefixes)
     return ((prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) ? 8 : 0);
 }
 
-static void gen_svm_check_intercept(DisasContext *s, target_ulong pc_start,
-                                    uint32_t type)
+static void gen_svm_check_intercept(DisasContext *s, uint32_t type)
 {
     /* no SVM activated; fast case */
     if (likely(!GUEST(s))) {
         return;
     }
-    gen_update_cc_op(s);
-    gen_jmp_im(s, pc_start - s->cs_base);
     gen_helper_svm_check_intercept(cpu_env, tcg_constant_i32(type));
 }
 
@@ -6639,7 +6636,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         val = 0;
         goto do_lret;
     case 0xcf: /* iret */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
+        gen_svm_check_intercept(s, SVM_EXIT_IRET);
         if (!PE(s) || VM86(s)) {
             /* real mode or vm86 mode */
             if (!check_vm86_iopl(s)) {
@@ -6761,7 +6758,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* flags */
     case 0x9c: /* pushf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
+        gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
         if (check_vm86_iopl(s)) {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, cpu_env);
@@ -6769,7 +6766,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x9d: /* popf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
+        gen_svm_check_intercept(s, SVM_EXIT_POPF);
         if (check_vm86_iopl(s)) {
             ot = gen_pop_T0(s);
             if (CPL(s) == 0) {
@@ -7143,7 +7140,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_ICEBP);
+        gen_svm_check_intercept(s, SVM_EXIT_ICEBP);
         gen_debug(s);
         break;
 #endif
@@ -7347,7 +7344,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0: /* sldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
             ot = mod == 3 ? dflag : MO_16;
@@ -7357,7 +7354,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
+                gen_svm_check_intercept(s, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lldt(cpu_env, s->tmp2_i32);
@@ -7366,7 +7363,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 1: /* str */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
             ot = mod == 3 ? dflag : MO_16;
@@ -7376,7 +7373,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
+                gen_svm_check_intercept(s, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ltr(cpu_env, s->tmp2_i32);
@@ -7404,7 +7401,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
                              cpu_env, offsetof(CPUX86State, gdt.limit));
@@ -7460,7 +7457,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
             gen_op_st_v(s, MO_16, s->T0, s->A0);
@@ -7580,7 +7577,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 || !PE(s)) {
                 goto illegal_op;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_SKINIT);
+            gen_svm_check_intercept(s, SVM_EXIT_SKINIT);
             /* If not intercepted, not implemented -- raise #UD. */
             goto illegal_op;
 
@@ -7600,7 +7597,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7616,7 +7613,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7629,7 +7626,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_OP(4): /* smsw */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             /*
              * In 32-bit mode, the higher 16 bits of the destination
@@ -7661,7 +7658,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_helper_lmsw(cpu_env, s->T0);
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -7718,7 +7715,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
         if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
+            gen_svm_check_intercept(s, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
         }
         break;
@@ -8108,14 +8105,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (b & 2) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_DR0 + reg);
+                gen_svm_check_intercept(s, SVM_EXIT_WRITE_DR0 + reg);
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
                 gen_jmp_im(s, s->pc - s->cs_base);
                 gen_eob(s);
             } else {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_DR0 + reg);
+                gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
@@ -8124,7 +8121,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x106: /* clts */
         if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -8351,7 +8348,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_nop_modrm(env, s, modrm);
         break;
     case 0x1aa: /* rsm */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_RSM);
+        gen_svm_check_intercept(s, SVM_EXIT_RSM);
         if (!(s->flags & HF_SMM_MASK))
             goto illegal_op;
 #ifdef CONFIG_USER_ONLY
-- 
2.25.1


