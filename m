Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA4B56462C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:11:40 +0200 (CEST)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vdj-0007AR-SY
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz0-0007zZ-B9
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uyy-0006eZ-IN
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so6730402pjz.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=27Wz5DSCW8ENXu7065ZoRBnr2V/wpxEQdmpGVTXjexE=;
 b=Xu9jo53rFlJ5Dh9QjQrdUNB4WTXW4vg8+1m2VgkVZW/YcSpGmTbvNArlRlVqniHUWf
 fWV/Is4uoz2xBBWB/J+k7mVXneuqo2t/ss8fYS4j6AdjSy/miy1CG6XTuScaYncPD1Le
 qag4k9osKMzhcF0E4p7i/7JhWfjgaRo8ePEiV2MbbpSgR2jUWNz3N27pwr2jtQSOzOMz
 0wQDlJ3G6fDguWsETHVFy/XRqJMmFZYPAxIgSXfg2+4saCQA6edpozimCOOUG9bdWw5b
 PolXg2NbstWN+C2ayLOGBpvgABBFZcCPl4Z3EFGBpHN0E/5TcnHQ/Qy9aimOm6V3kSmS
 ZXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=27Wz5DSCW8ENXu7065ZoRBnr2V/wpxEQdmpGVTXjexE=;
 b=K0M7ACqa2DkzAJaUY/vv1WseDjCQonZ7PhJRN5Jp/OfZcl9Wk768LTmdQALtBhR2GZ
 b3ItCPUoxuFvTF7HSBUIWMMT/yLcNuvJn2W9f2CVRQt4SMf+7SMAWCX9jzyHYxo1TJX+
 oXT1APcKN5QF9OeXJPaOWV2gR9qITRFsZbC6/9BVWSiuGr5uLwnaJ1TNSBqphzUgHmia
 hJz2Q7B2P9Eu5E88R+1ckWOanpo5CUbLgoLf2+t2IKj9pD1zVvzX5OhsFKb8xjjdLskR
 9xtuA+hvYzrjDk2aw6rEQtkeebpoYHxHvH0+34Ac+tlSEHozNPuqMKi69dK7gyu4VR9P
 7c0g==
X-Gm-Message-State: AJIora8S16G4ZH3+qpVSbLC+tmegOpToRb3OPnulVM968FDiN+9RI5Ij
 FKXWJ5DjKTXgfgmb9IKWvKKa8sXcZ+9EG4cM
X-Google-Smtp-Source: AGRyM1sK47vISjBMgMAsQ2A9a5G54Uk6si9b3JyWk+czVTIpzQZgxgYABy4B4DwKb4Wk7SnpN/N1sw==
X-Received: by 2002:a17:90b:4d84:b0:1ec:aa85:b8ea with SMTP id
 oj4-20020a17090b4d8400b001ecaa85b8eamr27145064pjb.194.1656836971216; 
 Sun, 03 Jul 2022 01:29:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/62] target/arm: Pass HCR to attribute subroutines.
Date: Sun,  3 Jul 2022 13:53:57 +0530
Message-Id: <20220703082419.770989-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

These subroutines did not need ENV for anything except
retrieving the effective value of HCR anyway.

We have computed the effective value of HCR in the callers,
and this will be especially important for interpreting HCR
in a non-current security state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 93c533e60d..a760ab86c5 100644
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
@@ -2055,14 +2057,14 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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
@@ -2108,12 +2110,12 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
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
@@ -2213,7 +2215,7 @@ static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
@@ -2240,10 +2242,10 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
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
@@ -2309,6 +2311,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
+            uint64_t hcr;
 
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
@@ -2354,7 +2357,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (arm_hcr_el2_eff(env) & HCR_DC) {
+            hcr = arm_hcr_el2_eff(env);
+            if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
@@ -2367,7 +2371,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs1.shareability = 0;
             }
-            result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
+            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-- 
2.34.1


