Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D9670CE7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6x-0003Wn-BB; Tue, 17 Jan 2023 18:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6t-0003VK-TY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:19 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6r-0001Ii-7l
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:19 -0500
Received: by mail-pf1-x429.google.com with SMTP id i65so21334504pfc.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+30uNB59tTRmdsDDzyYg8yKSQPq9Vs9bK22kjh1BAs=;
 b=tyvItP0hhDA521QL6X8ImkiY/yceOoAmrwGDmOy2GRHaXR/bq6/Zfhc+cGB44uOYWC
 dDF8LoHt6m1KoX5JWApW95233BC9gSc+N9k/9A3J/tHVC1ee9vthmP8pzbXjN4HR22f3
 ejwKY5qW96bFyS0SEaG1pl87V61+uKCzZZyZ/p63B2nz+ipPHr8C/HzIZVJUNRqvVZo2
 L+lq8inY2z3Ju3x6uS8MBZflvjHco9vI7OuR8uigEcsg59zLVoulsVAGiAvioO2r5VCo
 G3nAHK5ohPQR+x31H6yhUOR0LqLLb4Bf4HhUFaTuIZuyGDjmIMS6g2vvh3IZKAe1PKY1
 qn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+30uNB59tTRmdsDDzyYg8yKSQPq9Vs9bK22kjh1BAs=;
 b=qGG39UBebLwL+hfJJoK/nPh2XcIQ+ldNxiJF436/JWU3HajC7IllCZ8o4i51JkutSG
 BY6xZQJvqwvN0ALzUt6EbqVYRQvk0gRRu0OD1V2vHEk2k+zTHWErUwHtivjg7WMVPFD6
 wG7Ynu+F8poiiK0CM+5Nd7mXHtlD4OK2cdLD7IMWJvnV4vaveBL2KCNY06QojC/5J7tI
 MJBJjni5tFSdZYBH9QzE+jNwB4Hg4uosV8L7BWJXph8y/umJBO0m/3fpYwBpnk3BD64c
 Tz646Xq/LqhIbID5BYlVrBVtt1cNNrTvc5trFxDjFnqEsnMsWxTbTRi+A5kz4E6ewBhy
 ZijQ==
X-Gm-Message-State: AFqh2kruEvM5CqJckCv5XCXznXeybAy4YYF7ENzdbu+oShX1NsCJflL5
 qCnopstABx4GkNGKpfwmjjAh1EKOFCf0VTew
X-Google-Smtp-Source: AMrXdXsbrVpgYXlc9iaOUpaJtIk2rAFo8He4X4NekJRcQvkUt0Xo1OnPqkTa03EwLNzt9F8oxhkVXA==
X-Received: by 2002:a62:2544:0:b0:580:d71e:a2e5 with SMTP id
 l65-20020a622544000000b00580d71ea2e5mr3888501pfl.22.1673997074612; 
 Tue, 17 Jan 2023 15:11:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/22] tcg: Change tb_target_set_jmp_target arguments
Date: Tue, 17 Jan 2023 13:10:41 -1000
Message-Id: <20230117231051.354444-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace 'tc_ptr' and 'addr' with 'tb' and 'n'.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h         |  3 ++-
 tcg/arm/tcg-target.h             |  3 ++-
 tcg/i386/tcg-target.h            |  9 ++-------
 tcg/loongarch64/tcg-target.h     |  3 ++-
 tcg/mips/tcg-target.h            |  3 ++-
 tcg/ppc/tcg-target.h             |  3 ++-
 tcg/riscv/tcg-target.h           |  3 ++-
 tcg/s390x/tcg-target.h           | 10 ++--------
 tcg/sparc64/tcg-target.h         |  3 ++-
 tcg/tci/tcg-target.h             |  3 ++-
 accel/tcg/cpu-exec.c             | 11 ++++++++---
 tcg/aarch64/tcg-target.c.inc     |  5 +++--
 tcg/i386/tcg-target.c.inc        |  9 +++++++++
 tcg/loongarch64/tcg-target.c.inc |  5 +++--
 tcg/ppc/tcg-target.c.inc         |  7 ++++---
 tcg/s390x/tcg-target.c.inc       | 10 ++++++++++
 tcg/sparc64/tcg-target.c.inc     |  7 ++++---
 17 files changed, 61 insertions(+), 36 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 413a5410c5..d491c198da 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -152,7 +152,8 @@ typedef enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index b7843d2d54..4c1433093c 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -152,7 +152,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7edb7f1d9a..7500ceaab9 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -220,13 +220,8 @@ extern bool have_movbe;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
