Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EF42B334
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:14:31 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUis-0001TF-IQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI7-00055b-7M
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI4-0005Dd-2U
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:50 -0400
Received: by mail-pj1-x102d.google.com with SMTP id k23so1113286pji.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vm1+Nxqkm8aDvZQThXFEpUZIhlx3FOc7BMXpuaOc1Q8=;
 b=xc7Ks3+lCpaP913FtEZPnaK9DKS36FoxxS5HakJwqJUR055xGDrpXGQVPC5WsJ+Onw
 itI3QEu6jwLDXIjhc8pRo/qcsC0nBahEIXJZH0/UAo8ZkAJ982b9af3TmzHZPX8Kpt9N
 AWrvmlDQFlso+hWktEVeMYzFyVK6W8m0obEriWzRgclyALiPxnzr8l3vEDaem346d6t1
 T7g8Pqu5gq51DGCRBE9jCeo85B8TAWRxI8DD85rl6zktl+uPrzlTDr37jTsr3vKPCcpq
 LeW00VWhy4nJ3n4eylxBKvnZwBWdfCmdCc+ohcRuMraYMdTtjFXLSAo3WOnlZIvx45E9
 qecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vm1+Nxqkm8aDvZQThXFEpUZIhlx3FOc7BMXpuaOc1Q8=;
 b=FFqBJ6NCxF+9dF1cJqbMJvQRpI8N6+xDFe9NrcDYtbFF1JFnwj5BD27JraocWinU3l
 QmOup9GCAToQ4s6GHxjjcZApV9ZUUna/LHS60nS+0kS30ZZk0egU5jGXohhahf8g3GIo
 gVZsIg3CbAVO2cQitKaewXiGxohBOruXhJRqIBciU9XJWl3klJG7xXvmybObuOhEXWp5
 SD3Dv1ecZVqo5G8SqLkVG0e/s//45ODEg+ZjPSzLlQLv1HosKR4DsBWvEyJLAp1C08OM
 bjIW+7d7tBvjs+VoSHUn99+I1xKsXYBPMF+nl5y5GtSPj4fGhuKgf9xrPLjfdJ+eRBaY
 5USw==
X-Gm-Message-State: AOAM5336yrbhssoVd6Ow+weZTnv9QXhSueDtlgagtKLi49Q3Nw2zCfme
 ZyChUsZ84ax5u8WHb8aegjHj96imNydj8Q==
X-Google-Smtp-Source: ABdhPJww0x+l+rCFv4dzcu+nk6IVfJ6uqD+jO5+/xcybK+qJATOIopiQkcGdAAeIzKzKOfThWsnkRA==
X-Received: by 2002:a17:90a:6b0a:: with SMTP id
 v10mr10383617pjj.130.1634093205466; 
 Tue, 12 Oct 2021 19:46:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/48] target/alpha: Reorg integer memory operations
Date: Tue, 12 Oct 2021 19:45:55 -0700
Message-Id: <20211013024607.731881-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


