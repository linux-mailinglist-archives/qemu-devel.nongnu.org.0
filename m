Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C88B5B6F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:08:53 +0200 (CEST)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6aq-0000E2-3J
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6RC-00087Y-Uy
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:58:55 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6RB-0001e8-5b
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:58:54 -0400
Received: by mail-io1-xd36.google.com with SMTP id h194so7845387iof.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NBOJBU3uTy29unfDpsY/Py5xF2DVleNieOaSmiuGjF0=;
 b=wxfOTj9cg6IeyM7lu6aCd73wj7VKtCIUIJ51FLbbDFN78NK0XQZRIheF+4JxoxLcTv
 nhj7qQhoPQRSBC6dESny5AsRzUS2YGy84egrstsR2CagMPdLuRK0IbbQmxVuBWwSCQ0g
 Kh0XWwzzpzfUttq/SQ0AWtT29SKyVGI/aQDHYeKqpDoDVHpUQNRpyZwAmU7xW4bKqNyN
 6FngEC/1LUhGvbNMg1gg7WHLeKaPM3Lu19tWn6NXtqNzCGqUOMDdXzHkmbqNBzPUl0W9
 lYmXVARR4HPobG2W3OfDWqYzgp81uTJhvTybl8eXYoBtwc/JDumGQpLfHNFb2pRQNcIR
 KyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NBOJBU3uTy29unfDpsY/Py5xF2DVleNieOaSmiuGjF0=;
 b=WZd1RQOLir0gxaTIkNpow4caQq+SvG8rc/Q+JQfA9DEGnCt8u10Vp+gHbfihEnG3ST
 qXd7D7xPeqxyN5/Kxb3Oly7OpQO6Waf3YLe9Ve2QxbQ9TOSrhnl/iX41kSQJDIIaa3R5
 OoJVTB9nv23OLi5MQY2mB2zMVL01vLyo4cyf7MUgJ03H/qhnmfX4zuEMLwmU86Bn0roU
 va4u2bfj/Ec4Ln+QxkH723vsm09mUraCgFlwmgmFF0E/U4VVewaH/taXtKUsEiBPCL3V
 0vCfWSrXJR1naugMwZhtNIUlSxdDg5fB0dgRTXbPcavw7lv8TWeDMgx5rsQnAKZA2u58
 joUQ==
X-Gm-Message-State: ACgBeo3dX6EZ8sOWrBy5k7a29O+BkZL1T+VXy1Qks7OzyKkzxqpztBru
 6RPOsO8HdePaG/1m/TAu2GDFsSJVdGkRtaug
X-Google-Smtp-Source: AA6agR4F+SJ+hZNclXezPv7KPqnf4mC93llFy64KDPDK/2VoftcyQbUT7Xx2+MoAS7cLjpbHRGEOHA==
X-Received: by 2002:a5e:c316:0:b0:6a1:4c40:4574 with SMTP id
 a22-20020a5ec316000000b006a14c404574mr3676850iok.58.1663077531978; 
 Tue, 13 Sep 2022 06:58:51 -0700 (PDT)
Received: from stoup.. ([172.102.14.188]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05663810d000b00358322b32a3sm5579070jad.70.2022.09.13.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 06:58:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] target/arm: Use the max page size in a 2-stage ptw
Date: Tue, 13 Sep 2022 14:56:43 +0100
Message-Id: <20220913135643.55728-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
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

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Hi Mark, I think this will fix the issue that you mentioned on Monday.
It certainly appears to fit the bill vs the described symptoms.

This is based on my ptw.c rewrite, full tree at

    https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-rme

Based-on: 20220822152741.1617527-1-richard.henderson@linaro.org
("[PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS")


r~

---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c81c51f60c..510939fc89 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2509,7 +2509,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2550,6 +2550,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
      * prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2565,6 +2566,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1


