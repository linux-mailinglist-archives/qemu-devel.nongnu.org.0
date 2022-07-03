Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19286564610
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:59:38 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vS5-0002aO-5X
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uva-0000bN-K8
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:02 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvY-0006ER-VU
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id n10so6067375plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJliRv7SE0glwKqdJ6L5blCFVHOfbsAKHLHPwEgHUps=;
 b=U+j9d/XoNpX5IrAE4k0QnuMu9bEypcuS09wIlA1dnUU8ow8Ri7bwG3WuhU1bzcBQEY
 tjlgsYq+r9uqvY0VOqMUbeQw4ukl/+AxMYJct+2MncLKrZ/fWP1LPiY42oN1xLKP3WP3
 Sxh8JQcy4SvCu/BGlgG7T9PUBgXgKrg4h3QtM0y9kFn4+5H3euDRSwDuNQdDHA41pjLz
 9buNLkGUm7dqFbLYxdmEZJK9as4lagEul1vDaFdIrY/ta5s/JTPabCa+Pr042BKDbGjp
 j2H4jY1ngYZR7i0SWlxzwL9BxJTReOO6nu5029sXPKBeKqtgErzP+jDIUHZ4y2KH7+kB
 zgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJliRv7SE0glwKqdJ6L5blCFVHOfbsAKHLHPwEgHUps=;
 b=XBmyYrTUz9J2etEU88dEfajTlG9thxGj1ZNIlF0pUAY23lzj1BSl+WpgIoRHEGST+t
 2RRWmOySJIjeMKlIwbjGjVVNPTuFzNQ3I9/dXQObmoVKZ7j0kOp33yAQOUJIyTFfVuBw
 mZGthYsDggSciUIWLStlsXS4s0twY7cUfqwjXc0KiWwkZmryq7evsirx8cIIAPpRBpB8
 cGbLVZe2LicIew877tod7f874jJuowp1dMpgZCY1G+7O9aPBVJJaPaE4UGbwN4pYU+vV
 wAh3pAfUFL5XYoEpB11xFZGNyFaFHnHiA76oJDE5nQDXMkNr4rWiZBmN96HVUDhqua01
 uSnA==
X-Gm-Message-State: AJIora9avPxc54WweXfHVAcr17w7B4WgcFYp7RVIDsC3Uf9D1k7BSQQO
 lrD3TmhGkRPumCFr/+kyX3CNSWYxBJZr8UJ6
X-Google-Smtp-Source: AGRyM1tHFDFA2Jy4CIpeOGly83YC6S5AlYkoa2edQosXfBlBlnVkbZtNSdO8bWOOq1MvdkPHBrwsag==
X-Received: by 2002:a17:90a:5101:b0:1ef:7fbb:7a22 with SMTP id
 t1-20020a17090a510100b001ef7fbb7a22mr2806355pjh.24.1656836759719; 
 Sun, 03 Jul 2022 01:25:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 31/62] target/arm: Merge regime_is_secure into get_phys_addr
Date: Sun,  3 Jul 2022 13:53:48 +0530
Message-Id: <20220703082419.770989-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

This is the last use of regime_is_secure; remove it
entirely before changing the layout of ARMMMUIdx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 42 ----------------------------------------
 target/arm/ptw.c       | 44 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 81c386ee15..d7062c6503 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -676,48 +676,6 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b25e3a8c87..a7c0d616a0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2515,9 +2515,49 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
+    bool is_secure;
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+        is_secure = false;
+        break;
+    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        is_secure = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     regime_is_secure(env, mmu_idx),
-                                     result, fi);
+                                     is_secure, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.34.1


