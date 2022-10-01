Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B55F1DB2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:38:13 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefVE-0001gV-ED
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006kY-9h
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:05 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHO-0006Gl-DI
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:58 -0400
Received: by mail-qk1-x734.google.com with SMTP id 3so4547875qka.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YUgoT+b6fWGQnaxpAgaCymNUj0JMoRjdbdEo3IB0Hrw=;
 b=nMZYSGKjI7zFJxikM0HB+50DbcvuJSECCb1K5gTS3hd7piNpaXDi0aduszmqjp4CQ9
 1YwSngP2WKtuRB4HEdYqc0BlD5PvyQ0BMQht6uDXYOxS3KALEhdDfu0PUpd+9N6uGViS
 s0b6nHozQ8bKCtX9WjXrqh4FBVgJR/o4oksrBAY4Vh1dnAWP0TQSE6qXY2z6p4t6S34m
 eHJvtUf6HNro2+vYHF+RHupka1YB3hsUNXQRk9eka2Yn2mQbi+QGZyjvTWv+RaadpQP9
 //YClP1Lelx76oCJ+q5ozdFHF0PsBSsN2Y9LGyhrFbjfRRHFeZUKxrAlANWqGX+u9K/D
 0+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YUgoT+b6fWGQnaxpAgaCymNUj0JMoRjdbdEo3IB0Hrw=;
 b=QrVCME/+YxkkotARIM4WJ7A04RDnJXF1WtRtuPeN0V8qvT7IKydF8stu+XlgOnbfwg
 0R2dA4Keul4g7D9Pf19RPH/UMVLLp1AolRMZuQY3JqYU3cojxXrypIaTiwRQI3u2muAq
 6rix1gcHnD1IxJ4uES/WrVy54q2A/gzbJOdNIOmrRxbGZjMRtyl+WjmILTk3ls1yrfxv
 5P+O4/UjEqzDdrxBbSnutUW1Lh/8vwHJOeH6/T0YhJCiVMgklXGi34042VKXQm2vzNH/
 j6L6fVq1q50c77E50reaE5E8w+JStQQOkaB3MD98GclnseZeSpT6jg4lpY+DmVNMwv9M
 M1ug==
X-Gm-Message-State: ACrzQf1uKbxbQMTJ9vxZVXplLLSls2UGqNGaRD+9//0/59OHxgSfdcX0
 2UmjrIVJfhZf+eXQ7PzaVSUqcwXxH6iiCg==
X-Google-Smtp-Source: AMsMyM5TpbzgT98bO0zlNNSPUIGpouyd2A2kHZEFdwdzPE3/ZnOQojwkNJOqXqjLoKFl440E14l6jQ==
X-Received: by 2002:a37:38d:0:b0:6cd:fd39:10e5 with SMTP id
 135-20020a37038d000000b006cdfd3910e5mr9535242qkd.784.1664641430025; 
 Sat, 01 Oct 2022 09:23:50 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/42] target/arm: Reorg regime_translation_disabled
Date: Sat,  1 Oct 2022 09:22:47 -0700
Message-Id: <20221001162318.153420-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

Use a switch on mmu_idx for the a-profile indexes, instead of
three different if's vs regime_el and arm_mmu_idx_is_stage1_of_2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9be11f1673..2875ea881c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -148,21 +148,39 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
         /* HCR.DC means HCR.VM behaves as 1 */
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
-    }
 
-    if (hcr_el2 & HCR_TGE) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && (hcr_el2 & HCR_TGE)) {
             return true;
         }
-    }
+        break;
 
-    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
-        return true;
+        if (hcr_el2 & HCR_DC) {
+            return true;
+        }
+        break;
+
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E3:
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-- 
2.34.1


