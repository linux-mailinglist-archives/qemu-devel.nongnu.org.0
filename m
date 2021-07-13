Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A473C716D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:47:18 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ikn-0008N2-4R
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbZ-0008W3-SI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0003dm-Ca
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n4so3255586wms.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KPIYZ3zIq5bH2bgXU9pNq5i9SxEKiNByuloEeu6bbIM=;
 b=SPIBGNyWKDEeVV0cl9XGjDkfUKZJHstzBPR9I54/HUkKedoXMECvpGWCiGnKLmXhA6
 We9/KzJ1HODr/XckHCD5Sm8Pl0c0BDfAx9X6wTStwiLT6CNbEFPTnEidbPrcEKECZj2q
 sX/yPrv/j3h8dRU0xxNW0xx5/w3q/hsSZ3OlafJqJBhuvk5bBZRXoT+2O4MCpCqs7/jD
 ZJc6EcqD303gxuAhfnMZm1gOfD3ypvDVX+f0ByuiS9jDPNEPHuicoybHWdMZkbwdciY1
 i8fcKI5t8I1pKAcjmTXSDDedD+BbV1aK8D2/GW/kYzhKEPRDh1YZBLMUDfRkWVZJ15AW
 ZgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPIYZ3zIq5bH2bgXU9pNq5i9SxEKiNByuloEeu6bbIM=;
 b=IGKDjbe7NnmJ3riy7fodpPMjWMDcZq/v5i4GxND8bjq5EM8J74K9qiryIr0G8Zyjm0
 obl+NOmdOuhvEIttdP4hhVFTzeVCsYm70oJdRooTZBukWPWcbqp0K9r/YGq7TAj9V46X
 ywB1oSDKKu0l1GtwLnQKnJo+yN79Gnxht4pHZWQVLpzw6QJgcBHqZR08DZjBUkxnvb61
 PfGWURGn/Klj/ebGW+8jI9RDHj9nBpkXa4PGggWa0v5Qnnl/uG+dk0EexSsbS84iWOth
 hk7gIUdRuEw65rvSqZUiAcdBdTvzSE6nIWn0VZN7c8WkE+9Ur9sHcItfaR0e40XrSSCd
 lW0g==
X-Gm-Message-State: AOAM530ufhPWNFnTNi6czYxYpOKzw8ykPRl+EQAhjg9s3lDQnpyovN/8
 xoz2qruiqJwDKTSu+nygjFcnO5tCAiUxs2nl
X-Google-Smtp-Source: ABdhPJxv+gaGHK5fr8Y2H3uasw0A/MzgBv6pZXfDllLmhV1Bb6njTpQ6Gpk7siXztpJKvvdPjcKgKg==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr5174184wme.101.1626183455932; 
 Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/34] target/arm: Factor out mve_eci_mask()
Date: Tue, 13 Jul 2021 14:37:01 +0100
Message-Id: <20210713133726.26842-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In some situations we need a mask telling us which parts of the
vector correspond to beats that are not being executed because of
ECI, separately from the combined "which bytes are predicated away"
mask.  Factor this mask calculation out of mve_element_mask() into
its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 58 ++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b111ba3b106..b0cbfda3cce 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -26,6 +26,35 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 
+static uint16_t mve_eci_mask(CPUARMState *env)
+{
+    /*
+     * Return the mask of which elements in the MVE vector correspond
+     * to beats being executed. The mask has 1 bits for executed lanes
+     * and 0 bits where ECI says this beat was already executed.
+     */
+    int eci;
+
+    if ((env->condexec_bits & 0xf) != 0) {
+        return 0xffff;
+    }
+
+    eci = env->condexec_bits >> 4;
+    switch (eci) {
+    case ECI_NONE:
+        return 0xffff;
+    case ECI_A0:
+        return 0xfff0;
+    case ECI_A0A1:
+        return 0xff00;
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return 0xf000;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static uint16_t mve_element_mask(CPUARMState *env)
 {
     /*
@@ -68,30 +97,11 @@ static uint16_t mve_element_mask(CPUARMState *env)
         mask &= ltpmask;
     }
 
-    if ((env->condexec_bits & 0xf) == 0) {
-        /*
-         * ECI bits indicate which beats are already executed;
-         * we handle this by effectively predicating them out.
-         */
-        int eci = env->condexec_bits >> 4;
-        switch (eci) {
-        case ECI_NONE:
-            break;
-        case ECI_A0:
-            mask &= 0xfff0;
-            break;
-        case ECI_A0A1:
-            mask &= 0xff00;
-            break;
-        case ECI_A0A1A2:
-        case ECI_A0A1A2B0:
-            mask &= 0xf000;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-
+    /*
+     * ECI bits indicate which beats are already executed;
+     * we handle this by effectively predicating them out.
+     */
+    mask &= mve_eci_mask(env);
     return mask;
 }
 
-- 
2.20.1


