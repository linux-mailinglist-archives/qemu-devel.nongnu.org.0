Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6459C360
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:50:03 +0200 (CEST)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9gd-0004Pd-AJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LJ-0007KN-5W
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:57 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LE-0000h4-Fk
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:56 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q9so629313pgq.6
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5p0MI+QCkoFG04riom6naP42FW0W2gy0tzxTYjzHV/c=;
 b=r5edGVQjY40NoJaDLT8Yc07Zu9ctQ9tvVRzx8/i6vgECJPWwm7hqG5890on8mIzK43
 A6VdOE6NDTA9SYhQBJn8s4H2//9mkHstOqqgHPwhgGQ+ybiO5zkBsyN5UddACS2VFHV6
 zmhryJdlLxNP7wq2yHzZMlDiDYXuJCELQ1fg9iLNf8uY7XlSCHpBWc7gX6inTH6sAXOs
 W2WTnRhOecCSdGsSSHFNEL/V1792RZotAzYQw7gPrCSuUx+xo1GdKZjwpGroa8d9WTtI
 0uPDQHGHVf4gxMjX0u7/ZQ1N0pbr9o/Bws96GtsFwL52dCYibel/NM5AlYp02FoEAZeB
 ZHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5p0MI+QCkoFG04riom6naP42FW0W2gy0tzxTYjzHV/c=;
 b=jc36xC8tVNBYePGUdd3jiJIXodCFQTvctymMvJWEDcrBp72X+c4YAE3N1r6PLUZfF1
 USJdRJuuwoJkCO4a/Gdyd2L4kz0CkcBVP3Xpo0ngK898UX8WtlgjnC5VS9x5fZIldK86
 kkI1BuE3gXEHtyygEmIm4leEzvvijMcKAZb0QbkW7NZSf9ogFRaRpMntTfZZ65uSzPE4
 nyAuH9cJ2bmQlCLMR8/YanwH9ax+Bjff5hUkrozgsUrQA63TB3MUUoMW3xsu2J0u7i/T
 JimOzSwdiiDik5zmbN2s9mvDgDJ/N9YMrih7bHypBNlm7sT1xEPJYYxC+ihasIpZNuyj
 Spjw==
X-Gm-Message-State: ACgBeo3HNGmrmt9hOW24P4slb+0nTr2kIBJqIH8A9tkk7XiVG51hgEhH
 7+TUKzNncAF9rdfNo6+irorNfK8U8KnLrg==
X-Google-Smtp-Source: AA6agR7r/umPuuqRNtV6z4OLIlcmY8NGIjxdOXccHiiajIAuPDQXQEmO0JrlRguqQcpUbOFBSBavvQ==
X-Received: by 2002:a05:6a00:24c2:b0:52e:7181:a8a0 with SMTP id
 d2-20020a056a0024c200b0052e7181a8a0mr21310747pfv.57.1661182070170; 
 Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 09/66] target/arm: Use GetPhysAddrResult in
 pmsav8_mpu_lookup
Date: Mon, 22 Aug 2022 08:26:44 -0700
Message-Id: <20220822152741.1617527-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 +++++------
 target/arm/m_helper.c  | 16 +++++++---------
 target/arm/ptw.c       | 20 +++++++++-----------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 293e27b996..6786e08a78 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1125,12 +1125,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                          V8M_SAttributes *sattrs);
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
-
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     /*
@@ -1156,6 +1150,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       GetPhysAddrResult *result, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+
 void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 84c6796b8d..69d4a63fa6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2770,15 +2770,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     V8M_SAttributes sattrs = {};
     uint32_t tt_resp;
     bool r, rw, nsr, nsrw, mrvalid;
-    int prot;
-    ARMMMUFaultInfo fi = {};
-    MemTxAttrs attrs = {};
-    hwaddr phys_addr;
     ARMMMUIdx mmu_idx;
     uint32_t mregion;
     bool targetpriv;
     bool targetsec = env->v7m.secure;
-    bool is_subpage;
 
     /*
      * Work out what the security state and privilege level we're
@@ -2809,18 +2804,21 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        GetPhysAddrResult res = {};
+        ARMMMUFaultInfo fi = {};
+        bool is_subpage;
+
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &res, &is_subpage, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
         } else {
             mrvalid = true;
         }
-        r = prot & PAGE_READ;
-        rw = prot & PAGE_WRITE;
+        r = res.prot & PAGE_READ;
+        rw = res.prot & PAGE_WRITE;
     } else {
         r = false;
         rw = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 225405de3b..48c9363159 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
+                       GetPhysAddrResult *result, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -1724,8 +1723,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
     *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
+    result->phys = address;
+    result->prot = 0;
     if (mregion) {
         *mregion = -1;
     }
@@ -1807,7 +1806,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1822,9 +1821,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
+        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (result->prot && !xn && !(pxn && !is_user)) {
+            result->prot |= PAGE_EXEC;
         }
         /*
          * We don't need to look the attribute up in the MAIR0/MAIR1
@@ -1837,7 +1836,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2036,8 +2035,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            &result->phys, &result->attrs, &result->prot,
-                            &mpu_is_subpage, fi, NULL);
+                            result, &mpu_is_subpage, fi, NULL);
     result->page_size =
         sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
-- 
2.34.1


