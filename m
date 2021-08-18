Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB23F0304
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 13:49:17 +0200 (CEST)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGK4K-000306-7D
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 07:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK35-0001dN-3O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:59 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK33-0007Gw-7A
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:58 -0400
Received: by mail-lj1-x229.google.com with SMTP id d16so4587360ljq.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=9bUKcqmaY+VJPu/KUdLudS3Ki5h/E3oq0AmGCByz2gA=;
 b=DEL9RuonGyuVnDLCbfIDdJHStxeS1OP2Yzb78EvR0GCH7XJw8D/ihshF2QZfxmVvIc
 qja6YBXHw9wWFNBwQVgzRA0B3iS8dvw2NWIYuysn5l+yXyYB5615pyq+HsyzOn6QwL/Y
 gHZk2noAHp8E2zlbOCRSFuKcEuYLKZZbw0D2pCeGh1iCFK51wMbUgi4wlxsYzgJpzz36
 hSBWHX33W2ZsLABIzL5ZBK/YZetWPTW2XGjO33I8SPz3cxfOMQ72wWLnctEysVulcsTE
 EyaAuDmg5NlNanoWaKEJcE3Amf3HGpirPzZhfORcG3cI3HIu21+6Q2n/2IcKl+ENYzzg
 v0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=9bUKcqmaY+VJPu/KUdLudS3Ki5h/E3oq0AmGCByz2gA=;
 b=RJI75aaIfZ0PFTzIdRhfKo0tiz9g4E/axzg8L8Vkwql2DZOlsiwhhNbxEeKZ4rKBX/
 MULhBe4zsk9YaVyLCBk5scbBJN3UiuUpQw2kOA3Q+A1KZmH2r+dE8IHDn0rdAVal2lMK
 VrGZNDlILcmZUpD7RQTp+gju2uniX7rrjaBLSqLuhVE462hV5P1g8PtEXYCfJ6g7uUty
 Q9cMreq6IAMshWjbZxfuTx/UutwLLUvOz6XFjgji+4jTOoauCSlxMDSTFsSIRSqN/das
 f6QslvEDyu8Iqb3+cfF3Ik0xJeUMHMx6p7IaE3fI3IDpvl0izYLtdQu238dfIk4mDpGD
 lQXg==
X-Gm-Message-State: AOAM533U41FJW0SrWDFQ4Q8gbIFqW11w+jj1SrK+EBdZdr/f8GoHwl7/
 xyZ5bFIaYlIcU0CW2HTQMeUIjzRwDhw=
X-Google-Smtp-Source: ABdhPJz4Y6qtcMd+gJtpSgzZRSS3mF+BR+iyoX7zK0ltgMyCoV+fufgsu99n1oNPM3E3eDGS8n7yNw==
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr7433326ljh.61.1629287275497;
 Wed, 18 Aug 2021 04:47:55 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id u2sm473876lfr.79.2021.08.18.04.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:47:55 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] arm/monitor: Add support for 'info tlb' command
