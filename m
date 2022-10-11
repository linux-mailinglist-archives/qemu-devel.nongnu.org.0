Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4D5FAB34
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:32:13 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi604-0006xm-II
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nr-0002NT-Rk
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nk-00031I-MT
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:35 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x6so11999983pll.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuiahaoEiVXlEWMWoZrC9RsYeFhfjxrmLG3QQS2jVro=;
 b=GiM3QLQVJoJRttJ8CKLTLc0SgJ7+E527/RkG+z2N+oeoz7/4LEpHKgCa3K4u+/aMGY
 esXyczKHzLHOsYxAgKk/pvGU8/O5noPw5KN9KlxlX0S/FMGNaCrLb8PxUo3KNCe862oe
 TNNnJSEQderXVV65LEFZptBXmhLk1cnbjKcv4ZoSmElD18ITH+mONAFj1nJA+WhRxEVJ
 sO4oMA0c+y78uaYOkggtR7Aw1w8HzV/IBe3SvD0NTtO3Tw5m+z1xp6OgJ9lbQxKBI1VP
 Ziav712riKXjoRZXX2iFkemKeTQb+jj6wbU6PSSltq3dZLmq9aW8EefOyZDStjBbnY9N
 bxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuiahaoEiVXlEWMWoZrC9RsYeFhfjxrmLG3QQS2jVro=;
 b=f3+geYeoGjlb25a2LK/Z9k9tBSSO4AUzKwU1I1qqsr93H6+kDgM7RyYtj4OdjS06on
 viQgBY/nCm9Mck2ODY87f0IxjLFIOOffoGecc9OBc7maTd/Urgdrli+chxhZ1VmEIAAG
 O39JH4stSqDv4DNScAdb0bC+QIzTjCtfM+2ETjoNBDH+8+aEv8k4MW/5dFqxjgB96y7A
 88NZ3F95Hfc7t9EbAusgNMpfeMGDPKHq0setad2ESZEoIHhRUH7mPHXmVEA664BUhuS0
 +D7jtMUsVwH5s2Y3CFP7QCC06Kd5tQkGME2Rp1q/9MXSc/qeFgOq3Th8Tko7+frb1O1F
 pqKQ==
X-Gm-Message-State: ACrzQf1/6rpZtRLdqqTdyiL5vocUGYz8+AgGJsmAadHZhaDZ2/IKxtlU
 NcjN739gtdwL0r2B8UFvpfH9l3SdD7lJkA==
X-Google-Smtp-Source: AMsMyM7uED4wdpqBjZW956Xkyz+Yk4nsCsNvOpJVcjsCW21rPBbA9cwlLCKYRFOHqKcOYUte3iiHbg==
X-Received: by 2002:a17:90a:e7cd:b0:20a:c658:c185 with SMTP id
 kb13-20020a17090ae7cd00b0020ac658c185mr24710531pjb.114.1665458366555; 
 Mon, 10 Oct 2022 20:19:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 08/24] target/arm: Plumb debug into S1Translate
Date: Mon, 10 Oct 2022 20:18:55 -0700
Message-Id: <20221011031911.2408754-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Before using softmmu page tables for the ptw, plumb down
a debug parameter so that we can query page table entries
from gdbstub without modifying cpu state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add debug to S1Translate, and plumb the S1Translate structure down
    from the very outside.  It means that S1Translate is now perhaps
    mis-named, but it also eliminates the "secure_debug" function name.
---
 target/arm/ptw.c | 55 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dee69ee743..8fa0088d98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
     bool in_secure;
+    bool in_debug;
     bool out_secure;
     hwaddr out_phys;
 } S1Translate;
@@ -230,6 +231,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_secure = is_secure,
+            .in_debug = ptw->in_debug,
         };
         uint64_t hcr;
         int ret;
@@ -2370,13 +2372,15 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+                                      target_ulong address,
+                                      MMUAccessType access_type,
+                                      GetPhysAddrResult *result,
+                                      ARMMMUFaultInfo *fi)
 {
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    S1Translate ptw;
+    bool is_secure = ptw->in_secure;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2392,8 +2396,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             bool is_el0;
             uint64_t hcr;
 
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
+            ptw->in_mmu_idx = s1_mmu_idx;
+            ret = get_phys_addr_with_struct(env, ptw, address, access_type,
+                                            result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2413,9 +2418,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 s2walk_secure = false;
             }
 
-            ptw.in_mmu_idx =
+            ptw->in_mmu_idx =
                 s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            ptw.in_secure = s2walk_secure;
+            ptw->in_secure = s2walk_secure;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
@@ -2427,7 +2432,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, &ptw, ipa, access_type,
+            ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
                                      is_el0, result, fi);
             fi->s2addr = ipa;
 
@@ -2534,19 +2539,29 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                       is_secure, result, fi);
     }
 
-    ptw.in_mmu_idx = mmu_idx;
-    ptw.in_secure = is_secure;
-
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, &ptw, address, access_type, false,
+        return get_phys_addr_lpae(env, ptw, address, access_type, false,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
 }
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
+{
+    S1Translate ptw = {
+        .in_mmu_idx = mmu_idx,
+        .in_secure = is_secure,
+    };
+    return get_phys_addr_with_struct(env, &ptw, address, access_type,
+                                     result, fi);
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -2595,12 +2610,16 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    S1Translate ptw = {
+        .in_mmu_idx = arm_mmu_idx(env),
+        .in_secure = arm_is_secure(env),
+        .in_debug = true,
+    };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     bool ret;
 
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1


