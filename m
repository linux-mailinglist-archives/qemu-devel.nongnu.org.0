Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DE6F5194
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:31:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rj-0006Ab-9A; Wed, 03 May 2023 03:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qM-00033r-DZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qH-0001mO-3p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso283825e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098639; x=1685690639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fNUxUnN5YGr4FtjvH7qCv5bpk6d/9rEU/7kz3bjFmM=;
 b=fG8hmPiDbnh0NZqFe3iISkIZkhNvPtV2AteBqjblSQfKYBnGMUx+lP/8aZUkmQ0U6u
 BR+UgutI5AnauOJSrrjBRJsNpOk0owfwWrw7Aru08+T9DiZlIvWuz52svTnnzrltZa4J
 sVK0UxItXCtpqqcSev2e+945JbPxklmQqYfSXWVSqcLpa4aOixmxWxAWxQ15U0X9m77G
 bo643Yonp7pEHXeQMevSrF5MeLMCgCmrAm8P3I5KbyNLFLyUxBXTzANS0qrJM8SAKEmc
 fZWk1DiLqL6V4pi4R0vJSAZtc0jr0x6l/zgZzo1RFeXhlCZA9ryGlDcZyTrCW/M/OiRB
 RMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098639; x=1685690639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8fNUxUnN5YGr4FtjvH7qCv5bpk6d/9rEU/7kz3bjFmM=;
 b=a2cz44IWbv9FXNhRov/7uYmlgdCdr0S3VxW/7H2hSnJEIgG3T1uIVoJy/EnrRf4ssS
 wzXWAlILHx4jgkOpWPZ45DnTV1hc/5h7WKNpEuFfve1+8Zhj6VXz5baY9201eSn5kjpC
 KbsBZ/IHmQqI3nbkE1xJKszW/zGc75DZOVSWSAJS8Q8JXRUGqSEsyrY7oGS1/rrb5ps9
 bX7wFUS8c6ETMm957AIjC5L/HGXoR9j6GPWmtgiufmheKsKRNX9mOzHt9k3heWQTT4mu
 eFYdNRDycqprFK00rsFSlaNXKI+H7uWmTUlcsWnyfg+tNzsFjcXJoVyYGD5AcEB17Ddc
 SRtQ==
X-Gm-Message-State: AC+VfDz5NLfugj0TUHxzUg0OXtYBcdjt39kxXuVIourgM1qh/okSRmU0
 2vevwHrgTYtgajUNb+TF4IxOtJYlMISsAvvgcKPBmQ==
X-Google-Smtp-Source: ACHHUZ5HMUCgKq39t0N/9z3OZTZnWz7phZZqvaYTsGOsw7ZQgMjJKsUBO8S7bmUmqlGH0cQTpTbL+w==
X-Received: by 2002:a05:600c:257:b0:3f1:6ead:e389 with SMTP id
 23-20020a05600c025700b003f16eade389mr14410010wmj.30.1683098639113; 
 Wed, 03 May 2023 00:23:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 34/84] tcg: Add tlb_fast_offset to TCGContext
Date: Wed,  3 May 2023 08:22:41 +0100
Message-Id: <20230503072331.1747057-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Disconnect the layout of ArchCPU from TCG compilation.
Pass the relative offset of 'env' and 'neg.tlb.f' as a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h          | 39 +---------------------
 include/exec/tlb-common.h        | 56 ++++++++++++++++++++++++++++++++
 include/tcg/tcg.h                |  1 +
 accel/tcg/translate-all.c        |  2 ++
 tcg/tcg.c                        | 13 ++++++++
 tcg/aarch64/tcg-target.c.inc     |  7 ++--
 tcg/arm/tcg-target.c.inc         |  7 ++--
 tcg/i386/tcg-target.c.inc        |  9 ++---
 tcg/loongarch64/tcg-target.c.inc |  7 ++--
 tcg/mips/tcg-target.c.inc        |  7 ++--
 tcg/ppc/tcg-target.c.inc         |  7 ++--
 tcg/riscv/tcg-target.c.inc       |  7 ++--
 tcg/s390x/tcg-target.c.inc       |  7 ++--
 tcg/sparc64/tcg-target.c.inc     |  7 ++--
 14 files changed, 110 insertions(+), 66 deletions(-)
 create mode 100644 include/exec/tlb-common.h

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index b757d37966..0d418a0384 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -61,12 +61,11 @@
 #define NB_MMU_MODES 16
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#include "exec/tlb-common.h"
 
 /* use a fully associative victim tlb of 8 entries */
 #define CPU_VTLB_SIZE 8
 
