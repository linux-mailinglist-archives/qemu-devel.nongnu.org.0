Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449A38956F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:33:22 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR0T-0006HB-Gj
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyB-0003O9-FU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:30:59 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQy9-0005Uf-3x
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:30:59 -0400
Received: by mail-oi1-x233.google.com with SMTP id d21so13962002oic.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smdeYrB4Z2W/gFXPC6b0JTDnXTfTPJyfpJjMMWQ5xW4=;
 b=MVnE/A5NFqfB2oTAwXNCs7IyVNub1Gm/SF8lQNktsVyO4fQ4mhcPdQjcY8afX2T1RZ
 FCQGLgmNYIXzfpheFaXjKvsLnPWH5yV9hTwdmtvaBkrqeU5DXfOyv1bcf6pnA45CsHB7
 YT7N+WWxxjai9acCUOhkwV3di6N1q2jcMTALzUOQDtLtySV94JMEJFDjdyAdprn5DW+u
 3vVQ6hb/8H9SP1hC0v6qRXCFYY+mol2ZXbiINLY+l/vtT8dbfGtQEMn1zQHh9pX26W3b
 jJ/9XbLvOLGxW7RDhRGLfdmz21w33nFQdHTNWg9jIXWm3/wv7Fz7KjDNQ97PBPbg5k30
 jWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smdeYrB4Z2W/gFXPC6b0JTDnXTfTPJyfpJjMMWQ5xW4=;
 b=cbfVSYGXek07tfXUa2Tq3eokN9IRPHw7Dbjjhk2SM9bt1Gb2YuaQ043u4jntLvcR4a
 m4PRjKv9dzvGVVCjIeHdtjrCtoIMJuQ5mmQ98TZxGHQEU+t2XFGcCLz7VMNcZFeG8EN7
 knSg1UZz9bu7V1evb+tS/oZrbzuHWv5lHnr6HJ33lhN+eGVrJZSoWLLqLMw4tXk9DKMX
 cN9aWIhesReipZ4QKbfls2C4/N2hii15agXrj296PQ8oDbpkJUfi36LpYPcbQAfsEoAN
 fyT2+0rDcoNTPiJ9IWxyp0V9iE1BQTqfBJAg7mi1HFDeeRUbxlWcgHgECrvQVwJOc01Q
 gvGg==
X-Gm-Message-State: AOAM533p77hJ3MX4IUE5gLrI1yWHZym541NJULyhvDZQGcF13wAMN92G
 xeXmcJg8jdyKkLkMjyrsgpovUiDrCrmuVa4g
X-Google-Smtp-Source: ABdhPJymb2kg8c/9JG25j/qqh9BIyU860RwISjLQjkgJvfueVLJpq7uKitHRb7URjr0oWuDXJzg2qA==
X-Received: by 2002:aca:ea85:: with SMTP id i127mr395662oih.176.1621449054961; 
 Wed, 19 May 2021 11:30:54 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/50] target/i386: Split out check_cpl0
Date: Wed, 19 May 2021 13:30:02 -0500
Message-Id: <20210519183050.875453-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

Split out the check for CPL != 0 and the raising of #GP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-3-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 79 ++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 49 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2672e08197..61b30117a3 100644
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
@@ -7199,9 +7209,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7283,9 +7291,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7309,9 +7315,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7330,9 +7334,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7446,8 +7448,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                  | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
@@ -7463,8 +7464,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7488,8 +7488,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7501,8 +7500,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7516,8 +7514,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7530,8 +7527,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7554,8 +7550,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                 goto illegal_op;
             }
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7564,8 +7559,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
@@ -7581,8 +7575,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(3): /* lidt */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
@@ -7627,8 +7620,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
             break;
         CASE_MODRM_OP(6): /* lmsw */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
@@ -7639,8 +7631,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
-            if (s->cpl != 0) {
-                gen_exception_gpf(s);
+            if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
@@ -7654,9 +7645,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7690,9 +7679,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
-        if (s->cpl != 0) {
-            gen_exception_gpf(s);
-        } else {
+        if (check_cpl0(s)) {
             gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
         }
@@ -8014,9 +8001,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8068,9 +8053,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8104,9 +8087,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


