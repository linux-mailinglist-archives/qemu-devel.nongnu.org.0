Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286454117B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:57:27 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKjW-0000q1-7n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9c-0002m2-0J
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9E-0000nK-Pn
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id w17so22053370wrv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=88G84b42GJok2EnsSzQ7YM/ll9HQz4JeN74TyzxvSDk=;
 b=UAsGnl41k3DiDMrdHKhBbMUEJMUhGAKDRtGZUy3Vfh+MW00IxobZGEWrwLd0WVk+TI
 dexLk+N7jNi63F2ro1VERSFID6BAoKYaBAuj5pnzE+Bx24Oun3la8IDpUbC7LHaO9Yyh
 CVtXR+krYYf1xkgGDw65KKVjgbj0Nxo/xbFA/UnX8xvsuYPg9AhhvPj0w/nW/as7IZ/R
 JMXaVOX7+jlivQ0vAfhJldtQv0cC7sWT9u/1n3Z5R31HTs/ZZZDFbJC6J6G9abbSVkuk
 UG/caeKswZ8T07yqj5pVqPh3cVcxZ+9KAuOHmapRcGvLvUVxX3x49E1EuA1/JY7J6fnP
 k0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88G84b42GJok2EnsSzQ7YM/ll9HQz4JeN74TyzxvSDk=;
 b=iDTratSamTF75jhl2hDF0oc2WZWssflkwYZqL1EC1OXbL0KDgNvj9HOA2JMpIq5Cg1
 Aj7KDCX243TH7+zBZZ8hdw9lfywPk6CMo8+PLdsFsRT9fZlvldPtW2/2DGhna5mYPblf
 j5M8HtMrrVOpdX0YuuqRdP+pvhpiotwyn5YK1z8wnG57F7XLiyMU/lDqtLQRlA0TLSeS
 FtFfMMyVbdy2oW790isEsPBI8xCR+bgiCTOWldX2PQtOPkIKDAxtMloKkfHrYHeD253s
 pTzl5oEZvpOP1G8T3dSoliNoUMkLYIS/iWMEpsol2hiSIwF0nyHI2W18EqGXvaBrg7++
 ITsg==
X-Gm-Message-State: AOAM530/cxPFRsZQHEgA3CcbpK8tVwmUdJ7r5rbUXiNnRA7ARFeruYdJ
 8B2pO3lLwC6FVmwneBVm/T2oifRwqB8cug==
X-Google-Smtp-Source: ABdhPJwUt3RPQQMDsXE060G/DJl1nwzJZK9J8yQs8NTEVdM1RNQAXIAPWcLWj5SXib8lws85vPNWnA==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr28825563wrq.136.1632147592840; 
 Mon, 20 Sep 2021 07:19:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/27] target/arm: Consolidate ifdef blocks in reset
Date: Mon, 20 Sep 2021 15:19:25 +0100
Message-Id: <20210920141947.5537-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move an ifndef CONFIG_USER_ONLY code block up in arm_cpu_reset() so
it can be merged with another earlier one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210914120725.24992-4-peter.maydell@linaro.org
---
 target/arm/cpu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1dff1d33473..30e2cb9224d 100644
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


