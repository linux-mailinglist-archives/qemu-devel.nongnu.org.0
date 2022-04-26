Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622D51044E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:49:15 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njONF-0004E8-Qu
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-00031e-5P
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5i-0003r5-7I
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:08 -0400
Received: by mail-pg1-x534.google.com with SMTP id 15so8134887pgf.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zO7Eay0fSwC1ONHg70kqbIkUj5MYmUIqyNT7OSpouWo=;
 b=S6LJ1IsdEaLX6u2F4ufUiF7GbRCz2YTFp02ZLmsmuWU45AAW/kVcjliNW6XnSapZjl
 diaeIbsVhLqwoSdAI15e9NP9Vj0c4sgWBDFAqwfUzrI+RPY7Wxsw+FNnHYr3jrfSvGFG
 9hI5USKhG1Cff7v7kD4KKztr9YohXtVeZX0ZKwc+WdwIvOm8Qh3QP1owoJpiACaUr59C
 M5PFbxwSK/3ETKuxTejWT9RWSac4aKONVUJjsVLmK6d8ux3QYIARvNuySgv1YmPpqi/R
 StJcqsa54YjshXrF0WSij2KrYSf/PIa6lOc/FSiIw5/VuXkigxAvcYYj7Bubbe4jW2D8
 lKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zO7Eay0fSwC1ONHg70kqbIkUj5MYmUIqyNT7OSpouWo=;
 b=M7LOzNuLP+aK8/r8sgqtfR/devw1F+CnX7mZ+mSEBZ/oJH4t/dj90i2rbRcmGDN+r+
 UhAm8PGwtLHYcC5Gbv71hUycNQJM3SMiEs9v9CT81a4y3IF+GNrl9ELNV4PqKB5hvRQh
 4bjURoxvQwLdFeYl/Y6Uoo0QnpFjSCBfX6KOwVwMfNhNggQyM8VtEot/snWXNTr4YTSb
 QZ8SeXBZB1vX770irHaRbCeRVvM2gi7w9bl5rF2tHLD5uz9I/GNKJ9SCu77NvSpVUyoi
 cQkuVEFJDoEwXKNgsx1tnRDITr7IBSiWyvork4IWsSceQTJL8risuKNmJ6GmogtgAyrK
 kBYw==
X-Gm-Message-State: AOAM530fRw068Xqb/mrCHmVVhH+CnJ/doabv8R3F5g0do6KUw3esg68O
 zPfuDAP8ho4k00YZxxesFMokugbdhVUieg==
X-Google-Smtp-Source: ABdhPJzAVgEkHPKWhxkDCclvNfkIUhQ1qnGinI2aBRM6x/wqSQ2fmnOfKuu8/l6HFUIeWE7NcX9/Jw==
X-Received: by 2002:aa7:9085:0:b0:50d:35ae:271 with SMTP id
 i5-20020aa79085000000b0050d35ae0271mr14122781pfa.42.1650990664718; 
 Tue, 26 Apr 2022 09:31:04 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/47] target/arm: Use tcg_constant in 2misc expanders
Date: Tue, 26 Apr 2022 09:30:16 -0700
Message-Id: <20220426163043.100432-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 36c714a5ed..35dc21da8f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10088,7 +10088,7 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
     int passes = scalar ? 1 : 2;
 
     if (scalar) {
-        tcg_res[1] = tcg_const_i32(0);
+        tcg_res[1] = tcg_constant_i32(0);
     }
 
     for (pass = 0; pass < passes; pass++) {
@@ -10266,9 +10266,7 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
 
             if (is_scalar) {
-                TCGv_i64 tcg_zero = tcg_const_i64(0);
-                write_vec_element(s, tcg_zero, rd, 0, MO_64);
-                tcg_temp_free_i64(tcg_zero);
+                write_vec_element(s, tcg_constant_i64(0), rd, 0, MO_64);
             }
             write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
         }
@@ -10451,23 +10449,17 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1c: /* FCVTAS */
         case 0x3a: /* FCVTPS */
         case 0x3b: /* FCVTZS */
-        {
-            TCGv_i32 tcg_shift = tcg_const_i32(0);
-            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-            tcg_temp_free_i32(tcg_shift);
+            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_constant_i32(0),
+                                 tcg_fpstatus);
             break;
-        }
         case 0x5a: /* FCVTNU */
         case 0x5b: /* FCVTMU */
         case 0x5c: /* FCVTAU */
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
-        {
-            TCGv_i32 tcg_shift = tcg_const_i32(0);
-            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-            tcg_temp_free_i32(tcg_shift);
+            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_constant_i32(0),
+                                 tcg_fpstatus);
             break;
-        }
         default:
             g_assert_not_reached();
         }
@@ -10639,8 +10631,7 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     read_vec_element(s, tcg_final, rd, is_q ? 1 : 0, MO_64);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -10658,9 +10649,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i64(tcg_final);
@@ -12364,7 +12352,7 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
         }
     }
     if (!is_q) {
-        tcg_res[1] = tcg_const_i64(0);
+        tcg_res[1] = tcg_constant_i64(0);
     }
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
@@ -12797,25 +12785,17 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x1c: /* FCVTAS */
                 case 0x3a: /* FCVTPS */
                 case 0x3b: /* FCVTZS */
-                {
-                    TCGv_i32 tcg_shift = tcg_const_i32(0);
                     gen_helper_vfp_tosls(tcg_res, tcg_op,
-                                         tcg_shift, tcg_fpstatus);
-                    tcg_temp_free_i32(tcg_shift);
+                                         tcg_constant_i32(0), tcg_fpstatus);
                     break;
-                }
                 case 0x5a: /* FCVTNU */
                 case 0x5b: /* FCVTMU */
                 case 0x5c: /* FCVTAU */
                 case 0x7a: /* FCVTPU */
                 case 0x7b: /* FCVTZU */
-                {
-                    TCGv_i32 tcg_shift = tcg_const_i32(0);
                     gen_helper_vfp_touls(tcg_res, tcg_op,
-                                         tcg_shift, tcg_fpstatus);
-                    tcg_temp_free_i32(tcg_shift);
+                                         tcg_constant_i32(0), tcg_fpstatus);
                     break;
-                }
                 case 0x18: /* FRINTN */
                 case 0x19: /* FRINTM */
                 case 0x38: /* FRINTP */
-- 
2.34.1


