Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E445447DB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:41:55 +0200 (CEST)
Received: from localhost ([::1]:55248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEfq-0007VX-GO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6y-0001QL-2U
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6w-0005zr-0x
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so21096176wra.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9eBXb6ngArhkEwA5Ae/7R9RnXAQ3z1Rjo8kM5NbQegY=;
 b=H9lQwEXwCP30cwktaIsUzRorw2Il2qxYXPUFGwblgwdk3dj+PSElrU8nCdlgKx23u+
 Os9SQ7N5bDfzMldoJvFeSQBg8MolOg/Ny6pbCado5/9+X1D/TZbSUJMgn9KmtKJbX1x7
 w0L6itWjyf2Ghwy+ATluvPas7KgpvVaKFMevEQlIy5CCjq1IaMrAMSNMyedMOhn1GpgF
 35Lx72No5uoKGCiPAN0Rw29lIThS199FbGL6G4TydYLB/SLy3B8UCQr/dt14MuFPcUN6
 eSmErW4O1AdNN67B3yzn8GOtp4+JVx76pYXSJEw3ve90HA66t/mcSelm0swX6nDZuTCc
 6N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9eBXb6ngArhkEwA5Ae/7R9RnXAQ3z1Rjo8kM5NbQegY=;
 b=lLWtyfs0/7cOAbBgbdhk6vqYJf2X7bT25pbMXrJju01c8kjQjIa7tUMSzSKOC1kEFx
 2rQuNLlm2sGVJBNqDDFS/+Bw1dBiMfOg6kZVv1eF/wLQv5Z1+NTOQ2OarBk/0lpT7FJO
 Z0z+RKIphAo4jbk6GC9AlnOv4Hoqn1E/OA24sH6jAGxvzmxTt69vZYdP0Ewh+fgkfv4E
 f82rnbKWGGF4yhLFlJLZzACg6Zw20d5oLIW5CR2bXTp7rRS812Ziqs81Hd2Whdt8DlXc
 OAIm0cSkyrG2Dig/K545huveAtdwidm32jm4hucAxjyOe+8SzyKwC8C6PVH1X+Q3sgZi
 O++A==
X-Gm-Message-State: AOAM531sCOoYeMFfvJTHGYJmHv1O0xe6KK0z6SRpHnak4WpUXrueqm/t
 4k4T52Ndf3Q7Tg/6uVLKBgdhbC1ObXuKvw==
X-Google-Smtp-Source: ABdhPJxAJ2TB2MyEP0/j4Xhs2VUZUZV0P1Sf4zQTsc0yJ2RsoDNUdfPmQcnLpqgMjXK2vOTWjJYUew==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr30971956wrw.486.1654765548590; 
 Thu, 09 Jun 2022 02:05:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/55] target/arm: Move stage_1_mmu_idx decl to internals.h
Date: Thu,  9 Jun 2022 10:04:50 +0100
Message-Id: <20220609090537.1971756-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Move the decl from ptw.h to internals.h.  Provide an inline
version for user-only, just as we do for arm_stage1_mmu_idx.
Move an endif down to make the definition in helper.c be
system only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 5 +++++
 target/arm/helper.c    | 5 ++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1e4887b2dd3..049edce946c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -979,11 +979,16 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
  * Return the ARMMMUIdx for the stage1 traversal for the current regime.
  */
 #ifdef CONFIG_USER_ONLY
+static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    return ARMMMUIdx_Stage1_E0;
+}
 static inline ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
     return ARMMMUIdx_Stage1_E0;
 }
 #else
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx);
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env);
 #endif
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5727ead5e4c..829b660db92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10517,12 +10517,10 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
@@ -10541,6 +10539,7 @@ static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
         return mmu_idx;
     }
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /* Return true if the translation regime is using LPAE format page tables */
 static inline bool regime_using_lpae_format(CPUARMState *env,
-- 
2.25.1