-#define CPU_TLB_ENTRY_BITS 5
-
 #define CPU_TLB_DYN_MIN_BITS 6
 #define CPU_TLB_DYN_DEFAULT_BITS 8
 
@@ -90,27 +89,6 @@
 #  endif
 # endif
 
-/* Minimalized TLB entry for use by TCG fast path. */
-typedef union CPUTLBEntry {
-    struct {
-        uint64_t addr_read;
-        uint64_t addr_write;
-        uint64_t addr_code;
-        /*
-         * Addend to virtual address to get host address.  IO accesses
-         * use the corresponding iotlb value.
-         */
-        uintptr_t addend;
-    };
-    /*
-     * Padding to get a power of two size, as well as index
-     * access to addr_{read,write,code}.
-     */
-    uint64_t addr_idx[(1 << CPU_TLB_ENTRY_BITS) / sizeof(uint64_t)];
-} CPUTLBEntry;
-
-QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
-
 #endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
@@ -184,17 +162,6 @@ typedef struct CPUTLBDesc {
     CPUTLBEntryFull *fulltlb;
 } CPUTLBDesc;
 
-/*
- * Data elements that are per MMU mode, accessed by the fast path.
- * The structure is aligned to aid loading the pair with one insn.
- */
-typedef struct CPUTLBDescFast {
-    /* Contains (n_entries - 1) << CPU_TLB_ENTRY_BITS */
-    uintptr_t mask;
-    /* The array of tlb entries itself. */
-    CPUTLBEntry *table;
-} CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));
-
 /*
  * Data elements that are shared between all MMU modes.
  */
@@ -230,10 +197,6 @@ typedef struct CPUTLB {
     CPUTLBDescFast f[NB_MMU_MODES];
 } CPUTLB;
 
-/* This will be used by TCG backends to compute offsets.  */
-#define TLB_MASK_TABLE_OFS(IDX) \
-    ((int)offsetof(ArchCPU, neg.tlb.f[IDX]) - (int)offsetof(ArchCPU, env))
-
 #else
 
 typedef struct CPUTLB { } CPUTLB;
diff --git a/include/exec/tlb-common.h b/include/exec/tlb-common.h
new file mode 100644
index 0000000000..dc5a5faa0b
--- /dev/null
+++ b/include/exec/tlb-common.h
@@ -0,0 +1,56 @@
+/*
+ * Common definitions for the softmmu tlb
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef EXEC_TLB_COMMON_H
+#define EXEC_TLB_COMMON_H 1
+
+#define CPU_TLB_ENTRY_BITS 5
+
+/* Minimalized TLB entry for use by TCG fast path. */
+typedef union CPUTLBEntry {
+    struct {
+        uint64_t addr_read;
+        uint64_t addr_write;
+        uint64_t addr_code;
+        /*
+         * Addend to virtual address to get host address.  IO accesses
+         * use the corresponding iotlb value.
+         */
+        uintptr_t addend;
+    };
+    /*
+     * Padding to get a power of two size, as well as index
+     * access to addr_{read,write,code}.
+     */
+    uint64_t addr_idx[(1 << CPU_TLB_ENTRY_BITS) / sizeof(uint64_t)];
+} CPUTLBEntry;
+
+QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
+
+/*
+ * Data elements that are per MMU mode, accessed by the fast path.
+ * The structure is aligned to aid loading the pair with one insn.
+ */
+typedef struct CPUTLBDescFast {
+    /* Contains (n_entries - 1) << CPU_TLB_ENTRY_BITS */
+    uintptr_t mask;
+    /* The array of tlb entries itself. */
+    CPUTLBEntry *table;
+} CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));
+
+#endif /* EXEC_TLB_COMMON_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 719d719b58..60d4923de3 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -554,6 +554,7 @@ struct TCGContext {
     TCGType addr_type;            /* TCG_TYPE_I32 or TCG_TYPE_I64 */
 
 #ifdef CONFIG_SOFTMMU
