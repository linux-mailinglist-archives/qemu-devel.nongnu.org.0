Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EC380DB3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:01:35 +0200 (CEST)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaFq-00084E-VR
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZD-0003ka-Ij
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:31 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZB-0000GP-E8
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:31 -0400
Received: by mail-qk1-x730.google.com with SMTP id l129so29012801qke.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1juOOEKnDc+LT3IkTwuNQLgCUSYTg/DRPVFzERrWIk=;
 b=VTowO2LUt8is2i6PVICmLPkr2ChxDZV1BmrZ2MiY2iAj2B9BjUa3EKJ1gXhYjLIRR1
 B9TXJs2OXqJ20yX9NnNcpfpuJGSgfrhhBCk6w0nf0IkFPUfjioRje0DHkr5bmx/NFqH3
 cefK6+LhPgaDWNO7S1YamYXmvrnETk8Qwt60PMc/Y8Cxnza2e2J6ZrPvFxX9OKVX0TRE
 44i/r2sKGbiwgeS7aXqPSYtVDFdkldoMauZ8LhK1EXb91BhP0PI3N7MM+FC9Lf8WVlwL
 1S5hi9Tr+krcob6iAd+E3abFAd4FY/UHLG7vwAW4jdvOz5F8jQ32tS7cCTkbpt6AcnPQ
 WzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g1juOOEKnDc+LT3IkTwuNQLgCUSYTg/DRPVFzERrWIk=;
 b=Snmdw7OUkhjwN8JcNaR5WoboECvSz6viieHkPmWdVATVFUoUq+WZ/7I1VYqcrP8yQ3
 ZoLnf20P5gH1p1Yn9SeJqO9RWGtS8Mo6q20q35Yir9vh7hEWmZznGamrJJgvDUsQZiRJ
 fCv7OEHcsHMSfkUFIdezpYJze+JS63AQhYn3kO5kYker9EOpgwOexZK7BepAn+Inati5
 6A1TW5tOxiOV/Xnz1q6g/u8gbjbQwjKQEufSTnQP4/TQvA/nkS2b7WN9W9EExwL0kF6E
 uUkm+jFjLjBW9Nx4Bbb5ZLtUTGH53iH2ha2XjCinL2jzOYAr9Pt19Etin2/7nvD2enm4
 Cw1g==
X-Gm-Message-State: AOAM532t5HWTdb+nVnPcLatJ5f+J4bAFYNDJQrtfx/oqiKdg1Ijz2kVf
 uHnjTCVVC+yHQbd8WmSuWXJb+HgpTIzm8GRFyQo=
X-Google-Smtp-Source: ABdhPJypApEvBWIBgBCtS0ncy551RAN9QlgELGiVzzCyEOfgtCeNwyZ36BeD4CfUbMnZ3YMcFQCjaA==
X-Received: by 2002:a37:e06:: with SMTP id 6mr42656949qko.337.1621005448512;
 Fri, 14 May 2021 08:17:28 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/50] target/i386: Pass in port to gen_check_io
Date: Fri, 14 May 2021 10:13:39 -0500
Message-Id: <20210514151342.384376-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in a pre-truncated TCGv_i32 value.  We were doing the
truncation of EDX in multiple places, now only once per insn.
While all callers use s->tmp2_i32, for cleanliness of the
subroutine, use a parameter anyway.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 55 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 02c76537a6..19bfdbd0a3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -674,19 +674,23 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
     }
 }
 
-static bool gen_check_io(DisasContext *s, MemOp ot, uint32_t svm_flags)
+/*
+ * Validate that access to [port, port + 1<<ot) is allowed.
+ * Raise #GP, or VMM exit if not.
+ */
+static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
+                         uint32_t svm_flags)
 {
-    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
         switch (ot) {
         case MO_8:
-            gen_helper_check_iob(cpu_env, s->tmp2_i32);
+            gen_helper_check_iob(cpu_env, port);
             break;
         case MO_16:
-            gen_helper_check_iow(cpu_env, s->tmp2_i32);
+            gen_helper_check_iow(cpu_env, port);
             break;
         case MO_32:
-            gen_helper_check_iol(cpu_env, s->tmp2_i32);
+            gen_helper_check_iol(cpu_env, port);
             break;
         default:
             tcg_abort();
@@ -702,7 +706,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, uint32_t svm_flags)
             svm_flags |= SVM_IOIO_REP_MASK;
         }
         svm_flags |= 1 << (SVM_IOIO_SIZE_SHIFT + ot);
-        gen_helper_svm_check_io(cpu_env, s->tmp2_i32,
+        gen_helper_svm_check_io(cpu_env, port,
                                 tcg_constant_i32(svm_flags),
                                 tcg_constant_i32(next_eip - cur_eip));
     }
@@ -6479,8 +6483,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6c: /* insS */
     case 0x6d:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32,
+                          SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6499,8 +6505,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6e: /* outsS */
     case 0x6f:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_STR_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6524,14 +6531,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe5:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
-        tcg_gen_movi_tl(s->T0, val);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_movi_i32(s->tmp2_i32, val);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6543,16 +6549,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe7:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
-        tcg_gen_movi_tl(s->T0, val);
-        if (!gen_check_io(s, ot, 0)) {
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_movi_i32(s->tmp2_i32, val);
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6563,14 +6567,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xec:
     case 0xed:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6581,16 +6585,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xee:
     case 0xef:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, 0)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-- 
2.25.1


