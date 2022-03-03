Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421754CC752
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:50:43 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsPK-0000Jm-8b
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLb-0001bA-6C
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:51 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35808
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLX-0000wW-TJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:50 -0500
Received: by mail-pg1-x52d.google.com with SMTP id e6so5724642pgn.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/Ro2VorV8KM/dwx29I+F+iPCNjQCry/jWK7O96h7Ew=;
 b=OsMmywAH4+gCIAjLrGI4SrOiOX5VOiEocantlhYYUEGaMXS72M6Vi8moZvS4k6geCf
 TRAXLv0TftJ+ayDt60k/ymy6XeRMfv2vN+6+5cCSBTOcL5t1s0Szb96dALL1qAs6/Had
 ndiAMapKFSMMcJ/2YDeUtkIfY9uHi5TplwiJ6yVEzyCR0ZNdU0YsWUWXhw7IZ+SPO6om
 DGBA4dJEzEFcTgW3W1nhkll2rxj4Cbrj2E7x/Y1NE8P0Fxv4/GJLFy/VOp/Q2FiiqmQb
 au5eFc8mB8fD3wSlV+BEMSmh4GDe3n+PnwfviLJRzwkaECc8PryBv/6ZdqGBziInOQqW
 GBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/Ro2VorV8KM/dwx29I+F+iPCNjQCry/jWK7O96h7Ew=;
 b=2HkaZQ07cQZQvUWGbXnLKKzLxaUcDpYevXXi8MRAbn4IGZUl22IQkq/olYq66UMU3h
 K4RTl07Z3KuYMLHLhgDWlMofAp9EUw4BRVw8zarQkpXmBh7CDwiHANKttH/NlzKeoYos
 i91uBaMuU025kSrlsu25hkLGvmrOlryrSA92vOvaw38V/Tt/xzsjJzpAgZpaCm+gyvHh
 XWrRf2nfFrQ0pB1unk5MfIKvjiw2t5L/y0YfZy08SiXh5efhiBy+2eqram9el+lAc9Y2
 1bQ/FyNWYAMYqqh/XrmjyaGV7YsZHXtrX7s8cFnQshHobGGgphsL+9rph8loVGdDX9G3
 dztQ==
X-Gm-Message-State: AOAM532ZFegPfjROLuXarGx3JYX9qZ9ZtHV0uSeT2OUzRqJZrWMc5E7q
 csajOLzXiGSG7wGwE6igtkv5v0UFfvC1QQ==
X-Google-Smtp-Source: ABdhPJxte3DL7SqyCWEFRjcgF9ZZFsH6+OfFTj/hLp4YolIU5LQM/v/Rm1s5xyTETLnOvagTWrA9Fg==
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id
 z5-20020a056a00240500b004e15008adccmr40252735pfh.35.1646340390111; 
 Thu, 03 Mar 2022 12:46:30 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] target/nios2: Replace MMU_LOG with tracepoints
Date: Thu,  3 Mar 2022 10:46:19 -1000
Message-Id: <20220303204624.468786-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build               |  1 +
 target/nios2/mmu.c        | 96 ++++++++++++---------------------------
 target/nios2/trace-events | 10 ++++
 3 files changed, 39 insertions(+), 68 deletions(-)
 create mode 100644 target/nios2/trace-events

diff --git a/meson.build b/meson.build
index a5b63e62cd..038502714a 100644
--- a/meson.build
+++ b/meson.build
@@ -2705,6 +2705,7 @@ if have_system or have_user
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


