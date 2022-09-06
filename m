Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10F5AE5A1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:43:11 +0200 (CEST)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVW2x-0004VN-1V
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWb-0000Aa-RF
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWa-0003Zn-1A
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id c11so10429457wrp.11
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HRPRLy7RM/tEvMRRlQvfL/D1iT20pN8vpm8/OZpor/k=;
 b=o6AOFI0sx6OZCVUakiR8sRba0dG5zFw1/sRnnZF8LQVhYGuxps2J3mcQA0VMVuXmmf
 sStAxO9JUs7/7fOIzZ3Td490liEcuTshROKA4fJqa4u2nJL2AlVZstfgJoqD9tZeKvLW
 YxBKpy0dneMrX7NGdtBryZGTwM3v6A6kOBweTNna5Bw56zXhFT5T0XpitKr2N2bzz9+5
 2w98rhyePvxlBAw+2sTkaH81Y1VQTM68p4LdO7BPU+avSp27/0MrQM6xoiKIDCqKkxnt
 mK42VC6YjONSWBrgj1LvdnngP5uUPyl4XqwgStJ2IGKctLIFozvJVGzJMLkFjqcG6GuT
 desw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HRPRLy7RM/tEvMRRlQvfL/D1iT20pN8vpm8/OZpor/k=;
 b=xED77SDagZZTrCIEgTrf/BHVBwEXuF9zAPVN/csflaKIwAtaieUxP4jx7YMVUL94h2
 KYxEKaCIb6cI6vAPXydwyy7VJiTWzyTGSmGVQ/wQHySIa9J9OX4cs0wIvIg32ylWj3DL
 MXQ1Xh6U3E4DIon8zDy+7uW/RCWYDw2g8ZbjHIbLAqc/TDuQShcf0mZp479PaoBaTppA
 qHWdjXLXYll9QjqA6CRmKJQWe4U8+Cs1ni/NYy2Ln/ZBGrur7RYvT6aitOERtgNCC6ys
 s+IlKu8Ll6CWkJFSS3jLbJ7L1wrPCqV3+tesPbyIy0q8IXFSfcNTR8XbkZvmIbr1NtGI
 J9qg==
X-Gm-Message-State: ACgBeo3h6/jPQyI0Ku/t7vtkGVysR8kb76F5hq2xfSIUP01aPU9ioIsw
 cR2FK6Fedqh5Y6kI8pXEITjRRuEwO6ANhFXO
X-Google-Smtp-Source: AA6agR4CeQ8V3oToAcadA+jX1kJ4YbyE0ExOOzzCMWdfFYwd708cJzf+UqLrToBc8lFogi/bTd0JKw==
X-Received: by 2002:a05:6000:178a:b0:228:601a:2dc6 with SMTP id
 e10-20020a056000178a00b00228601a2dc6mr8024491wrg.430.1662458982791; 
 Tue, 06 Sep 2022 03:09:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 09/23] target/i386: Use DISAS_EOB_NEXT
Date: Tue,  6 Sep 2022 11:09:18 +0100
Message-Id: <20220906100932.343523-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
index ea35d3e9b4..a7e5bcdec7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6987,8 +6987,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     case 0x9e: /* sahf */
@@ -7417,8 +7416,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             }
         }
         break;
@@ -7617,8 +7615,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xcb: /* stac */
@@ -7627,8 +7624,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
@@ -7672,8 +7668,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xd8: /* VMRUN */
@@ -7734,8 +7729,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xdd: /* CLGI */
@@ -7773,8 +7767,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
@@ -7857,8 +7850,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
@@ -7868,8 +7860,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xf8: /* swapgs */
@@ -8268,8 +8259,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
@@ -8303,8 +8293,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
@@ -8318,8 +8307,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
@@ -8415,9 +8403,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


