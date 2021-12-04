Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AA54684E1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:48:04 +0100 (CET)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUSR-0007Wx-Bh
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:48:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTw9-0000B7-H4
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59554 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTw3-00007H-Ge
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:41 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S8;
 Sat, 04 Dec 2021 20:07:29 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 06/27] target/loongarch: Add MMU support for LoongArch
 CPU.
Date: Sat,  4 Dec 2021 20:07:04 +0800
Message-Id: <1638619645-11283-7-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S8
X-Coremail-Antispam: 1UD129KBjvAXoW3Kw1rJw4DtFWDGw1xGrW7Jwb_yoW8CFWfto
 W3AF45Ja1xGw4F9FnYkr90qay2qFWkCrW8C397Zr45Wa1IyryUKFyxKa4Yya43Gr1kXF4k
 Aay2gFnxJrZrZry3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces basic TLB interfaces.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-param.h  |   2 +-
 target/loongarch/cpu.c        |  32 ++++
 target/loongarch/cpu.h        |  45 ++++-
 target/loongarch/internals.h  |  10 +
 target/loongarch/machine.c    |  20 ++
 target/loongarch/meson.build  |   1 +
 target/loongarch/op_helper.c  |   8 +
 target/loongarch/tlb_helper.c | 334 ++++++++++++++++++++++++++++++++++
 8 files changed, 450 insertions(+), 2 deletions(-)
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
index f34e9763af..8c7ce993db 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -236,6 +236,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     LoongArchCPU *cpu = LOONGARCH_CPU(dev);
+    CPULoongArchState *env = &cpu->env;
 #endif
 
     cpu_exec_realizefn(cs, &local_err);
@@ -247,6 +248,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 #ifndef CONFIG_USER_ONLY
     timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
                   &loongarch_stable_timer_cb, cpu);
+    loongarch_mmu_init(env);
 #endif
 
     cpu_reset(cs);
@@ -294,6 +296,23 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
 
+#ifndef CONFIG_USER_ONLY
+    qemu_fprintf(f, "EUEN=%016" PRIx64 "\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT=%016" PRIx64 "\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA=%016" PRIx64 "\n", env->CSR_ERA);
+    qemu_fprintf(f, "CRMD=%016" PRIx64 "\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD=%016" PRIx64 "\n", env->CSR_PRMD);
+    qemu_fprintf(f, "BadVAddr=%016" PRIx64 "\n", env->CSR_BADV);
+    qemu_fprintf(f, "EENTRY=%016" PRIx64 "\n", env->CSR_EENTRY);
+    qemu_fprintf(f, "TLBRERA=%016" PRIx64 "\n", env->CSR_TLBRERA);
+    qemu_fprintf(f, "TLBRBADV=%016" PRIx64 "\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "TLBRENTRY=%016" PRIx64 "\n", env->CSR_TLBRENTRY);
+    qemu_fprintf(f, "BadInstr=%016" PRIx64 "\n", env->CSR_BADI);
+    qemu_fprintf(f, "PRCFG1=%016" PRIx64 ", PRCFG2=%016" PRIx64 ","
+                 " PRCFG3=%016" PRIx64 "\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+#endif
+
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
@@ -311,9 +330,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+
+#if !defined(CONFIG_USER_ONLY)
+    .tlb_fill = loongarch_cpu_tlb_fill,
+#endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps loongarch_sysemu_ops = {
+    .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
+};
+#endif
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -330,6 +361,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->set_pc = loongarch_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_loongarch_cpu;
+    cc->sysemu_ops = &loongarch_sysemu_ops;
 #endif
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index aeb8a5d397..6bbd1ab764 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -152,6 +152,27 @@ extern const char * const fregnames[];
 #define N_IRQS      14
 #define IRQ_TIMER   11
 
+#define LOONGARCH_TLB_MAX      (2048 + 64) /* 2048 STLB + 64 MTLB */
+
+/*
+ * define the ASID PS E VPPN field of TLB
+ *
+ * PS of stlb come from stlbps.ps
+ * PS of mtlb come from tlbidx.ps
+ */
+FIELD(TLB_MISC, E, 0, 1)
+FIELD(TLB_MISC, ASID, 1, 10)
+FIELD(TLB_MISC, VPPN, 13, 35)
+FIELD(TLB_MISC, PS, 48, 6)
+
+struct loongarch_tlb {
+    uint64_t tlb_misc;
+    /* Fields corresponding to CSR_TLBELO0/1 */
+    uint64_t tlb_entry0;
+    uint64_t tlb_entry1;
+};
+typedef struct loongarch_tlb loongarch_tlb;
+
 typedef struct CPULoongArchState CPULoongArchState;
 struct CPULoongArchState {
     uint64_t gpr[32];
@@ -231,6 +252,12 @@ struct CPULoongArchState {
     uint64_t CSR_DBG;
     uint64_t CSR_DERA;
     uint64_t CSR_DSAVE;
+
+#ifndef CONFIG_USER_ONLY
+    uint32_t      stlb_size; /* at most : 8 * 256 = 2048 */
+    uint32_t      mtlb_size; /* at most : 64 */
+    loongarch_tlb tlb[LOONGARCH_TLB_MAX];
+#endif
 };
 
 /**
@@ -270,11 +297,27 @@ struct LoongArchCPUClass {
     DeviceReset parent_reset;
 };
 
-#define MMU_USER_IDX 3
+/*
+ * LoongArch cpu has 4 priv level.
+ * 0 for kernel mode, 3 for user mode.
+ * Define a extra index for Direct mode.
+ */
+#define MMU_KERNEL_IDX 0 /* kernel mode idx */
+#define MMU_USER_IDX   3 /* user mode idx */
+#define MMU_DA_IDX     4 /* DA mode idx */
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
+#ifdef CONFIG_USER_ONLY
     return MMU_USER_IDX;
+#else
+    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
+
+    if (!pg) {
+        return MMU_DA_IDX;
+    }
+    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+#endif
 }
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index c8e6f7012c..a5b81bdca3 100644
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
@@ -27,6 +30,13 @@ void restore_fp_status(CPULoongArchState *env);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_loongarch_cpu;
+
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr);
+
+void loongarch_mmu_init(CPULoongArchState *env);
+hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 #endif
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index b9effe6db2..fbaa091603 100644
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
+        VMSTATE_UINT64(tlb_misc, loongarch_tlb),
+        VMSTATE_UINT64(tlb_entry0, loongarch_tlb),
+        VMSTATE_UINT64(tlb_entry1, loongarch_tlb),
+        VMSTATE_END_OF_LIST()
+    }
+};
 
 /* LoongArch CPU state */
 
