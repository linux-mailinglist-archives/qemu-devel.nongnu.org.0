Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DC604710
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:28:16 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol97G-0004Zs-PD
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ol7z7-0002Lw-Lk
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:15:46 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ol7z5-0003ku-C8
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:15:45 -0400
Received: by mail-lf1-x129.google.com with SMTP id bu25so27828516lfb.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V036MnXk423r1p3MPItuIEsWW83jQBKVOpTBCpx9n+A=;
 b=BjkVDiFmzeO3/kRKjI0TymMpiGSKMPW5j4KRdpLF69vk5UnlcRjdyCw6BnLqwPob/b
 6H02Tlld/LI4eomsxysXWyY9hxL8bkUSmVMy1wezuTesz8zG2g+ieC7M28gbegeFsM7O
 c5sw20LLN5c2rer5ElIRdzylFXzaS/4WBUODqA8pudxzQYbQq5NGOxb4ct95CXwzTISa
 uLMee9uEYZA/k617N7BBueZD/Mq26Pb7YvkLAE51U4q4V8q7htveuKM11bsosZML60pl
 yLnmt0pWXooFABQbJqpJY6LbdkLgafLstglEQhS2us8NoIOA+go9OOSBca72RmfOaZdC
 mEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V036MnXk423r1p3MPItuIEsWW83jQBKVOpTBCpx9n+A=;
 b=D5TTDNeUZqpGizcuBV7ATbstcENHwi3cnztAyLQlpdGRw4Om728w4MBpRcT1KUb6Fo
 FCx+oFWS+eZ1wOyDeo34qle6qIxo27iwJVMC4BLOjBRxdssp2nEevB/Za4SRKPe+cJA/
 VZoK0L4b65DvXrvHyFVZQbXt2geEqvOqb4p2pSBHcv3wj1tvApg1yLQ5+sdaIBIoFXCO
 azpjhSzH9Uk4TAI3IN31dA3FDP01aKrT+MFotZBz+z5gwonNbhz+xJ5imzPjfOEfLnQv
 qCHb7R1qXS5RJBo67CeSkU3fWFYsf+A0e9uLXMCwpKA5OL5V8lbgfnXtkOSlg4homHG7
 jUww==
X-Gm-Message-State: ACrzQf0O5/bDlWIcV6xp6AWLul7PLSIKRQ2VSFyMRWgRRXdmWcpS0C1B
 tNehnwLqTmtZiWhtHaXgPg86ur7eens=
X-Google-Smtp-Source: AMsMyM6SOuXhzWdFMNZGvS+ayBS2EYMjW8Fr3evWfJ6tmq0KcRcVipnHL+7Aa4Pvbb3xugAN7IZQlQ==
X-Received: by 2002:ac2:5189:0:b0:4a2:3bc6:27f2 with SMTP id
 u9-20020ac25189000000b004a23bc627f2mr3017209lfi.73.1666181740657; 
 Wed, 19 Oct 2022 05:15:40 -0700 (PDT)
Received: from NBK05906.kdtln.ru (109-184-32-144.dynamic.mts-nn.ru.
 [109.184.32.144]) by smtp.gmail.com with ESMTPSA id
 p8-20020a2eb988000000b0026dd2038b99sm2437072ljp.132.2022.10.19.05.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 05:15:40 -0700 (PDT)
From: Timofey Kutergin <tkutergin@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Timofey Kutergin <tkutergin@gmail.com>
Subject: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for aarch32
Date: Wed, 19 Oct 2022 15:15:37 +0300
Message-Id: <20221019121537.255477-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x129.google.com
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

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
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


