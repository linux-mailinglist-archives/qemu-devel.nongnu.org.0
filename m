Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4419564614
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:05:55 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vYA-00089y-TA
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvj-00016K-5Y
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvh-0006Gc-JT
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id x4so6360712pfq.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RaZZc14+S6hYz1OWvaDxJGxtM/J8YX/Y05Pry77JbE=;
 b=F2wMatOZDFdCuj5e7iz8uCWWLVb7MO27GNZMQeTu9MRtW0MbdNr9oYQebvyhXeTR8U
 ubxey3BwjLRPqoVNx/7OkfIfW5LHV/0K2WdvbCAh2GqGYz5rpW8rQO8d46kFa8Xk6iLz
 IKrYPUcGCy6H9Ewe7OAWHXKSU0c+ej+GDZFqolD/Ix/4rhpLkeo6xDIUZEfjdo2ujl5n
 MbbtZ+9gQagRgrooBBQOT39BQFRQN6eLpVLhIiEoRIRF9JB6D7vOIFMavo0x//xZ8R16
 1PGkBGzkdU8k3BsP0fzv2ChNtaWnQjzMZkMKL3n13K+/BmjvUYPMEa+iWU/DK0rpT7Wm
 MKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RaZZc14+S6hYz1OWvaDxJGxtM/J8YX/Y05Pry77JbE=;
 b=cYV0FyTaWRDYA0guavJ+cXhns/yD43FbpI3IbGS6VpSc/2w4u+Q6IvLWFqZuUw8q+9
 Qkpyuq67Y8MASCdhhF/XQZh6oAjtMEjGJEKaqyt/mWBPEu9+vdfwhNsJJyLLtgFFpDW8
 dvVLpR+ik7GeRuPgYzgBq8nE+9EweU8ZVaLZ1ve2/2hlg/3tTZEJt12JhBxik/aFgKpn
 0adw3B9z8XomioPnxHb691h4OXgkUZtMs+RFy7Ae21yAPwXJm/KOOranfrT6ncWNTG8R
 LIb+uSJmp7XaX8MFyf8PnIx9v7Vpfh+D2z5OXRpSlPgtK/qJY1KmN21jj7SSIhgEquyV
 8lhQ==
X-Gm-Message-State: AJIora+Gx03bh/Y4ogsmTmrvawjpdulz2WkTGEh5HUnCZQCl+Z3aA2ED
 avaOl1dDa+MbVWMI2DnRfHKoYbK0vBVXpcYy
X-Google-Smtp-Source: AGRyM1usX8i55aao8j1oRxILQRo3oTdCUeCKrxhpn8GLAiRk5PDn3iXTaUPG6FGPa7hEKtb4AQaClw==
X-Received: by 2002:a63:e705:0:b0:3fd:fb59:bd7f with SMTP id
 b5-20020a63e705000000b003fdfb59bd7fmr19055667pgi.505.1656836768422; 
 Sun, 03 Jul 2022 01:26:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/62] target/arm: Reorg regime_translation_disabled
Date: Sun,  3 Jul 2022 13:53:51 +0530
Message-Id: <20220703082419.770989-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Use a switch on mmu_idx for the a-profile indexes, instead of
three different if's vs regime_el and arm_mmu_idx_is_stage1_of_2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1fb4d44600..8b80716e38 100644
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


