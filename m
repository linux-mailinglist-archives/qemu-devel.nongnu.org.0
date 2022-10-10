Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC35FA078
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:50:23 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohu6n-0001AD-O8
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl3-0006OJ-KQ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl1-0005aG-Vz
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id t4so6938286wmj.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JtZGH55VaZfgWgsMLT00zdGdGKdNAG1BkKtA55HW2Jc=;
 b=iW58+btw1cNAvCvINapVVDtaHx7WlqbjUafQ49+42N/lf0ma/gjeEtwKTvL2PnCBkC
 /m5C3Jf/3BM3nL9Dq7HhntzNXe10NYX4tBmLhFynlal2/Z5wp5oi61Y8bID3yxTBuHoq
 Og7Et3v7bHkJuoVh8s+sSMZHkWcYxNM7aiMzmod6IfNBRt826iAsB0GV1OqjevEQ1kPF
 Gu2p631ma8vJ58yfdg50YUPRyGgmNsRD9F0cmgmi+XVi/SiOB2dYgQfbIbjCwyADUJx/
 VA/27H3iOJnkOCl6yAgPUpUBv3wVuxE6AxU2Dxjjr/A8xVYs4UPPy4xMkAzDnKOQ0w3q
 rPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtZGH55VaZfgWgsMLT00zdGdGKdNAG1BkKtA55HW2Jc=;
 b=Mmb9+ScEORe8Gor0lsA6yUvnE4QEa9VxxBJujF1o3Q91kL/Ew5114XiCmUgaQ9yOdd
 FMrA0J0ApGPTfdYCQ9T+4WARTQMZ4q2u82z3Ri+yEWyhDjqkKwYxPGG6N4rM9RNzZVbQ
 WTdC94BPp7llLDqNLSImimHaleHxLNIVs9HsNZUVlX3WN546vxVo8ITPMwufmDm26R7w
 FnIGINclZrSf0r5Toee1uYfg8UJQLeBGqorY9NYxvOATsS2x7HAXmjIvS9crAodrG6+R
 ADkENjAYlZuVoqzenEjgTSjuYniYUgCnXaFlC39IgfOe/KrDoy9mAfju22AnXHgSjcN8
 ieJw==
X-Gm-Message-State: ACrzQf1PmEQXR1ZJ7hZWXJ3tD93m/9Rka7xPVX7RLBjGXEdsmlzxLna1
 u2xN8zfLhMnAKOXBoZwBEYUWjERKcYF63w==
X-Google-Smtp-Source: AMsMyM64GpReisa/LbLmi859UjZjqPSdl86orIJIfY7ArWhxx9v40zBpOUkwMdprM6Dy4dCGVY1AZg==
X-Received: by 2002:a05:600c:3b9e:b0:3b4:4cf1:9531 with SMTP id
 n30-20020a05600c3b9e00b003b44cf19531mr19625480wms.64.1665412070486; 
 Mon, 10 Oct 2022 07:27:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/28] target/arm: Introduce arm_hcr_el2_eff_secstate
Date: Mon, 10 Oct 2022 15:27:19 +0100
Message-Id: <20221010142730.502083-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

For page walking, we may require HCR for a security state
that is not "current".

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 20 +++++++++++++-------
 target/arm/helper.c | 11 ++++++++---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 53f4c236e1f..d541392170e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2412,15 +2412,15 @@ static inline bool arm_is_secure(CPUARMState *env)
  * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
  * This corresponds to the pseudocode EL2Enabled()
  */
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return arm_feature(env, ARM_FEATURE_EL2)
+           && (!secure || (env->cp15.scr_el3 & SCR_EEL2));
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
-    if (arm_feature(env, ARM_FEATURE_EL2)) {
-        if (arm_is_secure_below_el3(env)) {
-            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
-        }
-        return true;
-    }
-    return false;
+    return arm_is_el2_enabled_secstate(env, arm_is_secure_below_el3(env));
 }
 
 #else
@@ -2434,6 +2434,11 @@ static inline bool arm_is_secure(CPUARMState *env)
     return false;
 }
 
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return false;
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     return false;
@@ -2446,6 +2451,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * "for all purposes other than a direct read or write access of HCR_EL2."
  * Not included here is HCR_RW.
  */
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b1b8725628b..f1266bb1579 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5229,15 +5229,15 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 /*
- * Return the effective value of HCR_EL2.
+ * Return the effective value of HCR_EL2, at the given security state.
  * Bits that are not included here:
  * RW       (read from SCR_EL3.RW as needed)
  */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (!arm_is_el2_enabled(env)) {
+    if (!arm_is_el2_enabled_secstate(env, secure)) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -5296,6 +5296,11 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
+}
+
 /*
  * Corresponds to ARM pseudocode function ELIsInHost().
  */
-- 
2.25.1


