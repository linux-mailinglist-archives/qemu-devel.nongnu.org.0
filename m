Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771743DE54A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:26:36 +0200 (CEST)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm0h-0000Pj-FX
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpj-0003cU-93
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:15 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpg-0002Jw-Kx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:14 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so22128366plr.11
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4W1wdtJXaib1zf5uxWKtxlJpgdZpJ9W1za6dB9nHvA=;
 b=pQcF5m4SxFEx0K+R2qzEl2VC8/mhf5L2OMLiKuk6sxNvZzDEh3Z075rxcW/r4+YP7H
 wf88KGQnZYM8XOpo3wdBgmdbH4kpBeKWfACaeSt3CiHfN4NYVLl26eO1R2Fy0WGErzo/
 RysSCLtG3zS0/NRFFxR+VwkikiFM/zZh0OMmEzl1jxW9g8mw5CK0q8vXJs9lWKCj4rHc
 PMPGDljq3yRllZNfrKga2rFpylDfiVHwpRd0HA95uFOEjn+XYNqzpl7n3cbZGJ8iXHV3
 Hz729mLAoCiySfFEVMzhl+zySa/hgar4BFFM5TpOuj7Ubplm9muyJCxOv+28KYGOEaBI
 8Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4W1wdtJXaib1zf5uxWKtxlJpgdZpJ9W1za6dB9nHvA=;
 b=E/C5nyRMOB0FuFMWMqPoLOTy4hgqvLvzaUTvPerkom2b7MjVXblkQQvClN1NeCPkII
 Kce/FlQ+Coq62eV4QPF4PVNwyKvj5SIym5BfmzdYMF9lJM4RN5viY8ouN5EnGS0HFhan
 eKj87bLyS2IMZOyZJrUrXOpxs/sXDEpmvvufcftHMuK+vSVJ70rZbSWEGAjQlqOr6slr
 /k8xU7A19wGXLe2RptCBZJ0C8YEqR9jORL5CNtnaEjXk/S0/w0Ix6DafkxfiAuLQuAKo
 Dlv52ki5lJdVe70U4ripPA2wg5nt0hawttdWo94jzMu3mGs49stj/IhWJlyutAKDXwyp
 weKw==
X-Gm-Message-State: AOAM5315eBYjXef8xh9T/qBadLN5B8M1Tu3mRrh/w+cE/N/c66ayszYe
 XGFoJFGOAmFrg3DInEydk4pkamVRh+f8Ww==
X-Google-Smtp-Source: ABdhPJyHlF0iPWDISsoqStfKBjnS9oSEQjnxe0hQ1Vy0AnKm6lhU6GLCyiJ4sW/kGHWy8xRf8WSgKw==
X-Received: by 2002:a17:902:f253:b029:12c:438a:fa7b with SMTP id
 j19-20020a170902f253b029012c438afa7bmr16834804plc.22.1627964111380; 
 Mon, 02 Aug 2021 21:15:11 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/55] tcg: Expand MO_SIZE to 3 bits
Date: Mon,  2 Aug 2021 18:14:10 -1000
Message-Id: <20210803041443.55452-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


