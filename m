Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2344EDD48
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:38:58 +0200 (CEST)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwsz-0002IK-99
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:38:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfQ-0003Id-OL; Thu, 31 Mar 2022 11:24:56 -0400
Received: from [187.72.171.209] (port=51585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfN-0004ne-FK; Thu, 31 Mar 2022 11:24:56 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 12:24:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D9224801476;
 Thu, 31 Mar 2022 11:58:43 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 4/5] tests/tcg/ppc64: add MMU test sources
Date: Thu, 31 Mar 2022 11:58:12 -0300
Message-Id: <20220331145813.21719-5-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
References: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 15:24:02.0437 (UTC)
 FILETIME=[5A048350:01D84513]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add MMU test sources, from https://github.com/legoater/pnv-test,
based on Microwatt tests but with some adaptations.

In particular, the tests that check updates to RC bits were
removed, because, apparently, Microwatt never updates RC bits, but
just raise an exception when they must be updated, leaving the
task to the OS
(https://github.com/antonblanchard/microwatt/blob/master/mmu.vhdl#L402).

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 tests/tcg/ppc64/system/mmu-head.S | 142 ++++++
 tests/tcg/ppc64/system/mmu.c      | 764 ++++++++++++++++++++++++++++++
 tests/tcg/ppc64/system/mmu.h      |   9 +
 3 files changed, 915 insertions(+)
 create mode 100644 tests/tcg/ppc64/system/mmu-head.S
 create mode 100644 tests/tcg/ppc64/system/mmu.c
 create mode 100644 tests/tcg/ppc64/system/mmu.h

diff --git a/tests/tcg/ppc64/system/mmu-head.S b/tests/tcg/ppc64/system/mmu-head.S
new file mode 100644
index 0000000000..a3f23fcb17
--- /dev/null
+++ b/tests/tcg/ppc64/system/mmu-head.S
@@ -0,0 +1,142 @@
+/* Copyright 2013-2014 IBM Corp.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ *     http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+ * implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ */
+
+#include "asm.h"
+
+#include "lib/boot.S"
+
+    /* Read a location with translation on */
+FUNCTION(test_read)
+    mfmsr   %r9
+    ori     %r8,%r9,0x10    /* set MSR_DR */
+    mtmsrd  %r8,0
+    mr      %r6,%r3
+    li      %r3,0
+    ld      %r5,0(%r6)
+    li      %r3,1
+    /* land here if DSI occurred */
+    mtmsrd  %r9,0
+    std     %r5,0(%r4)
+    blr
+
+    /* Write a location with translation on */
+FUNCTION(test_write)
+    mfmsr   %r9
+    ori     %r8,%r9,0x10    /* set MSR_DR */
+    mtmsrd  %r8,0
+    mr      %r6,%r3
+    li      %r3,0
+    std     %r4,0(%r6)
+    li      %r3,1
+    /* land here if DSI occurred */
+    mtmsrd  %r9,0
+    blr
+
+    /* Do a dcbz with translation on */
+FUNCTION(test_dcbz)
+    mfmsr   %r9
+    ori     %r8,%r9,0x10    /* set MSR_DR */
+    mtmsrd  %r8,0
+    mr      %r6,%r3
+    li      %r3,0
+    dcbz    0,%r6
+    li      %r3,1
+    /* land here if DSI occurred */
+    mtmsrd  %r9,0
+    blr
+
+FUNCTION(test_exec)
+    mtsrr0  %r4
+    mtsrr1  %r5
+    rfid
+
+#define EXCEPTION(nr)        \
+    .= nr                   ;\
+    li      %r3, (nr >> 4)  ;\
+    attn
+
+    /* DSI vector - skip the failing instruction + the next one */
+    . = 0x300
+    mtsprg0 %r10
+    mfsrr0  %r10
+    addi    %r10,%r10,8
+    mtsrr0  %r10
+    rfid
+
+    EXCEPTION(0x380)
+
+    /*
+     * ISI vector - jump to LR to return from the test,
+     * with r3 cleared
+     */
+    . = 0x400
+    li      %r3,0
+    blr
+
+    /* More exception stubs */
+    EXCEPTION(0x480)
+    EXCEPTION(0x500)
+    EXCEPTION(0x600)
+    EXCEPTION(0x700)
+    EXCEPTION(0x800)
+    EXCEPTION(0x900)
+    EXCEPTION(0x980)
+    EXCEPTION(0xa00)
+    EXCEPTION(0xb00)
+
+    /*
+     * System call - used to exit from tests where MSR[PR]
+     * may have been set.
+     */
+    . = 0xc00
+    blr
+
+    EXCEPTION(0xd00)
+    EXCEPTION(0xe00)
+    EXCEPTION(0xe20)
+    EXCEPTION(0xe40)
+    EXCEPTION(0xe60)
+    EXCEPTION(0xe80)
+    EXCEPTION(0xf00)
+    EXCEPTION(0xf20)
+    EXCEPTION(0xf40)
+    EXCEPTION(0xf60)
+    EXCEPTION(0xf80)
+
+    . = 0x1000
+    /*
+     * This page gets mapped at various locations and
+     * the tests try to execute from it.
+     * r3 contains the test number.
+     */
+FUNCTION(test_start)
+    nop
+    nop
+    cmpdi   %r3,1
+    beq     test_1
+    cmpdi   %r3,2
+    beq     test_2
+test_return:
+    li      %r3,1
+    sc
+
+    . = 0x1ff8
+    /* test a branch near the end of a page */
+test_1:     b   test_return
+
+    /* test flowing from one page to the next */
+test_2:     nop
+    b       test_return
diff --git a/tests/tcg/ppc64/system/mmu.c b/tests/tcg/ppc64/system/mmu.c
new file mode 100644
index 0000000000..8e9fca2675
--- /dev/null
+++ b/tests/tcg/ppc64/system/mmu.c
@@ -0,0 +1,764 @@
+#include <stddef.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "minilib.h"
+#include "mmu.h"
+
+#define MSR_LE    0x01
+#define MSR_DR    0x10
+#define MSR_IR    0x20
+#define MSR_HV    0x1000000000000000ul
+#define MSR_SF    0x8000000000000000ul
+
+#ifdef __LITTLE_ENDIAN__
+#define MSR_DFLT    (MSR_SF | MSR_HV | MSR_LE)
+#else
+#define MSR_DFLT    (MSR_SF | MSR_HV)
+#endif
+
+#define XSTR(x)     #x
+#define STR(x)      XSTR(x)
+
+#define RIC_TLB     0
+#define RIC_PWC     1
+#define RIC_ALL     2
+
+#define PRS         1
+
+#define IS(x)       ((unsigned long)(x) << 10)
+#define IS_VA       IS(0)
+#define IS_PID      IS(1)
+#define IS_LPID     IS(2)
+#define IS_ALL      IS(3)
+
+#define TLBIE_5(rb, rs, ric, prs, r)                \
+    __asm__ volatile(".long 0x7c000264 | "          \
+        "%0 << 21 | "                               \
+        STR(ric) " << 18 | "                        \
+        STR(prs) " << 17 | "                        \
+        STR(r) "<< 16 | "                           \
+        "%1 << 11"                                  \
+        : : "r" (rs), "r" (rb) : "memory")
+
+static inline void tlbie_all(int prs)
+{
+    if (prs) {
+        TLBIE_5(IS_ALL, 0, RIC_ALL, 1, 1);
+    } else {
+        TLBIE_5(IS_ALL, 0, RIC_ALL, 0, 1);
+    }
+}
+
+static inline void tlbie_va(unsigned long va, int prs)
+{
+    va &= ~0xffful;
+
+    if (prs) {
+        TLBIE_5(IS_VA | va, 0, RIC_TLB, 1, 1);
+    } else {
+        TLBIE_5(IS_VA | va, 0, RIC_TLB, 0, 1);
+    }
+    __asm__ volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
+#define DSISR       18
+#define DAR         19
+#define SRR0        26
+#define SRR1        27
+#define PID         48
+#define LPCR        318
+#define PTCR        464
+
+#define PPC_BIT(x)  (0x8000000000000000ul >> (x))
+
+#define LPCR_UPRT   PPC_BIT(41)
+#define LPCR_HR     PPC_BIT(43)
+
+#define PATE_HR     PPC_BIT(0)
+
+static inline unsigned long mfspr(int sprnum)
+{
+    long val;
+
+    __asm__ volatile("mfspr %0,%1" : "=r" (val) : "i" (sprnum));
+    return val;
+}
+
+static inline void mtspr(int sprnum, unsigned long val)
+{
+    __asm__ volatile("mtspr %0,%1" : : "i" (sprnum), "r" (val));
+}
+
+static inline void store_pte(unsigned long *p, unsigned long pte)
+{
+#ifdef __LITTLE_ENDIAN__
+    __asm__ volatile("stdbrx %1,0,%0" : : "r" (p), "r" (pte) : "memory");
+#else
+    __asm__ volatile("stdx   %1,0,%0" : : "r" (p), "r" (pte) : "memory");
+#endif
+    __asm__ volatile("ptesync" : : : "memory");
+}
+
+#define CACHE_LINE_SIZE    64
+
+void zero_memory(void *ptr, unsigned long nbytes)
+{
+    unsigned long nb, i, nl;
+    void *p;
+
+    for (; nbytes != 0; nbytes -= nb, ptr += nb) {
+        nb = -((unsigned long)ptr) & (CACHE_LINE_SIZE - 1);
+        if (nb == 0 && nbytes >= CACHE_LINE_SIZE) {
+            nl = nbytes / CACHE_LINE_SIZE;
+            p = ptr;
+            for (i = 0; i < nl; ++i) {
+                __asm__ volatile("dcbz 0,%0" : : "r" (p) : "memory");
+                p += CACHE_LINE_SIZE;
+            }
+            nb = nl * CACHE_LINE_SIZE;
+        } else {
+            if (nb > nbytes) {
+                nb = nbytes;
+            }
+            for (i = 0; i < nb; ++i) {
+                ((unsigned char *)ptr)[i] = 0;
+            }
+        }
+    }
+}
+
+#define PAGE_SHIFT      12
+#define PAGE_SIZE       (1ul << PAGE_SHIFT)
+
+/* Partition Page Dir params */
+#define PPD_L1_BITS     5
+#define PPD_L2_BITS     14    /* virtual level 2 PGD address bits */
+#define PPD_PA_INC      (1ul << (PAGE_SHIFT + PPD_L2_BITS))
+
+#define RPTE_V          PPC_BIT(0)
+#define RPTE_L          PPC_BIT(1)
+#define RPTE_RPN_MASK   0x01fffffffffff000ul
+#define RPTE_R          PPC_BIT(55)
+#define RPTE_C          PPC_BIT(56)
+#define RPTE_PRIV       PPC_BIT(60)
+#define RPTE_RD         PPC_BIT(61)
+#define RPTE_RW         PPC_BIT(62)
+#define RPTE_EX         PPC_BIT(63)
+#define RPTE_PERM_ALL   (RPTE_RD | RPTE_RW | RPTE_EX)
+
+#define PERM_EX         RPTE_EX
+#define PERM_WR         RPTE_RW
+#define PERM_RD         RPTE_RD
+#define PERM_PRIV       RPTE_PRIV
+#define ATTR_NC         0x020
+#define CHG             RPTE_C
+#define REF             RPTE_R
+
+#define DFLT_PERM       (PERM_WR | PERM_RD | REF | CHG)
+
+/*
+ * Set up an MMU translation tree using memory starting at the 64k point.
+ * We use 2 levels, mapping 2GB (the minimum size possible), with a
+ * 8kB PGD level pointing to 4kB PTE pages.
+ */
+unsigned long *pgdir = (unsigned long *) 0x10000;
+unsigned long *proc_tbl = (unsigned long *) 0x12000;
+unsigned long *part_tbl = (unsigned long *) 0x13000;
+unsigned long *part_pgdir = (unsigned long *) 0x14000;
+unsigned long free_ptr = 0x15000;
+void *eas_mapped[4];
+int neas_mapped;
+
+void init_mmu(void)
+{
+    int i, n;
+    unsigned long pa, pte;
+
+    /* Select Radix MMU (HR), with HW process table */
+    mtspr(LPCR, mfspr(LPCR) | LPCR_UPRT | LPCR_HR);
+
+    /*
+     * Set up partition page dir, needed to translate process table
+     * addresses.
+     * We use only 1 level, mapping 2GB 1-1, with 32 64M pages.
+     */
+    zero_memory(part_tbl, PAGE_SIZE);
+    store_pte(&part_tbl[0], PATE_HR | (unsigned long) part_pgdir |
+            PPD_L1_BITS);
+
+    for (i = 0, n = 1 << PPD_L1_BITS, pa = 0;
+            i < n; i++, pa += PPD_PA_INC) {
+        pte = RPTE_V | RPTE_L | (pa & RPTE_RPN_MASK) | RPTE_PERM_ALL;
+        store_pte(&part_pgdir[i], pte);
+    }
+
+    /* set up partition table */
+    store_pte(&part_tbl[1], (unsigned long)proc_tbl);
+    /* set up process table */
+    zero_memory(proc_tbl, 512 * sizeof(unsigned long));
+    mtspr(PTCR, (unsigned long)part_tbl);
+    mtspr(PID, 1);
+    zero_memory(pgdir, 1024 * sizeof(unsigned long));
+    /* RTS = 0 (2GB address space), RPDS = 10 (1024-entry top level) */
+    store_pte(&proc_tbl[2 * 1], (unsigned long) pgdir | 10);
+    tlbie_all(0);   /* invalidate all TLB entries */
+}
+
+static unsigned long *read_pgd(unsigned long i)
+{
+    unsigned long ret;
+
+#ifdef __LITTLE_ENDIAN__
+    __asm__ volatile("ldbrx %0,%1,%2" : "=r" (ret) : "b" (pgdir),
+                     "r" (i * sizeof(unsigned long)));
+#else
+    __asm__ volatile("ldx   %0,%1,%2" : "=r" (ret) : "b" (pgdir),
+                     "r" (i * sizeof(unsigned long)));
+#endif
+    return (unsigned long *) (ret & 0x00ffffffffffff00);
+}
+
+void map(void *ea, void *pa, unsigned long perm_attr)
+{
+    unsigned long epn = (unsigned long) ea >> 12;
+    unsigned long i, j;
+    unsigned long *ptep;
+
+    i = (epn >> 9) & 0x3ff;
+    j = epn & 0x1ff;
+    if (pgdir[i] == 0) {
+        zero_memory((void *)free_ptr, 512 * sizeof(unsigned long));
+        store_pte(&pgdir[i], 0x8000000000000000 | free_ptr | 9);
+        free_ptr += 512 * sizeof(unsigned long);
+    }
+    ptep = read_pgd(i);
+    store_pte(&ptep[j], 0xc000000000000000 | ((unsigned long)pa &
+                                              0x00fffffffffff000) | perm_attr);
+    eas_mapped[neas_mapped++] = ea;
+}
+
+void unmap(void *ea)
+{
+    unsigned long epn = (unsigned long) ea >> 12;
+    unsigned long i, j;
+    unsigned long *ptep;
+
+    i = (epn >> 9) & 0x3ff;
+    j = epn & 0x1ff;
+    if (pgdir[i] == 0) {
+        return;
+    }
+    ptep = read_pgd(i);
+    store_pte(&ptep[j], 0);
+    tlbie_va((unsigned long)ea, PRS);
+}
+
+void unmap_all(void)
+{
+    int i;
+
+    for (i = 0; i < neas_mapped; ++i) {
+        unmap(eas_mapped[i]);
+    }
+    neas_mapped = 0;
+}
+
+int mmu_test_1(void)
+{
+    long *ptr = (long *) 0x123000;
+    long val;
+
+    /* this should fail */
+    if (test_read(ptr, &val, 0xdeadbeefd00d)) {
+        return 1;
+    }
+    /* dest reg of load should be unchanged */
+    if (val != 0xdeadbeefd00d) {
+        return 2;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long) ptr || mfspr(DSISR) != 0x40000000) {
+        return 3;
+    }
+    return 0;
+}
+
+int mmu_test_2(void)
+{
+    long *mem = (long *) 0x8000;
+    long *ptr = (long *) 0x124000;
+    long *ptr2 = (long *) 0x1124000;
+    long val;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* initialize the memory content */
+    mem[33] = 0xbadc0ffee;
+    /* this should succeed and be a cache miss */
+    if (!test_read(&ptr[33], &val, 0xdeadbeefd00d)) {
+        return 1;
+    }
+    /* dest reg of load should have the value written */
+    if (val != 0xbadc0ffee) {
+        return 2;
+    }
+    /* load a second TLB entry in the same set as the first */
+    map(ptr2, mem, DFLT_PERM);
+    /* this should succeed and be a cache hit */
+    if (!test_read(&ptr2[33], &val, 0xdeadbeefd00d)) {
+        return 3;
+    }
+    /* dest reg of load should have the value written */
+    if (val != 0xbadc0ffee) {
+        return 4;
+    }
+    /* check that the first entry still works */
+    if (!test_read(&ptr[33], &val, 0xdeadbeefd00d)) {
+        return 5;
+    }
+    if (val != 0xbadc0ffee) {
+        return 6;
+    }
+    return 0;
+}
+
+int mmu_test_3(void)
+{
+    long *mem = (long *) 0x9000;
+    long *ptr = (long *) 0x14a000;
+    long val;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* initialize the memory content */
+    mem[45] = 0xfee1800d4ea;
+    /* this should succeed and be a cache miss */
+    if (!test_read(&ptr[45], &val, 0xdeadbeefd0d0)) {
+        return 1;
+    }
+    /* dest reg of load should have the value written */
+    if (val != 0xfee1800d4ea) {
+        return 2;
+    }
+    /* remove the PTE */
+    unmap(ptr);
+    /* this should fail */
+    if (test_read(&ptr[45], &val, 0xdeadbeefd0d0)) {
+        return 3;
+    }
+    /* dest reg of load should be unchanged */
+    if (val != 0xdeadbeefd0d0) {
+        return 4;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long) &ptr[45] || mfspr(DSISR) != 0x40000000) {
+        return 5;
+    }
+    return 0;
+}
+
+int mmu_test_4(void)
+{
+    long *mem = (long *) 0xa000;
+    long *ptr = (long *) 0x10b000;
+    long *ptr2 = (long *) 0x110b000;
+    long val;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* initialize the memory content */
+    mem[27] = 0xf00f00f00f00;
+    /* this should succeed and be a cache miss */
+    if (!test_write(&ptr[27], 0xe44badc0ffee)) {
+        return 1;
+    }
+    /* memory should now have the value written */
+    if (mem[27] != 0xe44badc0ffee) {
+        return 2;
+    }
+    /* load a second TLB entry in the same set as the first */
+    map(ptr2, mem, DFLT_PERM);
+    /* this should succeed and be a cache hit */
+    if (!test_write(&ptr2[27], 0x6e11ae)) {
+        return 3;
+    }
+    /* memory should have the value written */
+    if (mem[27] != 0x6e11ae) {
+        return 4;
+    }
+    /* check that the first entry still exists */
+    /* (assumes TLB is 2-way associative or more) */
+    if (!test_read(&ptr[27], &val, 0xdeadbeefd00d)) {
+        return 5;
+    }
+    if (val != 0x6e11ae) {
+        return 6;
+    }
+    return 0;
+}
+
+int mmu_test_5(void)
+{
+    long *mem = (long *) 0xbffd;
+    long *ptr = (long *) 0x39fffd;
+    long val;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* this should fail */
+    if (test_read(ptr, &val, 0xdeadbeef0dd0)) {
+        return 1;
+    }
+    /* dest reg of load should be unchanged */
+    if (val != 0xdeadbeef0dd0) {
+        return 2;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != ((long)ptr & ~0xfff) + 0x1000 ||
+            mfspr(DSISR) != 0x40000000) {
+        return 3;
+    }
+    return 0;
+}
+
+int mmu_test_6(void)
+{
+    long *mem = (long *) 0xbffd;
+    long *ptr = (long *) 0x39fffd;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* initialize memory */
+    *mem = 0x123456789abcdef0;
+    /* this should fail */
+    if (test_write(ptr, 0xdeadbeef0dd0)) {
+        return 1;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != ((long)ptr & ~0xfff) + 0x1000 ||
+            mfspr(DSISR) != 0x42000000) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_7(void)
+{
+    long *mem = (long *) 0x8000;
+    long *ptr = (long *) 0x124000;
+    long val;
+
+    *mem = 0x123456789abcdef0;
+    /* create PTE without read or write permission */
+    map(ptr, mem, REF);
+    /* this should fail */
+    if (test_read(ptr, &val, 0xdeadd00dbeef)) {
+        return 1;
+    }
+    /* dest reg of load should be unchanged */
+    if (val != 0xdeadd00dbeef) {
+        return 2;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long) ptr || mfspr(DSISR) != 0x08000000) {
+        return 3;
+    }
+    /* this should fail */
+    if (test_write(ptr, 0xdeadbeef0dd1)) {
+        return 4;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long)ptr || mfspr(DSISR) != 0x0a000000) {
+        return 5;
+    }
+    /* memory should be unchanged */
+    if (*mem != 0x123456789abcdef0) {
+        return 6;
+    }
+    return 0;
+}
+
+int mmu_test_8(void)
+{
+    long *mem = (long *) 0x8000;
+    long *ptr = (long *) 0x124000;
+    long val;
+
+    *mem = 0x123456789abcdef0;
+    /* create PTE with read but not write permission */
+    map(ptr, mem, REF | PERM_RD);
+    /* this should succeed */
+    if (!test_read(ptr, &val, 0xdeadd00dbeef)) {
+        return 1;
+    }
+    /* this should fail */
+    if (test_write(ptr, 0xdeadbeef0dd1)) {
+        return 2;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long)ptr || mfspr(DSISR) != 0x0a000000) {
+        return 3;
+    }
+    /* memory should be unchanged */
+    if (*mem != 0x123456789abcdef0) {
+        return 4;
+    }
+    return 0;
+}
+
+int mmu_test_9(void)
+{
+    unsigned long ptr = 0x523000;
+
+    /* this should fail */
+    if (test_exec(0, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    if (mfspr(SRR0) != (long) ptr ||
+            mfspr(SRR1) != (MSR_DFLT | 0x40000000 | MSR_IR)) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_10(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long ptr = 0x324000;
+    unsigned long ptr2 = 0x1324000;
+
+    /* create PTE */
+    map((void *)ptr, (void *)mem, PERM_EX | REF);
+    /* this should succeed and be a cache miss */
+    if (!test_exec(0, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* create a second PTE */
+    map((void *)ptr2, (void *)mem, PERM_EX | REF);
+    /* this should succeed and be a cache hit */
+    if (!test_exec(0, ptr2, MSR_DFLT | MSR_IR)) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_11(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long ptr = 0x349000;
+    unsigned long ptr2 = 0x34a000;
+
+    /* create a PTE */
+    map((void *)ptr, (void *)mem, PERM_EX | REF);
+    /* this should succeed */
+    if (!test_exec(1, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* invalidate the PTE */
+    unmap((void *)ptr);
+    /* install a second PTE */
+    map((void *)ptr2, (void *)mem, PERM_EX | REF);
+    /* this should fail */
+    if (test_exec(1, ptr, MSR_DFLT | MSR_IR)) {
+        return 2;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    if (mfspr(SRR0) != (long) ptr ||
+            mfspr(SRR1) != (MSR_DFLT | 0x40000000 | MSR_IR)) {
+        return 3;
+    }
+    return 0;
+}
+
+int mmu_test_12(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long mem2 = 0x2000;
+    unsigned long ptr = 0x30a000;
+    unsigned long ptr2 = 0x30b000;
+
+    /* create a PTE */
+    map((void *)ptr, (void *)mem, PERM_EX | REF);
+    /* this should fail due to second page not being mapped */
+    if (test_exec(2, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    if (mfspr(SRR0) != ptr2 ||
+            mfspr(SRR1) != (MSR_DFLT | 0x40000000 | MSR_IR)) {
+        return 2;
+    }
+    /* create a PTE for the second page */
+    map((void *)ptr2, (void *)mem2, PERM_EX | REF);
+    /* this should succeed */
+    if (!test_exec(2, ptr, MSR_DFLT | MSR_IR)) {
+        return 3;
+    }
+    return 0;
+}
+
+int mmu_test_13(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long ptr = 0x324000;
+
+    /* create a PTE without execute permission */
+    map((void *)ptr, (void *)mem, DFLT_PERM);
+    /* this should fail */
+    if (test_exec(0, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    if (mfspr(SRR0) != ptr ||
+            mfspr(SRR1) != (MSR_DFLT | 0x10000000 | MSR_IR)) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_14(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long mem2 = 0x2000;
+    unsigned long ptr = 0x30a000;
+    unsigned long ptr2 = 0x30b000;
+
+    /* create a PTE */
+    map((void *)ptr, (void *)mem, PERM_EX | REF);
+    /* create a PTE for the second page without execute permission */
+    map((void *)ptr2, (void *)mem2, PERM_RD | REF);
+    /* this should fail due to second page being no-execute */
+    if (test_exec(2, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    if (mfspr(SRR0) != ptr2 ||
+            mfspr(SRR1) != (MSR_DFLT | 0x10000000 | MSR_IR)) {
+        return 2;
+    }
+    /* create a PTE for the second page with execute permission */
+    map((void *)ptr2, (void *)mem2, PERM_RD | PERM_EX | REF);
+    /* this should succeed */
+    if (!test_exec(2, ptr, MSR_DFLT | MSR_IR)) {
+        return 3;
+    }
+    return 0;
+}
+
+int mmu_test_15(void)
+{
+    unsigned long mem = 0x1000;
+    unsigned long ptr = 0x349000;
+
+    /* create a PTE without ref or execute permission */
+    map((void *)ptr, (void *)mem, 0);
+    /* this should fail */
+    if (test_exec(2, ptr, MSR_DFLT | MSR_IR)) {
+        return 1;
+    }
+    /* SRR0 and SRR1 should be set correctly */
+    /* RC update fail bit should not be set */
+    if (mfspr(SRR0) != (long) ptr ||
+            mfspr(SRR1) != (MSR_DFLT | 0x10000000 | MSR_IR)) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_16(void)
+{
+    long *mem = (long *) 0x8000;
+    long *ptr = (long *) 0x124000;
+    long *ptr2 = (long *) 0x1124000;
+
+    /* create PTE */
+    map(ptr, mem, DFLT_PERM);
+    /* this should succeed and be a cache miss */
+    if (!test_dcbz(&ptr[129])) {
+        return 1;
+    }
+    /* create a second PTE */
+    map(ptr2, mem, DFLT_PERM);
+    /* this should succeed and be a cache hit */
+    if (!test_dcbz(&ptr2[130])) {
+        return 2;
+    }
+    return 0;
+}
+
+int mmu_test_17(void)
+{
+    long *mem = (long *) 0x8000;
+    long *ptr = (long *) 0x124000;
+
+    *mem = 0x123456789abcdef0;
+    /* create PTE with read but not write permission */
+    map(ptr, mem, REF | PERM_RD);
+    /* this should fail and create a TLB entry */
+    if (test_write(ptr, 0xdeadbeef0dd1)) {
+        return 1;
+    }
+    /* DAR and DSISR should be set correctly */
+    if (mfspr(DAR) != (long)ptr || mfspr(DSISR) != 0x0a000000) {
+        return 2;
+    }
+    /* Update the PTE to have write permission */
+    map(ptr, mem, REF | CHG | PERM_RD | PERM_WR);
+    /* this should succeed */
+    if (!test_write(ptr, 0xdeadbeef0dd1)) {
+        return 3;
+    }
+    return 0;
+}
+
+int fail;
+
+void do_test(int num, int (*test)(void))
+{
+    int ret;
+
+    mtspr(DSISR, 0);
+    mtspr(DAR, 0);
+    unmap_all();
+    ml_printf("test %d:", num);
+    ret = test();
+    if (ret == 0) {
+        ml_printf("PASS\r\n");
+    } else {
+        fail = 1;
+        ml_printf("FAIL %d", ret);
+        if (num <= 10 || num == 19) {
+            ml_printf(" DAR=%lx DSISR=%lx", mfspr(DAR), mfspr(DSISR));
+        } else {
+            ml_printf(" SRR0=%lx SRR1=%lx", mfspr(SRR0), mfspr(SRR1));
+        }
+        ml_printf("\r\n");
+    }
+}
+
+int main(void)
+{
+    init_mmu();
+
+    do_test(1, mmu_test_1);
+    do_test(2, mmu_test_2);
+    do_test(3, mmu_test_3);
+    do_test(4, mmu_test_4);
+    do_test(5, mmu_test_5);
+    do_test(6, mmu_test_6);
+    do_test(7, mmu_test_7);
+    do_test(8, mmu_test_8);
+    do_test(9, mmu_test_9);
+    do_test(10, mmu_test_10);
+    do_test(11, mmu_test_11);
+    do_test(12, mmu_test_12);
+    do_test(13, mmu_test_13);
+    do_test(14, mmu_test_14);
+    do_test(15, mmu_test_15);
+    do_test(16, mmu_test_16);
+    do_test(17, mmu_test_17);
+
+    return fail;
+}
diff --git a/tests/tcg/ppc64/system/mmu.h b/tests/tcg/ppc64/system/mmu.h
new file mode 100644
index 0000000000..eb191e4bd0
--- /dev/null
+++ b/tests/tcg/ppc64/system/mmu.h
@@ -0,0 +1,9 @@
+#ifndef PPC64_MMU_H
+#define PPC64_MMU_H
+
+int test_read(long *addr, long *ret, long init);
+int test_write(long *addr, long val);
+int test_dcbz(long *addr);
+int test_exec(int testno, unsigned long pc, unsigned long msr);
+
+#endif
-- 
2.25.1


