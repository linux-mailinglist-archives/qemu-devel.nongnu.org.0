Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311975E69E9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:51:27 +0200 (CEST)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQM9-0007lk-Sn
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB1-0002BR-Sh
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB0-0005Q7-0Y
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so1703382wms.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=P6VqYbsDKhpYGPN8qnEH9BRbInbjOHH/i/5rsjAXUA4=;
 b=bdOdQoWWml0gAjOLKt3Uyl4E7h1oLGav26ja7M9o9VP9a/ehjXOxJJShB4OWbX/+nu
 o0HnWvCQvHwvXEfywgcHkwp+hSxUpEc9ddpCi9yC/NbEbre3ygudagItekfVkqyr4nbN
 O/NR+jlBQ/YRSTGWv5N2HajVw5e+hsqNGH/YrfW6U8cLtd+waN7w1CEHtaHvpDHGVYEi
 Cy9TZKA8VEjWyby8y5HUDR3ZFJI08HGdqj9B5uQovDv0L/Ddc54EbFS9E7fwMdF+KdsR
 XPAA4QVcNznVs00VLQ+B0JK6jDq0Auy46EZK2w89nnT0DECCdSLURGLqossEpBwGTsMR
 ENig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P6VqYbsDKhpYGPN8qnEH9BRbInbjOHH/i/5rsjAXUA4=;
 b=QZjt+y63mjx8gfM9dIrQ83zb1AD1SFyrDDfy1aaQdR1jaWR2FCzE74+UhldB7883hI
 lva4W3obu1eLDK1JQIAVOPvpiLtOcZW4Io2mFufJbBO+UgTL0cmThrxZnFIIRXW8VoSY
 MLdVdEr/RHmCwW5BAt/kJpP/Wsa4mRUMiwXdgs9msVqvGuLQWkgRdj4ue5c5uOdq3MO7
 AlTIjXZe+bVw1ZfgZxL4DzyDVT1/NqmZ+ivCLBPCnhNEfrmVrpBSmJlWoRBwic7OnbEs
 4pQtyIN1ohDG4wXp/gPGQn27ENzQcSs/Y4Bf9cGSkZ/Yd9in9oQpKsNjiBPZ5Q3335Ik
 ppaA==
X-Gm-Message-State: ACrzQf1nexy4D7PR2cIWSWkX0GH461Y81zH3Mx+4GR/+xPtTl/GxVuUh
 xPmGOHsayZmpY2nxJ6evN7rZBUjHBw+gAA==
X-Google-Smtp-Source: AMsMyM4YVBwc2HYETCrPaEZZPWyUIo2fesTLBMaAPN30EZBuP9/pIBF+5ivZf6G4Q0GzNLGDvSP9bw==
X-Received: by 2002:a05:600c:3786:b0:3b4:ef37:afdb with SMTP id
 o6-20020a05600c378600b003b4ef37afdbmr3099783wmr.164.1663864548706; 
 Thu, 22 Sep 2022 09:35:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/39] target/arm: Add is_secure parameter to get_phys_addr_v6
Date: Thu, 22 Sep 2022 17:35:12 +0100
Message-Id: <20220922163536.1096175-16-peter.maydell@linaro.org>
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

Remove the use of regime_is_secure from get_phys_addr_v6,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-15-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 96639da504e..8f0810a1968 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -533,7 +533,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -556,8 +557,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -610,8 +610,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2512,7 +2511,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.25.1


