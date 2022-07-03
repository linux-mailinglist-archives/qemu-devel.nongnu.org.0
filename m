Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B456462A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:11:25 +0200 (CEST)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vdU-0006V8-PY
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvr-0001cW-D7
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:19 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvp-0006B6-RB
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ju17so1428042pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvXUGU1iRA1atVwXCiqqvbPFvrWHZ4nIvxHqNJBxHmA=;
 b=jCv21o8u9ZXAXS4v1JkKykW4Pizq6aQb08a7B7UmKzECJgRinTvI97AYrEgzqLkUDy
 5Kblir2IRsi6+mZr5O/vMYnLZQ1/FylqbOpIb+ISOg+k7d0f3CNhMaVsQ4pGjtcSHCOL
 8vhuYix47F7peUArdxjszDkv8G97F4Wh6kfERMWR84ys2CSVFcw/qZ6HMLXRc3DD+XVU
 BqZ4zJOxugc2Zp2zvkmGhstgKZLsWwOHOVuvcGbe5eOovLS5WBnSzLXNtMBIWYmWH5H7
 iNclkEHcbljNDLr2sfcPrTFXNoNtOAaISMboB9uieI9/ZBk9t8KSrJWhRpka2G/7eL1z
 KtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvXUGU1iRA1atVwXCiqqvbPFvrWHZ4nIvxHqNJBxHmA=;
 b=YXx+pKZaTvyjPFaDl/4AIBn+eCU3RpjziGiPN66oxLY+BYnMaqEISVO0iPJpqBwtzt
 W/KeOOBKV2A6qJ48Pa1KR7lhV+GSO8+jiofPEqYGMRqa1dTICSPfASMc4cRF3NGimG+i
 D0Y5APMkudkjmqDfwRf0nA8/WS4vwy6QCCRAbMveTLnUQTY25nZoNLGauMyFF2dxPBzs
 aGPE5NvshHIJB8dDFjIYcfp1ukGHcdsOlATmSVh1DCWeuwK19UB1GwNnDyY3aspbvyTY
 PiWVFyFHJCImNce2rFVpSMavSOptR4tS7eTNuvbV18CrSG2+0VVRgJxM8UBehSb8I/ak
 6H0A==
X-Gm-Message-State: AJIora8hEO3ul2Io8TvF505+VJfrmSox3qDXYueQz9S4fE0n72kXUA7F
 VxW7BkSmb/OfofByyj1QDcrURXnyV4NjArzU
X-Google-Smtp-Source: AGRyM1tU9uzshgc5s2nETwvV1JAK/EXcPlG1jgNYFWueSXVyIGzkWkm1g2J/+ZoEEAd2kQbO+gj1mw==
X-Received: by 2002:a17:903:283:b0:16a:6db9:3f02 with SMTP id
 j3-20020a170903028300b0016a6db93f02mr29271865plr.173.1656836777060; 
 Sun, 03 Jul 2022 01:26:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/62] target/arm: Hoist read of *is_secure in S1_ptw_translate
Date: Sun,  3 Jul 2022 13:53:54 +0530
Message-Id: <20220703082419.770989-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f76a8e931a..12288ac365 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,26 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
+    bool is_secure = *is_secure_ptr;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
+                                         : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +239,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1