+    int tlb_fast_offset;
     int page_mask;
     uint8_t page_bits;
     uint8_t tlb_dyn_max_bits;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f6c8ad1a18..be38d4aad8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -361,6 +361,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_ctx->page_bits = TARGET_PAGE_BITS;
     tcg_ctx->page_mask = TARGET_PAGE_MASK;
     tcg_ctx->tlb_dyn_max_bits = CPU_TLB_DYN_MAX_BITS;
+    tcg_ctx->tlb_fast_offset =
+        (int)offsetof(ArchCPU, neg.tlb.f) - (int)offsetof(ArchCPU, env);
 #endif
 
  tb_overflow:
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 16dab1b6e3..ab632119d4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -44,6 +44,7 @@
 #define NO_CPU_IO_DEFS
 
 #include "exec/exec-all.h"
+#include "exec/tlb-common.h"
 #include "tcg/tcg-op.h"
 
 #if UINTPTR_MAX == UINT32_MAX
@@ -403,6 +404,13 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
     return (uintptr_t)tcg_splitwx_to_rx(&s->gen_tb->jmp_target_addr[which]);
 }
 
+#if defined(CONFIG_SOFTMMU) && !defined(CONFIG_TCG_INTERPRETER)
+static int tlb_mask_table_ofs(TCGContext *s, int which)
+{
+    return s->tlb_fast_offset + which * sizeof(CPUTLBDescFast);
+}
+#endif
+
 /* Signal overflow, starting over with fewer guest insns. */
 static G_NORETURN
 void tcg_raise_tb_overflow(TCGContext *s)
@@ -1426,6 +1434,11 @@ void tcg_func_start(TCGContext *s)
 
     tcg_debug_assert(s->addr_type == TCG_TYPE_I32 ||
                      s->addr_type == TCG_TYPE_I64);
+
+#if defined(CONFIG_SOFTMMU) && !defined(CONFIG_TCG_INTERPRETER)
+    tcg_debug_assert(s->tlb_fast_offset < 0);
+    tcg_debug_assert(s->tlb_fast_offset >= MIN_TLB_MASK_TABLE_OFS);
+#endif
 }
 
 static TCGTemp *tcg_temp_alloc(TCGContext *s)
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e94d3f2c2c..5ac3a1f55f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1652,6 +1652,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 
+/* We expect to use a 7-bit scaled negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -512
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -1691,12 +1694,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                  ? TCG_TYPE_I64 : TCG_TYPE_I32);
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -512);
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
     tcg_out_insn(s, 3314, LDP, TCG_REG_X0, TCG_REG_X1, TCG_AREG0,
-                 TLB_MASK_TABLE_OFS(mem_index), 1, 0);
+                 tlb_mask_table_ofs(s, mem_index), 1, 0);
 
     /* Extract the TLB index from the address into X0.  */
     tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 92fc5e35f5..c737bb49a5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1375,6 +1375,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 
+/* We expect to use an 9-bit sign-magnitude negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -256
+
 static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
                                            MemOpIdx oi, bool is_ld)
@@ -1392,7 +1395,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int mem_index = get_mmuidx(oi);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
                         : offsetof(CPUTLBEntry, addr_write);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_off = tlb_mask_table_ofs(s, mem_index);
     unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
     TCGReg t_addr;
 
@@ -1403,8 +1406,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->addrhi_reg = addrhi;
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -256);
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
     tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 9eb4ae15b6..01614e252b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1934,6 +1934,8 @@ static inline int setup_guest_base_seg(void)
 #endif /* setup_guest_base_seg */
 #endif /* !SOFTMMU */
 
