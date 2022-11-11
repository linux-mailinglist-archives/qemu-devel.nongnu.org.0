Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD1625494
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:46:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOjg-0001Z3-Gq; Fri, 11 Nov 2022 02:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjc-0001Vz-Pw
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:56 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOja-00019S-QH
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id j12so3636199plj.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dmbx+CEV8/se/3fSeHkhg92bMZKxyEmSGS7vO3Es65k=;
 b=co1iPseDsJ16UzH1ZtUoYHmfIhQv64uNXJBzMHRUvyH/DxnwtRmc6UZ0d0/1WVhD/d
 2aaoza9QdwCGCo/+zAjdcVqGJk/sw8C3GjfAq/g84dTmDBQuqhZEfuErp15AFfqkgPuo
 CgYNDQsoA1wwBzMYSzwBepByf+yJwqEQtMf44xgS4m3jRDNXOuNYLh4Qe1gp+tw71uWU
 PweAwz+L51v3gSMwAJmdpZAydyBQtWDDrJCQ0MmGS4GNKd8k/3jnYnafDThGo54Sm89+
 tqMlCBpJ2olhjgtHEmtDCSHjG6GdsUc0RAfgICK6h1ZmYCHkSNNKszUcLT53dvjkqzDK
 Lvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmbx+CEV8/se/3fSeHkhg92bMZKxyEmSGS7vO3Es65k=;
 b=OYlEGv/XGlIgUjB2QF7dti3FUVZac4bX2/LqZpfqjI4e4emtcTI4pQr5G0fHxQVjtj
 pKKvel1MN9DGNASNnFqP37DjSjzMmiG6hQJemztjfJB2V+8uflQZAXsbLu5UFXf6mYip
 pAGQvLLGOw4voXLUMKNuxmxmonodOHba9rXMDnIPIbzntt3arWSwzIgkC5DLqQfA4hRo
 yC1tBdFkECtkUDXCRzw6gDOBCmVQXajJ7uny6PFh2ILDwjhYYa+0n+w3h9hTp5SFCQMG
 DPIBxuei6AncdCDIjfma0meBiwvFrlrpbztVapxhNTgwAbZcL4b8TuVdsTrJgtughQ/5
 7HzA==
X-Gm-Message-State: ANoB5pnVyvxnTZiOjkpEYGFDzv2DsqC9VsapAx0OOKNxCvEQZphqEkIR
 8TjCv5n1kSlUYIt28x3pYT0B2ISDe8aVyQqt
X-Google-Smtp-Source: AA0mqf49hA7ZQ2Oh7W9lLFbUCRhm6fDMH9j2WQ7oHEYPzAxH7QLkO4VxH6H0b5I2QQsnJY2qL4vORQ==
X-Received: by 2002:a17:902:bd86:b0:186:8d12:f51f with SMTP id
 q6-20020a170902bd8600b001868d12f51fmr1115489pls.129.1668152753109; 
 Thu, 10 Nov 2022 23:45:53 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b001869f2120a6sm983802plg.108.2022.11.10.23.45.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:45:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 45/45] tcg: Split out
 tcg_gen_nonatomic_cmpxchg_i{32, 64}
Date: Fri, 11 Nov 2022 17:41:01 +1000
Message-Id: <20221111074101.2069454-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


