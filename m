Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980263F7383
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:41:06 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqLB-0000IX-JG
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG2-0002xO-Ut
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG1-0005JR-AK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id f10so14671029wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=TU+AfCyYyJYKUWRUXygLCb+TM4h4M4jcIgELPafzxB5GIAy1ZGohxs70BRiVk4yEx0
 w+LMKNmclvbRwN7zgOz7/jgHzF05bu1G1juYHdafCkBP6M2Z5JfZEvEBCXF5eY6N3ypp
 5oWtds75vbMn1hU4j8Wlidi5T3nPTEE/rQHeRqaQdoGDawd+4xj0+XLBUCzdsdWNSbmm
 bvEsDXXYO5ZCRqRgdo/UM22RjrYhtI8H/qToUwIPS6uwoWsCFvQWN4RjWzvzTNUpZ3gD
 1XLjjJKaZ8+pe7X9v0HasvvllvEXs8z9+YCS3Ad6nFPnQ2aKOl+yu+VsqHLPG1xyGAzO
 5Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=VUWovSiMgoBbIaEEjAH91HonLeXi1opUyJvv5k38cSFUYFuZY0Vp5P41G/GRdGVsF8
 2YshvuYTBPYoTFrxalPTjX5lDMI/o+ogBmn+0YDa1JyaDbsuvNyxtTN14vukJ/KstB/f
 sFC3bfOnLnofETJfcMha8FkrjiTn2L1WeSSiWM3vgJlh3NwlGij7HlYYyJrLKyc0/lZu
 LDRtdt7D10ephr/TGGNpOdKXgbgKTQgs57b30jVgBY0SMx8XJxcE1SGafanWxuMJ/7Cc
 f8Kcyb/RHmPZBiXE6aRRjk7w7pEVhWke20xRpsX1ZXVjFM8LbVKlfSIfuvctt9tPZdnG
 ESbw==
X-Gm-Message-State: AOAM530H5H7Q+sxxhTKYAabKkxmXYC0r8SQ+zq/BbWSSbxwfutMtCLiJ
 l8OIBuO2hlDFuxdpvju/CuoXQFK1fMJ39A==
X-Google-Smtp-Source: ABdhPJxRV9/u3qncI0KKNZmfTXCUBJVATGsFZAn/y2U/mYk7rNbI1420YwkP79ChE6ArMrMhkpQTYQ==
X-Received: by 2002:a05:600c:4a23:: with SMTP id
 c35mr8511925wmp.140.1629887743921; 
 Wed, 25 Aug 2021 03:35:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/44] target/arm: Fix VLDRB/H/W for predicated elements
Date: Wed, 25 Aug 2021 11:35:01 +0100
Message-Id: <20210825103534.6936-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
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


