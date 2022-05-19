Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D614652DBA4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:47:28 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkFD-0007pU-Ur
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk55-00062l-U3
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk54-0000q3-3B
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u3so8223593wrg.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EoLHISSSY85Z8EftLSpjsbTy56sQ7wyOjWGgddny4K0=;
 b=ebPTY6Ul81BW9fcAVNKFQEIZGYvD8LEy0WQRhRTpGb0UcvBCr66yAitCMQb/RWvcYW
 Ye89u3XZxJpp4KtZKHDPfnEm679jehxq5s7j8/ejJRTxfFfl/JoLnOW32JHZ6Bt3Fhi3
 y0uFm1gAlFFNzJzInvtXUUPZR+Igbz9vVwRg+zsTGkE1oeIeUQ06KDCUWt9QEwhDQM4r
 9CPYuG1tDPOpBXh/fq2PKiJV/xBnv250St1OtGcjvrmoPEcgRw+MvAKXcXWF7joXoN/A
 MMr5QMFd65UQoJwRi2TNIpzlp68qYfxlQWHY2OjyvXVxYRz9UKPbiy/DU46fHtYVzgZt
 JoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoLHISSSY85Z8EftLSpjsbTy56sQ7wyOjWGgddny4K0=;
 b=AOdXm4jKuDmon4FBstQLV6jccivaSJy8bB38YqlGk6bSi9GlkCnJmiSUScVWLFNKq0
 bu9Z8sTmLLJC1lEi1LittiSYZW/OuT/JsiMn5xs7E7JZVhTB1fHGAnpbI9ChJp7KvVgo
 FS8wfFT2Z6txNYLPwPly0aTEvOBihMGpbX4I1sCXXZz9BkL6fqfvXHye/l6ObAIRGMVS
 2xquWXXjzFiTRUxq3xgewvnQSXOEB6Pooao7xz0QhVpA5qUlOeK03bBIytjwVF5XXa7S
 f5H6sGoxWI4AK4iuqvgLO5dqH4kauGZXWojhSzzIo0F90XBE3tSOM5L9KJa+54+8wsph
 O3yA==
X-Gm-Message-State: AOAM531WDYFa4hh5ZNXZwzNwYvgfhkqYWrIsoXx9TTkfQTF+0YB0HiHy
 4nxQOFy4inkzdWiZUnohzS9vAGmNMvyDBw==
X-Google-Smtp-Source: ABdhPJxFBo8yK7UnF6n2ukQUy8/O5KkOsOYnQcw29+bavEpcCYagfuVDSlTT5lVsoWRMikx+P9KGZQ==
X-Received: by 2002:a5d:674c:0:b0:20d:87e:8d6f with SMTP id
 l12-20020a5d674c000000b0020d087e8d6fmr5026749wrw.40.1652981816132; 
 Thu, 19 May 2022 10:36:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/22] target/arm: Implement FEAT_S2FWB
Date: Thu, 19 May 2022 18:36:32 +0100
Message-Id: <20220519173651.399295-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the handling of FEAT_S2FWB; the meat of this is in the new
combined_attrs_fwb() function which combines S1 and S2 attributes
when HCR_EL2.FWB is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220505183950.2781801-4-peter.maydell@linaro.org
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18ca61e8e25..98efc638bbc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3941,6 +3941,11 @@ static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
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
index a2a96358410..073d6509c8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5161,6 +5161,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_scxtnum, cpu)) {
             valid_mask |= HCR_ENSCXT;
         }
+        if (cpu_isar_feature(aa64_fwb, cpu)) {
+            valid_mask |= HCR_FWB;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5172,8 +5175,10 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
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
@@ -10731,9 +10736,15 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
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
@@ -12618,6 +12629,69 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
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
@@ -12652,7 +12726,11 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
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