-    /* no need to flush icache explicitly */
-}
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
 
 /* This defines the natural memory order supported by this
  * architecture before guarantees made by various barrier
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index e5f7a1f09d..a150c3c7b2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -171,7 +171,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 15721c3e42..d1adf3e326 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -206,7 +206,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t)
     QEMU_ERROR("code path is reachable");
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index b5cd225cfa..02764c3331 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -180,7 +180,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 232537ccea..bce164fde2 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -166,7 +166,8 @@ typedef enum {
 #endif
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 68dcbc6645..57ba165800 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -175,14 +175,8 @@ extern uint64_t s390_facilities[3];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    intptr_t disp = addr - (jmp_rx - 2);
-    qatomic_set((int32_t *)jmp_rw, disp / 2);
-    /* no need to flush icache explicitly */
-}
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 0044ac8d78..282833bd8d 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -155,7 +155,8 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 94ec541b4e..f9ee83d751 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -177,6 +177,7 @@ typedef enum {
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #endif /* TCG_TARGET_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 25c4b04445..37c5f91074 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -574,11 +574,16 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
     tb->jmp_target_addr[n] = addr;
     if (TCG_TARGET_HAS_direct_jump) {
+        /*
+         * Get the rx view of the structure, from which we find the
+         * executable code address, and tb_target_set_jmp_target can
+         * produce a pc-relative displacement to jmp_target_addr[n].
+         */
+        const TranslationBlock *c_tb = tcg_splitwx_to_rx(tb);
         uintptr_t offset = tb->jmp_insn_offset[n];
-        uintptr_t tc_ptr = (uintptr_t)tb->tc.ptr;
-        uintptr_t jmp_rx = tc_ptr + offset;
+        uintptr_t jmp_rx = (uintptr_t)tb->tc.ptr + offset;
         uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
-        tb_target_set_jmp_target(tc_ptr, jmp_rx, jmp_rw, addr);
+        tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
     }
 }
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ad35bee8af..0b65f2cac1 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1353,9 +1353,10 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
     tcg_out_call_int(s, target);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
+    uintptr_t addr = tb->jmp_target_addr[n];
     tcg_insn_unit i1, i2;
     TCGType rt = TCG_TYPE_I64;
     TCGReg  rd = TCG_REG_TMP;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 33c4139730..c71c3e664d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2374,6 +2374,15 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* patch the branch destination */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
+    /* no need to flush icache explicitly */
+}
+
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 25de7a9ee0..3174557ce3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1039,11 +1039,12 @@ static void tcg_out_nop(TCGContext *s)
     tcg_out32(s, NOP);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
     tcg_insn_unit i1, i2;
     ptrdiff_t upper, lower;
+    uintptr_t addr = tb->jmp_target_addr[n];
     ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
 
     if (offset == sextreg(offset, 0, 26)) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e56f86c613..6f2c8faea6 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1893,11 +1893,12 @@ static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
     flush_idcache_range(rx, rw, 16);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
     tcg_insn_unit i0, i1, i2, i3;
-    intptr_t tb_diff = addr - tc_ptr;
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t tb_diff = addr - (uintptr_t)tb->tc.ptr;
     intptr_t br_diff = addr - (jmp_rx + 4);
     intptr_t lo, hi;
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e008f0efcc..2d049a4cc7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1970,6 +1970,16 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* patch the branch destination */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t disp = addr - (jmp_rx - 2);
+    qatomic_set((int32_t *)jmp_rw, disp / 2);
+    /* no need to flush icache explicitly */
+}
+
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_,x),_i32): \
         case glue(glue(INDEX_op_,x),_i64)
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 594767ded8..fdb711bdf6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1885,10 +1885,11 @@ void tcg_register_jit(const void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
-    intptr_t tb_disp = addr - tc_ptr;
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t tb_disp = addr - (uintptr_t)tb->tc.ptr;
     intptr_t br_disp = addr - jmp_rx;
     tcg_insn_unit i1, i2;
 
-- 
2.34.1


