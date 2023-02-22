Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1869ECE0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexQ-0007Yx-4Z; Tue, 21 Feb 2023 21:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexC-0007MV-CM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:59 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexA-0001dh-NP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id q11so7541726plx.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWyoKLNYT7BI4DSP24uw6KDK1ZUmKKpGpsEn941WxC4=;
 b=trnRBCr44khClTf+xyrSp69kwRpab7DowFPT2nUP3pTaydCXixSMiQWxS6lWEcq+wh
 +qBDdVewl4Qlb/WPf3jLRsWI7vhhfzuCACWWgKm65bs/Chj58IcsI9fZLCpkR4vvZfAX
 gNwGzFq0DOmzbqmBUR7eaJyDYVYwmTpmH5RvugsV0FyeDFjcOtEET63ExPSqvpdL4Hgm
 mqwmSwcja0MEBLwozr27Fy0OCn9Gb8K5CDgvXl1Z1aMV/nd33JD5vFKTcW0KsWD/PSWT
 LKLlVVP1xJDVRXqiLUiWUGiT+irz1i7Hi0jAl3WLv66tZh7PKxOk9pTmn05GPf8p6zcq
 zwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWyoKLNYT7BI4DSP24uw6KDK1ZUmKKpGpsEn941WxC4=;
 b=pEMWEnHygTVHlj1jIilONwTL07JeNoGGlmA+r0ZNzMZtAjN/8TOMc2TbeR59UUMG59
 MEgPEST7vh8pEAWdvAYkjXFa6XXY0dHJ7RrVLNngsDiWtJW0eKB1UlPYzacY7sQbs4ns
 9SG0PXb7Z7+aVuPiyCXPIMG9t6t6lvDu3tQjKb7bMP+YwWdCqfMffjjf4bgcKeklUyhd
 RVntOXsrfawzV7UrTsLBDtHgFYD2LZokDIYu7FtB/HqVS/e765E60DOZqzte4LDVUzge
 fmr6S79QeA8OQpI/nvKKO6EPs3oHj94QJ101UALcxySEAwVzNSpolgk3MT7hXNgtnr+1
 sgjA==
X-Gm-Message-State: AO0yUKVAsPsFYt62KfRS1RBZ3WNb8FVRzPbt1XsSU9WUi3Lk/6uPs/1R
 jH4bXFNm4AOxX60mOIhOt9fW7NAjcFOE+czWfdM=
X-Google-Smtp-Source: AK7set91TxQHzJ2oMRMf53k98YV3JdcyQqgwB70X3Hx7ll7pqZ/ylZqZuL89G4iHTE3ija+WIwiJ/g==
X-Received: by 2002:a17:903:32cf:b0:19a:b092:b31a with SMTP id
 i15-20020a17090332cf00b0019ab092b31amr7161337plr.8.1677033235240; 
 Tue, 21 Feb 2023 18:33:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/25] target/arm: Adjust the order of Phys and Stage2
 ARMMMUIdx
Date: Tue, 21 Feb 2023 16:33:22 -1000
Message-Id: <20230222023336.915045-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It will be helpful to have ARMMMUIdx_Phys_* to be in the same
relative order as ARMSecuritySpace enumerators. This requires
the adjustment to the nstable check. While there, check for being
in secure state rather than rely on clearing the low bit making
no change to non-secure state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++------
 target/arm/ptw.c | 12 +++++-------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 203a3e0046..c5fc475cf8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2855,18 +2855,18 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
-    /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
-
     /*
      * Used for second stage of an S12 page table walk, or for descriptor
      * loads during first stage of an S1 page table walk.  Note that both
      * are in use simultaneously for SecureEL2: the security state for
      * the S2 ptw is selected by the NS bit from the S1 ptw.
      */
-    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
+
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6fb72fb086..5ed5bb5039 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1410,16 +1410,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (nstable) {
+    if (nstable && ptw->in_secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-         * Assert that the non-secure idx are even, and relative order.
+         * Assert the relative order of the secure/non-secure indexes.
          */
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
-        ptw->in_ptw_idx &= ~1;
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
+        ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
     }
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-- 
2.34.1


