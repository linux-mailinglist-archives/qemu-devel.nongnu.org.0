Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793FC264B97
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 19:40:37 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGQYm-0005hE-HM
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 13:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXK-0003sQ-30
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 13:39:06 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXF-0002n6-I2
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 13:39:03 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so7747361wrm.2
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i49sizGEle/CNz6YFf1v31poCZrNDqt3TFM4SRbr1hY=;
 b=m5XCi3xktI1lbciVwwIMQ3C5EuSLHL0BdPRREVkJ26S/Dzyyue43y0Fc2ejWDl8sL2
 j+k+vdGoX3L7JIKskPNMe3BO0XWjSQHZ747LDhxcbiHgW749pDyvbq4UKmZ/tM3FXTwm
 /ArzOSJkR6HsDdqNxiCFxI9WpjYRumz26E/PfAvgdO6z58Tbr8r6derrFl8HbV2+I6tW
 70UsMlOdhzdUADR+p0f3nvsW2xZF0Ut8xDh1F6kgFusXGpoRz24j2XUn3rx6sEg9zWh0
 iyuyuG0awXQOQxJCasYr5VWefdPGrMB3frnaEukCAKkvTLGqojK/JZRvayjd3SRNGZWg
 t7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i49sizGEle/CNz6YFf1v31poCZrNDqt3TFM4SRbr1hY=;
 b=mD8++UVSWt2Qr1kpGs1OZeIZfwD/i0H0tWDMaeuhdX5u+lPd5uRhYsIqUqD/Ivuvn7
 3DCLlMWam+rMzEAfOwfqtvjOoZ4gkIvnZN+gx2kAdmJBoso/07/U7OOBqkgp5M+LPnTs
 J7nyY7mloohXLOF4JL0Je1GhjgD9gf18vgTjMglrYTELrMuVHds+hugghaQwELDMwH1J
 5boprMkq2JL79Lb2MiKnp7cP4ruHDT4BH3tds7KZqVWK4QZLLKBPqUlVRkwJVeR0K++z
 3bIdX9aXu6HAfJ9WX0XnPqBLXPNDa0b7U01cNU8jOIYjuLYwvuYCOEC0mypSlJ0MhPIZ
 Yy1g==
X-Gm-Message-State: AOAM530FkzEAtYpQdvYvM7c1fAotHbka79SAJsIgmPqZ0kDUXKVzMjJk
 PJ8g9fHjjh0/PokPGCAJnPbuqw==
X-Google-Smtp-Source: ABdhPJxrxk5sVc0uRrmKbTM/GJbxWqLrVIuZSA4WoxpxcvtQ7K2xn79H1SJTZMpUI+legGqW4ZrkdA==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr10297440wru.341.1599759539645; 
 Thu, 10 Sep 2020 10:38:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q186sm4603128wma.45.2020.09.10.10.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:38:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] handle M-profile in fp16_arith isar_feature test
Date: Thu, 10 Sep 2020 18:38:50 +0100
Message-Id: <20200910173855.4068-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Awkwardly, M-profile uses a different ID register field from
A-profile to indicate presence of 16-bit floating point arithmetic.
This patchset corrects the feature test function. In order to
use the correct test, we need to be able to ask "is this M-profile?"
in the isar_feature function, and we don't have the 'env' pointer
there so we can't use the existing ARM_FEATURE_M feature bit check.

So we have to test the ID_PFR1 MProgMode field, but to do that we
need to give Cortex-M0 (a 'baseline' M-profile CPU which doesn't have
guest-visible ID registers) some ID register values which correspond
to what it implements, but hide those values from the guest. We
also need to do the usual move of id_pfr* into ARMISARegisters.

Patch 1 is unrelated: it's just a simple removal of an ARM_FEATURE
bit that was easy to convert to an isar feature field check because
we only test the condition in two places.

This series leaves us with two different ways to check for "is this
M-profile?" -- the old ARM_FEATURE_M bit, and also the new
isar_feature_aa32_mprofile() test.  We could in theory convert the
users of ARM_FEATURE_M, but I haven't, because there are a lot of
callsites, and it can't be done automatically:

 * arm_feature() takes the CPUARMState* whereas cpu_isar_feature()
   takes the ARMCPU*, so each callsite needs manual attention to
   identify whether it already has a 'cpu' local variable and
   add one if it doesn't
 * awkwardly, the KVM-on-AArch64-only host case does not zero
   out these ID register fields (see the comment in kvm64.c
   kvm_arm_get_host_cpu_features()), so calling the
   isar_feature function is only valid if we already know that
   this CPU is AArch32 -- this would need manually checking
   at all callsites. (Unless we wanted to change our minds about
   leaving UNKNOWN values in the ID register fields.)

thanks
-- PMM

Peter Maydell (5):
  target/arm: Replace ARM_FEATURE_PXN with ID_MMFR0.VMSA check
  target/arm: Move id_pfr0, id_pfr1 into ARMISARegisters
  hw/intc/armv7m_nvic: Only show ID register values for Main Extension
    CPUs
  target/arm: Add ID register values for Cortex-M0
  target/arm: Make isar_feature_aa32_fp16_arith() handle M-profile

 target/arm/cpu.h      | 50 ++++++++++++++++++++++++++++++------
 hw/intc/armv7m_nvic.c | 46 +++++++++++++++++++++++++++++++--
 target/arm/cpu.c      | 21 ++++++++-------
 target/arm/cpu64.c    | 12 ++++-----
 target/arm/cpu_tcg.c  | 60 ++++++++++++++++++++++++++++++-------------
 target/arm/helper.c   |  9 ++++---
 target/arm/kvm64.c    |  4 +++
 7 files changed, 153 insertions(+), 49 deletions(-)

-- 
2.20.1


