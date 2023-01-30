Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DF681917
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqM-00018g-3g; Mon, 30 Jan 2023 13:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqB-00010y-Pl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq6-0008PX-8e
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id y1so12006013wru.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dmGYMqKT6htGJ/lTyLu1tD0GGum+71lym1RaJ3XxWLg=;
 b=H1y2mzdOHOSORIQzj9iahYah96m2hGwyd6xypXMOvmgTru8xwnE5zFV8LchVpO30lA
 U/Jam26NFhMQNJQSsBrpKRfVQIXe4y7W2ImwaUXpi5b1J7o1nLw0NMsl7S/cAfe73DmX
 kA3Lc1uiSUzSwDh33nbodFqtJwl4EJGypkVXUQy/CnFWP9tu1V1/u155kp9WrOIRdMCD
 QayWnPSqsuFVrZgs+meJYwZif/f93f0HkCLHK+UE7dD9PhF/PqipXZrGMxJMAe8nKfk1
 L2zRt9+AzbHZJrqb24/nSoL+ojGP+tcz2lVrhjn4oZCgPRq99FEBOY5Dt8YWzCaJIP5O
 pGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmGYMqKT6htGJ/lTyLu1tD0GGum+71lym1RaJ3XxWLg=;
 b=EnT1/QghExnuQ7rmkNSzaVmwc/Ld+eh1uA/m3REOLhdK2iaB0vG54yyNS+OKM6Gk4M
 bCE5kqw/XGBqtIGIk6CXEsvIm0XIgn8LJG+vxHqrbEDFQMiZARk4gqXJ10nAiTRcHLzE
 3JHolTAe8u40M+PUekATmux0wg/qSxnP20+jMwg9+4qbaesHxGiJ6v7MERSIFlHQ2arF
 lvjRM4nQzce3YbT5PTRYS6aVSuBtWE6/lt4j53+a5f+F0zQ4dGKq2fd8ULpWt21hXEIz
 kKpKcq4nSShGH5nsjHPEw0Y0ILzLvdgjK3kUzejjPkY8YtBiVq4/Meh0q8CwEP3Mhkrm
 7O9A==
X-Gm-Message-State: AO0yUKV7YEKsNd8kcpNXYaJCKb0JEc2Njpi+b5I2UuELlNcJEfJ9SwLc
 p+pnmchubJt5xbM2Y8sk8xXWmEd/g9tKcZLr
X-Google-Smtp-Source: AK7set+c6hH8F7IPrNYZuDy33uks9oDtnkBFSm0fgpJoiNFSYvghKwXphhKaTjH+qgtydm3kOWEJSQ==
X-Received: by 2002:a5d:4dc1:0:b0:2bf:b2fe:a2ca with SMTP id
 f1-20020a5d4dc1000000b002bfb2fea2camr21536087wru.20.1675103108515; 
 Mon, 30 Jan 2023 10:25:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] target/arm: Disable HSTR_EL2 traps if EL2 is not
 enabled
Date: Mon, 30 Jan 2023 18:24:43 +0000
Message-Id: <20230130182459.3309057-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The HSTR_EL2 register is not supposed to have an effect unless EL2 is
enabled in the current security state.  We weren't checking for this,
which meant that if the guest set up the HSTR_EL2 register we would
incorrectly trap even for accesses from Secure EL0 and EL1.

Add the missing checks. (Other places where we look at HSTR_EL2
for the not-in-v8A bits TTEE and TJDBX are already checking that
we are in NS EL0 or EL1, so there we alredy know EL2 is enabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-8-peter.maydell@linaro.org
---
 target/arm/helper.c    | 2 +-
 target/arm/op_helper.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6f6772d8e04..66966869218 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11716,7 +11716,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
-    if (el < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 && arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7797a137af6..dec03310ad5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -663,6 +663,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * we only need to check here for traps from EL0.
      */
     if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
+        arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
-- 
2.34.1


