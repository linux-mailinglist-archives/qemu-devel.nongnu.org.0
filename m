Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335245FA08E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:54:05 +0200 (CEST)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuAO-00076s-7r
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtky-0006Kf-GL
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkw-0005ZV-R5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id l8so6952230wmi.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fje2xIcK7TdFPjWxKpgsq3uECMq4Tvvs5Jp3UhFaNNE=;
 b=CBEZS18lFBiLbETZHK0XzagEXVp/KMG9AMDBRgfLQBBOLYDGAeyRo9mq895ALkDmv0
 jX1nsm4hVBp9yLWqURT3dnXXEeb/Jj60beEVgazX/XTMeHKWgt/FAz0NYXu+MAdpRkLX
 9tP4rZeYXjy9D5stuWtSmIO6eVuqm7b00mV6tsCu634dIM1Ub9GJ3yEjsXZXPksdFQMH
 pzIlrRWDp2ApWUJ/xnupLHfrap+8giqUSG2C1LBM3upgSnXIOx9C57lqvE/mzzKauUl6
 tY4vuY1TzdbrfTYw4z9RIwMiMjOfkfExgYmVMisSEJcCRyCprIeXZDFil6i4CFI72B2f
 poiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fje2xIcK7TdFPjWxKpgsq3uECMq4Tvvs5Jp3UhFaNNE=;
 b=foiZan1huvimSWSXiemJLOAAo32CwaBBBLklwCz321sp4gHMYbiumy2O8ycPnr9Rn8
 iqWn0LIXACLGFt2l5kj2F1nFD9kazrG3FImiUczbQOFnr0vF6F2LqpIFMZLsiElzc/gW
 K3Jz8hGU3PT3RuAvQCabzXPM6Gmls45XnPdlVa5rR1bKcx1WjLNIRH8laE/XHhHrAvrc
 i62rdDeo4SQGR+hoT4635iVOxDoQras18QkdFOTCj6VnnpQetPX0Xb+SYC2Qsk950Khn
 0nFahu24JU1waykUdJuk3oaZqqoZGKzMB93i+HITCLsV9dEAfM0qxcYw2oNzfmZq6Ffy
 dSkg==
X-Gm-Message-State: ACrzQf0XRVlphyDKlkngSrM/FycRa3Csk34e91eFPNYvfBUUTcNMzzx5
 cslvSGfhOGo87v+q6aRcxvAafXB2YRJmaA==
X-Google-Smtp-Source: AMsMyM4Np6whpQJaZIJi99RetL2cQV4h3kIoTa7gEAT9AdBcILzcWJg2fH/NLhNsTz1lmc32Lg/HUA==
X-Received: by 2002:a05:600c:1989:b0:3b4:b6b6:737 with SMTP id
 t9-20020a05600c198900b003b4b6b60737mr13008560wmq.79.1665412065348; 
 Mon, 10 Oct 2022 07:27:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] target/arm: Merge regime_is_secure into get_phys_addr
Date: Mon, 10 Oct 2022 15:27:14 +0100
Message-Id: <20221010142730.502083-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

This is the last use of regime_is_secure; remove it
entirely before changing the layout of ARMMMUIdx.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 42 ----------------------------------------
 target/arm/ptw.c       | 44 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3524d11dc57..14428730d44 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -670,48 +670,6 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 74dcb843fe2..55e8f33c508 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2498,9 +2498,49 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
+    bool is_secure;
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+        is_secure = false;
+        break;
+    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        is_secure = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     regime_is_secure(env, mmu_idx),
-                                     result, fi);
+                                     is_secure, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.25.1


