Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4460D1F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:50:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyY-0005pO-D1; Tue, 25 Oct 2022 12:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyN-0005St-3v
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMy7-0001OZ-SL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so8664441wmq.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BkdsxeivDrs8B1ekF6DlyQ39i4YB9EYQepwnyoXzyuw=;
 b=jCUxJwlBRj9DLNOLPVPQlLd6FPKz0e6uAZo8ZfHPiZlu6YcDigTC3dDQM1xxo3KNys
 z3xd/74gxow04mgfxkX47vtuHJEPDynMgikw/adB4bDCbdnUaYMkuQhpvp8WOBRTpE9A
 aooA2jF7ugTZMRfUdQlHXlkGyzbVs0LZmAxfpz8ougRwLE8+zA8l1g89MOT3gIkOJf0H
 PMH0hSO6zM6H6Jhb4IZiTQeZo5pNvPuAcURF+c63RxrTSMFcaamvksHrMuVsStjK41yr
 N/aN+V5YDJX2ljqOS6UAubvrh7fKQVGblo1h7oLailDfUdmHfImJPRkKjAM5acDX4Zzi
 Yx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkdsxeivDrs8B1ekF6DlyQ39i4YB9EYQepwnyoXzyuw=;
 b=huWbHxS8+bDSE7TUETQKww6vs0Q50RGtizeqV5rWZ7UWpCMcW0NGe1F0LVishNe+vg
 t7RI4uoV4bPxE1Zn2+LOj8rD4BgMZsiZ02IGYgBSfD9mCVkz1tXpqolRXcG5k/CtNB+k
 akcXVfZs38tr+Y7bKeoFEu8vNWckBw55GV4o7GVl1oAw4vnQ2+qm3r2ReILAN+tFwoeP
 QMoYNIBpKoIXmAD2agWROtVtJVl5NxGy/bL4ardPEIoI2DV8lobWz0CLhloUdUDC9xAJ
 Za5cP4KH8k1H6PcK0YUgQruT0ZesjNoMeiHwmjPEiMCfesvCS4NU/5yvwepCky167itp
 Qe8g==
X-Gm-Message-State: ACrzQf0acCfINJF787hv00erxkZKSEWdhweHusjmur1XSZGdY8BX2Xp/
 /OEKsYv5Oy8y8wNcnetKGGk3uSStXpc/aA==
X-Google-Smtp-Source: AMsMyM7eAYm3e3pcxvJD0PLhOq6Fe5brlGpUoVqJAdCHiQhUCeemwnDnrVouYZMQHHcwL6CopkrVZA==
X-Received: by 2002:a05:600c:3509:b0:3c6:fd36:ef19 with SMTP id
 h9-20020a05600c350900b003c6fd36ef19mr27261282wmq.191.1666715998429; 
 Tue, 25 Oct 2022 09:39:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] target/arm: honor HCR_E2H and HCR_TGE in
 arm_excp_unmasked()
Date: Tue, 25 Oct 2022 17:39:25 +0100
Message-Id: <20221025163952.4131046-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ake Koomsin <ake@igel.co.jp>

An exception targeting EL2 from lower EL is actually maskable when
HCR_E2H and HCR_TGE are both set. This applies to both secure and
non-secure Security state.

We can remove the conditions that try to suppress masking of
interrupts when we are Secure and the exception targets EL2 and
Secure EL2 is disabled.  This is OK because in that situation
arm_phys_excp_target_el() will never return 2 as the target EL.  The
'not if secure' check in this function was originally written before
arm_hcr_el2_eff(), and back then the target EL returned by
arm_phys_excp_target_el() could be 2 even if we were in Secure
EL0/EL1; but it is no longer needed.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
Message-id: 20221017092432.546881-1-ake@igel.co.jp
[PMM: Add commit message paragraph explaining why it's OK to
 remove the checks on secure and SCR_EEL2]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bc5e9b125b..8aa8a1419df 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -562,14 +562,24 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     if ((target_el > cur_el) && (target_el != 1)) {
         /* Exceptions targeting a higher EL may not be maskable */
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            /*
-             * 64-bit masking rules are simple: exceptions to EL3
-             * can't be masked, and exceptions to EL2 can only be
-             * masked from Secure state. The HCR and SCR settings
-             * don't affect the masking logic, only the interrupt routing.
-             */
-            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
+            switch (target_el) {
+            case 2:
+                /*
+                 * According to ARM DDI 0487H.a, an interrupt can be masked
+                 * when HCR_E2H and HCR_TGE are both set regardless of the
+                 * current Security state. Note that we need to revisit this
+                 * part again once we need to support NMI.
+                 */
+                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+                        unmasked = true;
+                }
+                break;
+            case 3:
+                /* Interrupt cannot be masked when the target EL is 3 */
                 unmasked = true;
+                break;
+            default:
+                g_assert_not_reached();
             }
         } else {
             /*
-- 
2.25.1


