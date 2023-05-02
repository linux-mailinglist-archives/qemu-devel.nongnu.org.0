Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0C6F45A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:58:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVz-0001Ao-KG; Tue, 02 May 2023 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVs-00019G-0F
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVp-0003TR-BA
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so23406855e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035866; x=1685627866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOPbXoy0JSgVGeIxbU2mMSmijlc4/zSkdOC1OapR3BE=;
 b=uLz0zkcHagPWKx22Kxv7BTrjOmdnm/VniqTW4dFcZcTun7zCmrNvj3FiiOU7zXpYVO
 GlPGyq8XBY2oaE33vtNS3QVyx9mi/l3VfdOPWL/Ys5Q98MCjTgTnSMh8OKvc4JzfvK3x
 Q/C6741oDCBx6txu5gbpLBf0EXBVNVKmF6Bp4hwdSOLOpRG3SIGsNv0wBNZvuFXJfvbO
 zH2enjt4ud3rkkEppRv88moj2Wlu5j1lWj4NFJqEVJk3kMYPRKKDJN/voPAceyyBWAa8
 YE/oWk7GVAPtNylHlod/pHB1+rpGXXuoSmqjOSlxr9SL91I5Anpb3JimCsbf3+KA/zjY
 vWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035866; x=1685627866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOPbXoy0JSgVGeIxbU2mMSmijlc4/zSkdOC1OapR3BE=;
 b=mFfyNqnZhOXGRIEPveYr5YgaLgOvZy0NNxQARJkXX7Vns3kMqT/2rbgGP9j/A41Glv
 oautfnEGM1Pf8rT3/l1LSpSflDtt3Xx1m538dLfjmUFvZDV5Fr3QPMYDGN83XM1OQgxf
 oXHUHkiUbXaDOlQ56eRADY0LcvGqDf8WCqm5N695mNdq1gE5SaV9lwM5WUmCMUlFjvkO
 9zO5mbAeEBW/p+wuMkQxslt8stbR9iMA7KGcp+5H95aFBt8ohR/L/wBbTlSvplv+lRfE
 8py0tZdC6dU6qMyskd8FCVXUFDabPl+PlCWhUhoiEQ2UW95pXOpVS6NcdaLuSeP0Uxz3
 KDXQ==
X-Gm-Message-State: AC+VfDzFvwPt37/Gqet5cttdFLYMtMlLwoJlEh+o6a/LNqLsFlOGPB7H
 Ae26xr7MTL1/2058MMwOJYg3Y2EHUhWwWrKwLI8AAg==
X-Google-Smtp-Source: ACHHUZ48ZQiMcWSnYumoX1GmNjz8dWwMxuMnLejjOvp+B41cDqEQ3Jfo+QnlkQF+S67XKE63h8N1Lw==
X-Received: by 2002:a7b:c058:0:b0:3f3:2ba9:94d1 with SMTP id
 u24-20020a7bc058000000b003f32ba994d1mr8105208wmc.20.1683035865847; 
 Tue, 02 May 2023 06:57:45 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 3/9] target/Hexagon: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Tue,  2 May 2023 14:57:35 +0100
Message-Id: <20230502135741.1158035-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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