@@ -22,6 +36,10 @@ const VMStateDescription vmstate_loongarch_cpu = {
         VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
         VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
 
+        /* TLB */
+        VMSTATE_UINT32(env.stlb_size, LoongArchCPU),
+        VMSTATE_UINT32(env.mtlb_size, LoongArchCPU),
+
         /* Remaining CSR registers */
         VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
@@ -78,6 +96,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
         VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
+        VMSTATE_STRUCT_ARRAY(env.tlb, LoongArchCPU, LOONGARCH_TLB_MAX,
+                             0, vmstate_tlb, loongarch_tlb),
 
         VMSTATE_END_OF_LIST()
     },
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index bda9f47ae4..935ffe2765 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
   'stabletimer.c',
+  'tlb_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 1083e39b7f..48c25e5a9b 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -47,16 +47,24 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
+#ifdef CONFIG_USER_ONLY
         cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
                               MMU_DATA_LOAD, true, GETPC());
+#else
+        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+#endif
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
+#ifdef CONFIG_USER_ONLY
         cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
                               MMU_DATA_LOAD, true, GETPC());
+#else
+        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+#endif
     }
 }
 
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
new file mode 100644
index 0000000000..e0b1390903
--- /dev/null
+++ b/target/loongarch/tlb_helper.c
@@ -0,0 +1,334 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch TLB helpers for qemu
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
+/* TLB address map */
+static int loongarch_map_tlb_entry(CPULoongArchState *env, hwaddr *physical,
+                                   int *prot, target_ulong address,
+                                   int access_type, int index, int mmu_idx)
+{
+    loongarch_tlb *tlb = &env->tlb[index];
+    uint64_t plv = mmu_idx;
+    uint64_t tlb_entry, tlb_ppn;
+    uint8_t tlb_ps, n, tlb_v, tlb_d, tlb_plv, tlb_nx, tlb_nr, tlb_rplv;
+
+    if (index > env->stlb_size) {
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
+     * tlb_entry contains ppn[47:12] while 16KB ppn is [47:15]
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
+ * One tlb entry holds a adjacent odd/even pair, the vpn is the
+ * content of the virtual page number divided by 2.So the
+ * compare vpn is bit[47:15] for 16KB page. while the vppn
+ * field in tlb entry contains bit[47:13], so need adjust.
+ * virt_vpn = vaddr[47:13]
+ */
+static bool loongarch_tlb_search(CPULoongArchState *env, target_ulong vaddr,
+                                 int *index)
+{
+    loongarch_tlb *tlb;
+    uint16_t csr_asid, tlb_asid, stlb_idx;
+    uint8_t tlb_e, tlb_ps, tlb_g, stlb_ps;
+    int i, stlb_size, mtlb_size, compare_shift;
+    uint64_t vpn, tlb_vppn;   /* Address to map */
+
+    stlb_size = env->stlb_size;
+    mtlb_size = env->mtlb_size;
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    vpn = (vaddr & TARGET_VIRT_MASK) >> (stlb_ps + 1);
+    stlb_idx = vpn & 0xff; /* VA[25:15] <==> TLBIDX.index for 16KB Page */
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
+    for (i = stlb_size; i < stlb_size + mtlb_size; ++i) {
+        tlb = &env->tlb[i];
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        if (tlb_e) {
+            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
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
+    /* Check PG and DA*/
+    if (da & !pg) {
+        /* DA mode */
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
+        env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
+    } else {
+        if (!FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
+            env->CSR_BADV = address;
+        }
+        env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
+   }
+
+}
+
+void loongarch_mmu_init(CPULoongArchState *env)
+{
+    /* Number of MTLB */
+    env->mtlb_size = 64;
+
+    /* Number of STLB */
+    env->stlb_size = 2048;
+
+    /* For 16KB, ps = 14, compare the bit [47:15] */
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc, TLB_MISC, E, 0);
+    }
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
+    /* XXX: put correct access by using cpu_restore_state() correctly */
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
+    } else {
+        raise_mmu_exception(env, address, access_type, ret);
+        do_raise_exception(env, cs->exception_index, retaddr);
+    }
+}
-- 
2.27.0


