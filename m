Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1E26003E7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:23:07 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okC2E-0004Xa-AP
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq3-0002d5-N5
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq1-0007qa-Up
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:31 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so12584578pjq.3
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=iE1KGCKKNqnK0lKfrQNtZC35VJ8rMe9B13D93qNacvgssTD+ytXm9JbJZJ8h9fiZ2X
 4XfLwZCpjBWVgnW26D8d/Nggk5ovYeMYHJh7HFCUu3fdxaF3hLVLx5VC8/NKDHon0DC1
 PMVkmhnf4GD1MEZjInHipB+WzMFjVu9tUAz/fRHJTig6yhVFlrOzHwvc9QDtleEaSLXk
 dus7sS/B44fUY7QWm7+e6FSixiKZtmNu6BW6UyNvAtr5WjCQ5IZe6SAJqGOgT9PljOCd
 BidxNo8/544daiGAsl4hI3wq6Iiaw3z669b2aZOgrRTFKvi5pqeZ9o/R/C4h0kBNe9IC
 Xv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=M2X+heI+4P6XSZgNbonP7jE5ew/3nT7lbbWm2+BdkWJj28KxdSUxwAiF9lEZkbqZgx
 Na2lDn+G3Pv9XRCQok1zYl5chAtmuMiDVWx/1dSBSqvXqHtRdmc4QWZJghyuohGpxuvl
 aZ6eTCsXxQT2KzJW7nnWefFaiUqVx7Egc6YWCqQsdRQkiVxwSyBoqkuzaR1tfz8uoBmp
 FXNXGNZmkLeORvFXGcpLNE0xaOQUUUx+sAyx1YM6WS85SjLbWpHh5a6uBRs0WUmIzAHe
 XTnaUaUvP3t9cQFZDy8VuAIAfvjd7KgHbx+zgBi04YcrIW+MNQ1NkUeAbnwn/5kCiIA8
 nCtw==
X-Gm-Message-State: ACrzQf2aJuqGdYG8yEuiNK9cRVAxpjf8LltKgCFBlTnC0yVCghkpQ+th
 +fK1T3CdIqH9UYotTk20onNMyvFqcgxxk5gC
X-Google-Smtp-Source: AMsMyM5xPHBxuIHXcoEZEP3JHZOD6b1ixkl1ttWD5zh+I7hagHl3oBvHxCk+lFFbKIdVX9sVz55AKw==
X-Received: by 2002:a17:90b:4b46:b0:20a:e906:426d with SMTP id
 mi6-20020a17090b4b4600b0020ae906426dmr10402702pjb.48.1665958227868; 
 Sun, 16 Oct 2022 15:10:27 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Mon, 17 Oct 2022 08:09:28 +1000
Message-Id: <20221016220932.274260-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
Since we always pass dc->pc_curr, fold the arithmetic to zero displacement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 49380e1cfe..623f7e2e96 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -332,9 +332,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2211,7 +2211,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
         if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 350f991649..9104ab8232 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1074,10 +1074,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1169,7 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      */
     if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -6556,7 +6556,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8762,7 +8762,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1


