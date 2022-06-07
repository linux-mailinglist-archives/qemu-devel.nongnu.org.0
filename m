Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297565415BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:39:17 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfyt-0000IJ-RF
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft9-0007LB-4B
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:19 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft3-0007DT-TN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q18so15770169pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7CiA9DdlCOhWlL8CEoveJRO9oJ9GQCNXOqZts3HTb4=;
 b=J5l+3uNyyW6MoPnfGXjWfbVBrdcuRdUBkBrsfu9urswiJraDqWhQr5kv0LIrqDutTR
 0nM1Kv9UDP+b+8yFXywOa8r3m4bvV5MYJT1+L0lmnVAWnnUXeXiIfjOpwcBCJVV6hkr5
 9zA0eRoncytGMjhIgaE6ivWfessl81U9fo3rqQBCCnkY8871I0eQgdIrtcv4fglIWS1l
 WP5zt7jo3wCHdbqdqyLxzZCt+JIBA/GB4EVEOjOx+W77BxtxSJeh+uD/3iB6lM40BdUg
 tJ3vWh7Co4dKSNfZSrzamh3RHs/X4BREesKAojQfunDDRKhRwrTdyPt0hsncA2d7+KJt
 XPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e7CiA9DdlCOhWlL8CEoveJRO9oJ9GQCNXOqZts3HTb4=;
 b=GPYL1kY9gr2Sqw4gY8ZajDqj6MbiYXfd4EUfuAA5rmc8CGnjtfObVi4V8v5HGLT7Au
 tL5s4t7yO7/rPXz0NXLzfh0PGerF373CcOl8bnXPmlqB/uZjy7UlNCm87uFOtvlT8MTC
 ff7oReoVbYazD9QS1wzvcUhafzegn70WFoD17703YgIlZAsxPbqqdKmDCkWeExb+fvE3
 xM7OuZbFfW47E9OSbPAQagr9M7uyBrLjDtbfzKUr2wD4CQ/L6+X5UArT06Y1SXxedZ99
 R85Nko1gu80OXEDUvAT/nfxJTdO2Iax8e94bEKfjTuyN4PMsbdoJ9ge1oai20aDsFdYd
 lmPg==
X-Gm-Message-State: AOAM530RaOB1JIEF+ueiOTgEb8ZikNaWHvvE9YhIVVq40qa+hbHzeE34
 cC326kUBb2t/n4GXYRT86Y9dIu9qih6NCA==
X-Google-Smtp-Source: ABdhPJy+7NbklkH1e51mGy2lhi+jx4onISpG8XuSCsBg5s9QpWAsFclfqn1u//rmsL3RjzefIuhbRw==
X-Received: by 2002:a17:90b:350b:b0:1e8:5177:fe7d with SMTP id
 ls11-20020a17090b350b00b001e85177fe7dmr22022931pjb.142.1654633991509; 
 Tue, 07 Jun 2022 13:33:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/71] target/arm: Remove fp checks from sve_exception_el
Date: Tue,  7 Jun 2022 13:31:59 -0700
Message-Id: <20220607203306.657998-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Instead of checking these bits in fp_exception_el and
also in sve_exception_el, document that we must compare
the results.  The only place where we have not already
checked that FP EL is zero is in rebuild_hflags_a64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ace3ad533..bcf48f1b11 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6139,11 +6139,15 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
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
@@ -6161,18 +6165,6 @@ int sve_exception_el(CPUARMState *env, int el)
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
@@ -6190,24 +6182,10 @@ int sve_exception_el(CPUARMState *env, int el)
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
 
@@ -13683,19 +13661,21 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
 
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
-            zcr_len = sve_zcr_len_for_el(env, el);
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
+            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
-- 
2.34.1


