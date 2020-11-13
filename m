Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30F2B18B3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:00:45 +0100 (CET)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVsq-0007HH-G2
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdVrM-0006jg-Sh; Fri, 13 Nov 2020 04:59:12 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdVrK-0005fm-Se; Fri, 13 Nov 2020 04:59:12 -0500
Received: by mail-pl1-x644.google.com with SMTP id g11so4302331pll.13;
 Fri, 13 Nov 2020 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktww/W5g18Dhf8NMJRSi7oqLig2s5XxoFpcpz5zJ52Q=;
 b=tkLLFSA3R7JNUBlR0qXEa4Ic4a7uQpWtCNoVQPi+AetDTHHsG3BaoKCJlUsJukB1GJ
 gvHjiQqX4xUG0zY6dwUoEe/APCDu80wh1PD3fhIQwTDNjFN8k56V4Tu0f4wki6S9AMcf
 +QPrSUQOEeAGjKmS1xEarlICZDGtvojJEOONo43LEwY69HiK7WydqoUPjIYk8095j0kR
 6+r/lT4uaYNB0aA1xa7acmSgiv5aMxU5ghil4hmF0tQBhB7CaDxo/qGJmN/47Io3OgpC
 dfOflokc2CTOLcm+z8AV1oSH2EL0McQMnfvvLKkhHxcGhAYahd8EaM8kuKqy2QIinxGX
 nItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktww/W5g18Dhf8NMJRSi7oqLig2s5XxoFpcpz5zJ52Q=;
 b=bRBvpROYSZTzRXeXTt9f7MlR0uJKaluL8eJySY/Theh5atuZ5EIs5LQk+Op5OVfVkW
 WN1AhIjeKLQJ4osP+UBqpsNZjFtQcfCzNRZuKcV80G2D0iZLTJZzTWv+YGpeAJiq0V9T
 GK/QfFq8SendOG1hCECxNws+6tIX/sZy4vfQ6jBj7yfeRteZmoYqFwX8w+xKMIZPED0B
 S4VyRVTMjKUkGa5ONj4G7kLQZrP97OctnfUadND6dpmB4BEbsmh5+8+jtCRTf0ze+PEc
 K9pA5kIzKbDydzmLBjIj616SX6gsPKVhBGLDWQY6oXyRBwqEK+5XcjFhbCGxTzzbI5SS
 5NhA==
X-Gm-Message-State: AOAM532quukud31IYrZa2m55r0vmvDQw8J4yCdv2dSxhyiNmAUCPUU3b
 Lq0UdGhhwFozSYL4j77oyBTwx/1seCA=
X-Google-Smtp-Source: ABdhPJxnzKDtEcIr0Pp1nJwCaXC8IQgL0TR/nraE4DeH6bv2slBweUVciRqtEDXCEG7vLnbi5WLfIw==
X-Received: by 2002:a17:902:bc46:b029:d6:d98a:1a68 with SMTP id
 t6-20020a170902bc46b02900d6d98a1a68mr1286430plz.63.1605261548756; 
 Fri, 13 Nov 2020 01:59:08 -0800 (PST)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id h16sm7061112pfo.185.2020.11.13.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 01:59:08 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] arm/monitor: Add support for 'info tlb' command
