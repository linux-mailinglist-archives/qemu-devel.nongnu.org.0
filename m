Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BE6A4F65
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVU-0000Av-Lv; Mon, 27 Feb 2023 18:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVF-0007wa-OB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVD-000150-Cg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:52 -0500
Received: by mail-pl1-x635.google.com with SMTP id bh1so8468423plb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXUGcnVq4p+V6/QgEEXXaOcAhNQGJeh+oZJI6zT9+Xw=;
 b=SgZmI9CvnIHXSfJM1HQCZTw17NYAZNbE6CBN8gaikgZS/xfwVyw6pLa3N4bq84vpoy
 g+IhAQpW7nGipAmihyNFkO+8Y8GNNNSs16owSOms5OONZ8Or2KfxlI1Uc4iTyZsYzm/D
 FVmRfPHT2jUParQ9P3xzX9+/6H+O0P8cRQDHw001ABIgJ6hkq/kDVSaPtjAjMq+oeJZ6
 UDtSZw1Cm51h+LL2mpgR+m9fC0yaxZ30g80qI7d7fChUmNHFnwQZss9+Z61sMy6pLHSz
 AYbu0mYEgG1gn2dUNcgEpH8jbE6586t/7knJnsFyOKUWF8uMJJRqSLGpXkQEgr8sN9W5
 kGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXUGcnVq4p+V6/QgEEXXaOcAhNQGJeh+oZJI6zT9+Xw=;
 b=naniIq/uLI48CNMT0QxHUm0mTmBDqwpdzx4r6hoXziirDhPMGpoixYRKFJ9wYmkMSt
 JitqBSJBvjw80HjUH2SNR4hMIz0/0RHPzVgnAuJ8RHa6dNff3KfRROPoo4WkNbasI8yv
 0EB8lYskiym8pRmB9UDwR1yVeX2A9nLMcLTk22pUmsivL/SHfchftt/a+sFh+4Ug7OCI
 +cLfVV1kjeD7/TyJOWgICEfvc94A5C8mkbOWV0gaVK4fQh/5hiRBnlYVjRCtH5ppl1+T
 OTskOeyMkcziq02+q2/T9IhdVxtfb1K40h81vH0qchcATcBSAa2a2Kd4j/gevPh8e+xK
 9nJQ==
X-Gm-Message-State: AO0yUKUWipTGThZTvkviLhsT5oygiWHYQcCCFA77++umLI6vujillCwK
 ayFyZJKtg8akJXK1A0e9vU9mNyxJh2qiOQj8SVE=
X-Google-Smtp-Source: AK7set94q790ou54rMvpg/3n5o4NuVcXUrOXpyucBcr1+GxpEO9jyc5v4BcHYOVUM3LHPIz5c00LNg==
X-Received: by 2002:a05:6a20:4287:b0:c7:13be:6dec with SMTP id
 o7-20020a056a20428700b000c713be6decmr1347819pzj.15.1677538910029; 
 Mon, 27 Feb 2023 15:01:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 15/21] target/arm: Move s1_is_el0 into S1Translate
Date: Mon, 27 Feb 2023 13:01:16 -1000
Message-Id: <20230227230122.816702-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of passing this to get_phys_addr_lpae, stash it
in the S1Translate structure.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0177dea0cf..eb3f37495c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -22,6 +22,12 @@ typedef struct S1Translate {
     ARMSecuritySpace in_space;
     bool in_secure;
     bool in_debug;
+    /*
+     * If this is stage 2 of a stage 1+2 page table walk, then this must
+     * be true if stage 1 is an EL0 access; otherwise this is ignored.
+     * Stage 2 is indicated by in_mmu_idx set to ARMMMUIdx_Stage2{,_S}.
+     */
+    bool in_s1_is_el0;
     bool out_secure;
     bool out_rw;
     bool out_be;
@@ -32,8 +38,7 @@ typedef struct S1Translate {
 } S1Translate;
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               uint64_t address, MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
@@ -1259,17 +1264,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
- * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
- *             (so this is a stage 2 page table walk),
- *             must be true if this is stage 2 of a stage 1+2
- *             walk for an EL0 access. If @mmu_idx is anything else,
- *             @s1_is_el0 is ignored.
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1602,7 +1602,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             result->f.prot = get_S2prot_noexecute(ap);
         } else {
             xn = extract64(attrs, 53, 2);
-            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
+            result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
     } else {
         int nse, ns = extract32(attrs, 5, 1);
@@ -2824,7 +2824,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMSecuritySpace ipa_space, s2walk_space;
-    bool is_el0;
     uint64_t hcr;
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
@@ -2849,7 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         s2walk_space = ipa_space;
     }
 
-    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_s1_is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_ptw_idx = arm_space_to_phys(s2walk_space);
     ptw->in_secure = s2walk_secure;
@@ -2868,8 +2867,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         ret = get_phys_addr_pmsav8(env, ipa, access_type,
                                    ptw->in_mmu_idx, is_secure, result, fi);
     } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                 is_el0, result, fi);
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
     }
     fi->s2addr = ipa;
 
@@ -3045,8 +3043,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.34.1


