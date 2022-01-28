Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FB49F203
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:51:45 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIIa-00058P-3z
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBa-0007Q4-2w
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40292 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBX-0002KE-FJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:29 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S4; 
 Fri, 28 Jan 2022 11:44:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 02/30] target/loongarch: Add CSRs definition
Date: Thu, 27 Jan 2022 22:43:44 -0500
Message-Id: <20220128034412.1262452-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S4
X-Coremail-Antispam: 1UD129KBjvAXoW3uFy3CFyDAF4rGw1fCr45Wrg_yoW8JrW8Zo
 W8Xa1fKw15Xw12ya1Dur97X3WDArW8CF1v9r1vvrW0v3W7Gr98G3WFyayUuw43XF1jgF18
 uF12kFn5Jay2yryUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-csr.h | 236 +++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.c     |  35 ++++++
 target/loongarch/cpu.h     |  57 +++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 target/loongarch/cpu-csr.h

diff --git a/target/loongarch/cpu-csr.h b/target/loongarch/cpu-csr.h
new file mode 100644
index 0000000000..8ad4c2ce70
--- /dev/null
+++ b/target/loongarch/cpu-csr.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CSRs
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_CSR_H
+#define LOONGARCH_CPU_CSR_H
+
+/* Base on kernal definitions: arch/loongarch/include/asm/loongarch.h */
+
+/* Basic CSRs */
+#define LOONGARCH_CSR_CRMD           0x0 /* Current mode info */
+FIELD(CSR_CRMD, PLV, 0, 2)
+FIELD(CSR_CRMD, IE, 2, 1)
+FIELD(CSR_CRMD, DA, 3, 1)
+FIELD(CSR_CRMD, PG, 4, 1)
+FIELD(CSR_CRMD, DATF, 5, 2)
+FIELD(CSR_CRMD, DATM, 7, 2)
+FIELD(CSR_CRMD, WE, 9, 1)
+
+#define LOONGARCH_CSR_PRMD           0x1 /* Prev-exception mode info */
+FIELD(CSR_PRMD, PPLV, 0, 2)
+FIELD(CSR_PRMD, PIE, 2, 1)
+FIELD(CSR_PRMD, PWE, 3, 1)
+
+#define LOONGARCH_CSR_EUEN           0x2 /* Extended unit enable */
+FIELD(CSR_EUEN, FPE, 0, 1)
+FIELD(CSR_EUEN, SXE, 1, 1)
+FIELD(CSR_EUEN, ASXE, 2, 1)
+FIELD(CSR_EUEN, BTE, 3, 1)
+
+#define LOONGARCH_CSR_MISC           0x3 /* Misc config */
+
+#define LOONGARCH_CSR_ECFG           0x4 /* Exception config */
+FIELD(CSR_ECFG, LIE, 0, 13)
+FIELD(CSR_ECFG, VS, 16, 3)
+
+#define LOONGARCH_CSR_ESTAT          0x5 /* Exception status */
+FIELD(CSR_ESTAT, IS, 0, 13)
+FIELD(CSR_ESTAT, ECODE, 16, 6)
+FIELD(CSR_ESTAT, ESUBCODE, 22, 9)
+
+#define  EXCCODE_EXTERNAL_INT   64   /* plus external interrupt number */
+#define  EXCCODE_INT                 0
+#define  EXCCODE_PIL                 1
+#define  EXCCODE_PIS                 2
+#define  EXCCODE_PIF                 3
+#define  EXCCODE_PME                 4
+#define  EXCCODE_PNR                 5
+#define  EXCCODE_PNX                 6
+#define  EXCCODE_PPI                 7
+#define  EXCCODE_ADEF                8 /* Different exception subcode */
+#define  EXCCODE_ADEM                8
+#define  EXCCODE_ALE                 9
+#define  EXCCODE_BCE                 10
+#define  EXCCODE_SYS                 11
+#define  EXCCODE_BRK                 12
+#define  EXCCODE_INE                 13
+#define  EXCCODE_IPE                 14
+#define  EXCCODE_FPD                 15
+#define  EXCCODE_SXD                 16
+#define  EXCCODE_ASXD                17
+#define  EXCCODE_FPE                 18 /* Different exception subcode */
+#define  EXCCODE_VFPE                18
+#define  EXCCODE_WPEF                19 /* Different exception subcode */
+#define  EXCCODE_WPEM                19
+#define  EXCCODE_BTD                 20
+#define  EXCCODE_BTE                 21
+#define  EXCCODE_DBP                 26 /* Reserved subcode used for debug */
+
+#define LOONGARCH_CSR_ERA            0x6 /* Exception return address */
+
+#define LOONGARCH_CSR_BADV           0x7 /* Bad virtual address */
+
+#define LOONGARCH_CSR_BADI           0x8 /* Bad instruction */
+
+#define LOONGARCH_CSR_EENTRY         0xc /* Exception entry address */
+
+/* TLB related CSRs */
+#define LOONGARCH_CSR_TLBIDX         0x10 /* TLB Index, EHINV, PageSize, NP */
+FIELD(CSR_TLBIDX, INDEX, 0, 12)
+FIELD(CSR_TLBIDX, PS, 24, 6)
+FIELD(CSR_TLBIDX, NE, 31, 1)
+
+#define LOONGARCH_CSR_TLBEHI         0x11 /* TLB EntryHi */
+FIELD(CSR_TLBEHI, VPPN, 13, 35)
+
+#define LOONGARCH_CSR_TLBELO0        0x12 /* TLB EntryLo0 */
+#define LOONGARCH_CSR_TLBELO1        0x13 /* TLB EntryLo1 */
+FIELD(TLBENTRY, V, 0, 1)
+FIELD(TLBENTRY, D, 1, 1)
+FIELD(TLBENTRY, PLV, 2, 2)
+FIELD(TLBENTRY, MAT, 4, 2)
+FIELD(TLBENTRY, G, 6, 1)
+FIELD(TLBENTRY, PPN, 12, 36)
+FIELD(TLBENTRY, NR, 61, 1)
+FIELD(TLBENTRY, NX, 62, 1)
+FIELD(TLBENTRY, RPLV, 63, 1)
+
+#define LOONGARCH_CSR_ASID           0x18 /* Address space identifier */
+FIELD(CSR_ASID, ASID, 0, 10)
+FIELD(CSR_ASID, ASIDBITS, 16, 8)
+
+/* Page table base address when badv[47] = 0 */
+#define LOONGARCH_CSR_PGDL           0x19
+/* Page table base address when badv[47] = 1 */
+#define LOONGARCH_CSR_PGDH           0x1a
+
+#define LOONGARCH_CSR_PGD            0x1b /* Page table base address */
+
+/* Page walk controller's low addr */
+#define LOONGARCH_CSR_PWCL           0x1c
+FIELD(CSR_PWCL, PTBASE, 0, 5)
+FIELD(CSR_PWCL, PTWIDTH, 5, 5)
+FIELD(CSR_PWCL, DIR1_BASE, 10, 5)
+FIELD(CSR_PWCL, DIR1_WIDTH, 15, 5)
+FIELD(CSR_PWCL, DIR2_BASE, 20, 5)
+FIELD(CSR_PWCL, DIR2_WIDTH, 25, 5)
+FIELD(CSR_PWCL, PTEWIDTH, 30, 2)
+
+/* Page walk controller's high addr */
+#define LOONGARCH_CSR_PWCH           0x1d
+FIELD(CSR_PWCH, DIR3_BASE, 0, 6)
+FIELD(CSR_PWCH, DIR3_WIDTH, 6, 6)
+FIELD(CSR_PWCH, DIR4_BASE, 12, 6)
+FIELD(CSR_PWCH, DIR4_WIDTH, 18, 6)
+
+#define LOONGARCH_CSR_STLBPS         0x1e /* Stlb page size */
+FIELD(CSR_STLBPS, PS, 0, 5)
+
+#define LOONGARCH_CSR_RVACFG         0x1f /* Reduced virtual address config */
+FIELD(CSR_RVACFG, RBITS, 0, 4)
+
+/* Config CSRs */
+#define LOONGARCH_CSR_CPUID          0x20 /* CPU core id */
+
+#define LOONGARCH_CSR_PRCFG1         0x21 /* Config1 */
+FIELD(CSR_PRCFG1, SAVE_NUM, 0, 4)
+FIELD(CSR_PRCFG1, TIMER_BITS, 4, 8)
+FIELD(CSR_PRCFG1, VSMAX, 12, 3)
+
+#define LOONGARCH_CSR_PRCFG2         0x22 /* Config2 */
+
+#define LOONGARCH_CSR_PRCFG3         0x23 /* Config3 */
+FIELD(CSR_PRCFG3, TLB_TYPE, 0, 4)
+FIELD(CSR_PRCFG3, MTLB_ENTRY, 4, 8)
+FIELD(CSR_PRCFG3, STLB_WAYS, 12, 8)
+FIELD(CSR_PRCFG3, STLB_SETS, 20, 8)
+
+/*
+ * Save registers count can read from PRCFG1.SAVE_NUM
+ * The Min count is 1. Max count is 15.
+ */
+#define LOONGARCH_CSR_SAVE(N)        (0x30 + N)
+
+/* Timer CSRs */
+#define LOONGARCH_CSR_TID            0x40 /* Timer ID */
+
+#define LOONGARCH_CSR_TCFG           0x41 /* Timer config */
+FIELD(CSR_TCFG, EN, 0, 1)
+FIELD(CSR_TCFG, PERIODIC, 1, 1)
+FIELD(CSR_TCFG, INIT_VAL, 2, 46)
+
+#define LOONGARCH_CSR_TVAL           0x42 /* Timer ticks remain */
+
+#define LOONGARCH_CSR_CNTC           0x43 /* Timer offset */
+
+#define LOONGARCH_CSR_TICLR          0x44 /* Timer interrupt clear */
+
+/* LLBCTL CSRs */
+#define LOONGARCH_CSR_LLBCTL         0x60 /* LLBit control */
+FIELD(CSR_LLBCTL, ROLLB, 0, 1)
+FIELD(CSR_LLBCTL, WCLLB, 1, 1)
+FIELD(CSR_LLBCTL, KLO, 2, 1)
+
+/* Implement dependent */
+#define LOONGARCH_CSR_IMPCTL1        0x80 /* LoongArch config1 */
+
+#define LOONGARCH_CSR_IMPCTL2        0x81 /* LoongArch config2*/
+
+/* TLB Refill CSRs */
+#define LOONGARCH_CSR_TLBRENTRY      0x88 /* TLB refill exception address */
+#define LOONGARCH_CSR_TLBRBADV       0x89 /* TLB refill badvaddr */
+#define LOONGARCH_CSR_TLBRERA        0x8a /* TLB refill ERA */
+#define LOONGARCH_CSR_TLBRSAVE       0x8b /* KScratch for TLB refill */
+FIELD(CSR_TLBRERA, ISTLBR, 0, 1)
+FIELD(CSR_TLBRERA, PC, 2, 62)
+#define LOONGARCH_CSR_TLBRELO0       0x8c /* TLB refill entrylo0 */
+#define LOONGARCH_CSR_TLBRELO1       0x8d /* TLB refill entrylo1 */
+#define LOONGARCH_CSR_TLBREHI        0x8e /* TLB refill entryhi */
+FIELD(CSR_TLBREHI, PS, 0, 6)
+FIELD(CSR_TLBREHI, VPPN, 13, 35)
+#define LOONGARCH_CSR_TLBRPRMD       0x8f /* TLB refill mode info */
+FIELD(CSR_TLBRPRMD, PPLV, 0, 2)
+FIELD(CSR_TLBRPRMD, PIE, 2, 1)
+FIELD(CSR_TLBRPRMD, PWE, 4, 1)
+
+/* Machine Error CSRs */
+#define LOONGARCH_CSR_MERRCTL        0x90 /* ERRCTL */
+FIELD(CSR_MERRCTL, ISMERR, 0, 1)
+#define LOONGARCH_CSR_MERRINFO1      0x91
+#define LOONGARCH_CSR_MERRINFO2      0x92
+#define LOONGARCH_CSR_MERRENTRY      0x93 /* MError exception base */
+#define LOONGARCH_CSR_MERRERA        0x94 /* MError exception PC */
+#define LOONGARCH_CSR_MERRSAVE       0x95 /* KScratch for error exception */
+
+#define LOONGARCH_CSR_CTAG           0x98 /* TagLo + TagHi */
+
+/* Direct map windows CSRs*/
+#define LOONGARCH_CSR_DMW(N)         (0x180 + N)
+FIELD(CSR_DMW, PLV0, 0, 1)
+FIELD(CSR_DMW, PLV1, 1, 1)
+FIELD(CSR_DMW, PLV2, 2, 1)
+FIELD(CSR_DMW, PLV3, 3, 1)
+FIELD(CSR_DMW, MAT, 4, 2)
+FIELD(CSR_DMW, VSEG, 60, 4)
+
+#define dmw_va2pa(va) \
+    (va & MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS))
+
+/* Debug CSRs */
+#define LOONGARCH_CSR_DBG            0x500 /* debug config */
+FIELD(CSR_DBG, DST, 0, 1)
+FIELD(CSR_DBG, DREV, 1, 7)
+FIELD(CSR_DBG, DEI, 8, 1)
+FIELD(CSR_DBG, DCL, 9, 1)
+FIELD(CSR_DBG, DFW, 10, 1)
+FIELD(CSR_DBG, DMW, 11, 1)
+FIELD(CSR_DBG, ECODE, 16, 6)
+
+#define LOONGARCH_CSR_DERA           0x501 /* Debug era */
+#define LOONGARCH_CSR_DSAVE          0x502 /* Debug save */
+
+#endif /* LOONGARCH_CPU_CSR_H */
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 5bb6453d33..0f6e2ef7e7 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -163,6 +163,8 @@ static void loongarch_3a5000_initfn(Object *obj)
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
     env->cpucfg[20] = data;
