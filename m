Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58543681D40
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1f-0001zE-3Q; Mon, 30 Jan 2023 16:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1d-0001yP-40
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:17 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1b-0005d3-77
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id h9so4499124plf.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8Vdz7avFq4oj2Z1iCchXlp/g7e7DbTcC83+zNbX15Y=;
 b=xyBuRwCMV7q44sLcXxf06jtZ1TeO7EShOTm22UN6EXLqgGgZkFJ6gtKTnpsgHBtNYD
 aQCe+KrjCGtXwlNCiuzz0nE6GzH1aCxft3x2XNy2xdj90NilX9464Io/ef6Y+69hwYb9
 Dlev7Sxg5akAA2NTnMNtU+sZKLBlQ3My5/DqgX5hRPU+eEyWKH3vbLyg9zGNV0eul5uL
 KRrULms/QPeBqbY53MwTD0iwlEBFmFB0/LK5NJnazE9nEyxvb2VT76LcGk2MixA9URgf
 kKL2QnGLcpMBw5XAYqxHbNAdAIt4Cq3w9iS+B6NrfXe9ZcyfcLFYUC0DgN7OfVvcBAya
 OcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8Vdz7avFq4oj2Z1iCchXlp/g7e7DbTcC83+zNbX15Y=;
 b=A27rNBpuJ5+YIZq9NktCj2W9fn3dgQnHTeUY+c22qptUm9HHH0nevaLXXbT79A8N4H
 QvPyMLbFEgPc6n42bRYDKW/n9QNKP6ADtSi4XPsqJxqczx2uxjA+OE+5xg3QY/4S+5tg
 dg4Zs4nKnLU0kWvAGPZZdDTQEcJGRooS/5AgJI+/V/tvAbx7kXtZJYVQo6P7BuR9OZdm
 MOt+/gRHMLkIZTLcZmGIXRaLZ/F4XZ/JyUSUjkia6UmYgNUPMgbFavi++c3LM6gAMlXZ
 FfDhtUIsQzWPZvPHrL1fRlAeTm81ENBIhOTR+yo/N6wxEgkYRlihVHAwwtThrFTzQdAO
 VDRw==
X-Gm-Message-State: AO0yUKXRddwBp0Df9sIaoc2mshu4rftDXLuftZ2xKjrKarzafe0y5qQg
 n/XvEPFbgzDr8RtYWSs4iEdt0RsWUcenOXQ5
X-Google-Smtp-Source: AK7set8p14L/x4U0a5vJXWCSfsiJ4OdFiHtObb0dWCQ3ZAK2vhS1x43iWAjJ+YeFDNBnEsjRUoPpfA==
X-Received: by 2002:a17:90b:4a0a:b0:22b:f24d:e83a with SMTP id
 kk10-20020a17090b4a0a00b0022bf24de83amr11258335pjb.12.1675115354360; 
 Mon, 30 Jan 2023 13:49:14 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Date: Mon, 30 Jan 2023 11:48:24 -1000
Message-Id: <20230130214844.1158612-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

This will allow targets to avoid rolling their own.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h       | 11 +++++
 include/tcg/tcg-op.h          |  5 +++
 tcg/tcg-op.c                  | 85 +++++++++++++++++++++++++++++++++++
 accel/tcg/atomic_common.c.inc | 45 +++++++++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 37cbd722bf..e141a6ab24 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -55,6 +55,17 @@ DEF_HELPER_FLAGS_5(atomic_cmpxchgq_be, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_5(atomic_cmpxchgq_le, TCG_CALL_NO_WG,
                    i64, env, tl, i64, i64, i32)
 #endif
+#ifdef CONFIG_CMPXCHG128
+DEF_HELPER_FLAGS_5(atomic_cmpxchgo_be, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+DEF_HELPER_FLAGS_5(atomic_cmpxchgo_le, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+#endif
+
+DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_be, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_le, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
 
 #ifdef CONFIG_ATOMIC64
 #define GEN_ATOMIC_HELPERS(NAME)                                  \
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index e5f5b63c37..31bf3d287e 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -907,6 +907,11 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
                                 TCGArg, MemOp);
 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
                                 TCGArg, MemOp);
+void tcg_gen_atomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
+                                 TCGArg, MemOp);
+
+void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
+                                    TCGArg, MemOp);
 
 void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp);
 void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 33ef325f6e..5811ecd3e7 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3295,6 +3295,8 @@ typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
                                   TCGv_i64, TCGv_i64, TCGv_i32);
+typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
+                                   TCGv_i128, TCGv_i128, TCGv_i32);
 typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
@@ -3305,6 +3307,11 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
 #else
 # define WITH_ATOMIC64(X)
 #endif
+#ifdef CONFIG_CMPXCHG128
+# define WITH_ATOMIC128(X) X,
+#else
+# define WITH_ATOMIC128(X)
+#endif
 
 static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_8] = gen_helper_atomic_cmpxchgb,
