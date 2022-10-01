Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F65F1DC9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:41:25 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefYK-0000W2-Am
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHb-0006lJ-1V
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:07 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHY-0006FR-Fz
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:06 -0400
Received: by mail-qt1-x831.google.com with SMTP id s18so4343014qtx.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CxZpo48Pit+l3tJZfLwPPiYxT3jz9P+qHlIFLFC1mV8=;
 b=oXEGdWoMRe4iYpWE5nrYbr9Ik915bZcmTV3psq9IFc24lLmWYsLo01Og3XRa+pis0C
 Kjll2Ej0WMH60e//n2LE8MalqLnm8GxSFLc2H2Twk3ZADMSVJt8JzOx1KbOKxBtvnPqA
 DWbfdZ3W0IPgHyERYdmJBxONyzB/9XU6CRg6m1DUuRzkV1pb3r3cYYJ1aFbPQtiSu6cF
 UE62myKPIF4eoVl3AnbAL4HkNd1begnzX3hrPxXXpJf0keqX1EtG0a764px/6tBFqO2l
 lGN0gEqtcldSHyOr0/Zo9Ub8Y4wC/Oe0seGDcGGeFidsbKkOT0vwUAq+7dn05htI66mv
 YaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CxZpo48Pit+l3tJZfLwPPiYxT3jz9P+qHlIFLFC1mV8=;
 b=TsxRpef8kkbv6ik+6u25wlxnM6+vCSWz/dqh1jg2bcsfL+ch95LPXYU/Bp1UIM+hQk
 d/BIl/RFWb+lonMakoZ6H1V4VV2+ErzGB509+3KeWcEb/flhJTCyAjq0DM170fj+Li9U
 afngHKFkwksSRtzo8PlZma82DSKohtAcb9IYm5YsmmicyZyoSOR3QBi25rEWkcHuibfc
 RloQ46E5fM/31ODQ/KpWgQEyy1u7JKyoAOTr3F4nWe8vnSD8NJhgaYKs26IluhAQvek7
 o69w+SN/wTlpeWTzy9nC7gmpEbE5pTSMcpSL/2o6b3aaqJ8AOdnRwJ1Igd+yos33EZW4
 fR9A==
X-Gm-Message-State: ACrzQf3fokHxVCd3SdMWB7rajTN6z/Wo2k30PVgkeo4Z3OLS4c8xivAn
 oSyav4Sr+aVeY61dp7GjifrMoXbp5tBmoQ==
X-Google-Smtp-Source: AMsMyM5wpI6H3pKCDzex3Ilvv+jODyl//eBroOZT2KrdPwV7hxxPw+BHwHP1sP9JAc89TCmYy+wqvw==
X-Received: by 2002:a05:622a:1790:b0:35c:8450:d9e4 with SMTP id
 s16-20020a05622a179000b0035c8450d9e4mr10908000qtk.130.1664641442177; 
 Sat, 01 Oct 2022 09:24:02 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 16/42] target/arm: Pass HCR to attribute subroutines.
Date: Sat,  1 Oct 2022 09:22:52 -0700
Message-Id: <20221001162318.153420-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

These subroutines did not need ENV for anything except
retrieving the effective value of HCR anyway.

We have computed the effective value of HCR in the callers,
and this will be especially important for interpreting HCR
in a non-current security state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2f0eeee161..a0dce9c313 100644
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
 
             /* Check if IPA translates to secure or non-secure PA space. */
-- 
2.34.1


