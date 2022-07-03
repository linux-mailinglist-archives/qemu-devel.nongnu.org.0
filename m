Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E856465A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:16:27 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7viM-0005cX-VU
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzD-0000P6-Bw
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz6-0006fs-Jo
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:47 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ju17so1431280pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czDINC237o/2raNbHTOaskPo+9bv5Oqa4q6sEcK6I78=;
 b=Hj7o0Y3r0lqvTyK2CYq3RAtYEkMqg5+A2HjmDvajpOo51ezGApVpCreR0ukp+GfmLu
 qF51M3RIYa2xn+n+52SoShWRg8l+8R4sY3WQP/mjvJttVW5ymSOcq7dco9OL1VlPNkJH
 gdgbD8posTwN6G+zLGMhYAlbqed9aQQpX8IMAMEdkGjGatchparTbVYDLnxcoD8pk1A7
 MQ2sEX20DzMsDOGQm0w6FzwZKrVc+RCO6CozZXe+EMdmT2WEEwKO8KxnKgd+IQDlv79S
 W5TpZyjYLi5WUkpWm8V7xUqAKqG+H1epEe06JuXtL20AZnLbPbdQAAMQ3pDoHDrx/YnM
 Tlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czDINC237o/2raNbHTOaskPo+9bv5Oqa4q6sEcK6I78=;
 b=5H8h1dh4J0s4n/zw8P0r+ieH+fRfKGtYQXRzqY+0/NYnLWFOUt1dnT8peOU/l2G/fq
 KnyNpclqb8QaUMDAE6jlR31x8Q4VMpB9y3O9S6LxzUxh0wxwbFfQsS7v6vYXi51Hykqs
 ad5MFGhr61M+XpoEohavBLtfZrwEPhg2Pugl2NlEPlo537YedMa3i0iEUt5lE8o4YYiQ
 XgHsxBmGzQgTC68lJ5JHs2N91C+yhEkeRAcs1E/68332OjLFKXsXhDCyi//9DU341EVP
 wQXNOcbMEoVehl5eJmBnMc81BEd0GIKlJJfF7MCo/OMpsAwWP68UI88Rfn/C6dbbAcH8
 fhZg==
X-Gm-Message-State: AJIora/hbWMlQsASIxnRhlrMCG3rTNqQMBCx6VjRIU7z299iMqRp++rN
 i2YiJ8g3hb0qHtqddmr0HDIPO0FbXd9t5zrn
X-Google-Smtp-Source: AGRyM1sWv/VhA3Y18QDmA8JAWHlh3HyTumptIw/1GE3Xuf/86g1BCyxD/bRnC4TTi6mBw5HU5o8fwg==
X-Received: by 2002:a17:902:9046:b0:168:b8ee:8164 with SMTP id
 w6-20020a170902904600b00168b8ee8164mr28932579plz.159.1656836979283; 
 Sun, 03 Jul 2022 01:29:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 43/62] target/arm: Reorg get_phys_addr_disabled
Date: Sun,  3 Jul 2022 13:54:00 +0530
Message-Id: <20220703082419.770989-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Use a switch.  Do not apply memattr or shareability for Stage2
translations. Make sure to apply HCR_{DC,DCT} only to Regime_EL10,
per the pseudocode in AArch64.S1DisabledOutput.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 115 +++++++++++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 48 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0f4b9b0166..3a098882a6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2278,64 +2278,83 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
-    uint64_t hcr;
-    uint8_t memattr;
+    uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    uint8_t memattr, shareability;
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        int r_el = regime_el(env, mmu_idx);
-        if (arm_el_is_aa64(env, r_el)) {
-            int pamax = arm_pamax(env_archcpu(env));
-            uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
-            int addrtop, tbi;
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+        memattr = 0x00;    /* unused, but Device, nGnRnE */
+        shareability = 0;  /* unused, but non-shareable */
+        break;
 
-            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-            if (access_type == MMU_INST_FETCH) {
-                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        if (hcr & HCR_DC) {
+            if (hcr & HCR_DCT) {
+                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+            } else {
+                memattr = 0xff;  /* Normal, WB, RWA */
             }
-            tbi = (tbi >> extract64(address, 55, 1)) & 1;
-            addrtop = (tbi ? 55 : 63);
-
-            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                fi->type = ARMFault_AddressSize;
-                fi->level = 0;
-                fi->stage2 = false;
-                return 1;
-            }
-
-            /*
-             * When TBI is disabled, we've just validated that all of the
-             * bits above PAMax are zero, so logically we only need to
-             * clear the top byte for TBI.  But it's clearer to follow
-             * the pseudocode set of addrdesc.paddress.
-             */
-            address = extract64(address, 0, 52);
+            shareability = 0;    /* non-shareable */
+            goto check_range;
         }
+        /* fall through */
+
+    default:
+        if (access_type == MMU_INST_FETCH) {
+            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                memattr = 0xee;  /* Normal, WT, RA, NT */
+            } else {
+                memattr = 0x44;  /* Normal, NC, No */
+            }
+            shareability = 2;    /* Outer sharable */
+        } else {
+            memattr = 0x00;      /* unused, but Device, nGnRnE */
+            shareability = 0;    /* non-shareable */
+        }
+        /* fall through */
+
+    check_range:
+        {
+            int r_el = regime_el(env, mmu_idx);
+            if (arm_el_is_aa64(env, r_el)) {
+                int pamax = arm_pamax(env_archcpu(env));
+                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+                int addrtop, tbi;
+
+                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+                if (access_type == MMU_INST_FETCH) {
+                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+                }
+                tbi = (tbi >> extract64(address, 55, 1)) & 1;
+                addrtop = (tbi ? 55 : 63);
+
+                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                    fi->type = ARMFault_AddressSize;
+                    fi->level = 0;
+                    fi->stage2 = false;
+                    return 1;
+                }
+
+                /*
+                 * When TBI is disabled, we've just validated that all of
+                 * the bits above PAMax are zero, so logically we only
+                 * need to clear the top byte for TBI.  But it's clearer
+                 * to follow the pseudocode set of addrdesc.paddress.
+                 */
+                address = extract64(address, 0, 52);
+            }
+        }
+        break;
     }
 
     result->phys = address;
     result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     result->page_size = TARGET_PAGE_SIZE;
-
-    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-    result->cacheattrs.shareability = 0;
     result->cacheattrs.is_s2_format = false;
-    if (hcr & HCR_DC) {
-        if (hcr & HCR_DCT) {
-            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-        } else {
-            memattr = 0xff;  /* Normal, WB, RWA */
-        }
-    } else if (access_type == MMU_INST_FETCH) {
-        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-            memattr = 0xee;  /* Normal, WT, RA, NT */
-        } else {
-            memattr = 0x44;  /* Normal, NC, No */
-        }
-        result->cacheattrs.shareability = 2; /* outer sharable */
-    } else {
-        memattr = 0x00;      /* Device, nGnRnE */
-    }
+    result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
     return 0;
 }
-- 
2.34.1


