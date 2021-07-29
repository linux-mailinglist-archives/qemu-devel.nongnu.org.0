Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D948F3DA1F7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:19:18 +0200 (CEST)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m944L-0006KI-F7
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940o-0000UD-1x
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-000147-SS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so1130496wms.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=p71GY64S4bkwnzaHIPsCIIXm2YhNf/9nXFFqcyR1DUFSBqemp5Mdvx/eh3hm0bTdm/
 NGr5DNhmXLqXBDNuqReLCVMM9p/SS7aPzxfoHJdpX1+nq0nYjNllSyDcLApwax7pQ8rD
 rWPDWg8+SuVAMUUYrLI4InDE+epjnaY3/4ZIp31RUc5qK9xCk4izkmA+ca4wHLXMOziV
 8RrgP1+OUAAbWK6SsYeRvfPIkLj1vNRshK3PzVWgje3BTPqAFb41yW1j7vxgF3mTQ6ue
 Xtklzd8t5p6zKMqyDQKMNFyQ50Wv5LHs5tMjshXy4T663COXk9HvK8WDy67z8+OBjBNT
 bdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=dsI13S3vADhtG5T9mC6FYBEYjH4E1Y1L7/QyHYo4DTppAVkXN62hYV3ONInU4wP6tZ
 nM8GLwwGk1Ct9vpg658jjEzH368ekKR6Vo1+QoEEgjUaRMuTfpJc8DXaSu5brNVWLIwJ
 9sPVJZVaKKtB5JFLJ2Ijs9Cdcf10Hr/H4XNTtTJa6ppyGw4bV0owdUMiB+8GPuF+auAr
 c3bxN0+oWki/vt268rA2bMpfkw+JS+ZWG0XRAGSYfkDvokDby3ONCJdLQIP1g3tTxzB9
 noqNC5HO+7G2qMau034E4bjRmclFKWzU3AxA9dzsQeWnPK9Pucwt+Kx9XlohVH1K6HaN
 Qnlg==
X-Gm-Message-State: AOAM5327agIMud3j3VKCNU2H0BRs/tzjYE6grrcSs53DrCkHQCPwdFb+
 AgxwzcSkShd8uumH2JanhuAr6gznm3YjqA==
X-Google-Smtp-Source: ABdhPJxXZU9VXPHVeUJS7afG27GLM8616ssKqQLvn+nyjY3Lo9pZEhu1dnFI/qUH4kfKGqgCOx+ikg==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr4153217wmj.59.1627557323542; 
 Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/53] target/arm: Fix VLDRB/H/W for predicated
 elements
Date: Thu, 29 Jul 2021 12:14:30 +0100
Message-Id: <20210729111512.16541-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

For vector loads, predicated elements are zeroed, instead of
retaining their previous values (as happens for most data
processing operations). This means we need to distinguish
"beat not executed due to ECI" (don't touch destination
element) from "beat executed but predicated out" (zero
destination element).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bc89ce94d5a..be8b9545317 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -146,12 +146,13 @@ static void mve_advance_vpt(CPUARMState *env)
     env->v7m.vpr = vpr;
 }
 
-
+/* For loads, predicated lanes are zeroed instead of keeping their old values */
 #define DO_VLDR(OP, MSIZE, LDTYPE, ESIZE, TYPE)                         \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
     {                                                                   \
         TYPE *d = vd;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
@@ -159,8 +160,9 @@ static void mve_advance_vpt(CPUARMState *env)
          * then take an exception.                                      \
          */                                                             \
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
-            if (mask & (1 << b)) {                                      \
-                d[H##ESIZE(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC()); \
+            if (eci_mask & (1 << b)) {                                  \
+                d[H##ESIZE(e)] = (mask & (1 << b)) ?                    \
+                    cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;     \
             }                                                           \
             addr += MSIZE;                                              \
         }                                                               \
-- 
2.20.1


