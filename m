Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E678932757D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:10:42 +0100 (CET)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGW93-0000Ex-VW
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPw-0005sY-8x
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:04 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPn-0007mY-8o
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:04 -0500
Received: by mail-pl1-x630.google.com with SMTP id a24so8747929plm.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOmn4vLtGuk+9owXg8+vXu4xydwRiHW7SfVMSLAig3M=;
 b=ZYejGaGNaC4uSzAM2cLSwVp1FhT/TByoXTAAivyX6P2Ks+z7CyDyhvZX6d0YagujFM
 qufJK6X3QlE7FMzGPWyBBUAMRL5G1LNTvKD89In89EBrPLcLsXtz4Oc5wffh3Rie00ED
 Yb300w2cVNenJYJGiHxKaLfZn9s8cfUsY7Z+MFch1MnqAuiA95yhsvhDllgWdVaGzZZ8
 YqeVSrUywAvFWi+pENtGX+SFTq+qs9YgWXRLY8optW3BywG+0l9SITyPTN1vfxSMryWZ
 VKXYEUXmT4/sldoTDluywf9b6QQpaH2LcAMiLLn4yczXiIVNuYsc7aFdipDItqfBu/PW
 7elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOmn4vLtGuk+9owXg8+vXu4xydwRiHW7SfVMSLAig3M=;
 b=Oc8UCQFL/ownEmtxQmkHCrsCq8/cEaAP9kxvVRN/eXjineFAUNlWl1KGjOCJpBuEzF
 WTdw1B7lCjOWbrhkqoHm5anfVEfZi+1jij3mz4CfyK7/eTYFWhquSPLZ5A4cie2NxmhZ
 vg7Fixi8BhRUhpD2j4xvB7hqCwoWoDuIS+Tzpl4AyphZDXru3pCTsBjk0YWTkovmXoWC
 VGEwrugEn3qzBu+zq6SE4PvHPJ28/Yv0yVhyGEDm5C41g34k1kc6ltODiEEyc5HcpieY
 MxusUnarGHzvV/zZl9NRMWe5dxofrC8PniSeF0LXb6pRI6pMFSC2zOGL5iJUaA2pGz3U
 LNMQ==
X-Gm-Message-State: AOAM531yemc92712gS7F5mboZLUTwKG8KWIeRI+oWY8mggU/MAg+fxhr
 8XZwKeXU58cKLk4wEhyLaFm8L8b0ZqVuXA==
X-Google-Smtp-Source: ABdhPJxA913xnunNgwXbay9Ubi74pksC30W1AmmgVqjV7JEdjgaVN31zlTCk/7PV7Q/UGEXmXVo34w==
X-Received: by 2002:a17:902:768b:b029:e3:fb85:1113 with SMTP id
 m11-20020a170902768bb02900e3fb851113mr13115655pll.3.1614554633433; 
 Sun, 28 Feb 2021 15:23:53 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/50] target/i386: Remove pc_start argument to
 gen_svm_check_intercept
Date: Sun, 28 Feb 2021 15:23:08 -0800
Message-Id: <20210228232321.322053-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When exiting helper_svm_check_intercept via exception, cpu_vmexit
calls cpu_restore_state, which will recover eip and cc_op via unwind.
Therefore we do not need to store eip or cc_op before the call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 45 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cbc0cc3ccc..33faffe00f 100644
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
 
@@ -6633,7 +6630,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         val = 0;
         goto do_lret;
     case 0xcf: /* iret */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
+        gen_svm_check_intercept(s, SVM_EXIT_IRET);
         if (!PE(s) || VM86(s)) {
             /* real mode or vm86 mode */
             if (!check_vm86_iopl(s)) {
@@ -6755,7 +6752,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* flags */
     case 0x9c: /* pushf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
+        gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
         if (check_vm86_iopl(s)) {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, cpu_env);
@@ -6763,7 +6760,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x9d: /* popf */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
+        gen_svm_check_intercept(s, SVM_EXIT_POPF);
         if (check_vm86_iopl(s)) {
             ot = gen_pop_T0(s);
             if (CPL(s) == 0) {
@@ -7137,7 +7134,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
-        gen_svm_check_intercept(s, pc_start, SVM_EXIT_ICEBP);
+        gen_svm_check_intercept(s, SVM_EXIT_ICEBP);
         gen_debug(s);
         break;
 #endif
@@ -7341,7 +7338,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0: /* sldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
             ot = mod == 3 ? dflag : MO_16;
@@ -7351,7 +7348,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
+                gen_svm_check_intercept(s, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lldt(cpu_env, s->tmp2_i32);
@@ -7360,7 +7357,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 1: /* str */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
             ot = mod == 3 ? dflag : MO_16;
@@ -7370,7 +7367,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
+                gen_svm_check_intercept(s, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ltr(cpu_env, s->tmp2_i32);
@@ -7398,7 +7395,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
                              cpu_env, offsetof(CPUX86State, gdt.limit));
@@ -7454,7 +7451,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_READ);
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
             gen_op_st_v(s, MO_16, s->T0, s->A0);
@@ -7574,7 +7571,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 || !PE(s)) {
                 goto illegal_op;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_SKINIT);
+            gen_svm_check_intercept(s, SVM_EXIT_SKINIT);
             /* If not intercepted, not implemented -- raise #UD. */
             goto illegal_op;
 
@@ -7594,7 +7591,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7610,7 +7607,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
@@ -7623,7 +7620,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_OP(4): /* smsw */
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_READ_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             /*
              * In 32-bit mode, the higher 16 bits of the destination
@@ -7655,7 +7652,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_helper_lmsw(cpu_env, s->T0);
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -7712,7 +7709,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
         if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
+            gen_svm_check_intercept(s, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
         }
         break;
@@ -8102,14 +8099,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8118,7 +8115,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x106: /* clts */
         if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
             gen_jmp_im(s, s->pc - s->cs_base);
@@ -8345,7 +8342,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


