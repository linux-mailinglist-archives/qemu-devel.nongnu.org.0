Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99959C462
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:50:22 +0200 (CEST)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAd2-00027Q-Lm
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LO-0007bM-GG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LD-0000gh-0N
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id x19so7889759pfq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J9NKDua5mjCfaRrViIxkitiohmvoSvAqzV9syZybY5w=;
 b=ys4tnb7KNFr9y4Jp2QDvFBy0no4nD1ZKcUgXYoxVUGPc4khNK1ZE7mUA/ABGhczfQF
 V9n7VSzZ3hQZHblw3nthVDO4/tkxbxCLIC8w+xxa/kqZFmTaQsYyr/BogaLIVc8y3uSG
 55RY1aBcAmn4Zpy8TZIapnF7ResxzAKaL0Wzx1y9YOERFEwmUEZSc+g0F61ezlRIxC7l
 nq6EilMuPM524RFQVDZSn+MvqIdaAdXZBpBzJZSWPLKG8BfaHkPqqMgBweVylVduuz9l
 i2ZIWgLXN0yuMA6EMHzmVL7xdAe9uTk0cM+ZPqgRJh8snIsxIJoicKOueRwbQHNAlAin
 53YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J9NKDua5mjCfaRrViIxkitiohmvoSvAqzV9syZybY5w=;
 b=sY7cD0PQdlYrbRGqMyEo/MZOilg+gWnqGHiPPE89beoqAyNy+H30TNoyXGD1qOVQYa
 rLhkxc5KS/YxGFm0bvMwPAxoC++3HAdbP9TGgzt5PXitZyKbS5HyG/YFccAvQxNlPl4Q
 DhqxmYnMubUYzJHFW0MIna4Z8L9cQ2PeeUnBSljq5kCsaxwhSFexHgHUSkFEmpVyWMfT
 tKv5P+rPAlOvKraUWGe8mquzsY6dXdV0eHeHW6DTFZOnmz991eO60JcfpMZaFJbaK+p7
 6awHdRo5ppnJ7UghNL2ztgePvTsAaGzA+d5m4BGztufKMydGOYXbTuQbfadolx0de1WL
 SGVA==
X-Gm-Message-State: ACgBeo0omDFEo5WI3J+YxCP/hOstBzrXEF4jscQBmgrI1fBnLiHPsHG0
 kh2MdbiLdWCIUsHE+ppUr287lHXOHozGGw==
X-Google-Smtp-Source: AA6agR7eylNrQ+mnQ/XK62i/vXlBRmYvUmXJNqaxQykuzqoAN68xuAqA8DdWTHqmJg7bAbRNHJgOHA==
X-Received: by 2002:a05:6a00:2789:b0:531:c43:6290 with SMTP id
 bd9-20020a056a00278900b005310c436290mr21269140pfb.21.1661182069096; 
 Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 08/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav8
Date: Mon, 22 Aug 2022 08:26:43 -0700
Message-Id: <20220822152741.1617527-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3dd6708eee..225405de3b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1967,8 +1967,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
@@ -2003,9 +2002,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 } else {
                     fi->type = ARMFault_QEMU_SFault;
                 }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         } else {
@@ -2015,7 +2014,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                txattrs->secure = false;
+                result->attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2028,17 +2027,19 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
                 fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+                            &result->phys, &result->attrs, &result->prot,
+                            &mpu_is_subpage, fi, NULL);
+    result->page_size =
+        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
 
@@ -2414,8 +2415,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->attrs,
-                                       &result->prot, &result->page_size, fi);
+                                       result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1


