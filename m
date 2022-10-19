Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D014604712
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:28:23 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol97N-0004tE-Hf
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ol7nw-0007vM-TV
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:04:13 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ol7nv-0001pp-42
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:04:12 -0400
Received: by mail-lf1-x12f.google.com with SMTP id b1so27711140lfs.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8JeEP61PnJSRl1IYlyG9KrqDkKKXF85PFTCCm74arPU=;
 b=oEMc7JK3IjVq94WMhod8oiOnqM4v7aoWzuMsop/Xptqr9aO4K8QK2887yIru7GKNIn
 IKddwcJ0sjag4LmQnitIuCk914SMvibyOIrVXmDcAA4XmN2q4jUwKls3j9KEn0B3ocTy
 W643Z18rVOmZbpI5kYoecBqie6eNsFy4Bi3/0GsI2CKXvcc3gXI+RWLOuGwc3UVuCIE+
 em9biic89FfJwJ3AvBLCw9b4AXO2Hnr3LmVihbd+Grrq5pW+Cy6ZOvT1cAl5/yQ7wg4T
 4TTPenNX6T0qIvog2N59kts7m3Envku/BzXYB6RZC9cIsNMnNXdd64glsa0gFI8knKNm
 zQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8JeEP61PnJSRl1IYlyG9KrqDkKKXF85PFTCCm74arPU=;
 b=ZmAOrkdnThYbYrX7HZuhccYES831Gzm7KlbYcFgdTAvlT5gLGjKv1b3apjn4FsQxE7
 XMGoX1f74XEchP4LY8ansWpuJ3UaF+A1Djk/IqrG7Ml5JhXcmO5ve3yLc6+C7d9z1cTU
 tX6oFJ6w0gfBTXDw6ALfPDIBlTPPVtqTBW4CCKb1GAJjFjyJEo5fPvaGOZofQKIG+rrk
 bSAvR/V8gzQUj2GDC58oDPMSD1D4oHorg6dJXPtFPDwKdTQl7B50D30YnPp28JStQVpj
 7AfWXnEpUbWIMwHxxv58vvCdRob1oXiQHPIzPlnbw5lOHAJL+82a9OGVYmLnDiq2dd1j
 Y59Q==
X-Gm-Message-State: ACrzQf1bZTUkU7kavIveR23cG30fpxPyZ+M+eI/mxEIwE8vJ0Yi7P0i+
 5/knFgzHV+srJ/EyTCxuJFU5O8S14T8=
X-Google-Smtp-Source: AMsMyM57JyWons1dEvvvEQE/zIMyeRaMsvm4wvsNAxmoKbt9ST2KPNo4N+Y9/kJsy4xdyZzOokiw/A==
X-Received: by 2002:a05:6512:3a4:b0:4a4:6db7:2d6b with SMTP id
 v4-20020a05651203a400b004a46db72d6bmr2589027lfp.403.1666181047512; 
 Wed, 19 Oct 2022 05:04:07 -0700 (PDT)
Received: from NBK05906.kdtln.ru (109-184-32-144.dynamic.mts-nn.ru.
 [109.184.32.144]) by smtp.gmail.com with ESMTPSA id
 z1-20020a2eb521000000b0026de2aa9c9csm2387639ljm.111.2022.10.19.05.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 05:04:07 -0700 (PDT)
From: Timofey Kutergin <tkutergin@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Timofey Kutergin <tkutergin@gmail.com>
Subject: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for aarch32
Date: Wed, 19 Oct 2022 15:03:53 +0300
Message-Id: <20221019120353.253671-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Oct 2022 09:18:21 -0400
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

- synchronize PSTATE.PAN with changes in CPSR.PAN in aarch32 mode
- set PAN bit automatically on exception entry if SCTLR_SPAN bit
  is set
- throw permission fault during address translation when PAN is
  enabled and kernel tries to access user acessible page
- ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).
---
 target/arm/helper.c |  6 ++++++
 target/arm/ptw.c    | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dde64a487a..5299f67e3f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9052,6 +9052,11 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+    if (env->uncached_cpsr & CPSR_PAN) {
+        env->pstate |= PSTATE_PAN;
+    } else {
+        env->pstate &= ~PSTATE_PAN;
+    }
     if (rebuild_hflags) {
         arm_rebuild_hflags(env);
     }
@@ -9592,6 +9597,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
                 /* ... the target is EL1 and SCTLR.SPAN is 0.  */
                 if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
                     env->uncached_cpsr |= CPSR_PAN;
+                    env->pstate |= PSTATE_PAN;
                 }
                 break;
             }
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23f16f4ff7..204a73350f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -659,6 +659,13 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             goto do_fault;
         }
 
+        if (regime_is_pan(env, mmu_idx) && !regime_is_user(env, mmu_idx) &&
+            simple_ap_to_rw_prot_is_user(ap >> 1, 1) &&
+            access_type != MMU_INST_FETCH) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
         if (arm_feature(env, ARM_FEATURE_V6K) &&
                 (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
             /* The simplified model uses AP[0] as an access control bit.  */
@@ -2506,7 +2513,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
                                   is_secure, false, result, fi);
-    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
+    } else if (arm_feature(env, ARM_FEATURE_V7) ||
+               arm_feature(env, ARM_FEATURE_V8) || (
+               regime_sctlr(env, mmu_idx) & SCTLR_XP)) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
     } else {
-- 
2.25.1


