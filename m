Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838405F1DEF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:54:03 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefkY-000191-Gs
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHg-0006ox-9A
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:12 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHe-0006Hd-4M
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:11 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j8so4634387qvt.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K3rpZd1EKThuVcaxZvC1gnAW/rSp7G0JgKV3rWVzF/U=;
 b=ax2/MuvRV0e/qM/5d/H45ZxqBfRqNzK1my09PMLQHUi1M0OFCKGMwUNiaDik9Bvv11
 rB83RCT8CraxqZ2gTuqF2M1yDvAW+pmQHIsE+6GfaMExgA84HlozRGvCemJD6t+sdLfR
 zaRgk2X1aebi8PpSpTseudwwD/1T4CxG8bHoRPUXnuSmI3VZZhAtGVAuOPOmVRjN3+6v
 uvb7PWkzPotow0lwMWoFLN8wt1eGHw0rChZlHBm2PZbgGp4oUPr+t2c4hpt0+qcHxOos
 5zb0PYpPkFQaH0Y6vzWhkizPvCW4ODziQy8QAgSmjPD+uIrp7xUtcNw0H2QTemLexYC8
 MJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K3rpZd1EKThuVcaxZvC1gnAW/rSp7G0JgKV3rWVzF/U=;
 b=kO2jiMD3zPVjJNNTb/O7FhaBZYrvj6sweAdhUDEGQOhNSWVTT4Jl20k5rlBZVh2+TC
 2DHEA7xZL7wFmVM4Z5arqRpnd01Ipwd4UJr8XWJijbiFChhIrXgjXGJCbJsLijVouepj
 RtP5EUnej6M+vid+akTLI9tDO5Nkh8bfvCT2BVzWq3/3gcwNNzLa48NhXhmS+JPLRzln
 /OfDG5QhSW8BVEhQQUOlPJODaP67qH6BNyBomB5MvoFfHQNfrm7T8bqlzPJn8B5fqS+V
 wAL+q7PMWLCJlwc2smvIQ20exeT7LTHVuKUcaFdMiT2T4LofIYUxXjQ/D0YWTGKcqahA
 qqAw==
X-Gm-Message-State: ACrzQf0RVgf91egTSEUod4ZK5QDHMawcnXYk/oUsXsW/8FsmE+kyt62p
 TzXO48s8oTJaZab2upzr8x+2DxUCqaurTw==
X-Google-Smtp-Source: AMsMyM6YdhbnX55x2XE1G9VaVBrsaOt2IRlKDWRASxj4KGXrvdTeojZbVty+VuYaKRTQEtX3rKT8Aw==
X-Received: by 2002:a05:6214:2385:b0:474:78de:f8dd with SMTP id
 fw5-20020a056214238500b0047478def8ddmr11227933qvb.66.1664641449269; 
 Sat, 01 Oct 2022 09:24:09 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 19/42] target/arm: Fix cacheattr in get_phys_addr_disabled
Date: Sat,  1 Oct 2022 09:22:55 -0700
Message-Id: <20221001162318.153420-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Do not apply memattr or shareability for Stage2 translations.
Make sure to apply HCR_{DC,DCT} only to Regime_EL10, per the
pseudocode in AArch64.S1DisabledOutput.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not use a switch or a goto.
---
 target/arm/ptw.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e494a9de67..8d27a98a42 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2282,11 +2282,12 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
-    uint64_t hcr;
-    uint8_t memattr;
+    uint8_t memattr = 0x00;    /* Device nGnRnE */
+    uint8_t shareability = 0;  /* non-sharable */
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
         int r_el = regime_el(env, mmu_idx);
+
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
@@ -2314,32 +2315,33 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
              */
             address = extract64(address, 0, 52);
         }
+
+        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+        if (r_el == 1) {
+            uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+            if (hcr & HCR_DC) {
+                if (hcr & HCR_DCT) {
+                    memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+                } else {
+                    memattr = 0xff;  /* Normal, WB, RWA */
+                }
+            }
+        }
+        if (memattr == 0 && access_type == MMU_INST_FETCH) {
+            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                memattr = 0xee;  /* Normal, WT, RA, NT */
+            } else {
+                memattr = 0x44;  /* Normal, NC, No */
+            }
+            shareability = 2; /* outer sharable */
+        }
+        result->cacheattrs.is_s2_format = false;
     }
 
     result->phys = address;
     result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     result->page_size = TARGET_PAGE_SIZE;
-
-    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-    result->cacheattrs.shareability = 0;
-    result->cacheattrs.is_s2_format = false;
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


