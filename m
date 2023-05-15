Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447B703079
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJN-0002bR-GU; Mon, 15 May 2023 10:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-000712-FK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0004rx-JB
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:33 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so120072335ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161225; x=1686753225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WK5/owdhFhhV3tBupHbnhKWf3MdxcfPHINI/58Czec=;
 b=gOm+YL7nEWxfrAk7+EGGPth9b+zz7xZLT2wZJVi0KK7cjsIhrzJMvIU+OpKSbJfbpt
 acrMNEz42i3wi5OTNSwxsFgEb4CA100Yp4BNQxKvH/QXynxPndpthZZP+0kV7ISmz/C4
 Cf5PUWlp4E+R9i5PTktuxz5WksrlU14ZPnLD4YHmqVpK0eIN25hiFe9STGWbgjhH1Ev6
 cURAE5AykFyPkJ1kHYglK/LaeJj9VKqvoGfx+aIdcMDDedwEIBke7t85LNmul2sBt2op
 4N4d07je1sbpyVZ9CAAcWXePOL8pz83LzSugOKA/6nB4SbpaWPLYSMrf1iAHPOKctYuH
 eyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161225; x=1686753225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WK5/owdhFhhV3tBupHbnhKWf3MdxcfPHINI/58Czec=;
 b=ahed0vTaGRHvzlCZX19ng20C7EdMEJHquYLdsG4oTn2pILUJaPNiRUl/2K/4jb1PBL
 DLjfJ/NtFaQcM2dsMBYy1GL93YCeX59iTHp/mcKnFXceXIa6Hj3B2guq9g4sqMGBoGJI
 pYYVfMEuBnvAKkiHO/qmz7JjWldcZUScKBUgEnTPnEn8a6Jtz9a/YKCZLMuA239a37zo
 iRpDpDxkEPlanHZgIRwpzkz8JtetUzh8ZfErbBR5fyT/hqIiyNChLGY88oK1Jy7PBAm0
 w07Z+B+rHaweEstfr7Pk0mILu+TygN6xBhmqMC/Ilv/Mgt8nXqze8uBFuaOOMnyYJ3Fc
 ARIQ==
X-Gm-Message-State: AC+VfDzs4xamsBFPGIwPmt/fdMJbvVRIZNPZdLxse6fCyFfdujkVci0A
 gP+fb0xRYLWdnL5WIaBQ0mZKhtSUtHW1+1vkHLg=
X-Google-Smtp-Source: ACHHUZ4lGy58Z3KTlQ6+nrrmuY/swETeoAjkGwT8PZW+vK02K7w65ZbSXGBrqetT99boxSdc5sp1YA==
X-Received: by 2002:a17:902:e5c1:b0:1ab:1bb0:126d with SMTP id
 u1-20020a170902e5c100b001ab1bb0126dmr46244986plf.23.1684161224683; 
 Mon, 15 May 2023 07:33:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 35/54] tcg: Add INDEX_op_qemu_{ld,st}_i128
Date: Mon, 15 May 2023 07:32:54 -0700
Message-Id: <20230515143313.734053-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Add opcodes for backend support for 128-bit memory operations.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst       | 11 +++---
 include/tcg/tcg-opc.h        |  8 +++++
 tcg/aarch64/tcg-target.h     |  2 ++
 tcg/arm/tcg-target.h         |  2 ++
 tcg/i386/tcg-target.h        |  2 ++
 tcg/loongarch64/tcg-target.h |  1 +
 tcg/mips/tcg-target.h        |  2 ++
 tcg/ppc/tcg-target.h         |  2 ++
 tcg/riscv/tcg-target.h       |  2 ++
 tcg/s390x/tcg-target.h       |  2 ++
 tcg/sparc64/tcg-target.h     |  2 ++
 tcg/tci/tcg-target.h         |  2 ++
 tcg/tcg-op.c                 | 69 ++++++++++++++++++++++++++++++++----
 tcg/tcg.c                    |  4 +++
 14 files changed, 101 insertions(+), 10 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index f3f451b77f..6a166c5665 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -672,19 +672,20 @@ QEMU specific operations
        | This operation is optional. If the TCG backend does not implement the
          goto_ptr opcode, emitting this op is equivalent to emitting exit_tb(0).
 
-   * - qemu_ld_i32/i64 *t0*, *t1*, *flags*, *memidx*
+   * - qemu_ld_i32/i64/i128 *t0*, *t1*, *flags*, *memidx*
 
-       qemu_st_i32/i64 *t0*, *t1*, *flags*, *memidx*
+       qemu_st_i32/i64/i128 *t0*, *t1*, *flags*, *memidx*
 
        qemu_st8_i32 *t0*, *t1*, *flags*, *memidx*
 
      - | Load data at the guest address *t1* into *t0*, or store data in *t0* at guest
