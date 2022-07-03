Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46A56465F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:18:56 +0200 (CEST)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vkl-0003ym-OK
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz5-0008KD-KZ
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz3-0006fZ-Tp
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id j18so494111plj.8
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiWy/j3oKk4cigaisVDN3VGQJ/Lj1RcvwVUPj1j1dIE=;
 b=dptdrjwa5wlZXSM+ceZ0joCwRmgA/1/RjlHH4vZF4y7QxU7YiBBqYQSygUWBvQox/4
 0M9+X8VUjaNfhOdB1YIiq4gxvvxWO3PhfBgyGd2LJcr7/tGOdXPdUE9LZLtCJhht9/em
 RnF2itpgdUCXRYJZP4wqhmWwI2vfteEr42lH5Lb1H1DDgn/baBXvcF7+Vkq3zKklgCbN
 rzN5GDAPanX7ZuYCe7zZT+hdZBmCVC9ilwkqd7nIlpfySjDL7nloXri2GcmikghDtRDD
 5JKLVsc9mtp8bcF1zgyKnmUX0ho0WRdODFz1EBWxL/4ilDNNtk8hfruAgEJQsCGJ3lDR
 BCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiWy/j3oKk4cigaisVDN3VGQJ/Lj1RcvwVUPj1j1dIE=;
 b=cTQYBJ0Fxmovrv/vGXR08EGFeDfmsZz8K3epWU5jWGJluAV+vXzio3WaEWSuT6lz5Z
 ZanbRdqEOK1LXWjPJ34/MQSTd0P4FghXqaeVlzKr7t2pPTHG+SOn2pNvTAaRNwcMiQQj
 dpy7GD8l4wpdFX4urAu99l2ioPprFahZlVPwGYOBnNmoUDz5JFYhNmjW9CmLBSRdffjJ
 rgDEu6YOqr0QIg+Wb68BmyU8i+auapbsdFs1+nLo+zVT2jAjzA+D2zq/PVxk8MB3gQWH
 Bhm16leNlSrWU7fE0BD97tsRHaVpxItU0z73dTvM5tdI8+H34Ha+Ppti0Uq9/c2M5rQs
 0pHA==
X-Gm-Message-State: AJIora+zP6P2uZKNhfGEsj6DSrFjy1W+dltbFbg0gQ165mZ/DXoMNqkG
 87DMqDlAGw3e60DA90JagLhbaNuowCZvfA39
X-Google-Smtp-Source: AGRyM1uFGj9XFNDxhDUQ2N2boGD/C4KHF2LoLuAFyb7JO0C5OnU3Et0ZZWwT0fyGZbwJbgiDxArbeg==
X-Received: by 2002:a17:90a:fa01:b0:1ef:6e6a:4ff0 with SMTP id
 cm1-20020a17090afa0100b001ef6e6a4ff0mr8041156pjb.35.1656836976441; 
 Sun, 03 Jul 2022 01:29:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 42/62] target/arm: Split out get_phys_addr_disabled
Date: Sun,  3 Jul 2022 13:53:59 +0530
Message-Id: <20220703082419.770989-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 64 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 43a82c3c7f..0f4b9b0166 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2268,6 +2268,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
     return ret;
 }
 
+/*
+ * MMU disabled.  S1 addresses within aa64 translation regimes are
+ * still checked for bounds -- see AArch64.S1DisabledOutput().
+ */
+static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx mmu_idx, bool is_secure,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    uint64_t hcr;
+    uint8_t memattr;
+
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+        int r_el = regime_el(env, mmu_idx);
+        if (arm_el_is_aa64(env, r_el)) {
+            int pamax = arm_pamax(env_archcpu(env));
+            uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+            int addrtop, tbi;
+
+            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            if (access_type == MMU_INST_FETCH) {
+                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+            }
+            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            addrtop = (tbi ? 55 : 63);
+
+            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                fi->type = ARMFault_AddressSize;
+                fi->level = 0;
+                fi->stage2 = false;
+                return 1;
+            }
+
+            /*
+             * When TBI is disabled, we've just validated that all of the
+             * bits above PAMax are zero, so logically we only need to
+             * clear the top byte for TBI.  But it's clearer to follow
+             * the pseudocode set of addrdesc.paddress.
+             */
+            address = extract64(address, 0, 52);
+        }
+    }
+
+    result->phys = address;
+    result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    result->page_size = TARGET_PAGE_SIZE;
+
+    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    result->cacheattrs.shareability = 0;
+    result->cacheattrs.is_s2_format = false;
+    if (hcr & HCR_DC) {
+        if (hcr & HCR_DCT) {
+            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+        } else {
+            memattr = 0xff;  /* Normal, WB, RWA */
+        }
+    } else if (access_type == MMU_INST_FETCH) {
+        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+            memattr = 0xee;  /* Normal, WT, RA, NT */
+        } else {
+            memattr = 0x44;  /* Normal, NC, No */
+        }
+        result->cacheattrs.shareability = 2; /* outer sharable */
+    } else {
+        memattr = 0x00;      /* Device, nGnRnE */
+    }
+    result->cacheattrs.attrs = memattr;
+    return 0;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
@@ -2448,71 +2520,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        uint64_t hcr;
-        uint8_t memattr;
-
-        /*
-         * MMU disabled.  S1 addresses within aa64 translation regimes are
-         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
-         */
-        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-            int r_el = regime_el(env, mmu_idx);
-            if (arm_el_is_aa64(env, r_el)) {
-                int pamax = arm_pamax(env_archcpu(env));
-                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
-                int addrtop, tbi;
-
-                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-                if (access_type == MMU_INST_FETCH) {
-                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
-                }
-                tbi = (tbi >> extract64(address, 55, 1)) & 1;
-                addrtop = (tbi ? 55 : 63);
-
-                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                    fi->type = ARMFault_AddressSize;
-                    fi->level = 0;
-                    fi->stage2 = false;
-                    return 1;
-                }
-
-                /*
-                 * When TBI is disabled, we've just validated that all of the
-                 * bits above PAMax are zero, so logically we only need to
-                 * clear the top byte for TBI.  But it's clearer to follow
-                 * the pseudocode set of addrdesc.paddress.
-                 */
-                address = extract64(address, 0, 52);
-            }
-        }
-        result->phys = address;
-        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        result->page_size = TARGET_PAGE_SIZE;
-
-        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        result->cacheattrs.shareability = 0;
-        result->cacheattrs.is_s2_format = false;
-        if (hcr & HCR_DC) {
-            if (hcr & HCR_DCT) {
-                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-            } else {
-                memattr = 0xff;  /* Normal, WB, RWA */
-            }
-        } else if (access_type == MMU_INST_FETCH) {
-            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-                memattr = 0xee;  /* Normal, WT, RA, NT */
-            } else {
-                memattr = 0x44;  /* Normal, NC, No */
-            }
-            result->cacheattrs.shareability = 2; /* outer sharable */
-        } else {
-            memattr = 0x00;      /* Device, nGnRnE */
-        }
-        result->cacheattrs.attrs = memattr;
-        return 0;
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
     }
-
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
                                   is_secure, false, result, fi);
-- 
2.34.1