+
+    env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
 }
 
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
@@ -186,12 +188,45 @@ static void loongarch_cpu_reset(DeviceState *dev)
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
     CPULoongArchState *env = &cpu->env;
+    int n;
 
     lacc->parent_reset(dev);
 
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
 
+    /* Set csr registers value after reset */
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DA, 1);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PG, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DATF, 1);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DATM, 1);
+
+    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, FPE, 0);
+    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, SXE, 0);
+    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, ASXE, 0);
+    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, BTE, 0);
+
+    env->CSR_MISC = 0;
+
+    env->CSR_ECFG = FIELD_DP64(env->CSR_ECFG, CSR_ECFG, VS, 0);
+    env->CSR_ECFG = FIELD_DP64(env->CSR_ECFG, CSR_ECFG, LIE, 0);
+
+    env->CSR_ESTAT = env->CSR_ESTAT & (~MAKE_64BIT_MASK(0, 2));
+    env->CSR_RVACFG = FIELD_DP64(env->CSR_RVACFG, CSR_RVACFG, RBITS, 0);
+    env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
+    env->CSR_LLBCTL = FIELD_DP64(env->CSR_LLBCTL, CSR_LLBCTL, KLO, 0);
+    env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 0);
+    env->CSR_MERRCTL = FIELD_DP64(env->CSR_MERRCTL, CSR_MERRCTL, ISMERR, 0);
+
+    for (n = 0; n < 4; n++) {
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV0, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV1, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV2, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
+    }
+
     restore_fp_status(env);
     cs->exception_index = EXCP_NONE;
 }
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index ad5adb3b84..80b03f7bd7 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -11,6 +11,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
+#include "cpu-csr.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -165,6 +166,62 @@ struct CPULoongArchState {
     uint64_t llval;
 
     uint64_t badaddr;
