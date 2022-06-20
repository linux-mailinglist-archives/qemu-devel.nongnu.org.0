Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE95552367
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:59:32 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LgR-0000FR-Fl
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La5-00067v-1n
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La1-0001Sr-Ob
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id 128so3865217pfv.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GesrIHFMTO3ZtieooBkDR9w2srxIqgw/UObtz7kR7Fg=;
 b=AEzUSW4qGELEI/OfU+TDrrcFyo/U5Zn7asQ38D/i6zOCeoIQOZOBDbVUYJ/evSyQpi
 rN/vZPc8TgMg29E35HOkwq5ABbfg+XRQ8dWzp94P7sN5IclOiDB4ogsD46ozk1wO4JPp
 TUxpRb0O3vTilO0K0I94DN4QqgRGzBi9lZTqLBI8oiPmA8PUsgZ7ub+0DLBvEyGJ+pmn
 kSRzYw4a9PyV4UFpHNM6WZwxaECMVIFSv26DMmo7YqOe2DrFEWhaY7FiEvkOZU0Qewj+
 ChN1JXBBvO8w3nJ6BZ934Ru/3qs7vsROSCAaVi568LPWo1WiRI14n1E6yEDuz/JVzxC1
 mBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GesrIHFMTO3ZtieooBkDR9w2srxIqgw/UObtz7kR7Fg=;
 b=n9wS/Odti6aEskbAKPeFrG7zXLzhfcGqwSHrUMwrE6vtrN//WvWgYW1sQc7PMZ8yin
 3OpLZ5Sf06I4rTRcu1IE/z+/c3fWr0qS6SmHlilIEFle0opBa1CsU3DBDU7wxJaJtbIQ
 GpXr4pRvrNeRJtne6VH2qL5/ITkbYqQcB94IfxN98/9BNZlkRlFioujE3gPdHne5ZXJr
 lDorEGhAqLAYeHzYOzgYkQCKL8C3w0t6c92kMrQyh8Nyx+hNYMt2y3kstzY+WxuOAlMr
 LwGfL5b9plQio08It91m3iLl2Ynm/ElmxrtTdad4j9jtLAieS6nNOx07N2Y7tLSuKfvD
 byTw==
X-Gm-Message-State: AJIora8Ll9iC7ATLmLidWsXdV4qPN6kQYmFWYUO6+8Eepym079eJDaZh
 M6DFaEdgAFnP2+nssTknPfKE1XMQbLCGZA==
X-Google-Smtp-Source: AGRyM1sqeTtZU86cEtBq9mIIRRG8FuFeF7xayU3gMpa6yJCA0qAFBRTRIiyaDdha4PRod7mQeNju0w==
X-Received: by 2002:a63:7e1a:0:b0:40c:c3b9:f97c with SMTP id
 z26-20020a637e1a000000b0040cc3b9f97cmr4945563pgc.498.1655747572433; 
 Mon, 20 Jun 2022 10:52:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/51] target/arm: Introduce sve_vqm1_for_el_sm
Date: Mon, 20 Jun 2022 10:52:02 -0700
Message-Id: <20220620175235.60881-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

When Streaming SVE mode is enabled, the size is taken from
SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
set of vector lengths is not.  Further, Streaming SVE does
not require any particular length to be supported.

Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
to the new function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  9 +++++++--
 target/arm/helper.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8b00d29af4..244f8428e9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1140,13 +1140,18 @@ int sve_exception_el(CPUARMState *env, int cur_el);
 int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
- * sve_vqm1_for_el:
+ * sve_vqm1_for_el_sm:
  * @env: CPUARMState
  * @el: exception level
+ * @sm: streaming mode
  *
- * Compute the current SVE vector length for @el, in units of
+ * Compute the current vector length for @el & @sm, in units of
  * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ * If @sm, compute for SVL, otherwise NVL.
  */
+uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm);
+
+/* Likewise, but using @sm = PSTATE.SM. */
 uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a80ca461e5..2e4e739969 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6272,23 +6272,41 @@ int sme_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t len = cpu->sve_max_vq - 1;
+    uint64_t *cr = env->vfp.zcr_el;
+    uint32_t map = cpu->sve_vq.map;
+    uint32_t len = ARM_MAX_VQ - 1;
+
+    if (sm) {
+        cr = env->vfp.smcr_el;
+        map = cpu->sme_vq.map;
+    }
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)cr[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)cr[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)cr[3]);
     }
 
-    len = 31 - clz32(cpu->sve_vq.map & MAKE_64BIT_MASK(0, len + 1));
-    return len;
+    map &= MAKE_64BIT_MASK(0, len + 1);
+    if (map != 0) {
+        return 31 - clz32(map);
+    }
+
+    /* Bit 0 is always set for Normal SVE -- not so for Streaming SVE. */
+    assert(sm);
+    return ctz32(cpu->sme_vq.map);
+}
+
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
+{
+    return sve_vqm1_for_el_sm(env, el, FIELD_EX64(env->svcr, SVCR, SM));
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1


