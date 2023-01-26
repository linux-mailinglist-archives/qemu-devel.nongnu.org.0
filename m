Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F6167C3F2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2j-0000I9-79; Wed, 25 Jan 2023 23:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2X-0000H7-CL
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2U-0004Tm-LQ
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so692762pjb.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KA6GAAl0LWqnib35Fgiuyv4O2BgEdp+PTGgEvLoJegQ=;
 b=VR3fH+J9Ly7MfDH+uTuExdoGyiV+hwbyEnwOGaRYFejvw2evVmEs6FovTbxKpPS8ko
 8uFyeLyxISqc0V+OcCxFwHT95vjQ1fZYGnsud3O8bANSW4v3dpCO8XXy5XRr0K4nFMVv
 ml1725mc5Ut7PI0JzRyXgVBLFg3frQRExuRfTgHm0jHKIfDJDOUZLmwNoELkWFy1adQ9
 Zjf3R8lwteDCSYA6SNSjvTiGZestc73N16+hKixI5qQSN1yCmZ/bh0R/aos/lNCkgoWr
 kS8rRtMTW4VTw4FQMG3sTYmC5GyamLk/k8zDgAyGmp8UL7FVUc0viTdfT41pb1qk30qq
 ORZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KA6GAAl0LWqnib35Fgiuyv4O2BgEdp+PTGgEvLoJegQ=;
 b=Y46O2LCp8lzZBxynOU730w6HK9Sb5Bij6hCoaHU3ktpBJCPj9aNo7ECBNX3+k1hW0g
 hgXM9sPOWLeOuWO0Vrz1GIhDbHD41WUh9Bh9jZl1BSvm0IGnvndqb4jNB8GPX38kiQUI
 hP2PBNBJL1O39kqjDOG/zy0jmvfS2Uqq8Rps9Ar8akIh5z/ULmvovVO/SBUiIV1vw6UW
 /THh/kKVXsMqLL+olf6+uXP9z+ENnC7Asw0PAJqnlNXDCbp+G9KmI3Xpr1JlhIUJ13HV
 3+s3j4JpXj9S1IE95mslQSiskl0AhMpu3jaNQ+4vjlpi+7NS6KkeQVFuIvKOx1KvJvZe
 Qtvg==
X-Gm-Message-State: AFqh2kooFKzeK+FNvIlOJeXzO/fC9Mx0zkGcUH0lSIuD+1S3US6B0hJW
 jVXGMaKmAu+2vk4IHHc7zjIKjbVpSWUwEG76EsM=
X-Google-Smtp-Source: AMrXdXt3EWZ4i2MHAZpha/hCTSahxFyr5rLXYko1zUygxJsr6fEO1LKHRt39eOC/hT2q/vB+fxKFtQ==
X-Received: by 2002:a17:90a:738d:b0:229:3d1c:3612 with SMTP id
 j13-20020a17090a738d00b002293d1c3612mr35963820pjg.2.1674707937154; 
 Wed, 25 Jan 2023 20:38:57 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 19/36] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP
Date: Wed, 25 Jan 2023 18:38:07 -1000
Message-Id: <20230126043824.54819-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Message-Id: <20221112042555.2622152-3-richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  2 --
 target/arm/helper-a64.c    | 43 ---------------------------
 target/arm/translate-a64.c | 61 +++++++++++---------------------------
 3 files changed, 18 insertions(+), 88 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 94065d1917..ff56807247 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -50,8 +50,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
-DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 7dbdb2c233..0972a4bdd0 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -505,49 +505,6 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/* Writes back the old data into Rs.  */
-void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
-                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
-
-    env->xregs[rs] = int128_getlo(oldv);
-    env->xregs[rs + 1] = int128_gethi(oldv);
-}
-
-void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
-                              uint64_t new_hi, uint64_t new_lo)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-
-    env->xregs[rs + 1] = int128_getlo(oldv);
-    env->xregs[rs] = int128_gethi(oldv);
-}
-
 /*
  * AdvSIMD half-precision
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bd97666ddc..6678894ec7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2694,53 +2694,28 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_extr32_i64(s2, s1, cmp);
         }
         tcg_temp_free_i64(cmp);
-    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
-            if (s->be_data == MO_LE) {
-                gen_helper_casp_le_parallel(cpu_env, tcg_rs,
-                                            clean_addr, t1, t2);
-            } else {
-                gen_helper_casp_be_parallel(cpu_env, tcg_rs,
-                                            clean_addr, t1, t2);
-            }
-        } else {
-            gen_helper_exit_atomic(cpu_env);
-            s->base.is_jmp = DISAS_NORETURN;
-        }
     } else {
-        TCGv_i64 d1 = tcg_temp_new_i64();
-        TCGv_i64 d2 = tcg_temp_new_i64();
-        TCGv_i64 a2 = tcg_temp_new_i64();
-        TCGv_i64 c1 = tcg_temp_new_i64();
-        TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_constant_i64(0);
+        TCGv_i128 cmp = tcg_temp_new_i128();
+        TCGv_i128 val = tcg_temp_new_i128();
 
-        /* Load the two words, in memory order.  */
-        tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
-                            MO_64 | MO_ALIGN_16 | s->be_data);
-        tcg_gen_addi_i64(a2, clean_addr, 8);
-        tcg_gen_qemu_ld_i64(d2, a2, memidx, MO_64 | s->be_data);
+        if (s->be_data == MO_LE) {
+            tcg_gen_concat_i64_i128(val, t1, t2);
+            tcg_gen_concat_i64_i128(cmp, s1, s2);
+        } else {
+            tcg_gen_concat_i64_i128(val, t2, t1);
+            tcg_gen_concat_i64_i128(cmp, s2, s1);
+        }
 
-        /* Compare the two words, also in memory order.  */
-        tcg_gen_setcond_i64(TCG_COND_EQ, c1, d1, s1);
-        tcg_gen_setcond_i64(TCG_COND_EQ, c2, d2, s2);
-        tcg_gen_and_i64(c2, c2, c1);
+        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx,
+                                    MO_128 | MO_ALIGN | s->be_data);
+        tcg_temp_free_i128(val);
 
-        /* If compare equal, write back new data, else write back old data.  */
-        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
-        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
-        tcg_gen_qemu_st_i64(c1, clean_addr, memidx, MO_64 | s->be_data);
-        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);
-        tcg_temp_free_i64(a2);
-        tcg_temp_free_i64(c1);
-        tcg_temp_free_i64(c2);
-
-        /* Write back the data from memory to Rs.  */
-        tcg_gen_mov_i64(s1, d1);
-        tcg_gen_mov_i64(s2, d2);
-        tcg_temp_free_i64(d1);
-        tcg_temp_free_i64(d2);
+        if (s->be_data == MO_LE) {
+            tcg_gen_extr_i128_i64(s1, s2, cmp);
+        } else {
+            tcg_gen_extr_i128_i64(s2, s1, cmp);
+        }
+        tcg_temp_free_i128(cmp);
     }
 }
 
-- 
2.34.1


