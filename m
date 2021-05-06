Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC5374CFD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:45:19 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT4o-0007ZJ-DG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT1A-000369-EH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT17-0007bf-UT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:32 -0400
IronPort-SDR: 8PlpcPKxxXmbNPKR55TFoOnEbuBP6YY0uTAmEpC3Ksn1OV2s8btnbPPu1qOZ6FmaolRyNWgvuU
 LRK1u846V3hQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579171"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:29 -0700
IronPort-SDR: v0LBDmHDOhgA++ktgGDX9xGNyY9Fkbn8+7FZMeSoKZrAgcJAK2l9nO0lOPjlKsB0ppoxB/Echi
 tQTNtTz+26+g==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220466"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:25 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 09/10] Change the monitor and other commands and
 gdbstub to use the debug API
Date: Thu,  6 May 2021 09:40:36 +0800
Message-Id: <20210506014037.11982-10-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yuan.yao@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuan Yao <yuan.yao@intel.com>

Please comment if some changes are incorrect or I missed something here.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/dump/dump.c b/dump/dump.c
index 929138e91d..21eb018092 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1746,7 +1746,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
             warn_report("guest note format is unsupported: %" PRIu16, format);
         } else {
             s->guest_note = g_malloc(size + 1); /* +1 for adding \0 */
-            cpu_physical_memory_read(addr, s->guest_note, size);
+            cpu_physical_memory_read_debug(addr, s->guest_note, size);
 
             get_note_sizes(s, s->guest_note, NULL, &name_size, &desc_size);
             s->guest_note_size = ELF_NOTE_SIZE(note_head_size, name_size,
diff --git a/gdbstub.c b/gdbstub.c
index 054665e93e..bdb3c688e5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -71,9 +71,9 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 #ifndef CONFIG_USER_ONLY
     if (phy_memory_mode) {
         if (is_write) {
-            cpu_physical_memory_write(addr, buf, len);
+            cpu_physical_memory_write_debug(addr, buf, len);
         } else {
-            cpu_physical_memory_read(addr, buf, len);
+            cpu_physical_memory_read_debug(addr, buf, len);
         }
         return 0;
     }
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 6d223ea196..e62d135829 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -59,7 +59,6 @@ typedef struct MemTxAttrs {
  * from "didn't specify" if necessary).
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
-
 // Same as MEMTXATTRS_UNSPECIFIED but enable debug
 #define MEMTXATTRS_UNSPECIFIED_DEBUG ((MemTxAttrs) { .unspecified = 1, .debug = 1 })
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 55f3744053..60e4473af3 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -587,8 +587,9 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
             l = line_size;
         if (is_physical) {
             AddressSpace *as = cs ? cs->as : &address_space_memory;
-            MemTxResult r = address_space_read(as, addr,
-                                               MEMTXATTRS_UNSPECIFIED, buf, l);
+            MemTxResult r = address_space_read_debug(as, addr,
+                                                     MEMTXATTRS_UNSPECIFIED_DEBUG,
+                                                     buf, l);
             if (r != MEMTX_OK) {
                 monitor_printf(mon, " Cannot access memory\n");
                 break;
@@ -825,11 +826,14 @@ static void hmp_sum(Monitor *mon, const QDict *qdict)
     uint16_t sum;
     uint32_t start = qdict_get_int(qdict, "start");
     uint32_t size = qdict_get_int(qdict, "size");
+    uint8_t val;
 
     sum = 0;
     for(addr = start; addr < (start + size); addr++) {
-        uint8_t val = address_space_ldub(&address_space_memory, addr,
-                                         MEMTXATTRS_UNSPECIFIED, NULL);
+        address_space_read_debug(&address_space_memory,
+                                 addr,
+                                 MEMTXATTRS_UNSPECIFIED_DEBUG,
+                                 &val, sizeof(val));
         /* BSD sum algorithm ('sum' Unix command) */
         sum = (sum >> 1) | (sum << 15);
         sum += val;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187..baa2a2022a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -785,7 +785,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
         l = sizeof(buf);
         if (l > size)
             l = size;
-        cpu_physical_memory_read(addr, buf, l);
+        cpu_physical_memory_read_debug(addr, buf, l);
         if (fwrite(buf, 1, l, f) != l) {
             error_setg(errp, QERR_IO_ERROR);
             goto exit;
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 2b636293c6..f9412b6030 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -81,7 +81,7 @@ static void tlb_info_32(Monitor *mon, CPUArchState *env)
 
     pgd = env->cr[3] & ~0xfff;
     for(l1 = 0; l1 < 1024; l1++) {
-        cpu_physical_memory_read(pgd + l1 * 4, &pde, 4);
+        cpu_physical_memory_read_debug(pgd + l1 * 4, &pde, 4);
         pde = le32_to_cpu(pde);
         if (pde & PG_PRESENT_MASK) {
             if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
@@ -89,7 +89,7 @@ static void tlb_info_32(Monitor *mon, CPUArchState *env)
                 print_pte(mon, env, (l1 << 22), pde, ~((1 << 21) - 1));
             } else {
                 for(l2 = 0; l2 < 1024; l2++) {
-                    cpu_physical_memory_read((pde & ~0xfff) + l2 * 4, &pte, 4);
+                    cpu_physical_memory_read_debug((pde & ~0xfff) + l2 * 4, &pte, 4);
                     pte = le32_to_cpu(pte);
                     if (pte & PG_PRESENT_MASK) {
                         print_pte(mon, env, (l1 << 22) + (l2 << 12),
@@ -110,12 +110,12 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env)
 
     pdp_addr = env->cr[3] & ~0x1f;
     for (l1 = 0; l1 < 4; l1++) {
-        cpu_physical_memory_read(pdp_addr + l1 * 8, &pdpe, 8);
+        cpu_physical_memory_read_debug(pdp_addr + l1 * 8, &pdpe, 8);
         pdpe = le64_to_cpu(pdpe);
         if (pdpe & PG_PRESENT_MASK) {
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pd_addr + l2 * 8, &pde, 8);
+                cpu_physical_memory_read_debug(pd_addr + l2 * 8, &pde, 8);
                 pde = le64_to_cpu(pde);
                 if (pde & PG_PRESENT_MASK) {
                     if (pde & PG_PSE_MASK) {
@@ -125,7 +125,7 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env)
                     } else {
                         pt_addr = pde & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pt_addr + l3 * 8, &pte, 8);
+                            cpu_physical_memory_read_debug(pt_addr + l3 * 8, &pte, 8);
                             pte = le64_to_cpu(pte);
                             if (pte & PG_PRESENT_MASK) {
                                 print_pte(mon, env, (l1 << 30) + (l2 << 21)
@@ -150,7 +150,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
     uint64_t pdp_addr, pd_addr, pt_addr;
 
     for (l1 = 0; l1 < 512; l1++) {
-        cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
+        cpu_physical_memory_read_debug(pml4_addr + l1 * 8, &pml4e, 8);
         pml4e = le64_to_cpu(pml4e);
         if (!(pml4e & PG_PRESENT_MASK)) {
             continue;
@@ -158,7 +158,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
 
         pdp_addr = pml4e & 0x3fffffffff000ULL;
         for (l2 = 0; l2 < 512; l2++) {
-            cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
+            cpu_physical_memory_read_debug(pdp_addr + l2 * 8, &pdpe, 8);
             pdpe = le64_to_cpu(pdpe);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 continue;
@@ -173,7 +173,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
 
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l3 = 0; l3 < 512; l3++) {
-                cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
+                cpu_physical_memory_read_debug(pd_addr + l3 * 8, &pde, 8);
                 pde = le64_to_cpu(pde);
                 if (!(pde & PG_PRESENT_MASK)) {
                     continue;
@@ -188,7 +188,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
 
                 pt_addr = pde & 0x3fffffffff000ULL;
                 for (l4 = 0; l4 < 512; l4++) {
-                    cpu_physical_memory_read(pt_addr
+                    cpu_physical_memory_read_debug(pt_addr
                             + l4 * 8,
                             &pte, 8);
                     pte = le64_to_cpu(pte);
@@ -211,7 +211,7 @@ static void tlb_info_la57(Monitor *mon, CPUArchState *env)
 
     pml5_addr = env->cr[3] & 0x3fffffffff000ULL;
     for (l0 = 0; l0 < 512; l0++) {
-        cpu_physical_memory_read(pml5_addr + l0 * 8, &pml5e, 8);
+        cpu_physical_memory_read_debug(pml5_addr + l0 * 8, &pml5e, 8);
         pml5e = le64_to_cpu(pml5e);
         if (pml5e & PG_PRESENT_MASK) {
             tlb_info_la48(mon, env, l0, pml5e & 0x3fffffffff000ULL);
@@ -288,7 +288,7 @@ static void mem_info_32(Monitor *mon, CPUArchState *env)
     last_prot = 0;
     start = -1;
     for(l1 = 0; l1 < 1024; l1++) {
-        cpu_physical_memory_read(pgd + l1 * 4, &pde, 4);
+        cpu_physical_memory_read_debug(pgd + l1 * 4, &pde, 4);
         pde = le32_to_cpu(pde);
         end = l1 << 22;
         if (pde & PG_PRESENT_MASK) {
@@ -297,7 +297,7 @@ static void mem_info_32(Monitor *mon, CPUArchState *env)
                 mem_print(mon, env, &start, &last_prot, end, prot);
             } else {
                 for(l2 = 0; l2 < 1024; l2++) {
-                    cpu_physical_memory_read((pde & ~0xfff) + l2 * 4, &pte, 4);
+                    cpu_physical_memory_read_debug((pde & ~0xfff) + l2 * 4, &pte, 4);
                     pte = le32_to_cpu(pte);
                     end = (l1 << 22) + (l2 << 12);
                     if (pte & PG_PRESENT_MASK) {
@@ -330,13 +330,13 @@ static void mem_info_pae32(Monitor *mon, CPUArchState *env)
     last_prot = 0;
     start = -1;
     for (l1 = 0; l1 < 4; l1++) {
-        cpu_physical_memory_read(pdp_addr + l1 * 8, &pdpe, 8);
+        cpu_physical_memory_read_debug(pdp_addr + l1 * 8, &pdpe, 8);
         pdpe = le64_to_cpu(pdpe);
         end = l1 << 30;
         if (pdpe & PG_PRESENT_MASK) {
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pd_addr + l2 * 8, &pde, 8);
+                cpu_physical_memory_read_debug(pd_addr + l2 * 8, &pde, 8);
                 pde = le64_to_cpu(pde);
                 end = (l1 << 30) + (l2 << 21);
                 if (pde & PG_PRESENT_MASK) {
@@ -347,7 +347,7 @@ static void mem_info_pae32(Monitor *mon, CPUArchState *env)
                     } else {
                         pt_addr = pde & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pt_addr + l3 * 8, &pte, 8);
+                            cpu_physical_memory_read_debug(pt_addr + l3 * 8, &pte, 8);
                             pte = le64_to_cpu(pte);
                             end = (l1 << 30) + (l2 << 21) + (l3 << 12);
                             if (pte & PG_PRESENT_MASK) {
@@ -386,13 +386,13 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env)
     last_prot = 0;
     start = -1;
     for (l1 = 0; l1 < 512; l1++) {
-        cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
+        cpu_physical_memory_read_debug(pml4_addr + l1 * 8, &pml4e, 8);
         pml4e = le64_to_cpu(pml4e);
         end = l1 << 39;
         if (pml4e & PG_PRESENT_MASK) {
             pdp_addr = pml4e & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
+                cpu_physical_memory_read_debug(pdp_addr + l2 * 8, &pdpe, 8);
                 pdpe = le64_to_cpu(pdpe);
                 end = (l1 << 39) + (l2 << 30);
                 if (pdpe & PG_PRESENT_MASK) {
@@ -404,7 +404,7 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env)
                     } else {
                         pd_addr = pdpe & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
+                            cpu_physical_memory_read_debug(pd_addr + l3 * 8, &pde, 8);
                             pde = le64_to_cpu(pde);
                             end = (l1 << 39) + (l2 << 30) + (l3 << 21);
                             if (pde & PG_PRESENT_MASK) {
@@ -417,9 +417,9 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env)
                                 } else {
                                     pt_addr = pde & 0x3fffffffff000ULL;
                                     for (l4 = 0; l4 < 512; l4++) {
-                                        cpu_physical_memory_read(pt_addr
-                                                                 + l4 * 8,
-                                                                 &pte, 8);
+                                        cpu_physical_memory_read_debug(pt_addr
+                                                                       + l4 * 8,
+                                                                       &pte, 8);
                                         pte = le64_to_cpu(pte);
                                         end = (l1 << 39) + (l2 << 30) +
                                             (l3 << 21) + (l4 << 12);
@@ -466,7 +466,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
     last_prot = 0;
     start = -1;
     for (l0 = 0; l0 < 512; l0++) {
-        cpu_physical_memory_read(pml5_addr + l0 * 8, &pml5e, 8);
+        cpu_physical_memory_read_debug(pml5_addr + l0 * 8, &pml5e, 8);
         pml5e = le64_to_cpu(pml5e);
         end = l0 << 48;
         if (!(pml5e & PG_PRESENT_MASK)) {
@@ -477,7 +477,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
 
         pml4_addr = pml5e & 0x3fffffffff000ULL;
         for (l1 = 0; l1 < 512; l1++) {
-            cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
+            cpu_physical_memory_read_debug(pml4_addr + l1 * 8, &pml4e, 8);
             pml4e = le64_to_cpu(pml4e);
             end = (l0 << 48) + (l1 << 39);
             if (!(pml4e & PG_PRESENT_MASK)) {
@@ -488,7 +488,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
 
             pdp_addr = pml4e & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
+                cpu_physical_memory_read_debug(pdp_addr + l2 * 8, &pdpe, 8);
                 pdpe = le64_to_cpu(pdpe);
                 end = (l0 << 48) + (l1 << 39) + (l2 << 30);
                 if (pdpe & PG_PRESENT_MASK) {
@@ -507,7 +507,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
 
                 pd_addr = pdpe & 0x3fffffffff000ULL;
                 for (l3 = 0; l3 < 512; l3++) {
-                    cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
+                    cpu_physical_memory_read_debug(pd_addr + l3 * 8, &pde, 8);
                     pde = le64_to_cpu(pde);
                     end = (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 << 21);
                     if (pde & PG_PRESENT_MASK) {
@@ -526,7 +526,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
 
                     pt_addr = pde & 0x3fffffffff000ULL;
                     for (l4 = 0; l4 < 512; l4++) {
-                        cpu_physical_memory_read(pt_addr + l4 * 8, &pte, 8);
+                        cpu_physical_memory_read_debug(pt_addr + l4 * 8, &pte, 8);
                         pte = le64_to_cpu(pte);
                         end = (l0 << 48) + (l1 << 39) + (l2 << 30) +
                             (l3 << 21) + (l4 << 12);
-- 
2.20.1


