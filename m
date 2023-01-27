Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6267ECD7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx5-00010M-A9; Fri, 27 Jan 2023 12:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwv-0000tR-Hy
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:42 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00060m-Ov
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so5665464wrv.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ocuh6zX/sB0nMJnNqY88PpTxJzWwkZIqSEj3aMaaCrM=;
 b=LGQraPldm78FfexAlnXi2RslvySLR7QJsSFhNXWxHyTZ4R+Hk133c0TSd07pCbexuz
 mBLGDOeiC2L6DZ2PguzmHCvE7oyKgc52YylRnNDNELdX/VXuY1P10z2ck8c/l7YD9RlN
 U40BLHILx/QB2TKXXh7+vSWHdk0mxSlJwes7v83s5RMst18YukLxsSoyf3yZTWacp/bZ
 A5y+C0bLKm3nsrzcKlu5xDTvaOo9+Ta1a8Bse5m2EwfW71z7dIvTvPnLZLIKzwTJdI70
 LoFKSOjUoNpXNgnhzZXM/yP195BKNcG9d5Tb77SE8QFBXOXPeLLBypxCB4uT6Fvnipdn
 sjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocuh6zX/sB0nMJnNqY88PpTxJzWwkZIqSEj3aMaaCrM=;
 b=JbBfAVzbPci4Xck1D2SWXao484jNcsgNCoVKxMKwyoUG8oKSY2mQYcRpGh9/Jfxp0j
 feFPVG6Bq6cG/bzKOUzyfIN1/Dq3DVnc4DhCXv6EMdVoc9DkGh/pPM9emI1qLA1Sc5rq
 hS4ML/h03wYsHvWMX3MWqJkzBjv/phHf/0daCeCehkuyg4tmzOOg44Ga1JU3EeZrJjzu
 bOxW2zXBPu1aq7N0f89vDTc9Liuz1kujIMHjY5ewoSHn7GIypnMTB+Mzg7zc2AnpqB5e
 w+BCVtQSF8ZgEpEK3NmZiMHP/48pjdybjiwwTNZHeSO6dd201etCmJZAOeT1Rx8G0OCV
 nYvA==
X-Gm-Message-State: AO0yUKX7vxsMhn+umBf5cnnBHS7RMmyvnvVd+CC15rkaqJdyqzJBUQr/
 NzXPFi2Gi+l27FNbjC7o++yEoQ==
X-Google-Smtp-Source: AK7set8fr5clC2UeFIcskAFrV6rK2ZjwJ30/48OQcixQ4357yZBsCC6W950dn/MqhHsMFdHG3NYrQQ==
X-Received: by 2002:a5d:5406:0:b0:2bf:d89b:7e17 with SMTP id
 g6-20020a5d5406000000b002bfd89b7e17mr594309wrv.51.1674842117701; 
 Fri, 27 Jan 2023 09:55:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/23] target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
Date: Fri, 27 Jan 2023 17:54:51 +0000
Message-Id: <20230127175507.2895013-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 8ac176e0742..5c17a5bd176 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -670,6 +670,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * we only need to check here for traps from EL0.
      */
     if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
+        arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
-- 
2.34.1


