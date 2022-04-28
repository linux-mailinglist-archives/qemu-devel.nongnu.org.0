Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C651376F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:53:46 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Wb-0001UT-JA
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ji-0005O7-Jl
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jf-0006IO-27
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j15so7107809wrb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wZX7t2dCQHv+Iqs+vKv+j6rahLhwPQ36M5v77ocHIAQ=;
 b=fnpYCX65Umxf0GTTsA8xM3uWwRV+AOXQaaPP6ZWW32bJjhQVAmiGWU5zrA7WBTGmU7
 T/1ySYbaQMmmkFCHXgYZwEcBJhC4F+rjGE95684b2STvRn5wNnej3har3QbXQDib7I27
 C0irToHv8snpDv5Cyv5yEtuhSmzNCZylDZ7m6WHt7mRyE/Pi6SZRkfV79tjyKcI6XVjH
 zK9yj5UFKhCisWlMHqKlhyfAu4XJioD07R7L7ID3e6nDarUsHuaB5vwF6H7FQ+wr6uQw
 mmUOADSlQoogxXeXqlG2Sh4w+KPKsJvYVM6y0BoyG1zyZ5EsRDf5NomShjRRCz9a+xHR
 NUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZX7t2dCQHv+Iqs+vKv+j6rahLhwPQ36M5v77ocHIAQ=;
 b=7pE5FIahb7BpJ8UPDrVZXwXAnz5yyvr93eDCgo+uaQaL2DpZlZI9j3BO9Uc6LxNBRe
 sVaeBTsuC2DxGSZ87NCMhlBr2+rL9ZGXDM/f4u+zF++Qz/I+c9hxStZNVJh/KJc+W1gf
 obCn9nh+Tppvfkb1S1L87ZCbrpoBPnYRVqq8QtFrgdW67qKZJkPoSqMWiXWr6neUTtDC
 MllP5zLY4+55e/J5rC/n+GGpurNP0XkHujm2vppBlbC8fXsDfY9rxi1/HIS7TznhdHTB
 bfUTDkFLqGG78r+utikAtOBNiCGo+iOruZymyf4tj78Pc8FyAo7RfbOEROEyreM33Eeb
 DYkg==
X-Gm-Message-State: AOAM531RsjWgrflZMbsMclfuoATO/6nOriIWRiH2zn7PdlY6BrQklx3U
 /2XmMztJoQH8ZqHc35lVsgDQxG8CT2CVFQ==
X-Google-Smtp-Source: ABdhPJxGb0rwTJiwlV/xUNsY23O44nnq5Srq38MhT/q7H8djvwlJ67wUjWJrvuAZzMeaPXoYcNAW2g==
X-Received: by 2002:adf:ec51:0:b0:20a:cd42:fe3b with SMTP id
 w17-20020adfec51000000b0020acd42fe3bmr24225466wrn.719.1651156821822; 
 Thu, 28 Apr 2022 07:40:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/54] target/arm: Use tcg_constant in 2misc expanders
Date: Thu, 28 Apr 2022 15:39:24 +0100
Message-Id: <20220428143958.2451229-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cae0444e2db..1c2ffe37d93 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10089,7 +10089,7 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
     int passes = scalar ? 1 : 2;
 
     if (scalar) {
-        tcg_res[1] = tcg_const_i32(0);
+        tcg_res[1] = tcg_constant_i32(0);
     }
 
     for (pass = 0; pass < passes; pass++) {
@@ -10267,9 +10267,7 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
 
             if (is_scalar) {
-                TCGv_i64 tcg_zero = tcg_const_i64(0);
-                write_vec_element(s, tcg_zero, rd, 0, MO_64);
-                tcg_temp_free_i64(tcg_zero);
+                write_vec_element(s, tcg_constant_i64(0), rd, 0, MO_64);
             }
             write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
         }
@@ -10452,23 +10450,17 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10640,8 +10632,7 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     read_vec_element(s, tcg_final, rd, is_q ? 1 : 0, MO_64);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -10659,9 +10650,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i64(tcg_final);
@@ -12365,7 +12353,7 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
         }
     }
     if (!is_q) {
-        tcg_res[1] = tcg_const_i64(0);
+        tcg_res[1] = tcg_constant_i64(0);
     }
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
@@ -12798,25 +12786,17 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
2.25.1


