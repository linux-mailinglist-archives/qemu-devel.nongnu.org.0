Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4059C598
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:59:44 +0200 (CEST)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBiA-0004yV-5O
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9M4-0000zK-2E
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9La-0000hK-TR
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso11649523pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iXS0aJbutd/f8RQ8+U+qwbi40Uh9HNiJ8CeYjNnRgmU=;
 b=r3R4MY7A+vxIM8ux/FhZRt+x8nNWqlUZkim+nYjquB65yzGMh5WIqDjwLHm2lZkaVC
 FZkujjThzqt79bc2NOTD6xne4dV1fYyyvtPy0cLqrR8KpmfWj1T0ucd1tDC4InaSaytG
 O/B2FKFQGUgYN1tB0t76/rsz5815MPYHCC4uFl4jiaqRXIO75XImARPj/x7nu+cP4U3T
 qNRErMNFj8M8ZxQ41SCQ/1Ml9YmCwV6pR12N2akeBlNPZOz5wK2jhaJsszuO7t3NYc1j
 ALiRF/iwZm9g30AHWVdb57kZrMkF/7MvXMrKUlxVxTsim0ORQL69bhEdvsQ7W8YYgMxE
 Fi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iXS0aJbutd/f8RQ8+U+qwbi40Uh9HNiJ8CeYjNnRgmU=;
 b=VuX4AMzgiPALfsUCwceSLjurBsV7OeijoKdJUFUNyDpsQPRXrZMlJF8zQqCag4IQRf
 6g4tIR0iRVnJH8idqfYB2fHVpXXpG8S72X9C1mDqzd9RotD3KlsEndn+YaBPvz91d362
 ES5HcZkwpR67HQ4O9MYsTlbSL7Dx5N61XK7W3FeuIfYJeN50OX87SZHgvtYJgwxnkhFq
 xXAcKXGIoWDfm8bZAxx/zhU7U9BORjHXgXnG5uBYtsz29HR3MuesbLxmE/hs0yR26uFV
 7T+MlBCNjn9vp+uyIWCwmkVwenHE2MBIySytqaXN7bHE2PBGpXuFrRRD9vjCXIw7WL1s
 BV7w==
X-Gm-Message-State: ACgBeo3J76Vz1/OU0o7G77uZLmenmNKleodZDAUAiNCdea/1KDHS00Ot
 U125hNc7pMGldP6yRoFFNrXxDZnRvHzcSg==
X-Google-Smtp-Source: AA6agR5ozWBFFDuN99luOBh606LF/2rSVYBkjfAfJi3E12DJuJ1TkP+fJ5sMe/JEUUEzvVNuwvNQVQ==
X-Received: by 2002:a17:902:a5cc:b0:170:d1cf:ac83 with SMTP id
 t12-20020a170902a5cc00b00170d1cfac83mr20431235plq.14.1661182094058; 
 Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 35/66] target/arm: Split out get_phys_addr_disabled
Date: Mon, 22 Aug 2022 08:27:10 -0700
Message-Id: <20220822152741.1617527-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
index 4da932b464..c798b30db2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2271,6 +2271,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
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
+            uint64_t tcr = env->cp15.tcr_el[r_el];
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
@@ -2451,71 +2523,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
-                uint64_t tcr = env->cp15.tcr_el[r_el];
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


