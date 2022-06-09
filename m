Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E327B54479C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:34:00 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEYB-0002Zw-HR
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE72-0001U8-R4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE70-00061B-Vt
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso12264463wmr.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3/ajaWjvxs0DjIe4wzlTwAQI78+yJDb5luhxxky7riw=;
 b=NHUiQjtUMYG/VXcQjkFsEMfzlssyJz6ZTLF8bZjheJXP4T/njF18PFDS08qnXbd9JG
 np0UyhmKifFdIznxG5JP5unZ4jR1F+aOcL4kELB7gXlrPSdiq4GkQgAubRMlndIHUJC/
 dBlU4T7aAJ91YGWxf3j6cvvZjRmHP+rxoIB7K9eONNuUjAqheI6XsDy5jTCG226tJjK8
 xeiZdvkURQZ8BdPxfgKfj2kIqmuIjOBA+fSPbs8Pi4o4s/ZD86usbqPp8dWMbEuqckZR
 uQKKh6+kUo6wVLAFlV/0ItgnNG4uZQ+Dy7UJNlX3Pz3u0N3S1M4XgeS1dYEVi+OsISVn
 4r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/ajaWjvxs0DjIe4wzlTwAQI78+yJDb5luhxxky7riw=;
 b=uzRZ29l8jMkr1ZFYH5LR3frdS8fUjB3Gdow/GdSTi3jSEVRZ2Dnm7UWu2qtbMXdKt+
 QNv7UMA1TGZorwkMzYuY7JvP3k4PJBi7trCssN0QeSTahQgsTilpm3jlhIVEHhDhMLWA
 90iyS5JGTK2K7CuAoj4uFE82E2Kk37kTa29Zr+ST5Qk/XuiYU0uHuyuTY5LaK4gsl6ME
 WINQkN6ODzkfpv1SRozcdb/kK0HDUTBr1mNXwDAa5FLsUVVhvKI0kHuVB9oHdKwlNCJj
 VKulO0TwUdZe0BnrNdOvrLWoGSS2whMI8GtyJphcUq0SVUnHueWtqd4cfImrZfGbieSr
 rmFQ==
X-Gm-Message-State: AOAM531ot1xQG1PX3ZwC46OxzWjZdzqQd10xjrMEbQgO4xeyO0WPsncO
 IWfD5GgN/DOfPJQu0g9S2OKLY5ilqzNQLw==
X-Google-Smtp-Source: ABdhPJzDvC3bjN3CTkteihx0D2NQZhWrFGk1NDIvsJYj4C4JBddtvOVhZdeG2WM5zk5nE9SYSD+tVQ==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr2278909wmg.104.1654765553651; 
 Thu, 09 Jun 2022 02:05:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/55] target/arm: Move get_phys_addr_pmsav5 to ptw.c
Date: Thu,  9 Jun 2022 10:04:54 +0100
Message-Id: <20220609090537.1971756-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-id: 20220604040607.269301-6-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  4 ---
 target/arm/helper.c | 85 ---------------------------------------------
 target/arm/ptw.c    | 85 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 89 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 349b842d3ce..324a9dde140 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,10 +33,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          ARMMMUFaultInfo *fi);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4a588220250..5d010190108 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12274,91 +12274,6 @@ bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     return ret;
 }
 
-bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          ARMMMUFaultInfo *fi)
-{
-    int n;
-    uint32_t mask;
-    uint32_t base;
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    if (regime_translation_disabled(env, mmu_idx)) {
-        /* MPU disabled.  */
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return false;
-    }
-
-    *phys_ptr = address;
-    for (n = 7; n >= 0; n--) {
-        base = env->cp15.c6_region[n];
-        if ((base & 1) == 0) {
-            continue;
-        }
-        mask = 1 << ((base >> 1) & 0x1f);
-        /* Keep this shift separate from the above to avoid an
-           (undefined) << 32.  */
-        mask = (mask << 1) - 1;
-        if (((base ^ address) & ~mask) == 0) {
-            break;
-        }
-    }
-    if (n < 0) {
-        fi->type = ARMFault_Background;
-        return true;
-    }
-
-    if (access_type == MMU_INST_FETCH) {
-        mask = env->cp15.pmsav5_insn_ap;
-    } else {
-        mask = env->cp15.pmsav5_data_ap;
-    }
-    mask = (mask >> (n * 4)) & 0xf;
-    switch (mask) {
-    case 0:
-        fi->type = ARMFault_Permission;
-        fi->level = 1;
-        return true;
-    case 1:
-        if (is_user) {
-            fi->type = ARMFault_Permission;
-            fi->level = 1;
-            return true;
-        }
-        *prot = PAGE_READ | PAGE_WRITE;
-        break;
-    case 2:
-        *prot = PAGE_READ;
-        if (!is_user) {
-            *prot |= PAGE_WRITE;
-        }
-        break;
-    case 3:
-        *prot = PAGE_READ | PAGE_WRITE;
-        break;
-    case 5:
-        if (is_user) {
-            fi->type = ARMFault_Permission;
-            fi->level = 1;
-            return true;
-        }
-        *prot = PAGE_READ;
-        break;
-    case 6:
-        *prot = PAGE_READ;
-        break;
-    default:
-        /* Bad permission.  */
-        fi->type = ARMFault_Permission;
-        fi->level = 1;
-        return true;
-    }
-    *prot |= PAGE_EXEC;
-    return false;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6a1f4b549d8..5c32648a16a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -289,6 +289,91 @@ do_fault:
     return true;
 }
 
+static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, int *prot,
+                                 ARMMMUFaultInfo *fi)
+{
+    int n;
+    uint32_t mask;
+    uint32_t base;
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    if (regime_translation_disabled(env, mmu_idx)) {
+        /* MPU disabled.  */
+        *phys_ptr = address;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return false;
+    }
+
+    *phys_ptr = address;
+    for (n = 7; n >= 0; n--) {
+        base = env->cp15.c6_region[n];
+        if ((base & 1) == 0) {
+            continue;
+        }
+        mask = 1 << ((base >> 1) & 0x1f);
+        /* Keep this shift separate from the above to avoid an
+           (undefined) << 32.  */
+        mask = (mask << 1) - 1;
+        if (((base ^ address) & ~mask) == 0) {
+            break;
+        }
+    }
+    if (n < 0) {
+        fi->type = ARMFault_Background;
+        return true;
+    }
+
+    if (access_type == MMU_INST_FETCH) {
+        mask = env->cp15.pmsav5_insn_ap;
+    } else {
+        mask = env->cp15.pmsav5_data_ap;
+    }
+    mask = (mask >> (n * 4)) & 0xf;
+    switch (mask) {
+    case 0:
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
+        return true;
+    case 1:
+        if (is_user) {
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
+            return true;
+        }
+        *prot = PAGE_READ | PAGE_WRITE;
+        break;
+    case 2:
+        *prot = PAGE_READ;
+        if (!is_user) {
+            *prot |= PAGE_WRITE;
+        }
+        break;
+    case 3:
+        *prot = PAGE_READ | PAGE_WRITE;
+        break;
+    case 5:
+        if (is_user) {
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
+            return true;
+        }
+        *prot = PAGE_READ;
+        break;
+    case 6:
+        *prot = PAGE_READ;
+        break;
+    default:
+        /* Bad permission.  */
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
+        return true;
+    }
+    *prot |= PAGE_EXEC;
+    return false;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.25.1


