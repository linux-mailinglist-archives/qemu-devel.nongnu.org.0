Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28A3F0C00
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:43:06 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRSr-0007cK-L6
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6Q-0000mk-KT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6O-0000Cn-Bm
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so3035949pjb.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4W1wdtJXaib1zf5uxWKtxlJpgdZpJ9W1za6dB9nHvA=;
 b=gaJoAZE0zSuXTwwKNWIRh16X0RKuoThDC4qFcdnloRqPFq1LNvPNwluhwKSpJaNaw9
 YVEfYbuI0bJqwv/58fmQ3WcBOLCmw7Ft8k5rRts1eRq5J0l4TxSEOtC2V3Dzu2yTYQxj
 QWSSU/sxK6bxcW6l/6ym8+rbkbDcdy/tXzPKQwH3pwNlm+bLneHRmEtvX1pdZV141Iqb
 eKg/KiigFAIyz7jiTO00w1K2HOHFenJTZwkBiqbc4DFmgHM33DqtSWJ189y05BXkLKZU
 8c4brKLxwh7yzAco8xcYGE3SpVr2c3ZY2OPYjj9RdGrtWWQ5WTtZ296w7BVyE8pozQ+Q
 rR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4W1wdtJXaib1zf5uxWKtxlJpgdZpJ9W1za6dB9nHvA=;
 b=BiKtw7/oDFI0RVydmj7rfGq2T0ivs+80Mj85l6C0tjKoBb6kdg4Eyyok8sIIT9B0UN
 ddHkKK2n+zYE1OTfdvD8ucTMxmvK9z5pknZhuIpvkiSVuRHVQdGvOsrAbVpou5rTgkPP
 rnoXc3qgZKs8zhNblJjczYDsK3q+GK9Im3KFFy+KEb4SsE4yHTDKqBX3L0AaliEYsVcd
 AqQz01zYqL+QFa/kNVFWK0UfxfEgRUHEghjLdBAWrxupibs1G4sDZQjBY2eeQQYF/O/W
 RZ4aWDaRIn3WNXrXga3Gud7tIzfx/k8oLitE/ua7D+n3aU7+YoMTv6ohEN0/jJTHDNlp
 USrA==
X-Gm-Message-State: AOAM531mPwO8FW9hDkJo4XIUGHkbseEHoUrSk2Nz+bbPy+KyzU3j2p8m
 vFevbhXKl69YRqF5xkVcuaEo94ziXmjkBQ==
X-Google-Smtp-Source: ABdhPJzJpmf13Dzf7eeTFUCerHM/4O3J9w9M056q8biN2uMfzFMaoFVL01QofUI47SXG2GpwvTUv8g==
X-Received: by 2002:a17:90a:d589:: with SMTP id
 v9mr10906950pju.61.1629314390944; 
 Wed, 18 Aug 2021 12:19:50 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/66] tcg: Expand MO_SIZE to 3 bits
