Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EAB50DDA9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivhE-0004Yi-3l
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niuqV-0006cq-VS
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:17:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41724 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niuqP-0002AY-5n
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:17:27 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S24; 
 Mon, 25 Apr 2022 17:10:49 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/43] target/loongarch: Add MMU support for LoongArch CPU.
Date: Mon, 25 Apr 2022 17:10:06 +0800
Message-Id: <20220425091027.2877892-23-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S24
X-Coremail-Antispam: 1UD129KBjvAXoWfGr13KF1ftF1UtF45ZF18Xwb_yoW8WFW7Wo
 W3ZF45Ja1xGr4F9FnY9r90qFWIqFWDCF40k3s7Zrs0gayIyryUGFyfKa4Yy3W7Grn5XF4k
 AayIgF13XrZrXry3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu-param.h  |   2 +-
 target/loongarch/cpu.c        |  24 +++
 target/loongarch/cpu.h        |  51 ++++++
 target/loongarch/internals.h  |   9 +
 target/loongarch/machine.c    |  17 ++
 target/loongarch/meson.build  |   1 +
 target/loongarch/tlb_helper.c | 315 ++++++++++++++++++++++++++++++++++
 7 files changed, 418 insertions(+), 1 deletion(-)
 create mode 100644 target/loongarch/tlb_helper.c

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index 9a769b67e0..414d8fff46 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -13,6 +13,6 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 
 #define TARGET_PAGE_BITS 14
-#define NB_MMU_MODES 4
+#define NB_MMU_MODES 5
 
 #endif
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 176e277197..8a6bc24630 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -298,6 +298,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
 
+    qemu_fprintf(f, "CRMD=%016" PRIx64 "\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD=%016" PRIx64 "\n", env->CSR_PRMD);
+    qemu_fprintf(f, "EUEN=%016" PRIx64 "\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT=%016" PRIx64 "\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA=%016" PRIx64 "\n", env->CSR_ERA);
+    qemu_fprintf(f, "BADV=%016" PRIx64 "\n", env->CSR_BADV);
+    qemu_fprintf(f, "BADI=%016" PRIx64 "\n", env->CSR_BADI);
+    qemu_fprintf(f, "EENTRY=%016" PRIx64 "\n", env->CSR_EENTRY);
+    qemu_fprintf(f, "PRCFG1=%016" PRIx64 ", PRCFG2=%016" PRIx64 ","
+                 " PRCFG3=%016" PRIx64 "\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+    qemu_fprintf(f, "TLBRENTRY=%016" PRIx64 "\n", env->CSR_TLBRENTRY);
+    qemu_fprintf(f, "TLBRBADV=%016" PRIx64 "\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "TLBRERA=%016" PRIx64 "\n", env->CSR_TLBRERA);
+
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
@@ -315,9 +330,17 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+
+    .tlb_fill = loongarch_cpu_tlb_fill,
 };
 #endif /* CONFIG_TCG */
 
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps loongarch_sysemu_ops = {
+    .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
+};
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -332,6 +355,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
     dc->vmsd = &vmstate_loongarch_cpu;
+    cc->sysemu_ops = &loongarch_sysemu_ops;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 74303b2c97..a1b88f81eb 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -184,6 +184,26 @@ FIELD(CSR_CRMD, WE, 9, 1)
 extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
+#define LOONGARCH_STLB         2048 /* 2048 STLB */
+#define LOONGARCH_MTLB         64   /* 64 MTLB */
+#define LOONGARCH_TLB_MAX      (LOONGARCH_STLB + LOONGARCH_MTLB)
+
+/*
+ * define the ASID PS E VPPN field of TLB
+ */
+FIELD(TLB_MISC, E, 0, 1)
+FIELD(TLB_MISC, ASID, 1, 10)
+FIELD(TLB_MISC, VPPN, 13, 35)
+FIELD(TLB_MISC, PS, 48, 6)
+
+struct LoongArchTLB {
+    uint64_t tlb_misc;
+    /* Fields corresponding to CSR_TLBELO0/1 */
+    uint64_t tlb_entry0;
+    uint64_t tlb_entry1;
+};
+typedef struct LoongArchTLB LoongArchTLB;
+
 typedef struct CPUArchState {
     uint64_t gpr[32];
     uint64_t pc;
@@ -257,6 +277,8 @@ typedef struct CPUArchState {
     uint64_t CSR_DBG;
     uint64_t CSR_DERA;
     uint64_t CSR_DSAVE;
+
+    LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
 } CPULoongArchState;
 
 /**
@@ -295,6 +317,35 @@ struct LoongArchCPUClass {
     DeviceReset parent_reset;
 };
 
+/*
+ * LoongArch CPUs has 4 privilege levels.
+ * 0 for kernel mode, 3 for user mode.
+ * Define an extra index for DA(direct addressing) mode.
+ */
+#define MMU_KERNEL_IDX   0
+#define MMU_USER_IDX     3
+#define MMU_DA_IDX       4
+
+static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
+{
+    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
+
+    if (!pg) {
+        return MMU_DA_IDX;
+    }
+    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+}
+
+static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
+                                        target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = cpu_mmu_index(env, false);
+}
+
 void loongarch_cpu_list(void);
 
 #define cpu_list loongarch_cpu_list
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 39960dee27..2fed768653 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -13,6 +13,9 @@
 #define FCMP_UN   0b0100  /* unordered */
 #define FCMP_GT   0b1000  /* fp0 > fp1 */
 
+#define TARGET_PHYS_MASK MAKE_64BIT_MASK(0, TARGET_PHYS_ADDR_SPACE_BITS)
+#define TARGET_VIRT_MASK MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS)
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
@@ -27,4 +30,10 @@ void restore_fp_status(CPULoongArchState *env);
 
 extern const VMStateDescription vmstate_loongarch_cpu;
 
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr);
+
+hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
 #endif
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index 72c8602c9c..a6fecad964 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -8,6 +8,20 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "migration/cpu.h"
+#include "internals.h"
+
+/* TLB state */
+const VMStateDescription vmstate_tlb = {
+    .name = "cpu/tlb",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(tlb_misc, LoongArchTLB),
+        VMSTATE_UINT64(tlb_entry0, LoongArchTLB),
+        VMSTATE_UINT64(tlb_entry1, LoongArchTLB),
+        VMSTATE_END_OF_LIST()
+    }
+};
 
 /* LoongArch CPU state */
 
