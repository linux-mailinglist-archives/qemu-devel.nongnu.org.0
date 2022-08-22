Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE659C4BD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:12:28 +0200 (CEST)
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAyR-00010R-35
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Le-0008Go-6u
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LR-0000oF-PJ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso11650170pjr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PKVm0lHT4WCbN6cjWU3f5Rl68TusjrY3hk9BnIKlewk=;
 b=kS1sHI1jh2LEgjdd1mGf8UbiFwKTmdlKzL4dKbF+ka0oCTo/hoSpNOM0MQCzOAbYLi
 09QYUEDVR9inf7d3dmv6yLXBwXPFr5OTzSiPdPc/I3PnUG4QxY67NWDtVp6tBJrr5aIJ
 DbGKfEoYlZ9lSCRos81r0gbBg9ym4nr+RmNBasI2jZMzpBcRddx07mHHmj7N52jAP4AU
 lZB0uTTNkWZgeUsgea9lV6fcgALwIhZmrUj7W37SmTqVq2qBB2KXrtDboOZgmIzr4br4
 H0hdvR6UnlCAEmLijPQQ+L6z7bK/aEvwnwGh6UbC15JVv78FL0FcKQRN+mx7v9o2JGfm
 jKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PKVm0lHT4WCbN6cjWU3f5Rl68TusjrY3hk9BnIKlewk=;
 b=DKby5J6hI+KGJwmLdiZY4YehgVnNSQJ1orJdFExEQ4oVKKxx/kC5O+tp2WRXJcuAOn
 /gkrZR4Oe4wfnAAVcReTLdf7sJ/0UG+oybqKngRORgWpAX76WoGYc2i2UwZR1w+v6uiB
 AeYbBUAwDWPFd+fSPyFn5ZfP9c6/bPCt4+ajuJzosD0UdYZ4liXzkjVyvDeixtX1jo2H
 upbXmgTmQejxVszCaC2x7c5vYx8HNRdwqAqiwRobgHH+I44MYUrC+kOf+Ztzqx7pM5hN
 2mcrK5cGgxXwLghrfMwTuAvLniXf9Li/BrAr1PKLo7mu4o9wTpDWuLl5CUxUVC3yxJcI
 zX4Q==
X-Gm-Message-State: ACgBeo29gLLFapco7PZesNefPxKr4MgCX/+14nAS6cVNEUczywq8wx92
 yvkZlcHWC1z9tcytIXWJB8urJgi7NUCVkw==
X-Google-Smtp-Source: AA6agR5TKmu86TeCXrOrcfw8y6WMdjEBuWtfhJylxbCwi5r9DbryQTK1ePUSV4qXoilSmm/zNRVW6w==
X-Received: by 2002:a17:90b:1c90:b0:1f8:42dd:9eba with SMTP id
 oo16-20020a17090b1c9000b001f842dd9ebamr30141374pjb.160.1661182084283; 
 Mon, 22 Aug 2022 08:28:04 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 27/66] target/arm: Reorg regime_translation_disabled
Date: Mon, 22 Aug 2022 08:27:02 -0700
Message-Id: <20220822152741.1617527-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 2c13586396..ae9552f46f 100644
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


