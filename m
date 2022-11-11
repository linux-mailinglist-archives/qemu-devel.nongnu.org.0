Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE28625515
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOjf-0001YA-Ix; Fri, 11 Nov 2022 02:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjc-0001Vx-MW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:56 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjY-00018y-Gd
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:56 -0500
Received: by mail-pl1-x629.google.com with SMTP id p21so3630152plr.7
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tmU0MjgiKsSxPUHRGzRVInhdiWEFNbDXapXPwryhCsg=;
 b=yaUQEB0gq46RYQK0mf39X6Aq2Hv+bnqOc5M1Vs625hvQkVHae8evPMPA5c4Yzr51Ew
 uQTRW0+CnqdZ7UuKEDXpymHgppESt5IYW8yMZLji0Z7b0MmGXZrAlfNXvl4V5llBDeUK
 It9fHrjtNyrcoUIo/r8JdPG7XqSJmWEECi3zAn+ElEK9FjIIrnLEHAfwV6B1RYJbf16I
 JJMolrZJAaDQs/IuZY7tSWwvsC/WLeiaqC0VE3+acGhuuiBfmUfr+K9odYDToPDwZbrH
 rhYEmMCyif+QIi14qKzOqNg2pm7uPFerl8AVaH98aGsGsg3k+QBLr6/H20hrr2sk6pKy
 CZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmU0MjgiKsSxPUHRGzRVInhdiWEFNbDXapXPwryhCsg=;
 b=yTFlnJFjHGOTAtFlbuCFVPiOYbt7TRQ1MJ7d4narsOplUARBb9QjNmbtVWZSv5gLAf
 RxKXIlc8ofGdiJEY7rkVvpEC5PL0yQi1P5q9nQQQsJO1L27jLw2kZHW8qWjkG20qVgcV
 DVFiCQ0dENf60iIEll+1zWKP+pCWYqDjR8b8jLh/kxvTXOzZXSJ7gLJX+iPUkIA5fuhS
 FGrF/KdV+lBJAo42JxjsqyJOaF6wTD4uGKibBxedBN1paD4+KywKXPoeCOcq9mWTDu5D
 PblkPOTBDwJTXLaZj9PFnvNPOVVN13DreWHUFknpMAKFG9lgjCUj+K26+4wFH4SzUYUk
 E7xw==
X-Gm-Message-State: ANoB5pnh/v7M+J41y4Kywe14ok8qNg/0oY6pSLlPG4ihyPcGSTUD4kR3
 WfBCKsUjWElqYgaftQhjg9VCqc5k5fjTHuTZ
X-Google-Smtp-Source: AA0mqf4FGn/n/chPWQOG5wYOKqtlW7FOOS7KW4G4do61vjvOn4gOJb6A2G90p5poefFWOTMI+N7U7w==
X-Received: by 2002:a17:902:6ac6:b0:188:62b9:a6ef with SMTP id
 i6-20020a1709026ac600b0018862b9a6efmr1490594plt.4.1668152751110; 
 Thu, 10 Nov 2022 23:45:51 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b001869f2120a6sm983802plg.108.2022.11.10.23.45.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:45:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 44/45] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Date: Fri, 11 Nov 2022 17:41:00 +1000
Message-Id: <20221111074101.2069454-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index 55ecedb66f..66f9c894ad 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3293,6 +3293,8 @@ typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
                                   TCGv_i64, TCGv_i64, TCGv_i32);
+typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
+                                   TCGv_i128, TCGv_i128, TCGv_i32);
 typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
@@ -3303,6 +3305,11 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
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
@@ -3312,6 +3319,8 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_32 | MO_BE] = gen_helper_atomic_cmpxchgl_be,
     WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_cmpxchgq_le)
     WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_cmpxchgq_be)
+    WITH_ATOMIC128([MO_128 | MO_LE] = gen_helper_atomic_cmpxchgo_le)
+    WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
 };
 
 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
@@ -3410,6 +3419,82 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
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
+    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
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


