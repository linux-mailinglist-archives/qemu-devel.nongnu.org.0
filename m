Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE292D99CD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:25:08 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koomh-0002Ce-3P
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS7-0001ip-56
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:51 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRz-0003wd-Al
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:50 -0500
Received: by mail-ot1-x344.google.com with SMTP id x13so15781544oto.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xqRZhjxDlTittJJCkvFwWLoeMjn4/7xpY5jGL/CdFJM=;
 b=OFJq9mJBqeVgIv4legjF86Tg2dk5LuX82d9UIgEIwk4V6uOZ2PHa4yqfGab6xu53Qy
 Z+6zzoUx3oQLHphkaXFU0VgwJ6xmkU26LT7M1Y6SwtvRTFBz8MhU5iWFNCmAfYMjnshR
 4MdxLlmbBa7eBMdJHjdb/ZDmG6+Vd5ChPlSxDcETd68plNRXIm7Ed9jyUmf3abOW4DF8
 ykajoLfB2mASGvM+Dh207OGoFJ0h6TOrAxWA71pH4MU63/CkdfQ10NDaNRHmxRfl3o9A
 C9/e2u1SbDaWrJwviGXATgxF3oPYzrIR4oUolf9tCnhWlEBUaOIUdcuOs6LBGLBBcG06
 HnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqRZhjxDlTittJJCkvFwWLoeMjn4/7xpY5jGL/CdFJM=;
 b=kLA1+d30q5QQqRvIeYy9t066D6PMpyh0R7UBMTb2UQK0XATvadD9tf7x8AY/dO6DAH
 oE3P9ZomnRwqzttTyXKgW3qArh11zuAOF7yTqs7WyGZWN483xEhAhjeXYyfJG6kAPnPX
 isgTr4gfDlRks+slNBWAkdbWikKGFKiY5nnvgxVQVXkiH6PL0yMHFZ7w/q81OryfddZo
 7ZfUpo8gIU7DWJJWqFXKPTP4bOJ0rjxon3o6fua3ytqtvHrP00TbpEKNvILBH0l8ywUJ
 LtQBRERKu5dilM6vs29nzYDZqFaom967rtDRCOGikaMYGw5dnnFrxkq4kCJHXP4hLmfi
 qyjA==
X-Gm-Message-State: AOAM53387Q7OfV3cJlsqxnzhrK8uP+DkdCOdGRh/ExbnAxemXb7EZ680
 Kep8iUe5+/9+/Zjjy57sY8sPtkkyFiRbTbBq
X-Google-Smtp-Source: ABdhPJx7PXjJGZ/xymQ42wHEwpvVCnRjw/QCjJJtgpKrVq+bMy+HEpEo7/Oncsi/mOCY7rUyJOlAJQ==
X-Received: by 2002:a05:6830:1252:: with SMTP id
 s18mr19627153otp.4.1607954619688; 
 Mon, 14 Dec 2020 06:03:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/43] tcg: Adjust tb_target_set_jmp_target for split-wx
Date: Mon, 14 Dec 2020 08:02:44 -0600
Message-Id: <20201214140314.18544-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass both rx and rw addresses to tb_target_set_jmp_target.

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
index 8a6b97598e..6ba248f447 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -148,7 +148,7 @@ typedef enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index f1955ce4ac..6ca4537ca6 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -135,7 +135,7 @@ enum {
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index cd067e0b30..0dcaed7fe6 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -206,11 +206,11 @@ extern bool have_avx2;
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
index 92c1d63da3..d23baf7cda 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -201,7 +201,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index a509a19628..c41d10142b 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -175,7 +175,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index c1bd52bb9a..3d0745c70c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -160,7 +160,7 @@ typedef enum {
 #endif
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index b4feb2f55a..3750952598 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -145,12 +145,12 @@ enum {
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
index d8b0e32e2e..9c15c91d39 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -168,7 +168,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index b84480f989..fcec2e70db 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -198,11 +198,11 @@ void tci_disas(uint8_t opc);
 
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
index 1e3cb570f6..272d596e0c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -354,7 +354,9 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
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


