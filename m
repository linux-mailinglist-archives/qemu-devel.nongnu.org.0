Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E35E68EA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:57:50 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPWH-00072w-4H
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB1-0002B0-2g
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAz-0005Pz-Dt
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1704933wmq.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=oH2L/FyjI2KdEq5MITDl2AegrqX2BdO76qwDWANjXFo=;
 b=VfNM77wUOsfNPwA775z2CDAytoGbsMoXsUBjCeU9Sgy6bOUztVHn5BRAG301oUuvuD
 t96dmT5rO6UGQyDv7J3NFLGiR/3lVdLL1E8LDj4R2HBylX9qNvskDNY/F9cOr4mq8TOb
 iUAlnGtuHDSVyKt5AgHNj7nCc6QwGYet80pv/ky+5xKR1HzQwDV43cq7FopLb0o7F+EZ
 FwzlKyFKGLNG5yph21h399FjlrT7OsE/+ofGqt4UbhL9BCto6G7Zso+QGtKtfPCd+H1w
 4rnzzmbuzZHdnCNk9BSCMgiedsAcTGK3gF+vmc4AOKY0cwJlneBYJDYF8VyJXvLfMPM5
 YIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oH2L/FyjI2KdEq5MITDl2AegrqX2BdO76qwDWANjXFo=;
 b=0TEF24j6egVVEi9REJNOgnVJ+CFl9F0fKlHAWVG71W6U/UJogE8k8PelekL0qGglKJ
 Jb9zPYB7ZxN1SmicTakT4wzL9PklQnfFari5V5EaGp00Iq6sJKzNuB5EYSffsar1EkMv
 rtMCuV4h+JRRTyZ2HvdsO86CMNhgM2ykeeU+YtMYGLgqHi9f91qFzWVSiE7OllEGATK2
 unUtiF8JTiHDfUVe2Cgm+xaWjARgjZ+g2vgrH/cBf6UG2+efnPlxygq5EAuCenBzQdoO
 C38Mzj712A6KN8aPgPEqE9CEjeTVHp/ZQmX6d24TK9x2gM0VXl7SStwy0BDiaHFdGHWt
 zvVA==
X-Gm-Message-State: ACrzQf1wd/7yiqN505Uff3/DwKGc88yWKq1v7jVs0zfqhRxJ2VH7rv7O
 xeIjT86J3gIEETcE68negAAOLjerNIWk+w==
X-Google-Smtp-Source: AMsMyM7u3FwP3U4YxnliKZueEwPhe3Kbu/cE0/Z7LyRNAPlVRB9KLFYKSVnh5z9T7bp9k9mr/LpWSg==
X-Received: by 2002:a7b:c34c:0:b0:3b3:4067:d473 with SMTP id
 l12-20020a7bc34c000000b003b34067d473mr3061954wmj.52.1663864548114; 
 Thu, 22 Sep 2022 09:35:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/39] target/arm: Add is_secure parameter to get_phys_addr_v5
Date: Thu, 22 Sep 2022 17:35:11 +0100
Message-Id: <20220922163536.1096175-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Remove the use of regime_is_secure from get_phys_addr_v5,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Folded in definition of local is_secure in get_phys_addr(),
 since I dropped the earlier patch that would have provided it]
Message-id: 20220822152741.1617527-14-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 308a9cc3ac9..96639da504e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,7 +414,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -433,8 +434,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -472,8 +472,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2291,6 +2290,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2393,7 +2393,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = regime_is_secure(env, mmu_idx);
+    result->attrs.secure = is_secure;
     result->attrs.user = regime_is_user(env, mmu_idx);
 
     /*
@@ -2515,7 +2515,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     }
 }
 
-- 
2.25.1