+#define MIN_TLB_MASK_TABLE_OFS  INT_MIN
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -1962,6 +1964,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int trexw = 0, hrexw = 0, tlbrexw = 0;
     unsigned mem_index = get_mmuidx(oi);
     unsigned s_mask = (1 << s_bits) - 1;
+    int fast_ofs = tlb_mask_table_ofs(s, mem_index);
     int tlb_mask;
 
     ldst = new_ldst_label(s);
@@ -1987,12 +1990,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                    s->page_bits - CPU_TLB_ENTRY_BITS);
 
     tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, mask));
+                         fast_ofs + offsetof(CPUTLBDescFast, mask));
 
     tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, table));
+                         fast_ofs + offsetof(CPUTLBDescFast, table));
 
     /*
      * If the required alignment is at least as large as the access, simply
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 56f95980c2..ec178edcdc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -835,6 +835,9 @@ bool tcg_target_has_memory_bswap(MemOp memop)
     return false;
 }
 
+/* We expect to use a 12-bit negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -(1 << 11)
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -857,7 +860,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
     int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_ofs = tlb_mask_table_ofs(s, mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
 
@@ -866,8 +869,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->oi = oi;
     ldst->addrlo_reg = addr_reg;
 
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 64e5bfc39e..b9c4715d30 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1143,6 +1143,9 @@ bool tcg_target_has_memory_bswap(MemOp memop)
     return false;
 }
 
+/* We expect to use a 16-bit negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -32768
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -1169,7 +1172,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #ifdef CONFIG_SOFTMMU
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_off = tlb_mask_table_ofs(s, mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
     int add_off = offsetof(CPUTLBEntry, addend);
@@ -1183,8 +1186,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->addrhi_reg = addrhi;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 8dcde4ed14..322cc84b81 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2038,6 +2038,9 @@ bool tcg_target_has_memory_bswap(MemOp memop)
     return atom_a <= MO_64;
 }
 
+/* We expect to use a 16-bit negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -32768
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -2081,7 +2084,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int mem_index = get_mmuidx(oi);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
                         : offsetof(CPUTLBEntry, addr_write);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_off = tlb_mask_table_ofs(s, mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
 
@@ -2092,8 +2095,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->addrhi_reg = addrhi;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, mask_off);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_AREG0, table_off);
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index cddcfae1f9..1c0588e320 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -898,6 +898,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 
+/* We expect to use a 12-bit negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -(1 << 11)
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -922,7 +925,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1u << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_ofs = tlb_mask_table_ofs(s, mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
     int compare_mask;
@@ -933,8 +936,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     ldst->oi = oi;
     ldst->addrlo_reg = addr_reg;
 
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 84ba6638d6..2c6e8d1cae 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1737,6 +1737,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 
+/* We're expecting to use a 20-bit negative offset on the tlb memory ops.  */
+#define MIN_TLB_MASK_TABLE_OFS  -(1 << 19)
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -1761,7 +1764,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_off = tlb_mask_table_ofs(s, mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
     int ofs, a_off;
@@ -1775,8 +1778,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, addr_reg, TCG_REG_NONE,
                  s->page_bits - CPU_TLB_ENTRY_BITS);
 
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
     tcg_out_insn(s, RXY, NG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, mask_off);
     tcg_out_insn(s, RXY, AG, TCG_TMP0, TCG_AREG0, TCG_REG_NONE, table_off);
 
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f169f41521..e90ed76e35 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1016,6 +1016,9 @@ bool tcg_target_has_memory_bswap(MemOp memop)
     return true;
 }
 
+/* We expect to use a 13-bit negative offset from ENV.  */
+#define MIN_TLB_MASK_TABLE_OFS  -(1 << 12)
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
@@ -1041,7 +1044,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int fast_off = tlb_mask_table_ofs(s, mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1051,8 +1054,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int cc;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 12));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T2, TCG_AREG0, mask_off);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T3, TCG_AREG0, table_off);
 
-- 
2.34.1


