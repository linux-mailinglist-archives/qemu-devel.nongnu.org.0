Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF46F5195
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:31:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rN-0004rX-EG; Wed, 03 May 2023 03:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qJ-0002WC-GD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qF-0001lj-V3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so29113295e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098638; x=1685690638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7lfnzw2g9RHLR3S/Gghq+tGEF3+09XSY9E4+9IGmic=;
 b=RgCoEjWws1GbptIvS3rsvtGogqyT9vpPKudZytSq09mj+iI3E0TndiAQ9kd03OiKBx
 igW1kHfUvl9tIJzg8AONZSW9raC3cnIa0FFEuRO0MbiyrWIu2yTrCy+gM+VQrcu+PLZW
 AR+YCa3P56PH7QtHBuzskqL2rDQa03oGhBbgZTW8TDj+K/b7y5W7sNJMtD35j7EcFBPg
 pBO5kEcNcdub2oE9Dkfy853cqLP/71jBKoStzfYGEvdIOTkkiNklZy6pyWjnCyo4EDoD
 /3ICOCQ8xqAHjkdJzePw64rTB/X0RnBGFGCzgVUx/euUv8ZJxD83jXx3ERKK00RECoMD
 cMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098638; x=1685690638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7lfnzw2g9RHLR3S/Gghq+tGEF3+09XSY9E4+9IGmic=;
 b=EtuF/0PkdfR48Glm76hM8Yp5dfZ9L5WrmuCbdm9FTkG3NMaGAJ8mTEMx1dBavnj5IE
 eMC/p7uKQlvQy76/OqSrPipQMzb8ZOmFp3FKVAmJk4evKg30mSK5h4SB7ayC4vm/8L15
 QAU7TiJkLqNqXp9k2LECnY7WPc0Qp9/4MuTedVgKrOnF68jkP8MwYZB87byLKYmlLYA+
 o/yN8cOWv8zwQ2cJxxuGpF5j7XP6f7rJW1QwH5XQAVwRB4Ee+RacyeWGjA6aaspPfhht
 LZVoOMEl1RVhGvRPZLM/9+RFTXxGdruC1trSsZegIZzocO3s490TD0szgIuocEE85yMK
 XCWw==
X-Gm-Message-State: AC+VfDzFe6dlORS+GQMbt1plQIcyjdyRLsPvwSxdhSa7dZoxT5ZEzYiW
 bFsf7iC0MdpT5le1DXDCqevBoYX+EcWo36Ulf16zUg==
X-Google-Smtp-Source: ACHHUZ56vsq9Zu8DLGV9Q0iLV8F3fmk4Ljx23ZAx0Zrc7fomGZ8tgaZsPu9D1Iy9wODnuOadv/N+jA==
X-Received: by 2002:a1c:6a14:0:b0:3ed:514d:e07f with SMTP id
 f20-20020a1c6a14000000b003ed514de07fmr15288490wmc.3.1683098638402; 
 Wed, 03 May 2023 00:23:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 33/84] tcg: Widen CPUTLBEntry comparators to 64-bits
Date: Wed,  3 May 2023 08:22:40 +0100
Message-Id: <20230503072331.1747057-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

This makes CPUTLBEntry agnostic to the address size of the guest.
When 32-bit addresses are in effect, we can simply read the low
32 bits of the 64-bit field.  Similarly when we need to update
the field for setting TLB_NOTDIRTY.

For TCG backends that could in theory be big-endian, but in
practice are not (arm, loongarch, riscv), use QEMU_BUILD_BUG_ON
to document and ensure this is not accidentally missed.

For s390x, which is always big-endian, use HOST_BIG_ENDIAN anyway,
to document the reason for the adjustment.

For sparc64 and ppc64, always perform a 64-bit load, and rely on
the following 32-bit comparison to ignore the high bits.

Rearrange mips and ppc if ladders for clarity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h          | 37 +++++++++++---------------------
 include/exec/cpu_ldst.h          | 19 ++++++++++------
 accel/tcg/cputlb.c               |  8 +++++--
 tcg/aarch64/tcg-target.c.inc     |  1 +
 tcg/arm/tcg-target.c.inc         |  1 +
 tcg/loongarch64/tcg-target.c.inc |  1 +
 tcg/mips/tcg-target.c.inc        | 13 ++++++-----
 tcg/ppc/tcg-target.c.inc         | 28 +++++++++++++-----------
 tcg/riscv/tcg-target.c.inc       |  1 +
 tcg/s390x/tcg-target.c.inc       |  1 +
 tcg/sparc64/tcg-target.c.inc     |  8 +++++--
 11 files changed, 67 insertions(+), 51 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index a6e0cf1812..b757d37966 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -65,11 +65,7 @@
 /* use a fully associative victim tlb of 8 entries */
 #define CPU_VTLB_SIZE 8
 
