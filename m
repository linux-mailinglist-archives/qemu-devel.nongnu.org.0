Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1F5366D9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:15:51 +0200 (CEST)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueV5-0007YF-1S
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMI-0003N8-Lj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:46 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM4-0001eH-6P
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:46 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so4775184plg.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2MwpG9aEqByOhoM/DW2jX/VmmpLz9U3BEngb4MfIQY=;
 b=gUFrj7mMt9wtUXwe3ZB6ktLQSW2i0Y9/0ZsDgR3Xd9+hU6oOEFk04zlu14qlussniO
 gTA4eyMtBwpKge9v6DIPqwwwlXZbTaBti6JafH28nLQ/2q9eC6drNlAfjUZSnjy1YL3v
 lGJI6GdHy89tBSGiyKiWNHJkdpHPqLvNu1lO6xnLfLKhvgDWfb1qvg7CEPcCaBG+rYc5
 fo3sOgB4wn/2O6tAcdDFEO/uLZpwyx6Ia2bCyq88dXRCE2ORKQrZa+OTKSrUJ0NTd+a8
 O3q5gok3BMjGAjqq5+Nu8t05oHp4WxZt5O/YnEA7Z4bhWJgbY/FoZMNW7u3429eu4MIf
 /e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2MwpG9aEqByOhoM/DW2jX/VmmpLz9U3BEngb4MfIQY=;
 b=c6l6fuTN8p5ELH2J/JdMZpaiije37iSxiLHSh2HZZYdSB8YGOoJ7Gh6fvXf8t5IbiZ
 SHKzYKy7BXG8cpKNy1jHkJ0MwhNi9IzrgqSpqygk/yyaRq8k5bjVAIOE+Q2dVySEyzw3
 0tl0MTWU9BE12D6qxVjOMDGW4QOJfj0E1RTeOlG26OWRBTQuK3mB/zACh+jugK0bewUZ
 omDe4XDPJEmFAR7576vPD7C6swclB/AxdELK+65z5A3I/cIuTTOCrSlAKEz7NcMy74S+
 7p9Lp5F1hwlLLp2o5hAigHtuTKH3s4zSFpMD2Xrq3UkmN9AEsMz41swEdHpCrX2pmJ2q
 qwuw==
X-Gm-Message-State: AOAM533/AxwQQhvkWAX0eiwBUlm17l0NtsIa8ZY6HyRuBAQWgBBeAs+v
 7SBbwdhllNH3BN9KERjFiUKXaORvcBYaNw==
X-Google-Smtp-Source: ABdhPJxoBhV/gLLmUkPXNNVGRiNM7nzT2YT1CD2fGwVws5cu54HUt9NIFvx8T/4W/DmMR1W6XWb0ig==
X-Received: by 2002:a17:90b:4d8d:b0:1e0:4cb0:fae5 with SMTP id
 oj13-20020a17090b4d8d00b001e04cb0fae5mr9483387pjb.116.1653674790908; 
 Fri, 27 May 2022 11:06:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 07/15] target/arm: Remove fp checks from sve_exception_el
Date: Fri, 27 May 2022 11:06:15 -0700
Message-Id: <20220527180623.185261-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Instead of checking these bits in fp_exception_el and
also in sve_exception_el, document that we must compare
the results.  The only place where we have not already
checked that FP EL is zero is in rebuild_hflags_a64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 56 +++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 84cb78d151..cd0a8992ba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6135,11 +6135,15 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
 };
 
-/* Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  This excludes the check for whether the exception
+ * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
+ * be found by testing 0 < fp_exception_el < sve_exception_el.
+ *
+ * C.f. the ARM pseudocode function CheckSVEEnabled.  Note that the
+ * pseudocode does *not* separate out the FP trap checks, but has them
+ * all in one function.
  */
 int sve_exception_el(CPUARMState *env, int el)
 {
@@ -6157,18 +6161,6 @@ int sve_exception_el(CPUARMState *env, int el)
         case 2:
             return 1;
         }
-
-        /* Check CPACR.FPEN.  */
-        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN)) {
-        case 1:
-            if (el != 0) {
-                break;
-            }
-            /* fall through */
-        case 0:
-        case 2:
-            return 0;
-        }
     }
 
     /*
@@ -6186,24 +6178,10 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-
-            switch (FIELD_EX32(env->cp15.cptr_el[2], CPTR_EL2, FPEN)) {
-            case 1:
-                if (el == 2 || !(hcr_el2 & HCR_TGE)) {
-                    break;
-                }
-                /* fall through */
-            case 0:
-            case 2:
-                return 0;
-            }
         } else if (arm_is_el2_enabled(env)) {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TFP)) {
-                return 0;
-            }
         }
     }
 
@@ -13658,15 +13636,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
+        uint32_t zcr_len = 0;
 
         /*
-         * If SVE is disabled, but FP is enabled,
-         * then the effective len is 0.
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL > FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
          */
-        if (sve_el != 0 && fp_el == 0) {
-            zcr_len = 0;
-        } else {
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
             zcr_len = sve_vqm1_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-- 
2.34.1


