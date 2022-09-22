Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D45E6A50
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:05:07 +0200 (CEST)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQZO-00070O-AJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAw-0002AO-Pp
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAu-0005Of-Ug
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id e18so7138577wmq.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=eQDdX78ZoQvVzGawdbiqTYqIYpkUGBdGasPvevMFAeU=;
 b=u9r3Eytj/iz08hDVl8t3xIYPAy/5uG93jba9cYXVp76GviKCLwRE7UlmEUiX1OBObs
 +QYL1toZM7CeOt7vqA961AScic14ULglu4QrKAAeXwa0BVzgPOysuDAeZf6xffrEPQJL
 qHryaRE6xAmpxH8tu8zm5Q57xz8E9cFs5P97zAC+Bn8KZ4/7clT4xQr5OcnCXkWCAxM/
 h1Znn7mU/dS8kUZsXYCaOyf5LcaAgUKN96FBhWsxf6SEuBi3yeiH8ZKFC4zyDccsOjgH
 +ofvgGQNXR+AgWFznPfcFAyqbrCoTxHoEMvsYXb6jv2FTQvopxPPXX/6P+Eg3iAMoIS4
 wSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eQDdX78ZoQvVzGawdbiqTYqIYpkUGBdGasPvevMFAeU=;
 b=om3/Ii6Zpgy6mReHIcZ1uYJ4ExqlCyv4utQTT0wbAaNGBq/OszgsNxBrCgfDHn+9nS
 j16yFsEepdggZpQo/lo3ZWl9O9Qd3MYR6WC4Ad8nu20ohVJhivjOk6j7iPUwwSjUqTPx
 ahYVdAWSXlNUPivVd7tE1jTQGKcN84gSTFq9Za/BfCenWl4353L/wuwAOcEPDjcLb/1w
 jPh6koZx4GWnWbrAadmaL4XsPvf8bHuvkzwQm6++KD7Ynu5vgpf6tWlFC0D3H0+xNLEc
 oYhuYRh5GZAi8K46IPBTRSOUg0DTVFE38Mh304Z8mUa7aB2/xJvOcn5NVNRj8mX4cwAh
 UyeQ==
X-Gm-Message-State: ACrzQf3Fqoa1NXFYvxFolYLbyFnKVvovaCh8D1HZv7hHdwoXyeyA7Vn+
 U5CxNqv3KU8dY0ZG8kogZklQkWmdloqFLw==
X-Google-Smtp-Source: AMsMyM7jLnwSzMylnz7EXGbOSZ1esVqPBODgcBOAkqqtnMbIzREtXEN4zFrdfBvuQcKrreXYSvheQw==
X-Received: by 2002:a05:600c:2142:b0:3b4:92b6:73ba with SMTP id
 v2-20020a05600c214200b003b492b673bamr10409354wml.139.1663864542619; 
 Thu, 22 Sep 2022 09:35:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] target/arm: Use GetPhysAddrResult in get_phys_addr_v5
Date: Thu, 22 Sep 2022 17:35:03 +0100
Message-Id: <20220922163536.1096175-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-6-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 600d9e6650d..4e2476278e1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,9 +414,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size,
-                             ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -464,7 +462,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
+        result->page_size = 1024 * 1024;
     } else {
         /* Lookup l2 entry.  */
         if (type == 1) {
@@ -486,12 +484,12 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
             if (type == 1) {
@@ -499,7 +497,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_XSCALE)
                     || arm_feature(env, ARM_FEATURE_V6)) {
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
+                    result->page_size = 0x1000;
                 } else {
                     /*
                      * UNPREDICTABLE in ARMv5; we choose to take a
@@ -510,7 +508,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 }
             } else {
                 phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
+                result->page_size = 0x400;
             }
             ap = (desc >> 4) & 3;
             break;
@@ -519,14 +517,14 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
+    result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->prot |= result->prot ? PAGE_EXEC : 0;
+    if (!(result->prot & (1 << access_type))) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2520,8 +2518,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                &result->phys, &result->prot,
-                                &result->page_size, fi);
+                                result, fi);
     }
 }
 
-- 
2.25.1


