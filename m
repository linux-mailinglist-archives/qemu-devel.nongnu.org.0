Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A659327534
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:28:21 +0100 (CET)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVU4-0002B4-1t
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPL-0005J7-NU
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:27 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPJ-0007dn-Gv
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g20so8774857plo.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OnXiQELZimMmmln2oIwEWMyVy/CxfoTzEEpFKC8y+0=;
 b=y13v08BH573xQVpHEpCUJR3yuMkD4iTBC47vZ0Jto5cLZJzPfHkaZD1bxZYZmtFt+i
 kn5cJ2tfYlCULy4WA45sZpjsdFQr9QnuoR2OaLQcQledRi830rN7JdRhARkR9zDVk+5A
 /lWF04HK7eN1/bUzHbzXyUfIUyqYQy8DcxezWAJbg6o6hFloEkMJproF8htu8x2qPgkG
 2o6YeA8XzXbgHzQM7Lp7JynL9TJgjd/GqviRrdYITOpbyASg0zcQQ5E5mEEIEGfV0Uop
 P/qBAjGUhaNXuEFSlW6OW20iaorznuO0bVcPmmafUV+X+O1kfnNKpxKqK+d/yFO0i33l
 6d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OnXiQELZimMmmln2oIwEWMyVy/CxfoTzEEpFKC8y+0=;
 b=SFS5JZDE18hSOkDwgdSnJz0uxdUF59jiip1wmB902MKY0AQy1zgk+oFncc2eG+SYVe
 pWoY9X/xgAatTLJoR8FbsSEt85oIXcjVhZ0/mpo9zTU48xdbz9bkC4t9VexLqqA0A2XJ
 eE6xRbyxfbBJkIEoigheOjqpGtvSk1Jd1zqXWMd/Lu9ag8Zd8mfLxe9XT0p9xbEs70Gg
 zSYWMUMTDdLA6JYd4bfqGV5fj0vMX6oiErlZEvO9i9L6ZUEiPIdpF0FMDw0tPTS89+7w
 dMrPaBH4JFdhJBLMOmJEhUpihiszkHX61n9cISF1pDdT+qTQiW0irpPdWviLaFuIHHAp
 9I6Q==
X-Gm-Message-State: AOAM5325hC5Tfg9ONuj7ZBj+h5ntfxzAMArdsWp0J1NBtSvJ+PWMqBEO
 VYMKLiA1JOvMag54T7odyU3wiO4vimBzVA==
X-Google-Smtp-Source: ABdhPJwwUl4aKFa6zjwWD9KBr5ixCgRWDlGy3lUMbE5WpCo65KeRSrkhRRCI4l2HPRHJhe4EBubLiw==
X-Received: by 2002:a17:90b:794:: with SMTP id
 l20mr7163242pjz.207.1614554604077; 
 Sun, 28 Feb 2021 15:23:24 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/50] target/i386: Split out gen_exception_gpf
Date: Sun, 28 Feb 2021 15:22:32 -0800
Message-Id: <20210228232321.322053-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 68 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6ecbbfa6c1..6af8bd219b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1276,6 +1276,12 @@ static void gen_illegal_opcode(DisasContext *s)
     gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
 }
 
+/* Generate #GP for the current instruction. */
+static void gen_exception_gpf(DisasContext *s)
+{
+    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -4502,7 +4508,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->vex_l = 0;
     s->vex_v = 0;
     if (sigsetjmp(s->jmpbuf, 0) != 0) {
-        gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+        gen_exception_gpf(s);
         return s->pc;
     }
 
@@ -6561,7 +6567,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             set_cc_op(s, CC_OP_EFLAGS);
         } else if (s->vm86) {
             if (s->iopl != 3) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -6683,7 +6689,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9c: /* pushf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, cpu_env);
@@ -6693,7 +6699,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9d: /* popf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             ot = gen_pop_T0(s);
             if (s->cpl == 0) {
@@ -7055,7 +7061,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
         }
@@ -7078,13 +7084,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->cpl <= s->iopl) {
                 gen_helper_cli(cpu_env);
             } else {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             }
         } else {
             if (s->iopl == 3) {
                 gen_helper_cli(cpu_env);
             } else {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             }
         }
         break;
@@ -7095,7 +7101,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob_inhibit_irq(s, true);
         } else {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         }
         break;
     case 0x62: /* bound */
@@ -7188,7 +7194,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x130: /* wrmsr */
     case 0x132: /* rdmsr */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
@@ -7220,7 +7226,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
             gen_eob(s);
@@ -7231,7 +7237,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
             gen_eob(s);
@@ -7250,7 +7256,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x107: /* sysret */
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
             /* condition codes are modified only in long mode */
@@ -7272,7 +7278,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xf4: /* hlt */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
@@ -7298,7 +7304,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!s->pe || s->vm86)
                 goto illegal_op;
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
@@ -7319,7 +7325,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!s->pe || s->vm86)
                 goto illegal_op;
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
@@ -7435,7 +7441,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
@@ -7452,7 +7458,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7477,7 +7483,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7490,7 +7496,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7505,7 +7511,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7519,7 +7525,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7543,7 +7549,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7553,7 +7559,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
@@ -7570,7 +7576,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(3): /* lidt */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
@@ -7616,7 +7622,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
         CASE_MODRM_OP(6): /* lmsw */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
@@ -7628,7 +7634,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7643,7 +7649,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef TARGET_X86_64
             if (CODE64(s)) {
                 if (s->cpl != 0) {
-                    gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                    gen_exception_gpf(s);
                 } else {
                     tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
                     tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
@@ -7679,7 +7685,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
@@ -8003,7 +8009,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x120: /* mov reg, crN */
     case 0x122: /* mov crN, reg */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
@@ -8057,7 +8063,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
 #ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
@@ -8093,7 +8099,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x106: /* clts */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
-- 
2.25.1


