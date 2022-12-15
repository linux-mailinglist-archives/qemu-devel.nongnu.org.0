Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA264DBE0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhR-0006s7-0t; Thu, 15 Dec 2022 07:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngy-0006oF-5Q
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngw-00047q-8E
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so1384258wml.4
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OyeQ4yPNj+C/vssV1sHtgciwO5ee7WuxGatE6ryMCsI=;
 b=junQ3quI5fbUMmuI7S5Gq+4v7cOmFduiyj4PobxrECTuYPP6FMcMjdpsEIPDl0dFPc
 2nICW9KY3eWeDbB1FRlwMgdCtXUClbG/zha+T8dya/0Ov4s1450WZKFDxGk0nOHRTFoQ
 8FPnit15wahNN8741lN0P6lnw7aOH+S/Pfwp39xvCT6h/HUp37x9dd8ALM0MI4TWa9nQ
 bklJpMMABbYFOPHhQOFQze3M9Hz6WgiRnb/F84CdhB0tN+nInO5FSbyJVMocVXfzdsnm
 9eJp9wezkWRF+ZDlsbEs2z91c6YgOzGJCHsYcvIL9KpxvNoY/3EPQGHpLkmpd+4tn15L
 2wWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OyeQ4yPNj+C/vssV1sHtgciwO5ee7WuxGatE6ryMCsI=;
 b=RXstwa0cOq5cYynl4K46xkPAPnTq4j7M80YN8yzWs4pYlXaoYH2HQGVoMmCuKyYesA
 iW3JlLUs6T6D/ACE2IAnVIxd9lI4eG2+Rn3ftHdj02Ua3TYuVepEXgZxFBJXDmkT4IRW
 jlTBSgx0Aw6um90SaTcm4GtK3xPnAUt/Dr5e+AyVoIhuE4AlnFXiM8cJHzRwhufRvm7c
 TQrlHBY9etH8tSOYb6Ojx82vIFd9BaDbbvy6N1Pc34iZzjr2G26ugyrJN/v4v70aMiWY
 F/tTucpU1PdFytGI05+Zwd10IkPiF5Z2SU9Ps7wKOMBRYdbVHbrqq9PAaeNk9SzxLBXP
 Ln6w==
X-Gm-Message-State: ANoB5pmG8RZEfhN7TKq1/qeza2YwZsc9zawX/b8ClAhzN0UlxS2oxdKW
 yE2lKkSj93u/VBHCom420Te95g3pCMXv86IH
X-Google-Smtp-Source: AA0mqf4k3hbY5JeH1+IT6yQk92yg39YQqtU9Rsz1ZPqAtO4+Qx4EYqjnFAnyni3ELM26vzbeVHWXfA==
X-Received: by 2002:a05:600c:1c9e:b0:3d2:7a7:5cc6 with SMTP id
 k30-20020a05600c1c9e00b003d207a75cc6mr19796040wms.18.1671108624721; 
 Thu, 15 Dec 2022 04:50:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] target/arm: Implement HCR_EL2.TICAB,TOCU traps
Date: Thu, 15 Dec 2022 12:49:54 +0000
Message-Id: <20221215125009.980128-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For FEAT_EVT, the HCR_EL2.TICAB bit allows trapping of the ICIALLUIS
and IC IALLUIS cache maintenance instructions.

The HCR_EL2.TOCU bit traps all the other cache maintenance
instructions that operate to the point of unification:
 AArch64 IC IVAU, IC IALLU, DC CVAU
 AArch32 ICIMVAU, ICIALLU, DCCMVAU

The two trap bits between them cover all of the cache maintenance
instructions which must also check the HCR_TPU flag.  Turn the old
aa64_cacheop_pou_access() function into a helper function which takes
the set of HCR_EL2 flags to check as an argument, and call it from
new access_ticab() and access_tocu() functions as appropriate for
each cache op.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ec1c3ffbd6..eee95a42f7f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4273,9 +4273,7 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
-                                              const ARMCPRegInfo *ri,
-                                              bool isread)
+static CPAccessResult do_cacheop_pou_access(CPUARMState *env, uint64_t hcrflags)
 {
     /* Cache invalidate/clean to Point of Unification... */
     switch (arm_current_el(env)) {
@@ -4286,8 +4284,8 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
         }
         /* fall through */
     case 1:
-        /* ... EL1 must trap to EL2 if HCR_EL2.TPU is set.  */
-        if (arm_hcr_el2_eff(env) & HCR_TPU) {
+        /* ... EL1 must trap to EL2 if relevant HCR_EL2 flags are set.  */
+        if (arm_hcr_el2_eff(env) & hcrflags) {
             return CP_ACCESS_TRAP_EL2;
         }
         break;
@@ -4295,6 +4293,18 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_ticab(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    return do_cacheop_pou_access(env, HCR_TICAB | HCR_TPU);
+}
+
+static CPAccessResult access_tocu(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    return do_cacheop_pou_access(env, HCR_TOCU | HCR_TPU);
+}
+
 /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
@@ -4935,15 +4945,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "IC_IALLUIS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_ticab },
     { .name = "IC_IALLU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
@@ -4961,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = access_tocu },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
@@ -5138,13 +5148,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbiipas2is_hyp_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_ticab },
     { .name = "BPIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "ICIALLU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "ICIMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "BPIALL", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "BPIMVA", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 7,
@@ -5158,7 +5168,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tocu },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-- 
2.25.1


