Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F8B5F160B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 00:21:28 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeONr-00068t-3Q
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 18:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6b-00025F-AC
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:37 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:41609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6U-0002a9-Fj
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:36 -0400
Received: by mail-qv1-xf35.google.com with SMTP id l14so3627535qvq.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hvGMsQzzrx+sQNIbudB82iz6OLqksguoV+s5DVfw4Xw=;
 b=eiaoGbG450p/2PA7qXJpqyzZs4PMTJa8rAvZ+khC+reyG6yeLvAHLGKxEaXBMXY/tX
 qliOHqPBH9/IRNB/N2zd8By82qWXe+GoipPCwrtbw5fIi1nUslUkOdyzjIid4MyCfZ3Q
 LNwlovEr7wCen3Bjvb14wlS0cvQrG3PZbQwr3TFZXB+/7gfcVLnd8ZfE0+m/06J5lirP
 zRNwvSBvaC1Lf6+qS80V6IwlH2CtKhGPqBmAzDejAQxwj2ZIWYi+QpOgYCOhQbnJJFgW
 TWMI9fAEHYgfnAdx8VCOLBgFRL5xexpF6gtMnSVP4VkFBmngs9P5BZFhU1gPkggkTkf4
 wH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hvGMsQzzrx+sQNIbudB82iz6OLqksguoV+s5DVfw4Xw=;
 b=z1TgA1MMhCkr/K7PiydLdV9nDDMe4k5sHWW13lxfF6O1b1C/R+IxbFn3ACuG/rVTog
 ZuV7WQNM/w8Zk832DyQJieoc7eWHrP+e6f+ZEOFhLrsLru+fPkHgLlSwT9BNh2cLywet
 8J85R7EIUe3EGI50st9Ae/mjt+Tv5uZDED3HkqpLp0H3LicN2WJfOZeTjl6yZ35OqZbu
 DB7Xs8jV0Ws6FfwPswtRLrjP0fDCHhdZqElmH5Ag856a80gtuf8lCKQcC0mOVTYbg3H7
 8Iz1MDGaI8qk8qpAeOffI1eiIV9aBvUShMbIYjXb0eKB6/EColAEirJ5usPQKVp7wdpq
 QCOg==
X-Gm-Message-State: ACrzQf1PoS1d7E46I8tiG8OMnwHVR7DVvKRmi4T6uYiuNRZ1p8WGG1im
 yVzO/1inWp5DjLd9hsy7RvRk6FMJOfcapA==
X-Google-Smtp-Source: AMsMyM6AdsczepC1Ra8+aBETYyxCT+NXkEo4mNIzjt9HQHyvF9yveNbGfVIlcsQ5702ROCB67OTnbw==
X-Received: by 2002:a05:6214:27c1:b0:473:85c9:3eeb with SMTP id
 ge1-20020a05621427c100b0047385c93eebmr8830144qvb.53.1664575409138; 
 Fri, 30 Sep 2022 15:03:29 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Fri, 30 Sep 2022 15:03:10 -0700
Message-Id: <20220930220312.135327-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 005fd767fb..28a417fb2b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,14 @@ static void reset_btype(DisasContext *s)
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
@@ -1368,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2309,11 +2314,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2336,11 +2347,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2908,7 +2925,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4252,23 +4270,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
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


