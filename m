Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCA5F1CA5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:20:17 +0200 (CEST)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedLk-0005hX-Pv
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBu-0002cW-JG
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-000407-Sx
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: by mail-qt1-x82a.google.com with SMTP id a20so4214262qtw.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qaSQvraaXqbo/hteq51kP3QVjDecKFuTg3ocpmvBl2s=;
 b=Et6l+IV36sPr1gcSKzoiw5hB+ONModa6+cVC7Ekxhew/v9NE1zDJ8PZodY6g8LA/Ur
 OHUzsxJcINzhTrSgkzlXdWfldobYonCVZHDwxIKJzJsI5n7ilHh2trFZJeJ3cZGZD6q7
 4Wh0nLru4wLQHZ1y3Bt0quajKmO7KDYwRF1Q8y7+fsCGuiqsXXChutjFSnCFAiDIBgxL
 CQjCe11cvOKxzhsvoYSal07SSevxVMJQLJMnlRRwSJdPdGYsDAB8tO7WzpG6QuFbKRnq
 0qg+T+vyVnDLWQNh/zR7EC1oVST0WSkyr060ece/NMjsI7vVH1MXugmk76oZ77AOZnDq
 lzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qaSQvraaXqbo/hteq51kP3QVjDecKFuTg3ocpmvBl2s=;
 b=aMfGEA9mPwL5eBPH6fvSq2jKbVlMIrCZfG4rNj2dtLYgOj07zwznZIh9tG5KvgNWxF
 MA4XtE1WqfXm0Rm1WBeaEAyCJdqhfb3AUCiFwTOjmo5OayzB3rYWdr4dxgjHl7Me5WL+
 kF2cftsvoY9V6/PrQSCV8iZ5hmorlTmHLYmKcatYHyH4ju2A0olJtGLLiF1TArOHF/Yu
 bpc7feWyZHi5cSnnOIul0W3RbkLHrGHIyBmMYdzvcbm7lMgW4bSB6lqaVq9FJzG1R9pl
 gY5Vq7HGwPG/HMn8+cGC6ZQrkkLOEQ6ICszbOLfIIOtX0S0HCFhKu7nX9TB7UnW1obAa
 oDSg==
X-Gm-Message-State: ACrzQf3PCgNOq4r5riCjWUCMTMhMVedwY62dCjudwFtuHZAJflQ/9p6g
 uw9a9WDA3/vC5v+kLU/TtMbjtXOpjS1GKlV/
X-Google-Smtp-Source: AMsMyM4IEtbtRuV7vbqcPx03vTKGssgWpbcSHAQobPWAeQmfB8ourJi8/h3CFusZKywCros1QnhihQ==
X-Received: by 2002:ac8:7f91:0:b0:35b:b968:bfc9 with SMTP id
 z17-20020ac87f91000000b0035bb968bfc9mr10677248qtj.332.1664633395109; 
 Sat, 01 Oct 2022 07:09:55 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 06/26] target/i386: Create gen_update_eip_next
Date: Sat,  1 Oct 2022 07:09:15 -0700
Message-Id: <20221001140935.465607-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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

Sync EIP before exiting a translation block.
Replace all gen_jmp_im that use s->pc.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 45 ++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 85253e1e17..4c1548da8e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -521,6 +521,11 @@ static void gen_update_eip_cur(DisasContext *s)
     gen_jmp_im(s, s->base.pc_next - s->cs_base);
 }
 
+static void gen_update_eip_next(DisasContext *s)
+{
+    gen_jmp_im(s, s->pc - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -5719,7 +5724,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_pop_update(s, ot);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5734,7 +5739,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -5785,7 +5790,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, reg);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5983,7 +5988,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7039,7 +7044,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7375,7 +7380,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
         }
         break;
@@ -7451,7 +7456,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
 
             gen_set_label(l3);
-            gen_jmp_im(s, next_eip);
+            gen_update_eip_next(s);
             tcg_gen_br(l2);
 
             gen_set_label(l1);
@@ -7469,7 +7474,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             }
         }
@@ -7669,7 +7674,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7679,7 +7684,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7724,7 +7729,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7786,7 +7791,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7825,7 +7830,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7909,7 +7914,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7920,7 +7925,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8320,7 +8325,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
@@ -8355,7 +8360,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
@@ -8370,7 +8375,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -8468,7 +8473,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8602,7 +8607,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         g_assert_not_reached();
 #else
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->pc - s->cs_base);
+        gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
         gen_eob(s);
-- 
2.34.1


