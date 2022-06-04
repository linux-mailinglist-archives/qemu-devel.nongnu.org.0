Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985C53D583
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:38:10 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLY8-0004mz-O3
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3W-0008Hs-GQ
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3T-00009X-Rb
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id a10so8694956pju.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtKVh+cEc+jGez4qiMWVy6WVEeDNoJJFBFME/IY/n24=;
 b=vXHXbEtbbcFjNjtLusPGZ+lJ53Ls5ucgvBDL9LCYemaqD6CAIRofxIl9rnmZt2FwEq
 Ifxp/1WVy4bZBALf0gbwM+7P5GU2/iCvdBz0IH0zT2s056VTrhw2VG5LgHWMn09C0SCz
 GimxSx+9iurXEw3rfS0+ea26BZolCVTh4azAyEO7hRiKnCji2NhPMK4sfqY8Jo5aNmdw
 KYLxMgLyBeIRTx5rYRPp3mAKVSYtpaGPcomMmzHOWv+5m5lQWOp/8FyMbrZ8Gd0q7hqy
 Wqy9Y786FBKValYITF2rRKl0FxOkjWf+NPeMMtSctj6C0C38VZOeZGltZy03rKpGla0k
 CIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtKVh+cEc+jGez4qiMWVy6WVEeDNoJJFBFME/IY/n24=;
 b=p5Fv0WZEf5vbkfA3SVj8JXUTFzwgTwtR3iacK3ie7lTvAO0+bJMKxf78vdVVpuos7y
 ZHMHo88ZnRoEgxAhXde5Erq3tbjadUhY/59qagpYzzV3LNmAmwZA3Xm5TuEic5RsoJaj
 1AM2al692AxO6GEZxki/zaIFfvnn5Gu0B1YHBzRnX2gOC6TN1cunimAWPyXxLdNp4uSX
 16IKgxyCLIqm39QqII4hyYkpGyBs46IEXL7UJF+1WZQvesjWBIzZZWMNdfvi/YqfTOKP
 KVYWIP4njG78oMasTqQ0cMoHhTY+8VpXnWI3Fk/RtLyGXXZ7ykTylKMPtFMPFmSQnlZI
 igvg==
X-Gm-Message-State: AOAM531eSrRzGTHndw2bjPeaEhNWEYdM1FzIydMi+X4wbbDW1yUxIvYF
 LJ6OWiZjT9c3+s6zOCPw7yEHPt6vmJw4Dw==
X-Google-Smtp-Source: ABdhPJy82ObSwVifuRhu1GYSA1e405DJshovxy4QzM6zN7y3JFWmN31CXm/veayRZnNe8GYFNPXRTg==
X-Received: by 2002:a17:90b:4a4c:b0:1e4:dcfc:e688 with SMTP id
 lb12-20020a17090b4a4c00b001e4dcfce688mr18753413pjb.38.1654315586483; 
 Fri, 03 Jun 2022 21:06:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/28] target/arm: Move get_S1prot, get_S2prot to ptw.c
Date: Fri,  3 Jun 2022 21:05:58 -0700
Message-Id: <20220604040607.269301-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |   3 --
 target/arm/helper.c | 128 --------------------------------------------
 target/arm/ptw.c    | 128 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 131 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index fba650d01c..93147e0b06 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -29,9 +29,6 @@ ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                    ARMMMUIdx mmu_idx);
 bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
                         int inputsize, int stride, int outputsize);
-int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0);
-int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-               int ap, int ns, int xn, int pxn);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 001d632cd1..7aadc6eeb9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10579,134 +10579,6 @@ int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
     }
 }
 
