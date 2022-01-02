Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FEB482C15
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 17:29:40 +0100 (CET)
Received: from localhost ([::1]:41382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n43jn-0000r4-Kc
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 11:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PM-0006yy-2R
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:32 -0500
Received: from goliath.siemens.de ([192.35.17.28]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PJ-0004Dj-Rm
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:31 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 202G8RT7028216
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Jan 2022 17:08:27 +0100
Received: from fedora.vmnet8.md1wgtfc ([144.145.220.57])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 202G82UV030977;
 Sun, 2 Jan 2022 17:08:27 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/5] RISC-V: 'info gmem' to show hypervisor guest ->
 physical address translations
Date: Sun,  2 Jan 2022 17:06:10 +0100
Message-Id: <03cb38fdfab89a6725fa0c7cadad2055d6be48a4.1641137349.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641137349.git.konrad.schwarz@siemens.com>
References: <cover.1641137349.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.28;
 envelope-from=konrad.schwarz@siemens.com; helo=goliath.siemens.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Jan 2022 11:21:56 -0500
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
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is analog to the existing 'info mem' command and is implemented
using the same machinery.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 hmp-commands-info.hx         |  16 +++++
 include/monitor/hmp-target.h |   2 +
 target/riscv/monitor.c       | 135 +++++++++++++++++++++++++----------
 3 files changed, 117 insertions(+), 36 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da800..fa519f0129 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -237,6 +237,22 @@ SRST
     Show the active virtual memory mappings.
 ERST
 
+#if defined TARGET_RISCV
+    {
+        .name       = "gmem",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show the hypervisor guest's physical address"
+		    " translation",
+        .cmd        = hmp_info_gmem,
+    },
+#endif
+
+SRST
+  ``info gmem``
+    Show the hypervisor guest's physical address translation.
+ERST
+
     {
         .name       = "mtree",
         .args_type  = "flatview:-f,dispatch_tree:-d,owner:-o,disabled:-D",
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index ffdc15a34b..9f2dd976f6 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -2,6 +2,7 @@
  * QEMU monitor
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -45,6 +46,7 @@ CPUArchState *mon_get_cpu_env(Monitor *mon);
 CPUState *mon_get_cpu(Monitor *mon);
 
 void hmp_info_mem(Monitor *mon, const QDict *qdict);
+void hmp_info_gmem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 3f74ea9934..ad58bdf9ca 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -25,16 +25,6 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 
-#ifdef TARGET_RISCV64
-#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
-                                "size             attr\n"
-#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
-                                "---------------- -------\n"
-#else
-#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
-#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
-#endif
-
 /* Perform linear address sign extension */
 static target_ulong addr_canonical(int va_bits, target_ulong addr)
 {
@@ -47,10 +37,34 @@ static target_ulong addr_canonical(int va_bits, target_ulong addr)
     return addr;
 }
 
-static void print_pte_header(Monitor *mon)
+static void print_pte_header(Monitor *mon,
+        char const vaddr_char, char const paddr_char)
 {
-    monitor_printf(mon, PTE_HEADER_FIELDS);
-    monitor_printf(mon, PTE_HEADER_DELIMITER);
+
+# define        VIRTUAL_WIDTH\
+        ((int) ((sizeof "ff" - sizeof "") * sizeof(target_ulong)))
+# define        PHYSICAL_WIDTH\
+        ((int) ((sizeof "ff" - sizeof "") * sizeof(hwaddr)))
+# define        ATTRIBUTE_WIDTH ((int) (sizeof "rwxugad" - sizeof ""))
+
+# define        VIRTUAL_COLUMN_WIDTH    (1 + VIRTUAL_WIDTH)
+# define        PHYSICAL_COLUMN_WIDTH   (1 + PHYSICAL_WIDTH)
+
+    static char const dashes[PHYSICAL_WIDTH] = "----------------";
+
+    monitor_printf(mon,
+            "%c%-*s%c%-*s%-*s%-*s\n"
+            "%-*.*s%-*.*s%-*.*s%-*.*s\n",
+
+            vaddr_char, VIRTUAL_COLUMN_WIDTH - 1, "addr",
+            paddr_char, PHYSICAL_COLUMN_WIDTH - 1, "addr",
+            VIRTUAL_COLUMN_WIDTH, "size",
+            ATTRIBUTE_WIDTH, "attr",
+
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
+            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, dashes,
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
+            ATTRIBUTE_WIDTH, ATTRIBUTE_WIDTH, dashes);
 }
 
 static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
@@ -65,21 +79,36 @@ static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
         return;
     }
 
-    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
-                   " %c%c%c%c%c%c%c\n",
-                   addr_canonical(va_bits, vaddr),
-                   paddr, size,
-                   attr & PTE_R ? 'r' : '-',
-                   attr & PTE_W ? 'w' : '-',
-                   attr & PTE_X ? 'x' : '-',
-                   attr & PTE_U ? 'u' : '-',
-                   attr & PTE_G ? 'g' : '-',
-                   attr & PTE_A ? 'a' : '-',
-                   attr & PTE_D ? 'd' : '-');
+# if 4 == TARGET_LONG_SIZE
+#       define  TARGET_xFMT     PRIx32
+# elif 8 == TARGET_LONG_SIZE
+#       define  TARGET_xFMT     PRIx64
+# else
+#       error TARGET_LONG_SIZE not handled
+# endif
+
+    /* note: RISC-V physical addresses are actually xlen + 2 bits long
+    OTHO, QEMU wil probably never support addresses longer than 64 bits */
+    monitor_printf(mon,
+            "%-*.*" TARGET_xFMT
+            "%-*.*" PRIx64
+            "%-*.*" TARGET_xFMT
+            "%c%c%c%c%c%c%c\n",
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, addr_canonical(va_bits, vaddr),
+            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, paddr,
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, size,
+            attr & PTE_R ? 'r' : '-',
+            attr & PTE_W ? 'w' : '-',
+            attr & PTE_X ? 'x' : '-',
+            attr & PTE_U ? 'u' : '-',
+            attr & PTE_G ? 'g' : '-',
+            attr & PTE_A ? 'a' : '-',
+            attr & PTE_D ? 'd' : '-');
 }
 
 static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                      int level, int ptidxbits, int ptesize, int va_bits,
