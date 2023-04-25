Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126766EE892
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:49:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOVC-00005k-Di; Tue, 25 Apr 2023 15:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOV9-0008VJ-W7
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:39:00 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOV7-0006JK-MS
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:38:59 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4efeea05936so3416969e87.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451536; x=1685043536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eQHDj9xrTiwfdZjyYUtTq2brqOmUSNalCk4uz3zgSM=;
 b=Xrbi6Zh2Cw4h/lCuxJctbKpliacEWKA3VcJ2pbQq+q9yahGj5ZpbDsvPDG0hzkzAX+
 GzgEIBrRTGGJEVsmxSRhgg82Cn4UfIX2G0YP49cTZSUl9wGvPHgyhIKsQVQZhPwQZKVl
 sKf/rxTcSuXWp0uXIy6T00qUKvsaGZ/ok6BdqOp1L6bMut1g3kOuq0B2f2pE03HIVFpM
 +Z3gUWEfKshugOusLCvPhI9zfJi96KhqwVCSRdNwAh3R/mOY8/cNyKfxkeSvfor8T92r
 mnUH9SW7Fvu1DWLOoBjaswTC0f8/4HSpqQks5WykN8NZlYbTjAzw2dSOMW4YzqAl/SgO
 LmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451536; x=1685043536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eQHDj9xrTiwfdZjyYUtTq2brqOmUSNalCk4uz3zgSM=;
 b=e6jFSAojWTHz3VDDTkzC79RU8UZi9WovHE2toSSlSbDp2jUng6ch0+zcYbfMZobv6a
 AqBe5VS/7nFFhqvCo4f668d96oDCxREqDClgK34CUHb6XAfgyTz5ky7yxc6lP9ekUtLb
 0boz4RadPwyN2aw7hDC6/ospk9y5ZsCRhYSiqdIxXg+4wBxycw05W7caZfQW5iVPdGLc
 VIRg6XmVNGIKsa0LbFGhPWlp/PTeYOuIr5A1NNl5XNIwNpUwWGJe0RO94iJAcHe9XJjR
 vc10jdA8EUfg7iSuTaGGiZ18eCnJ6hVi0/wS+sPWGDhVKrlhrwrM4+MXbhLpXeyDTWNC
 acqA==
X-Gm-Message-State: AAQBX9cn0jwpHBTXJOWl5h6KOEbY5l4gK9YGnkwY3CE0Qh859TL+UyJh
 Ie+7UdKJ/F/Z21c4PLcvGs6mMIn9CW5Ipb7RgyvVLw==
X-Google-Smtp-Source: AKy350bRpybL9ZPmvC/vfk0dpbKbrSMaU0jCQaAqyrsDotSkw9uMKvjaK9Nc25zkLrb8rNs4+S2AJw==
X-Received: by 2002:a05:6512:405:b0:4eb:3021:3a8f with SMTP id
 u5-20020a056512040500b004eb30213a8fmr5528772lfk.61.1682451536024; 
 Tue, 25 Apr 2023 12:38:56 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:38:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 40/57] tcg: Add INDEX_op_qemu_{ld,st}_i128
Date: Tue, 25 Apr 2023 20:31:29 +0100
Message-Id: <20230425193146.2106111-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x131.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
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
 docs/devel/tcg-ops.rst       | 11 +++---
 14 files changed, 101 insertions(+), 10 deletions(-)

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
index 85f22458c9..06d3181fd0 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3216,7 +3216,7 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
 
 void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3224,9 +3224,36 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
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
@@ -3269,7 +3296,7 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 
 void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3277,9 +3304,39 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
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
index 8216855810..07a9489b71 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1718,6 +1718,10 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_qemu_st8_i32:
         return TCG_TARGET_HAS_qemu_st8_i32;
 
+    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_st_i128:
+        return TCG_TARGET_HAS_qemu_ldst_i128;
+
     case INDEX_op_mov_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
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
-- 
2.34.1


