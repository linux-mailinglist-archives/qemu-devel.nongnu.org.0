Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65C560F639
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:31:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo12U-0007xM-Kd; Thu, 27 Oct 2022 07:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1oo11m-0007b9-ET
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:26:44 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1oo11k-0002Nq-7I
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:26:26 -0400
Received: by mail-lf1-x134.google.com with SMTP id d25so1731508lfb.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vmf3VSvVLIrnwSIypw7sdeLLB+aO0SyQfleISwOgc/4=;
 b=k2/8R5kODBJ4UTRhOceh/ymHNCp9Rz5fzsCQuJoSFVW48MXnAJEH0d/DAAYN85rhvP
 xQ5iA1Aenv4okCxTqiVmTJp1T6mp9gVOf3PnNUji5516StpbAwEzIcPL0KLKR6K3Cvkm
 t5ayL7ZSesjoW9mhAKp1qY9zMykBSNf/aVmAf2lIolg2DgovgoiX8YgUsJg760Tb2RHU
 W/3EbFL7/+ZR+uBuZxf/36qcO9qGJqLplCLwhuplAx4BOHDHfwUi+c3OYFzRgffqhJ87
 tD6EmwxjjHOgu4UTDIKcRLalGiYp3kDn5aEnclbPvWuNWnOAY/NkKJ7vhtwm5qBXtFHY
 o1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vmf3VSvVLIrnwSIypw7sdeLLB+aO0SyQfleISwOgc/4=;
 b=WdpSK4VImA+6/+QYiuTlGfBeIJBnrdhK1yTrreJzYT1pR4S8lbiZxfXfsxVA7ePtlB
 TqI0bkTDhQWAukLmnoT9ZS9V95rC2kXvkkxKQMgzNwM67ODiJBm8FOVeBgJXWXNv0WeI
 Ezq+plYfP+5bhwnwY6FSnXV2TrofPBX0iUdzy7UHNfBBoz1t9KYo2Lyh3MOpiiAigkbt
 PEN8xSX+JoSsikrhFbctJdhVjuOAW5+7VacrH3fy4e7R69GehyXK35JVLXdyfq4UmD3b
 VHQuYD5seFwGQCkIKnAzs5JyseiTDQc9LyzjLS/258nBgJd6gPjm52dMsvVO8tx3fwus
 VKiw==
X-Gm-Message-State: ACrzQf0yA9gpL7sr9sPPqnrlJFQgmBGPQHiHRIh84Ph9lFBaZoTtjkuD
 kDpTewwXzst455QkaOeU/7U=
X-Google-Smtp-Source: AMsMyM7FPqrPowbyZHY131RZoRnaZ2tHlSFpOp2nkcFptnGuW5K6x8zNdu5Y85ZiK3lT4+5Bb3PiFA==
X-Received: by 2002:a05:6512:54a:b0:4af:b4ac:c2bb with SMTP id
 h10-20020a056512054a00b004afb4acc2bbmr2437171lfl.650.1666869982330; 
 Thu, 27 Oct 2022 04:26:22 -0700 (PDT)
Received: from NBK05906.kdtln.ru (79-126-2-255.dynamic.mts-nn.ru.
 [79.126.2.255]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05651236cb00b0048a9e18ae67sm152792lfs.84.2022.10.27.04.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 04:26:21 -0700 (PDT)
From: Timofey Kutergin <tkutergin@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	tkutergin@gmail.com
Subject: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for aarch32
Date: Thu, 27 Oct 2022 14:26:19 +0300
Message-Id: <20221027112619.2205229-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

    - Use CPSR.PAN to check for PAN state in aarch32 mode
    - throw permission fault during address translation when PAN is
      enabled and kernel tries to access user acessible page
    - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
---
 target/arm/helper.c | 13 +++++++++++--
 target/arm/ptw.c    | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..4301478ed8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10992,6 +10992,15 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
+static bool arm_pan_enabled(CPUARMState *env)
+{
+    if (is_a64(env)) {
+        return env->pstate & PSTATE_PAN;
+    } else {
+        return env->uncached_cpsr & CPSR_PAN;
+    }
+}
+
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
@@ -11012,7 +11021,7 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
         }
         break;
     case 1:
-        if (env->pstate & PSTATE_PAN) {
+        if (arm_pan_enabled(env)) {
             idx = ARMMMUIdx_E10_1_PAN;
         } else {
             idx = ARMMMUIdx_E10_1;
@@ -11021,7 +11030,7 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
     case 2:
         /* Note that TGE does not apply at EL2.  */
         if (arm_hcr_el2_eff(env) & HCR_E2H) {
-            if (env->pstate & PSTATE_PAN) {
+            if (arm_pan_enabled(env)) {
                 idx = ARMMMUIdx_E20_2_PAN;
             } else {
                 idx = ARMMMUIdx_E20_2;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..a82accab40 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -433,12 +433,11 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
  * @mmu_idx:     MMU index indicating required translation regime
  * @ap:          The 3-bit access permissions (AP[2:0])
  * @domain_prot: The 2-bit domain access permissions
+ * @is_user: TRUE if accessing from PL0
  */
-static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                         int ap, int domain_prot)
+static int ap_to_rw_prot_is_user(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot, bool is_user)
 {
-    bool is_user = regime_is_user(env, mmu_idx);
-
     if (domain_prot == 3) {
         return PAGE_READ | PAGE_WRITE;
     }
@@ -482,6 +481,20 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+/*
+ * Translate section/page access permissions to page R/W protection flags
+ * @env:         CPUARMState
+ * @mmu_idx:     MMU index indicating required translation regime
+ * @ap:          The 3-bit access permissions (AP[2:0])
+ * @domain_prot: The 2-bit domain access permissions
+ */
+static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot)
+{
+   return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
+                                regime_is_user(env, mmu_idx));
+}
+
 /*
  * Translate section/page access permissions to page R/W protection flags.
  * @ap:      The 2-bit simple AP (AP[2:1])
@@ -644,6 +657,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
     hwaddr phys_addr;
     uint32_t dacr;
     bool ns;
+    int user_prot;
 
     /* Pagetable walk.  */
     /* Lookup l1 descriptor.  */
@@ -749,8 +763,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
             result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            user_prot = simple_ap_to_rw_prot_is_user(ap >> 1, 1);
         } else {
             result->f.prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            user_prot = ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot, 1);
         }
         if (result->f.prot && !xn) {
             result->f.prot |= PAGE_EXEC;
@@ -760,6 +776,14 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
             fi->type = ARMFault_Permission;
             goto do_fault;
         }
+        if (regime_is_pan(env, mmu_idx) &&
+            !regime_is_user(env, mmu_idx) &&
+            user_prot &&
+            access_type != MMU_INST_FETCH) {
+            /* Privileged Access Never fault */
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
     }
     if (ns) {
         /* The NS bit will (as required by the architecture) have no effect if
@@ -2606,7 +2630,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, ptw, address, access_type, false,
                                   result, fi);
-    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
+    } else if (arm_feature(env, ARM_FEATURE_V7) ||
+               regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
         return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
-- 
2.25.1


