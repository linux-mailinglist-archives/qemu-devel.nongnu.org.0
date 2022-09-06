Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EC5AE651
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:14:39 +0200 (CEST)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWXO-0006B4-Q7
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWZ-00009P-4H
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWX-0003Z0-9u
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id bq9so1754623wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aUBsYW/QRw3rgQbxhH7BMtH6y0cZ7U+xZYhacWoq3cc=;
 b=ibHvXVO+SGaOhTnNlcOwDbUU5SbRHL4EkmEE7ljX237NzHsIBkoECOOd5aORRchogw
 Chc/96KrVcxudNHf1qIirpWuOxMPoGqQUS/RFoug3ez7ERtSbRB9P6shMousTp+Nwuyn
 ZEjJZ6j9zyoDQgyfUJZJutMMeVpZ1svj46Ev9XV8ajfWK1HNYI82R5tleZAXH19LIFzD
 SXjL6A91DiCe+8+f27ryn9uEn20F+H1MaT26Obmj7fGnoGEj8jDi18YIedzxNwshCLRf
 hJbDqmgjsWwl6STitr6V1HtWu41ICN39qaCoUEhwCooBHmwENZjlZEmg1Qi2coNQndFT
 TmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aUBsYW/QRw3rgQbxhH7BMtH6y0cZ7U+xZYhacWoq3cc=;
 b=Tlyow29THyRFtzK1y/WsOScORa74d6J3Zs28EfdrHlU2YuOUmOsCNfqU9aOF8nVJSb
 lp7w1B8auYAFXGDLAkstQCFSF9b4igNWFt9TLTJTCN45LZlhxc/MCE0QME4mGD3VmBAV
 KQkcavZrV/FTAHg4zaC9flyXPlbxV5TlyxlxT5AYHFD2szozAdSyl41gcduwURAVaLE7
 sVj22Qz2WflVCkaFu9kaUXOLl+HByAhjLDSaH9/aEXrcv/xo896dtUJqcZ191jOo8ivY
 heCIrBpRUz/aABrTa5D01sMMWz7nhbECT8kdfWmh0NdsWX1+drXkNTalnBfRqzSuU6Uc
 nNlA==
X-Gm-Message-State: ACgBeo2CLTXGj6IttiTRshpYhq3qNDV0cj7gs2nIitL4k4i9X0w9+CGn
 t94jUv4qYMnRZy5Kp2lpv0huO8zXnj9GRB9s
X-Google-Smtp-Source: AA6agR5EgsZmiPQX3ul2b/apkvIVJdwk3B8aiUQYY4dLdYGTRKJMKq16avzzvbDLaU9xLQdYRO6BlA==
X-Received: by 2002:a5d:6b46:0:b0:225:3510:a130 with SMTP id
 x6-20020a5d6b46000000b002253510a130mr26148249wrw.46.1662458979839; 
 Tue, 06 Sep 2022 03:09:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 06/23] target/i386: Create gen_update_eip_next
Date: Tue,  6 Sep 2022 11:09:15 +0100
Message-Id: <20220906100932.343523-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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

Sync EIP before exiting a translation block.
Replace all gen_jmp_im that use s->pc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 45 ++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 83cb925571..6084c85609 100644
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
@@ -5675,7 +5680,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_pop_update(s, ot);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5690,7 +5695,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -5741,7 +5746,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, reg);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5948,7 +5953,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7004,7 +7009,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7340,7 +7345,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
         }
         break;
@@ -7416,7 +7421,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
 
             gen_set_label(l3);
-            gen_jmp_im(s, next_eip);
+            gen_update_eip_next(s);
             tcg_gen_br(l2);
 
             gen_set_label(l1);
@@ -7434,7 +7439,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             }
         }
@@ -7634,7 +7639,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7644,7 +7649,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7689,7 +7694,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7751,7 +7756,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7790,7 +7795,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7874,7 +7879,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7885,7 +7890,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8285,7 +8290,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
@@ -8320,7 +8325,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
@@ -8335,7 +8340,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -8433,7 +8438,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8567,7 +8572,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


