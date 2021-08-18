Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436A3F0C75
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:11:16 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRu7-0002oa-FB
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9v-0007Vq-1i
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:31 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9t-0002nQ-8v
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:30 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k24so3317976pgh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HJZsLWAfmBm/ICyuoA2DLnPt6FGx8XnR+fe9pHWfcps=;
 b=wcKQYV8Bot5hJKrLXoVFPQbZD062+qaobDMqW7ANHUxjny8q4noAjJN83U2yaaOkR2
 5VmkkRuk/jj8H1go/Q/ge2KNQnIf108EnjsYWbBmLnAs3DD1NimiCur9TJvKqRA63NdV
 Jl3KHdmM2qCq5yLmElANUg0Iu69979IThpsD4XvrQ2XQlpH8tSGWZCZrjvsXk4siV6nB
 +ElSjnw9Vyc1TXmcB/gHUxJVXl3EiOiPc+WyC3XGbYlxgsB8dWsUlzvy8R8PHId/xW4s
 NiJhISj+hp6TJ2k/EBtb++LI5wXo8R3k3zAY76nakWT7uoNygIYYckcqJWmviwuZOzdz
 3Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJZsLWAfmBm/ICyuoA2DLnPt6FGx8XnR+fe9pHWfcps=;
 b=bHIfb9z0IZv7ugA8S0wj6yxXQquVVvxO6qalytw+dDDhyiz3udnHd5ocRhKgewtdOx
 AjlpgcOUJBStd0+cQQdgNZfhvX1jcynnGTuzivLpnRPBLpbaF0slmwyGuYv2qd15+V4y
 4lBkMK8BOjqOCBxMazwLHX/FRosodf7EP6a1vpA+oC8kk0HWI6IuUJNZCS+MK26ZJsDB
 SdGgsS7HqGBvJI7zZWf03gcmBbPCwn2WtV9ji30ddzK0+YGO1eF8d6ZSnZtDgi9JUy/q
 wlJ2NibBnRlPOljo0VFuDk9z8hD7FsRgMXxOIzF9ijFtN3+JmnQZtRLQvCU30wjPmdGc
 rBhQ==
X-Gm-Message-State: AOAM5327qY2lOruMZBwAZFNyN2tYf5k39YCLDMfVikjjaLMhrzg90VMe
 FZVlFxe4KdKIrlLaR2OcvAt/t15aRm9N3Q==
X-Google-Smtp-Source: ABdhPJyXBscxB4UD0nK9wKzWJ2Y98T2hwFwYnJw9WVQtnV2aD85DdfFA/4DkwLVteypvYjGTYybQjw==
X-Received: by 2002:aa7:854a:0:b029:332:330e:1387 with SMTP id
 y10-20020aa7854a0000b0290332330e1387mr10668416pfn.67.1629314607947; 
 Wed, 18 Aug 2021 12:23:27 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 53/66] target/alpha: Reorg integer memory operations
Date: Wed, 18 Aug 2021 09:19:07 -1000
Message-Id: <20210818191920.390759-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in the MemOp instead of a callback.
Drop the fp argument; add a locked argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 104 +++++++++++++++------------------------
 1 file changed, 40 insertions(+), 64 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 607b6c3da7..c14c1156a0 100644
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