-#if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
-#define CPU_TLB_ENTRY_BITS 4
-#else
 #define CPU_TLB_ENTRY_BITS 5
-#endif
 
 #define CPU_TLB_DYN_MIN_BITS 6
 #define CPU_TLB_DYN_DEFAULT_BITS 8
@@ -95,33 +91,26 @@
 # endif
 
 /* Minimalized TLB entry for use by TCG fast path. */
-typedef struct CPUTLBEntry {
-    /* bit TARGET_LONG_BITS to TARGET_PAGE_BITS : virtual address
-       bit TARGET_PAGE_BITS-1..4  : Nonzero for accesses that should not
-                                    go directly to ram.
-       bit 3                      : indicates that the entry is invalid
-       bit 2..0                   : zero
-    */
-    union {
-        struct {
-            target_ulong addr_read;
-            target_ulong addr_write;
-            target_ulong addr_code;
-            /* Addend to virtual address to get host address.  IO accesses
-               use the corresponding iotlb value.  */
-            uintptr_t addend;
-        };
+typedef union CPUTLBEntry {
+    struct {
+        uint64_t addr_read;
+        uint64_t addr_write;
+        uint64_t addr_code;
         /*
-         * Padding to get a power of two size, as well as index
-         * access to addr_{read,write,code}.
+         * Addend to virtual address to get host address.  IO accesses
+         * use the corresponding iotlb value.
          */
-        target_ulong addr_idx[(1 << CPU_TLB_ENTRY_BITS) / TARGET_LONG_SIZE];
+        uintptr_t addend;
     };
+    /*
+     * Padding to get a power of two size, as well as index
+     * access to addr_{read,write,code}.
+     */
+    uint64_t addr_idx[(1 << CPU_TLB_ENTRY_BITS) / sizeof(uint64_t)];
 } CPUTLBEntry;
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
-
 #endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 7c867c94c3..f916a96a31 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -365,18 +365,25 @@ static inline target_ulong tlb_read_idx(const CPUTLBEntry *entry,
 {
     /* Do not rearrange the CPUTLBEntry structure members. */
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
-                      MMU_DATA_LOAD * TARGET_LONG_SIZE);
+                      MMU_DATA_LOAD * sizeof(uint64_t));
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
-                      MMU_DATA_STORE * TARGET_LONG_SIZE);
+                      MMU_DATA_STORE * sizeof(uint64_t));
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
-                      MMU_INST_FETCH * TARGET_LONG_SIZE);
+                      MMU_INST_FETCH * sizeof(uint64_t));
 
-    const target_ulong *ptr = &entry->addr_idx[access_type];
-#if TCG_OVERSIZED_GUEST
-    return *ptr;
+#if TARGET_LONG_BITS == 32
+    /* Use qatomic_read, in case of addr_write; only care about low bits. */
+    const uint32_t *ptr = (uint32_t *)&entry->addr_idx[access_type];
+    ptr += HOST_BIG_ENDIAN;
+    return qatomic_read(ptr);
 #else
+    const uint64_t *ptr = &entry->addr_idx[access_type];
+# if TCG_OVERSIZED_GUEST
+    return *ptr;
+# else
     /* ofs might correspond to .addr_write, so use qatomic_read */
     return qatomic_read(ptr);
+# endif
 #endif
 }
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e494404a0d..83297f9bff 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1000,11 +1000,15 @@ static void tlb_reset_dirty_range_locked(CPUTLBEntry *tlb_entry,
         addr &= TARGET_PAGE_MASK;
         addr += tlb_entry->addend;
         if ((addr - start) < length) {
-#if TCG_OVERSIZED_GUEST
+#if TARGET_LONG_BITS == 32
+            uint32_t *ptr_write = (uint32_t *)&tlb_entry->addr_write;
+            ptr_write += HOST_BIG_ENDIAN;
+            qatomic_set(ptr_write, *ptr_write | TLB_NOTDIRTY);
+#elif TCG_OVERSIZED_GUEST
             tlb_entry->addr_write |= TLB_NOTDIRTY;
 #else
             qatomic_set(&tlb_entry->addr_write,
-                       tlb_entry->addr_write | TLB_NOTDIRTY);
+                        tlb_entry->addr_write | TLB_NOTDIRTY);
 #endif
         }
     }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fa8f3a7629..e94d3f2c2c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1707,6 +1707,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
 
     /* Load the tlb comparator into X0, and the fast path addend into X1.  */
