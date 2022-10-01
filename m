Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D685F1D9D
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:30:23 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefNe-0001XA-Tb
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH2-0006RC-Vq
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:33 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGz-0006Dr-7e
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:32 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r20so4337968qtn.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=t773ZS2LkVFwCoSMRlKqTFzA/pnkk1Ts0faFvUW3ikE=;
 b=fIcAYeOm9YcTeJK2gY64bWOaHy2X6wPoM0G/auDpVHgwHzrxfWiKO3WQ5cEpR41pDY
 VdBbzyCXqZLMxpPwhYJ1vf0y8dnwqOjBGgIxGJX2l71ciMRnaCyqo68Ru5EhwCg90u3P
 mO0eNEYs/7xYobvwDohnYjTUcE82i3tn6BtRT/rMdrqfktXHyfq6DiV/Ntpz8XCAIxtx
 2KOOEXZ+Yh7p6Y3hO/8XT0JYBxSrQQ814nkl0dqDwRjhd9FKrRgMr1L7zN0O6GZyV5At
 jzBoct6crLtJ/HTjjWMaElcjuk+OfSfohYmD/94vyDoUmp2BfqSXcakijraOx7pq5VKI
 bPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=t773ZS2LkVFwCoSMRlKqTFzA/pnkk1Ts0faFvUW3ikE=;
 b=8Itl1rA+pXQHsOx3g0souOhYOvJYNUTSjz35a/lDxh6N0hpVsswwnpa4/mqtaOyuDW
 gw4f/yhZAOiTPB7soZ1Oa69jyspJdhv0QZhqns5RLNyUmlgeqqeD68VOBkEM40ljGrcA
 FybDdmTXYYl3T25thXVmHm0HyyqOzhd9SWPOrrgo/NTAAVe3S444YSsfFs4VcIwzt4AS
 I8Y6sC8fcS+wy6luUyLQ91JZcQB1Zyr+rvRj1iI8t//T/pL2MSM+17zpfJBb6095IudV
 uUArYbMNqv2DvBC0vBwECbkEfrHXPqWDE3pSk5mAD8rhKbC6w47TjQXWdWcxuVkJdf57
 sgpQ==
X-Gm-Message-State: ACrzQf2FYnwQmUSoAc54AZ0oe7faKDK0XQ6d9fImFwrNVKIigIJ0Pito
 ET8PXBNe+ZIO6fmdXSHpB5n7UDpV3OfM8A==
X-Google-Smtp-Source: AMsMyM7rkAEob9HL5X4HOg85wvfWn2u/ZfZaY2uLvL3HqJSYBOE/LBrVXuop7qRvCfPWQV+wJXEyFA==
X-Received: by 2002:ac8:5a86:0:b0:35c:d85f:915e with SMTP id
 c6-20020ac85a86000000b0035cd85f915emr11130479qtc.19.1664641408261; 
 Sat, 01 Oct 2022 09:23:28 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/42] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:22:38 -0700
Message-Id: <20221001162318.153420-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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

Remove the use of regime_is_secure from get_phys_addr_lpae,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Update to use s2walk_secure.
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b8c494ad9f..b7c999ffce 100644
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
@@ -2337,7 +2337,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     s2walk_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2505,8 +2505,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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


