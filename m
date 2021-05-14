Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABA380D8F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:45:35 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha0M-0005c9-6L
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZC-0003fO-7E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:30 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZA-0000Fa-BN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:29 -0400
Received: by mail-qk1-x734.google.com with SMTP id f29so16784738qka.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MvJuB4xxwvjoF58ARslDZdYiEoaj+dyW+QyQ8KS7pRg=;
 b=JJeBIr6hrXrVhY5Ta4GsPWV8vO64Xy1SF6LCnOuoGWrHzzhaTo9N8FT0O7L3tbWumX
 d72ahp3Bdwu5ynWzyO3s7G22kay3VAsDQOSDXKXwdmjVo3CWqWm9KWSTCwCfgNRsODI1
 HriolQ39kL/PWcFPdUomQPIasW0yWyj7l6fZ1MAfGfLS5KUAQ1Nim7qzwHLGxst3KKj4
 UqAgcqWZ9LG/2OWx/LEwh6sN0VuJJgu0yBpzFe0ZW6+Dw5GN4Iq/XsC3aUVFKweTZr8+
 1zE1y8tlZyt5/8xYQbPLE4VruIlvC4AXhHS/g9Pbc80sZHA95fVe3+rBheryFbFvpZ7p
 BhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MvJuB4xxwvjoF58ARslDZdYiEoaj+dyW+QyQ8KS7pRg=;
 b=B62bzS2KqtG4fH6jDUtuhb7idp2gC7cmNdFEp15IZM9WZcfmWQCXK/KJZqhdyJWIiC
 OiSKkBzyX0kkEGYdE83gIunmkNQg6lBj+jGiU/Yd2KZ8zvCy6dkUGe0cG6qxImZjQAkx
 sLUE0S/fHlpsaNI44wgP5VN2UUEkqAZhVtZyZvQpu8YCBe1FZE7dij2Q/djG5lZ0jgVx
 zPln7ryRWQ2kFp9hCt/ShvYkoV30A+1vJfyPALImWF2/OlJYMTWHlLiYwWTKTgaT/zEd
 kRX9bGJhOYdBZIl2nCGw9xUTAltwq0JrkeNnqGJjnuE9eCq3wm1v1r8osCACurCyitgd
 IeoA==
X-Gm-Message-State: AOAM531Gxm5G96uQwBaxL/ZVEVfOrptnxZYMMWn4wi7O0t24zkSnwrSK
 orFiFb2kol2TxObZhYoTjB9FliaqZ/mK5siXJcY=
X-Google-Smtp-Source: ABdhPJz2RdlFDeH7bdfizPDqAaMKtD4h/3ypXUIOXfUS5fAMPVkV41ZE9OwYXPMrvsxNpWwcpggHMA==
X-Received: by 2002:a37:a012:: with SMTP id j18mr3023686qke.348.1621005447504; 
 Fri, 14 May 2021 08:17:27 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/50] target/i386: Tidy gen_check_io
Date: Fri, 14 May 2021 10:13:38 -0500
Message-Id: <20210514151342.384376-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
index 6eeaa3a98b..02c76537a6 100644
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


