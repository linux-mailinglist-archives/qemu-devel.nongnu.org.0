Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF2E53C08D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:02:48 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsty-00050j-Om
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgf-0004Sj-Ka
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgd-0008Ug-Jt
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so10649319pjo.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e4LsisXhmXFsvM3FU/zvbh2EDjCmsWCEXLT7Sf9YRE=;
 b=jgFqSxNrIJzy5m5awI4C8iInfwp9rcDciK50cKOXhJZOdZCHMI4QmwZtwyHSKz7wof
 GdZWLXsAJ/7dNGpRK0IQmg0dhYcTR7OmfDn9oD9G422eA21P2vJgVoAqvf4dzsj67ErI
 iZKsy7ld5UDoJd1o/HhPLpxLJAfiM6xdU4811Kcz34rQB91fq+uK+xlNJc0d6LE+9+xB
 dz9OWWLYVTt6oGJgA03JdufCx6X3OvpJTPj9cM0UoCQaXPbOkhJQxHUKzEj6+IV1umIx
 UmsfGf8fwc1vPG19Ijgh68U/2mNdQIDjRIksfctFkEKLbadnn4KCrCdscFSaSOkUHnwL
 2hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e4LsisXhmXFsvM3FU/zvbh2EDjCmsWCEXLT7Sf9YRE=;
 b=U5VRqnb3ooRbgbP4a6eRbQ/kEkMF/7NkeKfG6FD+4joNaej51xoe7BX4SvplTM8bol
 quJOUu/0/1pCgxVQ7JmkWWVDLMj+Itrk2I0uKUr+JiLPiYPMtusMbZfS0P7A4ZS8SX9C
 RJ0YJTlbUf4RGZG6paaGQlkg00pTza7pf6suE2a9iKQ6INNZ1LYrnZ519ujQ9NEYq/Eo
 MxoYcUdhkUmREjRyf/ilHYArgB6F0J4yEhwcFSMYWNreKtGt22230dSKA2ivL+eAja9y
 OE0ZBPILsmzcvdpA7lkY3sEHngfQuBkSlB66HWZ1rGSVAuITgLhXckt4IHxGB3s9rbiJ
 wqTw==
X-Gm-Message-State: AOAM5301khG9TjoefBv/GcW6SSt1CR4l5a2t9MTwZO+Yzzgosy/j1BW9
 jiTAtYx4hLI6zleq2PbIAsQM9IvcXRRihw==
X-Google-Smtp-Source: ABdhPJylIuFtKLIGEaBm0nU5frLD2tqhRgPSmp4Gqs2+OedJbsROlIyWA9eeWwLYA4xEguhDpft1IQ==
X-Received: by 2002:a17:90a:4fe1:b0:1de:fc11:331e with SMTP id
 q88-20020a17090a4fe100b001defc11331emr7525093pjh.145.1654206538229; 
 Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/71] target/arm: Remove fp checks from sve_exception_el
Date: Thu,  2 Jun 2022 14:47:46 -0700
Message-Id: <20220602214853.496211-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


