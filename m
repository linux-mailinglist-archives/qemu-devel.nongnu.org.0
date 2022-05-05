Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7E51C89C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:00:26 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgi8-0006tC-Uq
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgON-0006wx-Gy
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:40:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOK-0002AY-Pb
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:39:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id b19so7206004wrh.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BK37fHRVqnthuH26rW9Ll64hvEKI8MD8UM28AzmRwT8=;
 b=uJozRu9wwK26qd7XxlZ0LdjtatqxguT+TdkhMvjcTFb/DTMfuz43qRAJXkMYpgZIw1
 LKl/XAxGESPvsUkma/fhnpJFT6vHuA/wYR0HCj353wmU61ZhULULDrRIhxhJsiqx+x7l
 hF6n/O9Tgv9AjmH8gQIGOKyA03myeD4j4CF047xjKPPc3j91wMgtvUBnndQ8Lur6pddw
 sA1zmQU3SsatS0XyvWfzmRC2JmJFfWCGDkiB7Gyo52RODXsucejRp4Ll3EkXAGL7RGkZ
 ru7VwTFjBtNluCDAicUSoKAi+TVJzyFKorWw1+5snw0XfSUADbjUdfAJiKVhrHgdx7WD
 PQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BK37fHRVqnthuH26rW9Ll64hvEKI8MD8UM28AzmRwT8=;
 b=rnGoPKtRbY5f5DD5XA43u6ii4tFFeKOXE7m78T7eowXwdbNWYCxtrT/v4pTnmqGoXY
 k7XONHgmu7ZIfL/pjFecL44aRqGx9+3YoM86QFxSaAu8HVRoF+TMeVG3Lv3pGW1ma7Pn
 YRnzTDOGeR/txgaADPiOz1sgZlW+MMntIEjgC610ubLlCieRoXw9YgseNx4OPUEazzwP
 IAPmJCh3GBd4wB5BVtCbstl83pvwjlncIortWsJk1p5Tn1+f+oqjHrYZ1CYJ9p5zdgMw
 qEtI9KMiqyVk637DakxpvnCzODWT3qSM48RJ7C88M79V6Q3V2rDfyF6ZKZQzOcS5kqkY
 /5cw==
X-Gm-Message-State: AOAM531HtFdEl7vUz2TSPL8uoLficOXKeBvAwGbmUlVJy8vmWVcS8lcx
 iL1FuXEbTLEyNp3mKbfP/PTI8ae1hfSg/A==
X-Google-Smtp-Source: ABdhPJwUEk4DFKkWJVH3cAXjxc2zXbG28rrlwzFpkF8vmAuzfIzGWTBV3yuUpDgP+AZ1ebSFd8uKOQ==
X-Received: by 2002:adf:f0c6:0:b0:20a:d31b:6 with SMTP id
 x6-20020adff0c6000000b0020ad31b0006mr22168714wro.162.1651775995094; 
 Thu, 05 May 2022 11:39:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Implement FEAT_S2FWB
Date: Thu,  5 May 2022 19:39:49 +0100
Message-Id: <20220505183950.2781801-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505183950.2781801-1-peter.maydell@linaro.org>
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the handling of FEAT_S2FWB; the meat of this is in the new
combined_attrs_fwb() function which combines S1 and S2 attributes
when HCR_EL2.FWB is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index db8ff044497..dff0f634c38 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4289,6 +4289,11 @@ static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
 }
 
+static inline bool isar_feature_aa64_fwb(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, FWB) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2828f0dacf3..fb8d2bf5c9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5290,6 +5290,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_fwb, cpu)) {
+            valid_mask |= HCR_FWB;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5301,8 +5304,10 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_PTW forbids certain page-table setups
      * HCR_DC disables stage1 and enables stage2 translation
      * HCR_DCT enables tagging on (disabled) stage1 translation
+     * HCR_FWB changes the interpretation of stage2 descriptor bits
      */
-    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT)) {
+    if ((env->cp15.hcr_el2 ^ value) &
+        (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB)) {
         tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
@@ -10685,9 +10690,15 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
      * attributes are therefore only Device if stage 2 specifies Device.
      * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
      * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
+     * when cacheattrs.attrs bit [2] is 0.
      */
     assert(cacheattrs.is_s2_format);
-    return (cacheattrs.attrs & 0xc) == 0;
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        return (cacheattrs.attrs & 0x4) == 0;
+    } else {
+        return (cacheattrs.attrs & 0xc) == 0;
+    }
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
@@ -12572,6 +12583,69 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
     return ret_attrs;
 }
 
+static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
+{
+    /*
+     * Given the 4 bits specifying the outer or inner cacheability
+     * in MAIR format, return a value specifying Normal Write-Back,
+     * with the allocation and transient hints taken from the input
+     * if the input specified some kind of cacheable attribute.
+     */
+    if (attr == 0 || attr == 4) {
+        /*
+         * 0 == an UNPREDICTABLE encoding
+         * 4 == Non-cacheable
+         * Either way, force Write-Back RW allocate non-transient
+         */
+        return 0xf;
+    }
+    /* Change WriteThrough to WriteBack, keep allocation and transient hints */
+    return attr | 4;
+}
+
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_fwb(CPUARMState *env,
+                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    switch (s2.attrs) {
+    case 7:
+        /* Use stage 1 attributes */
+        return s1.attrs;
+    case 6:
+        /*
+         * Force Normal Write-Back. Note that if S1 is Normal cacheable
+         * then we take the allocation hints from it; otherwise it is
+         * RW allocate, non-transient.
+         */
+        if ((s1.attrs & 0xf0) == 0) {
+            /* S1 is Device */
+            return 0xff;
+        }
+        /* Need to check the Inner and Outer nibbles separately */
+        return force_cacheattr_nibble_wb(s1.attrs & 0xf) |
+            force_cacheattr_nibble_wb(s1.attrs >> 4) << 4;
+    case 5:
+        /* If S1 attrs are Device, use them; otherwise Normal Non-cacheable */
+        if ((s1.attrs & 0xf0) == 0) {
+            return s1.attrs;
+        }
+        return 0x44;
+    case 0 ... 3:
+        /* Force Device, of subtype specified by S2 */
+        return s2.attrs << 2;
+    default:
+        /*
+         * RESERVED values (including RES0 descriptor bit [5] being nonzero);
+         * arbitrarily force Device.
+         */
+        return 0;
+    }
+}
+
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
@@ -12606,7 +12680,11 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        ret.attrs = combined_attrs_fwb(env, s1, s2);
+    } else {
+        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    }
 
     /*
      * Any location for which the resultant memory type is any
-- 
2.25.1


