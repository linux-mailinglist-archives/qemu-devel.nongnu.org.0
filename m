Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340575645D9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:37:06 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v6H-00018z-62
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuu-0007UR-CS
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:22 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uus-00068O-Ki
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r66so6267364pgr.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4Io0NttM84DvQuUVRsNxLzntenIkEejvm9D1CsIfhI=;
 b=MLGQpNsLcdEJI6osXP0Sb8A018tjzXnbwdR8Ec5KTeOvyRyzBvmrpQzFI+OET9xaPD
 Gx2PtvmDWI1kGmSx+t0qfFsoy5W7sZXBFRBQbqkPvP/HnRNqYgYA+3Ndio2x48saFlvA
 mwcfq0f3QbhbRZVl5TW1IC2VtuX1pJxvm0L2rgNk72KOaCZIwlNjGZ9leQmOlRHYg12k
 ZuwXEZkgZtP09LJzNS6MlDiXpoNA+Y4rSWIWjBBX/PA3FEsCc1F5TtG5GhEWBoQbPuzU
 fhGiygH4JQE0AqThqHpJl4VaKYi+fZlCG8HhfwOlh3SqfsoiEkYrFV67ZTexiXnZYAeQ
 wx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4Io0NttM84DvQuUVRsNxLzntenIkEejvm9D1CsIfhI=;
 b=2a2/PKqARj8lA432b6dvSbGFbZgnCCfGqf408gyWrJxZ9v97nSMH3IAO4trtCVPkp7
 BMKapkb84hrvJfTj71OZzWjj67Gb6gfnflo+6ST2csTISKPaghZYBDxaBEm5AKz/jnAz
 BauShSAcBzu5OQNr1eWZaXfs1Cj27oyu5VhtKVnNwuQxGiy+JUwj/PzgEISfxt82ZbIC
 qmqEHfrzZzheO/jT9xz/9oXHUaKI4efuZbBVKKs7hGED1oRXiTDZNSZFXfAeDwjjS5he
 HkpQhaDqhb0Zsqx2Qx32DSwm1JkxlFujicZ7ee/lTLPBSUKM59EumDv//vlTE17/6BC5
 FisQ==
X-Gm-Message-State: AJIora8+iFbsLbxSqPCTfv8xxrZM/8ZhclsZSyTk87NDdkExexbp5PxD
 AAhgKL1+Lyy843nNLUcpp6YTcFCS4YcRxa9u
X-Google-Smtp-Source: AGRyM1sv8jQeVnGSZW/hsGIu2gQZbUcHzvB3WSaaIgAgoxo0YCSLfQv/0XaM76aot/b5Y6ljY/oXrQ==
X-Received: by 2002:a05:6a00:cce:b0:525:5209:c925 with SMTP id
 b14-20020a056a000cce00b005255209c925mr30075224pfv.59.1656836717341; 
 Sun, 03 Jul 2022 01:25:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/62] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
Date: Sun,  3 Jul 2022 13:53:34 +0530
Message-Id: <20220703082419.770989-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

This can be made redundant with result->page_size, by moving
the basic set of page_size from get_phys_addr_pmsav8.  We still
need to overwrite page_size when v8m_security_lookup signals
a subpage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  4 ++--
 target/arm/m_helper.c  |  3 +--
 target/arm/ptw.c       | 19 ++++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a817acaaf4..f6a9b963d3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1143,8 +1143,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
+                       uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 69d4a63fa6..01263990dc 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2806,11 +2806,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     if (arm_current_el(env) != 0 || alt) {
         GetPhysAddrResult res = {};
         ARMMMUFaultInfo fi = {};
-        bool is_subpage;
 
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &res, &is_subpage, &fi, &mregion);
+                          &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b012577f17..5274d0b304 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1697,8 +1697,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
+                       uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1715,10 +1715,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     int n;
     int matchregion = -1;
     bool hit = false;
+    bool is_subpage = false;
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
-    *is_subpage = false;
     result->phys = address;
     result->prot = 0;
     if (mregion) {
@@ -1770,13 +1770,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                     ranges_overlap(base, limit - base + 1,
                                    addr_page_base,
                                    TARGET_PAGE_SIZE)) {
-                    *is_subpage = true;
+                    is_subpage = true;
                 }
                 continue;
             }
 
             if (base > addr_page_base || limit < addr_page_limit) {
-                *is_subpage = true;
+                is_subpage = true;
             }
 
             if (matchregion != -1) {
@@ -1793,6 +1793,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
     }
+    result->page_size = is_subpage ? 1 : TARGET_PAGE_SIZE;
 
     if (!hit) {
         /* background fault */
@@ -1968,7 +1969,6 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
-    bool mpu_is_subpage;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
@@ -2031,9 +2031,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            result, &mpu_is_subpage, fi, NULL);
-    result->page_size =
-        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+                            result, fi, NULL);
+    if (sattrs.subpage) {
+        result->page_size = 1;
+    }
     return ret;
 }
 
-- 
2.34.1