@@ -3314,6 +3321,8 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_32 | MO_BE] = gen_helper_atomic_cmpxchgl_be,
     WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_cmpxchgq_le)
     WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_cmpxchgq_be)
+    WITH_ATOMIC128([MO_128 | MO_LE] = gen_helper_atomic_cmpxchgo_le)
+    WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
 };
 
 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
@@ -3412,6 +3421,82 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
     }
 }
 
+void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                    TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* Inline expansion below is simply too large for 32-bit hosts. */
+        gen_atomic_cx_i128 gen = ((memop & MO_BSWAP) == MO_LE
+                                  ? gen_helper_nonatomic_cmpxchgo_le 
+                                  : gen_helper_nonatomic_cmpxchgo_be);
+        MemOpIdx oi = make_memop_idx(memop, idx);
+
+        tcg_debug_assert((memop & MO_SIZE) == MO_128);
+        tcg_debug_assert((memop & MO_SIGN) == 0);
+
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+    } else {
+        TCGv_i128 oldv = tcg_temp_new_i128();
+        TCGv_i128 tmpv = tcg_temp_new_i128();
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 z = tcg_constant_i64(0);
+
+        tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
+
+        /* Compare i128 */
+        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
+        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
+        tcg_gen_or_i64(t0, t0, t1);
+
+        /* tmpv = equal ? newv : oldv */
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
+                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
+                            TCGV128_HIGH(newv), TCGV128_HIGH(oldv));
+
+        /* Unconditional writeback. */
+        tcg_gen_qemu_st_i128(tmpv, addr, idx, memop);
+        tcg_gen_mov_i128(retv, oldv);
+
+        tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i128(tmpv);
+        tcg_temp_free_i128(oldv);
+    }
+}
+
+void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                 TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    gen_atomic_cx_i128 gen;
+
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
+        tcg_gen_nonatomic_cmpxchg_i128(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
+
+    tcg_debug_assert((memop & MO_SIZE) == MO_128);
+    tcg_debug_assert((memop & MO_SIGN) == 0);
+    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+
+    if (gen) {
+        MemOpIdx oi = make_memop_idx(memop, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+        return;
+    }
+
+    gen_helper_exit_atomic(cpu_env);
+
+    /*
+     * Produce a result for a well-formed opcode stream.  This satisfies
+     * liveness for set before used, which happens before this dead code
+     * is removed.
+     */
+    tcg_gen_movi_i64(TCGV128_LOW(retv), 0);
+    tcg_gen_movi_i64(TCGV128_HIGH(retv), 0);
+}
+
 static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                                 TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 6602d7689f..8f2ce43ee6 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -55,8 +55,53 @@ CMPXCHG_HELPER(cmpxchgq_be, uint64_t)
 CMPXCHG_HELPER(cmpxchgq_le, uint64_t)
 #endif
 
+#ifdef CONFIG_CMPXCHG128
+CMPXCHG_HELPER(cmpxchgo_be, Int128)
+CMPXCHG_HELPER(cmpxchgo_le, Int128)
+#endif
+
 #undef CMPXCHG_HELPER
 
+Int128 HELPER(nonatomic_cmpxchgo_be)(CPUArchState *env, target_ulong addr,
+                                     Int128 cmpv, Int128 newv, uint32_t oi)
+{
+#if TCG_TARGET_REG_BITS == 32
+    uintptr_t ra = GETPC();
+    Int128 oldv;
+
+    oldv = cpu_ld16_be_mmu(env, addr, oi, ra);
+    if (int128_eq(oldv, cmpv)) {
+        cpu_st16_be_mmu(env, addr, newv, oi, ra);
+    } else {
+        /* Even with comparison failure, still need a write cycle. */
+        probe_write(env, addr, 16, get_mmuidx(oi), ra);
+    }
+    return oldv;
+#else
+    g_assert_not_reached();
+#endif
+}
+
+Int128 HELPER(nonatomic_cmpxchgo_le)(CPUArchState *env, target_ulong addr,
+                                     Int128 cmpv, Int128 newv, uint32_t oi)
+{
+#if TCG_TARGET_REG_BITS == 32
+    uintptr_t ra = GETPC();
+    Int128 oldv;
+
+    oldv = cpu_ld16_le_mmu(env, addr, oi, ra);
+    if (int128_eq(oldv, cmpv)) {
+        cpu_st16_le_mmu(env, addr, newv, oi, ra);
+    } else {
+        /* Even with comparison failure, still need a write cycle. */
+        probe_write(env, addr, 16, get_mmuidx(oi), ra);
+    }
+    return oldv;
+#else
+    g_assert_not_reached();
+#endif
+}
+
 #define ATOMIC_HELPER(OP, TYPE) \
     TYPE HELPER(glue(atomic_,OP))(CPUArchState *env, target_ulong addr,  \
                                   TYPE val, uint32_t oi)                 \
-- 
2.34.1


