Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819C53D52B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:14:25 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLBA-00010Q-3f
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3R-0007yo-PX
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:25 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3P-0008WU-90
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so13546760pjo.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42KGxt0e56Jwm+KUmBLbaDfA0/L/Jc+cpx0rRd0m44o=;
 b=pF430RL+9nQpj2tKPEVdsIKPrydD+nqhc3PCG+g2+NTaLIPR/v0jncywE6ZbIvgOKK
 94s+O14pFelCw2sctaHCtPL0NNUPWSrX/ecr/qND4wkbWWkTs9I0FmNG00DhXPd793Ca
 YgC748Mj0FzN7u6Bt0PJO9MqHt22XlfxGSa8IlhBr3lS1YVF3Ley/9iwJzDezvdbGORM
 OgtS0dDgSRz1DBcZw3Pnwo/4Q+jAzGSCDtN0UC2/l57jWMTnplF83VIyH/DFHUGoa/13
 weWehzLl8VCSluD8bgKCQwD2I2vP125ZOSoAj9DGk3Ygo1dmYDFAM91rhopvJJlHEIM8
 iEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42KGxt0e56Jwm+KUmBLbaDfA0/L/Jc+cpx0rRd0m44o=;
 b=slOe/7o3t9youzcrKzrUqgEi8TXQLYDuBSGmMivQdJdbXpjAjqA7ziHL3XDVYK1jah
 xNd0M7owPQ8suMZ4DblUYBOnNbzdThVcNYrR35w0zCcyk5FBVHsdBqCOf/KdAZU1He/N
 82Y78awMp44prE0jdtRNUjCR5wS0i80NuPPvpQYyFn4GEPSdGcX43nSM7D21ypr2o45L
 f39KyYZrk0MgUZrJa3jL/WgNRIllri0WCnq4n19U3c7P61HS/M3j8M+vZWZ9ihMr1/Ei
 5zLo5e8ELUDVM2eBtw5eztux7eBsOldaXF1Ir0X+vu6KvNyQj8/UgwWHEszGnd9FzOVK
 QKgg==
X-Gm-Message-State: AOAM531dVBuU9mmfJ5SSjY0Rn/UwKSK1cUj2NEGMqycRN8sPcEczY8zP
 xct3YUqjIz8T7yqOf8gNmWJd6QnAz5hWqw==
X-Google-Smtp-Source: ABdhPJwKHYfBfgozm5OJH1dyX1HhDgz6IsKtQ5+Saqge25wDapS2rRJbIdVWdAcBfr2IJYWB8wOjcw==
X-Received: by 2002:a17:903:40c9:b0:167:5411:3536 with SMTP id
 t9-20020a17090340c900b0016754113536mr3991241pld.2.1654315582313; 
 Fri, 03 Jun 2022 21:06:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/28] target/arm: Move combine_cacheattrs and subroutines to
 ptw.c
Date: Fri,  3 Jun 2022 21:05:53 -0700
Message-Id: <20220604040607.269301-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

There are a handful of helpers for combine_cacheattrs
that we can move at the same time as the main entry point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |   3 -
 target/arm/helper.c | 218 -------------------------------------------
 target/arm/ptw.c    | 221 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+), 221 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index dd6fb93f33..b2dfe489bb 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -20,9 +20,6 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
-ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
-                                 ARMCacheAttrs s1, ARMCacheAttrs s2);
-
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
 int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50c4576544..83aba35cfd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10941,36 +10941,6 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
     return true;
 }
-
-/* Translate from the 4-bit stage 2 representation of
- * memory attributes (without cache-allocation hints) to
- * the 8-bit representation of the stage 1 MAIR registers
- * (which includes allocation hints).
- *
- * ref: shared/translation/attrs/S2AttrDecode()
- *      .../S2ConvertAttrsHints()
- */
-static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
-{
-    uint8_t hiattr = extract32(s2attrs, 2, 2);
-    uint8_t loattr = extract32(s2attrs, 0, 2);
-    uint8_t hihint = 0, lohint = 0;
-
-    if (hiattr != 0) { /* normal memory */
-        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
-            hiattr = loattr = 1; /* non-cacheable */
-        } else {
-            if (hiattr != 1) { /* Write-through or write-back */
-                hihint = 3; /* RW allocate */
-            }
-            if (loattr != 1) { /* Write-through or write-back */
-                lohint = 3; /* RW allocate */
-            }
-        }
-    }
-
-    return (hiattr << 6) | (hihint << 4) | (loattr << 2) | lohint;
-}
 #endif /* !CONFIG_USER_ONLY */
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -11617,194 +11587,6 @@ do_fault:
     return true;
 }
 
