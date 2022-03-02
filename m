Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D14CB0A5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:07:32 +0100 (CET)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWC3-0001Rg-Mg
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxt-0005s2-9w
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:53 -0500
Received: from [2a00:1450:4864:20::432] (port=45997
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxr-0008Sh-Dy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id p9so4646455wra.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i7la0k2eorJda0aIicEx+aLSW513Xo/ZYfhT/cVR5VI=;
 b=aO7EcNo1yNZb5ngWn+Fxlogzknw88bfn8E7A9sK7f4qmGt0aJNv6T6TPeATt8VVFqX
 wLuLSvvtpMC7er6lL0/RP7q5d1K7MVX+o6KiG8nP5ObuueM9dIjFJKe93dXYqr9I1x4l
 eI0THJLqy7SoVM9Hfwutm1zHKdE7RDRYCX7rXPor6qhxv0/VsPxKOksUzAomNAdkdZsb
 z4R95V2PthnVOp+w5zxUqQ9boPhhHR1XdpTolb8+2Nr+BmgENlS9/GyXMcHNCmN0DEuq
 KHVMh/hnpspRge83alZbR5n5wH4D//nv/oo3Sm4c/5VbYqzrSp8A6wlKaCGXrl014URv
 BOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7la0k2eorJda0aIicEx+aLSW513Xo/ZYfhT/cVR5VI=;
 b=Jh32GMDpQLbcAouKTCbb9ND9sIAZ6HyOtdUinDtIHB0GEHNPd4wDqOgKf6Sz193kyG
 ytZ0O21SzlfaTT1Qah8QxXUPoTgYqBc/52kzfGOH+EtxXgJi86hFevjuMhRbM6EJ27Nt
 cDvIIO3S+jaYk/YtUOV7Fu2BePDbMvIWyoY+Xt7ruQJTFlaTim8NeKqo1Y50AQnXWLtT
 FyjmLJ1vz2xRjAtEFpnlfntHaBnbgh307G9K4q92Ogq1bIeNJuzOLSy4Omy4oDTRIZbN
 t3vYn7Q00wpk33KzPQbVXR1Ku4TqV7KkuNZ6Q98STotdlbOmh+tZKNWT3M2YRvCl/qxc
 NwZQ==
X-Gm-Message-State: AOAM530auuX/80TcCwPA13GuHTxt6VQ9YYHdsgv7sGU4xtCzgiwqpP7n
 COIEX4t8Yx7w/cAxY1Nc+M0KNSdtksiOWw==
X-Google-Smtp-Source: ABdhPJwhTPM0OcEX6wZ5Xdx1p9sd9dqnS1UvNKUkdA0sx/K5SBXueqN5inWwVM3WV/j2MHfW8jqzlQ==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr23915795wrm.645.1646254369435; 
 Wed, 02 Mar 2022 12:52:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] target/arm: Introduce tlbi_aa64_get_range
Date: Wed,  2 Mar 2022 20:52:23 +0000
Message-Id: <20220302205230.2122390-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
returning a structure containing both results.  Pass in the
ARMMMUIdx, rather than the digested two_ranges boolean.

This is in preparation for FEAT_LPA2, where the interpretation
of 'value' depends on the effective value of DS for the regime.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 950f56599e2..31c2a716f2a 100644
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


