Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C158D52993D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:03:28 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqIp-0001vq-Go
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4r-0000U3-6x
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4o-0007oW-2V
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:00 -0400
Received: by mail-pl1-x636.google.com with SMTP id i8so2495068plr.13
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+kaX5CHz+xx+6kDKxLaFapfSu0CDuUAbTCZFIx5C8E=;
 b=X7Pq2VZdq7WYull8DG09/Xrij4wJr/1zpE53TnJwGkEj1RSCl68PDzpmqwl2hPF5Ga
 Je/B8i8LP2563lBaH7wdMuOicxaYUDpsL0WEc8Ti2CnE1+34CtMbg8C2KAUmJTqZ1+Lh
 f+Lc2cFWqnurInicT7TDNE/36PxCl26yW6I1yzt0A903AkT5RjrTVPUMbrX2sK0lJzuN
 iqWNXm8Nd3c/rIiOwhdgldzY9CpNXGwevE0wTmYfz5Owo61ItFSOs416GG9x68n4/1Wo
 DKkYZNb+w8zdP2/0m0Xlnby+cVRBsU3uDEH8Aac0B6HJ/ocd00xgDKTHhoYhHP0EmpJA
 D9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+kaX5CHz+xx+6kDKxLaFapfSu0CDuUAbTCZFIx5C8E=;
 b=gUEhXq9NGwtDJCkWfrr5YzEAbX/u4/OIlYLh5YocHJmd3W++/ptCYQtnpKEP9+wvom
 So8OSXIgCmJK4ObCvHQ1mKBWfRl15BZPIb8RoGNaHuX5w129hJUETFl8TOmrPYx2HxLJ
 l/m/Xrt19C1D0Prd74IhJI9ysa38Wrvzxk8D/nJjoYI5Us4Ndv0CLDDh7cx8pAA16bH3
 dm+kSGaBzUxqo6ag7fr+2nOsH76OB93aHdzAwSBVIjf/HwhHxHuCjw7DXwZ61JpirfVe
 c+veb6f9RuN6Fa3Vn3QrN5MRVRTMS/xvh48KYHJVZN1lF5qtBhVzkJrsAkI2IJFcLvQE
 v0WQ==
X-Gm-Message-State: AOAM533kGRs2PJ3jTkZRC0H5inBSmp0zzk6Hf3id3QSGhSWW9Xypt36W
 4eVK4pOSfYeA5D9KQVWri0Sv9Wj8ibt5Ng==
X-Google-Smtp-Source: ABdhPJxKpUtlNy8Z2WHUtxL5PZ0gqNFlsP1+jA/f+hqCkVm2AnVXPIPhmsZhbWbMp9pe7cbjban41A==
X-Received: by 2002:a17:903:2055:b0:161:7399:3b89 with SMTP id
 q21-20020a170903205500b0016173993b89mr9479448pla.22.1652766536846; 
 Mon, 16 May 2022 22:48:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 6/7] target/arm: Remove fp checks from sve_exception_el
Date: Mon, 16 May 2022 22:48:49 -0700
Message-Id: <20220517054850.177016-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 52 ++++++++++++++-------------------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index edeab4e473..05baa73986 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6136,10 +6136,12 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
 };
 
-/* Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  This excludes the check for whether the exception
+ * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
+ * be found by testing 0 < fp_exception_el <= sve_exception_el.
+ *
  * C.f. the ARM pseudocode function CheckSVEEnabled.
  */
 int sve_exception_el(CPUARMState *env, int el)
@@ -6159,18 +6161,6 @@ int sve_exception_el(CPUARMState *env, int el)
             /* route_to_el2 */
             return hcr_el2 & HCR_TGE ? 2 : 1;
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
@@ -6188,24 +6178,10 @@ int sve_exception_el(CPUARMState *env, int el)
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
 
@@ -13541,15 +13517,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
-        uint32_t zcr_len;
+        uint32_t zcr_len = 0;
 
         /*
-         * If SVE is disabled, but FP is enabled,
-         * then the effective len is 0.
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL >= FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
          */
-        if (sve_el != 0 && fp_el == 0) {
-            zcr_len = 0;
-        } else {
+        if (fp_el != 0) {
+            if (sve_el >= fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-- 
2.34.1


