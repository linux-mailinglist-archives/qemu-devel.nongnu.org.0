Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B72B2DBE
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 16:01:22 +0100 (CET)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdx3J-00041a-Kv
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 10:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdx12-00036C-7f; Sat, 14 Nov 2020 09:59:00 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdx10-0000bE-0Z; Sat, 14 Nov 2020 09:58:59 -0500
Received: by mail-pj1-x1041.google.com with SMTP id w7so1682280pjy.1;
 Sat, 14 Nov 2020 06:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evhsgIvEXbE1bIcTQhnKwahDHG26zojSQOehShg2iAk=;
 b=rjQzlLjZgmux6HhEbE7kOsMK9dZCGi49QwGXa2wwG6VYuq4uVyYVHB3U29yucVzZB8
 QukFEdmq+zbr0gn/FTyyEnOilxkSqVlvTE7UFmyGBrtnH8o0/EtlyasB7f8icMcfxyuc
 0NOsQFobBKOmCnJDeg129LyQ40yhByCc1TLMpB2VzPBQxR7ZRRikJULAF/jM1i/A8JNk
 msDzxYELLLzbhNclif3znOoB5/8UaPwf1oAFx4FRBrXwBffC4iXPeBCQFMVdm9t3kQCe
 YPkf+cFzerbxz92HtAOLppxuJqrU7uXR/ZB6qeQSXHyYHo6owSeJVWxud4QWUm9LNdhp
 va3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evhsgIvEXbE1bIcTQhnKwahDHG26zojSQOehShg2iAk=;
 b=Fq7Iaxx2aES0RFCu/Q9/VkPr738+jCuzgodf3XcVLnfMl6sQF4kIRrdHBgG3600F+y
 Tau31p6uxrSKj7KaIJc7bN57tuzuSk1co2OZawLDCHt8kCVwNP23ukzq9owBUGKyQKzF
 YxTAvnk4W5mj6bQEXNSJkFjfzyCpKhPVimfEvqfa95aG0CmcJsrvUfNAOSpAUhAV8UqU
 /LBRixr1sEd1+oh4JH6DvfLAxGlyW4BOkwlTBkrGGz+xEubso/QP6D5Wq6b9unEzzddh
 gP+YL+30i/hO8tbepUm1SBFANb80uMI5GwNBweCRcG/fJSN+F7lzJgyiWlYE8Mqn3+oT
 YaRg==
X-Gm-Message-State: AOAM530I/NW7EnYFnEP3+1ivB9U41uKsQBR3Le46jSrG3LR+YbS6EUPF
 /Jud+yo63/YHYpiLp3jJPFo=
X-Google-Smtp-Source: ABdhPJx96y/5FBiCxQxlpROm0gTG5reSGRP1HvPagqoold7tRchjrSxb7IYYh3bYKjm3Pa8FJPk3yw==
X-Received: by 2002:a17:90a:8992:: with SMTP id
 v18mr8586375pjn.192.1605365936127; 
 Sat, 14 Nov 2020 06:58:56 -0800 (PST)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id n72sm13493902pfd.202.2020.11.14.06.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 06:58:55 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] arm/monitor: Add support for 'info tlb' command
Date: Sat, 14 Nov 2020 22:58:47 +0800
Message-Id: <20201114145847.57707-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=changbin.du@gmail.com; helo=mail-pj1-x1041.google.com
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

To reuse existing code, this patch also extracts some APIs from
helper.c, including regime_translation_disabled(),
pt_start_level_stage1(), regime_ttbr().

Signed-off-by: Changbin Du <changbin.du@gmail.com>

---
v2:
  o fix coding style
  o extract common code pt_start_level_stage1()

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 hmp-commands-info.hx   |   3 +-
 target/arm/helper.c    |  30 +------
 target/arm/internals.h |  32 +++++++
 target/arm/monitor.c   | 183 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 219 insertions(+), 29 deletions(-)

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
index 11b0803df7..e7f0f27c8e 100644
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
@@ -11077,18 +11062,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2) {
-        /* The starting level depends on the virtual address size (which can
-         * be up to 48 bits) and the translation granule size. It indicates
-         * the number of strides (stride bits at a time) needed to
-         * consume the bits of the input address. In the pseudocode this is:
-         *  level = 4 - RoundUp((inputsize - grainsize) / stride)
-         * where their 'inputsize' is our 'inputsize', 'grainsize' is
-         * our 'stride + 3' and 'stride' is our 'stride'.
-         * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
-         * = 4 - (inputsize - stride - 3 + stride - 1) / stride
-         * = 4 - (inputsize - 4) / stride;
-         */
-        level = 4 - (inputsize - 4) / stride;
+        level = pt_start_level_stage1(inputsize, stride);
     } else {
         /* For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5460678756..0f3a1d0188 100644
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
@@ -1291,6 +1307,22 @@ typedef struct ARMCacheAttrs {
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
 } ARMCacheAttrs;
 
+static inline int pt_start_level_stage1(int inputsize, int stride)
+{
+    /* The starting level depends on the virtual address size (which can
+     * be up to 48 bits) and the translation granule size. It indicates
+     * the number of strides (stride bits at a time) needed to
+     * consume the bits of the input address. In the pseudocode this is:
+     *  level = 4 - RoundUp((inputsize - grainsize) / stride)
+     * where their 'inputsize' is our 'inputsize', 'grainsize' is
+     * our 'stride + 3' and 'stride' is our 'stride'.
+     * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
+     * = 4 - (inputsize - stride - 3 + stride - 1) / stride
+     * = 4 - (inputsize - 4) / stride;
+     */
+    return 4 - (inputsize - 4) / stride;
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 169d8a64b6..2ee3fdd00b 100644
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
@@ -236,3 +239,183 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
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
+print_pte_lpae(Monitor *mon, uint32_t tableattrs, int va_bits,
+               target_ulong vaddr, hwaddr paddr, target_ulong size,
+               target_ulong pte)
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
+    int ptshift = pg_shift + (max_level - cur_level) * stride;
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
+            print_pte_lpae(mon, tableattrs, va_bits, vstart, paddr,
+                           pgsize, pte);
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
+            int startlevel = pt_start_level_stage1(va_bits, stride);
+
+            /* walk ttbrx page tables, starting from address @vstart */
+            walk_pte_lpae(mon, true, 0, base, vstart, startlevel,
+                          stride, va_bits);
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


