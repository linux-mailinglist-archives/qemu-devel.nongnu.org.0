Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A49327530
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:26:10 +0100 (CET)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVRx-0007Ci-Tt
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPM-0005Jq-Gz
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:28 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPK-0007f5-Ip
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:28 -0500
Received: by mail-pj1-x1033.google.com with SMTP id d2so10478375pjs.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3o7BcKxUNswRMMyWGLBg72LcoS575qjgZJ5bfz0nIY=;
 b=pAinsol7G6Kh3BQpjUgMQ4Sicddteb+5xsn/m7+ZSILHuSqaC7Bc67oevkfUc6N/Hm
 pRyaEaCE9fZKVxCcide+rkz2nsqOon1YZSRqRKyvLkIlM6yjMS7h+KPvn+5/I0c6DCcr
 cgUQ2AmdK/22Ijejn3k+7QqQ4VvJ+mcGzxHSeKDqF3Cgbvb67QW2B9nZh8O8NztZJZP3
 GRbuZi0/KQ5EiikYff8BbnlqbOQOrT3xfyZyrVZKKuhzxZKd3d0oJDMPIaJ6CgOd+0I/
 vtL1EwtfkDwts1SLar9N+jb7z/+2qhnfmL1wWPdnt5d+NbjyPpbNZTSJS1XK5ISbAjCe
 N9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3o7BcKxUNswRMMyWGLBg72LcoS575qjgZJ5bfz0nIY=;
 b=PXjAT50H2qOVbcELdeDtylniH0LyEVZz6n5tSakF/CoNZO6X5XwWHzWqnmhR4RdQDi
 UCvKaSrPrlEXKxH1DkA8HDPnhJSDvky4EL/leCXDXg0wZCaKDWR1xv+mWxjThITkkw1m
 GgYCZy1bCpA4tQQlJf2YzgKlMUu8/hZboXd39/xCitR7N8O/TFiUvdy5Wm1B8notidm3
 BCZykg7qQufO65GjrlF1Jqmq2lVz3mVe5ISl31xToERpsvDaOMCttlPzp56Uc0Vcwrkh
 5gPn8LbL2xFNtAWSw4BCwJVVdx7Jx5Lk5v/XucUk8CRf2lKo1k0m7qIzsMRRqhjoIFCV
 eDQQ==
X-Gm-Message-State: AOAM533BiO4C8WKtWHLl/4bcuy2V9e497Z9KJD6zNZJLrZLTAquvJUxL
 Q35frBzx/qq8a0EQOE+h7nx4a/+NeA4JLw==
X-Google-Smtp-Source: ABdhPJyDaZXnXm3iDVK031rlnWYbrZoi2iPLzHEzv5DVObDgm7UljGj2/grz6A9WlEXb3FhYBPf2tA==
X-Received: by 2002:a17:902:cecb:b029:e4:182e:a2e4 with SMTP id
 d11-20020a170902cecbb02900e4182ea2e4mr12822457plg.48.1614554605075; 
 Sun, 28 Feb 2021 15:23:25 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/50] target/i386: Split out check_cpl0
Date: Sun, 28 Feb 2021 15:22:33 -0800
Message-Id: <20210228232321.322053-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Split out the check for CPL != 0 and the raising of #GP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 79 ++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 49 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6af8bd219b..5703b253a1 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1282,6 +1282,16 @@ static void gen_exception_gpf(DisasContext *s)
     gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
 }
 
+/* Check for cpl == 0; if not, raise #GP and return false. */
+static bool check_cpl0(DisasContext *s)
+{
+    if (s->cpl == 0) {
+        return true;
+    }
+    gen_exception_gpf(s);
+    return false;
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -7193,9 +7203,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x130: /* wrmsr */
     case 0x132: /* rdmsr */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             if (b & 2) {
@@ -7277,9 +7285,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
@@ -7303,9 +7309,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 2: /* lldt */
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
-            } else {
+            if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -7324,9 +7328,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 3: /* ltr */
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
-            } else {
+            if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -7440,8 +7442,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                  | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
@@ -7457,8 +7458,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7482,8 +7482,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7495,8 +7494,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7510,8 +7508,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7524,8 +7521,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7548,8 +7544,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7558,8 +7553,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
@@ -7575,8 +7569,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(3): /* lidt */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
@@ -7621,8 +7614,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
             break;
         CASE_MODRM_OP(6): /* lmsw */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
@@ -7633,8 +7625,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7648,9 +7639,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 0xf8: /* swapgs */
 #ifdef TARGET_X86_64
             if (CODE64(s)) {
-                if (s->cpl != 0) {
-                    gen_exception_gpf(s);
-                } else {
+                if (check_cpl0(s)) {
                     tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
                     tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
                                   offsetof(CPUX86State, kernelgsbase));
@@ -7684,9 +7673,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
         }
@@ -8008,9 +7995,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x120: /* mov reg, crN */
     case 0x122: /* mov crN, reg */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
              * AMD documentation (24594.pdf) and testing of
@@ -8062,9 +8047,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
 #ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
@@ -8098,9 +8081,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x106: /* clts */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-- 
2.25.1