-/* Translate S2 section/page access permissions to protection flags
- *
- * @env:     CPUARMState
- * @s2ap:    The 2-bit stage2 access permissions (S2AP)
- * @xn:      XN (execute-never) bits
- * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
- */
-int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
-{
-    int prot = 0;
-
-    if (s2ap & 1) {
-        prot |= PAGE_READ;
-    }
-    if (s2ap & 2) {
-        prot |= PAGE_WRITE;
-    }
-
-    if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
-        switch (xn) {
-        case 0:
-            prot |= PAGE_EXEC;
-            break;
-        case 1:
-            if (s1_is_el0) {
-                prot |= PAGE_EXEC;
-            }
-            break;
-        case 2:
-            break;
-        case 3:
-            if (!s1_is_el0) {
-                prot |= PAGE_EXEC;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        if (!extract32(xn, 1, 1)) {
-            if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
-                prot |= PAGE_EXEC;
-            }
-        }
-    }
-    return prot;
-}
-
-/* Translate section/page access permissions to protection flags
- *
- * @env:     CPUARMState
- * @mmu_idx: MMU index indicating required translation regime
- * @is_aa64: TRUE if AArch64
- * @ap:      The 2-bit simple AP (AP[2:1])
- * @ns:      NS (non-secure) bit
- * @xn:      XN (execute-never) bit
- * @pxn:     PXN (privileged execute-never) bit
- */
-int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-               int ap, int ns, int xn, int pxn)
-{
-    bool is_user = regime_is_user(env, mmu_idx);
-    int prot_rw, user_rw;
-    bool have_wxn;
-    int wxn = 0;
-
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
-
-    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
-    if (is_user) {
-        prot_rw = user_rw;
-    } else {
-        if (user_rw && regime_is_pan(env, mmu_idx)) {
-            /* PAN forbids data accesses but doesn't affect insn fetch */
-            prot_rw = 0;
-        } else {
-            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
-        }
-    }
-
-    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
-    }
-
-    /* TODO have_wxn should be replaced with
-     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
-     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
-     * compatible processors have EL2, which is required for [U]WXN.
-     */
-    have_wxn = arm_feature(env, ARM_FEATURE_LPAE);
-
-    if (have_wxn) {
-        wxn = regime_sctlr(env, mmu_idx) & SCTLR_WXN;
-    }
-
-    if (is_aa64) {
-        if (regime_has_2_ranges(mmu_idx) && !is_user) {
-            xn = pxn || (user_rw & PAGE_WRITE);
-        }
-    } else if (arm_feature(env, ARM_FEATURE_V7)) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-        case 3:
-            if (is_user) {
-                xn = xn || !(user_rw & PAGE_READ);
-            } else {
-                int uwxn = 0;
-                if (have_wxn) {
-                    uwxn = regime_sctlr(env, mmu_idx) & SCTLR_UWXN;
-                }
-                xn = xn || !(prot_rw & PAGE_READ) || pxn ||
-                     (uwxn && (user_rw & PAGE_WRITE));
-            }
-            break;
-        case 2:
-            break;
-        }
-    } else {
-        xn = wxn = 0;
-    }
-
-    if (xn || (wxn && (prot_rw & PAGE_WRITE))) {
-        return prot_rw;
-    }
-    return prot_rw | PAGE_EXEC;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d754273fa1..af9ad42028 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -487,6 +487,134 @@ do_fault:
     return true;
 }
 
+/*
+ * Translate S2 section/page access permissions to protection flags
+ * @env:     CPUARMState
+ * @s2ap:    The 2-bit stage2 access permissions (S2AP)
+ * @xn:      XN (execute-never) bits
+ * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
+ */
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = 0;
+
+    if (s2ap & 1) {
+        prot |= PAGE_READ;
+    }
+    if (s2ap & 2) {
+        prot |= PAGE_WRITE;
+    }
+
+    if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
+        switch (xn) {
+        case 0:
+            prot |= PAGE_EXEC;
+            break;
+        case 1:
+            if (s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        case 2:
+            break;
+        case 3:
+            if (!s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        if (!extract32(xn, 1, 1)) {
+            if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
+                prot |= PAGE_EXEC;
+            }
+        }
+    }
+    return prot;
+}
+
+/*
+ * Translate section/page access permissions to protection flags
+ * @env:     CPUARMState
+ * @mmu_idx: MMU index indicating required translation regime
+ * @is_aa64: TRUE if AArch64
+ * @ap:      The 2-bit simple AP (AP[2:1])
+ * @ns:      NS (non-secure) bit
+ * @xn:      XN (execute-never) bit
+ * @pxn:     PXN (privileged execute-never) bit
+ */
+static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
+                      int ap, int ns, int xn, int pxn)
+{
+    bool is_user = regime_is_user(env, mmu_idx);
+    int prot_rw, user_rw;
+    bool have_wxn;
+    int wxn = 0;
+
+    assert(mmu_idx != ARMMMUIdx_Stage2);
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
+    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
+    if (is_user) {
+        prot_rw = user_rw;
+    } else {
+        if (user_rw && regime_is_pan(env, mmu_idx)) {
+            /* PAN forbids data accesses but doesn't affect insn fetch */
+            prot_rw = 0;
+        } else {
+            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
+        }
+    }
+
+    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
+        return prot_rw;
+    }
+
+    /* TODO have_wxn should be replaced with
+     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
+     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
+     * compatible processors have EL2, which is required for [U]WXN.
+     */
+    have_wxn = arm_feature(env, ARM_FEATURE_LPAE);
+
+    if (have_wxn) {
+        wxn = regime_sctlr(env, mmu_idx) & SCTLR_WXN;
+    }
+
+    if (is_aa64) {
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
+        }
+    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+        switch (regime_el(env, mmu_idx)) {
+        case 1:
+        case 3:
+            if (is_user) {
+                xn = xn || !(user_rw & PAGE_READ);
+            } else {
+                int uwxn = 0;
+                if (have_wxn) {
+                    uwxn = regime_sctlr(env, mmu_idx) & SCTLR_UWXN;
+                }
+                xn = xn || !(prot_rw & PAGE_READ) || pxn ||
+                     (uwxn && (user_rw & PAGE_WRITE));
+            }
+            break;
+        case 2:
+            break;
+        }
+    } else {
+        xn = wxn = 0;
+    }
+
+    if (xn || (wxn && (prot_rw & PAGE_WRITE))) {
+        return prot_rw;
+    }
+    return prot_rw | PAGE_EXEC;
+}
+
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
-- 
2.34.1


