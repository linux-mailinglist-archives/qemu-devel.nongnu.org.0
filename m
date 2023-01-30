Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7D681D46
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1g-0001zP-Mo; Mon, 30 Jan 2023 16:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1f-0001zG-19
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1d-0005e5-8z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id m2so8099802plg.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0WrnpFv1Nw89i7DTl3h+lKdWz/K7go9+e+qOQj+GaM=;
 b=xWw2NWxGtf7sNPr+vmtYSzXe95vtjJnTVEMcUx2h8hR6VdJ4br7nAq4Ddb8GY15qTE
 Y4VG7t75COsGijCMAc4dMcVSQGyZPuNMJr9iYMqWc3Ru1pBRM7sctH/r4jeAdDhtWqWm
 DO8azadDYW54o8GbEVQO8Fb8TMOdPKscl0KqT1OY4o3AaIOInmq5T6auwQOLvJ6gRpv7
 0zRqyd99Z4DNmSdmNJx9aQ79l062hAYxeYDPiimgtKxoWZXG1rrjq5OmUAoHP1MyOopk
 WvR46QkF6hOtOeu1Nu/f1Ci6CuKZ7Z9HFVIVhfS4b37WJvCbrVP224xhA/U0KTOqBZM2
 ZBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0WrnpFv1Nw89i7DTl3h+lKdWz/K7go9+e+qOQj+GaM=;
 b=sPQW6ho2Z/oLB0sH68xEfaFb2UEwNg3BuzcZOP8dVj4YC1qD0xfMasqARnW7ThLj8Z
 S9mrnzaZ+eo4qi6N/YYhz3A1cQe1/33HzOzSsalIN//kV8sFLNs28BBdV+LFSzxvHF5x
 N3pJiP3FqsBq0Alii2MImh3pvmqOC6zG2Rz2auWug36cnBS2Y/2YxJFAuF/uzWtjnGnI
 DkB4vkAmOZc0lNZJ4T9J89fwGSBN2qmYzB7Fk4/sdqxVyGi2iKalopgEXDFytJIYHVVM
 O+NiohzljbSR9mNyv3GOMSkcFX03Yy9jgxPXMtcfmfOw+grNlAjnwZ4/LjzESFrxFpFu
 jiaA==
X-Gm-Message-State: AFqh2kpjI3ko/BdDQIGRf2AqclNU1GnuLBWwUWhB9hc0OXZvqu57kdlE
 HWTd83J/yRujaetkWifS8H6XJRmt89QsJyBP
X-Google-Smtp-Source: AMrXdXuUc6KZ4Ueo6Fu30TsHnU3qi1P0NXWJAaDAnnoWDHqqcVaPNO7Ziygp0gh/npN3fcxRRjIp1A==
X-Received: by 2002:a17:90a:77c6:b0:226:3f8:5b78 with SMTP id
 e6-20020a17090a77c600b0022603f85b78mr53463765pjs.13.1675115355941; 
 Mon, 30 Jan 2023 13:49:15 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 17/36] tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
Date: Mon, 30 Jan 2023 11:48:25 -1000
Message-Id: <20230130214844.1158612-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index 5811ecd3e7..c581ae77c4 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3325,82 +3325,122 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
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
 
     if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
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
     if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
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