Date: Fri, 13 Nov 2020 17:58:54 +0800
Message-Id: <20201113095854.67668-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=changbin.du@gmail.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds hmp 'info tlb' command support for the arm platform.
The limitation is that this only implements a page walker for
ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
not supported yet.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 hmp-commands-info.hx   |   3 +-
 target/arm/helper.c    |  17 +---
 target/arm/internals.h |  16 ++++
 target/arm/monitor.c   | 187 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+), 17 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 117ba25f91..1b5b3f2616 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -222,7 +222,8 @@ SRST
 ERST
 
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
-    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
+    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K) || \
+    defined(TARGET_ARM)
     {
         .name       = "tlb",
         .args_type  = "",
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df7..c73a08943b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9974,8 +9974,7 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 #ifndef CONFIG_USER_ONLY
 
 /* Return true if the specified stage of address translation is disabled */
-static inline bool regime_translation_disabled(CPUARMState *env,
-                                               ARMMMUIdx mmu_idx)
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     if (arm_feature(env, ARM_FEATURE_M)) {
         switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
@@ -10021,20 +10020,6 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* Convert a possible stage1+2 MMU index into the appropriate
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5460678756..12f883c636 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,8 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
+
 /* Return the TCR controlling this translation regime */
 static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -958,6 +960,20 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return the TTBR associated with this translation regime */
+static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                   int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 169d8a64b6..d6b64ea3b6 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -31,6 +31,9 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
+#include "internals.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -236,3 +239,187 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+/* Perform linear address sign extension */
+static target_ulong addr_canonical(int va_bits, target_ulong addr)
+{
+#ifdef TARGET_AARCH64
+    if (addr & (1UL << (va_bits - 1))) {
+        addr |= (hwaddr)-(1L << va_bits);
+    }
+#endif
+
+    return addr;
+}
+
+#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
+                                "size             attr\n"
+#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
+                                "---------------- ------------------------------\n"
+
+static void print_pte_header(Monitor *mon)
+{
+    monitor_printf(mon, PTE_HEADER_FIELDS);
+    monitor_printf(mon, PTE_HEADER_DELIMITER);
+}
+
+static void
+print_pte_lpae(Monitor *mon, uint32_t tableattrs, int va_bits, target_ulong vaddr,
+               hwaddr paddr, target_ulong size, target_ulong pte)
+{
+    uint32_t ns = extract64(pte, 5, 1) | extract32(tableattrs, 4, 1);
+    uint32_t ap = extract64(pte, 6, 2) & ~extract32(tableattrs, 2, 2);
+    uint32_t af = extract64(pte, 10, 1);
+    uint32_t ng = extract64(pte, 11, 1);
+    uint32_t gp = extract64(pte, 50, 1);
+    uint32_t con = extract64(pte, 52, 1);
+    uint32_t pxn = extract64(pte, 53, 1) | extract32(tableattrs, 0, 1);
+    uint32_t uxn = extract64(pte, 54, 1) | extract32(tableattrs, 1, 1);
+
+    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
+                   " %s %s %s %s %s %s %s %s %s\n",
+                   addr_canonical(va_bits, vaddr), paddr, size,
+                   ap & 0x2 ? "ro" : "RW",
+                   ap & 0x1 ? "USR" : "   ",
+                   ns ? "NS" : "  ",
+                   af ? "AF" : "  ",
+                   ng ? "nG" : "  ",
+                   gp ? "GP" : "  ",
+                   con ? "Con" : "   ",
+                   pxn ? "PXN" : "   ",
+                   uxn ? "UXN" : "   ");
+}
+
+static void
+walk_pte_lpae(Monitor *mon, bool aarch64, uint32_t tableattrs, hwaddr pt_base,
+              target_ulong vstart, int cur_level, int stride, int va_bits)
+{
+    int pg_shift = stride + 3;
+    int descaddr_high = aarch64 ? 47 : 39;
+    int max_level = 3;
+    int ptshift= pg_shift + (max_level - cur_level) * stride;
+    target_ulong pgsize = 1UL << ptshift;
+    int idx;
+
+    for (idx = 0; idx < (1UL << stride) && vstart < (1UL << va_bits);
+         idx++, vstart += pgsize) {
+        hwaddr pte_addr = pt_base + idx * 8;
+        target_ulong pte = 0;
+        hwaddr paddr;
+
+        cpu_physical_memory_read(pte_addr, &pte, 8);
+
+        if (!extract64(pte, 0, 1)) {
+            /* invalid entry */
+            continue;
+        }
+
+        if (cur_level == max_level) {
+            /* leaf entry */
+            paddr = (hwaddr)extract64(pte, pg_shift,
+                                descaddr_high - pg_shift + 1) << pg_shift;
+            print_pte_lpae(mon, tableattrs, va_bits, vstart, paddr, pgsize, pte);
+        } else {
+            if (extract64(pte, 1, 1)) {
+                /* table entry */
+                paddr = (hwaddr)extract64(pte, pg_shift,
+                                    descaddr_high - pg_shift + 1) << pg_shift;
+                tableattrs |= extract64(pte, 59, 5);
+
+                walk_pte_lpae(mon, aarch64, tableattrs, paddr, vstart,
+                              cur_level + 1, stride, va_bits);
+            } else {
+                /* block entry */
+                if ((pg_shift == 12 && (cur_level != 1 && cur_level != 2)) ||
+                    (pg_shift == 14 && (cur_level != 2)) ||
+                    (pg_shift == 16 && (cur_level != 0 && cur_level != 1))) {
+                    monitor_printf(mon, "illegal block entry at level%d\n",
+                                   cur_level);
+                    continue;
+                }
+                paddr = (hwaddr)extract64(pte, ptshift,
+                                    descaddr_high - ptshift + 1) << ptshift;
+                print_pte_lpae(mon, tableattrs, va_bits, vstart, paddr,
+                               pgsize, pte);
+            }
+        }
+    }
+}
+
+static inline int pt_start_level_vmsav8_64(int stride, int va_bits)
+{
+    int pg_shift = stride + 3;
+
+    return 3 - (va_bits - pg_shift - 1) / stride;
+}
+
+/* ARMv8-A AArch64 Long Descriptor format */
+static void tlb_info_vmsav8_64(Monitor *mon, CPUArchState *env)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    uint64_t ttbr[2];
+    uint64_t tcr;
+    int tsz[2];
+    bool using16k, using64k;
+    int stride;
+
+    ttbr[0] = regime_ttbr(env, mmu_idx, 0);
+    ttbr[1] = regime_ttbr(env, mmu_idx, 1);
+
+    tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    using64k = extract32(tcr, 14, 1);
+    using16k = extract32(tcr, 15, 1);
+    tsz[0] = extract32(tcr, 0, 6);
+    tsz[1] = extract32(tcr, 16, 6);
+
+    if (using64k) {
+        stride = 13;
+    } else if (using16k) {
+        stride = 11;
+    } else {
+        stride = 9;
+    }
+
+    /* print header */
+    print_pte_header(mon);
+
+    for (unsigned int i = 0; i < 2; i++) {
+        if (ttbr[i]) {
+            hwaddr base = extract64(ttbr[i], 1, 47) << 1;
+            int va_bits = 64 - tsz[i];
+            target_ulong vstart = (target_ulong)i << (va_bits - 1);
+            int cur_level = pt_start_level_vmsav8_64(stride, va_bits);
+
+            /* walk ttbrx page tables, starting from address @vstart */
+            walk_pte_lpae(mon, true, 0, base, vstart, cur_level, stride, va_bits);
+        }
+    }
+}
+
+void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env;
+
+    env = mon_get_cpu_env();
+    if (!env) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
+        monitor_printf(mon, "No MMU\n");
+        return;
+    }
+
+    if (regime_translation_disabled(env, arm_stage1_mmu_idx(env))) {
+        monitor_printf(mon, "MMU disabled\n");
+        return;
+    }
+
+    if (!arm_el_is_aa64(env, 1)) {
+        monitor_printf(mon, "Only AArch64 Long Descriptor is supported\n");
+        return;
+    }
+
+    tlb_info_vmsav8_64(mon, env);
+}
-- 
2.25.1


