Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD22EE6CB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:26:38 +0100 (CET)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbrh-00050S-It
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh2-0001Ee-E8
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:36 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgs-0001ac-Rx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:36 -0500
Received: by mail-pg1-x536.google.com with SMTP id v19so5712447pgj.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YV1yh0Eq/5w1u4soV5qGlyOgc8f67f4AiD1fJJACFJM=;
 b=gLohlE4OxOErbf7R1yvbWODC2K+4xotpZmmYnTZ5+ZD8ZUh7JAwIlMxr0dJXXkxnw3
 ScrzpK+byVG3rLzeziCkhCcCTBEStxJheLKSZzo+7Hj+0ywNsIXZAA4zj/pCbnojjPSL
 rtQPHFSYvDCjqsDwLWXJnIxftyTfQ9z8o9znuWrcjUS6ulrRc5Z5prpBxoBZiGxIO+ZU
 C+0i0gcJhu9GFjACfrII6P+ksB3aQOeEbNf1r9SnKxfHZz4WfXaHFtpUhAGAIPphcPRV
 CHC8zIqEjScI7SVgj4BU3mk21U9+nWQkU7/t4JzzShEsHONwbS4DGNkCnI++bovyNh0q
 xiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YV1yh0Eq/5w1u4soV5qGlyOgc8f67f4AiD1fJJACFJM=;
 b=q2GCFmxCiNDcAQCTCUX4wBuIPArm396vOxSuAaOvuSutH40V+duWi29w8EdQuR5zrX
 /x7epykhhfej8L0C2Vs8qhC0coczGvEC8siRWsyO/RW5fDf1VctKowp5gtzVXlJdkqrG
 IXEuWOoVVdFIZkmKdMIN8/dkxEuOqR7lTkuWHA5vqg9LeJAR+R7+BFcRmtBB//sx3I87
 ORfLHB7ppAX4pig7v+BJOUWQTjAtdcEx2CUIjUwn8twMVdAC1aRtV0WAh8NzMeaToZ1y
 Olw3HLUOeOp0sIzpnf1MJrZk/Kc1J663aYoqv+7+KrjWSKL4Ot4yJqs+Oiv+k7sjzJ9x
 rElQ==
X-Gm-Message-State: AOAM532Loj5ngi/pbh3wm7TzZcEte3rUza5Cw54PEjDqR8TjCxeuEE4w
 uGfeiEpn4Nrr1I0CYWm0oXkwEUpFNhGjPw==
X-Google-Smtp-Source: ABdhPJxMbd2cJ0Al7LuPqeRnrllSoQOHyaPnxZkqCSX60/y51d5VW7v5nqSBsVTD4YQnjxVLhxfJsw==
X-Received: by 2002:a62:2606:0:b029:1a5:a755:5568 with SMTP id
 m6-20020a6226060000b02901a5a7555568mr222079pfm.65.1610050522672; 
 Thu, 07 Jan 2021 12:15:22 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/47] tcg: Adjust tb_target_set_jmp_target for split-wx
Date: Thu,  7 Jan 2021 10:14:18 -1000
Message-Id: <20210107201448.1152301-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass both rx and rw addresses to tb_target_set_jmp_target.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.h         |  2 +-
 tcg/i386/tcg-target.h        |  6 +++---
 tcg/mips/tcg-target.h        |  2 +-
 tcg/ppc/tcg-target.h         |  2 +-
 tcg/riscv/tcg-target.h       |  2 +-
 tcg/s390/tcg-target.h        |  8 ++++----
 tcg/sparc/tcg-target.h       |  2 +-
 tcg/tci/tcg-target.h         |  6 +++---
 accel/tcg/cpu-exec.c         |  4 +++-
 tcg/aarch64/tcg-target.c.inc | 12 ++++++------
 tcg/mips/tcg-target.c.inc    |  8 ++++----
 tcg/ppc/tcg-target.c.inc     | 16 ++++++++--------
 tcg/sparc/tcg-target.c.inc   | 14 +++++++-------
 14 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 108a1fa969..5ec30dba25 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -149,7 +149,7 @@ typedef enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 1e18fefd0e..8d1fee6327 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -136,7 +136,7 @@ enum {
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index f3836a4d0c..b693d3692d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -210,11 +210,11 @@ extern bool have_movbe;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
-                                            uintptr_t jmp_addr, uintptr_t addr)
+static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                                            uintptr_t jmp_rw, uintptr_t addr)
 {
     /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
+    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
     /* no need to flush icache explicitly */
 }
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 624248b81e..c2c32fb38f 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -202,7 +202,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 301173c97e..d1339afc66 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -176,7 +176,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 888288d54c..727c8df418 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -161,7 +161,7 @@ typedef enum {
 #endif
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 69576f4a9a..641464eea4 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -146,12 +146,12 @@ enum {
     TCG_AREG0 = TCG_REG_R10,
 };
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
-                                            uintptr_t jmp_addr, uintptr_t addr)
+static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                                            uintptr_t jmp_rw, uintptr_t addr)
 {
     /* patch the branch destination */
-    intptr_t disp = addr - (jmp_addr - 2);
-    qatomic_set((int32_t *)jmp_addr, disp / 2);
+    intptr_t disp = addr - (jmp_rx - 2);
+    qatomic_set((int32_t *)jmp_rw, disp / 2);
     /* no need to flush icache explicitly */
 }
 
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 9dce305253..95ab9af955 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -169,7 +169,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index e8277caee2..bb784e018e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -199,11 +199,11 @@ void tci_disas(uint8_t opc);
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
-                                            uintptr_t jmp_addr, uintptr_t addr)
+static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                                            uintptr_t jmp_rw, uintptr_t addr)
 {
     /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_addr, addr - (jmp_addr + 4));
