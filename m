Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2225103CD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:43:33 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOHk-0002AA-IJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5k-00030L-NT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5i-0003qf-46
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fv2so3562359pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+yFGmARPVSb9cy4VxrwoGvk0FUr7de0EImLy5Edo1hU=;
 b=P2ucLjXQ0yzY1LPLLxZnQp8HmTEOGKo0w2d94T++rCYThwgPqE72Old8XG5aRzWa13
 QhDn536l6aTA0IlxwuQTiEmbaJ8h9a+5JkdZNz75824b7knHC2DGOcBRa4yKUzXy1GIv
 e6gwv5qKK0kwdlFM4Ia+kCybxHHmWYt17RPbg/bHSed4ogrg+U8dbR48ScF6oHi9xLDu
 gLtuS2SXDUpUbqqn/Cm7QkLNNGxuHECEWlRkg5rW5p13IPzwBEcX25FwUl90IE0muM7E
 +s+SODl5vT55e81FHcytuNwyUfRRebmkzSbk6sebPucDluILrKNo5gAGd1Rzu38o0JkP
 BWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+yFGmARPVSb9cy4VxrwoGvk0FUr7de0EImLy5Edo1hU=;
 b=nfNWhDCEWoln3nIWYKb/luBUKjokb3SAzTAwCgP7jHdP1SBmCnoOpKM3TKT+TNG4tR
 m6a+wYoGjTryUdRf2+7ZG+VGb+VABUbst6R26DSEcc9dzCOABJA2PY/hHCvHV5rXbK16
 bm4df3es7zw1FwWS1btNESfQmsLKHuCz86fzgNISp6Os5RJUzUfjBzlNlV0Qk3Z2xqw0
 jdN1dJ7k9Qmpi7ISJ4w8mrUl0/NcrGVvJ63a4ncAdL49h4ag+Q0AGUZaIOJBlfSR35RH
 6j8ci8M0VbEMwNPt5TksF6Jjq8/rg9ddlaAUmaQBe4hOGWN0t47U8P5DnzpEonSHXwE0
 Z8Wg==
X-Gm-Message-State: AOAM530XN/N6StUGxnIFHrclBeqjWs9AlkH16Oa1eqqvT6XP/2fA/ZCZ
 lkHnNqr0/rWCOL+y8hn6jYdr6/HeqtMTIA==
X-Google-Smtp-Source: ABdhPJye6PFu3mX65VZ27JV2rA8+HVCpMIdgo05eKizomQQAGu6XW68Do5YaZFlH013+V+Jja2u9QA==
X-Received: by 2002:a17:90a:aa8b:b0:1d9:868c:b4c5 with SMTP id
 l11-20020a17090aaa8b00b001d9868cb4c5mr9968147pjq.198.1650990663994; 
 Tue, 26 Apr 2022 09:31:03 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/47] target/arm: Use tcg_constant in simd fp/int conversion
Date: Tue, 26 Apr 2022 09:30:15 -0700
Message-Id: <20220426163043.100432-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/arm/translate-a64.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 45abac6892..36c714a5ed 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8727,7 +8727,7 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     int pass;
 
     if (fracbits || size == MO_64) {
-        tcg_shift = tcg_const_i32(fracbits);
+        tcg_shift = tcg_constant_i32(fracbits);
     }
 
     if (size == MO_64) {
@@ -8812,9 +8812,6 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     }
 
     tcg_temp_free_ptr(tcg_fpst);
-    if (tcg_shift) {
-        tcg_temp_free_i32(tcg_shift);
-    }
 
     clear_vec_high(s, elements << size == 16, rd);
 }
@@ -8904,7 +8901,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
-    tcg_shift = tcg_const_i32(fracbits);
+    tcg_shift = tcg_constant_i32(fracbits);
 
     if (size == MO_64) {
         int maxpass = is_scalar ? 1 : 2;
@@ -8962,7 +8959,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    tcg_temp_free_i32(tcg_shift);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     tcg_temp_free_ptr(tcg_fpstatus);
     tcg_temp_free_i32(tcg_rmode);
@@ -9834,23 +9830,15 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x1c: /* FCVTAS */
     case 0x3a: /* FCVTPS */
     case 0x3b: /* FCVTZS */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x5a: /* FCVTNU */
     case 0x5b: /* FCVTMU */
     case 0x5c: /* FCVTAU */
     case 0x7a: /* FCVTPU */
     case 0x7b: /* FCVTZU */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x18: /* FRINTN */
     case 0x19: /* FRINTM */
     case 0x38: /* FRINTP */
@@ -9890,7 +9878,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
 
     if (is_double) {
         TCGv_i64 tcg_op = tcg_temp_new_i64();
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         TCGv_i64 tcg_res = tcg_temp_new_i64();
         NeonGenTwoDoubleOpFn *genfn;
         bool swap = false;
@@ -9926,13 +9914,12 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
         tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_zero);
         tcg_temp_free_i64(tcg_op);
 
         clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
-        TCGv_i32 tcg_zero = tcg_const_i32(0);
+        TCGv_i32 tcg_zero = tcg_constant_i32(0);
         TCGv_i32 tcg_res = tcg_temp_new_i32();
         NeonGenTwoSingleOpFn *genfn;
         bool swap = false;
@@ -10001,7 +9988,6 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             }
         }
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
         tcg_temp_free_i32(tcg_op);
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
-- 
2.34.1


