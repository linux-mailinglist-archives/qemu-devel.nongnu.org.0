Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130A5F5FC1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:47:54 +0200 (CEST)
Received: from localhost ([::1]:39754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHrV-0006Od-Cm
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHit-00033V-6r
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002uj-1P
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3171858pjq.3
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UBYJ7SwTQGtIPTOqwkiXcvbu3ww//aiAy7+zMZUKVYQ=;
 b=jrAn2lr+eV0HWUEx8jSuYz0e3p6gXwVsIO7/0mJcrdpSjK5f9JQjVeTC3nDyieZxlV
 vwHrAHVUb3h8tGFKNs3zasdTKexSdQaUJmd1o/gC8vO73zyjAquTf3lMngttjkDIT4DH
 KZx4fsn3Zhg48A+9DeB5utM8cbHKQNQ3lMssoGx8yBhWwqlX/TIqeyWOPlCqwcGxBjSc
 MSpXTtSLJbzcNvGrxrQaDajfpbRn2tOaX698+wJzpMOq7oDltBlzZTUIYw3esNT9ChVL
 +hbVJB7I7zqpguHxD59tt4zlQavX0HSySDt9f/xm7h5n0cgNCe5EPAr/0fk9/AeUY/9P
 gt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UBYJ7SwTQGtIPTOqwkiXcvbu3ww//aiAy7+zMZUKVYQ=;
 b=x59jHiOWPzec/mmTtyVmL0I0OB3T1PEpjbKEStkRajj02NvqXtQoe7D9JCJXbkeCHB
 DRcQ32y9PYrTzRKAHa4nGtJic13kykKEbew/dqiUw/ZjUAHgVWGFEAAMqVi5+rEJo9pi
 i6fDXCyznj9mssZUe5Eunhg/G4Y4rNlaacfufDYFY4MER7q55nLn0W1n49kc0wyt+1aZ
 1wvkm5aMoFjL8BoGKikfwK8yOfkn4dVNJh62ul0wKI/RdlhTn309Zxu550aSc8w1UziU
 OvlWQZliESoL7VhBSXPNieMmqPT2SDHgMRKk9eGmZXismTnzNbYr+p4bSd3ruRgl//PH
 WJgQ==
X-Gm-Message-State: ACrzQf0lpKkZmTRCpFWk76YPP4aemoyTGoKcKhEAo80TQP9+UcOZTZ01
 WCSHYog6T+8xHlWr05IYaYC9oZmEygL6sQ==
X-Google-Smtp-Source: AMsMyM7q7bQ3TPAvF8wxXkhQfjVq2WbHEXVmAI7IqJ4VEsK4wTncjIQJR1asoJF/69940u1GgyQptQ==
X-Received: by 2002:a17:902:9b88:b0:17c:97d6:5e78 with SMTP id
 y8-20020a1709029b8800b0017c97d65e78mr2517038plp.62.1665027532351; 
 Wed, 05 Oct 2022 20:38:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Wed,  5 Oct 2022 20:38:42 -0700
Message-Id: <20221006033846.1178422-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index 2621b3b36a..005fd767fb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
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
@@ -2219,7 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
         if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9d3128656..e0b1d415a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
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
@@ -1173,7 +1173,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      */
     if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -6560,7 +6560,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8766,7 +8766,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
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


