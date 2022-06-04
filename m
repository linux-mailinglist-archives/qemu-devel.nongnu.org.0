Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30B53D56B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:28:17 +0200 (CEST)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLOb-0003PG-0v
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3U-00089P-JG
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:28 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3S-00008v-6a
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so2134065pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCpPYzkqKBbtVTXM2HIOkXh0U56y2kxPZvGE1Att9+k=;
 b=x2Bq1b7BF7ezoCoiQIxx8OO0eEtDzeLKispcxBwXaFoc/qkSOct81dvV2mkZkjvX+t
 3sBHrdZukvZGq5LDoXwjdlhd12uRJHwpWgmKgrgOWyKG2XBBl/LXEB518DEzI+lxQeUD
 VVMsgsN7+WUXEXP7Ax1E+02XotZw4RfgdGD6xNiJe6liTPrUTmsvc6ESfxfG71JG7bGR
 2FEKI/N5K25I4zkh/L8ULTGuf5n2Z3B/ShhkN5pTGRy8oiVXQs83X8akiWJtoHus7bTi
 sB1Fjaht2IbrtywwprYqY4u+RW2/23JVStPjChA6YPyg64rVhF4sj/8PX6LGYchUcxem
 yDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCpPYzkqKBbtVTXM2HIOkXh0U56y2kxPZvGE1Att9+k=;
 b=JpXdHZGau6kkZggPGC4q4O/z/JBIbdoYMUBSrbeP2o9oEBT54IZGfAESJQFBWFYfdJ
 l1SpXdw2FwcMxWznDjTsnpLYbAAEDZO/JqJKMH6NfDSz8HGaX4MS0YoMqfpzscg0F6sf
 W69JuhBbD/N6F6DliPPTWq+6mY9oOq6DS0v5/KNAA1FaFgmCFydmv2WEu435iSvKzPOV
 bA+msowUonWU9OfkPLelQfVAAs/56U4h8fdh6AP0y33mg7aSn5Vkt0UxRohRpBRMe+UN
 C8gYuCK0aMCRsrk69nmkh34PBkfgAU32Wj7/m42XPYhZ+uyDB7Rd6VPMc47aqeLAWZQE
 ShMQ==
X-Gm-Message-State: AOAM532ZAHp5TbZtz6sYaPdBiuMDwe395sXyaGns+j96VW+QPp1o+/0H
 RY97w26SM7FwQNRFtI56Nf8xraCFrA5z9A==
X-Google-Smtp-Source: ABdhPJyVlWteZvtTX4+EvbjpFhKGrzz724mYzxGJ7RI/1/PBMkiBrUt1YUIkNzALnl8PPLYPsaitSQ==
X-Received: by 2002:a17:90a:6fc2:b0:1e3:2c21:c29f with SMTP id
 e60-20020a17090a6fc200b001e32c21c29fmr26608580pjk.191.1654315584979; 
 Fri, 03 Jun 2022 21:06:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/28] target/arm: Move {arm_s1_,
 }regime_using_lpae_format to tlb_helper.c
Date: Fri,  3 Jun 2022 21:05:56 -0700
Message-Id: <20220604040607.269301-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

These functions are used for both page table walking and for
deciding what format in which to deliver exception results.
Since ptw.c is only present for system mode, put the functions
into tlb_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c     | 24 ------------------------
 target/arm/tlb_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6931237fe..4ed2093acf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10479,30 +10479,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
-/* Returns true if the stage 1 translation regime is using LPAE format page
- * tables. Used when raising alignment exceptions, whose FSR changes depending
- * on whether the long or short descriptor format is in use. */
-bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    return regime_using_lpae_format(env, mmu_idx);
-}
-
 #ifndef CONFIG_USER_ONLY
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 6421e16202..7d8a86b3c4 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -11,6 +11,32 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/* Return true if the translation regime is using LPAE format page tables */
+bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
+/*
+ * Returns true if the stage 1 translation regime is using LPAE format page
+ * tables. Used when raising alignment exceptions, whose FSR changes depending
+ * on whether the long or short descriptor format is in use.
+ */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+    return regime_using_lpae_format(env, mmu_idx);
+}
+
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
-- 
2.34.1


