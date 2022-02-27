Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D44C5E0B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:23:39 +0100 (CET)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOCo-0005Y1-Ns
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAp-0002ZY-Vv
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:36 -0500
Received: from [2607:f8b0:4864:20::432] (port=41835
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAn-0007nW-W9
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:35 -0500
Received: by mail-pf1-x432.google.com with SMTP id p8so9077998pfh.8
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kflgz17ggbMf4pl8VvhV/1GKguptkIzSWpU/iXQLGD0=;
 b=HnqNUhYyvn4aZ9czg9bB5reb4HC/3VGv5gL0916ZSgzj9mZg1uS8cGZkcPsJlZI8Kg
 uN6oWuW/+842eOppXenPr63/CxBlFGP/99ewW9XMqg3g1kC8US1OzYXEAh3LQLrY1Ma6
 U/P0xkQ0n486RKnKepOQeltSh0RiPBgBuBixJEkrrmWpG/cZ3OHqu0mLCSIqEsp7nrBO
 NGz6kr6KH9KZ7uDpgGkn8v8oLq+LzrRHeyQtJkyRrgb515A0+lstv2gqxiVktm4Tq9gB
 Z9W0KSjawNz3V7uwUAS0e0M0D9EXUIIonNhLZpfLgVsaQNOVNUsaHnl0x0HCz1shaq97
 OEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kflgz17ggbMf4pl8VvhV/1GKguptkIzSWpU/iXQLGD0=;
 b=E0bGDqRpT++wfxKcHG2bocH+3PmI/972VyLkCI59JBecjnhw7Oip8i0JG3coubBB2a
 amy6hyseJRiP7p9wu0bN4qrZC9M8uBk9SDv65KX/4B/ETAWeQu6QhSZrV8/+uf5Tud2T
 cX3yPi77xyGZYK4EBvDTWQ6TnoiiJ5p/mAQgvw092Y3NNRWXGY9BXJiziUE2nbvw4nIE
 8xQXeCz24S+6yFoYQLepr87Bt7xGH9B64//5Vggcp/N5024J4IjDlQPKM/6+31mQt4wT
 m52xvcbupI/0YxzKbVI4+aOxgfh14T761iFJjGZTNGH5LfdOZ48pESdz3/mQIkc4wlF0
 hfFw==
X-Gm-Message-State: AOAM531c0BAAheb7kBIg7vJabnOJpe+wZMEC+cuO/WvxGDcZVddclaV3
 PMUG6mzgzBO7bTfYO5r3O2pG92jSz4Rjcw==
X-Google-Smtp-Source: ABdhPJzgHycwKqjh64xn814ENfwivEOfgN0wOIF9ighwz8AyEq7ofyJSaXDZdyUgkQ5XwDo4XaQzXA==
X-Received: by 2002:a63:10c:0:b0:36c:6dd0:44af with SMTP id
 12-20020a63010c000000b0036c6dd044afmr14451242pgb.41.1645986092581; 
 Sun, 27 Feb 2022 10:21:32 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/nios2: Replace MMU_LOG with tracepoints
Date: Sun, 27 Feb 2022 08:21:20 -1000
Message-Id: <20220227182125.21809-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build               |  1 +
 target/nios2/mmu.c        | 96 ++++++++++++---------------------------
 target/nios2/trace-events | 10 ++++
 3 files changed, 39 insertions(+), 68 deletions(-)
 create mode 100644 target/nios2/trace-events

diff --git a/meson.build b/meson.build
index 8df40bfac4..98f167d782 100644
--- a/meson.build
+++ b/meson.build
@@ -2692,6 +2692,7 @@ if have_system or have_user
     'target/i386',
     'target/i386/kvm',
     'target/mips/tcg',
+    'target/nios2',
     'target/ppc',
     'target/riscv',
     'target/s390x',
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 5616c39d54..306370f675 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -23,18 +23,10 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "mmu.h"
+#include "trace/trace-target_nios2.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
-/* Define this to enable MMU debug messages */
-/* #define DEBUG_MMU */
-
-#ifdef DEBUG_MMU
-#define MMU_LOG(x) x
-#else
-#define MMU_LOG(x)
-#endif
-
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
@@ -43,37 +35,26 @@ unsigned int mmu_translate(CPUNios2State *env,
     Nios2CPU *cpu = env_archcpu(env);
     int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
     int vpn = vaddr >> 12;
+    int way, n_ways = cpu->tlb_num_ways;
 
-    MMU_LOG(qemu_log("mmu_translate vaddr %08X, pid %08X, vpn %08X\n",
-                     vaddr, pid, vpn));
-
-    int way;
-    for (way = 0; way < cpu->tlb_num_ways; way++) {
-
-        Nios2TLBEntry *entry =
-            &env->mmu.tlb[(way * cpu->tlb_num_ways) +
-                          (vpn & env->mmu.tlb_entry_mask)];
-
-        MMU_LOG(qemu_log("TLB[%d] TAG %08X, VPN %08X\n",
-                         (way * cpu->tlb_num_ways) +
-                         (vpn & env->mmu.tlb_entry_mask),
-                         entry->tag, (entry->tag >> 12)));
+    for (way = 0; way < n_ways; way++) {
+        uint32_t index = (way * n_ways) + (vpn & env->mmu.tlb_entry_mask);
+        Nios2TLBEntry *entry = &env->mmu.tlb[index];
 
         if (((entry->tag >> 12) != vpn) ||
             (((entry->tag & (1 << 11)) == 0) &&
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) != pid))) {
+            trace_nios2_mmu_translate_miss(vaddr, pid, index, entry->tag);
             continue;
         }
+
         lu->vaddr = vaddr & TARGET_PAGE_MASK;
         lu->paddr = (entry->data & CR_TLBACC_PFN_MASK) << TARGET_PAGE_BITS;
         lu->prot = ((entry->data & CR_TLBACC_R) ? PAGE_READ : 0) |
                    ((entry->data & CR_TLBACC_W) ? PAGE_WRITE : 0) |
                    ((entry->data & CR_TLBACC_X) ? PAGE_EXEC : 0);
 
-        MMU_LOG(qemu_log("HIT TLB[%d] %08X %08X %08X\n",
-                         (way * cpu->tlb_num_ways) +
-                         (vpn & env->mmu.tlb_entry_mask),
-                         lu->vaddr, lu->paddr, lu->prot));
+        trace_nios2_mmu_translate_hit(vaddr, pid, index, lu->paddr, lu->prot);
         return 1;
     }
     return 0;
@@ -84,21 +65,18 @@ static void mmu_flush_pid(CPUNios2State *env, uint32_t pid)
     CPUState *cs = env_cpu(env);
     Nios2CPU *cpu = env_archcpu(env);
     int idx;
-    MMU_LOG(qemu_log("TLB Flush PID %d\n", pid));
 
     for (idx = 0; idx < cpu->tlb_num_entries; idx++) {
         Nios2TLBEntry *entry = &env->mmu.tlb[idx];
 
-        MMU_LOG(qemu_log("TLB[%d] => %08X %08X\n",
-                         idx, entry->tag, entry->data));
-
         if ((entry->tag & (1 << 10)) && (!(entry->tag & (1 << 11))) &&
             ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) == pid)) {
             uint32_t vaddr = entry->tag & TARGET_PAGE_MASK;
 
-            MMU_LOG(qemu_log("TLB Flush Page %08X\n", vaddr));
-
+            trace_nios2_mmu_flush_pid_hit(pid, idx, vaddr);
             tlb_flush_page(cs, vaddr);
+        } else {
+            trace_nios2_mmu_flush_pid_miss(pid, idx, entry->tag);
         }
     }
 }
