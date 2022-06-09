Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325155447E6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:46:06 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEjs-0000aN-R4
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE73-0001UF-4s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE71-00060e-Fu
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id q15so23422931wrc.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=llQtcWwNeSrJSmpF2SS5+s+znVWOvXUe+nYV4DkHFB4=;
 b=tBALSHNWAyN9UYpJHD52j7m83ptiodFB7YAUi+majjleYBx3mPloAHpiukNoXNZPJb
 spNWz7uajzeqcgJYdEfTOgIJe5WLsact9HM/liGCOiiHo6PDviZGc46J5hpoUzUzT2/h
 uCCvpwdKia4VN0f8tROT0570M12xTMRfFZkpguB9oQ1WUX0pQ5yQzBJksLXafaT+NqlD
 IrydJyLhuxRIPPT2sww2LP2WVqN4JwXAtW1CdLFUzK6ZAVEMAjJEI3SbJH3HHmvkcTCp
 klhe23xK0WUHQcwaIYhfhjrZd+LjRnRunmMZUwKblR7IypuETdhcUJPczPxEeD1NYsLI
 gtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=llQtcWwNeSrJSmpF2SS5+s+znVWOvXUe+nYV4DkHFB4=;
 b=Zfh+1oFesjhyhsgvNQg8K2zgHKVDOynKUdoKbKRgGXFscQijb5lJy6/zdxWK5eHBT5
 tfIDuDLicUUg6asFEqT74jOQu6qotxtxzAKvKcP3LAQ1yByDBPcWcMMayyJbmvaWTCm0
 3pz0Zpdyt2pFWs0rdy2D11aMehq69DmFvMKOKjXtedqaxUG4pPBjT0G4t2jqgcLSi8L4
 55qDwT4PvX7k6iqbZe8yk3l2ubqSD6/y1Zp38iecIubEOmulfzpXnoruA8w4URnK4xdU
 qOU1OCG+Biu7/6t/waHWfZrRYgiQyLHvlnc4eA3x4QesSQS95WChhb30AsBm6CrtuG+T
 eMxQ==
X-Gm-Message-State: AOAM5303z5aUc0D/bUCal6Tc2V4AnFWmVOfow7ZZcAacU5AtN7ypEgXu
 qx0Tfcxt1t0QrfACMv3cfIthSLVolQ8BJQ==
X-Google-Smtp-Source: ABdhPJzV0wkaPPJUmyjRs64kd4mzzjZELuO38IdwzBp2MMzZ2rqK2m2ib2+LpnWZG8Pl37IYY/U2ww==
X-Received: by 2002:a5d:64c7:0:b0:218:4a82:ffa4 with SMTP id
 f7-20020a5d64c7000000b002184a82ffa4mr15854122wri.592.1654765554687; 
 Thu, 09 Jun 2022 02:05:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/55] target/arm: Move get_phys_addr_pmsav7_default to ptw.c
Date: Thu,  9 Jun 2022 10:04:55 +0100
Message-Id: <20220609090537.1971756-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-7-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  3 +++
 target/arm/helper.c | 41 -----------------------------------------
 target/arm/ptw.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 324a9dde140..d6e3fee1523 100644
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
index 5d010190108..d4f7c05625c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11678,47 +11678,6 @@ do_fault:
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
index 5c32648a16a..74650c6c525 100644
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
2.25.1


