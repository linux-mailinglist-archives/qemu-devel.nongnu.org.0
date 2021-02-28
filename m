Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E955327558
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:47:56 +0100 (CET)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVn1-0006rW-01
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQP-0006gv-6P
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:33 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQN-00083t-7Q
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:32 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q20so10260753pfu.8
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AxLxL20h1MLfwKywJHFZQ2Ei3N+Q0xu9o2GbD1OO+c=;
 b=VcE8XUVqFoyj/SlnJg8BpfSepscrQDSWNAyA2DjZTKlmg2Sa7X2Q1h69BJCSJn5SGe
 G2Pq5oTM5a9aF2B/chmJr8PGH4bo8Z8e4elbDu+W3b8tOjlnh3KkdH2rWBC1gW6kMDNx
 6TdK/CTOZTy+bUyyPvFH969EE4E3MrQ64QXymNGXxWg3q9TZ/GDTyIBdrdQWPvYATZ0n
 BG2WXbWLbmzqGE5lYsFAdBtZg9dEQzrzZcw4iEPAqSL0p+iWXXD/UI4RLZ8mJnJWl3ab
 GYHPanTT8ic5p9KAD3DNMrKqRu0q5cWwKkhw4AgUHFq3UmM0fxIwX5KwhP2DLNjIUdE1
 HHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AxLxL20h1MLfwKywJHFZQ2Ei3N+Q0xu9o2GbD1OO+c=;
 b=K5fMnmqW/lEeFQdlh6Ke9f1GRs3i7h4BnbUC97gxzEZ50kRkeSH9ffp2c6ywBb8AP+
 Pt0GyeIkkUhROCLNNm3byLHS9fSzyD9mmA8aPWsfjBnVn3wSqeSvTFCct4o+INO2q/Wp
 fj5yZu7H0BEhJ+OkeUiexzzuHyPw5YGM9pGvw6p6fAVzFAkKD3wq6wL/7wIUwksAOaKI
 jGmcrN3R9Mez0hSl+kxb9dZdK2Jl1N9hNwmaCkOs9zb70OWPgsQQR+MxmIdtQT/cOmcn
 byLSm4/U2w8s5rtNbY5cWjJaZ7ULlh48UwAmCJYlqMGgIBcAegyAai/6fa5CfktUrDNu
 0CQw==
X-Gm-Message-State: AOAM532BCG2WNRm+oqZBzUI8moqI4EevujvK/UUwnIURZNFZ6sdJWP0+
 ZrCzKkA2PZQw4p9QNzDDhjwSstr6pFyJTA==
X-Google-Smtp-Source: ABdhPJyDBtn2t1rsh0iA15zTYZ2+pGczm0RGL2jTn+zwPzkXQylZQJMZO/XaLOVfk5E0qhyHWQUuBQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr11480066pgl.46.1614554669887; 
 Sun, 28 Feb 2021 15:24:29 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/50] target/i386: Tidy gen_check_io
Date: Sun, 28 Feb 2021 15:23:17 -0800
Message-Id: <20210228232321.322053-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Get cur_eip from DisasContext.  Do not require the caller
to use svm_is_rep; get prefix from DisasContext.  Use the
proper symbolic constants for SVM_IOIO_*.

While we're touching all call sites, return bool in
preparation for gen_check_io raising #GP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index dc31d8667f..83bcf5cccc 100644
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
@@ -6477,8 +6474,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6496,8 +6494,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6520,8 +6519,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6538,8 +6538,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6557,8 +6558,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6574,8 +6576,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


