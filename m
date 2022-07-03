Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201755645EA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:48:30 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vHJ-0004z8-7A
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvF-00086D-RB
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:42 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvE-0006B6-Aw
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ju17so1427446pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzCzj0W0FC9zsZchyEyMQYjih3KhzZw2NYS2mL3V7Bc=;
 b=pxBuHiZel5Dhj4NXWMiBwl5NvAYViEMsX7AjKMF1AanQJlJdoUCxwlUJpQnUX+u34d
 ltZJBw9N0GIh7WWBYU2REFFADUK11v4evDOrVTC9j8NENtlRGWh3JcYI77e3BjoBNL8a
 cn5e/IQMO6hySzdK9b8WJgoExo19qwvZY++jva2vJ9WZZFdbdFuTDi9baPg7TS9vbP95
 ES2cUxHqJxXBtedr+gkUYkT/BszX00ksoQ0575nPmcqI4kJPCVk8TK4m+mLrW3HRDuE2
 wwK7mpyHvO57y09ddP3LvDiue+4amQVK5mMzs78I9MFHVJA1Rg59Y9zv3wfwT01gfoZ3
 bifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzCzj0W0FC9zsZchyEyMQYjih3KhzZw2NYS2mL3V7Bc=;
 b=DKX7stjSTHeoHZXgn300ts9H7gZNI431g0K0NSox3K+QgfhKnWJovxihTQUteHXjFM
 gFGYX/iPyxtyhEa8SnBi1d0g/VGLrwkWjfCANj1DjhD+IdrEu675KvJIH0vK5hEMs3au
 cmv5KvQaLSCZdLt0RJxwk2gVEsB7u9Ycvpy1oFi7CyXxD1aGcV9blxShhxZvR2W4e1uv
 h/yWw7J6WWf1LqK6hNwmFPDsZL4AIWCxJVQ+M3nxZ1AJeBuVnQRxNeS78MY7HmWDofp7
 O8bZCNthplkPmQEArUH2xOnVtj80AfLeS0Ue5VMbXl8W02xUE8NHaGiIBeKJeCIYQrt5
 pYow==
X-Gm-Message-State: AJIora/1KbYG6Ja3gmFjyhZcY0tYWx7qQtIMwHMZ4KOkgy8iK0xO/wHb
 pQxqFXRfIOi5/WZRBH26jhaZJ6Kel0H5rERr
X-Google-Smtp-Source: AGRyM1tYqNgTsx+79JKS6aCUXkbSD8FopYglnXFOYvQTLX7rEExiXvgMVO9oIC6E9zHGu80miyED+g==
X-Received: by 2002:a17:90b:1c0f:b0:1ec:ef7b:8bfc with SMTP id
 oc15-20020a17090b1c0f00b001ecef7b8bfcmr27985969pjb.157.1656836739048; 
 Sun, 03 Jul 2022 01:25:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/62] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:53:41 +0530
Message-Id: <20220703082419.770989-25-richard.henderson@linaro.org>
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

Remove the use of regime_is_secure from get_phys_addr_lpae.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23cfccce6c..b883826643 100644
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
@@ -961,8 +961,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
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
@@ -1179,7 +1179,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
      */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
         uint64_t descriptor;
         bool nstable;
@@ -2331,7 +2331,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     ipa_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2499,8 +2499,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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


