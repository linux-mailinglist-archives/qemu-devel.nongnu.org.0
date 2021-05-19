Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0F389654
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:12:43 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRcY-0005zk-RX
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1o-00038s-ND
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:44 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1j-0007S6-Im
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:44 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so12628720otp.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qnZV0wX95VAsWpNoAvBiFixvkFrekitqEJ+f9enV/uM=;
 b=tzs6fR9HuT5Ot6KIndiOlsq580qc4nj8kZdx4WwfaMk1u0obzIpr5uFCzCqTrmUfgZ
 /1AMB/5gbL4qcmfT71UL+o8uNor6i26dPgyWEr8gk7kyOyud/K9woHqCDdWba3ie/53V
 aaPgZi2CcfSMd0gsb2WdnmpLBPpNnHLHnP2GZbAY2AGlLzHGLG2rd1VOrdZ9YM6RunsD
 o+bEgJ+mEepfFGDnl9qPTrUZ1T7IMyDJeNBvYBBdlXGjDbuC1Z1b+jJT314zWw2kyBQE
 8s8+Tp2ByvymprlJOGX8d3OzD89AFdC4UkCGxnjLuhHVwRLDvvD3RHc9X+dxYUpTrLQB
 ZTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qnZV0wX95VAsWpNoAvBiFixvkFrekitqEJ+f9enV/uM=;
 b=nl02A+9xRMZ1LTygK+F/XTdn0JBer7iHAw65NzNKrkg2EfS7Ll70hYW+Oq0WMWWKoJ
 rnJTH6YjXZaQpQDBDChhMhnsyEw+VZYbB0ZFilcfYeSt3+NvZteoqGC9KhuYrfE0a5O8
 NPPqI6a2qVXxcy+s99Ye6T6d+uKGM87PxkyqyuxX5v28BxPUcF5BansBNf2ZrF8cYmBR
 W5N2IptMJu6EkLIAi7EIM4Vo3OcF1k/1qRfJTs7I6nWsR112x4nberLMfZycHLLX4P8P
 QnqzHzV+XTXRZXqCWoWOfTpKMrHogRW1zo53VgYixBAZ+0c/ilNdeNqnF1YnfHBLZ9+e
 WQTA==
X-Gm-Message-State: AOAM531X3ju7lxSdiNHql1dBs5BaDPxxQE6NUOVno7fUzDjLnBeLgsIX
 MaNKiaPHFaYYxfZkYUY259fwUL5MFaBJCPuc
X-Google-Smtp-Source: ABdhPJzTSca3sCgJjQ/pkEWghhh0ClTevByhFzdGz1woCib8ChL0SzeGOaU9W1m+H79UikUVtnEDOQ==
X-Received: by 2002:a05:6830:33c7:: with SMTP id
 q7mr666332ott.308.1621449278475; 
 Wed, 19 May 2021 11:34:38 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/50] target/i386: Tidy gen_check_io
Date: Wed, 19 May 2021 13:30:46 -0500
Message-Id: <20210519183050.875453-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

Get cur_eip from DisasContext.  Do not require the caller
to use svm_is_rep; get prefix from DisasContext.  Use the
proper symbolic constants for SVM_IOIO_*.

While we're touching all call sites, return bool in
preparation for gen_check_io raising #GP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-47-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ef0ba822e1..2282c3598c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -674,13 +674,10 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
     }
 }
 
-static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
-                         uint32_t svm_flags)
+static bool gen_check_io(DisasContext *s, MemOp ot, uint32_t svm_flags)
 {
-    target_ulong next_eip;
-
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
             gen_helper_check_iob(cpu_env, s->tmp2_i32);
@@ -696,15 +693,20 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
         }
     }
     if (GUEST(s)) {
+        target_ulong cur_eip = s->base.pc_next - s->cs_base;
+        target_ulong next_eip = s->pc - s->cs_base;
+
         gen_update_cc_op(s);
         gen_jmp_im(s, cur_eip);
-        svm_flags |= (1 << (4 + ot));
-        next_eip = s->pc - s->cs_base;
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            svm_flags |= SVM_IOIO_REP_MASK;
+        }
+        svm_flags |= 1 << (SVM_IOIO_SIZE_SHIFT + ot);
         gen_helper_svm_check_io(cpu_env, s->tmp2_i32,
-                                tcg_const_i32(svm_flags),
-                                tcg_const_i32(next_eip - cur_eip));
+                                tcg_constant_i32(svm_flags),
+                                tcg_constant_i32(next_eip - cur_eip));
     }
+    return true;
 }
 
 static inline void gen_movs(DisasContext *s, MemOp ot)
@@ -2425,11 +2427,6 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
     }
 }
 
-static inline int svm_is_rep(int prefixes)
-{
-    return ((prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) ? 8 : 0);
-}
-
 static void gen_svm_check_intercept(DisasContext *s, uint32_t type)
 {
     /* no SVM activated; fast case */
@@ -6483,8 +6480,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6d:
         ot = mo_b_d32(b, dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base, 
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes) | 4);
+        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
+            break;
+        }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6502,8 +6500,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6f:
         ot = mo_b_d32(b, dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes) | 4);
+        if (!gen_check_io(s, ot, SVM_IOIO_STR_MASK)) {
+            break;
+        }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6526,8 +6525,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
-        gen_check_io(s, ot, pc_start - s->cs_base,
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
+        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+            break;
+        }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6544,8 +6544,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T0, val);
-        gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes));
+        if (!gen_check_io(s, ot, 0)) {
+            break;
+        }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6563,8 +6564,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xed:
         ot = mo_b_d32(b, dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
-                     SVM_IOIO_TYPE_MASK | svm_is_rep(prefixes));
+        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+            break;
+        }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -6580,8 +6582,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xef:
         ot = mo_b_d32(b, dflag);
         tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        gen_check_io(s, ot, pc_start - s->cs_base,
-                     svm_is_rep(prefixes));
+        if (!gen_check_io(s, ot, 0)) {
+            break;
+        }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-- 
2.25.1