+
+    /* LoongArch CSRs */
+    uint64_t CSR_CRMD;
+    uint64_t CSR_PRMD;
+    uint64_t CSR_EUEN;
+    uint64_t CSR_MISC;
+    uint64_t CSR_ECFG;
+    uint64_t CSR_ESTAT;
+    uint64_t CSR_ERA;
+    uint64_t CSR_BADV;
+    uint64_t CSR_BADI;
+    uint64_t CSR_EENTRY;
+    uint64_t CSR_TLBIDX;
+    uint64_t CSR_TLBEHI;
+    uint64_t CSR_TLBELO0;
+    uint64_t CSR_TLBELO1;
+    uint64_t CSR_ASID;
+    uint64_t CSR_PGDL;
+    uint64_t CSR_PGDH;
+    uint64_t CSR_PGD;
+    uint64_t CSR_PWCL;
+    uint64_t CSR_PWCH;
+    uint64_t CSR_STLBPS;
+    uint64_t CSR_RVACFG;
+    uint64_t CSR_CPUID;
+    uint64_t CSR_PRCFG1;
+    uint64_t CSR_PRCFG2;
+    uint64_t CSR_PRCFG3;
+    uint64_t CSR_SAVE[16];
+    uint64_t CSR_TID;
+    uint64_t CSR_TCFG;
+    uint64_t CSR_TVAL;
+    uint64_t CSR_CNTC;
+    uint64_t CSR_TICLR;
+    uint64_t CSR_LLBCTL;
+    uint64_t CSR_IMPCTL1;
+    uint64_t CSR_IMPCTL2;
+    uint64_t CSR_TLBRENTRY;
+    uint64_t CSR_TLBRBADV;
+    uint64_t CSR_TLBRERA;
+    uint64_t CSR_TLBRSAVE;
+    uint64_t CSR_TLBRELO0;
+    uint64_t CSR_TLBRELO1;
+    uint64_t CSR_TLBREHI;
+    uint64_t CSR_TLBRPRMD;
+    uint64_t CSR_MERRCTL;
+    uint64_t CSR_MERRINFO1;
+    uint64_t CSR_MERRINFO2;
+    uint64_t CSR_MERRENTRY;
+    uint64_t CSR_MERRERA;
+    uint64_t CSR_MERRSAVE;
+    uint64_t CSR_CTAG;
+    uint64_t CSR_DMW[4];
+    uint64_t CSR_DBG;
+    uint64_t CSR_DERA;
+    uint64_t CSR_DSAVE;
 };
 
 /**
-- 
2.27.0


