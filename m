Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12290D4255
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 16:08:34 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIvaq-000227-F6
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 10:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJN-000674-Bi
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJM-0004BB-4Q
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:29 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:41703)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJM-0004AU-0i
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:28 -0400
Received: by mail-yw1-xc43.google.com with SMTP id 129so3491536ywb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fmdmkU2Zh+ktxeMt/gay8d04S3LmhLt8jnMCWxeDlf4=;
 b=JpUbxzlV4uswbaJPDJA8Y/qbYUEc3BtqiTXRjynxmYcnPhpxsZ0WznseAMeS30IM9D
 w9a28hzfzLtCCBcblxOgzxDAzdiNjQ3Hx4u1y1rYsISXQ3U/N1lkv068KJF5pLhYf31u
 tmbdGXR+Db45liCV35aWKu3TaGtF8HC7D6i1DrmwgCinoIvD2igLRJYxTy3Xt/V0Vcfd
 Vtl8LZjQZa0o2MYRHNkC0tA3EoN7LVFWP+NU+LY7zwyM6uwQ0IW0rqg3CJS0ZBl8GOmX
 37ZrG8pluANeKZIp0zk8ji7CCLWj2+7jcnztfEqrn+Bi6KStmcZd0qdYPyzd0bLmaJ4x
 8KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fmdmkU2Zh+ktxeMt/gay8d04S3LmhLt8jnMCWxeDlf4=;
 b=hCLIKFVEBHAjaO++X854yjXhA8IVXgSRuSj2qpYJrs4I84tN9oHofE6n6mtRoJPN1a
 yOGoid/5jXLMDp+pcvrHeymLYTlI8a9b0fEPj6tmrXj13H5HfStU78GJBvNsiKBZtxFw
 fa+zwM3toy//U4tLAYYGXwQhWVnzUzDM/xXyS0mB4Z7IzHN+e12JX1dmnlT7HqoX6J7J
 Hh2KFJmX54hH3ne4vDzvQ0pF8Y+xaKDm9SV8FeNPeCHdhxjGYspqs7FYQ8nhisUwq0yj
 sqxUgUWecdjo0EnlvNAnFPWWuuF0W7jGRUQ6gwa0KjRPtGT5Fliw/4I5WNPA3ohOuna0
 9NbA==
X-Gm-Message-State: APjAAAUzXffMw5er4k8PuCIOZCXXy7hsvDycTUhfHPtsGRnbNpyTSf5H
 pwZ6OY+uqTrWA13/MbylF1daGbepq8Y=
X-Google-Smtp-Source: APXvYqwndia+t4SNw5Kocj+xVgrH0RlIGEVa5ajtq5T4kz9UXQseuvuLwVyN7kePPK+TrAHQOdeVXQ==
X-Received: by 2002:a81:f10e:: with SMTP id h14mr2471006ywm.49.1570801827105; 
 Fri, 11 Oct 2019 06:50:27 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/22] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
Date: Fri, 11 Oct 2019 09:47:41 -0400
Message-Id: <20191011134744.2477-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e988398fce..17981d7c48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9609,6 +9609,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -9836,17 +9837,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         txattrs->target_tlb_bit0 = true;
     }
 
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint64_t mair = env->cp15.mair_el[el];
+        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
+    }
+
+    /* When in aarch64 mode, and MTE is enabled, remember Tagged in IOTLB.  */
+    if (aarch64 && memattr == 0xf0 && cpu_isar_feature(aa64_mte, cpu)) {
+        txattrs->target_tlb_bit1 = true;
+    }
+
     if (cacheattrs != NULL) {
-        if (mmu_idx == ARMMMUIdx_S2NS) {
-            cacheattrs->attrs = convert_stage2_attrs(env,
-                                                     extract32(attrs, 0, 4));
-        } else {
-            /* Index into MAIR registers for cache attributes */
-            uint8_t attrindx = extract32(attrs, 0, 3);
-            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-            assert(attrindx <= 7);
-            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
-        }
+        cacheattrs->attrs = memattr;
         cacheattrs->shareability = extract32(attrs, 6, 2);
     }
 
-- 
2.17.1