Date: Wed, 18 Aug 2021 09:18:37 -1000
Message-Id: <20210818191920.390759-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have lacked expressive support for memory sizes larger
than 64-bits for a while.  Fixing that requires adjustment
to several points where we used this for array indexing,
and two places that develop -Wswitch warnings after the change.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h                | 14 +++++++++-----
 target/arm/translate-a64.c          |  2 +-
 tcg/tcg-op.c                        | 13 ++++++++-----
 target/s390x/tcg/translate_vx.c.inc |  2 +-
 tcg/aarch64/tcg-target.c.inc        |  4 ++--
 tcg/arm/tcg-target.c.inc            |  4 ++--
 tcg/i386/tcg-target.c.inc           |  4 ++--
 tcg/mips/tcg-target.c.inc           |  4 ++--
 tcg/ppc/tcg-target.c.inc            |  8 ++++----
 tcg/riscv/tcg-target.c.inc          |  4 ++--
 tcg/s390/tcg-target.c.inc           |  4 ++--
 tcg/sparc/tcg-target.c.inc          | 16 ++++++++--------
 12 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 529d07b02d..04264ffd6b 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -19,11 +19,15 @@ typedef enum MemOp {
     MO_16    = 1,
     MO_32    = 2,
     MO_64    = 3,
-    MO_SIZE  = 3,   /* Mask for the above.  */
+    MO_128   = 4,
+    MO_256   = 5,
+    MO_512   = 6,
+    MO_1024  = 7,
+    MO_SIZE  = 0x07,   /* Mask for the above.  */
 
-    MO_SIGN  = 4,   /* Sign-extended, otherwise zero-extended.  */
+    MO_SIGN  = 0x08,   /* Sign-extended, otherwise zero-extended.  */
 
-    MO_BSWAP = 8,   /* Host reverse endian.  */
+    MO_BSWAP = 0x10,   /* Host reverse endian.  */
 #ifdef HOST_WORDS_BIGENDIAN
     MO_LE    = MO_BSWAP,
     MO_BE    = 0,
@@ -59,8 +63,8 @@ typedef enum MemOp {
      * - an alignment to a specified size, which may be more or less than
      *   the access size (MO_ALIGN_x where 'x' is a size in bytes);
      */
-    MO_ASHIFT = 4,
-    MO_AMASK = 7 << MO_ASHIFT,
+    MO_ASHIFT = 5,
+    MO_AMASK = 0x7 << MO_ASHIFT,
 #ifdef NEED_CPU_H
 #ifdef TARGET_ALIGNED_ONLY
     MO_ALIGN = 0,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422e2ac0c9..247c9672be 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1045,7 +1045,7 @@ static void read_vec_element(DisasContext *s, TCGv_i64 tcg_dest, int srcidx,
                              int element, MemOp memop)
 {
     int vect_off = vec_reg_offset(s, srcidx, element, memop & MO_SIZE);
-    switch (memop) {
+    switch ((unsigned)memop) {
     case MO_8:
         tcg_gen_ld8u_i64(tcg_dest, cpu_env, vect_off);
         break;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c754396575..e01f68f44d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2780,10 +2780,13 @@ static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
         }
         break;
     case MO_64:
-        if (!is64) {
-            tcg_abort();
+        if (is64) {
+            op &= ~MO_SIGN;
+            break;
         }
-        break;
+        /* fall through */
+    default:
+        g_assert_not_reached();
     }
     if (st) {
         op &= ~MO_SIGN;
@@ -3095,7 +3098,7 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
 # define WITH_ATOMIC64(X)
 #endif
 
-static void * const table_cmpxchg[16] = {
+static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_8] = gen_helper_atomic_cmpxchgb,
     [MO_16 | MO_LE] = gen_helper_atomic_cmpxchgw_le,
     [MO_16 | MO_BE] = gen_helper_atomic_cmpxchgw_be,
@@ -3297,7 +3300,7 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
 }
 
 #define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                \
-static void * const table_##NAME[16] = {                                \
+static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] = {          \
     [MO_8] = gen_helper_atomic_##NAME##b,                               \
     [MO_16 | MO_LE] = gen_helper_atomic_##NAME##w_le,                   \
     [MO_16 | MO_BE] = gen_helper_atomic_##NAME##w_be,                   \
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 0afa46e463..28bf5a23b6 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -67,7 +67,7 @@ static void read_vec_element_i64(TCGv_i64 dst, uint8_t reg, uint8_t enr,
 {
     const int offs = vec_reg_offset(reg, enr, memop & MO_SIZE);
 
-    switch (memop) {
+    switch ((unsigned)memop) {
     case ES_8:
         tcg_gen_ld8u_i64(dst, cpu_env, offs);
         break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 5924977b42..6f43c048a5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1547,7 +1547,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[4] = {
+static void * const qemu_ld_helpers[MO_SIZE + 1] = {
     [MO_8]  = helper_ret_ldub_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
     [MO_16] = helper_be_lduw_mmu,
@@ -1564,7 +1564,7 @@ static void * const qemu_ld_helpers[4] = {
  *                                     uintxx_t val, TCGMemOpIdx oi,
  *                                     uintptr_t ra)
  */
-static void * const qemu_st_helpers[4] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_8]  = helper_ret_stb_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
     [MO_16] = helper_be_stw_mmu,
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 007ceee68e..8939b2c2da 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1393,7 +1393,7 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[8] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
@@ -1414,7 +1414,7 @@ static void * const qemu_ld_helpers[8] = {
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
  *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[4] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_8]   = helper_ret_stb_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
     [MO_16] = helper_be_stw_mmu,
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 98d924b91a..5fd4e4392f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1610,7 +1610,7 @@ static void tcg_out_nopn(TCGContext *s, int n)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[16] = {
+static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_LEUW] = helper_le_lduw_mmu,
     [MO_LEUL] = helper_le_ldul_mmu,
@@ -1623,7 +1623,7 @@ static void * const qemu_ld_helpers[16] = {
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
  *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[16] = {
+static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
     [MO_LEUW] = helper_le_stw_mmu,
     [MO_LEUL] = helper_le_stl_mmu,
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bf0eb84e2d..cc279205d6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1037,7 +1037,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 #if defined(CONFIG_SOFTMMU)
 #include "../tcg-ldst.c.inc"
 
-static void * const qemu_ld_helpers[16] = {
+static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
     [MO_LEUW] = helper_le_lduw_mmu,
@@ -1054,7 +1054,7 @@ static void * const qemu_ld_helpers[16] = {
 #endif
 };
 
-static void * const qemu_st_helpers[16] = {
+static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
     [MO_LEUW] = helper_le_stw_mmu,
     [MO_LEUL] = helper_le_stl_mmu,
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0f4665213..3fef2aa6b2 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1916,7 +1916,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 #endif
 }
 
-static const uint32_t qemu_ldx_opc[16] = {
+static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO_BSWAP) + 1] = {
     [MO_UB] = LBZX,
     [MO_UW] = LHZX,
     [MO_UL] = LWZX,
@@ -1929,7 +1929,7 @@ static const uint32_t qemu_ldx_opc[16] = {
     [MO_BSWAP | MO_Q]  = LDBRX,
 };
 
-static const uint32_t qemu_stx_opc[16] = {
+static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_UB] = STBX,
     [MO_UW] = STHX,
     [MO_UL] = STWX,
@@ -1950,7 +1950,7 @@ static const uint32_t qemu_exts_opc[4] = {
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[16] = {
+static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_LEUW] = helper_le_lduw_mmu,
     [MO_LEUL] = helper_le_ldul_mmu,
@@ -1963,7 +1963,7 @@ static void * const qemu_ld_helpers[16] = {
 /* helper signature: helper_st_mmu(CPUState *env, target_ulong addr,
  *                                 uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[16] = {
+static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
     [MO_LEUW] = helper_le_stw_mmu,
     [MO_LEUL] = helper_le_stl_mmu,
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c16f96b401..6264e58b3a 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -852,7 +852,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[8] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
     [MO_UB] = helper_ret_ldub_mmu,
     [MO_SB] = helper_ret_ldsb_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
@@ -878,7 +878,7 @@ static void * const qemu_ld_helpers[8] = {
  *                                     uintxx_t val, TCGMemOpIdx oi,
  *                                     uintptr_t ra)
  */
-static void * const qemu_st_helpers[4] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_8]   = helper_ret_stb_mmu,
 #ifdef HOST_WORDS_BIGENDIAN
     [MO_16] = helper_be_stw_mmu,
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index b82cf19f09..67a2ba5ff3 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -350,7 +350,7 @@ static const uint8_t tcg_cond_to_ltr_cond[] = {
 };
 
 #ifdef CONFIG_SOFTMMU
-static void * const qemu_ld_helpers[16] = {
+static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
     [MO_LEUW] = helper_le_lduw_mmu,
@@ -365,7 +365,7 @@ static void * const qemu_ld_helpers[16] = {
     [MO_BEQ]  = helper_be_ldq_mmu,
 };
 
-static void * const qemu_st_helpers[16] = {
+static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
     [MO_LEUW] = helper_le_stw_mmu,
     [MO_LEUL] = helper_le_stl_mmu,
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 688827968b..b9bce29282 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -847,8 +847,8 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 }
 
 #ifdef CONFIG_SOFTMMU
-static const tcg_insn_unit *qemu_ld_trampoline[16];
-static const tcg_insn_unit *qemu_st_trampoline[16];
+static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1];
+static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1];
 
 static void emit_extend(TCGContext *s, TCGReg r, int op)
 {
@@ -875,7 +875,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
 
 static void build_trampolines(TCGContext *s)
 {
-    static void * const qemu_ld_helpers[16] = {
+    static void * const qemu_ld_helpers[] = {
         [MO_UB]   = helper_ret_ldub_mmu,
         [MO_SB]   = helper_ret_ldsb_mmu,
         [MO_LEUW] = helper_le_lduw_mmu,
@@ -887,7 +887,7 @@ static void build_trampolines(TCGContext *s)
         [MO_BEUL] = helper_be_ldul_mmu,
         [MO_BEQ]  = helper_be_ldq_mmu,
     };
-    static void * const qemu_st_helpers[16] = {
+    static void * const qemu_st_helpers[] = {
         [MO_UB]   = helper_ret_stb_mmu,
         [MO_LEUW] = helper_le_stw_mmu,
         [MO_LEUL] = helper_le_stl_mmu,
@@ -900,7 +900,7 @@ static void build_trampolines(TCGContext *s)
     int i;
     TCGReg ra;
 
-    for (i = 0; i < 16; ++i) {
+    for (i = 0; i < ARRAY_SIZE(qemu_ld_helpers); ++i) {
         if (qemu_ld_helpers[i] == NULL) {
             continue;
         }
@@ -928,7 +928,7 @@ static void build_trampolines(TCGContext *s)
         tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O7, ra);
     }
 
-    for (i = 0; i < 16; ++i) {
+    for (i = 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
         if (qemu_st_helpers[i] == NULL) {
             continue;
         }
@@ -1110,7 +1110,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
 }
 #endif /* CONFIG_SOFTMMU */
 
-static const int qemu_ld_opc[16] = {
+static const int qemu_ld_opc[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = LDUB,
     [MO_SB]   = LDSB,
 
@@ -1127,7 +1127,7 @@ static const int qemu_ld_opc[16] = {
     [MO_LEQ]  = LDX_LE,
 };
 
-static const int qemu_st_opc[16] = {
+static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = STB,
 
     [MO_BEUW] = STH,
-- 
2.25.1


