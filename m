Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098295F1C9E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:16:23 +0200 (CEST)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedHy-0001iZ-0a
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBv-0002f9-Qs
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBr-00042B-GZ
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: by mail-qk1-x735.google.com with SMTP id c19so4404050qkm.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jIeyZwObxYeoLfXopcj18X8K40+HZNPyuNR2517Zrik=;
 b=EDU6gfR/Ookdn8qJPUiudXMUbqefHcNwOgZavUUcB1EtL8EyOPrfV/qcFUmNH6yK02
 NFsBBemUaK7DGLiQkUpbqeoYorexZ9k4XGWXMvRyCnhGIBfCcvFDaVhfKtGFzj0JsNJH
 LPxLMVBbNuDRexpCSN0nGuZQaAnWKkwPADq1znr7JRFZZdPVT6iaXCDA0JF2aLtPnZqk
 yZL1GrAVY1ibCDNMjK/J1uXHSKdiXEMxJpvP7bwshER7gzdhwOjgc9QS8Dui6p9PUgoc
 7P6FO7uNZhkU4J/l3EMJpYvKJFMZTSHxLe3rezL9Zqq2CqlZTSTTepfk4NAf4qA091Js
 3h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jIeyZwObxYeoLfXopcj18X8K40+HZNPyuNR2517Zrik=;
 b=KAvG6F8Q3BdgkePO2WFWNoYPYBKY6o82wM8vppVGFzVcRINDwRifUb2OSGhKL4xi4X
 x/WD+tPGHG5OkqiJzq9T+CKi1b1W5rVmEjswVy/YXz+ojNPKnTYp4MzlmwczWH0OKpMl
 RHl0BAmT7icd9Y2/h8NWKRF+SKG52T6T2Rf/tB3NgXeMeD6Na2tOaDb+IpIUpwL4lrGb
 v/SZVpV+GGNdCoc8R5Vjjfx3Xdils3VgG+ySUo7iscIDFp+REF0EH9rdWOCBgHZpEvy8
 rLf4gbwNIFttXLMoT0kj0eitEPetxWQWGfegCnEXiUADxi0Z1F9lr21HAAJhWTTiOwf/
 FShg==
X-Gm-Message-State: ACrzQf0ZUtkj1y+jbaa/3MF1o49FpMZQ7Q1jO7E4Jf0VO8PHWZ54klZE
 oHwRhaGzkuEQuOHeIpgheWYHw6W806rrSADM
X-Google-Smtp-Source: AMsMyM7MFwwJvPr612404M9dCpWWu80fEVgxidkQONFXXctf1IR4VZF1LwxT3eXKSZUL7DkxHyNniw==
X-Received: by 2002:a05:620a:b8a:b0:6ce:1589:7de8 with SMTP id
 k10-20020a05620a0b8a00b006ce15897de8mr9088540qkh.444.1664633402517; 
 Sat, 01 Oct 2022 07:10:02 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 09/26] target/i386: Use DISAS_EOB_NEXT
Date: Sat,  1 Oct 2022 07:09:18 -0700
Message-Id: <20221001140935.465607-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

Replace sequences of gen_update_cc_op, gen_update_eip_next,
and gen_eob with the new is_jmp enumerator.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 40 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8c0ef0f212..717c978381 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7022,8 +7022,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     case 0x9e: /* sahf */
@@ -7452,8 +7451,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             }
         }
         break;
@@ -7652,8 +7650,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xcb: /* stac */
@@ -7662,8 +7659,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
@@ -7707,8 +7703,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xd8: /* VMRUN */
@@ -7769,8 +7764,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xdd: /* CLGI */
@@ -7808,8 +7802,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
@@ -7892,8 +7885,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
@@ -7903,8 +7895,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xf8: /* swapgs */
@@ -8303,8 +8294,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
@@ -8338,8 +8328,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
@@ -8353,8 +8342,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
@@ -8450,9 +8438,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