-/* Combine either inner or outer cacheability attributes for normal
- * memory, according to table D4-42 and pseudocode procedure
- * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
- *
- * NB: only stage 1 includes allocation hints (RW bits), leading to
- * some asymmetry.
- */
-static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
-{
-    if (s1 == 4 || s2 == 4) {
-        /* non-cacheable has precedence */
-        return 4;
-    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
-        /* stage 1 write-through takes precedence */
-        return s1;
-    } else if (extract32(s2, 2, 2) == 2) {
-        /* stage 2 write-through takes precedence, but the allocation hint
-         * is still taken from stage 1
-         */
-        return (2 << 2) | extract32(s1, 0, 2);
-    } else { /* write-back */
-        return s1;
-    }
-}
-
-/*
- * Combine the memory type and cacheability attributes of
- * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
- * combined attributes in MAIR_EL1 format.
- */
-static uint8_t combined_attrs_nofwb(CPUARMState *env,
-                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
-
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
-
-    s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2_mair_attrs, 0, 4);
-    s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2_mair_attrs, 4, 4);
-
-    /* Combine memory type and cacheability attributes */
-    if (s1hi == 0 || s2hi == 0) {
-        /* Device has precedence over normal */
-        if (s1lo == 0 || s2lo == 0) {
-            /* nGnRnE has precedence over anything */
-            ret_attrs = 0;
-        } else if (s1lo == 4 || s2lo == 4) {
-            /* non-Reordering has precedence over Reordering */
-            ret_attrs = 4;  /* nGnRE */
-        } else if (s1lo == 8 || s2lo == 8) {
-            /* non-Gathering has precedence over Gathering */
-            ret_attrs = 8;  /* nGRE */
-        } else {
-            ret_attrs = 0xc; /* GRE */
-        }
-    } else { /* Normal memory */
-        /* Outer/inner cacheability combine independently */
-        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
-                  | combine_cacheattr_nibble(s1lo, s2lo);
-    }
-    return ret_attrs;
-}
-
-static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
-{
-    /*
-     * Given the 4 bits specifying the outer or inner cacheability
-     * in MAIR format, return a value specifying Normal Write-Back,
-     * with the allocation and transient hints taken from the input
-     * if the input specified some kind of cacheable attribute.
-     */
-    if (attr == 0 || attr == 4) {
-        /*
-         * 0 == an UNPREDICTABLE encoding
-         * 4 == Non-cacheable
-         * Either way, force Write-Back RW allocate non-transient
-         */
-        return 0xf;
-    }
-    /* Change WriteThrough to WriteBack, keep allocation and transient hints */
-    return attr | 4;
-}
-
-/*
- * Combine the memory type and cacheability attributes of
- * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
- * combined attributes in MAIR_EL1 format.
- */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    switch (s2.attrs) {
-    case 7:
-        /* Use stage 1 attributes */
-        return s1.attrs;
-    case 6:
-        /*
-         * Force Normal Write-Back. Note that if S1 is Normal cacheable
-         * then we take the allocation hints from it; otherwise it is
-         * RW allocate, non-transient.
-         */
-        if ((s1.attrs & 0xf0) == 0) {
-            /* S1 is Device */
-            return 0xff;
-        }
-        /* Need to check the Inner and Outer nibbles separately */
-        return force_cacheattr_nibble_wb(s1.attrs & 0xf) |
-            force_cacheattr_nibble_wb(s1.attrs >> 4) << 4;
-    case 5:
-        /* If S1 attrs are Device, use them; otherwise Normal Non-cacheable */
-        if ((s1.attrs & 0xf0) == 0) {
-            return s1.attrs;
-        }
-        return 0x44;
-    case 0 ... 3:
-        /* Force Device, of subtype specified by S2 */
-        return s2.attrs << 2;
-    default:
-        /*
-         * RESERVED values (including RES0 descriptor bit [5] being nonzero);
-         * arbitrarily force Device.
-         */
-        return 0;
-    }
-}
-
-/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
- * and CombineS1S2Desc()
- *
- * @env:     CPUARMState
- * @s1:      Attributes from stage 1 walk
- * @s2:      Attributes from stage 2 walk
- */
-ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
-                                 ARMCacheAttrs s1, ARMCacheAttrs s2)
-{
-    ARMCacheAttrs ret;
-    bool tagged = false;
-
-    assert(s2.is_s2_format && !s1.is_s2_format);
-    ret.is_s2_format = false;
-
-    if (s1.attrs == 0xf0) {
-        tagged = true;
-        s1.attrs = 0xff;
-    }
-
-    /* Combine shareability attributes (table D4-43) */
-    if (s1.shareability == 2 || s2.shareability == 2) {
-        /* if either are outer-shareable, the result is outer-shareable */
-        ret.shareability = 2;
-    } else if (s1.shareability == 3 || s2.shareability == 3) {
-        /* if either are inner-shareable, the result is inner-shareable */
-        ret.shareability = 3;
-    } else {
-        /* both non-shareable */
-        ret.shareability = 0;
-    }
-
-    /* Combine memory type and cacheability attributes */
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
-    } else {
-        ret.attrs = combined_attrs_nofwb(env, s1, s2);
-    }
-
-    /*
-     * Any location for which the resultant memory type is any
-     * type of Device memory is always treated as Outer Shareable.
-     * Any location for which the resultant memory type is Normal
-     * Inner Non-cacheable, Outer Non-cacheable is always treated
-     * as Outer Shareable.
-     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
-     */
-    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
-        ret.shareability = 2;
-    }
-
-    /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
-    if (tagged && ret.attrs == 0xff) {
-        ret.attrs = 0xf0;
-    }
-
-    return ret;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5737a3976b..f2ca2bb8fe 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1008,6 +1008,227 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     return ret;
 }
 