+    QEMU_BUILD_BUG_ON(HOST_BIG_ENDIAN);
     tcg_out_ld(s, addr_type, TCG_REG_X0, TCG_REG_X1,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b6e3a4c902..92fc5e35f5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1417,6 +1417,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
      * Load the tlb comparator into R2/R3 and the fast path addend into R1.
      */
+    QEMU_BUILD_BUG_ON(HOST_BIG_ENDIAN);
     if (cmp_off == 0) {
         if (s->addr_type == TCG_TYPE_I32) {
             tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 04d1e0f24d..56f95980c2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -877,6 +877,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
     /* Load the tlb comparator and the addend.  */
+    QEMU_BUILD_BUG_ON(HOST_BIG_ENDIAN);
     tcg_out_ld(s, addr_type, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 836ae58819..64e5bfc39e 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1201,14 +1201,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
     tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
 
+    if (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32) {
+        /* Load the (low half) tlb comparator.  */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3,
+                   cmp_off + HOST_BIG_ENDIAN * 4);
+    } else {
+        tcg_out_ld(s, TCG_TYPE_I64, TCG_TMP0, TCG_TMP3, cmp_off);
+    }
+
     if (TCG_TARGET_REG_BITS == 64 || addr_type == TCG_TYPE_I32) {
-        /* Load the tlb comparator.  */
-        tcg_out_ld(s, addr_type, TCG_TMP0, TCG_TMP3, cmp_off);
         /* Load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
-    } else {
-        /* Load the low half of the tlb comparator.  */
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     }
 
     /*
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index a81241e799..8dcde4ed14 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2107,20 +2107,24 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
     tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
-    /* Load the (low part) TLB comparator into TMP2.  */
-    if (cmp_off == 0
-        && (TCG_TARGET_REG_BITS == 64 || addr_type == TCG_TYPE_I32)) {
-        uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32
-                        ? LWZUX : LDUX);
-        tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
+    /*
+     * Load the (low part) TLB comparator into TMP2.
+     * For 64-bit host, always load the entire 64-bit slot for simplicity.
+     * We will ignore the high bits with tcg_out_cmp(..., addr_type).
+     */
+    if (TCG_TARGET_REG_BITS == 64) {
+        if (cmp_off == 0) {
+            tcg_out32(s, LDUX | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
+        } else {
+            tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
+            tcg_out_ld(s, TCG_TYPE_I64, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
+        }
+    } else if (cmp_off == 0 && !HOST_BIG_ENDIAN) {
+        tcg_out32(s, LWZUX | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
     } else {
         tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
-        if (TCG_TARGET_REG_BITS == 32 && addr_type != TCG_TYPE_I32) {
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
-                       TCG_REG_TMP1, cmp_off + 4 * HOST_BIG_ENDIAN);
-        } else {
-            tcg_out_ld(s, addr_type, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
-        }
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2, TCG_REG_TMP1,
+                   cmp_off + 4 * HOST_BIG_ENDIAN);
     }
 
     /*
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 3f5437fa84..cddcfae1f9 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -963,6 +963,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     }
 
     /* Load the tlb comparator and the addend.  */
+    QEMU_BUILD_BUG_ON(HOST_BIG_ENDIAN);
     tcg_out_ld(s, addr_type, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 4898b01e6a..84ba6638d6 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1800,6 +1800,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ofs = offsetof(CPUTLBEntry, addr_write);
     }
     if (addr_type == TCG_TYPE_I32) {
+        ofs += HOST_BIG_ENDIAN * 4;
         tcg_out_insn(s, RX, C, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     } else {
         tcg_out_insn(s, RXY, CG, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e00ecd2cf8..f169f41521 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1064,8 +1064,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Add the tlb_table pointer, creating the CPUTLBEntry address into R2.  */
     tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T3, ARITH_ADD);
 
-    /* Load the tlb comparator and the addend. */
-    tcg_out_ld(s, addr_type, TCG_REG_T2, TCG_REG_T1, cmp_off);
+    /*
+     * Load the tlb comparator and the addend.
+     * Always load the entire 64-bit comparator for simplicity.
+     * We will ignore the high bits via BPCC_ICC below.
+     */
+    tcg_out_ld(s, TCG_TYPE_I64, TCG_REG_T2, TCG_REG_T1, cmp_off);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T1, TCG_REG_T1, add_off);
     h->base = TCG_REG_T1;
 
-- 
2.34.1