-         address *t1*.  The _i32/_i64 size applies to the size of the input/output
+         address *t1*.  The _i32/_i64/_i128 size applies to the size of the input/output
          register *t0* only.  The address *t1* is always sized according to the guest,
          and the width of the memory operation is controlled by *flags*.
        |
        | Both *t0* and *t1* may be split into little-endian ordered pairs of registers
-         if dealing with 64-bit quantities on a 32-bit host.
+         if dealing with 64-bit quantities on a 32-bit host, or 128-bit quantities on
+         a 64-bit host.
        |
        | The *memidx* selects the qemu tlb index to use (e.g. user or kernel access).
          The flags are the MemOp bits, selecting the sign, width, and endianness
@@ -693,6 +694,8 @@ QEMU specific operations
        | For a 32-bit host, qemu_ld/st_i64 is guaranteed to only be used with a
          64-bit memory access specified in *flags*.
        |
+       | For qemu_ld/st_i128, these are only supported for a 64-bit host.
+       |
        | For i386, qemu_st8_i32 is exactly like qemu_st_i32, except the size of
          the memory operation is known to be 8-bit.  This allows the backend to
          provide a different set of register constraints.
diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index dd444734d9..94cf7c5d6a 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -213,6 +213,14 @@ DEF(qemu_st8_i32, 0, TLADDR_ARGS + 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS |
     IMPL(TCG_TARGET_HAS_qemu_st8_i32))
 
+/* Only for 64-bit hosts at the moment. */
+DEF(qemu_ld_i128, 2, 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+DEF(qemu_st_i128, 0, 3, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+
 /* Host vector support.  */
 
 #define IMPLVEC  TCG_OPF_VECTOR | IMPL(TCG_TARGET_MAYBE_vec)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 378e01d9d8..74ee2ed255 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -129,6 +129,8 @@ extern bool have_lse2;
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_HAS_v64              1
 #define TCG_TARGET_HAS_v128             1
 #define TCG_TARGET_HAS_v256             0
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 4c2d3332d5..65efc538f4 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -125,6 +125,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_HAS_v64              use_neon_instructions
 #define TCG_TARGET_HAS_v128             use_neon_instructions
 #define TCG_TARGET_HAS_v256             0
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 8fe6958abd..943af6775e 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -194,6 +194,8 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /* We do not support older SSE systems, only beginning with AVX1.  */
 #define TCG_TARGET_HAS_v64              have_avx1
 #define TCG_TARGET_HAS_v128             have_avx1
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 75c3d80ed2..482901ac15 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -168,6 +168,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 47088af9cb..7277a117ef 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -204,6 +204,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO           0
 #define TCG_TARGET_NEED_LDST_LABELS
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d55f0266bb..0914380bd7 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -149,6 +149,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /*
  * While technically Altivec could support V64, it has no 64-bit store
  * instruction and substituting two 32-bit stores makes the generated
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index dece3b3c27..494c986b49 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -163,6 +163,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index fe05680124..170007bea5 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -140,6 +140,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128 0
+
 #define TCG_TARGET_HAS_v64            HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v256           0
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index f6cd86975a..31c5537379 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -151,6 +151,8 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muluh_i64        use_vis3_instructions
 #define TCG_TARGET_HAS_mulsh_i64        0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_AREG0 TCG_REG_I0
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 364012e4d2..28dc6d5cfc 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -127,6 +127,8 @@
 #define TCG_TARGET_HAS_mulu2_i32        1
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /* Number of registers available. */
 #define TCG_TARGET_NB_REGS 16
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index b13ded10df..c419228cc4 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3205,7 +3205,7 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
 
 void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3213,9 +3213,36 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
 
-    if (use_two_i64_for_i128(memop)) {
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = TCGV128_HIGH(val);
+            hi = TCGV128_LOW(val);
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_ld_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_gen_bswap64_i64(lo, lo);
+            tcg_gen_bswap64_i64(hi, hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
@@ -3258,7 +3285,7 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 
 void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3266,9 +3293,39 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
 
-    if (use_two_i64_for_i128(memop)) {
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
+
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_bswap64_i64(lo, TCGV128_HIGH(val));
+            tcg_gen_bswap64_i64(hi, TCGV128_LOW(val));
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_st_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index dc1c0fdf2b..aa0a6c3763 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1735,6 +1735,10 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_qemu_st8_i32:
         return TCG_TARGET_HAS_qemu_st8_i32;
 
+    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_st_i128:
+        return TCG_TARGET_HAS_qemu_ldst_i128;
+
     case INDEX_op_mov_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
-- 
2.34.1


