Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F33DE576
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:38:33 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmCG-0000Tg-D8
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltD-00067M-0P
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltB-0005M3-5c
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:50 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so2066327pja.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HJZsLWAfmBm/ICyuoA2DLnPt6FGx8XnR+fe9pHWfcps=;
 b=vGww14aS7wTxwlBwifVR9Qk7PWDrYpeBhu428zremSq/qBt0kkrXMe7R5bA+N4faPH
 EAk7mWMy7qDcUmyms7S9I6Io8J4jyrtwaEzjkf9ByFrACkapYeXTPj7HApqyc2Qw+ODK
 eqTe49FNAWSMXk6gm8bWWRsTogK+Ky4+oBxpckVczwweQYOSdLDC9OslP5BkHMAvUohb
 XRSSWmRF/D5txwdNWubQPrvtdVIssjuFZDaxUwbCdtotaOlpLa+V0tyshbmYEgEgs/cf
 hKsTxn9T8uYu4eif1lslVPm5dxwgAYZZOaM1/z+T0uze5oR2/I9jRX4PncnFQ7XKbsdV
 VNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJZsLWAfmBm/ICyuoA2DLnPt6FGx8XnR+fe9pHWfcps=;
 b=kXT40pt9QElB+ePi5Qv6Uz0lpSjjMa8oC3jvkaydbGzoTE64MNk+0nKWDfHs8TEFyT
 G2purvLa4RQ5bEUBVdCkbREth7urS0FOUmozjBLHqJTCzBI8EJZF55H5UJ3QR//3ME1A
 Ji4eX5MMe9/2/AFhDSwr0xsQPlYfjCpMgcqGJLvBgz+2c52t5MemltRIL/hJJ+0Sm3qo
 tC21z7OfILcvKC8dcwm9crqW5J7gSweJVW7kD8v5olgtvHc6SYDbGjqxZtY7VeSOPvOB
 ajsB4zbic9EozmBWKnSxjEVrVANPDQiPEw3MSNdTpoq+My20k7/9fROhWVcFvgCKaOV2
 bxWQ==
X-Gm-Message-State: AOAM5312ZZ0W2b8txSuKMT0h55IhZr1XbCuPJWorN8cHvf0ugKii/6yA
 B8MzAIhOt97qBlEDt2I4ylWap2COTu+xNw==
X-Google-Smtp-Source: ABdhPJz4otJ5lTV+aBO2QTT8zpNFBFV4+RjaTokfmrZr7lux9UWYZA4/iMhBhIuxDxLBI+w4v5FUPg==
X-Received: by 2002:a17:90a:4498:: with SMTP id
 t24mr20536680pjg.235.1627964328043; 
 Mon, 02 Aug 2021 21:18:48 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 52/55] target/alpha: Reorg integer memory operations
Date: Mon,  2 Aug 2021 18:14:40 -1000
Message-Id: <20210803041443.55452-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


