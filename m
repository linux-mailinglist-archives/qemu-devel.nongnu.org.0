Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A715F5B88D3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:04:45 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYS4K-0008F9-P8
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwX-0000LU-F8
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwN-0008W1-19
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c11so25276710wrp.11
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=h9ZauDvhYC+UMjtzBWpIn4fG6ZYO05uBWk2mMwFy1oY=;
 b=BXCy2/86QLoa33qncQwcd8ZzLAhI1HrYXmTTtxzI34UgR5/DLuiWwka4vddfhUtHvV
 t2I3Pjuyo29Di/rCBGMox2U/PWyzrbo3zBRxDFmfwsxIUbPHog1U4g5eNPhEHFFPV+gh
 4UytAOdE3bTpGA5iZ/8pogyKAoO1l01lOSNoRxcu/hxLlWnYwnmpQXF2HTkDWxXSs/Ak
 2prnz4cJvjegBP3ZZ7LHmDJaemvEU2YxuUGi5goGitWqAq4Z1a1NkerG50r0vXLspeNN
 xp9gnXxFe0E0V9yK3hmYN9OD2sQLjtduyM4WfUp6tAt5fiiTjLRWFx6AiydidVbj8W/i
 Re3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=h9ZauDvhYC+UMjtzBWpIn4fG6ZYO05uBWk2mMwFy1oY=;
 b=pPgXnT4L63PJFSd92+izyo1HE2R8cCJyij+8sBQrNrLbUZVoSSgBRLtW0EHoEhqG3K
 Ixm8nsw2QjmarVIDeurpNTUsPNk7Po7hvqMsp1WhmV1P2eVXZ9fepELQp81PhDU1HfE1
 k1PhhyMcJqaG9ZmlU9riiR9BhEP/Qjk4mlGa9BXuo9o6ahsY/3ARQyS1MWIpK2y/M9t2
 j5EgoEgu50XMz8WGzoZJ1ypwqWrQlNV3pVnBWUZuMOpCh6Yru5Stg7Veyu60uhtPNJ2W
 gxciH5o8kOf8PzzNEsAgKn7iZ2+IFomzVYPOSiE3WJWdR48mtoileqtO5KGW8mOJ0yyj
 nZlA==
X-Gm-Message-State: ACgBeo0EZVkGPLz1oz8rsBqcICr80KHu0ozrilW0QFg5UB3RAqjQicmq
 CM6sxulQq10533ASLiZr0mxX1s7vWxIsdbNJ
X-Google-Smtp-Source: AA6agR5UvsVcdpnsZ3MQkniw4BQRg8uWwpdNTtrg4eiqkgh7VJbsJeQXEWhlOdqV/VRp4l6ywaDeXA==
X-Received: by 2002:a5d:6986:0:b0:228:60f9:b013 with SMTP id
 g6-20020a5d6986000000b0022860f9b013mr20251539wru.102.1663156345669; 
 Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/20] target/arm: Advertise FEAT_ETS for '-cpu max'
Date: Wed, 14 Sep 2022 12:52:04 +0100
Message-Id: <20220914115217.117532-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The architectural feature FEAT_ETS (Enhanced Translation
Synchronization) is a set of tightened guarantees about memory
ordering involving translation table walks:

 * if memory access RW1 is ordered-before memory access RW2 then it
   is also ordered-before any translation table walk generated by RW2
   that generates a translation fault, address size fault or access
   fault

 * TLB maintenance on non-exec-permission translations is guaranteed
   complete after a DSB (ie it does not need the context
   synchronization event that you have to have if you don’t have
   FEAT_ETS)

For QEMU’s implementation we don’t reorder translation table walk
accesses, and we guarantee to finish the TLB maintenance as soon as
the TLB op is done (the tlb_flush functions will complete at the end
of the TLB, and TLB ops always end the TB because they’re sysreg
writes).

So we’re already compliant and all we need to do is say so in the ID
registers for the 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-6-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea..811358fd0a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9d1ea32057..3ac5e197a7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1122,6 +1122,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     cpu->isar.id_aa64mmfr1 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32..f63f8cdd95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -67,6 +67,10 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
     cpu->isar.id_mmfr4 = t;
 
+    t = cpu->isar.id_mmfr5;
+    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
+    cpu->isar.id_mmfr5 = t;
+
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
-- 
2.34.1