@@ -108,18 +86,15 @@ void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
     CPUState *cs = env_cpu(env);
     Nios2CPU *cpu = env_archcpu(env);
 
-    MMU_LOG(qemu_log("mmu_write %08X = %08X\n", rn, v));
-
     switch (rn) {
     case CR_TLBACC:
-        MMU_LOG(qemu_log("TLBACC: IG %02X, FLAGS %c%c%c%c%c, PFN %05X\n",
-                         v >> CR_TLBACC_IGN_SHIFT,
-                         (v & CR_TLBACC_C) ? 'C' : '.',
-                         (v & CR_TLBACC_R) ? 'R' : '.',
-                         (v & CR_TLBACC_W) ? 'W' : '.',
-                         (v & CR_TLBACC_X) ? 'X' : '.',
-                         (v & CR_TLBACC_G) ? 'G' : '.',
-                         v & CR_TLBACC_PFN_MASK));
+        trace_nios2_mmu_write_tlbacc(v >> CR_TLBACC_IGN_SHIFT,
+                                     (v & CR_TLBACC_C) ? 'C' : '.',
+                                     (v & CR_TLBACC_R) ? 'R' : '.',
+                                     (v & CR_TLBACC_W) ? 'W' : '.',
+                                     (v & CR_TLBACC_X) ? 'X' : '.',
+                                     (v & CR_TLBACC_G) ? 'G' : '.',
+                                     v & CR_TLBACC_PFN_MASK);
 
         /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
         if (env->regs[CR_TLBMISC] & CR_TLBMISC_WR) {
@@ -138,16 +113,10 @@ void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
             if ((entry->tag != newTag) || (entry->data != newData)) {
                 if (entry->tag & (1 << 10)) {
                     /* Flush existing entry */
-                    MMU_LOG(qemu_log("TLB Flush Page (OLD) %08X\n",
-                                     entry->tag & TARGET_PAGE_MASK));
                     tlb_flush_page(cs, entry->tag & TARGET_PAGE_MASK);
                 }
                 entry->tag = newTag;
                 entry->data = newData;
-                MMU_LOG(qemu_log("TLB[%d] = %08X %08X\n",
-                                 (way * cpu->tlb_num_ways) +
-                                 (vpn & env->mmu.tlb_entry_mask),
-                                 entry->tag, entry->data));
             }
             /* Auto-increment tlbmisc.WAY */
             env->regs[CR_TLBMISC] =
@@ -161,15 +130,14 @@ void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
         break;
 
     case CR_TLBMISC:
-        MMU_LOG(qemu_log("TLBMISC: WAY %X, FLAGS %c%c%c%c%c%c, PID %04X\n",
-                         v >> CR_TLBMISC_WAY_SHIFT,
-                         (v & CR_TLBMISC_RD) ? 'R' : '.',
-                         (v & CR_TLBMISC_WR) ? 'W' : '.',
-                         (v & CR_TLBMISC_DBL) ? '2' : '.',
-                         (v & CR_TLBMISC_BAD) ? 'B' : '.',
-                         (v & CR_TLBMISC_PERM) ? 'P' : '.',
-                         (v & CR_TLBMISC_D) ? 'D' : '.',
-                         (v & CR_TLBMISC_PID_MASK) >> 4));
+        trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
+                                      (v & CR_TLBMISC_RD) ? 'R' : '.',
+                                      (v & CR_TLBMISC_WR) ? 'W' : '.',
+                                      (v & CR_TLBMISC_DBL) ? '2' : '.',
+                                      (v & CR_TLBMISC_BAD) ? 'B' : '.',
+                                      (v & CR_TLBMISC_PERM) ? 'P' : '.',
+                                      (v & CR_TLBMISC_D) ? 'D' : '.',
+                                      (v & CR_TLBMISC_PID_MASK) >> 4);
 
         if ((v & CR_TLBMISC_PID_MASK) !=
             (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
@@ -193,11 +161,6 @@ void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
                  CR_TLBMISC_PID_SHIFT);
             env->regs[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
             env->regs[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
-            MMU_LOG(qemu_log("TLB READ way %d, vpn %05X, tag %08X, data %08X, "
-                             "tlbacc %08X, tlbmisc %08X, pteaddr %08X\n",
-                             way, vpn, entry->tag, entry->data,
-                             env->regs[CR_TLBACC], env->regs[CR_TLBMISC],
-                             env->regs[CR_PTEADDR]));
         } else {
             env->regs[CR_TLBMISC] = v;
         }
@@ -206,9 +169,8 @@ void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
         break;
 
     case CR_PTEADDR:
-        MMU_LOG(qemu_log("PTEADDR: PTBASE %03X, VPN %05X\n",
-                         v >> CR_PTEADDR_PTBASE_SHIFT,
-                         (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT));
+        trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
+                                      (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
 
         /* Writes to PTEADDR don't change the read-back VPN value */
         env->regs[CR_PTEADDR] = (v & ~CR_PTEADDR_VPN_MASK) |
@@ -226,8 +188,6 @@ void mmu_init(CPUNios2State *env)
     Nios2CPU *cpu = env_archcpu(env);
     Nios2MMU *mmu = &env->mmu;
 
-    MMU_LOG(qemu_log("mmu_init\n"));
-
     mmu->tlb_entry_mask = (cpu->tlb_num_entries / cpu->tlb_num_ways) - 1;
     mmu->tlb = g_new0(Nios2TLBEntry, cpu->tlb_num_entries);
 }
diff --git a/target/nios2/trace-events b/target/nios2/trace-events
new file mode 100644
index 0000000000..07f1f0a5e7
--- /dev/null
+++ b/target/nios2/trace-events
@@ -0,0 +1,10 @@
+# mmu.c
+nios2_mmu_translate_miss(uint32_t vaddr, uint32_t pid, uint32_t index, uint32_t tag) "mmu_translate: MISS vaddr=0x%08x pid=%u TLB[%u] tag=0x%08x"
+nios2_mmu_translate_hit(uint32_t vaddr, uint32_t pid, uint32_t index, uint32_t paddr, uint32_t prot) "mmu_translate: HIT vaddr=0x%08x pid=%u TLB[%u] paddr=0x%08x prot=0x%x"
+
+nios2_mmu_flush_pid_miss(uint32_t pid, uint32_t index, uint32_t vaddr) "mmu_flush: MISS pid=%u TLB[%u] tag=0x%08x"
+nios2_mmu_flush_pid_hit(uint32_t pid, uint32_t index, uint32_t vaddr) "mmu_flush: HIT pid=%u TLB[%u] vaddr=0x%08x"
+
+nios2_mmu_write_tlbacc(uint32_t ig, char c, char r, char w, char x, char g, uint32_t pfn) "mmu_write_tlbacc: ig=0x%02x flags=%c%c%c%c%c pfn=0x%08x"
+nios2_mmu_write_tlbmisc(uint32_t way, char r, char w, char t, char b, char p, char d, uint32_t pid) "mmu_write_tlbmisc: way=0x%x flags=%c%c%c%c%c%c pid=%u"
+nios2_mmu_write_pteaddr(uint32_t ptb, uint32_t vpn) "mmu_write_pteaddr: ptbase=0x%03x vpn=0x%05x"
-- 
2.25.1


