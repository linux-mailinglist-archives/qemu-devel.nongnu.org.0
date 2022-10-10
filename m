Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF655FA04B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:40:14 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtwz-000639-OK
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl7-0006Rc-Ee
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl4-0005b0-VK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a10so17266986wrm.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B/NSK08PHYfCbr/Iig3swg/Ik7nPMnQ9pNlEcYvtrnQ=;
 b=kM8guZuhlYewVHNy5wPXIy1fgQ4hLpND7GoPe36jKjL+s4qcx0HSCWpbMGnED28led
 L09U9kp82/5KhWw2XLsKqRxXEWIk4IXkaa4IOpFCJS9DxTyTuLnS2L/ncnrHisUxe4oT
 8sncrB5ttyGAIIrY2DzvYmXmCBUJdJ0G2GPYsP+ZUw/C8SUop4Y6yxxcj0hWXMPMFK4J
 kyp7anT+R6rm7Tw0CfjFKtfG21aehSXqrW/y3hk/2eiQmhxYt5f6bFq9uF4vWPM+d1XW
 eJcVQGApurCqXq9n8jWgWoV0h4F74JB3hPbumHsHOFtJ8wRkZeVkBQdf8iT19XOvgOda
 xaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/NSK08PHYfCbr/Iig3swg/Ik7nPMnQ9pNlEcYvtrnQ=;
 b=Dr7FcTvk7NomEo9D5iLCGcOGXTaanUsjL1/fJeyD5f+6S3Q6tONVjgd8QxLvm1IH25
 GeYIKN57p6evQEv+JUNbpNxqpxWPh+sv1KTIxl2kztT1Uu2EIo462NFfsanX4OhNFrtA
 pmF+N2Zypr5AHrly5UM1D/maOHJ6lYtrh4lwcfEQCpLjVcm2n/biZeavQFqe7izXLjR5
 xALbmdqtu+GtFFgbj571KxsIu+PlesgnLZIATImKgdS2xO9e6oKVfd4mAWSgylldoYIc
 1ZqQWY2/DTe0vnrtJal8Kh6DrHvkgELfhWFl8/Awb+QaZtAStYImsxVmP4dnNSNu/LKh
 kFJg==
X-Gm-Message-State: ACrzQf3JwkePjiunIgj408STWagGEc20EL9SVhZ1JvUFIVNc6yQZyMJB
 llHXA/OOdNf80OpP4XnPuWEc6fneX7ApSg==
X-Google-Smtp-Source: AMsMyM6tn5GEmfXpKT/+XHDmv2jt2J7kUkBjJswPhcxvKM3OOY/Ce9Y0RY7BFP+T6FZHsnwGsLzKLw==
X-Received: by 2002:a5d:6d8a:0:b0:22f:1ade:de87 with SMTP id
 l10-20020a5d6d8a000000b0022f1adede87mr8645580wrs.3.1665412073459; 
 Mon, 10 Oct 2022 07:27:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] target/arm: Pass HCR to attribute subroutines.
Date: Mon, 10 Oct 2022 15:27:22 +0100
Message-Id: <20221010142730.502083-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These subroutines did not need ENV for anything except
retrieving the effective value of HCR anyway.

We have computed the effective value of HCR in the callers,
and this will be especially important for interpreting HCR
in a non-current security state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7d607c2e7b5..b4fd4d3fac1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -186,7 +186,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
 {
     /*
      * For an S1 page table walk, the stage 1 attributes are always
@@ -198,7 +198,7 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
      * when cacheattrs.attrs bit [2] is 0.
      */
     assert(cacheattrs.is_s2_format);
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+    if (hcr & HCR_FWB) {
         return (cacheattrs.attrs & 0x4) == 0;
     } else {
         return (cacheattrs.attrs & 0xc) == 0;
@@ -216,6 +216,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
+        uint64_t hcr;
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
@@ -228,8 +229,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ns = !is_secure;
             return ~0;
         }
-        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, s2.cacheattrs)) {
+
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -2059,14 +2061,14 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
  * ref: shared/translation/attrs/S2AttrDecode()
  *      .../S2ConvertAttrsHints()
  */
-static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+static uint8_t convert_stage2_attrs(uint64_t hcr, uint8_t s2attrs)
 {
     uint8_t hiattr = extract32(s2attrs, 2, 2);
     uint8_t loattr = extract32(s2attrs, 0, 2);
     uint8_t hihint = 0, lohint = 0;
 
     if (hiattr != 0) { /* normal memory */
-        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
+        if (hcr & HCR_CD) { /* cache disabled */
             hiattr = loattr = 1; /* non-cacheable */
         } else {
             if (hiattr != 1) { /* Write-through or write-back */
@@ -2112,12 +2114,12 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
  * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_nofwb(CPUARMState *env,
+static uint8_t combined_attrs_nofwb(uint64_t hcr,
                                     ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2217,7 +2219,7 @@ static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
@@ -2244,10 +2246,10 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+    if (hcr & HCR_FWB) {
         ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
-        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+        ret.attrs = combined_attrs_nofwb(hcr, s1, s2);
     }
 
     /*
@@ -2290,6 +2292,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
+            uint64_t hcr;
 
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
@@ -2338,7 +2341,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (arm_hcr_el2_eff(env) & HCR_DC) {
+            hcr = arm_hcr_el2_eff(env);
+            if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
@@ -2351,7 +2355,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs1.shareability = 0;
             }
-            result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
+            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
                                                     result->cacheattrs);
 
             /*
-- 
2.25.1


