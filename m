Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429A4B0448
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:12:18 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0ob-0002wn-J3
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:12:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0jc-0004OH-UJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:08 -0500
Received: from [2607:f8b0:4864:20::636] (port=39933
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hp-0004Li-Da
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:07:03 -0500
Received: by mail-pl1-x636.google.com with SMTP id w1so742565plb.6
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GtHWBu/qD/0bUllW5Gw8BHbTDtQN4Yofcww2tVSz2tQ=;
 b=kCkF8KGNhRNZoC5qieC/U/Lg9Y1J+IRE1/GYMka6glUR0MKjNGrCBltLzLbuc5XyL4
 CUnknBGzSBwkiLdjW20WXSf1K+2WSwfeYvTGlQHUGZU96Wb6bo/XfonLWPyCGHpnei1g
 3+NBx1RGIgyFI5MNkZI2AE1QdxY91F6ewXtA6Ed/lYtnhC6CNOVsRXl1NW0v8o6kgyJ/
 MPRfsnaJWwoRjLluv2iTzVitr7gC1H/sfkCo1zn6L339XGt6vm8kgXHXeiFmmM561gWm
 gXV/rdd7CNos0pZv5zdS6euyp+Hx4xxUi3pC9/Le2ocGeqIPvw553eOufo2NTfbPQ8or
 CrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GtHWBu/qD/0bUllW5Gw8BHbTDtQN4Yofcww2tVSz2tQ=;
 b=QMDaOEZc4Sm755Fo9rpGW2e/XpKjKrnn5jxNKDl5fTPK8TjuafNCnbN7ZpGSqPba/i
 TnGzXCFOAC2Eq8eCoDG2pl/Yl/FDejDDQFbRnykfJFBBeo/K+F+jqxC3fVv1VgUbwyoC
 rngzth2miZTI+jDX2zZDCPk4Hh0DW1frraOUNquvLbsOt+9iZ+JsBIfkf3ai81kLi4jH
 Sb7PW3TPME8KUyEbmQgWftN1Ps+5L09G1t98x8NZ0Bxwj902MQdPAOXqpelA/e181Qlp
 HeHzQjL9Nu5ZwOIMaw6SZeQlak2fd27ub4WMQxTuBUEe8uMEGx2d+ttde2K9IWBQOPDL
 ZDBA==
X-Gm-Message-State: AOAM531/d/4Mx+RS6wrCiMlQ+pCZJxR4wGJp3Zdtqai3+DeZyXnJdFEu
 AnS0XrCkBF2cxJXnSLv03cEKYVXprbUua5tY
X-Google-Smtp-Source: ABdhPJxWPEO53thfISXMnMYS/I7k5W7LAcD2DsY5unofEUdwapNVEJb8WpG0ayUycsKl8L0P+QKzXg==
X-Received: by 2002:a17:903:2306:: with SMTP id
 d6mr5018868plh.14.1644465906216; 
 Wed, 09 Feb 2022 20:05:06 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:05:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] target/arm: Introduce tlbi_aa64_get_range
Date: Thu, 10 Feb 2022 15:04:20 +1100
Message-Id: <20220210040423.95120-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b1b1b2611..8b1899ceef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4509,70 +4509,60 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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


