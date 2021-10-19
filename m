Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE576432FBB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:37:57 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjh4-000414-U7
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjew-0001GP-MD
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34670 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjes-0004Ni-DU
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S4; 
 Tue, 19 Oct 2021 15:35:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/31] target/loongarch: Add CSR registers definition
Date: Tue, 19 Oct 2021 15:34:48 +0800
Message-Id: <1634628917-10031-3-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S4
X-Coremail-Antispam: 1UD129KBjvAXoWfJFW5Kw4UCw1xZr4rXryfCrg_yoW8AFyrJo
 W8Wa13Gw45Jw4a9wsrGry7Xa1UAryxC3WkZ3WDWFy0v3Z7Ga98WFn0y3yUZa13XryYgryr
 uFnrKFn5CayDAryDn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch define All the CSR registers and its field.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-csr.h | 493 +++++++++++++++++++++++++++++++++++++
 1 file changed, 493 insertions(+)
 create mode 100644 target/loongarch/cpu-csr.h

diff --git a/target/loongarch/cpu-csr.h b/target/loongarch/cpu-csr.h
new file mode 100644
index 0000000000..26fef4079d
--- /dev/null
+++ b/target/loongarch/cpu-csr.h
@@ -0,0 +1,493 @@
+/*
+ * QEMU LoongArch CPU CSR registers
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_CPU_CSR_H
+#define LOONGARCH_CPU_CSR_H
+
+/* Base on: kernal: arch/loongarch/include/asm/loongarch.h */
+
+/* Basic CSR register */
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
+#define  EXCODE_IP                   64
+#define  EXCCODE_INT                 0
+#define  EXCCODE_PIL                 1
+#define  EXCCODE_PIS                 2
+#define  EXCCODE_PIF                 3
+#define  EXCCODE_PME                 4
+#define  EXCCODE_PNR                 5
+#define  EXCCODE_PNX                 6
+#define  EXCCODE_PPI                 7
+#define  EXCCODE_ADEF                8 /* Have different expsubcode */
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
+#define  EXCCODE_FPE                 18 /* Have different expsubcode */
+#define  EXCCODE_VFPE                18
+#define  EXCCODE_WPEF                19 /* Have different expsubcode */
+#define  EXCCODE_WPEM                19
+#define  EXCCODE_BTD                 20
+#define  EXCCODE_BTE                 21
+
+#define LOONGARCH_CSR_ERA            0x6 /* ERA */
+
+#define LOONGARCH_CSR_BADV           0x7 /* Bad virtual address */
+
+#define LOONGARCH_CSR_BADI           0x8 /* Bad instruction */
+
+#define LOONGARCH_CSR_EENTRY         0xc /* Exception enter base address */
+
+/* TLB related CSR register */
+#define LOONGARCH_CSR_TLBIDX         0x10 /* TLB Index, EHINV, PageSize, NP */
+FIELD(CSR_TLBIDX, INDEX, 0, 12)
+FIELD(CSR_TLBIDX, PS, 24, 6)
+FIELD(CSR_TLBIDX, NE, 31, 1)
+
+#define LOONGARCH_CSR_TLBEHI         0x11 /* TLB EntryHi without ASID */
+
+#define LOONGARCH_CSR_TLBELO0        0x12 /* TLB EntryLo0 */
+FIELD(CSR_TLBELO0, V, 0, 1)
+FIELD(CSR_TLBELO0, D, 1, 1)
+FIELD(CSR_TLBELO0, PLV, 2, 2)
+FIELD(CSR_TLBELO0, MAT, 4, 2)
+FIELD(CSR_TLBELO0, G, 6, 1)
+FIELD(CSR_TLBELO0, PPN, 12, 36)
+FIELD(CSR_TLBELO0, NR, 61, 1)
+FIELD(CSR_TLBELO0, NX, 62, 1)
+FIELD(CSR_TLBELO0, RPLV, 63, 1)
+
+#define LOONGARCH_CSR_TLBELO1        0x13 /* 64 TLB EntryLo1 */
+FIELD(CSR_TLBELO1, V, 0, 1)
+FIELD(CSR_TLBELO1, D, 1, 1)
+FIELD(CSR_TLBELO1, PLV, 2, 2)
+FIELD(CSR_TLBELO1, MAT, 4, 2)
+FIELD(CSR_TLBELO1, G, 6, 1)
+FIELD(CSR_TLBELO1, PPN, 12, 36)
+FIELD(CSR_TLBELO1, NR, 61, 1)
+FIELD(CSR_TLBELO1, NX, 62, 1)
+FIELD(CSR_TLBELO1, RPLV, 63, 1)
+
+#define LOONGARCH_CSR_ASID           0x18 /* ASID */
+FIELD(CSR_ASID, ASID, 0, 10)
+FIELD(CSR_ASID, ASIDBITS, 16, 8)
+
+/* Page table base address when badv[47] = 0 */
+#define LOONGARCH_CSR_PGDL           0x19
+/* Page table base address when badv[47] = 1 */
+#define LOONGARCH_CSR_PGDH           0x1a
+
+#define LOONGARCH_CSR_PGD            0x1b /* Page table base */
+
+#define LOONGARCH_CSR_PWCL           0x1c /* PWCl */
+FIELD(CSR_PWCL, PTBASE, 0, 5)
+FIELD(CSR_PWCL, PTWIDTH, 5, 5)
+FIELD(CSR_PWCL, DIR1_BASE, 10, 5)
+FIELD(CSR_PWCL, DIR1_WIDTH, 15, 5)
+FIELD(CSR_PWCL, DIR2_BASE, 20, 5)
+FIELD(CSR_PWCL, DIR2_WIDTH, 25, 5)
+FIELD(CSR_PWCL, PTEWIDTH, 30, 2)
+
+#define LOONGARCH_CSR_PWCH           0x1d /* PWCh */
+FIELD(CSR_PWCH, DIR3_BASE, 0, 6)
+FIELD(CSR_PWCH, DIR3_WIDTH, 6, 6)
+FIELD(CSR_PWCH, DIR4_BASE, 12, 6)
+FIELD(CSR_PWCH, DIR4_WIDTH, 18, 6)
+
+#define LOONGARCH_CSR_STLBPS     0x1e /* 64 */
+
+#define LOONGARCH_CSR_RVACFG         0x1f
+
+/* Config CSR registers */
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
+/* Kscratch registers */
+#define LOONGARCH_CSR_KS0            0x30
+#define LOONGARCH_CSR_KS1            0x31
+#define LOONGARCH_CSR_KS2            0x32
+#define LOONGARCH_CSR_KS3            0x33
+#define LOONGARCH_CSR_KS4            0x34
+#define LOONGARCH_CSR_KS5            0x35
+#define LOONGARCH_CSR_KS6            0x36
+#define LOONGARCH_CSR_KS7            0x37
+#define LOONGARCH_CSR_KS8            0x38
+
+/* Timer registers */
+#define LOONGARCH_CSR_TMID           0x40 /* Timer ID */
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
+#define LOONGARCH_CSR_TINTCLR        0x44 /* Timer interrupt clear */
+
+/* LLBCTL register */
+#define LOONGARCH_CSR_LLBCTL         0x60 /* LLBit control */
+
+/* Implement dependent */
+#define LOONGARCH_CSR_IMPCTL1        0x80 /* Loongarch config1 */
+
+#define LOONGARCH_CSR_IMPCTL2        0x81 /* Loongarch config2*/
+
+/* TLB Refill registers */
+#define LOONGARCH_CSR_TLBRENTRY      0x88 /* TLB refill exception address */
+#define LOONGARCH_CSR_TLBRBADV       0x89 /* TLB refill badvaddr */
+#define LOONGARCH_CSR_TLBRERA        0x8a /* TLB refill ERA */
+#define LOONGARCH_CSR_TLBRSAVE       0x8b /* KScratch for TLB refill */
+#define LOONGARCH_CSR_TLBRELO0       0x8c /* TLB refill entrylo0 */
+#define LOONGARCH_CSR_TLBRELO1       0x8d /* TLB refill entrylo1 */
+#define LOONGARCH_CSR_TLBREHI        0x8e /* TLB refill entryhi */
+#define LOONGARCH_CSR_TLBRPRMD       0x8f /* TLB refill mode info */
+FIELD(CSR_TLBRPRMD, PPLV, 0, 2)
+FIELD(CSR_TLBRPRMD, PIE, 2, 1)
+FIELD(CSR_TLBRPRMD, PWE, 4, 1)
+
+/* Machine Error registers */
+#define LOONGARCH_CSR_MERRCTL        0x90 /* ERRCTL */
+#define LOONGARCH_CSR_MERRINFO       0x91
+#define LOONGARCH_CSR_MERRINFO1      0x92
+#define LOONGARCH_CSR_MERRENT        0x93 /* MError exception base */
+#define LOONGARCH_CSR_MERRERA        0x94 /* MError exception PC */
+#define LOONGARCH_CSR_MERRSAVE       0x95 /* KScratch for error exception */
+
+#define LOONGARCH_CSR_CTAG           0x98 /* TagLo + TagHi */
+
+/* Direct map windows */
+#define LOONGARCH_CSR_DMWIN0         0x180 /* 64 direct map win0: MEM & IF */
+#define LOONGARCH_CSR_DMWIN1         0x181 /* 64 direct map win1: MEM & IF */
+#define LOONGARCH_CSR_DMWIN2         0x182 /* 64 direct map win2: MEM */
+#define LOONGARCH_CSR_DMWIN3         0x183 /* 64 direct map win3: MEM */
+#define  CSR_DMW_BASE_SH             48
+#define dmwin_va2pa(va) \
+    (va & (((unsigned long)1 << CSR_DMW_BASE_SH) - 1))
+
+/* Performance Counter registers */
+#define LOONGARCH_CSR_PERFCTRL0      0x200 /* 32 perf event 0 config */
+#define LOONGARCH_CSR_PERFCNTR0      0x201 /* 64 perf event 0 count value */
+#define LOONGARCH_CSR_PERFCTRL1      0x202 /* 32 perf event 1 config */
+#define LOONGARCH_CSR_PERFCNTR1      0x203 /* 64 perf event 1 count value */
+#define LOONGARCH_CSR_PERFCTRL2      0x204 /* 32 perf event 2 config */
+#define LOONGARCH_CSR_PERFCNTR2      0x205 /* 64 perf event 2 count value */
+#define LOONGARCH_CSR_PERFCTRL3      0x206 /* 32 perf event 3 config */
+#define LOONGARCH_CSR_PERFCNTR3      0x207 /* 64 perf event 3 count value */
+
+/* Debug registers */
+#define LOONGARCH_CSR_MWPC           0x300 /* data breakpoint config */
+#define LOONGARCH_CSR_MWPS           0x301 /* data breakpoint status */
+
+#define LOONGARCH_CSR_DB0ADDR        0x310 /* data breakpoint 0 address */
+#define LOONGARCH_CSR_DB0MASK        0x311 /* data breakpoint 0 mask */
+#define LOONGARCH_CSR_DB0CTL         0x312 /* data breakpoint 0 control */
+#define LOONGARCH_CSR_DB0ASID        0x313 /* data breakpoint 0 asid */
+
+#define LOONGARCH_CSR_DB1ADDR        0x318 /* data breakpoint 1 address */
+#define LOONGARCH_CSR_DB1MASK        0x319 /* data breakpoint 1 mask */
+#define LOONGARCH_CSR_DB1CTL         0x31a /* data breakpoint 1 control */
+#define LOONGARCH_CSR_DB1ASID        0x31b /* data breakpoint 1 asid */
+
+#define LOONGARCH_CSR_DB2ADDR        0x320 /* data breakpoint 2 address */
+#define LOONGARCH_CSR_DB2MASK        0x321 /* data breakpoint 2 mask */
+#define LOONGARCH_CSR_DB2CTL         0x322 /* data breakpoint 2 control */
+#define LOONGARCH_CSR_DB2ASID        0x323 /* data breakpoint 2 asid */
+
+#define LOONGARCH_CSR_DB3ADDR        0x328 /* data breakpoint 3 address */
+#define LOONGARCH_CSR_DB3MASK        0x329 /* data breakpoint 3 mask */
+#define LOONGARCH_CSR_DB3CTL         0x32a /* data breakpoint 3 control */
+#define LOONGARCH_CSR_DB3ASID        0x32b /* data breakpoint 3 asid */
+
+#define LOONGARCH_CSR_DB4ADDR        0x330 /* data breakpoint 4 address */
+#define LOONGARCH_CSR_DB4MASK        0x331 /* data breakpoint 4 maks */
+#define LOONGARCH_CSR_DB4CTL         0x332 /* data breakpoint 4 control */
+#define LOONGARCH_CSR_DB4ASID        0x333 /* data breakpoint 4 asid */
+
+#define LOONGARCH_CSR_DB5ADDR        0x338 /* data breakpoint 5 address */
+#define LOONGARCH_CSR_DB5MASK        0x339 /* data breakpoint 5 mask */
+#define LOONGARCH_CSR_DB5CTL         0x33a /* data breakpoint 5 control */
+#define LOONGARCH_CSR_DB5ASID        0x33b /* data breakpoint 5 asid */
+
+#define LOONGARCH_CSR_DB6ADDR        0x340 /* data breakpoint 6 address */
+#define LOONGARCH_CSR_DB6MASK        0x341 /* data breakpoint 6 mask */
+#define LOONGARCH_CSR_DB6CTL         0x342 /* data breakpoint 6 control */
+#define LOONGARCH_CSR_DB6ASID        0x343 /* data breakpoint 6 asid */
+
+#define LOONGARCH_CSR_DB7ADDR        0x348 /* data breakpoint 7 address */
+#define LOONGARCH_CSR_DB7MASK        0x349 /* data breakpoint 7 mask */
+#define LOONGARCH_CSR_DB7CTL         0x34a /* data breakpoint 7 control */
+#define LOONGARCH_CSR_DB7ASID        0x34b /* data breakpoint 7 asid */
+
+#define LOONGARCH_CSR_FWPC           0x380 /* instruction breakpoint config */
+#define LOONGARCH_CSR_FWPS           0x381 /* instruction breakpoint status */
+
+#define LOONGARCH_CSR_IB0ADDR        0x390 /* inst breakpoint 0 address */
+#define LOONGARCH_CSR_IB0MASK        0x391 /* inst breakpoint 0 mask */
+#define LOONGARCH_CSR_IB0CTL         0x392 /* inst breakpoint 0 control */
+#define LOONGARCH_CSR_IB0ASID        0x393 /* inst breakpoint 0 asid */
+
+#define LOONGARCH_CSR_IB1ADDR        0x398 /* inst breakpoint 1 address */
+#define LOONGARCH_CSR_IB1MASK        0x399 /* inst breakpoint 1 mask */
+#define LOONGARCH_CSR_IB1CTL         0x39a /* inst breakpoint 1 control */
+#define LOONGARCH_CSR_IB1ASID        0x39b /* inst breakpoint 1 asid */
+
+#define LOONGARCH_CSR_IB2ADDR        0x3a0 /* inst breakpoint 2 address */
+#define LOONGARCH_CSR_IB2MASK        0x3a1 /* inst breakpoint 2 mask */
+#define LOONGARCH_CSR_IB2CTL         0x3a2 /* inst breakpoint 2 control */
+#define LOONGARCH_CSR_IB2ASID        0x3a3 /* inst breakpoint 2 asid */
+
+#define LOONGARCH_CSR_IB3ADDR        0x3a8 /* inst breakpoint 3 address */
+#define LOONGARCH_CSR_IB3MASK        0x3a9 /* inst breakpoint 3 mask */
+#define LOONGARCH_CSR_IB3CTL         0x3aa /* inst breakpoint 3 control */
+#define LOONGARCH_CSR_IB3ASID        0x3ab /* inst breakpoint 3 asid */
+
+#define LOONGARCH_CSR_IB4ADDR        0x3b0 /* inst breakpoint 4 address */
+#define LOONGARCH_CSR_IB4MASK        0x3b1 /* inst breakpoint 4 mask */
+#define LOONGARCH_CSR_IB4CTL         0x3b2 /* inst breakpoint 4 control */
+#define LOONGARCH_CSR_IB4ASID        0x3b3 /* inst breakpoint 4 asid */
+
+#define LOONGARCH_CSR_IB5ADDR        0x3b8 /* inst breakpoint 5 address */
+#define LOONGARCH_CSR_IB5MASK        0x3b9 /* inst breakpoint 5 mask */
+#define LOONGARCH_CSR_IB5CTL         0x3ba /* inst breakpoint 5 control */
+#define LOONGARCH_CSR_IB5ASID        0x3bb /* inst breakpoint 5 asid */
+
+#define LOONGARCH_CSR_IB6ADDR        0x3c0 /* inst breakpoint 6 address */
+#define LOONGARCH_CSR_IB6MASK        0x3c1 /* inst breakpoint 6 mask */
+#define LOONGARCH_CSR_IB6CTL         0x3c2 /* inst breakpoint 6 control */
+#define LOONGARCH_CSR_IB6ASID        0x3c3 /* inst breakpoint 6 asid */
+
+#define LOONGARCH_CSR_IB7ADDR        0x3c8 /* inst breakpoint 7 address */
+#define LOONGARCH_CSR_IB7MASK        0x3c9 /* inst breakpoint 7 mask */
+#define LOONGARCH_CSR_IB7CTL         0x3ca /* inst breakpoint 7 control */
+#define LOONGARCH_CSR_IB7ASID        0x3cb /* inst breakpoint 7 asid */
+
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
+#define LOONGARCH_CSR_DESAVE         0x502 /* Debug save */
+
+#define LOONGARCH_PAGE_HUGE          0x40
+#define LOONGARCH_HUGE_GLOBAL        0x1000
+#define LOONGARCH_HUGE_GLOBAL_SH     12
+
+/*
+ * All Possible CSR registers used by tcg
+ *
+ * default value  in target/loongarch/cpu.c
+ *
+ * This macro will be used only in:
+ *  > target/loongarch/cpu.h:CPULoongArchState
+ *
+ * during translate:
+ *  > helper_csr_rdq()
+ *  > helper_csr_wrq()
+ *  > helper_csr_xchgq()
+ *  > helper_csr_xchgq_r0()
+ */
+#define CPU_LOONGARCH_CSR    \
+    uint64_t CSR_CRMD;       \
+    uint64_t CSR_PRMD;       \
+    uint64_t CSR_EUEN;       \
+    uint64_t CSR_MISC;       \
+    uint64_t CSR_ECFG;       \
+    uint64_t CSR_ESTAT;      \
+    uint64_t CSR_ERA;        \
+    uint64_t CSR_BADV;       \
+    uint64_t CSR_BADI;       \
+    uint64_t CSR_EENTRY;     \
+    uint64_t CSR_TLBIDX;     \
+    uint64_t CSR_TLBEHI;     \
+    uint64_t CSR_TLBELO0;    \
+    uint64_t CSR_TLBELO1;    \
+    uint64_t CSR_ASID;       \
+    uint64_t CSR_PGDL;       \
+    uint64_t CSR_PGDH;       \
+    uint64_t CSR_PGD;        \
+    uint64_t CSR_PWCL;       \
+    uint64_t CSR_PWCH;       \
+    uint64_t CSR_STLBPS;     \
+    uint64_t CSR_RVACFG;     \
+    uint64_t CSR_CPUID;      \
+    uint64_t CSR_PRCFG1;     \
+    uint64_t CSR_PRCFG2;     \
+    uint64_t CSR_PRCFG3;     \
+    uint64_t CSR_KS0;        \
+    uint64_t CSR_KS1;        \
+    uint64_t CSR_KS2;        \
+    uint64_t CSR_KS3;        \
+    uint64_t CSR_KS4;        \
+    uint64_t CSR_KS5;        \
+    uint64_t CSR_KS6;        \
+    uint64_t CSR_KS7;        \
+    uint64_t CSR_KS8;        \
+    uint64_t CSR_TMID;       \
+    uint64_t CSR_TCFG;       \
+    uint64_t CSR_TVAL;       \
+    uint64_t CSR_CNTC;       \
+    uint64_t CSR_TINTCLR;    \
+    uint64_t CSR_LLBCTL;     \
+    uint64_t CSR_IMPCTL1;    \
+    uint64_t CSR_IMPCTL2;    \
+    uint64_t CSR_TLBRENTRY;  \
+    uint64_t CSR_TLBRBADV;   \
+    uint64_t CSR_TLBRERA;    \
+    uint64_t CSR_TLBRSAVE;   \
+    uint64_t CSR_TLBRELO0;   \
+    uint64_t CSR_TLBRELO1;   \
+    uint64_t CSR_TLBREHI;    \
+    uint64_t CSR_TLBRPRMD;   \
+    uint64_t CSR_MERRCTL;    \
+    uint64_t CSR_MERRINFO;   \
+    uint64_t CSR_MERRINFO1;  \
+    uint64_t CSR_MERRENT;    \
+    uint64_t CSR_MERRERA;    \
+    uint64_t CSR_MERRSAVE;   \
+    uint64_t CSR_CTAG;       \
+    uint64_t CSR_MCSR0;      \
+    uint64_t CSR_MCSR1;      \
+    uint64_t CSR_MCSR2;      \
+    uint64_t CSR_MCSR3;      \
+    uint64_t CSR_MCSR8;      \
+    uint64_t CSR_MCSR9;      \
+    uint64_t CSR_MCSR10;     \
+    uint64_t CSR_MCSR24;     \
+    uint64_t CSR_UCAWIN;     \
+    uint64_t CSR_UCAWIN0_LO; \
+    uint64_t CSR_UCAWIN0_HI; \
+    uint64_t CSR_UCAWIN1_LO; \
+    uint64_t CSR_UCAWIN1_HI; \
+    uint64_t CSR_UCAWIN2_LO; \
+    uint64_t CSR_UCAWIN2_HI; \
+    uint64_t CSR_UCAWIN3_LO; \
+    uint64_t CSR_UCAWIN3_HI; \
+    uint64_t CSR_DMWIN0;     \
+    uint64_t CSR_DMWIN1;     \
+    uint64_t CSR_DMWIN2;     \
+    uint64_t CSR_DMWIN3;     \
+    uint64_t CSR_PERFCTRL0;  \
+    uint64_t CSR_PERFCNTR0;  \
+    uint64_t CSR_PERFCTRL1;  \
+    uint64_t CSR_PERFCNTR1;  \
+    uint64_t CSR_PERFCTRL2;  \
+    uint64_t CSR_PERFCNTR2;  \
+    uint64_t CSR_PERFCTRL3;  \
+    uint64_t CSR_PERFCNTR3;  \
+    uint64_t CSR_MWPC;       \
+    uint64_t CSR_MWPS;       \
+    uint64_t CSR_DB0ADDR;    \
+    uint64_t CSR_DB0MASK;    \
+    uint64_t CSR_DB0CTL;     \
+    uint64_t CSR_DB0ASID;    \
+    uint64_t CSR_DB1ADDR;    \
+    uint64_t CSR_DB1MASK;    \
+    uint64_t CSR_DB1CTL;     \
+    uint64_t CSR_DB1ASID;    \
+    uint64_t CSR_DB2ADDR;    \
+    uint64_t CSR_DB2MASK;    \
+    uint64_t CSR_DB2CTL;     \
+    uint64_t CSR_DB2ASID;    \
+    uint64_t CSR_DB3ADDR;    \
+    uint64_t CSR_DB3MASK;    \
+    uint64_t CSR_DB3CTL;     \
+    uint64_t CSR_DB3ASID;    \
+    uint64_t CSR_FWPC;       \
+    uint64_t CSR_FWPS;       \
+    uint64_t CSR_IB0ADDR;    \
+    uint64_t CSR_IB0MASK;    \
+    uint64_t CSR_IB0CTL;     \
+    uint64_t CSR_IB0ASID;    \
+    uint64_t CSR_IB1ADDR;    \
+    uint64_t CSR_IB1MASK;    \
+    uint64_t CSR_IB1CTL;     \
+    uint64_t CSR_IB1ASID;    \
+    uint64_t CSR_IB2ADDR;    \
+    uint64_t CSR_IB2MASK;    \
+    uint64_t CSR_IB2CTL;     \
+    uint64_t CSR_IB2ASID;    \
+    uint64_t CSR_IB3ADDR;    \
+    uint64_t CSR_IB3MASK;    \
+    uint64_t CSR_IB3CTL;     \
+    uint64_t CSR_IB3ASID;    \
+    uint64_t CSR_IB4ADDR;    \
+    uint64_t CSR_IB4MASK;    \
+    uint64_t CSR_IB4CTL;     \
+    uint64_t CSR_IB4ASID;    \
+    uint64_t CSR_IB5ADDR;    \
+    uint64_t CSR_IB5MASK;    \
+    uint64_t CSR_IB5CTL;     \
+    uint64_t CSR_IB5ASID;    \
+    uint64_t CSR_IB6ADDR;    \
+    uint64_t CSR_IB6MASK;    \
+    uint64_t CSR_IB6CTL;     \
+    uint64_t CSR_IB6ASID;    \
+    uint64_t CSR_IB7ADDR;    \
+    uint64_t CSR_IB7MASK;    \
+    uint64_t CSR_IB7CTL;     \
+    uint64_t CSR_IB7ASID;    \
+    uint64_t CSR_DBG;      \
+    uint64_t CSR_DERA;       \
+    uint64_t CSR_DESAVE;     \
+
+#endif /* LOONGARCH_CPU_CSR_H */
-- 
2.27.0


