Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34766B2E8F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMax-0006e5-OD; Thu, 09 Mar 2023 15:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaP-0005Y8-7q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:03 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaN-0001db-8u
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so3153632pjg.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2vISXCsJz1yWTjpl9GMpXlNWhrXVqZJKduNe6BaHQk=;
 b=EK7gWEExQofQ3TWdiANHoaevvqXEh8T42AOJJhMD3ZCSoQxDwxdA8Z/mVsI8q8Sac3
 ZaI+LxvsDPPKCkacBA6QdzJiFWI6UCq3uTCocwRpVNUZ2IPMlzPjcgv5HBHGOIl/WzR5
 xfsxdiTaOqDau6MQpa14up9evHM3z8y/GktM7DABmWE7ffjwf1Z7jwPK6qdCTCOu0cyL
 L6hb8i0GX39Sfy0Bw+1KrNtezk5w5D+knrCobkoqf1cwKBsj1gGLoHy+hEUrWRH3eoUj
 JN9/cbJs1qDJBrmK9jau6ZEy+1vZWp1oeiukcUGlvVY1ALkFM0IEJpPyHBbNXqcb6WwH
 uqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2vISXCsJz1yWTjpl9GMpXlNWhrXVqZJKduNe6BaHQk=;
 b=3jWH5TweIexe/kJbPswb75Bnc+oiYhOaSRWltebxtgzvd4CsAbESAK1NonHrYaaOMP
 u7bmd0OA14QPwSZsS/DJJQD9DrBUsmmiWVM+MzZ0fohAw6Rw6XFNN7Z8wsP0PKfcx2MG
 CLfFxoac2hdb3gXyYev+D87pxfp8GD2P5wCwskYHx70r8iomJSgY+8I0GwTji3Rqrp0z
 EzGkL5kKpGAUQ5sJ58Xt/M7Bx7TPW5R6BvBq+6Bix0yApEOsaHbfismOSGckhYvMMLO6
 O5LGm2zhtHMDDZ28KHsT5XqCyp1fJHMJZtGe+LfT17F55fX5S7BOiuJhgbJc5xr0DFIt
 SJ6g==
X-Gm-Message-State: AO0yUKXqWqYlWQfUcfnEa3k8T/Qztfv9LcUESpL2Ipao4iPuaI+eQpOx
 Wq+Lv/qn8nziaaL3ljOyNw2XdChPoAlDPM/QgaQ=
X-Google-Smtp-Source: AK7set9VnpGkPq9mWmkmxXP1ng+sudQBFqYIFUGD05DwrNijlLinRd4ue4o7If1aAL8zZeGKSaSdVw==
X-Received: by 2002:a17:902:eb8a:b0:19c:bd10:3d40 with SMTP id
 q10-20020a170902eb8a00b0019cbd103d40mr26198938plg.40.1678392597977; 
 Thu, 09 Mar 2023 12:09:57 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 75/91] target/arm: Avoid tcg_const_* in translate-mve.c
Date: Thu,  9 Mar 2023 12:05:34 -0800
Message-Id: <20230309200550.3878088-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

All uses are in the context of an accumulator conditionally
having a zero input.  Split the rda variable to rda_{i,o},
and set rda_i to tcg_constant_foo(0) when required.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-mve.c | 54 ++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index 9744bf3de0..31fb2110f1 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -1150,7 +1150,7 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s) ||
@@ -1177,21 +1177,22 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current rda value, not 0.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
@@ -1258,7 +1259,7 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
 static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         !mve_check_qreg_bank(s, a->qn) ||
@@ -1278,13 +1279,14 @@ static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
      * beat must start with the current rda value, not 0.
      */
     if (a->a || mve_skip_first_beat(s)) {
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
-    store_reg(s, a->rda, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1396,7 +1398,7 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
         { NULL, NULL }
     };
     TCGv_ptr qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         a->size == 3) {
@@ -1413,15 +1415,16 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
      */
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from Rda */
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
     qm = mve_qreg_ptr(a->qm);
-    fns[a->size][a->u](rda, cpu_env, qm, rda);
-    store_reg(s, a->rda, rda);
+    fns[a->size][a->u](rda_o, cpu_env, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1436,7 +1439,7 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * No need to check Qm's bank: it is only 3 bits in decode.
      */
     TCGv_ptr qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s)) {
@@ -1458,28 +1461,29 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current value of RdaHi:RdaLo, not zero.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from RdaHi:RdaLo */
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
     qm = mve_qreg_ptr(a->qm);
     if (a->u) {
-        gen_helper_mve_vaddlv_u(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_u(rda_o, cpu_env, qm, rda_i);
     } else {
-        gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_s(rda_o, cpu_env, qm, rda_i);
     }
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
-- 
2.34.1


