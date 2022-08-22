Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A259C3DD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:17:39 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQA7O-0004Ix-4u
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L9-00070X-SS
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L7-0000eJ-D6
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id 67so2481793pfv.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RTuC78nAmKRpy6AilqJ6/PXnPW0S1OBfJlreo9tIjlo=;
 b=DdWh6jghg6sPIZt5dYG1EFyZ9PFXE9H5lHaiNcFThNTuPrnpgd7ODCz574q8+s3+QZ
 3Kqeh4TFT5HYLc5HYsjiQFi8T7A2hMRGn1H1B7wnHr7lXTV+dInGi5O4/ahCSypuO73J
 wrCxYCNhcb13HuhNZAZB7nuKG5giAf2librZI0y/ORJU7j34eF6Th6qk17XtyqXk5yd6
 3xjWuPj2KTV0q+iU5rtney3SBOHUcAB4DZs9BgYI1hWAOywhizh3NVd65apx6a+XY2tQ
 A+FS0PQhIjfQVqSJElJKBfGVB2gmq517tmYObUMyiMSjuegJFP56t9cwpwQoU25EPoz6
 IXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RTuC78nAmKRpy6AilqJ6/PXnPW0S1OBfJlreo9tIjlo=;
 b=GpM0RUkNiUKrtCuPfj+HyBB27uJafqrQbgAmU0Vm2MCPxcLvcm2YopxvR9s0aEPlLK
 XX1eRBwdLYGDkhARGK5/VZ6eljzThcghYSOymikQhVULegbpwvvGcqjQ2FDC6ECDUWnM
 pov+VbrTCZ1m9oLhcST7IUNSBThAUtkBuA3gqwLwm8oXTjpb7iZKl4h3UJd8YwvWdTM3
 JzKwB48e+2BsrJlFh9T6yXH2T9bxXm95uPjE05tvuMSCFVpMNDHCUW6u8V8Wn/VRTxwC
 uNETAWOgprS+/TcriGTBsTXFXK44hFg2GF5xjstuRoNnvc0p2IcL1tH8ufRqOS6W14V4
 otTA==
X-Gm-Message-State: ACgBeo2xFor9tdenssRnTFJExY/uWpG9xFRg6WIsQ2HShXm+NAt2NzRi
 +FLaS/YcDW4yW6n0XISRXYnTX8C3anpO2A==
X-Google-Smtp-Source: AA6agR4ykeEDAYALFYuUCaEm6nH3l7ISJ4+xefPDyODgMpfJ0omd/4/joXzVf1Mlg4HBxAmtsQRVxQ==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr6999547pff.44.1661182064127; 
 Mon, 22 Aug 2022 08:27:44 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/66] target/arm: Fix ipa_secure in get_phys_addr
Date: Mon, 22 Aug 2022 08:26:37 -0700
Message-Id: <20220822152741.1617527-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

More use of the local variable, ipa_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db2abac01..478ff74550 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2308,6 +2308,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2332,19 +2333,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             ipa = result->phys;
-            ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-                } else {
-                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-                }
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                ipa_secure = !(result->attrs.secure
+                               ? env->cp15.vstcr_el2 & VSTCR_SW
+                               : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
-                assert(!ipa_secure);
+                ipa_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+            s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
             /*
@@ -2388,7 +2386,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
@@ -2412,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = regime_is_secure(env, mmu_idx);
+    result->attrs.secure = is_secure;
     result->attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.34.1


