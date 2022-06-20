Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F655239D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:12:24 +0200 (CEST)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lst-000835-VW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaD-0006Lh-7O
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0001LQ-A7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id u37so10871622pfg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBZdPZWCdnFknqirCWCAN0zMysKwnh33zUMVY3zWbxw=;
 b=FZiabnho1cum3ns3xswFm8T2y9GIqCg3ZG0BOpV0wDB87bylJ9YQlCwtsBRvJsmiQZ
 jKVj0ak1UYHwxKdnuO8KvE1dU5kp8dagj3Us4rTVFJ7tbcuQVo+9R8VOm9EHZrw1tLoa
 li4BzXIR7NktaXKLJEaS/JLGspiFNFZCNoylpmw2Z0718HYtgTl0oDt/Xp7SsfSffqWM
 zhbuz0kr4+3NUPFPidZ3erS5T3LpDSwWKuWUd2foQ5wCIX9TPNMBLy4JKb9LBWMqfxlN
 zgLKtafQ/DIjqz0g0fv3U29ScfsT4Vvkel/26VoyC0Xtgno0Ex+wrm7iUzYc0t9KSfKn
 tNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBZdPZWCdnFknqirCWCAN0zMysKwnh33zUMVY3zWbxw=;
 b=C6xTD/rGzU91zjGxb3lcZl4mm1i3jf5ih0yR/wWrtc4B1k7cYWzLqNMly78wh0XmG6
 8Kp5QXtXtQiaqn4u6dBchnXEz2fLfEsmpdN8IaxNCQJQkemHb5D7t4WSMza2vclR/13G
 Invc5LHr20BqppTHIlDcriJz0C+S2nQq2abPoM4BShWEUUjDOH7qYlOQNoSoOCQNOa65
 Ekp8vMOL26ka9iUpK92gHRM328l8vwHELWeQMbZw39pR10YH4EAT2FdNgtHePXmaqo/C
 g9cEWZmGsCLQH/2FB8DqwV0vg8cABKrLkV1rtu0xG6MuVlwTur3RUMWRJn4z8Mq60h66
 RFcw==
X-Gm-Message-State: AJIora//TqHfbNQ9sizTstJJSMgYtSYdrmS1BYfgIkBkmkpz0hSnMr4O
 6ReuEMNAC6zOQo2OoyWrj8cyiArOVf50Yw==
X-Google-Smtp-Source: AGRyM1vu4BXPXxkqytnb1gA74e92G3A+vVllNad3+v/b/ocM1Xny8J2X8BY/eURQ6S2seq/4VH9blg==
X-Received: by 2002:a05:6a00:22d5:b0:525:1ff0:b042 with SMTP id
 f21-20020a056a0022d500b005251ff0b042mr7734746pfj.80.1655747580146; 
 Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 27/51] target/arm: Export unpredicated ld/st from
 translate-sve.c
Date: Mon, 20 Jun 2022 10:52:11 -0700
Message-Id: <20220620175235.60881-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Add a TCGv_ptr base argument, which will be cpu_env for SVE.
We will reuse this for SME save and restore array insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  3 +++
 target/arm/translate-sve.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index c341c95582..54503745a9 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -165,4 +165,7 @@ void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t rm_ofs, int64_t shift,
                   uint32_t opr_sz, uint32_t max_sz);
 
+void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 13bdd027a5..adf0cd3e68 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4294,7 +4294,8 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4320,7 +4321,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
-            tcg_gen_st_i64(t0, cpu_env, vofs + i);
+            tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4333,6 +4334,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4340,7 +4347,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
 
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
         tcg_temp_free_ptr(tp);
@@ -4348,6 +4355,11 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /*
@@ -4376,13 +4388,14 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         default:
             g_assert_not_reached();
         }
-        tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_st_i64(t0, base, vofs + len_align);
         tcg_temp_free_i64(t0);
     }
 }
 
 /* Similarly for stores.  */
-static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4408,7 +4421,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+            tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4422,11 +4435,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_temp_free_ptr(tp);
@@ -4437,12 +4456,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
         t0 = tcg_temp_new_i64();
-        tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_ld_i64(t0, base, vofs + len_align);
 
         switch (len_remain) {
         case 2:
@@ -4474,7 +4498,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4487,7 +4511,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4500,7 +4524,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4513,7 +4537,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
-- 
2.34.1


