Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10B42C7D8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:43:20 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiHf-0004ir-Se
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiC0-0007pi-Ma
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:37:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiBy-0003xr-Aj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:37:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id t11so2319604plq.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vm1+Nxqkm8aDvZQThXFEpUZIhlx3FOc7BMXpuaOc1Q8=;
 b=D2elo/VC7ykOKB+q++CpfZdUPLIW7GXQ4RK1e2n0ahF+FEAHSRhlLNWm19PmkbyEZw
 6ugh22Eru6rzjTPkP/kTjYUPqtUiZz+SRF5fno3VZLMyVuTh1pvjvYKesTmVAouphhQR
 t5YwWyy7/p61VAVdHF3UJvhaP4kDKy5JJ1YlBKivnqSEGLaOpAX8wc3B5sfChzVgk+/3
 j4o+Ljh4KjM7c9Nv0KO3D4r7fZ2foW4WGhT3sqY1X74Z9w/kKzaI3UBpe7YUlDgo7Dfj
 uoLlw6Z7x40ysG8XcykO07JmxwgklWbbBWtRvGK5+E2H+AloPVX7WPw2Q/u4IZg98C5I
 uXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vm1+Nxqkm8aDvZQThXFEpUZIhlx3FOc7BMXpuaOc1Q8=;
 b=BWtJxfI61sV1GC8jQD69in2BNJFjqyQ1WqEtYYglVarUC9aBn2c1zClCrnL8mYAzWR
 NwfOE30EPol2U9deJPJdhOmT05GRi/+nwWBx8ZhzUuPBH4DcYQHkIDDhoifMbhvxjIQH
 7ZVB10YsK4bcxq67g1iaBMedkDyeOay3dI1B3Rn0cE/7Gs43NjuZhpQxxA1MtG2rZjcK
 O1AbSzeWLRNCzzasj7No+7bm4NDh6BMRd7gPQgjglq4KguQ4noSsxG+JEHXIGgSuZXPL
 OS6ngKTN+7ekJTMH3IEpa7PLmj+w8qk4klSlF0msjpnQmX97r5bpv/UrtAcfCN8n0mgv
 o4rg==
X-Gm-Message-State: AOAM530P/9lZZz4od5cCkoK7DijUo8DsnRC3vgO+ICeoKWZbFn3oc3JY
 gAsGke3a0ALLeLASlmbt6I+CeRVF+bEBlw==
X-Google-Smtp-Source: ABdhPJyy4EttOFsa/RpUs9wWI5GkYlRo5wuSxrjdxlNURdVRZ1jMmLRMM4brtPO81tAw8zu+0l8jGA==
X-Received: by 2002:a17:90a:9297:: with SMTP id
 n23mr15081811pjo.199.1634146644908; 
 Wed, 13 Oct 2021 10:37:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm1797408pjb.27.2021.10.13.10.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:37:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] target/alpha: Reorg integer memory operations
Date: Wed, 13 Oct 2021 10:37:21 -0700
Message-Id: <20211013173721.989655-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013173721.989655-1-richard.henderson@linaro.org>
References: <20211013173721.989655-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in the MemOp instead of a callback.
Drop the fp argument; add a locked argument.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 104 +++++++++++++++------------------------
 1 file changed, 40 insertions(+), 64 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index bfdd485508..0eee3a1bcc 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -308,27 +308,10 @@ static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
     }
 }
 
