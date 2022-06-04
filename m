Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D265653D530
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:17:57 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLEa-000870-VJ
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3L-0007ee-DU
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3I-0008Ux-34
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o17so8116373pla.6
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4IKm5/6a1/dcANetGpDLVd36P90uuIasmbq4QESC+o=;
 b=Blo+DeoiQ3IjHCO2/54jrU6SiQ+zmKnaa0809zl3p/loNdwM4dXpAsPkkfCrb9sePI
 TBU1A290/lxAKcsu7cEoDNBDUKYZsKfL943qEjwzAwDtg2DC9ijFEQlbrSfSuSuuUrhf
 CTBS3RQGtfzeS4ELxNnkCazKdboa8jWtZPnCLP8zNrNvXkPNuH45Ley7oyiaH3Tbjcmj
 OzHL383jYJCt5R/jpAa4xaZGgX8cNf7VduN7HoV742IIJORGvLbV6RPfpNxVV2emOEsg
 aVmLYFeoErdR15YClUSMevEvZ9MUFH7wRV4uZpuCMHep2PuQucLfyVTODyT3U30KzATn
 T1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4IKm5/6a1/dcANetGpDLVd36P90uuIasmbq4QESC+o=;
 b=cStvc8BB24NsZWck/DHZm0NUVG4DmQwGbZ492ecZVtYocPFt4EZwhraSBzw3qV8Z5e
 9seL4zWzCmz+yl0xMApkq/grJq1NqwPCFF/Cd8u0vV/+FRcjuLeHGUO3nju0jedEmKKs
 dKmlT0AUkCYT3JjhlX6bnbIHz5MrTo6A7zj0hSh7+wxJPT7OgPiuuiYbbu6Ce4B9oFwF
 qm+IZIMix0rN1E1WSm9JFyFvwhYxw/LJnQW0W99od9Zg6B0utxCntexFUXJVdS5SK8GS
 GIDA0olkAuHEsDe3cxWbIGqu4wvCcBYiU6pyle3p032QuVuyZAn8n/JPF3UJfwlJUSPu
 m43A==
X-Gm-Message-State: AOAM530vtYv5G61OV0fwNrqxxKnTduvwKMsmGz+kFSxIkNpksdEdaYWA
 VR7grG2+hOSR0gSVhtWXrn9/JwyuGOJTcw==
X-Google-Smtp-Source: ABdhPJzdJpJZ4SrqqzK158FaCI+9PqD0fRJXn3vlLmbNEF3d8VZEVU8tR0+ssdJ7oumZocEFyZkvIQ==
X-Received: by 2002:a17:902:9b8a:b0:163:d0ad:f9e8 with SMTP id
 y10-20020a1709029b8a00b00163d0adf9e8mr12889714plp.79.1654315575256; 
 Fri, 03 Jun 2022 21:06:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/28] target/arm: Move get_phys_addr_pmsav7_default to ptw.c
Date: Fri,  3 Jun 2022 21:05:45 -0700
Message-Id: <20220604040607.269301-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 +++
 target/arm/helper.c | 41 -----------------------------------------
 target/arm/ptw.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 324a9dde14..d6e3fee152 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,6 +33,9 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
+void get_phys_addr_pmsav7_default(CPUARMState *env,
+                                  ARMMMUIdx mmu_idx,
+                                  int32_t address, int *prot);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31abcf6fc9..7dd54c1863 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11642,47 +11642,6 @@ do_fault:
     return true;
 }
 
-static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                                ARMMMUIdx mmu_idx,
-                                                int32_t address, int *prot)
-{
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        *prot = PAGE_READ | PAGE_WRITE;
-        switch (address) {
-        case 0xF0000000 ... 0xFFFFFFFF:
-            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
-                /* hivecs execing is ok */
-                *prot |= PAGE_EXEC;
-            }
-            break;
-        case 0x00000000 ... 0x7FFFFFFF:
-            *prot |= PAGE_EXEC;
-            break;
-        }
-    } else {
-        /* Default system address map for M profile cores.
-         * The architecture specifies which regions are execute-never;
-         * at the MPU level no other checks are defined.
-         */
-        switch (address) {
-        case 0x00000000 ... 0x1fffffff: /* ROM */
-        case 0x20000000 ... 0x3fffffff: /* SRAM */
-        case 0x60000000 ... 0x7fffffff: /* RAM */
-        case 0x80000000 ... 0x9fffffff: /* RAM */
-            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            break;
-        case 0x40000000 ... 0x5fffffff: /* Peripheral */
-        case 0xa0000000 ... 0xbfffffff: /* Device */
-        case 0xc0000000 ... 0xdfffffff: /* Device */
-        case 0xe0000000 ... 0xffffffff: /* System */
-            *prot = PAGE_READ | PAGE_WRITE;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-}
-
 static bool pmsav7_use_background_region(ARMCPU *cpu,
                                          ARMMMUIdx mmu_idx, bool is_user)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5c32648a16..74650c6c52 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -374,6 +374,47 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
+void get_phys_addr_pmsav7_default(CPUARMState *env,
+                                  ARMMMUIdx mmu_idx,
+                                  int32_t address, int *prot)
+{
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        *prot = PAGE_READ | PAGE_WRITE;
+        switch (address) {
+        case 0xF0000000 ... 0xFFFFFFFF:
+            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
+                /* hivecs execing is ok */
+                *prot |= PAGE_EXEC;
+            }
+            break;
+        case 0x00000000 ... 0x7FFFFFFF:
+            *prot |= PAGE_EXEC;
+            break;
+        }
+    } else {
+        /* Default system address map for M profile cores.
+         * The architecture specifies which regions are execute-never;
+         * at the MPU level no other checks are defined.
+         */
+        switch (address) {
+        case 0x00000000 ... 0x1fffffff: /* ROM */
+        case 0x20000000 ... 0x3fffffff: /* SRAM */
+        case 0x60000000 ... 0x7fffffff: /* RAM */
+        case 0x80000000 ... 0x9fffffff: /* RAM */
+            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            break;
+        case 0x40000000 ... 0x5fffffff: /* Peripheral */
+        case 0xa0000000 ... 0xbfffffff: /* Device */
+        case 0xc0000000 ... 0xdfffffff: /* Device */
+        case 0xe0000000 ... 0xffffffff: /* System */
+            *prot = PAGE_READ | PAGE_WRITE;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


