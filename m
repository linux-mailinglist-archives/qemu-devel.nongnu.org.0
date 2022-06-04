Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783153D598
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:51:13 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLkm-0007ik-Iv
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Y-0008Qf-ME
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3X-0008WU-2V
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so13546760pjo.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZyYsyMR5C2jCP429J1iL+9VPu9Dr37P/n1C5u4W6jI=;
 b=TJhGlFVLXCmu0ZFOVZ3IWzZG9CuRbm0AlNX5MfZ4bvA1h8KC6ymBz0PQgdZV1hqdKB
 cAqGLMwMecLhJQiuVUtC3s1T8l2u5BECGSFcmZiO4xYAx4nHVoc7AhlmjiAkI8lzNcsC
 73U4xqvsa287+CviR4qnOPBK/bJjR3eS3F3n5dUwyDVmGcfqQT156M/fj3NjY6rje0V2
 phO6F8YwkGwD1mG27WXL+gHug47xGBQLKiNWa+IumowFaByjoYXs8hZ6xWXpKh7bFCU3
 10hEMe6cp1RQLtz+aaKH5O8h+Rnlj8rn8nJOeL6hEqZU0XmkXsRbJuhgWKwefBIv1BZu
 fuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZyYsyMR5C2jCP429J1iL+9VPu9Dr37P/n1C5u4W6jI=;
 b=NpMNT9EqWJSPVpxuRSKlV6dHIIeq8FzLxqYqz8U7qLYSb7Ee2LifwYgT+2PEXTePRS
 Aa1K0Vp6uf1GxFJC68M5De3Tt2vf0oCAVTft2RWCnI8U5M9CE0hE0CjEIriM9kjQpbzL
 cXgtB9DyCL+ZseWAWM652wweVGd3kgQpoIKC1WhyaNzHoETSXD11b/7SoWuSKzLaaKbe
 /XHd131fNQYUq8Ael7k85oRWqXydaNH7yhgJtZOc6+RYd2SvJrtIL4YoxDdkbK7FBAHs
 Garh9sP5jBQFyBG4prPBXQpbS57UGrB+gRpExYoUbozHxRjIc2ONimva4qaM9SH+xqKI
 YXlg==
X-Gm-Message-State: AOAM5326H95qj8nNV+X9O5cqXYYE7XoHn53JhKtLbnhZdV1LiuZ3g8tH
 G4wYKnjZxagvCyy2LE4YWRDcEOikajSaKw==
X-Google-Smtp-Source: ABdhPJzWMrtd1P50lrmyGO+AqF4kAHB6f63nxYJIz4B7EvSPjKZiXuOqhgV9405JTlKozgtpDR/kvQ==
X-Received: by 2002:a17:902:d506:b0:167:5021:d644 with SMTP id
 b6-20020a170902d50600b001675021d644mr4834092plg.159.1654315590325; 
 Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/28] target/arm: Move regime_is_user to ptw.c
Date: Fri,  3 Jun 2022 21:06:02 -0700
Message-Id: <20220604040607.269301-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 24 ------------------------
 target/arm/ptw.c    | 22 ++++++++++++++++++++++
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 85ad576794..3d3061a435 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,7 +11,6 @@
 
 #ifndef CONFIG_USER_ONLY
 
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3a39a10e43..568e02c5dc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10479,30 +10479,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-#ifndef CONFIG_USER_ONLY
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-#endif /* !CONFIG_USER_ONLY */
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9ab77c3998..8db4b5edf1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -53,6 +53,28 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
+static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.34.1


