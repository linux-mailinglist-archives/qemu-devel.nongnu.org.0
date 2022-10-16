Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AD6003E8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:23:41 +0200 (CEST)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okC2m-0005FT-S6
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBqA-00032Y-GG
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:38 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq8-0007tF-Hc
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:38 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so12644497pjs.0
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=DWWlbicTbMVUY4M19gXQ9o5PB+Ee82e/rivgLStBijcOu3nU8fR3s77EVG+WpROr4P
 jCdzYrboltVOimwb4kOVrt4nNCkgKfZ82PmKkbm69tEoFn0qDD3nRPOOrCZHJdKlsKBb
 D+mluva24SZG3TYz3fBAFXhOxiBB6sP2CbxAC485JC265sBi1FUWvyZ4v+zXk7HiuFrF
 H5xfC358YtzK57IVEy8ki6Vu9iOHd7c59dwmubuQRUjnvY0gkC1h0aGnBofOam6FQvdB
 D2T60iZypVNmDMa6bimXHJ8Wo5SmNKSBReIFQe9kr8NKmbiqO3nHtGiAvAUzCCEsVa/J
 pBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=mK8MAUecVoCeY1lR2/eOJUtT4F2HWmlnAN/2Je+NZk+bTfQzJhu2gOyWPRQMm/2GXs
 AL4BKApbu4otLuSvnUVrWS1aR1C1y2cP3N9au4TTbeMq6FqjIOM4xfe4QvjRaoc9PrhX
 PuY/ImIqkqcB+R1fYgcsvR7G6WFTpqtqZwVUl8FU5qQVn5KizgR2pdfQV4FSXTWKh3Ey
 wJCQVcq4R9kmN7PQ0vqVdhZPkaY5ET5AdvuX8NPX47qEmwmu/F6G6LYvHRLgy74gG0tH
 hjIBWfhm/giaVoDLUjRv1Voewr5atckWSROliPjLIQ3fcBkKv/GEG9+xMPDbgx/uXTX9
 KPcQ==
X-Gm-Message-State: ACrzQf1NbmNoBLbg2NRsl99nVJSEbEwCuyNqh+g670fOBIA4hqX4Ltzh
 xks2PQE0EfGQuiPhwjBMPZIgygezTYMcPKTZ
X-Google-Smtp-Source: AMsMyM6oVvdjuNM0gr804dC6EV3nh4Qn6VPaYOo6jEiRgA8UawM22t1daTM5QKvpbhE1TxkauEA+8Q==
X-Received: by 2002:a17:902:d48d:b0:185:115c:b16b with SMTP id
 c13-20020a170902d48d00b00185115cb16bmr8912686plg.158.1665958235067; 
 Sun, 16 Oct 2022 15:10:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Mon, 17 Oct 2022 08:09:30 +1000
Message-Id: <20221016220932.274260-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 623f7e2e96..f9f8559c01 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -140,9 +140,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1360,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2301,11 +2306,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         default:
             goto do_unallocated;
         }
-        gen_a64_set_pc(s, dst);
         /* BLR also needs to load return address */
         if (opc == 1) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 8: /* BRAA */
@@ -2328,11 +2339,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         } else {
             dst = cpu_reg(s, rn);
         }
-        gen_a64_set_pc(s, dst);
         /* BLRAA also needs to load return address */
         if (opc == 9) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 4: /* ERET */
@@ -2900,7 +2917,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4244,23 +4262,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
 static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
 {
     unsigned int page, rd;
-    uint64_t base;
-    uint64_t offset;
+    int64_t offset;
 
     page = extract32(insn, 31, 1);
     /* SignExtend(immhi:immlo) -> offset */
     offset = sextract64(insn, 5, 19);
     offset = offset << 2 | extract32(insn, 29, 2);
     rd = extract32(insn, 0, 5);
-    base = s->pc_curr;
 
     if (page) {
         /* ADRP (page based) */
-        base &= ~0xfff;
         offset <<= 12;
+        /* The page offset is ok for TARGET_TB_PCREL. */
+        offset -= s->pc_curr & 0xfff;
     }
 
-    tcg_gen_movi_i64(cpu_reg(s, rd), base + offset);
+    gen_pc_plus_diff(s, cpu_reg(s, rd), offset);
 }
 
 /*
-- 
2.34.1


