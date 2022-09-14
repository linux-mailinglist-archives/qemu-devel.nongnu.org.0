Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958AC5B88B3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRwS-00005E-Nr
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwb-0000Vm-Lv
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-00005w-8x
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay36so1814317wmb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=B1HwVRetoBVY21lBSjEDvodWTQyZBfluPojpmU/kW4s=;
 b=vNOaAo0YZIV1C0eoznlMnJ6Y0fpoGoOeZhTF/fYvMs30beOJhl/I0NRIoyFsvCbxaY
 qDa+Pu5FTiS+rWUqTuznGveb1UprQyvxJK1+y8aAWmOUTYsfrT4akZbRzzexY+0sJUVA
 NTSr62C2tvdv4swX6nUTQfPDjd8cV9cpnsdz71phqXVCEf6lE/w2BZYisCSqYqYOTGbO
 obrcXzBl/8Jv9uassNNaR2HxqmH3UPvHEX83RFIQJ6qnYzUdUR9Nr9KBYA6gK2KXbHPB
 zCoROHGPUC8ViigtgAxbvZwse6T1v1raLv739QjtW6/tE7YwbuB/zMXd3YOs5OAkjYOQ
 izDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B1HwVRetoBVY21lBSjEDvodWTQyZBfluPojpmU/kW4s=;
 b=GwFtc0NUflixfsokHnXty1kx55LxafM02+3b2xkCvocWQ9R48+JEGHY2FI9RfJ81y/
 A0Fe/MAlfNxyikg4kMx7R31m8as4eNb+t9+B/EAwaSS6oiQ9hAQOUlieJRM1MxVc7kTF
 /rN/n02tSRs5lWjUQ2uBoi4l5hEc2YLzxwV9lff/9YyoJOrUAvDTfc+l4qrVLpld7tis
 wNVydvYPMkQQtgkFdOF2q0f4AACpWhebrLqSWpSizKDM2mA/C4RVVxe5Cu6Ug/vH8NaN
 zC0arUmN0kzcXMt1GzZCrJLQJK23rp6LQxmq0yRVZY/+dxRmjcuBYo2QtE215qtDaWD6
 8KIA==
X-Gm-Message-State: ACgBeo1S6c64X+9S02oiyNf87fz724NP1q8f9xSOGpgPEq21LIpTbbnE
 IWTq3Kp1nhPllfHFSZOndIa8oZNdW55/lgag
X-Google-Smtp-Source: AA6agR5RXGwHzKsQ01HwBgwG2M2K6OjQ6h4TcOpSbVhyNQp4+pLq5XaszCyrlbC/5T36sfM5r6eLtw==
X-Received: by 2002:a05:600c:4f8d:b0:3b4:9f2f:4311 with SMTP id
 n13-20020a05600c4f8d00b003b49f2f4311mr2240460wmq.17.1663156351830; 
 Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/20] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Date: Wed, 14 Sep 2022 12:52:10 +0100
Message-Id: <20220914115217.117532-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

The logic in pmu_counter_enabled() for handling the 'prohibit event
counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
that assumes that EL2 is never Secure.  This used to be true, but the
architecture now permits Secure EL2, and QEMU can emulate this.

Refactor the prohibit logic so that we effectively OR together
the various prohibit bits when they apply, rather than trying to
construct an if-else ladder where any particular state of the CPU
ends up in exactly one branch of the ladder.

This fixes the Secure EL2 case and also is a better structure for
adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-6-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1b20de16d..b792694df0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     uint64_t filter;
     bool e, p, u, nsk, nsu, nsh, m;
-    bool enabled, prohibited, filtered;
+    bool enabled, prohibited = false, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
     uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
@@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
-    if (!secure) {
-        if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = mdcr_el2 & MDCR_HPMD;
-        } else {
-            prohibited = false;
-        }
-    } else {
-        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
-           !(env->cp15.mdcr_el3 & MDCR_SPME);
+    /* Is event counting prohibited? */
+    if (el == 2 && (counter < hpmn || counter == 31)) {
+        prohibited = mdcr_el2 & MDCR_HPMD;
+    }
+    if (secure) {
+        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
     if (prohibited && counter == 31) {
-- 
2.34.1


