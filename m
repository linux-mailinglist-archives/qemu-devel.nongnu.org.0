Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1E564676
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:38:57 +0200 (CEST)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w48-0003t4-I9
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzr-0001qj-Q7
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzq-0006rC-2g
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:27 -0400
Received: by mail-pf1-x434.google.com with SMTP id a15so6327617pfv.13
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jSRI4ytW1sFMKbuxbbpqso1yyhuZxQO9hmINCal5n3U=;
 b=GAvxKuOc20SOBp8VQ6wHvnSUQffmw9QPpbW+G6hu/Flm3VYu8DTrezT/cJlG0B15dz
 8lTLEQB3NuyvYhTfZSFblmhIBcYECpGfRT+9OvfTNbkBG3CaEzMN/ye2XS/alrHHyuv4
 aSnzHHCaauUWmHt/lxzInDrz+KEppAy8mV3wEtQFuyxBgxdf/15yqbEKzX4Iz6hB+DER
 AiE/bjDYB3RGzAHejT//hmzEYUYCdJss2QCMY7wQNn41U1JStvyyxpGXC+E3AfWSwDJP
 XVq2vlj6/nx/2Bhu/8ECWUD6tiZrb9U2+cbkUzxWcdgX0rKYp8IqVO8DNnw/xNq3Fbyu
 pyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSRI4ytW1sFMKbuxbbpqso1yyhuZxQO9hmINCal5n3U=;
 b=QrbY9Qa7xTSgmT/BI5wkXxC2Y8ErFCeEtrefSN5tNvDHZVh/YEcP+otYv4a93ZAwo5
 IO/2GcnvBydnVsDrBUlZRkN2lqlLcViN3CBCVrMyMyn8qt3RXmBYgePTKRtMSouvWxW7
 5kCaj4o8eiWfrx0TnPUpmTKsWnCSsaqAY861h4RQM+lYOs+nDDkyjw0XJFeNC3HbfZ7E
 tWQ5lEN3nBKpIXOGUGNrti3uFiPOIOe2HDwcQY99x+q71SOpw74bi9W6x6c5IF1c+TG9
 DGaCjDbNCDVtrjJ5ICcHhsDYTjWbnkFiLdN40VuLNpiMZOLJAEWBYuf7jpH2Ch8QwzLr
 3t+A==
X-Gm-Message-State: AJIora8e0QoyZ2QC16rU3gTjXBKjczWuT9mrmpNz/SZpOphc/ywZdxVk
 Jt/mY/7Tq8yE2a/trSF+dZhJ/aW5mFDOBKaX
X-Google-Smtp-Source: AGRyM1tMp8M3hO0iYcQIUXpYiSXFU/ZYPlFmUVnEq4wx5ewn0yP6aTh57CW7/7XLF267azslyjKmGw==
X-Received: by 2002:a63:80c8:0:b0:411:73dd:809b with SMTP id
 j191-20020a6380c8000000b0041173dd809bmr19793594pgd.441.1656837024835; 
 Sun, 03 Jul 2022 01:30:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 59/62] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:54:16 +0530
Message-Id: <20220703082419.770989-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Always overriding fi->type was incorrect, as we would not
properly propagate the fault type from S1_ptw_translate,
or arm_ldq_ptw.  Simplify things by providing a new label
for reporting a translation fault.  For other faults, store
into fi directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a3f063e0bc..678ad2ac0c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1012,8 +1012,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1051,8 +1049,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1089,8 +1086,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1122,7 +1118,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
@@ -1153,8 +1149,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1173,8 +1168,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1196,7 +1190,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1246,7 +1240,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1264,7 +1258,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1321,9 +1315,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1340,8 +1334,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1385,8 +1379,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     result->page_size = page_size;
     return false;
 
-do_fault:
-    fi->type = fault_type;
+ do_translation_fault:
+    fi->type = ARMFault_Translation;
+ do_fault:
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-- 
2.34.1


