Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3A59CC88
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:53:16 +0200 (CEST)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHEJ-0001kA-Ts
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvC-0005sp-Rm
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvA-0007FP-Uy
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id x19so11307802plc.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=9Pm+6x2/2C6OfnomcGaCxiJb7v+oW6I+7rzdNDZUItE=;
 b=w2BRFLPOroefQMuUaXVcH1clm3+Xls/6wnYrmj1h3z01ssAv+4CSxdWbWAWMO/yVVl
 JWm7vjXvFY9vdahVajF6wV2JufTLR/IlNOanbu60SrcS75xF75i8egU3Xw+3VvZ4ibJ5
 FhNQ1bUfVk14J19hI/oujqdW8nTO+qk3YC+DV9tkb3jFS5IYwIZmYEcGkW2WNylkoZTW
 yaXIjAW+mgyvErf4PW8YHEhbFbmaEXC6K5+iQMkI1f0yg7NUvbqp1wlKicMF9HcfSYh7
 STVjH8403Q/0ELGdB+W07q5nvuxyTQJfWKWhgAZ6jpqpbmoBpknFg3eFiVt5EU5+3zEf
 utDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=9Pm+6x2/2C6OfnomcGaCxiJb7v+oW6I+7rzdNDZUItE=;
 b=ABXB7Mx+T5rmHy2U2jxEOboin5Pemeor6AFV3v9c6x/089UGEBtxDDEt3ye3rd0Z9P
 QMNvROYmLcwAehd2zauWdyzoOG2Nkd9zxnAcTnry/zOMsvY7PVnSt9t6npVzjcarcqVq
 mdOG0LgY+NkVjb6Qwg2jwRX5jd6RRl4914vh1mIn25Gu4CHb+LZlcjzq+k9MJBBopd5p
 GXIMC4hWeI/73463gmyJ3KaV30ygLPepHdfbJAExVcXStiLxlJm06mo3M9oYHe0JKqZK
 HbExRYTkU2jbE6YoP9hcUhe3bUgw2WbJS+SfQQvySvXbvBHaHtJxlUGLoIrxGp5XIsh9
 NGtA==
X-Gm-Message-State: ACgBeo2kiS+KNFgQ4FTdU97g2gscULdV0+vJZy0ypJTqe385ZsOfw8YO
 XaEJa64q420OmJQcRboplcoP8XU4Ym8mLA==
X-Google-Smtp-Source: AA6agR79C0vG3Y/fZJC9zqt7wRsrkhs3qhS67wNEx4F0nHY7Sawm5oPNn1AmgU+Sa9qBp98DS0zaOQ==
X-Received: by 2002:a17:902:f641:b0:172:9642:1bf1 with SMTP id
 m1-20020a170902f64100b0017296421bf1mr22463313plg.36.1661211206518; 
 Mon, 22 Aug 2022 16:33:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] target/i386: Create gen_update_eip_next
Date: Mon, 22 Aug 2022 16:33:01 -0700
Message-Id: <20220822233318.1728621-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index 78b7641786..36883410e0 100644
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
@@ -5562,7 +5567,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_pop_update(s, ot);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5577,7 +5582,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -5628,7 +5633,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, reg);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5835,7 +5840,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -6891,7 +6896,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7227,7 +7232,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
         }
         break;
@@ -7303,7 +7308,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
 
             gen_set_label(l3);
-            gen_jmp_im(s, next_eip);
+            gen_update_eip_next(s);
             tcg_gen_br(l2);
 
             gen_set_label(l1);
@@ -7321,7 +7326,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             }
         }
@@ -7521,7 +7526,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7531,7 +7536,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7576,7 +7581,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7638,7 +7643,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7677,7 +7682,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7761,7 +7766,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7772,7 +7777,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8172,7 +8177,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
@@ -8207,7 +8212,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
@@ -8222,7 +8227,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -8320,7 +8325,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8454,7 +8459,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


