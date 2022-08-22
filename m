Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7AA59C4B5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:09:46 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAvo-00085y-VO
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LW-0007sZ-MJ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LK-0000ja-0k
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id d10so10236078plr.6
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uZ0BWDD1zBt6bJvdrc6PkSh3qsVXaWKa3Xv5dez69Ms=;
 b=fOP1LlOGMN6mfCeMpw9nJBqwfjvPhESkLcrYvh+OazEJdXUlHcvJTmaSnUK6+6cJO3
 Vf6Smv5bMK0wdtD7sLggtNW4sSUtKIT8AZZk7Fpnblm3TilKfzvXOxs0C6/AmbiGRakO
 uwRz+FDSUlz4KMcWv3OmX5YI7kj0kwIIrjAQFOM9KX8VcuYrkQ3A+KisvkUjwTiXd8Lz
 6NRSMe7cYwpU/20N/Cg3xUYoh8Yog/y3SvAhhh6eB2ZncWmOSQauDaBxndFUicE0Kr4I
 Y8rBRJ74QzQALAg0xeagec3xX5W5GE5uFjzKQERf4QzCd+VSdhfDEVgbTJ8HqTYuyYof
 Gl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uZ0BWDD1zBt6bJvdrc6PkSh3qsVXaWKa3Xv5dez69Ms=;
 b=0eq1f+asVWibHDgkykV9TGveV3OneZTLuUDzKszzCKlnKRuWHCZq8CNK525jAJ9Xw5
 OZxVSLBBZcG73g+Ygj9aohnIJj5Qn9l4wxLaRpT8tPdrsVcFJxU6fGLLdKpsmYKBICT5
 Mj7/rd3psxWLGDAc8lFOUJhtjU5JQZ9qG79wbChVu/FDEdnGU/QBZxDnC18WSHB+7Naf
 IuKW+X4UGOC3kQD5rfEI4kKm9ohDSQ18pZCpbckhz50G53/l7q7y6IpZi1ixeZPMp170
 2Y2YL0vkWmqOkPCiK25NeX0jw90hfQPACpjVKi7MC9zUI7QWmWk0xXAVh1JdLlhsmMDr
 8PjA==
X-Gm-Message-State: ACgBeo0xKemqcnrzFzD8kgBXPEvVHggpO5A8Iwk02zZHiT42ZCD4pACr
 m1Za3iIomWcg+pFt9fr27VycvAPSDZ7/0g==
X-Google-Smtp-Source: AA6agR5c89mKcIzyl0OHtBqzdZOMLoNa40DI4GWtlW+jFTVny+GrJPN0iHcID2KDlrDbNLk1+Hnk9A==
X-Received: by 2002:a17:902:70c4:b0:172:d8f5:b4bc with SMTP id
 l4-20020a17090270c400b00172d8f5b4bcmr9697659plt.32.1661182076515; 
 Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 17/66] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:26:52 -0700
Message-Id: <20220822152741.1617527-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Remove the use of regime_is_secure from get_phys_addr_lpae,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b7911e88c1..e95fd6b0d9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,8 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -207,8 +207,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         GetPhysAddrResult s2 = {};
         int ret;
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2, fi);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
+                                 *is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -965,8 +965,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1183,7 +1183,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
      */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
         uint64_t descriptor;
         bool nstable;
@@ -2334,7 +2334,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     ipa_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2502,8 +2502,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+                                  is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1


