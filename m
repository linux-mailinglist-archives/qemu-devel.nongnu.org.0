Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B6F66131B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZt-0005S9-QE; Sat, 07 Jan 2023 21:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZk-0005IX-PD
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:22 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ7-0004dl-47
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so9292383pjj.2
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmbx+CEV8/se/3fSeHkhg92bMZKxyEmSGS7vO3Es65k=;
 b=V7TA51xu0YrekvE5bYlUMOc9bVTyaRXvKmshwELH4W3Yz8wv+Jl47GOYNQAITlBu1s
 MpLcLBZhsD4J7IDz1foZtUn88h226C50XvfNM0GemIPzynwRMUTPRyyRoY9K5+MCsbj7
 bow9UuU5lo+K53si936Dk1rG3lt6oNs0qDm9zdRejb2vN+XveeOXqcjZx1nZ4Ua9ynVw
 8cTFWpGP+FCP3v3tWOboVYeOzn9m3TEjQZb2I+bmpDZuq1TsPC62qN7HaHHUTgXljYZd
 +vDvS9VwmPrXG7mqSvbFvUsId45cNnxB4tOi/+T9hYgV3coEIupFbE2/dYDG4hibN4gc
 jNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmbx+CEV8/se/3fSeHkhg92bMZKxyEmSGS7vO3Es65k=;
 b=Pi9+hEtc7Lni2tFDB2U0I3Sj8dJTAa5+0Pbu6stZ/L1+8fiUnlcIbXG6vRZtgcs7X+
 ZfoeTYDcelWPHqr+Y560f92ItveVWEG+J/XTlmurWJzK54R7RojUPEJ8LRA0XVE0Jxwb
 POKq9Hi6wNAA0Oy3DSBh2nfHfvwPAqkRQzA8EphL03cRtpYmTggJpMlTdc4Mf+9MHv0d
 AgYYR9d+VA5YiLCyRf7e3Wq213XCamTExocq2eCLgG9NZwipCvuyU7P8OYfA1VhAT0uh
 HrP/eNtIwohB3lg9GzQbj314jOTvD/cAro6k6djK4LgZEySlpJsvNPRVJOoa4kOI6UdF
 K+iQ==
X-Gm-Message-State: AFqh2krxNGtVsJRor8KRRfAFcusfwMKTeYgQ2mfMA7iVUm8S+Tn3qJd4
 MBVKOHCg0z0gh59mSK8mXVF2PG+LVRU1u5u9
X-Google-Smtp-Source: AMrXdXt23+d8sCttNfmCtj752BqPiwctOrcmTTLOW01Ch8j+GU86BHQunP6wor0juB0QByLoo9PCsA==
X-Received: by 2002:a17:902:8688:b0:192:fc9c:a238 with SMTP id
 g8-20020a170902868800b00192fc9ca238mr10509389plo.66.1673145459591; 
 Sat, 07 Jan 2023 18:37:39 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 17/36] tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
Date: Sat,  7 Jan 2023 18:37:00 -0800
Message-Id: <20230108023719.2466341-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Normally this is automatically handled by the CF_PARALLEL checks
with in tcg_gen_atomic_cmpxchg_i{32,64}, but x86 has a special
case of !PREFIX_LOCK where it always wants the non-atomic version.

Split these out so that x86 does not have to roll its own.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |   4 ++
 tcg/tcg-op.c         | 154 +++++++++++++++++++++++++++----------------
 2 files changed, 101 insertions(+), 57 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 31bf3d287e..839d91c0c7 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -910,6 +910,10 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
 void tcg_gen_atomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
                                  TCGArg, MemOp);
 
+void tcg_gen_nonatomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
+                                   TCGArg, MemOp);
+void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
+                                   TCGArg, MemOp);
 void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
                                     TCGArg, MemOp);
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 66f9c894ad..e7e4951a3c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3323,82 +3323,122 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
 };
 
