Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90159641D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:03:24 +0200 (CEST)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3id-0007qu-JZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HM-0005NU-Ha
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:15 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HI-0004bR-DJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:12 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so8167579otd.12
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
 b=l+SJLAFr6nSyYAwIXqL7qH2D3Aqbm4zrqsb7wpZpP4FtPBjh0tR0dRz/t0WdP2zPPK
 hBab2WKucG/XNDkuao4jYbBzlES7Av/U4vpu1yGfAFsR+QPI7zu0rVCKZlG2tcCBrOyL
 h7QcC4N4HafLtDueVr3az+lHvqR27qpPHBQ//WRsIxqOxQITI6v+XbFxkC9sf/CgNWUa
 BCq3GJc7tEgo+w0FnBU0sBXIv2pOpDfilUkEEXI9bF8Lkr5FsCQgteeF/h+9KKGJsWCj
 e4cifYkW5S3mGB3oFfGcsqdzpsKh4zrZwCGQCNrfNBupM/ZETmNaFhC2dUADbBfxffRT
 nGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
 b=JTCs2AxMT/sM1n8iQ4XQubMiv8Hu4ptIkiCw8gPwIZcGZhxePSxT17EHF5hgBNHARD
 dG1ZPnL5LjgIMN9ltvozZzR0tpmV8QTw43hmlsc48ptEZ4+PTpzAHYBnSIazfX+DvcdW
 5FikmrI8dJwWlo+A8NXi8CA31gTSY9uVxsGuu6sLWeZGxl9IO3iavrKZQ4hjCOGESAul
 hyaiKmaJ1jQg+InmYyYlMnLHxPhbRlGr0IcqnRfzvzqSc0SQ02bbVdCkmO5vFu90wxGv
 fngRv2XnGs0NHJuwuGaRmJIv5MnZyPgWFpmLmHN+q42YEDh/9N19nkVBsljmzefX8+8X
 xzsQ==
X-Gm-Message-State: ACgBeo1EKx087oS3WEFWQFzirzgHYmPH/4wE3Q9p6sOGfTGxum8bl05a
 QXqkQ2U8VDwJDEFas+3HiVRhv7tbMd5mwA==
X-Google-Smtp-Source: AA6agR6K3QKcVvnS4i7XdYjhU7Tg47xz6W8rDuQZDuEHXW9KMSawLO0AeXdaD5W03W1BbF06mP3oxQ==
X-Received: by 2002:a05:6830:2a07:b0:637:36c1:4765 with SMTP id
 y7-20020a0568302a0700b0063736c14765mr8451621otu.283.1660682107711; 
 Tue, 16 Aug 2022 13:35:07 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 31/33] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Tue, 16 Aug 2022 15:33:58 -0500
Message-Id: <20220816203400.161187-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b777742643..322a09c503 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, int diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1368,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2319,11 +2324,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2346,11 +2357,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2918,7 +2935,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4262,23 +4280,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
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


