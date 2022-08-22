Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819B59C383
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:54:47 +0200 (CEST)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9lG-0002lt-2R
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LL-0007SH-9j
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LF-0000hK-Lu
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso11648260pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KQgnmJmdBnU/p9031agTMRXsX9duSik3VaZXmB+O4Tc=;
 b=tKaCPwZ169NkHNwnExeSmdk9iFrMlcgTKfMpwM7GdtmWLRDxaNY9jHcIlNFlCf8Uin
 Y+Q4dUNU5m2qX9zS4BtUR2VjWCdSjH6eFg6AmOvLsxHr+3s+SmYUVAbR+HyII/Ndqg2I
 Xqyo8FQTsKv9tD1KztN7pTwjeBIcSNEXu7zcTwagrnIcwGLoVzCSKx4J2c3BuVQeG78Q
 Jm8srFWCAQ3DI04k7BtCyDBp+Z2t5AMqDPKX4ZVlnfhBlDpY4H33hGKvuyAe7l0s8cTP
 WhKWXXMqXc+sK9MHWjxmknUqSH0Q3dD2Jyt2JdEtmYsw/KbO1eAV39r5a5X5KK+JhWu8
 Jd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KQgnmJmdBnU/p9031agTMRXsX9duSik3VaZXmB+O4Tc=;
 b=bQCWtQmMOd3QbnCrC+qacx/30aCJC9aVcyq6iQ3JcqnqrvApg6OcZTfJfZKRIVD/5Y
 TYgIAxAzi6/V3wl8zzKRmDMHBy+1b/JXdBTznhHlIjcqyWCsqNtbmysAGL4s5Ajsaq3c
 MFBCIWXbzOBuIOqcXzMAj0y1AFG1TBXwCraPQ1wmG3qNafJ2Y94VHVnvGPSD7R89Of7O
 WqU5qBc66/wkgD/0TObo2nv5aJp1zr8ZI9KPrGp/sNExzL3MX5IAtEkb1FjyzSn6McrN
 IwoUlVPp6XIjapKkDWnuf9T2lX/uOXVIT7dJFoPyL7GCmCvxFqMgCOwKJNIcQTNN8Buu
 y+kw==
X-Gm-Message-State: ACgBeo2SO9VS6tHXR9DXC2xbhUt2EjpfQFBXKrs9BY84ASECTTVc8Ocx
 1ZVJBMip3hPrJ8EITpU8aE5Z7Kh2beizwQ==
X-Google-Smtp-Source: AA6agR63AUgFc4jKIVM5zkvFTqgJ0f2yFpliWXPAIF/zLk7yXZXzeC0d/FmKpSkyuGDAG7Gef2C+Tg==
X-Received: by 2002:a17:903:40c9:b0:172:e8aa:96ef with SMTP id
 t9-20020a17090340c900b00172e8aa96efmr6154212pld.59.1661182070709; 
 Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 10/66] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
Date: Mon, 22 Aug 2022 08:26:45 -0700
Message-Id: <20220822152741.1617527-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

This can be made redundant with result->page_size, by moving the basic
set of page_size from get_phys_addr_pmsav8.  We still need to overwrite
page_size when v8m_security_lookup signals a subpage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  4 ++--
 target/arm/m_helper.c  |  3 +--
 target/arm/ptw.c       | 18 +++++++++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6786e08a78..fa8553a17e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1152,8 +1152,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
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
index 48c9363159..ec66ba6777 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
+                       uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1722,7 +1722,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
-    *is_subpage = false;
+    result->page_size = TARGET_PAGE_SIZE;
     result->phys = address;
     result->prot = 0;
     if (mregion) {
@@ -1774,13 +1774,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                     ranges_overlap(base, limit - base + 1,
                                    addr_page_base,
                                    TARGET_PAGE_SIZE)) {
-                    *is_subpage = true;
+                    result->page_size = 1;
                 }
                 continue;
             }
 
             if (base > addr_page_base || limit < addr_page_limit) {
-                *is_subpage = true;
+                result->page_size = 1;
             }
 
             if (matchregion != -1) {
@@ -1972,7 +1972,6 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
-    bool mpu_is_subpage;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
@@ -2035,9 +2034,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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