Date: Wed, 18 Aug 2021 14:47:51 +0300
Message-Id: <162928727089.357603.8471789223247950118.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
References: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru, changbin.du@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds hmp 'info tlb' command support for the arm platform.
The limitation is that this only implements a page walker for
ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
not supported yet.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
---
 hmp-commands-info.hx |    3 +
 target/arm/monitor.c |  170 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+), 1 deletion(-)

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
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..4f14834148 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -31,6 +31,10 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
+#include "internals.h"
+#include "qemu/qemu-print.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -228,3 +232,169 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+#define PTE_HEADER_FIELDS       "vaddr              paddr              "\
+                                "size               attr\n"
+#define PTE_HEADER_DELIMITER    "------------------ ------------------ "\
+                                "------------------ ------------------------------\n"
+
+static void print_pte_header(void)
+{
+    qemu_printf(PTE_HEADER_FIELDS);
+    qemu_printf(PTE_HEADER_DELIMITER);
+}
+
+static void
+print_pte_lpae(uint32_t tableattrs, uint64_t vaddr, hwaddr paddr,
+               target_ulong size, target_ulong pte)
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
+    qemu_printf("0x%016lx 0x" TARGET_FMT_plx " 0x" TARGET_FMT_lx
+                   " %s %s %s %s %s %s %s %s %s\n",
+                   vaddr, paddr, size,
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
+walk_pte_lpae(uint64_t descaddrmask, uint32_t tableattrs, hwaddr base,
+              uint64_t vaddr, int level, int stride, int inputsize,
+              ARMMMUIdx mmu_idx, CPUState *cs, ARMMMUFaultInfo *fi)
+{
+    int indx;
+    for (indx = 0; indx < (1ul << stride); indx++) {
+        uint64_t descriptor, cur_IA, cur_vaddr = vaddr;
+        uint32_t cur_tableattrs = tableattrs;
+        hwaddr descaddr;
+        target_ulong pgsize;
+        bool nstable;
+
+        cur_IA = ((uint64_t)indx << ((stride * (4 - level)) + 3));
+        cur_vaddr += cur_IA;
+        descaddr = base + (indx << 3);
+        descaddr &= ~7ULL;
+        nstable = extract32(cur_tableattrs, 4, 1);
+        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            continue;
+        }
+
+        if (!(descriptor & 1) ||
+            (!(descriptor & 2) && (level == 3))) {
+            /* Invalid, or the Reserved level 3 encoding */
+            continue;
+        }
+        descaddr = descriptor & descaddrmask;
+        if ((descriptor & 2) && (level < 3)) {
+            /* Table entry */
+            cur_tableattrs |= extract64(descriptor, 59, 5);
+            walk_pte_lpae(descaddrmask, cur_tableattrs, descaddr, cur_vaddr,
+                          level + 1, stride, inputsize, mmu_idx, cs, fi);
+            continue;
+        }
+        pgsize = (1ULL << ((stride * (4 - level)) + 3));
+
+        print_pte_lpae(cur_tableattrs, cur_vaddr, descaddr, pgsize, descaddr);
+    }
+}
+
+/* ARMv8-A AArch64 Long Descriptor format */
+static void tlb_info_vmsav8_64(Monitor *mon, CPUArchState *env)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    uint64_t ttbr[2];
+    uint64_t tcr, descaddrmask;
+    int tsz[2];
+    bool using16k, using64k;
+    int stride;
+    uint32_t tableattrs;
+    ARMMMUFaultInfo fi = {};
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
+    hwaddr indexmask_grainsize = (1ULL << (stride + 3)) - 1;
+    descaddrmask = ((1ull << 48) - 1) &  ~indexmask_grainsize;
+
+    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+
+    /* print header */
+    print_pte_header();
+
+    for (unsigned int i = 0; i < 2; i++) {
+        if (ttbr[i]) {
+            hwaddr base, indexmask;
+            int inputsize, level;
+            uint64_t vaddr;
+            base = extract64(ttbr[i], 0, 48);
+            inputsize = 64 - tsz[i];
+            level = pt_start_level_stage1(inputsize, stride);
+            indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+            base &= ~indexmask;
+            vaddr = i == 0 ? 0 : ~((1ull << inputsize) - 1);
+
+            walk_pte_lpae(descaddrmask, tableattrs, base, vaddr, level, stride,
+                          inputsize, mmu_idx, cs, &fi);
+        }
+    }
+}
+
+void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env;
+    env = mon_get_cpu_env(mon);
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
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+
+    if (regime_translation_disabled(env, mmu_idx)) {
+        monitor_printf(mon, "MMU disabled\n");
+        return;
+    }
+
+    if (!arm_s1_regime_using_lpae_format(env, mmu_idx)) {
+        monitor_printf(mon, "Only AArch64 Long Descriptor is supported\n");
+        return;
+    }
+
+    tlb_info_vmsav8_64(mon, env);
+}


