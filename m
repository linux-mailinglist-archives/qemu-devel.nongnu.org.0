Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA775F1DF4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:57:54 +0200 (CEST)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefoG-0006vc-Tk
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHx-0007hQ-FR
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:29 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHu-0006Nw-H7
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:29 -0400
Received: by mail-qk1-x735.google.com with SMTP id h28so4557221qka.0
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eb41dB13E+ZPEBfGGmg85O0xNXDKjVd8ViYdMqOjaTw=;
 b=MU/Pd6j+kwoJLl5nRsXf4241GuKrM6hjR/EcDoIErl1BD2IbhR6QT0DPMvisqZDlwy
 Nwa82qmAg5wRI6+sp7hkJRTIQVbXU7xFJhIIBYXNJZJ9GRkJ3RWNMFtID77HpWxxUdiG
 m8sjy+IwmZvTopuKr5ilXoOiZ6OUUz3ykabQYTJa3QnpYBxS5es5fuGtI8ZLuxsdcdq+
 RoHJ/JKRQEohR0YnXTZTlAS1KzrfwjWycmc+BDK7emhz+Oyz5p7QEtsY1Dy3764LVsAB
 /MRAgi7Y2kkocKxMt1oNDadHZ9+68RztxajR6rIblvgcLBDv+1N3lTfI6nm1JmJirSRv
 JtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eb41dB13E+ZPEBfGGmg85O0xNXDKjVd8ViYdMqOjaTw=;
 b=ay/ErlpVJuTy40MUloOu/IvGx8T3QVY8FdqQPGQxyIA64Yz/YYZbLn59YtDiffb7fp
 ffjK3jqotNxG1trQQPQGlUKpEwOiSEmwqTV6bOL84BNnHS9sI0MMdT8D+p4YFdmEADhO
 1bBQS7Cx+gvWZ24tI1UKgKKMXX3PCWpfls8Bb8IhFsF3cib+hAQDpBfQcPGzw9cLttUj
 r/rG1rHYdrneskbWtSaA24S9tpBr4I4bkITLHqKijtqwCg2KubtSjD+0AXh4JhkMKWsN
 sklR47+yNbL1Gfk+xDLUCucWa+i5iEoHNBgb7RzeH0fG7F0vKivOsnTYKvc9xNabI4AZ
 a6aQ==
X-Gm-Message-State: ACrzQf0JcYn0mz297gzP6Mtgai9hicSch34bREl1fLaATpD/5YbiPC9g
 m0oJ8vEOdpmA0nHgxARJ8ogoaVJeGm8wjQ==
X-Google-Smtp-Source: AMsMyM5Sml+60mVsCoY8NStV8qg1pUKy/yJQSD8yAojyEMJrWEJwAZ9DDwKffvnHHfB9Yl18vnMt7A==
X-Received: by 2002:a05:620a:29c5:b0:6ce:b8f3:fd5b with SMTP id
 s5-20020a05620a29c500b006ceb8f3fd5bmr9911997qkp.107.1664641465532; 
 Sat, 01 Oct 2022 09:24:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 26/42] target/arm: Plumb debug into S1_ptw_translate
Date: Sat,  1 Oct 2022 09:23:02 -0700
Message-Id: <20221001162318.153420-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Before using softmmu page tables for the ptw, plumb down
a debug parameter so that we can query page table entries
from gdbstub without modifying cpu state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 66 +++++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 05dcacf45b..45adb9d5a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,7 +16,7 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               bool is_secure, bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -212,7 +212,7 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure_ptr,
+                               hwaddr addr, bool *is_secure_ptr, bool debug,
                                ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
@@ -225,7 +225,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 is_secure, false, &s2, fi);
+                                 is_secure, false, debug, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -268,7 +268,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -276,7 +276,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, debug, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
     if (fi->s1ptw) {
@@ -296,7 +296,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -304,7 +304,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, debug, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
     if (fi->s1ptw) {
@@ -433,8 +433,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -453,7 +453,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -491,7 +491,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -552,8 +552,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -576,7 +576,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -629,7 +629,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -984,7 +984,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               bool is_secure, bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1210,7 +1210,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2361,10 +2361,13 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+static bool get_phys_addr_with_secure_debug(CPUARMState *env,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
+                                            ARMMMUIdx mmu_idx,
+                                            bool is_secure, bool debug,
+                                            GetPhysAddrResult *result,
+                                            ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
@@ -2418,7 +2421,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     s2walk_secure, is_el0, result, fi);
+                                     s2walk_secure, is_el0, debug, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2526,16 +2529,25 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     }
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, result, fi);
+                                  is_secure, false, debug, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                is_secure, debug, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                is_secure, debug, result, fi);
     }
 }
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure_debug(env, address, access_type, mmu_idx,
+                                           is_secure, false, result, fi);
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -2587,9 +2599,11 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    bool is_secure = arm_is_secure(env);
     bool ret;
 
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure_debug(env, addr, MMU_DATA_LOAD, mmu_idx,
+                                          is_secure, true, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1


