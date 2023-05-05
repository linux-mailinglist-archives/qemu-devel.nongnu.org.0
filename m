Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285416F8AF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:28:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vD-0000e3-U4; Fri, 05 May 2023 17:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0000bF-Uo
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v6-0004Ns-PU
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so22933275e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321891; x=1685913891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Po/b9RUKIX4ZcUJrZzR6FduMnLEh3zUsfIIwnwg6Cs=;
 b=utZjXax9avcX2/Vs6st0pQ+fC/SkbPe6XhwixmGvXIwesYEJikjsc62DsAiRQPxBcU
 bKvlxX7hWWK6cmabIJqcdZ6WN25yNsmSwhYvw/4sIsezAc9h4WPvxxrh8g7axnsYItzu
 UIlHqU/O/DiTyJr72NOpddxSDrFqjJOHdp9L6SPpHpcQ6h2a4axP3lEccllsBEdbghmb
 UyPG+ap9VEU+IPR1bVeu/HFqNmkMy/G5qmwqNktbPCVBSCmty/rglMstwb5ydMzN0K3u
 lT1iLQPWrWxUmA+ESjxdGNJDzszizl3/g9I3fRcL1HSiVhKOTEA9m5M/8Q18KPJve6Co
 ccRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321891; x=1685913891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Po/b9RUKIX4ZcUJrZzR6FduMnLEh3zUsfIIwnwg6Cs=;
 b=KTvS8E2ZWGw1FNW8LV9SOISz/JCNUfAyiZJ6Req6Z4CcIg0dlFYnCS8cngh2cwi4EG
 4jjHXx651wvPTnxhb2X7Q71UPHDabj+JOMAwOybXscgVszffXVW0NMj4Tcu3KJhle6Al
 d0Z12nN1KFhL04/eba/WEKMhdWiqShPkpJ5b0JpNntQb0F5dICQ280N23XKu6erynQQN
 vIMTti3Ks6G6g0JI6kcTQwMVBANF3xRHbdaxCRJkdEs5VwJWMx7XwXkzwxUm1DPS+5Cy
 r2DD0p6p+13WGiizg33DgboZ4+ElZlh4WOu8H07UNT/CYDvl/PBjQjYakAmymditahZx
 yZ3A==
X-Gm-Message-State: AC+VfDxjc6rH87fK1IiXsWrJzoiKIg84W4kYG+lf13OCyofdByJdG+Gm
 Wj+/1kIh1adCDvhBNZiUJLfoParr/hynQ7GCxMQoTg==
X-Google-Smtp-Source: ACHHUZ7iyeaL9rrGzOHh0zQehlfiqQv2nrGT4jFJs/MV0/1MDJ8QhAACWeLvcEIaw9KkID3cIAHgFA==
X-Received: by 2002:a5d:5003:0:b0:306:3408:f9a8 with SMTP id
 e3-20020a5d5003000000b003063408f9a8mr2261993wrt.11.1683321891121; 
 Fri, 05 May 2023 14:24:51 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [PULL 04/42] target/Hexagon: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Fri,  5 May 2023 22:24:09 +0100
Message-Id: <20230505212447.374546-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert away from the old interface with the implicit
MemOp argument.  Importantly, this removes some incorrect
casts generated by idef-parser's gen_load().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-4-richard.henderson@linaro.org>
---
 target/hexagon/macros.h                     | 14 ++++-----
 target/hexagon/genptr.c                     |  8 +++---
 target/hexagon/idef-parser/parser-helpers.c | 28 +++++++++---------
 target/hexagon/translate.c                  | 32 ++++++++++-----------
 4 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 3e162de3a7..760630de8f 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -99,37 +99,37 @@
 #define MEM_LOAD1s(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 1); \
-        tcg_gen_qemu_ld8s(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_SB); \
     } while (0)
 #define MEM_LOAD1u(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 1); \
-        tcg_gen_qemu_ld8u(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_UB); \
     } while (0)
 #define MEM_LOAD2s(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 2); \
-        tcg_gen_qemu_ld16s(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_TESW); \
     } while (0)
 #define MEM_LOAD2u(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 2); \