+    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
     /* no need to flush icache explicitly */
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f9344db283..29294f2804 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -382,7 +382,9 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
     if (TCG_TARGET_HAS_direct_jump) {
         uintptr_t offset = tb->jmp_target_arg[n];
         uintptr_t tc_ptr = (uintptr_t)tb->tc.ptr;
-        tb_target_set_jmp_target(tc_ptr, tc_ptr + offset, addr);
+        uintptr_t jmp_rx = tc_ptr + offset;
+        uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
+        tb_target_set_jmp_target(tc_ptr, jmp_rx, jmp_rw, addr);
     } else {
         tb->jmp_target_arg[n] = addr;
     }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 9ace859db3..fea784cf75 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1340,21 +1340,21 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
-                              uintptr_t addr)
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
 {
     tcg_insn_unit i1, i2;
     TCGType rt = TCG_TYPE_I64;
     TCGReg  rd = TCG_REG_TMP;
     uint64_t pair;
 
-    ptrdiff_t offset = addr - jmp_addr;
+    ptrdiff_t offset = addr - jmp_rx;
 
     if (offset == sextract64(offset, 0, 26)) {
         i1 = I3206_B | ((offset >> 2) & 0x3ffffff);
         i2 = NOP;
     } else {
-        offset = (addr >> 12) - (jmp_addr >> 12);
+        offset = (addr >> 12) - (jmp_rx >> 12);
 
         /* patch ADRP */
         i1 = I3406_ADRP | (offset & 3) << 29 | (offset & 0x1ffffc) << (5 - 2) | rd;
@@ -1362,8 +1362,8 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
         i2 = I3401_ADDI | rt << 31 | (addr & 0xfff) << 10 | rd << 5 | rd;
     }
     pair = (uint64_t)i2 << 32 | i1;
-    qatomic_set((uint64_t *)jmp_addr, pair);
-    flush_idcache_range(jmp_addr, jmp_addr, 8);
+    qatomic_set((uint64_t *)jmp_rw, pair);
+    flush_idcache_range(jmp_rx, jmp_rw, 8);
 }
 
 static inline void tcg_out_goto_label(TCGContext *s, TCGLabel *l)
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e9c8c24741..52638e920c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2657,11 +2657,11 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
-                              uintptr_t addr)
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
 {
-    qatomic_set((uint32_t *)jmp_addr, deposit32(OPC_J, 0, 26, addr >> 2));
-    flush_idcache_range(jmp_addr, jmp_addr, 4);
+    qatomic_set((uint32_t *)jmp_rw, deposit32(OPC_J, 0, 26, addr >> 2));
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
 }
 
 typedef struct {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index a0a5bac13f..0eb9c4ebe2 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1722,13 +1722,13 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, insn);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
-                              uintptr_t addr)
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
 {
     if (TCG_TARGET_REG_BITS == 64) {
         tcg_insn_unit i1, i2;
         intptr_t tb_diff = addr - tc_ptr;
-        intptr_t br_diff = addr - (jmp_addr + 4);
+        intptr_t br_diff = addr - (jmp_rx + 4);
         uint64_t pair;
 
         /* This does not exercise the range of the branch, but we do
@@ -1752,13 +1752,13 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
 
         /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
            within qatomic_set that would fail to build a ppc32 host.  */
-        qatomic_set__nocheck((uint64_t *)jmp_addr, pair);
-        flush_idcache_range(jmp_addr, jmp_addr, 8);
+        qatomic_set__nocheck((uint64_t *)jmp_rw, pair);
+        flush_idcache_range(jmp_rx, jmp_rw, 8);
     } else {
-        intptr_t diff = addr - jmp_addr;
+        intptr_t diff = addr - jmp_rx;
         tcg_debug_assert(in_range_b(diff));
-        qatomic_set((uint32_t *)jmp_addr, B | (diff & 0x3fffffc));
-        flush_idcache_range(jmp_addr, jmp_addr, 4);
+        qatomic_set((uint32_t *)jmp_rw, B | (diff & 0x3fffffc));
+        flush_idcache_range(jmp_rx, jmp_rw, 4);
     }
 }
 
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 4c81d5f1c2..d599ae27b5 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1821,11 +1821,11 @@ void tcg_register_jit(const void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
-                              uintptr_t addr)
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
 {
     intptr_t tb_disp = addr - tc_ptr;
-    intptr_t br_disp = addr - jmp_addr;
+    intptr_t br_disp = addr - jmp_rx;
     tcg_insn_unit i1, i2;
 
     /* We can reach the entire address space for ILP32.
@@ -1834,9 +1834,9 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
     tcg_debug_assert(br_disp == (int32_t)br_disp);
 
     if (!USE_REG_TB) {
-        qatomic_set((uint32_t *)jmp_addr,
+        qatomic_set((uint32_t *)jmp_rw,
 		    deposit32(CALL, 0, 30, br_disp >> 2));
-        flush_idcache_range(jmp_addr, jmp_addr, 4);
+        flush_idcache_range(jmp_rx, jmp_rw, 4);
         return;
     }
 
@@ -1859,6 +1859,6 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
               | INSN_IMM13((tb_disp & 0x3ff) | -0x400));
     }
 
-    qatomic_set((uint64_t *)jmp_addr, deposit64(i2, 32, 32, i1));
-    flush_idcache_range(jmp_addr, jmp_addr, 8);
+    qatomic_set((uint64_t *)jmp_rw, deposit64(i2, 32, 32, i1));
+    flush_idcache_range(jmp_rx, jmp_rw, 8);
 }
-- 
2.25.1


