Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D553C0AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:17:38 +0200 (CEST)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt8K-0005Tk-U6
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgs-0004li-MB
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:15 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgf-0008VH-0f
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id z17so5795452pff.7
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=oaEB+KhtZc1zLhG/G4M45S21gRBhcnC6h1BoqWq7DFhO+a3mUG88XRWbsFwjjRcnNy
 opfJJzBqlqkirgFODo2TQyyo0Hnkbp97pvJqTOXQwEApv5zBX06Zm3QGL9a33k0jAAcv
 7CwA57mmRw4JULmmmGsakVtZZjPDb9BxoYnR+9zy+syXEQgGznO+TnMIsi+teazVU76v
 DfvVF5Das5j5GmJdQLepyTQyrVx2UQHACaaXyveMyqK7liouukb/wslF89tMjGpStWl5
 im9D+Tfqb8ubztacgBAVQh6qZ9sbt9Fems6Tdga32lw/awWABGl4CmuBND1eNmeE6Eem
 ivLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=iW3dPvuuTMdgsFkmyhHiA5kQX19PzFNvtN2tQFXndaoyeRaXjGDtB3r9XNQ7UXZbil
 mTH21mBrQhVfQZWJF2UAD8px0cagiCDMFohavL7uzjVzp6zpw9lfcd3ipac1FWds3DZU
 r1bplzymZWhRbUa9hnfI92YsIh8uHExU0X80025evYMKPyX+ZNnAfqVrFe2Jlv4Qp9sp
 3qq9zjbcjDgbXgo642bjATbCklDH0QaU/XPKsYc5PJhFSaHSYCT9Ioeed2F5MY800bsx
 X3mCEMi/d+9oJkF6YBQXEqnNgGzW77z8plc1ljX0m0W+HguGu00e2rB4hnMOBsd94AQF
 +FoA==
X-Gm-Message-State: AOAM530s8RihJ8ebCoK1+liFrfVvz3wA4+xPgFnltxljgqaLKP1yDKhx
 KVtHDrNfwYzL2r+m1Kz1nh0Covh6++yC9w==
X-Google-Smtp-Source: ABdhPJy+beCHN/eyvTtmfn+f7JH6WNwr5R93uJ6MIKgm3sTvr7IkTaLvsO2cw7ckAOI2i0QJYDd5dg==
X-Received: by 2002:a63:2c15:0:b0:3f6:6a5f:8f0a with SMTP id
 s21-20020a632c15000000b003f66a5f8f0amr5891187pgs.76.1654206539702; 
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 06/71] target/arm: Use el_is_in_host for sve_zcr_len_for_el
Date: Thu,  2 Jun 2022 14:47:48 -0700
Message-Id: <20220602214853.496211-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 839d6401b0..135c3e790c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6248,8 +6248,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.34.1


