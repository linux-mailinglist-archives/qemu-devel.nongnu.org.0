Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0F5455E2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:46:41 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzP3A-0003ib-BS
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmI-0003l4-AS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmG-0008T1-2p
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:14 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e66so22844136pgc.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnz9a4ifMBmrgWuB+Ns8XkcntMH3zG5QAm9o9NexRzw=;
 b=WM2AoqcEJdtWYngdczBIID4zICHCxPkQ8QWK5qGvtYkTIIi8vDTq8xG8mQka/cBSlU
 BhPGyuGnUdF6d5uPMBOLWG0fuRRp2lw+EoDg19mjrU1SzQrYzG6aN1LpBBDFpY93FPRB
 Po9ew610WYNyjZ3DKw+mlLgRWR1JLQlpcVfI0hthza2zKG0lYIMAfWpEYU+eOhFJJ4Yk
 0RrdlzKosJiwedsoqtyczLsSsnk11mvO8bvo+4i6Bccn5/yKahZSYsIQ7tBL7+zmHWbt
 60Rw4tnx+a2LSVxPLC6iKeVtD0+a3/nuhNoX2rZsAFOO3ByExRn7cv0pchhF5RG5W6XF
 HUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnz9a4ifMBmrgWuB+Ns8XkcntMH3zG5QAm9o9NexRzw=;
 b=BtQ+Zjo5yeIwrkG+xmS65qeott3yydJ4C9WkuCFgmX6PWStyE/OaT5az3EhosX70E7
 NThAtUfd74o1pE5WNPwPEKwRhYu0JEmJE4LqXY6VpRLhZjxJ0EysAHRc+GYuMz1eF/lw
 IJRY/e78outm1UluemiJKm7AK1Hm7V5/5ace9KefWCMxJNv6D0F8eZvKc83BtpL9S+au
 5zQlzCREoVtnqRAaBN5/BqKDoZKx0Zp/pvM8yKjWPhRcyKUd4RiHcoLaKLMu30d+ERAa
 v8497diCD5jRnQBN6vzOx1Q69gIGfNEJl6caSYfpLluHwG+mEAQfCWKLhSrdxousW9Sw
 eFEg==
X-Gm-Message-State: AOAM532kp3GCvZ/dlss8tZG7XruXCFjJ891IEIYOvMRUV4UmwLyJnKM4
 XVWgsDkz/nd68rqGOIXFfzSLKWtPmtQtBg==
X-Google-Smtp-Source: ABdhPJwdZiTWaaOIIutypEtyIJzUOrOgNaXLl6UzBE6HYRnsoI9r5RsV9Qv3bz6bNZdWvIFUc5aUXw==
X-Received: by 2002:a63:8b4b:0:b0:3fc:ee1a:9574 with SMTP id
 j72-20020a638b4b000000b003fcee1a9574mr34365519pge.431.1654806550771; 
 Thu, 09 Jun 2022 13:29:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/23] target/arm: Rename helper_exception_with_syndrome
Date: Thu,  9 Jun 2022 13:28:47 -0700
Message-Id: <20220609202901.1177572-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Rename to helper_exception_with_syndrome_el, to emphasize
that the target el is a parameter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    | 2 +-
 target/arm/translate.h | 6 +++---
 target/arm/op_helper.c | 6 +++---
 target/arm/translate.c | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73d..5a6802e3fa 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,7 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
-DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f473a21ed4..c57830126b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,9 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
-                                       tcg_constant_i32(syndrome),
-                                       tcg_constant_i32(target_el));
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
 }
 
 /* Generate an architectural singlestep exception */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2a8bdc2cbf..8a6a3b8551 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -381,7 +381,7 @@ void HELPER(yield)(CPUARMState *env)
  * those EXCP values which are special cases for QEMU to interrupt
  * execution and not to be used for exceptions which are passed to
  * the guest (those must all have syndrome information and thus should
- * use exception_with_syndrome).
+ * use exception_with_syndrome*).
  */
 void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 {
@@ -393,8 +393,8 @@ void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 }
 
 /* Raise an exception with the specified syndrome register value */
-void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
-                                     uint32_t syndrome, uint32_t target_el)
+void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
+                                        uint32_t syndrome, uint32_t target_el)
 {
     raise_exception(env, excp, syndrome, target_el);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87a899d638..dc033600c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1119,9 +1119,9 @@ static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
 {
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome(cpu_env,
-                                       tcg_constant_i32(excp),
-                                       tcg_constant_i32(syn), tcg_el);
+    gen_helper_exception_with_syndrome_el(cpu_env,
+                                          tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


