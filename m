Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52053D53C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:22:58 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLJR-0005n2-Mw
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3M-0007iw-PY
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3K-00005b-B2
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so13537362pju.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imn8BMnL3CE4pofCY4yxiePLLdSnSVld4nZ1ecZHC48=;
 b=oBuqIIcekf5lv9ER91tzkrbcNXEAOpl4Hzh88GsWOAeztZFqxssfaI74sV335pPXwx
 wXztPNcmw6vPJLH+HYm32XMTG+j/RZGd+kpmi/K0Il6zBlINC3F4udAnyTjBi5b3mY+C
 /I3C3cZYGe4pZ5WUMcZpfoInBkhOIr4UdQG5VLsag6kS8YfM4SEsk0/fGxH/G4Hg2ylU
 IjsWiRSIgL+3HFaniZ+GENn0WQwEjGi17VazXJfrhw5PxCuVcIXcwdIKGYfKALLpHGr3
 VDy3GtqCEqtzvK4T/0s/coY5KH0yaLyg03gu33VVpL8zomJZAW8s1gMvTn7VVit9oWVG
 VroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imn8BMnL3CE4pofCY4yxiePLLdSnSVld4nZ1ecZHC48=;
 b=zBD9+zIBlrIkE9Ez1sf0YFi25MYf8w3J6/1OzoRahnMrWRRNeCDDSR+Ckx7RPnNI/s
 qPN5tDD2EFcVMYUkQJEvcZZ1JiKxeyULwkK/26/dXpAj+uW6whC6ehbR7JDgjmvWItK3
 +DICPAGMo5IQjvDKFawGWDvVl9IDsxQxG+JUyjDgV4fV5mKQyQvGWv82gu9pPheSQk4R
 ggMOkGHG6pThgr0V4zhFD0GWMSdSovSdzHjtPIN2EJTT6ls91L9KD8n1YutRw2SREqTb
 NCDaLi4Plj9rhntJkm5mixasms7GzmfmWh3bbG/GZ7W3YxGMyFeMQb6Gots8qBh6Kd8m
 ewyQ==
X-Gm-Message-State: AOAM533yJj7l+wyUaLnQ3DsqiUzqbj7okgo/IYlGrf6jLq2bWjnfpcxn
 0fEH9MVOUcMJTQVCV2r72Kr0PqTow1LR2w==
X-Google-Smtp-Source: ABdhPJynJYvstX2X8/Y4ZwgT4VU9sShElsn9+E31WJ5GLF2EzEh+yPuALSrMBPASgVBejvLuzZQxwg==
X-Received: by 2002:a17:90b:4c88:b0:1e6:71da:5eb0 with SMTP id
 my8-20020a17090b4c8800b001e671da5eb0mr15634390pjb.185.1654315576951; 
 Fri, 03 Jun 2022 21:06:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/28] target/arm: Move get_phys_addr_pmsav8 to ptw.c
Date: Fri,  3 Jun 2022 21:05:47 -0700
Message-Id: <20220604040607.269301-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 target/arm/ptw.h    |  5 ---
 target/arm/helper.c | 75 -------------------------------------------
 target/arm/ptw.c    | 77 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 80 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d24b7c263a..d569507951 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -41,11 +41,6 @@ void get_phys_addr_pmsav7_default(CPUARMState *env,
                                   int32_t address, int *prot);
 bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
 
-bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                          int *prot, target_ulong *page_size,
-                          ARMMMUFaultInfo *fi);
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9cbf3422ec..c1d0726464 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11934,81 +11934,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
-
-bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                          int *prot, target_ulong *page_size,
-                          ARMMMUFaultInfo *fi)
-{
-    uint32_t secure = regime_is_secure(env, mmu_idx);
-    V8M_SAttributes sattrs = {};
-    bool ret;
-    bool mpu_is_subpage;
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
-        if (access_type == MMU_INST_FETCH) {
-            /* Instruction fetches always use the MMU bank and the
-             * transaction attribute determined by the fetch address,
-             * regardless of CPU state. This is painful for QEMU
-             * to handle, because it would mean we need to encode
-             * into the mmu_idx not just the (user, negpri) information
-             * for the current security state but also that for the
-             * other security state, which would balloon the number
-             * of mmu_idx values needed alarmingly.
-             * Fortunately we can avoid this because it's not actually
-             * possible to arbitrarily execute code from memory with
-             * the wrong security attribute: it will always generate
-             * an exception of some kind or another, apart from the
-             * special case of an NS CPU executing an SG instruction
-             * in S&NSC memory. So we always just fail the translation
-             * here and sort things out in the exception handler
-             * (including possibly emulating an SG instruction).
-             */
-            if (sattrs.ns != !secure) {
-                if (sattrs.nsc) {
-                    fi->type = ARMFault_QEMU_NSCExec;
-                } else {
-                    fi->type = ARMFault_QEMU_SFault;
-                }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
-                return true;
-            }
-        } else {
-            /* For data accesses we always use the MMU bank indicated
-             * by the current CPU state, but the security attributes
-             * might downgrade a secure access to nonsecure.
-             */
-            if (sattrs.ns) {
-                txattrs->secure = false;
-            } else if (!secure) {
-                /* NS access to S memory must fault.
-                 * Architecturally we should first check whether the
-                 * MPU information for this address indicates that we
-                 * are doing an unaligned access to Device memory, which
-                 * should generate a UsageFault instead. QEMU does not
-                 * currently check for that kind of unaligned access though.
-                 * If we added it we would need to do so as a special case
-                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
-                 */
-                fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
-                return true;
-            }
-        }
-    }
-
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
-    return ret;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 27715dbfa8..28caa7a7ae 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -605,6 +605,83 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                                 int *prot, target_ulong *page_size,
+                                 ARMMMUFaultInfo *fi)
+{
+    uint32_t secure = regime_is_secure(env, mmu_idx);
+    V8M_SAttributes sattrs = {};
+    bool ret;
+    bool mpu_is_subpage;
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        if (access_type == MMU_INST_FETCH) {
+            /*
+             * Instruction fetches always use the MMU bank and the
+             * transaction attribute determined by the fetch address,
+             * regardless of CPU state. This is painful for QEMU
+             * to handle, because it would mean we need to encode
+             * into the mmu_idx not just the (user, negpri) information
+             * for the current security state but also that for the
+             * other security state, which would balloon the number
+             * of mmu_idx values needed alarmingly.
+             * Fortunately we can avoid this because it's not actually
+             * possible to arbitrarily execute code from memory with
+             * the wrong security attribute: it will always generate
+             * an exception of some kind or another, apart from the
+             * special case of an NS CPU executing an SG instruction
+             * in S&NSC memory. So we always just fail the translation
+             * here and sort things out in the exception handler
+             * (including possibly emulating an SG instruction).
+             */
+            if (sattrs.ns != !secure) {
+                if (sattrs.nsc) {
+                    fi->type = ARMFault_QEMU_NSCExec;
+                } else {
+                    fi->type = ARMFault_QEMU_SFault;
+                }
+                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        } else {
+            /*
+             * For data accesses we always use the MMU bank indicated
+             * by the current CPU state, but the security attributes
+             * might downgrade a secure access to nonsecure.
+             */
+            if (sattrs.ns) {
+                txattrs->secure = false;
+            } else if (!secure) {
+                /*
+                 * NS access to S memory must fault.
+                 * Architecturally we should first check whether the
+                 * MPU information for this address indicates that we
+                 * are doing an unaligned access to Device memory, which
+                 * should generate a UsageFault instead. QEMU does not
+                 * currently check for that kind of unaligned access though.
+                 * If we added it we would need to do so as a special case
+                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
+                 */
+                fi->type = ARMFault_QEMU_SFault;
+                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        }
+    }
+
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
+                            txattrs, prot, &mpu_is_subpage, fi, NULL);
+    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    return ret;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