+                     int guest,
                      target_ulong *vbase, hwaddr *pbase, hwaddr *last_paddr,
                      target_ulong *last_size, int *last_attr)
 {
@@ -89,7 +118,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
     target_ulong pte;
     int ptshift;
     int attr;
-    int idx;
+    int idx, idx_end;
 
     if (level < 0) {
         return;
@@ -98,7 +127,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
     ptshift = level * ptidxbits;
     pgsize = 1UL << (PGSHIFT + ptshift);
 
-    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
+    for (idx = 0, idx_end = 1 << (ptidxbits + (guest ? 2 : 0));
+            idx_end > idx; idx++) {
         pte_addr = base + idx * ptesize;
         cpu_physical_memory_read(pte_addr, &pte, ptesize);
 
@@ -131,7 +161,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
             } else {
                 /* pointer to the next level of the page table */
                 walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
-                         va_bits, vbase, pbase, last_paddr,
+                         va_bits,
+                         0 /* guest */,
+                         vbase, pbase, last_paddr,
                          last_size, last_attr);
             }
         }
@@ -141,7 +173,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
 
 }
 
-static void mem_info_svxx(Monitor *mon, CPUArchState *env)
+static void mem_info_svxx(Monitor *mon, CPUArchState *env,
+        target_ulong const atp,
+        int guest, char const vaddr_char, char const paddr_char)
 {
     int levels, ptidxbits, ptesize, vm, va_bits;
     hwaddr base;
@@ -152,11 +186,11 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     int last_attr;
 
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
-        vm = get_field(env->satp, SATP32_MODE);
+        base = (hwaddr)get_field(atp, SATP32_PPN) << PGSHIFT;
+        vm = get_field(atp, SATP32_MODE);
     } else {
-        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
-        vm = get_field(env->satp, SATP64_MODE);
+        base = (hwaddr)get_field(atp, SATP64_PPN) << PGSHIFT;
+        vm = get_field(atp, SATP64_MODE);
     }
 
     switch (vm) {
@@ -189,7 +223,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     va_bits = PGSHIFT + levels * ptidxbits;
 
     /* print header */
-    print_pte_header(mon);
+    print_pte_header(mon, vaddr_char, paddr_char);
 
     vbase = -1;
     pbase = -1;
@@ -199,6 +233,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
 
     /* walk page tables, starting from address 0 */
     walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
+             guest,
              &vbase, &pbase, &last_paddr, &last_size, &last_attr);
 
     /* don't forget the last one */
@@ -209,6 +244,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
 void hmp_info_mem(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
+    target_ulong atp;
 
     env = mon_get_cpu_env(mon);
     if (!env) {
@@ -221,19 +257,46 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    atp = env->satp;
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        if (!(env->satp & SATP32_MODE)) {
+        if (!(atp & SATP32_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
         }
     } else {
-        if (!(env->satp & SATP64_MODE)) {
+        if (!(atp & SATP64_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
         }
     }
 
-    mem_info_svxx(mon, env);
+    mem_info_svxx(mon, env, atp, 0, 'v', 'p');
+}
+
+void hmp_info_gmem(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env;
+    target_ulong atp;
+
+    env = mon_get_cpu_env(mon);
+    if (!env) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    if (!riscv_has_ext(env, RVH)) {
+        monitor_printf(mon, "hypervisor extension not available\n");
+        return;
+    }
+
+    atp = env->hgatp;
+    if (!((MXL_RV32 == riscv_cpu_mxl(env) ? SATP32_MODE : SATP64_MODE)
+            & atp)) {
+        monitor_printf(mon, "No translation or protection\n");
+        return;
+    }
+
+    mem_info_svxx(mon, env, atp, 1, 'g', 'p');
 }
 
 static const MonitorDef monitor_defs[] = {
-- 
Konrad Schwarz