-        tcg_gen_qemu_ld16u(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_TEUW); \
     } while (0)
 #define MEM_LOAD4s(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 4); \
-        tcg_gen_qemu_ld32s(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_TESL); \
     } while (0)
 #define MEM_LOAD4u(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 4); \
-        tcg_gen_qemu_ld32s(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_tl(DST, VA, ctx->mem_idx, MO_TEUL); \
     } while (0)
 #define MEM_LOAD8u(DST, VA) \
     do { \
         CHECK_NOSHUF(VA, 8); \
-        tcg_gen_qemu_ld64(DST, VA, ctx->mem_idx); \
+        tcg_gen_qemu_ld_i64(DST, VA, ctx->mem_idx, MO_TEUQ); \
     } while (0)
 
 #define MEM_STORE1_FUNC(X) \
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 502c85ae35..244063b1d2 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -320,14 +320,14 @@ void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
 
 static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
 {
-    tcg_gen_qemu_ld32u(dest, vaddr, mem_index);
+    tcg_gen_qemu_ld_tl(dest, vaddr, mem_index, MO_TEUL);
     tcg_gen_mov_tl(hex_llsc_addr, vaddr);
     tcg_gen_mov_tl(hex_llsc_val, dest);
 }
 
 static inline void gen_load_locked8u(TCGv_i64 dest, TCGv vaddr, int mem_index)
 {
-    tcg_gen_qemu_ld64(dest, vaddr, mem_index);
+    tcg_gen_qemu_ld_i64(dest, vaddr, mem_index, MO_TEUQ);
     tcg_gen_mov_tl(hex_llsc_addr, vaddr);
     tcg_gen_mov_i64(hex_llsc_val_i64, dest);
 }
@@ -678,7 +678,7 @@ static void gen_load_frame(DisasContext *ctx, TCGv_i64 frame, TCGv EA)
 {
     Insn *insn = ctx->insn;  /* Needed for CHECK_NOSHUF */
     CHECK_NOSHUF(EA, 8);
-    tcg_gen_qemu_ld64(frame, EA, ctx->mem_idx);
+    tcg_gen_qemu_ld_i64(frame, EA, ctx->mem_idx, MO_TEUQ);
 }
 
 static void gen_return(DisasContext *ctx, TCGv_i64 dst, TCGv src)
