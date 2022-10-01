Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70F5F1D9F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:30:39 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefNu-0002QG-Nw
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH8-0006ZK-J0
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:39 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH6-0006F8-OS
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:38 -0400
Received: by mail-qk1-x729.google.com with SMTP id g2so4548539qkk.1
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yMwwAQATpt9Zz9/JT2D65VdUDyPtcQpJeVsrKct0TfU=;
 b=yAYBdS8XMhhzHwF2PrGhZuK/m6ZrpzRybrMdH8EdU53pA9Kb8G+Z5r3SGgiU/BSAKx
 bR3iUbp/L9yQMXlBv94nCuRv23r46XbdcyNImoVfcSV5w7CG2W1d/0bwY9KEjjQWZ+h6
 REm9hUOsDnzUQsyatGuUcFV9MAC9TGfg4BLo0ypUcOeq65vIKHgZmc8IBye91FT1azA/
 VNxHoY70T3RW3fAcrYlkkHUa1FtYLAjzIqoHc8QsefwiHD5XYkRCHRQAr9Z99Ne2gvEp
 r2T3aXBMItUeb6Wr0q+wjt0k9T2mb3lCVGmIx5n4UrAK8X0JNPyrSGqCeJoq9gE0HXFs
 ozGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yMwwAQATpt9Zz9/JT2D65VdUDyPtcQpJeVsrKct0TfU=;
 b=5IphiIpqYSbnuxtah1ZfCpeNBh19gTHT23dSIcG4WZcCOI0TQ1BqvF9UOQ7mFVunby
 kjw5LYhqdPAKDD8No+XIKKOIYFcGLhT7vqSJpLw9tCAYx+D3g6HNiu6j3z1YdYlPcyKv
 2evEWdFuz99b/Ukg66E51ZxOtTmwYsQw1FHjCEy/cjqLBXEWk71gaLaHZxwtjTK41yYY
 WPkinbOlWweKAlDFaxo9ex4yYtWvLeSm3/hfnIWLNtTAy2j4EkKLO66gUzirN0r4jRWM
 l8Wovv7M4b2Nl/ot0xiAVMcpQuh8YUkw+jJrS2PyoxgSio5SntZ+6i3eaaW0aUXVBpYd
 sMOQ==
X-Gm-Message-State: ACrzQf1tFKNZIRy6CTUODcgKrHcLT7w+OWSuolNxvynp5UiPKJjdgSN+
 cGJgOcAkFAahB+WfWTqwOa25pISnEqDHiA==
X-Google-Smtp-Source: AMsMyM6/G63eDLYU7mv+cfaz4mxVGMYDAanWTNn5KEBPWtUn6otoMz1lNl5xPX74tpZXE1Dv+yMR/g==
X-Received: by 2002:a05:620a:4515:b0:6ce:7335:4e77 with SMTP id
 t21-20020a05620a451500b006ce73354e77mr9886130qkp.507.1664641415130; 
 Sat, 01 Oct 2022 09:23:35 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/42] target/arm: Split out get_phys_addr_with_secure
Date: Sat,  1 Oct 2022 09:22:41 -0700
Message-Id: <20221001162318.153420-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

Retain the existing get_phys_addr interface using the security
state derived from mmu_idx.  Move the kerneldoc comments to the
header file where they belong.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Move the kerneldoc to internals.h
---
 target/arm/internals.h | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/ptw.c       | 44 ++++++++++++++----------------------------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 307a596505..3524d11dc5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,6 +1145,46 @@ typedef struct GetPhysAddrResult {
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
+/**
+ * get_phys_addr_with_secure: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @is_secure: security state for the access
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Find the physical address corresponding to the given virtual address,
+ * by doing a translation table walk on MMU based systems or using the
+ * MPU state on MPU based systems.
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * we honour the short vs long DFSR format differences.
+ *  * the WnR bit is never set (the caller must do this).
+ *  * for PSMAv5 based systems we don't bother to return a full FSR format
+ *    value.
+ */
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type,
+                               ARMMMUIdx mmu_idx, bool is_secure,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
+/**
+ * get_phys_addr: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Similarly, but use the security regime of @mmu_idx.
+ */
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f9b7c316d0..542111f99e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2260,35 +2260,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     return ret;
 }
 
-/**
- * get_phys_addr - get the physical address for this virtual address
- *
- * Find the physical address corresponding to the given virtual address,
- * by doing a translation table walk on MMU based systems or using the
- * MPU state on MPU based systems.
- *
- * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
- * prot and page_size may not be filled in, and the populated fsr value provides
- * information on why the translation aborted, in the format of a
- * DFSR/IFSR fault register, with the following caveats:
- *  * we honour the short vs long DFSR format differences.
- *  * the WnR bit is never set (the caller must do this).
- *  * for PSMAv5 based systems we don't bother to return a full FSR format
- *    value.
- *
- * @env: CPUARMState
- * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index indicating required translation regime
- * @result: set on translation success.
- * @fi: set to fault info if the translation fails
- */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2304,8 +2281,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
-                                result, fi);
+            ret = get_phys_addr_with_secure(env, address, access_type,
+                                            s1_mmu_idx, is_secure, result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2518,6 +2495,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
+}
+
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
-- 
2.34.1