-static inline void gen_qemu_ldl_l(TCGv t0, TCGv t1, int flags)
+static void gen_load_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
+                         MemOp op, bool clear, bool locked)
 {
-    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LESL);
-    tcg_gen_mov_i64(cpu_lock_addr, t1);
-    tcg_gen_mov_i64(cpu_lock_value, t0);
-}
-
-static inline void gen_qemu_ldq_l(TCGv t0, TCGv t1, int flags)
-{
-    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LEQ);
-    tcg_gen_mov_i64(cpu_lock_addr, t1);
-    tcg_gen_mov_i64(cpu_lock_value, t0);
-}
-
-static inline void gen_load_mem(DisasContext *ctx,
-                                void (*tcg_gen_qemu_load)(TCGv t0, TCGv t1,
-                                                          int flags),
-                                int ra, int rb, int32_t disp16, bool fp,
-                                bool clear)
-{
-    TCGv tmp, addr, va;
+    TCGv addr, dest;
 
     /* LDQ_U with ra $31 is UNOP.  Other various loads are forms of
        prefetches, which we can treat as nops.  No worries about
@@ -337,22 +320,20 @@ static inline void gen_load_mem(DisasContext *ctx,
         return;
     }
 
-    tmp = tcg_temp_new();
-    addr = load_gpr(ctx, rb);
-
-    if (disp16) {
-        tcg_gen_addi_i64(tmp, addr, disp16);
-        addr = tmp;
-    }
+    addr = tcg_temp_new();
+    tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
-        tcg_gen_andi_i64(tmp, addr, ~0x7);
-        addr = tmp;
+        tcg_gen_andi_i64(addr, addr, ~0x7);
     }
 
-    va = (fp ? cpu_fir[ra] : ctx->ir[ra]);
-    tcg_gen_qemu_load(va, addr, ctx->mem_idx);
+    dest = ctx->ir[ra];
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, op);
 
-    tcg_temp_free(tmp);
+    if (locked) {
+        tcg_gen_mov_i64(cpu_lock_addr, addr);
+        tcg_gen_mov_i64(cpu_lock_value, dest);
+    }
+    tcg_temp_free(addr);
 }
 
 static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
@@ -393,30 +374,21 @@ static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
     tcg_temp_free(addr);
 }
 
-static inline void gen_store_mem(DisasContext *ctx,
-                                 void (*tcg_gen_qemu_store)(TCGv t0, TCGv t1,
-                                                            int flags),
-                                 int ra, int rb, int32_t disp16, bool fp,
-                                 bool clear)
+static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
+                          MemOp op, bool clear)
 {
-    TCGv tmp, addr, va;
+    TCGv addr, src;
 
-    tmp = tcg_temp_new();
-    addr = load_gpr(ctx, rb);
-
-    if (disp16) {
-        tcg_gen_addi_i64(tmp, addr, disp16);
-        addr = tmp;
-    }
+    addr = tcg_temp_new();
+    tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
-        tcg_gen_andi_i64(tmp, addr, ~0x7);
-        addr = tmp;
+        tcg_gen_andi_i64(addr, addr, ~0x7);
     }
 
-    va = (fp ? load_fpr(ctx, ra) : load_gpr(ctx, ra));
-    tcg_gen_qemu_store(va, addr, ctx->mem_idx);
+    src = load_gpr(ctx, ra);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, op);
 
-    tcg_temp_free(tmp);
+    tcg_temp_free(addr);
 }
 
 static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
@@ -1511,30 +1483,30 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
     case 0x0A:
         /* LDBU */
         REQUIRE_AMASK(BWX);
-        gen_load_mem(ctx, &tcg_gen_qemu_ld8u, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_UB, 0, 0);
         break;
     case 0x0B:
         /* LDQ_U */
-        gen_load_mem(ctx, &tcg_gen_qemu_ld64, ra, rb, disp16, 0, 1);
+        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 1, 0);
         break;
     case 0x0C:
         /* LDWU */
         REQUIRE_AMASK(BWX);
-        gen_load_mem(ctx, &tcg_gen_qemu_ld16u, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_LEUW, 0, 0);
         break;
     case 0x0D:
         /* STW */
         REQUIRE_AMASK(BWX);
-        gen_store_mem(ctx, &tcg_gen_qemu_st16, ra, rb, disp16, 0, 0);
+        gen_store_int(ctx, ra, rb, disp16, MO_LEUW, 0);
         break;
     case 0x0E:
         /* STB */
         REQUIRE_AMASK(BWX);
-        gen_store_mem(ctx, &tcg_gen_qemu_st8, ra, rb, disp16, 0, 0);
+        gen_store_int(ctx, ra, rb, disp16, MO_UB, 0);
         break;
     case 0x0F:
         /* STQ_U */
-        gen_store_mem(ctx, &tcg_gen_qemu_st64, ra, rb, disp16, 0, 1);
+        gen_store_int(ctx, ra, rb, disp16, MO_LEQ, 1);
         break;
 
     case 0x10:
@@ -2489,11 +2461,15 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 break;
             case 0x2:
                 /* Longword physical access with lock (hw_ldl_l/p) */
-                gen_qemu_ldl_l(va, addr, MMU_PHYS_IDX);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LESL);
+                tcg_gen_mov_i64(cpu_lock_addr, addr);
+                tcg_gen_mov_i64(cpu_lock_value, va);
                 break;
             case 0x3:
                 /* Quadword physical access with lock (hw_ldq_l/p) */
-                gen_qemu_ldq_l(va, addr, MMU_PHYS_IDX);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEQ);
+                tcg_gen_mov_i64(cpu_lock_addr, addr);
+                tcg_gen_mov_i64(cpu_lock_value, va);
                 break;
             case 0x4:
                 /* Longword virtual PTE fetch (hw_ldl/v) */
@@ -2846,27 +2822,27 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         break;
     case 0x28:
         /* LDL */
-        gen_load_mem(ctx, &tcg_gen_qemu_ld32s, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_LESL, 0, 0);
         break;
     case 0x29:
         /* LDQ */
-        gen_load_mem(ctx, &tcg_gen_qemu_ld64, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 0, 0);
         break;
     case 0x2A:
         /* LDL_L */
-        gen_load_mem(ctx, &gen_qemu_ldl_l, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_LESL, 0, 1);
         break;
     case 0x2B:
         /* LDQ_L */
-        gen_load_mem(ctx, &gen_qemu_ldq_l, ra, rb, disp16, 0, 0);
+        gen_load_int(ctx, ra, rb, disp16, MO_LEQ, 0, 1);
         break;
     case 0x2C:
         /* STL */
-        gen_store_mem(ctx, &tcg_gen_qemu_st32, ra, rb, disp16, 0, 0);
+        gen_store_int(ctx, ra, rb, disp16, MO_LEUL, 0);
         break;
     case 0x2D:
         /* STQ */
-        gen_store_mem(ctx, &tcg_gen_qemu_st64, ra, rb, disp16, 0, 0);
+        gen_store_int(ctx, ra, rb, disp16, MO_LEQ, 0);
         break;
     case 0x2E:
         /* STL_C */
-- 
2.25.1


