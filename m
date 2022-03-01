Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF864C983A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:17:39 +0100 (CET)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAoM-0002Bs-9g
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXi-0001Ma-3u
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:26 -0500
Received: from [2607:f8b0:4864:20::634] (port=40787
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXf-00054l-7Q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:25 -0500
Received: by mail-pl1-x634.google.com with SMTP id z11so6188308pla.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
 b=x9Hpxm+yOZ3n2zpMptbltLZJ/Fj3t8u0ktCJjHkh1yz48YGRmn+IzwbD+One+J9O1n
 ifkP8awY/S0F8l4MIIMPZjMkI5pBI9ms4qsAeh53k6p5iyv4ESSMv3BB7AHwb1bVokzU
 0pm6UKg/qHQubrQJes8VV5Qrn6V9StWJTbaKoZzZDqQhei/xjyjjxOTJRMoolwqWjBCj
 te2oV5UEbJ0LuQ1a5hq9k6j4mJttybImuAvHH3jUvZLLRdjy/7su454Yz/oztvNkr7R2
 ggEUhCUUIgqARkIiiN0KQlPULLnP06B7POqONcLzRfkHRB5wbZVB1Tecr59KOQpb+3V/
 DvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
 b=10L5BbjHwQ4GFM71AsEOnPQqMKdPulka4RKr6I74F/A245dzqeAK04Ju28yxoOrqI2
 EuxCAwWcBwmoyVRA6RoTkEji3J8qb4smdI2eaRULzBpNlEdPLS4FHl8G04ERNrvcd0so
 IVLOR5yVz6uiYE5eFmYRpLDbj6KoaEiV3T+Nukmi3oNGEl+HmyNvLkdS1WFRA5QVbgYJ
 RrxBBZA4ACNiMqp7OqFs2iXIUxzO6rskL6nUCm5A11XaqAfGN3niUEyFXLgf9BTIBQ04
 HCnbvEThkyj7g+y/havjJBAASdfMYEEvct7ZNXAI6GbQkKPH4brWIUyFLpGiCYnGygbF
 L0fQ==
X-Gm-Message-State: AOAM533jIMNlG3m/9zAACHCaDipwvO0j6tUIWyiMWLOYlO5h8mKiruw5
 LMRF8nv966JMVqwLhXDix5/NcR4tpbQXXw==
X-Google-Smtp-Source: ABdhPJzD5lxtdEJWSt10NkmYV/WVY44tL7ywINneeaWrGxaGsEq1GveFXMfWvzLVvxPMWf+79OcIjA==
X-Received: by 2002:a17:90a:cb95:b0:1be:f05c:d7a5 with SMTP id
 a21-20020a17090acb9500b001bef05cd7a5mr1491061pju.140.1646172021666; 
 Tue, 01 Mar 2022 14:00:21 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/18] target/arm: Introduce tlbi_aa64_get_range
Date: Tue,  1 Mar 2022 11:59:52 -1000
Message-Id: <20220301215958.157011-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
returning a structure containing both results.  Pass in the
ARMMMUIdx, rather than the digested two_ranges boolean.

This is in preparation for FEAT_LPA2, where the interpretation
of 'value' depends on the effective value of DS for the regime.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 950f56599e..31c2a716f2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4511,70 +4511,60 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 #ifdef TARGET_AARCH64
-static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
-                                           uint64_t value)
-{
-    unsigned int page_shift;
-    unsigned int page_size_granule;
-    uint64_t num;
-    uint64_t scale;
-    uint64_t exponent;
+typedef struct {
+    uint64_t base;
     uint64_t length;
+} TLBIRange;
+
+static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
+                                     uint64_t value)
+{
+    unsigned int page_size_granule, page_shift, num, scale, exponent;
+    TLBIRange ret = { };
 
-    num = extract64(value, 39, 5);
-    scale = extract64(value, 44, 2);
     page_size_granule = extract64(value, 46, 2);
 
     if (page_size_granule == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
                       page_size_granule);
-        return 0;
+        return ret;
     }
 
     page_shift = (page_size_granule - 1) * 2 + 12;
-
+    num = extract64(value, 39, 5);
+    scale = extract64(value, 44, 2);
     exponent = (5 * scale) + 1;
-    length = (num + 1) << (exponent + page_shift);
 
-    return length;
-}
+    ret.length = (num + 1) << (exponent + page_shift);
 
-static uint64_t tlbi_aa64_range_get_base(CPUARMState *env, uint64_t value,
-                                        bool two_ranges)
-{
-    /* TODO: ARMv8.7 FEAT_LPA2 */
-    uint64_t pageaddr;
-
-    if (two_ranges) {
-        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    if (regime_has_2_ranges(mmuidx)) {
+        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
     } else {
-        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
     }
 
-    return pageaddr;
+    return ret;
 }
 
 static void do_rvae_write(CPUARMState *env, uint64_t value,
                           int idxmap, bool synced)
 {
     ARMMMUIdx one_idx = ARM_MMU_IDX_A | ctz32(idxmap);
-    bool two_ranges = regime_has_2_ranges(one_idx);
-    uint64_t baseaddr, length;
+    TLBIRange range;
     int bits;
 
-    baseaddr = tlbi_aa64_range_get_base(env, value, two_ranges);
-    length = tlbi_aa64_range_get_length(env, value);
-    bits = tlbbits_for_regime(env, one_idx, baseaddr);
+    range = tlbi_aa64_get_range(env, one_idx, value);
+    bits = tlbbits_for_regime(env, one_idx, range.base);
 
     if (synced) {
         tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
-                                                  baseaddr,
-                                                  length,
+                                                  range.base,
+                                                  range.length,
                                                   idxmap,
                                                   bits);
     } else {
-        tlb_flush_range_by_mmuidx(env_cpu(env), baseaddr,
-                                  length, idxmap, bits);
+        tlb_flush_range_by_mmuidx(env_cpu(env), range.base,
+                                  range.length, idxmap, bits);
     }
 }
 
-- 
2.25.1


