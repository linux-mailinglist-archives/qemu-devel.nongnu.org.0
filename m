Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAD318C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:39:07 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACBR-0003vd-Ew
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZP-0008Tb-66
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZA-00005O-9u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so496579wrd.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YgCr6mYaUGxtwKUqfZylaoD+2M0uQDgCb7ALhaIpey0=;
 b=oF/4Y2Wn0nTcSCtvWLabyVTNXTizCwcoTbWW17/K0gMqDkGGYjKKDRWBcyGTt7z5oz
 LavH0fxkKXWF+maNPJ13txxxYORfDIDeoY8z453hzQjlDp7XqTMwdTM4XbB1qovBQdk6
 tO3MG4xYYA/GF71ilZ+aIZbmyrmGNErTsgvtbiyzI9hHTb7WYJZSqTehyjnNdsA2Zt/B
 OxoU5PLvy7LOQf9Y/YRsBTe4NURAT6zY0YFedM3EzwtBnld3GMcorD8cgQ9HPZAz5XS4
 MtrJq5MYz9D8H3CnorKGxVpJkWfJf3D3yJmqdSgpb2vyof4p52GEmDrMq20Ec+lq/BiO
 ziiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgCr6mYaUGxtwKUqfZylaoD+2M0uQDgCb7ALhaIpey0=;
 b=cI3zstw7PnG1GJBmJ0OR7LQ3wzyh6iGSJVGA40q5BdHUVYHj62MU3u2DNjbgiDPV+A
 g4xLIJ7nkvDpki3nGeo+nTIKKwN+wg24xzYqruS9ufy1bBMOCJa5Oi+zAMeQTPsjLqj2
 FdrSVHC2pYc+C4bF2BCwb1uzvDcH4G/lkp/WZut/brM7YhRUIiUlY957YdiX4jUFDwDh
 YYXZO5A3l/lTgYu2VA9Qp69RtKUf+/DLlSsYHt1h15861F4qfr9jZLz8NWmTylanvWPc
 WeWXJRbJcrhczIcnhnxGSrVcDbW2xLaC7/83T63WbPZFEJWbfhoP8iSSJHPFo1xFlUFn
 KTJQ==
X-Gm-Message-State: AOAM531i2L3oEuF0/Nt9CHwaTHO7RI/KORfu1Hs3la+c2ACzCYl0VYUg
 aGhXXkqBkEtsI0vjhXRWC4TAh8/sBD6vaw==
X-Google-Smtp-Source: ABdhPJx0TrrLHU+GO2DpBskKCm/aLhmTNSNTEcUWiVuxBjqBJNEtGFLDpExzgG1YV4Cxr/oI34zsPA==
X-Received: by 2002:adf:fe46:: with SMTP id m6mr5693992wrs.92.1613048366066;
 Thu, 11 Feb 2021 04:59:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] target/arm: Use the proper TBI settings for linux-user
Date: Thu, 11 Feb 2021 12:58:46 +0000
Message-Id: <20210211125900.22777-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We were fudging TBI1 enabled to speed up the generated code.
Now that we've improved the code generation, remove this.
Also, tidy the comment to reflect the current code.

The pauth test was testing a kernel address (-1) and making
incorrect assumptions about TBI1; stick to userland addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h      |  4 ++--
 target/arm/cpu.c            | 10 +++-------
 tests/tcg/aarch64/pauth-2.c |  1 -
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b251fe44506..112bbb14f07 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1425,9 +1425,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
  */
 static inline uint64_t useronly_clean_ptr(uint64_t ptr)
 {
-    /* TBI is known to be enabled. */
 #ifdef CONFIG_USER_ONLY
-    ptr = sextract64(ptr, 0, 56);
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
 #endif
     return ptr;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50..70cfcbc9181 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -205,14 +205,10 @@ static void arm_cpu_reset(DeviceState *dev)
             env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
         }
         /*
-         * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
-         * turning on both here will produce smaller code and otherwise
-         * make no difference to the user-level emulation.
-         *
-         * In sve_probe_page, we assume that this is set.
-         * Do not modify this without other changes.
+         * Enable TBI0 but not TBI1.
+         * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 9bba0beb639..978652ede3a 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -53,7 +53,6 @@ void do_test(uint64_t value)
 int main()
 {
     do_test(0);
-    do_test(-1);
     do_test(0xda004acedeadbeefull);
     return 0;
 }
-- 
2.20.1


