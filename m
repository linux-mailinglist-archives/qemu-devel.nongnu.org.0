Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102D5705C4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:37:58 +0200 (CEST)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuXt-0005bP-DE
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvi-0006h6-Hp
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0002kD-56
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v14so7135985wra.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HEJdzVygGY0s6uguuLvn1wUd1JpqYr/BZXBoM1CiCf4=;
 b=d1KW+XGJCSbxzHD6ARnb2fXE0hJnIsFh4TZBWaPuGef+vJTtFbqpPO0KgWMlNdGDS/
 ffRQEu5JQjj8O+Xaddel2jf/p5bZRQCUfIyWUXlsSWnC3Q/ZzMApMeoPW11yWk+33inO
 dmAoU3Ys714bmLiRZLuxBbwT4c9n4nL8JvfVy9BxPEeB/oAzpxNGsbc7QRb8yHfFBtas
 qVFkATwTHr+HfPm+b2Gm/Ao+gtZblpbMecMThgCNpn/XIkDSCC/TfciWzGY3kyUKCJb1
 WBXz8NGm6iuWTTObvH5Q2tFZkCo3Ploo3fQNAYeouegWSDK5uB0/MEzEiixIepS0z6/b
 SG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEJdzVygGY0s6uguuLvn1wUd1JpqYr/BZXBoM1CiCf4=;
 b=peiWbs8w9V2aL1UwOHiaIaUlXTsVVcnXhNsS/LdFLXCssQcruPq0iXDX5jI9BiPqC9
 Onmul3cBPFv4RxTPbH9/cAB6oI0PV7tkpAE/vFSWdVDVRTDT9VmRTe+yMnOcJR7v/sGE
 +r0MTOHt9yObh2fl/VEB271odPoXD7Lb/eDMhvv6BjWf/vnXTxOM05RAhl5gCty36J5b
 HCDAx9bgUngdR34jnmGODM/HBCk+zs3cJUZ4iyoVJUGsgxOU0css+gh/dHYXToIxfg3y
 HqOCdusS3UsHnOpr8cJ50tYa+SroIWi4fVyRFQjR7YqjjciZKiN0NuMYDW1CIDz9I1GI
 wD7g==
X-Gm-Message-State: AJIora/eWsKwCN4JkGql9F2hNouVK5mgU37fiuAdU3UGf2HRlWoK9Xhl
 0pmGCh8zR71V7Li5ZXOrpZKRj663G5vqyg==
X-Google-Smtp-Source: AGRyM1ulgtih+V+8sDMhHXnc8BfceDJsCByzRxI3TLBOlfj4ylkWfbo7gNQSUM09+oGFNPvym40S+Q==
X-Received: by 2002:a05:6000:1ac8:b0:21b:9236:6207 with SMTP id
 i8-20020a0560001ac800b0021b92366207mr16684793wry.123.1657547898694; 
 Mon, 11 Jul 2022 06:58:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Mon, 11 Jul 2022 14:57:36 +0100
Message-Id: <20220711135750.765803-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-32-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 73a5b2b86d9..cfcad97ce07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11242,6 +11242,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11254,10 +11267,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.25.1


