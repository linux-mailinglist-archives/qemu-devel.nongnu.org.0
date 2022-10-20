Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0E6055E5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:21:51 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM7y-0001J8-Nt
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:21:50 -0400
Received: from [::1] (port=60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0g-00028D-Tw
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu6-0003MO-Ns
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu3-0001p8-9X
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:29 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 10so19126758pli.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=dWyDFVZPD6CjsRJFiEMto8mE2eW/vqKPQPlkqe8MXzMXcyDCI4RWnXM+1ytBjlfnjM
 Awn4Pbw/Na1uMfy8dXoVYb+vSo3cLWTey5T0bj8w9rRgGs8ukvCsNXXB7AEQX68dCsGZ
 OlD2xlr2AZwo9mfcdtGM64WifYKWuUQsC+lZBYahxko0bkXYDCSdw1s1AsWIiwvICoHD
 XXizs9ZESiO1F46tb16IS/z9KWIai6Fz5/SVAgYt7qLxTp44/fH2wBcO8g/n+pT5kHUO
 3OWJJQUGgQxxbaKaoilk9joT15OlJF/ahLfyUfm8yBSNvSZ0udb/h4h8wWwiLSSUemyk
 K38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=VmBcZBkiaXP9pt0xXFYaZLW0YoeShrAFrSmyDPn/3Sp+pvQ93SpqG0cy01OrkLUCeN
 jVAdqCZhTHAaFFV70dhrZZtSA1AF5D1jP0m3IuO7k965K3rTXg6+wqA1+6zCRL+T3JVA
 m+OElLcgYfpayw0Yb2mCAqkZ3OAw7VkK0XZ7VpuxnosLt6x8Yyje95SW2orBMH2b3HAr
 IuVoYHP6RQ/jdCMSxYEtGl0UVzh5DLPVU7yHFbC53sa6ZIYpdzameOi7hsGWNiFogHET
 CH2X2978Q0OI1sbN1d1ju/ECH7s0kuCUXWk06Ce6kuo7y5gnRwZjJaiK6XZ+gIcCx2PQ
 K/bw==
X-Gm-Message-State: ACrzQf1kkFEDB9XMO+Y6sDACnc8q5czNcgM5J8FmUTqJvBQ2PreKpvT+
 QLJF8xeHilB3pLAkZv+NydYL+0JzMlvZ91td
X-Google-Smtp-Source: AMsMyM5MvJBoSz0twnoHLdHR3RwFYYpQrVsUdVz8h3MnnPYjujVyC2ZUSu/k3CQJ/jHBNkCXXl8VGA==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id
 x10-20020a170902ec8a00b001855462261amr11759982plg.160.1666235245864; 
 Wed, 19 Oct 2022 20:07:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Thu, 20 Oct 2022 13:06:37 +1000
Message-Id: <20221020030641.2066807-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