+/*
+ * Translate from the 4-bit stage 2 representation of
+ * memory attributes (without cache-allocation hints) to
+ * the 8-bit representation of the stage 1 MAIR registers
+ * (which includes allocation hints).
+ *
+ * ref: shared/translation/attrs/S2AttrDecode()
+ *      .../S2ConvertAttrsHints()
+ */
+static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+{
+    uint8_t hiattr = extract32(s2attrs, 2, 2);
+    uint8_t loattr = extract32(s2attrs, 0, 2);
+    uint8_t hihint = 0, lohint = 0;
+
+    if (hiattr != 0) { /* normal memory */
+        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
+            hiattr = loattr = 1; /* non-cacheable */
+        } else {
+            if (hiattr != 1) { /* Write-through or write-back */
+                hihint = 3; /* RW allocate */
+            }
+            if (loattr != 1) { /* Write-through or write-back */
+                lohint = 3; /* RW allocate */
+            }
+        }
+    }
+
+    return (hiattr << 6) | (hihint << 4) | (loattr << 2) | lohint;
+}
+
+/*
+ * Combine either inner or outer cacheability attributes for normal
+ * memory, according to table D4-42 and pseudocode procedure
+ * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
+ *
+ * NB: only stage 1 includes allocation hints (RW bits), leading to
+ * some asymmetry.
+ */
+static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
+{
+    if (s1 == 4 || s2 == 4) {
+        /* non-cacheable has precedence */
+        return 4;
+    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
+        /* stage 1 write-through takes precedence */
+        return s1;
+    } else if (extract32(s2, 2, 2) == 2) {
+        /* stage 2 write-through takes precedence, but the allocation hint
+         * is still taken from stage 1
+         */
+        return (2 << 2) | extract32(s1, 0, 2);
+    } else { /* write-back */
+        return s1;
+    }
+}
+
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_nofwb(CPUARMState *env,
+                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+
+    s1lo = extract32(s1.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
+    s1hi = extract32(s1.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret_attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret_attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret_attrs = 8;  /* nGRE */
+        } else {
+            ret_attrs = 0xc; /* GRE */
+        }
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+    }
+    return ret_attrs;
+}
+
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
+/*
+ * Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+ * and CombineS1S2Desc()
+ *
+ * @env:     CPUARMState
+ * @s1:      Attributes from stage 1 walk
+ * @s2:      Attributes from stage 2 walk
+ */
+static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                        ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    ARMCacheAttrs ret;
+    bool tagged = false;
+
+    assert(s2.is_s2_format && !s1.is_s2_format);
+    ret.is_s2_format = false;
+
+    if (s1.attrs == 0xf0) {
+        tagged = true;
+        s1.attrs = 0xff;
+    }
+
+    /* Combine shareability attributes (table D4-43) */
+    if (s1.shareability == 2 || s2.shareability == 2) {
+        /* if either are outer-shareable, the result is outer-shareable */
+        ret.shareability = 2;
+    } else if (s1.shareability == 3 || s2.shareability == 3) {
+        /* if either are inner-shareable, the result is inner-shareable */
+        ret.shareability = 3;
+    } else {
+        /* both non-shareable */
+        ret.shareability = 0;
+    }
+
+    /* Combine memory type and cacheability attributes */
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        ret.attrs = combined_attrs_fwb(env, s1, s2);
+    } else {
+        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    }
+
+    /*
+     * Any location for which the resultant memory type is any
+     * type of Device memory is always treated as Outer Shareable.
+     * Any location for which the resultant memory type is Normal
+     * Inner Non-cacheable, Outer Non-cacheable is always treated
+     * as Outer Shareable.
+     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
+     */
+    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
+        ret.shareability = 2;
+    }
+
+    /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
+    if (tagged && ret.attrs == 0xff) {
+        ret.attrs = 0xf0;
+    }
+
+    return ret;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


