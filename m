Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4754560C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:54:17 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPAW-0003Wp-DI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmC-0003Td-Q9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmA-0008Qj-Ku
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o17so21146793pla.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=or4hVFMgSgQ4bkROq2u2MyvWBg+YN6u3/ulE0jHiq7E=;
 b=d7qOLqSzGe3SlYCLMEVqsHC5BKw1lZfzjDZEXGYVdzvtks8WDH/nZQMAQuTo9YsgWh
 oL03qUF+wtt50SOLayegK2xisGzfOlh0xpjfWRTWwn5EFTv46vYcI6suN0DCgjnSoKTv
 8DPVisZcIx3x45aA4xMIIWYAIA3ft627At2+zhkegA7QGaHLQOzL27QByfvYsspPEDUv
 HzGaeo1QFAHdjUAI+bxkC7/IyzXQpdIGtyx0WTd95nT2SPAu00NFYasPLFeLc709FxPf
 dtCZPMeXu9t+pdWGnsCmS718PGOv4tqHrVAMPJeFE69SM2LbJQv1tebYluvlDmmsIOhT
 geBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=or4hVFMgSgQ4bkROq2u2MyvWBg+YN6u3/ulE0jHiq7E=;
 b=xl3XAH+FW7EskUIjxHc79zsHVCcLDlEGMamavATlQEDthrjjvkBWIVNtn7EPbqUYvQ
 7YQly/NERzf87UVAp1w5sJyzabrRVbN7k0wVEk31qtjgrPreM8jKmW/4PXl5e9JDkB0m
 +atkv9npimnG6EgTQf3gpTW9ln2arGdoH09vVRgcuvEIQ3Ipoxv17vVqzL2HRfVTE6Re
 8qzm1VFPSyOJK7HEIwGqEQ7BOsDDbcc4vdwy/VUdd4iZPmly6wjbZwJneQ+VRRe4NUVH
 pT3VZiMIeeUzjSIChtSiRimYPcqHgSUXGGRC1oyjHS8qx5RXyqwMoM+aIToYjNyGRO4+
 YpCQ==
X-Gm-Message-State: AOAM5320dfyKkollCyuCaCprqH3riUePfD/dao/5jJRyzWUJQAHq1q48
 VDBFcU/dTH1rnTMiXsLrPAG/mR44Nj7NNA==
X-Google-Smtp-Source: ABdhPJzlr0xnccsdiBRtm3SRVsNYqwcj2OzaGLBdi5rGxoFU9zyZ8oh+sPLqMnZ0fr/VLWR9jAYU8Q==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id
 r4-20020a17090a5c8400b001dc9b42f2cfmr5033134pji.123.1654806545247; 
 Thu, 09 Jun 2022 13:29:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/23] target/arm: Move exception_target_el out of line
Date: Thu,  9 Jun 2022 13:28:41 -0700
Message-Id: <20220609202901.1177572-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Move the function to op_helper.c, near raise_exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 16 +---------------
 target/arm/op_helper.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a1bae4588a..af9de2dbe5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1098,21 +1098,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
 
-static inline int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /*
-     * No such thing as secure EL1 if EL3 is aarch32,
-     * so update the target EL to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
-
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
                                                  uint64_t sctlr)
@@ -1339,6 +1324,7 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
+int exception_target_el(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..97c8c9ec77 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,6 +28,21 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
+int exception_target_el(CPUARMState *env)
+{
+    int target_el = MAX(1, arm_current_el(env));
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 void raise_exception(CPUARMState *env, uint32_t excp,
                      uint32_t syndrome, uint32_t target_el)
 {
-- 
2.34.1


