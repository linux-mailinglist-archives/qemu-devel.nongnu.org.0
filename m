Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9C53F287
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:28:28 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM95-0005wX-Tt
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwM-0001io-3V
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwF-0003q3-2w
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o6so8258072plg.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gbg4s/8WEhqgN/pq8IlG3IDnmXuMOx1w5foYDJThBg0=;
 b=c+Yz3EeJhpCG0dBeczMjsP1xYbZK60K4Ckl+JY62axEI6EmLeBqmSIvEOIxcba5xa+
 8QHSL6kXdAWrgLqwkkkv5PGTT/JSGWZERQEKgkwnUh8eWREudGtB0TkNhEkneq5QCtt3
 JwEzxwd3uhdR9c9bgQXSIhXGupXZzUcRXRoAwYw1GUnDFE9QV5amddEheGYT3M85URDh
 5LtuBW3F2jpRJieHFCfVT5ynzh/O9NRn5m4WD1k1EHjyikQL5S0U7Y/4r25X6mWkiYwy
 etPbA4Tws3KGQCCL/xbwDCj5gU+p+32FNl9KLgg85LoC6ikVOT5DZAcvGwoGjXi7Cr8Z
 fHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gbg4s/8WEhqgN/pq8IlG3IDnmXuMOx1w5foYDJThBg0=;
 b=gUDtxlZfHVErNqEDHtiqY+Zvkb23GdS+qDxlV0s1SWGKsZqR/tFRcUdwvRVnFBN5at
 4HRwTmz9asYyo3DPVJQc6rANdyUEEqITF0/r/LrVtrZxUOJ+fVYo7GFUCFMf5HCovdjb
 aPn6pr+47IOQOrfJOoHorZpJJEXKsZ6XdooeSVOe1N0pOJ/PsDAxvDDCO/fjZN5K6l/6
 U/N+7vLpBRjvQD1qM2PwOyC/b6bWLQRT8jCHfnm9Oslba3FEcbXAOSaXfFaOGtPDeA42
 2Vx20ugDbiszeJsmJ9WK2XHmHgbB2tO3zHe3f+rZGuwa/8VVu9cw/gGd/HXZ5mm+bVMG
 QSSg==
X-Gm-Message-State: AOAM532OM2XuSb1GY4I+RuUuXap2L9n06+Jk7Amekp8/pxSJQ6RGoL7r
 jivhkiiSrXImYQebLOtQ80RKrx/ROBZJqw==
X-Google-Smtp-Source: ABdhPJyzTubJJPUTvdWgo891X9/Di9ljd3EoT2pJ1YlHhRzXEj4/O18B88L4iRi6xYu+eRAwnbPl4w==
X-Received: by 2002:a17:902:6e01:b0:164:27c:1135 with SMTP id
 u1-20020a1709026e0100b00164027c1135mr26311855plk.8.1654557309724; 
 Mon, 06 Jun 2022 16:15:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 19/43] target/loongarch: Add CSRs definition
Date: Mon,  6 Jun 2022 16:14:26 -0700
Message-Id: <20220606231450.448443-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-20-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu-csr.h | 208 +++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h     |  64 ++++++++++++
 target/loongarch/cpu.c     |  41 ++++++++
 3 files changed, 313 insertions(+)
 create mode 100644 target/loongarch/cpu-csr.h

diff --git a/target/loongarch/cpu-csr.h b/target/loongarch/cpu-csr.h
new file mode 100644
index 0000000000..4c8ce7fed5
--- /dev/null
+++ b/target/loongarch/cpu-csr.h
@@ -0,0 +1,208 @@
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
+#include "hw/registerfields.h"
+
+/* Base on kernal definitions: arch/loongarch/include/asm/loongarch.h */
+
+/* Basic CSRs */
+#define LOONGARCH_CSR_CRMD           0x0 /* Current mode info */
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
+FIELD(CSR_MISC, VA32, 0, 4)
+FIELD(CSR_MISC, DRDTL, 4, 4)
+FIELD(CSR_MISC, RPCNTL, 8, 4)
+FIELD(CSR_MISC, ALCL, 12, 4)
+FIELD(CSR_MISC, DWPL, 16, 3)
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
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 3e8ba46377..3ec978f47c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -172,6 +172,15 @@ FIELD(CPUCFG20, L3IU_WAYS, 0, 16)
 FIELD(CPUCFG20, L3IU_SETS, 16, 8)
 FIELD(CPUCFG20, L3IU_SIZE, 24, 7)
 
+/*CSR_CRMD */
+FIELD(CSR_CRMD, PLV, 0, 2)
+FIELD(CSR_CRMD, IE, 2, 1)
+FIELD(CSR_CRMD, DA, 3, 1)
+FIELD(CSR_CRMD, PG, 4, 1)
+FIELD(CSR_CRMD, DATF, 5, 2)
+FIELD(CSR_CRMD, DATM, 7, 2)
+FIELD(CSR_CRMD, WE, 9, 1)
+
 extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
@@ -192,6 +201,61 @@ typedef struct CPUArchState {
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
 } CPULoongArchState;
 
 /**
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 95900be257..33d9a9450d 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -16,6 +16,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
+#include "cpu-csr.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -167,6 +168,8 @@ static void loongarch_la464_initfn(Object *obj)
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
     env->cpucfg[20] = data;
+
+    env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
 }
 
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
@@ -196,6 +199,44 @@ static void loongarch_cpu_reset(DeviceState *dev)
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
 
+    int n;
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
+    env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, TLB_TYPE, 2);
+    env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, MTLB_ENTRY, 63);
+    env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, STLB_WAYS, 7);
+    env->CSR_PRCFG3 = FIELD_DP64(env->CSR_PRCFG3, CSR_PRCFG3, STLB_SETS, 8);
+
+    for (n = 0; n < 4; n++) {
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV0, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV1, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV2, 0);
+        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
+    }
+
     restore_fp_status(env);
     cs->exception_index = -1;
 }
-- 
2.34.1