@@ -1019,7 +1019,7 @@ static void gen_vreg_load(DisasContext *ctx, intptr_t dstoff, TCGv src,
         tcg_gen_andi_tl(src, src, ~((int32_t)sizeof(MMVector) - 1));
     }
     for (int i = 0; i < sizeof(MMVector) / 8; i++) {
-        tcg_gen_qemu_ld64(tmp, src, ctx->mem_idx);
+        tcg_gen_qemu_ld_i64(tmp, src, ctx->mem_idx, MO_TEUQ);
         tcg_gen_addi_tl(src, src, 8);
         tcg_gen_st_i64(tmp, cpu_env, dstoff + i * 8);
     }
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 86511efb62..8734218e51 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1737,36 +1737,34 @@ void gen_load_cancel(Context *c, YYLTYPE *locp)
 void gen_load(Context *c, YYLTYPE *locp, HexValue *width,
               HexSignedness signedness, HexValue *ea, HexValue *dst)
 {
-    char size_suffix[4] = {0};
-    const char *sign_suffix;
+    unsigned dst_bit_width;
+    unsigned src_bit_width;
+
     /* Memop width is specified in the load macro */
     assert_signedness(c, locp, signedness);
-    sign_suffix = (width->imm.value > 4)
-                   ? ""
-                   : ((signedness == UNSIGNED) ? "u" : "s");
+
     /* If dst is a variable, assert that is declared and load the type info */
     if (dst->type == VARID) {
         find_variable(c, locp, dst, dst);
     }
 
-    snprintf(size_suffix, 4, "%" PRIu64, width->imm.value * 8);
+    src_bit_width = width->imm.value * 8;
+    dst_bit_width = MAX(dst->bit_width, 32);
+
     /* Lookup the effective address EA */
     find_variable(c, locp, ea, ea);
     OUT(c, locp, "if (insn->slot == 0 && pkt->pkt_has_store_s1) {\n");
     OUT(c, locp, "probe_noshuf_load(", ea, ", ", width, ", ctx->mem_idx);\n");
     OUT(c, locp, "process_store(ctx, 1);\n");
     OUT(c, locp, "}\n");
-    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
+
+    OUT(c, locp, "tcg_gen_qemu_ld_i", &dst_bit_width);
     OUT(c, locp, "(");
-    if (dst->bit_width > width->imm.value * 8) {
-        /*
-         * Cast to the correct TCG type if necessary, to avoid implict cast
-         * warnings. This is needed when the width of the destination var is
-         * larger than the size of the requested load.
-         */
-        OUT(c, locp, "(TCGv) ");
+    OUT(c, locp, dst, ", ", ea, ", ctx->mem_idx, MO_", &src_bit_width);
+    if (signedness == SIGNED) {
+        OUT(c, locp, " | MO_SIGN");
     }
-    OUT(c, locp, dst, ", ", ea, ", ctx->mem_idx);\n");
+    OUT(c, locp, " | MO_TE);\n");
 }
 
 void gen_store(Context *c, YYLTYPE *locp, HexValue *width, HexValue *ea,
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index c087f183d0..cddd7c5db4 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -627,27 +627,27 @@ void process_store(DisasContext *ctx, int slot_num)
         switch (ctx->store_width[slot_num]) {
         case 1:
             gen_check_store_width(ctx, slot_num);
-            tcg_gen_qemu_st8(hex_store_val32[slot_num],
-                             hex_store_addr[slot_num],
-                             ctx->mem_idx);
+            tcg_gen_qemu_st_tl(hex_store_val32[slot_num],
+                               hex_store_addr[slot_num],
+                               ctx->mem_idx, MO_UB);
             break;
         case 2:
             gen_check_store_width(ctx, slot_num);
-            tcg_gen_qemu_st16(hex_store_val32[slot_num],
-                              hex_store_addr[slot_num],
-                              ctx->mem_idx);
+            tcg_gen_qemu_st_tl(hex_store_val32[slot_num],
+                               hex_store_addr[slot_num],
+                               ctx->mem_idx, MO_TEUW);
             break;
         case 4:
             gen_check_store_width(ctx, slot_num);
-            tcg_gen_qemu_st32(hex_store_val32[slot_num],
-                              hex_store_addr[slot_num],
-                              ctx->mem_idx);
+            tcg_gen_qemu_st_tl(hex_store_val32[slot_num],
+                               hex_store_addr[slot_num],
+                               ctx->mem_idx, MO_TEUL);
             break;
         case 8:
             gen_check_store_width(ctx, slot_num);
-            tcg_gen_qemu_st64(hex_store_val64[slot_num],
-                              hex_store_addr[slot_num],
-                              ctx->mem_idx);
+            tcg_gen_qemu_st_i64(hex_store_val64[slot_num],
+                                hex_store_addr[slot_num],
+                                ctx->mem_idx, MO_TEUQ);
             break;
         default:
             {
@@ -693,13 +693,13 @@ static void process_dczeroa(DisasContext *ctx)
         TCGv_i64 zero = tcg_constant_i64(0);
 
         tcg_gen_andi_tl(addr, hex_dczero_addr, ~0x1f);
-        tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
+        tcg_gen_qemu_st_i64(zero, addr, ctx->mem_idx, MO_UQ);
         tcg_gen_addi_tl(addr, addr, 8);
-        tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
+        tcg_gen_qemu_st_i64(zero, addr, ctx->mem_idx, MO_UQ);
         tcg_gen_addi_tl(addr, addr, 8);
-        tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
+        tcg_gen_qemu_st_i64(zero, addr, ctx->mem_idx, MO_UQ);
         tcg_gen_addi_tl(addr, addr, 8);
-        tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
+        tcg_gen_qemu_st_i64(zero, addr, ctx->mem_idx, MO_UQ);
     }
 }
 
-- 
2.34.1


