Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477D541912
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:19:48 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygc7-0002Rq-B5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfti-0000d0-HZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftX-0007U9-Uj
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:54 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c18so8625520pgh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYa9Ij7DGXX4UaDE3YZGCzVfYSAzgGKdab54muYOC2Q=;
 b=P/SdpQ+7mvHVs1z6glcl6s4SaN7KF6induAAqWnrxC6C4PW667b4UZQvzF+7k5KnhP
 0/uwtjEGTjfFwPk6gK8+ag4f6bPnGYRs1k+acE/63SuK4fWd2B9cf571nUqYc3rvZgAT
 5W0hAmRmQDah6CO4dO19uah+puT0l3JDnlqpbmSoLWRav1gqHPTXLmAHxywuH4dJvQVj
 pV+0wOBs0/zJ9XU0u5sEbc39tZATL3AIwqVanrcPTmjneQoxWYRBigmjmPYs3BRBxi8+
 uI63sPaeqK24CkrBI9xKBJj9906wunMRtReLitB/HexZY2GP4q4MhW46NesVVfjUb2Nt
 Q60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WYa9Ij7DGXX4UaDE3YZGCzVfYSAzgGKdab54muYOC2Q=;
 b=nHJRienV+rMMVydgW0N6dXUxLq2Ctkt45AFORhuUm1w71obeD8Jg3k1+UHLiTVUBW0
 cdBsYZa9G30mgufXMEkPGmp8Wi/d8fUDEMjauAtmZE+cWpNm3BBmhgZ8kfKjxLS/Myoq
 ZElDtS5agPGbsD0JZ0BceKtgIKRQPVrA+N0s/AYqB5MTFGEEEmOHDfacYxqZvzdeMW6h
 GPJtUh5rXEQLdQw5GEZJvb6oetvF0rT6iGxqsXgXAEQkS9A4A3h9dnHIPfPY0YIvjBcW
 6vEofsv7ROKBEcPgUmUYKh5FZU6SrVe/cQ1Lv/Elrzuulu0e4VXX0xv114XvCjMFtoRE
 1OCg==
X-Gm-Message-State: AOAM530ANdRCIkYTHGeFucKe8BauuLodMGX6m0aXuSNFGUeqhlKFpmi/
 IopiPKvLrZnIfBFLMdtoJCzwOgBEye4ECw==
X-Google-Smtp-Source: ABdhPJyjHBd2YlPpmyqSt4kq3X5sN1Mj1rhvfjpQdX5m9302FIauPj9H2i1nKnyJPvAu+VyGa6IHag==
X-Received: by 2002:a63:8241:0:b0:3fe:2e64:95f0 with SMTP id
 w62-20020a638241000000b003fe2e6495f0mr133653pgd.190.1654634022703; 
 Tue, 07 Jun 2022 13:33:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 38/71] target/arm: Introduce sve_vqm1_for_el_sm
Date: Tue,  7 Jun 2022 13:32:33 -0700
Message-Id: <20220607203306.657998-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  9 +++++++--
 target/arm/helper.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d81d1bedf9..d7d364abbb 100644
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
index e3f3e4dfc2..b1ca819597 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6276,23 +6276,41 @@ int sme_exception_el(CPUARMState *env, int el)
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


