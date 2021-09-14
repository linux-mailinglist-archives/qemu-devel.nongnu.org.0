Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4C40AD11
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:10:37 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Gm-00039X-B8
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dw-0000xb-On
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dq-0001Mf-OT
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id x6so19780157wrv.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5NG/bEPeZZZYUBGom19uHW6+Md+Pky64ng33saUOhoU=;
 b=dhySKRbMRNhJ0qrcxbAxG47zc/KOarmhCYoAymZst9Z7Nv5g1qrjJe2BpFHm+o25SV
 LWulp4kUXUaTpy5fn5AI4uZ/WpyZJnt93wfbicR0uj8yuf83A/3IHsyQ0aBiP/h22RiF
 TCP9kSEL8PHAl3iSRoB0qbUhYYLSPTGV0OLQSxO1wfMUELO5PNwXmpWi3XNVlSatHqgu
 HfQrNknJyZ81nfxVR1PeGyZu9d91+du3JYRJ9j0CYdIX5FeiI5pPuCEPAFa9MeDrcSIq
 zabijm+CFcPWqgAOc2wwc/OWkclXD6Hy8OAkrMmKfocYHPeGCgROP5eNSgcR0+mdVvnD
 P9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5NG/bEPeZZZYUBGom19uHW6+Md+Pky64ng33saUOhoU=;
 b=vWSes2Z8xurc+rI1rDn0s8qybEOLoQyIJdfUympYrXVpKou2h7Rj4MAaJvSMPjatUt
 E7MxPTU9J7dcjke9DVNLerrxlOnTFHq2mEoXMNCS6Nqs1tzuJLwVRj5cg06kK/8v0/ed
 j0NC9GLkl18fytWCqSWJBXX4nTzznvy+1AgWzW6pEuq6rNgqy3lGIhb/YTnKSiNLGd2K
 bBMhZPd5gVe5UYLgPuNgM6EIbWddLYXnxsTg8IM9ZYUqffZlysZaX/3G2zfzJ3RufX3v
 xpWn4fWkBjHHxW1wewyZk8zM9w/r6T7cHHnleadFfVGtdBz+6TK4BIeunCR4KKwV9ydE
 kZ2Q==
X-Gm-Message-State: AOAM5316rM+CLGQOT9rLEeMS/OA0GIQujBHBiUKTmlRODB00GrMVwBPT
 tjhW0KSp2wzzO1A0fOOjqaLceA==
X-Google-Smtp-Source: ABdhPJz0d8ImB3eSRQ17Zp8TOwzzJ63A4EG+kobVPSl7LbnNnKN3Oee9oJ8BOG92Kmf2h0oZMmLhoQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr18403041wrj.211.1631621253418; 
 Tue, 14 Sep 2021 05:07:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Consolidate ifdef blocks in reset
Date: Tue, 14 Sep 2021 13:07:25 +0100
Message-Id: <20210914120725.24992-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
References: <20210914120725.24992-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move an ifndef CONFIG_USER_ONLY code block up in arm_cpu_reset() so
it can be merged with another earlier one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7b1665a1d0c..4df640b9974 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -265,6 +265,16 @@ static void arm_cpu_reset(DeviceState *dev)
         env->uncached_cpsr = ARM_CPU_MODE_SVC;
     }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
+
+    /* AArch32 has a hard highvec setting of 0xFFFF0000.  If we are currently
+     * executing as AArch32 then check if highvecs are enabled and
+     * adjust the PC accordingly.
+     */
+    if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
+        env->regs[15] = 0xFFFF0000;
+    }
+
+    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
 #endif
 
     if (arm_feature(env, ARM_FEATURE_M)) {
@@ -372,18 +382,6 @@ static void arm_cpu_reset(DeviceState *dev)
 #endif
     }
 
-#ifndef CONFIG_USER_ONLY
-    /* AArch32 has a hard highvec setting of 0xFFFF0000.  If we are currently
-     * executing as AArch32 then check if highvecs are enabled and
-     * adjust the PC accordingly.
-     */
-    if (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_V) {
-        env->regs[15] = 0xFFFF0000;
-    }
-
-    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
-#endif
-
     /* M profile requires that reset clears the exclusive monitor;
      * A profile does not, but clearing it makes more sense than having it
      * set with an exclusive access on address zero.
-- 
2.20.1