+void tcg_gen_nonatomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
+                                   TCGv_i32 newv, TCGArg idx, MemOp memop)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_ext_i32(t2, cmpv, memop & MO_SIZE);
+
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_movcond_i32(TCG_COND_EQ, t2, t1, t2, newv, t1);
+    tcg_gen_qemu_st_i32(t2, addr, idx, memop);
+    tcg_temp_free_i32(t2);
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i32(retv, t1, memop);
+    } else {
+        tcg_gen_mov_i32(retv, t1);
+    }
+    tcg_temp_free_i32(t1);
+}
+
 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
                                 TCGv_i32 newv, TCGArg idx, MemOp memop)
 {
-    memop = tcg_canonicalize_memop(memop, 0, 0);
+    gen_atomic_cx_i32 gen;
+    MemOpIdx oi;
 
     if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
-        TCGv_i32 t1 = tcg_temp_new_i32();
-        TCGv_i32 t2 = tcg_temp_new_i32();
-
-        tcg_gen_ext_i32(t2, cmpv, memop & MO_SIZE);
-
-        tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
-        tcg_gen_movcond_i32(TCG_COND_EQ, t2, t1, t2, newv, t1);
-        tcg_gen_qemu_st_i32(t2, addr, idx, memop);
-        tcg_temp_free_i32(t2);
-
-        if (memop & MO_SIGN) {
-            tcg_gen_ext_i32(retv, t1, memop);
-        } else {
-            tcg_gen_mov_i32(retv, t1);
-        }
-        tcg_temp_free_i32(t1);
-    } else {
-        gen_atomic_cx_i32 gen;
-        MemOpIdx oi;
-
-        gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
-        tcg_debug_assert(gen != NULL);
-
-        oi = make_memop_idx(memop & ~MO_SIGN, idx);
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-
-        if (memop & MO_SIGN) {
-            tcg_gen_ext_i32(retv, retv, memop);
-        }
+        tcg_gen_nonatomic_cmpxchg_i32(retv, addr, cmpv, newv, idx, memop);
+        return;
     }
+
+    memop = tcg_canonicalize_memop(memop, 0, 0);
+    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+    tcg_debug_assert(gen != NULL);
+
+    oi = make_memop_idx(memop & ~MO_SIGN, idx);
+    gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i32(retv, retv, memop);
+    }
+}
+
+void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
+                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
+{
+    TCGv_i64 t1, t2;
+
+    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
+        tcg_gen_nonatomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
+                                      TCGV_LOW(newv), idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
+        }
+        return;
+    }
+
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
+
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
+    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
+    tcg_temp_free_i64(t2);
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i64(retv, t1, memop);
+    } else {
+        tcg_gen_mov_i64(retv, t1);
+    }
+    tcg_temp_free_i64(t1);
 }
 
 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
                                 TCGv_i64 newv, TCGArg idx, MemOp memop)
 {
-    memop = tcg_canonicalize_memop(memop, 1, 0);
-
     if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
-        TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_temp_new_i64();
+        tcg_gen_nonatomic_cmpxchg_i64(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
 
-        tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
-
-        tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
-        tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
-        tcg_gen_qemu_st_i64(t2, addr, idx, memop);
-        tcg_temp_free_i64(t2);
-
-        if (memop & MO_SIGN) {
-            tcg_gen_ext_i64(retv, t1, memop);
-        } else {
-            tcg_gen_mov_i64(retv, t1);
-        }
-        tcg_temp_free_i64(t1);
-    } else if ((memop & MO_SIZE) == MO_64) {
-#ifdef CONFIG_ATOMIC64
+    if ((memop & MO_SIZE) == MO_64) {
         gen_atomic_cx_i64 gen;
-        MemOpIdx oi;
 
+        memop = tcg_canonicalize_memop(memop, 1, 0);
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
-        tcg_debug_assert(gen != NULL);
+        if (gen) {
+            MemOpIdx oi = make_memop_idx(memop, idx);
+            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+            return;
+        }
 
-        oi = make_memop_idx(memop, idx);
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-#else
         gen_helper_exit_atomic(cpu_env);
-        /* Produce a result, so that we have a well-formed opcode stream
-           with respect to uses of the result in the (dead) code following.  */
+
+        /*
+         * Produce a result for a well-formed opcode stream.  This satisfies
+         * liveness for set before used, which happens before this dead code
+         * is removed.
+         */
         tcg_gen_movi_i64(retv, 0);
-#endif /* CONFIG_ATOMIC64 */
+        return;
+    }
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_atomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
+                                   TCGV_LOW(newv), idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
+        }
     } else {
         TCGv_i32 c32 = tcg_temp_new_i32();
         TCGv_i32 n32 = tcg_temp_new_i32();
-- 
2.34.1


