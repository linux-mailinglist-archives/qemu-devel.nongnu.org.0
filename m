Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D0698AE0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTQ-0003Yr-Qs; Wed, 15 Feb 2023 21:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTO-0003Xa-AG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:14 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTL-0005nH-SJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:14 -0500
Received: by mail-pf1-x42e.google.com with SMTP id bw10so617727pfb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xEeXxyBFUOJQcE6gk7QAbWMV1Qps5GGYTHA+Vwaf6g=;
 b=TJzUOb0B0XyR0fuY/jEOjFSvQBr5hNmIsMU+j60yeaMu7/7okuQr6bsERt55rb863u
 6WhStLqRpINErBKtj6czQeQmOmYs9Ltcy/ETaYfDY4u9ZyrAXwi2U4TEkjKy79/QUbcH
 5N5hV9OFECDj8NtVRRzb/NWDDFWOTViov5+pVmm5H6wZo6J58eirsQIakKZKAZDYQrkm
 xXmTt6zPDjiuSugZH1w9E0lFQaqdQzAflYgRXgVPwrgeYHabc3UHW4AjF9CjuRDWStvS
 Y7BLdyUpdBzc7NVTy76oRRQuGq3a05d3RGA3tda2av/jDUYW4vAIOVAfxTZfT0kmYjlb
 5K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5xEeXxyBFUOJQcE6gk7QAbWMV1Qps5GGYTHA+Vwaf6g=;
 b=UX5fgVAlbNRm53n0RGSoSkkn4ZZcrBAxvhyvMLpmH85QD6Dzum21B8GX9lvc1V+DQn
 0mPKXbiXV38xuToYQ6vksoigVmybP8YUhhJYdnck43an3JtEHf/nHHNN07Gmuv2MRDMN
 ltaaRQkjmBCbRnMNh/Ff5J9jGPEKkRDPJBVOIek9ki/uYp9U9poqhq6W3vgoJZDA6zbl
 OQLw0BwRPijX/o9vsGxhz41+cxxO4Spej413HjR2JTJjfbRYBuj04gHZ4ghnuBXmU2BE
 hXJ6333chhne5iKrYkj89W1O8MaLTGEq7KHi8JEzPuXunY3UsfR9VGb3xrn4o8CLLV2W
 k8og==
X-Gm-Message-State: AO0yUKXPqLpRs7awklaYnSfVylf031ZEPL4KeOiXqde5ME/MCMrONbb0
 1Ian3PjKbgvonrp9I/DCBNeJa918ojRfEGB97WY=
X-Google-Smtp-Source: AK7set8EDUH7aA+RZBohglsdLcfSIgtrTjtpoSCJrgRDMArXPkKWfZajeUu7t5mATo9xTYl7eENC6A==
X-Received: by 2002:aa7:96af:0:b0:592:4502:fb0 with SMTP id
 g15-20020aa796af000000b0059245020fb0mr3585161pfk.0.1676516290382; 
 Wed, 15 Feb 2023 18:58:10 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 21/30] tcg: Add INDEX_op_qemu_{ld,st}_i128
Date: Wed, 15 Feb 2023 16:57:30 -1000
Message-Id: <20230216025739.1211680-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Add opcodes for backend support for 128-bit memory operations.

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
 tcg/tcg-op.c                 | 67 ++++++++++++++++++++++++++++++++----
 tcg/tcg.c                    |  4 +++
 14 files changed, 99 insertions(+), 10 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 9adc0c9b6c..dd14dbe3fa 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -629,19 +629,20 @@ QEMU specific operations
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
@@ -650,6 +651,8 @@ QEMU specific operations
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
index 3c0b0d312d..60ed1f3042 100644
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
index def2a189e6..c8d1e32a27 100644
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
index 0421776cb8..6d8a536a32 100644
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
index 17b8193aa5..53ff05a75b 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -168,6 +168,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 68b11e4d48..bade6a50ee 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -203,6 +203,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index af81c5a57f..8d6939ee82 100644
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
index 0deb33701f..3949646f4b 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -167,6 +167,8 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a05b473117..a0546d77b4 100644
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
index ffe22b1d21..32733949bf 100644
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
index 7140a76a73..8cf6b87040 100644
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
index 93ac864aed..1784873314 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3203,7 +3203,7 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
 
 void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3211,9 +3211,35 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
 
-    if (use_two_i64_for_i128(memop)) {
+        /* TODO: Make TCG_TARGET_HAS_MEMORY_BSWAP fine grained. */
+        if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+            lo = TCGV128_HIGH(val);
+            hi = TCGV128_LOW(val);
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
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
+        if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+            tcg_gen_bswap64_i64(lo, lo);
+            tcg_gen_bswap64_i64(hi, hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
@@ -3256,7 +3282,7 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 
 void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3264,9 +3290,38 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
 
-    if (use_two_i64_for_i128(memop)) {
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+
+        /* TODO: Make TCG_TARGET_HAS_MEMORY_BSWAP fine grained. */
+        if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_bswap64_i64(lo, TCGV128_HIGH(val));
+            tcg_gen_bswap64_i64(hi, TCGV128_LOW(val));
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
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
+        if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 07522d50ee..a82fac66e3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1538,6 +1538,10 @@ bool tcg_op_supported(TCGOpcode op)
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