@@ -80,6 +94,9 @@ const VMStateDescription vmstate_loongarch_cpu = {
         VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
+        /* TLB */
+        VMSTATE_STRUCT_ARRAY(env.tlb, LoongArchCPU, LOONGARCH_TLB_MAX,
+                             0, vmstate_tlb, LoongArchTLB),
 
         VMSTATE_END_OF_LIST()
     },
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 103f36ee15..435cc75999 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -17,6 +17,7 @@ loongarch_tcg_ss.add(zlib)
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
+  'tlb_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
new file mode 100644
index 0000000000..fad8bc7746
--- /dev/null
+++ b/target/loongarch/tlb_helper.c
@@ -0,0 +1,315 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch TLB helpers
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/log.h"
+#include "cpu-csr.h"
+
+enum {
+    TLBRET_MATCH = 0,
+    TLBRET_BADADDR = 1,
+    TLBRET_NOMATCH = 2,
+    TLBRET_INVALID = 3,
+    TLBRET_DIRTY = 4,
+    TLBRET_RI = 5,
+    TLBRET_XI = 6,
+    TLBRET_PE = 7,
+};
+
+static int loongarch_map_tlb_entry(CPULoongArchState *env, hwaddr *physical,
+                                   int *prot, target_ulong address,
+                                   int access_type, int index, int mmu_idx)
+{
+    LoongArchTLB *tlb = &env->tlb[index];
+    uint64_t plv = mmu_idx;
+    uint64_t tlb_entry, tlb_ppn;
+    uint8_t tlb_ps, n, tlb_v, tlb_d, tlb_plv, tlb_nx, tlb_nr, tlb_rplv;
+
+    if (index >= LOONGARCH_STLB) {
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    } else {
+        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    }
+    n = (address >> tlb_ps) & 0x1;/* Odd or even */
+
+    tlb_entry = n ? tlb->tlb_entry1 : tlb->tlb_entry0;
+    tlb_v = FIELD_EX64(tlb_entry, TLBENTRY, V);
+    tlb_d = FIELD_EX64(tlb_entry, TLBENTRY, D);
+    tlb_plv = FIELD_EX64(tlb_entry, TLBENTRY, PLV);
+    tlb_ppn = FIELD_EX64(tlb_entry, TLBENTRY, PPN);
+    tlb_nx = FIELD_EX64(tlb_entry, TLBENTRY, NX);
+    tlb_nr = FIELD_EX64(tlb_entry, TLBENTRY, NR);
+    tlb_rplv = FIELD_EX64(tlb_entry, TLBENTRY, RPLV);
+
+    /* Check access rights */
+    if (!tlb_v) {
+        return TLBRET_INVALID;
+    }
+
+    if (access_type == MMU_INST_FETCH && tlb_nx) {
+        return TLBRET_XI;
+    }
+
+    if (access_type == MMU_DATA_LOAD && tlb_nr) {
+        return TLBRET_RI;
+    }
+
+    if (((tlb_rplv == 0) && (plv > tlb_plv)) ||
+        ((tlb_rplv == 1) && (plv != tlb_plv))) {
+        return TLBRET_PE;
+    }
+
+    if ((access_type == MMU_DATA_STORE) && !tlb_d) {
+        return TLBRET_DIRTY;
+    }
+
+    /*
+     * tlb_entry contains ppn[47:12] while 16KiB ppn is [47:15]
+     * need adjust.
+     */
+    *physical = (tlb_ppn << R_TLBENTRY_PPN_SHIFT) |
+                (address & MAKE_64BIT_MASK(0, tlb_ps));
+    *prot = PAGE_READ;
+    if (tlb_d) {
+        *prot |= PAGE_WRITE;
+    }
+    if (!tlb_nx) {
+        *prot |= PAGE_EXEC;
+    }
+    return TLBRET_MATCH;
+}
+
+/*
+ * One tlb entry holds an adjacent odd/even pair, the vpn is the
+ * content of the virtual page number divided by 2. So the
+ * compare vpn is bit[47:15] for 16KiB page. while the vppn
+ * field in tlb entry contains bit[47:13], so need adjust.
+ * virt_vpn = vaddr[47:13]
+ */
+static bool loongarch_tlb_search(CPULoongArchState *env, target_ulong vaddr,
+                                 int *index)
+{
+    LoongArchTLB *tlb;
+    uint16_t csr_asid, tlb_asid, stlb_idx;
+    uint8_t tlb_e, tlb_ps, tlb_g, stlb_ps;
+    int i, compare_shift;
+    uint64_t vpn, tlb_vppn;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    vpn = (vaddr & TARGET_VIRT_MASK) >> (stlb_ps + 1);
+    stlb_idx = vpn & 0xff; /* VA[25:15] <==> TLBIDX.index for 16KiB Page */
+    compare_shift = stlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
+    /* Search STLB */
+    for (i = 0; i < 8; ++i) {
+        tlb = &env->tlb[i * 256 + stlb_idx];
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        if (tlb_e) {
+            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+
+            if ((tlb_g == 1 || tlb_asid == csr_asid) &&
+                (vpn == (tlb_vppn >> compare_shift))) {
+                *index = i * 256 + stlb_idx;
+                return true;
+            }
+        }
+    }
+
+    /* Search MTLB */
+    for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; ++i) {
+        tlb = &env->tlb[i];
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        if (tlb_e) {
+            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+            vpn = (vaddr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+            if ((tlb_g == 1 || tlb_asid == csr_asid) &&
+                (vpn == (tlb_vppn >> compare_shift))) {
+                *index = i;
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
+static int loongarch_map_address(CPULoongArchState *env, hwaddr *physical,
+                                 int *prot, target_ulong address,
+                                 MMUAccessType access_type, int mmu_idx)
+{
+    int index, match;
+
+    match = loongarch_tlb_search(env, address, &index);
+    if (match) {
+        return loongarch_map_tlb_entry(env, physical, prot,
+                                       address, access_type, index, mmu_idx);
+    }
+
+    return TLBRET_NOMATCH;
+}
+
+static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
+                                int *prot, target_ulong address,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    int user_mode = mmu_idx == MMU_USER_IDX;
+    int kernel_mode = mmu_idx == MMU_KERNEL_IDX;
+    uint32_t plv, base_c, base_v;
+    int64_t addr_high;
+    uint8_t da = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, DA);
+    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
+
+    /* Check PG and DA */
+    if (da & !pg) {
+        *physical = address & TARGET_PHYS_MASK;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TLBRET_MATCH;
+    }
+
+    plv = kernel_mode | (user_mode << R_CSR_DMW_PLV3_SHIFT);
+    base_v = address >> TARGET_VIRT_ADDR_SPACE_BITS;
+    /* Check direct map window */
+    for (int i = 0; i < 4; i++) {
+        base_c = env->CSR_DMW[i] >> TARGET_VIRT_ADDR_SPACE_BITS;
+        if ((plv & env->CSR_DMW[i]) && (base_c == base_v)) {
+            *physical = dmw_va2pa(address);
+            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            return TLBRET_MATCH;
+        }
+    }
+
+    /* Check valid extension */
+    addr_high = sextract64(address, TARGET_VIRT_ADDR_SPACE_BITS, 16);
+    if (!(addr_high == 0 || addr_high == -1)) {
+        return TLBRET_BADADDR;
+    }
+
+    /* Mapped address */
+    return loongarch_map_address(env, physical, prot, address,
+                                 access_type, mmu_idx);
+}
+
+hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    hwaddr phys_addr;
+    int prot;
+
+    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
+                             cpu_mmu_index(env, false)) != 0) {
+        return -1;
+    }
+    return phys_addr;
+}
+
+static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
+                                MMUAccessType access_type, int tlb_error)
+{
+    CPUState *cs = env_cpu(env);
+
+    switch (tlb_error) {
+    default:
+    case TLBRET_BADADDR:
+        cs->exception_index = EXCCODE_ADEM;
+        break;
+    case TLBRET_NOMATCH:
+        /* No TLB match for a mapped address */
+        if (access_type == MMU_DATA_LOAD) {
+            cs->exception_index = EXCCODE_PIL;
+        } else if (access_type == MMU_DATA_STORE) {
+            cs->exception_index = EXCCODE_PIS;
+        } else if (access_type == MMU_INST_FETCH) {
+            cs->exception_index = EXCCODE_PIF;
+        }
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 1);
+        break;
+    case TLBRET_INVALID:
+        /* TLB match with no valid bit */
+        if (access_type == MMU_DATA_LOAD) {
+            cs->exception_index = EXCCODE_PIL;
+        } else if (access_type == MMU_DATA_STORE) {
+            cs->exception_index = EXCCODE_PIS;
+        } else if (access_type == MMU_INST_FETCH) {
+            cs->exception_index = EXCCODE_PIF;
+        }
+        break;
+    case TLBRET_DIRTY:
+        /* TLB match but 'D' bit is cleared */
+        cs->exception_index = EXCCODE_PME;
+        break;
+    case TLBRET_XI:
+        /* Execute-Inhibit Exception */
+        cs->exception_index = EXCCODE_PNX;
+        break;
+    case TLBRET_RI:
+        /* Read-Inhibit Exception */
+        cs->exception_index = EXCCODE_PNR;
+        break;
+    case TLBRET_PE:
+        /* Privileged Exception */
+        cs->exception_index = EXCCODE_PPI;
+        break;
+    }
+
+    if (tlb_error == TLBRET_NOMATCH) {
+        env->CSR_TLBRBADV = address;
+        env->CSR_TLBREHI = FIELD_DP64(env->CSR_TLBREHI, CSR_TLBREHI, VPPN,
+                                      extract64(address, 13, 35));
+    } else {
+        if (!FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
+            env->CSR_BADV = address;
+        }
+        env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
+   }
+}
+
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    hwaddr physical;
+    int prot;
+    int ret = TLBRET_BADADDR;
+
+    /* Data access */
+    ret = get_physical_address(env, &physical, &prot, address,
+                               access_type, mmu_idx);
+
+    if (ret == TLBRET_MATCH) {
+        tlb_set_page(cs, address & TARGET_PAGE_MASK,
+                     physical & TARGET_PAGE_MASK, prot,
+                     mmu_idx, TARGET_PAGE_SIZE);
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
+                      " prot %d\n", __func__, address, physical, prot);
+        return true;
+    } else {
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s address=%" VADDR_PRIx " ret %d\n", __func__, address,
+                      ret);
+    }
+    if (probe) {
+        return false;
+    }
+    raise_mmu_exception(env, address, access_type, ret);
+    cpu_loop_exit_restore(cs, retaddr);
+}
-- 
2.31.1


