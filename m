Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090FF59CC82
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:51:46 +0200 (CEST)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHCr-0006d7-5B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvF-00061f-BQ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvD-0007Fs-HI
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l64so10798134pge.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=oqjsX/TV9fFb0FKaIyHXMo7pwCHH1A0NzKkq/LQYAFc=;
 b=KpyMfWf/ViZKTpnvq9qZACT23EiriyKD/3+cmVK0h8g+BkDpcwU3NYY6qUI8VuQpjX
 fEc1KhvW5bf9iqy/s3JMJ7lRZDEERBFlkpTP1AOR72hljv+Nyn+Loq9Ns22goC/B0RvS
 PauN+OAxpRTG9hGyQJdRFhyqLTmrN7QqU5uPmBdOVy5iygSBTV27tgTJfm92oZpIuhca
 fYO7ukxa0apPZjlvTrYldregKggasiZ53mjkvR03lQ5rjpcZRzlsLnHbpyfpyOgC3i+R
 p8yOMNJ1FGnFWm7ZCqZZDl4McTHnq2X9zK07zDqeVBxT1kGzA1V0MZI/Hq/TXpD/JH7N
 IO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=oqjsX/TV9fFb0FKaIyHXMo7pwCHH1A0NzKkq/LQYAFc=;
 b=7YmmlOqFzwg4ql/VnY3AXoPUHN7tiX4DwX3mBY7ChM7Kl+aV7xOkgvPno3Uz1xZ26Q
 AnhUeKd8r1Mrukwmu8Bf3NaAdRSJLrfi3HPSad2mMxP2BgnDGv+rkFxluKT66ym0E0cY
 x0+Y/nQ6SB5W2tUBLhmY9fNq2J7nXGsg8+OqdrRHvMNRBohpHXWVnMrOJX3dWmbWv4yx
 4BtxJRUFHooB9CCDQIN7RkvHEASjTQqwh3q5Vd5PydfUQCZ480JOK6/iR0sEK4ds0WXY
 diX+zDE8Aveu5f7PohItkcB0VfmiuGj0nYFUY9bV+FNxo1wSTgERhICyfKY9tziqmVJj
 pA7w==
X-Gm-Message-State: ACgBeo2dUup9TTDewbda4T+fKDe71cAvr9Jgrc3Kvb0LhSGdwKAOqhW4
 IWb01TqtZz+35pTr9z+AQ6S0HrxPntzeBQ==
X-Google-Smtp-Source: AA6agR6nSOGtJ/ByMK4NC2QaOvXNTjnVRmRXqRkjziY+IkCYFTBORslgVCiIp7LcBIUZh9V9VsbckQ==
X-Received: by 2002:a63:f34b:0:b0:429:f039:ccfc with SMTP id
 t11-20020a63f34b000000b00429f039ccfcmr18915403pgj.95.1661211210239; 
 Mon, 22 Aug 2022 16:33:30 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/22] target/i386: Use DISAS_EOB_NEXT
Date: Mon, 22 Aug 2022 16:33:04 -0700
Message-Id: <20220822233318.1728621-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Replace sequences of gen_update_cc_op, gen_update_eip_next,
and gen_eob with the new is_jmp enumerator.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 40 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4dc8f4c1f8..73e4330fc0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6874,8 +6874,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     case 0x9e: /* sahf */
@@ -7304,8 +7303,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             }
         }
         break;
@@ -7504,8 +7502,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xcb: /* stac */
@@ -7514,8 +7511,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
@@ -7559,8 +7555,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xd8: /* VMRUN */
@@ -7621,8 +7616,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xdd: /* CLGI */
@@ -7660,8 +7654,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
@@ -7744,8 +7737,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
@@ -7755,8 +7747,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xf8: /* swapgs */
@@ -8155,8 +8146,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
@@ -8190,8 +8180,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
@@ -8205,8 +8194,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
@@ -8302,9 +8290,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_helper_xrstor(cpu_env, s->A0, s->tmp1_i64);
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
-            gen_update_cc_op(s);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
-- 
2.34.1


