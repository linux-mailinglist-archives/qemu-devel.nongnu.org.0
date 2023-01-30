Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19876681D5F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1j-00020V-D9; Mon, 30 Jan 2023 16:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1g-0001ze-Gl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:20 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1e-0005cc-Ew
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so12468018pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YmjqRjimF5pBKzTT9PtXE7Qwz8sieC4JwIiThrHTeM=;
 b=tsBTVDI5Ybv+DkvHmyKqVDdBwjHW2wtU22PW+Mqti4iF2aJWmNkP+2CkvuA0eg+SDf
 qqFS2z9tOU7oXmDXCfLXCn8nyTym+s0k99r2Eko8qkhcfYa0ZH7J6rQR4N5Z5ScJvQmO
 Tvtirp0224nvG0dZYHQzG8fPLmbh7Z6tVr37LRrwmty2l39/dFtIcfYX0dyqaDHxaYvc
 eTHm0RLeaPsvdqJC8qrC5BBLzUhdzha3x05OOEgzH3O51CTPqzbt2WvRngi075y60oZv
 JTqZOcjMf/FPkfOYHQMM4da+XQqCKIvijPDWPPruwVWVF4kIrE+CoCj1n7E968ceOAZl
 v+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YmjqRjimF5pBKzTT9PtXE7Qwz8sieC4JwIiThrHTeM=;
 b=6P51i3XNEhUng/aeeLs4W2F34sSfznWIWth7fndUi29plOnaJ33WOcEkWb+h+iLBB+
 DcCQcTPGEvCP/UN2lxY3wS/ndkMvG12IhTnUCnje9Mn6XuQ7tXJ87ZWQNp7TI8iPglQ6
 hdxmZXjeUmk9Lcb1H6ua7mC8IfzH1hE9wPCD1QxFkUGKp5aE7FXMnYHvKQuA3RNn8QaM
 oXvSEYy3shJCSSted1UB4YhjnzrEc9V/flGAYc/NuFVxF6v/hM02KlWJ+RZ0W9H6qqgd
 n+5oVY3Lgp32q5acscNYtD6G/ByZ6pOR8FNxKN95vTQoZt/NEIO8Pq7lz1z5wGB0gK+6
 98nA==
X-Gm-Message-State: AO0yUKV9YsebkAdDPOzRXMeDp7PELgM50O6g0tM69NEwEGvEa27Gl6Pa
 glDXJvLLXanmkWj0DWRBcza2UOlex/NSDK4w
X-Google-Smtp-Source: AK7set+CZ138UyhXJcxnl6p9WXNqyDVkCZCk+Z4zckWGxRgj8InBujDY7JPecY2TjgHOhL8QMmd57Q==
X-Received: by 2002:a17:90b:3909:b0:22e:5ffa:2a34 with SMTP id
 ob9-20020a17090b390900b0022e5ffa2a34mr2358109pjb.36.1675115357569; 
 Mon, 30 Jan 2023 13:49:17 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 18/36] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
Date: Mon, 30 Jan 2023 11:48:26 -1000
Message-Id: <20230130214844.1158612-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221112042555.2622152-2-richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   6 ---
 target/arm/helper-a64.c    | 104 -------------------------------------
 target/arm/translate-a64.c |  60 ++++++++++++---------
 3 files changed, 35 insertions(+), 135 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..94065d1917 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -50,12 +50,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
 DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 77a8502b6b..7dbdb2c233 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -505,110 +505,6 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    Int128 newv = int128_make128(new_lo, new_hi);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_LEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_LEUQ, mem_idx);
-
-    o0 = cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
-    o1 = cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_le_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
-        cpu_stq_le_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    Int128 cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    Int128 newv = int128_make128(new_hi, new_lo);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_BEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_BEUQ, mem_idx);
-
-    o1 = cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
-    o0 = cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_be_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-        cpu_stq_be_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
-
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    newv = int128_make128(new_hi, new_lo);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
 /* Writes back the old data into Rs.  */
 void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
                               uint64_t new_lo, uint64_t new_hi)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 52b1b8a1f0..bd97666ddc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2586,32 +2586,42 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                        get_mem_index(s),
                                        MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
-        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-            if (!HAVE_CMPXCHG128) {
-                gen_helper_exit_atomic(cpu_env);
-                /*
-                 * Produce a result so we have a well-formed opcode
-                 * stream when the following (dead) code uses 'tmp'.
-                 * TCG will remove the dead ops for us.
-                 */
-                tcg_gen_movi_i64(tmp, 0);
-            } else if (s->be_data == MO_LE) {
-                gen_helper_paired_cmpxchg64_le_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            } else {
-                gen_helper_paired_cmpxchg64_be_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            }
-        } else if (s->be_data == MO_LE) {
-            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         } else {
-            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
+            TCGv_i128 t16 = tcg_temp_new_i128();
+            TCGv_i128 c16 = tcg_temp_new_i128();
+            TCGv_i64 a, b;
+
+            if (s->be_data == MO_LE) {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt), cpu_reg(s, rt2));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_val,
+                                        cpu_exclusive_high);
+            } else {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt2), cpu_reg(s, rt));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_high,
+                                        cpu_exclusive_val);
+            }
+
+            tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
+                                        get_mem_index(s),
+                                        MO_128 | MO_ALIGN | s->be_data);
+            tcg_temp_free_i128(c16);
+
+            a = tcg_temp_new_i64();
+            b = tcg_temp_new_i64();
+            if (s->be_data == MO_LE) {
+                tcg_gen_extr_i128_i64(a, b, t16);
+            } else {
+                tcg_gen_extr_i128_i64(b, a, t16);
+            }
+
+            tcg_gen_xor_i64(a, a, cpu_exclusive_val);
+            tcg_gen_xor_i64(b, b, cpu_exclusive_high);
+            tcg_gen_or_i64(tmp, a, b);
+            tcg_temp_free_i64(a);
+            tcg_temp_free_i64(b);
+            tcg_temp_free_i128(t16);
+
+            tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
         }
     } else {
         tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
-- 
2.34.1


