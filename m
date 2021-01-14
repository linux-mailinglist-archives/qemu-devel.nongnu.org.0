Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D752F573D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:30:36 +0100 (CET)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsPD-00028e-Qc
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCc-0003ef-DG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:34 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCP-0003TH-5O
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:31 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c132so2752449pga.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSdOJnq5o42NhYADknuNWjZocBsJJt/CxyEeh2zDN58=;
 b=Xd/QJUhpQJZW/Ni4gTWzHqvrc8CYsDrabctg+7HSgq28PPv8RaTHFIpEnjYpL2yBfe
 I6NP2utAz5hh4Bhh/FOLfJZLPAufm/CuGgyvTez9ftj+79vNqGVoEXkjl/Z6ORIWncSI
 IcYuAk/U4mON/J2ctPIDJJoOab26tP4DOA7fvq5TKwGaSgurWEguhkZZXEdcKLCSnJpF
 0WVbueH3guqwcMwOw1UpsZ6gxFb2b/Vn4DJ1pIEyb8lFYGdhm6wpcwsY+KAn4dbpglqP
 LKaL95Eb+OqeWXyiuV5X6H9jsf5sI0hZ4IFPpaDvc3SPvT72zJggkiijeRs98BEItzju
 PaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSdOJnq5o42NhYADknuNWjZocBsJJt/CxyEeh2zDN58=;
 b=sh0TJi7iW+nD6Q+lzfICzHE18sHxax9wczzdAr2+IZhIpXL+2sWhhLms6EE820/9X9
 dt3PnYa5GYvOEUurs5quHh26ffNJHG7rC1WHkICzrzh7KtOqgi/h5f2cko1/Rzcpzm9R
 g/oa+4g9ziNDxp1I21LfzyVjxtFypzz2B1HMtU36Hd4ZiRFUMcDLUA+X8KbQWc7O84lX
 xaFnbO9qoLwe1M9fp+Fc1xqlc8gy8SINOUvUj9JmL8mvwX9Gw3VzA2scCA3gkuPRh7Pj
 l/IBcj+DPeB/GBLZfw9xeeHoaD6IwTsPYlfLGh+agVFLFJQU2X4Mle7Y3vs99xdnh2PT
 7SOQ==
X-Gm-Message-State: AOAM530JRtb0NDHONHs1ZMX2OsiyKHqjvTFf3/UBrFdMAG6MBHYg3gDf
 4LWu4fwiaqeRIlLofFvea2IoFHzHhdCIXQ==
X-Google-Smtp-Source: ABdhPJwI66Bvq0a/rQhF4Zc3uJ1UB/sL60fSKbbZks1lBVjjbUUuyk9CjO9zrWFA6p5aCjClmiglLg==
X-Received: by 2002:a65:4983:: with SMTP id r3mr5153361pgs.288.1610590638497; 
 Wed, 13 Jan 2021 18:17:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] tcg: Convert tcg_gen_dupi_vec to TCG_CONST
Date: Wed, 13 Jan 2021 16:16:42 -1000
Message-Id: <20210114021654.647242-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because we now store uint64_t in TCGTemp, we can now always
store the full 64-bit duplicate immediate.  So remove the
difference between 32- and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c   |  9 ++++-----
 tcg/tcg-op-vec.c | 39 ++++++++++-----------------------------
 tcg/tcg.c        |  7 +------
 3 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bda727d5ed..dbb03ef96b 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1120,11 +1120,10 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[1])->val;
-                if (tmp == arg_info(op->args[2])->val) {
-                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
-                    break;
-                }
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0],
+                                 deposit64(arg_info(op->args[1])->val, 32, 32,
+                                           arg_info(op->args[2])->val));
+                break;
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index cdbf11c573..9fbed1366c 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -216,25 +216,17 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-#define MO_REG  (TCG_TARGET_REG_BITS == 64 ? MO_64 : MO_32)
-
-static void do_dupi_vec(TCGv_vec r, unsigned vece, TCGArg a)
-{
-    TCGTemp *rt = tcgv_vec_temp(r);
-    vec_gen_2(INDEX_op_dupi_vec, rt->base_type, vece, temp_arg(rt), a);
-}
-
 TCGv_vec tcg_const_zeros_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, 0);
+    tcg_gen_dupi_vec(MO_64, ret, 0);
     return ret;
 }
 
 TCGv_vec tcg_const_ones_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, -1);
+    tcg_gen_dupi_vec(MO_64, ret, -1);
     return ret;
 }
 
@@ -252,39 +244,28 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
 
 void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
 {
-    if (TCG_TARGET_REG_BITS == 64) {
-        do_dupi_vec(r, MO_64, a);
-    } else if (a == dup_const(MO_32, a)) {
-        do_dupi_vec(r, MO_32, a);
-    } else {
-        TCGv_i64 c = tcg_const_i64(a);
-        tcg_gen_dup_i64_vec(MO_64, r, c);
-        tcg_temp_free_i64(c);
-    }
+    tcg_gen_dupi_vec(MO_64, r, a);
 }
 
 void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_32, a));
+    tcg_gen_dupi_vec(MO_32, r, a);
 }
 
 void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_16, a));
+    tcg_gen_dupi_vec(MO_16, r, a);
 }
 
 void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_8, a));
+    tcg_gen_dupi_vec(MO_8, r, a);
 }
 
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
-    if (vece == MO_64) {
-        tcg_gen_dup64i_vec(r, a);
-    } else {
-        do_dupi_vec(r, MO_REG, dup_const(vece, a));
-    }
+    TCGTemp *rt = tcgv_vec_temp(r);
+    tcg_gen_mov_vec(r, tcg_constant_vec(rt->base_type, vece, a));
 }
 
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec r, TCGv_i64 a)
@@ -489,8 +470,8 @@ void tcg_gen_abs_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
             if (tcg_can_emit_vec_op(INDEX_op_sari_vec, type, vece) > 0) {
                 tcg_gen_sari_vec(vece, t, a, (8 << vece) - 1);
             } else {
-                do_dupi_vec(t, MO_REG, 0);
-                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a, t);
+                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a,
+                                tcg_constant_vec(type, vece, 0));
             }
             tcg_gen_xor_vec(vece, r, a, t);
             tcg_gen_sub_vec(vece, r, r, t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 802f0b8a32..ad1348d811 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3539,16 +3539,11 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
              * The targets will, in general, have to do this search anyway,
              * do this generically.
              */
-            if (TCG_TARGET_REG_BITS == 32) {
-                val = dup_const(MO_32, val);
-                vece = MO_32;
-            }
             if (val == dup_const(MO_8, val)) {
                 vece = MO_8;
             } else if (val == dup_const(MO_16, val)) {
                 vece = MO_16;
-            } else if (TCG_TARGET_REG_BITS == 64 &&
-                       val == dup_const(MO_32, val)) {
+            } else if (val == dup_const(MO_32, val)) {
                 vece = MO_32;
             }
 
-- 
2.25.1


