Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1616B2E6F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeB-0001O3-Jn; Thu, 09 Mar 2023 15:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdn-0000aD-WB
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:34 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdk-0002Jn-Qj
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: by mail-pl1-x633.google.com with SMTP id h8so3208725plf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjOIZ5EQv+mPJcXiKX0Fq4Q7ChwmAlVw5eKwrOnmib8=;
 b=kTaw7g0EsUpYQf+YG1juMP1Wv8U9KA+GhsitlOHyo+cf96Z3fqhK/vBup4uFSPXw0I
 yPbRvWbXBb1GhwV5jJiuFdcaU4ZAtagKTJafYmWTFeNQooCH6rLsVUkTfQCap9BEzAe7
 wqoUL/AkfzNaI8p617z5lbM9+YmsdbgZmopGtMpPrrgcxdWrzTrxGhTGAWBNDJI0eibm
 yknQ+qi/A1VhbsgK38MC2Z7UeT4mOoQOXkdHCqjAdH3v4zeRrUmSkaMALmrXgGwzGr9z
 RsfK5f5+2/3A8F03oPWAGiCpNvGVUB/euVMZMjk3icTULu/CJebbz0zTGA8RJfaf2ztK
 YVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjOIZ5EQv+mPJcXiKX0Fq4Q7ChwmAlVw5eKwrOnmib8=;
 b=Sayp9rvc9FoQQMjrF017GR3pCUxTElftLuNCAat7ttCMX7A61y+gTDA7+UDzvgZGIo
 aBL1vfHMoJl0darMq/rQ57zgKgD0287XU+3CSxTjBrsXcoC9BuSiDdWhFZHI7CN52RKA
 CtMWQFdfi8T8gSzNAVR2O0xBg9+UwLZg02+Qw9kcgVKmh+zUmNC1S6dU+NDh9VgyKiti
 M78MVoV9SYb7BXHFDBG8rs+iWmK012mcE/qYaVDWuO4VJm9mm9m1i3Cpaou2USjxWQDK
 0tRO7a9vlmIW2NcHG1DdlyNuNtxBqZcfwH1hulwz7wChp0XT1vL4KyakWJ+aJO8CUr1f
 Ev1Q==
X-Gm-Message-State: AO0yUKV9kdJO8C+7aJZbmLPIFh/zRBisBEcbokL1dU4Q/e6ICsasHSZ9
 9Jja1OrAecoXbmr6asCD0ZBemlA7N7xrd91PCjI=
X-Google-Smtp-Source: AK7set+qX28fRe0grbP3PfrRJ0YiTGPRxpw5b3O9f5iyE3TQab7A4S52LXfEbrR33B1kqbrr4m1FHw==
X-Received: by 2002:a05:6a20:3ca7:b0:cd:18d7:f131 with SMTP id
 b39-20020a056a203ca700b000cd18d7f131mr25884047pzj.7.1678392800614; 
 Thu, 09 Mar 2023 12:13:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 90/91] tcg: Drop tcg_const_*_vec
Date: Thu,  9 Mar 2023 12:05:49 -0800
Message-Id: <20230309200550.3878088-91-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace with tcg_constant_vec*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  4 ----
 tcg/tcg-op-vec.c          | 34 ++--------------------------------
 tcg/i386/tcg-target.c.inc |  9 ++++-----
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 00c4fbe613..d620012c48 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -999,10 +999,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_vec tcg_const_zeros_vec(TCGType);
-TCGv_vec tcg_const_ones_vec(TCGType);
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
 /*
  * Locate or create a read-only temporary that is a constant.
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 0f023f42c6..aeeb2435cb 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -229,32 +229,6 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-TCGv_vec tcg_const_zeros_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, 0);
-    return ret;
-}
-
-TCGv_vec tcg_const_ones_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, -1);
-    return ret;
-}
-
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_zeros_vec(t->base_type);
-}
-
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_ones_vec(t->base_type);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
@@ -431,9 +405,7 @@ void tcg_gen_not_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_not_vec || !do_op2(vece, r, a, INDEX_op_not_vec)) {
-        TCGv_vec t = tcg_const_ones_vec_matching(r);
-        tcg_gen_xor_vec(0, r, a, t);
-        tcg_temp_free_vec(t);
+        tcg_gen_xor_vec(0, r, a, tcg_constant_vec_matching(r, 0, -1));
     }
     tcg_swap_vecop_list(hold_list);
 }
@@ -446,9 +418,7 @@ void tcg_gen_neg_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_neg_vec || !do_op2(vece, r, a, INDEX_op_neg_vec)) {
-        TCGv_vec t = tcg_const_zeros_vec_matching(r);
-        tcg_gen_sub_vec(vece, r, t, a);
-        tcg_temp_free_vec(t);
+        tcg_gen_sub_vec(vece, r, tcg_constant_vec_matching(r, vece, 0), a);
     }
     tcg_swap_vecop_list(hold_list);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4060a35cf6..4444eb9234 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3651,6 +3651,7 @@ static void expand_vec_sari(TCGType type, unsigned vece,
         break;
 
     case MO_64:
+        t1 = tcg_temp_new_vec(type);
         if (imm <= 32) {
             /*
              * We can emulate a small sign extend by performing an arithmetic
@@ -3659,24 +3660,22 @@ static void expand_vec_sari(TCGType type, unsigned vece,
              * does not, so we have to bound the smaller shift -- we get the
              * same result in the high half either way.
              */
-            t1 = tcg_temp_new_vec(type);
             tcg_gen_sari_vec(MO_32, t1, v1, MIN(imm, 31));
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             vec_gen_4(INDEX_op_x86_blend_vec, type, MO_32,
                       tcgv_vec_arg(v0), tcgv_vec_arg(v0),
                       tcgv_vec_arg(t1), 0xaa);
-            tcg_temp_free_vec(t1);
         } else {
             /* Otherwise we will need to use a compare vs 0 to produce
              * the sign-extend, shift and merge.
              */
-            t1 = tcg_const_zeros_vec(type);
-            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1, t1, v1);
+            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1,
+                            tcg_constant_vec(type, MO_64, 0), v1);
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             tcg_gen_shli_vec(MO_64, t1, t1, 64 - imm);
             tcg_gen_or_vec(MO_64, v0, v0, t1);
-            tcg_temp_free_vec(t1);
         }
+        tcg_temp_free_vec(t1);
         break;
 
     default:
-- 
2.34.1


