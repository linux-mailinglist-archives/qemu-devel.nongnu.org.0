Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E6370D7D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:59:25 +0200 (CEST)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDZ5-0006bH-NE
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKm-0001Y6-Rz
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:36 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKj-0005Et-44
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h11so2438172pfn.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uY22gRg+QPJnEc4mZ70azfZwv/HbyO7ImLO00TxJf58=;
 b=qGGnzUIBaFTtjgFLP/MimU9N0PTv1f15UTcQiLwXkG5dHAICabRKRqel9vu6fIN2QP
 Ix5pffpKT3KWojREk7QrJpNByLukC23jA9Jh5oGWi1CUvPTy0EhzLB3zCos+MAGPojzI
 gjEYqw2sHXtA+E080eIMQd/WBptA8ypPr3Tm3dm+PZ+dA2efeC94pVuGbJc2+e3c9FnI
 lGNdthvEYZTdBXkktgN/RMPFOdHC0LvczZRNQLGt8qMIVshgx/Fo1rbbtIqj0VmjYh36
 z8SOuoCsevh439AHeEe5QfVgVs9EWKbdaJ/AO0t9eR5NMttfycU85tnsqCVhasvnLwLQ
 Af9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uY22gRg+QPJnEc4mZ70azfZwv/HbyO7ImLO00TxJf58=;
 b=A+0J3YlHteebXUY5sbydgYQMtGrmi9s+hKiUHAAJqXKqMqI9AvUsMjIo2SYsgcJNfS
 xwp81bDC1K5FPVYFoinH31CSYogJY6d97C5JbDQ+0B42g+Yk77Ebj8q99NuWbBIJssTN
 2Nqlcddv3Z1u4VAyEOPivNCRowwma8pMMyJwPXsnOVq13hJO5S06fydGlz+3rg9mYRcY
 GexW1uLrHXWiwf6Rdfn7QtkrLeWYnD3IDOpj11i3WHDoAeoEJ9yFWmH1EzTb42kQ2K8t
 VclfpusDGTNi1KwHqPcGjOeSZXdcbo1z5Y7gyNgSheNQ/l2hYcE2kl9+qbmI9sQJ16mT
 W86Q==
X-Gm-Message-State: AOAM533TIMa0SBuchA+Tb/5Rin1zhBVN3idFTK3Ejx6+GEPO/7cy1ogg
 oVraNfZdHFvpXLem23DHvEQyNr57H1HGMQ==
X-Google-Smtp-Source: ABdhPJyen4CXiOrzM0PfZXS+6EgZhV7zpfggOUl6/umW3ANAyt4QKq56CkLoo0SsxkSxz/pDkPmw8Q==
X-Received: by 2002:aa7:914e:0:b029:28c:48d6:b27c with SMTP id
 14-20020aa7914e0000b029028c48d6b27cmr12906971pfi.79.1619966671619; 
 Sun, 02 May 2021 07:44:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/31] Hexagon (target/hexagon) use softfloat for
 float-to-int conversions
Date: Sun,  2 May 2021 07:44:05 -0700
Message-Id: <20210502144419.1659844-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Use the proper return for helpers that convert to unsigned
Remove target/hexagon/conv_emu.[ch]

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-13-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/conv_emu.h   |  31 -------
 target/hexagon/helper.h     |  16 ++--
 target/hexagon/conv_emu.c   | 177 ------------------------------------
 target/hexagon/fma_emu.c    |   1 -
 target/hexagon/op_helper.c  | 169 +++++++++++++++++++++++++---------
 tests/tcg/hexagon/fpstuff.c | 145 +++++++++++++++++++++++++++++
 target/hexagon/meson.build  |   1 -
 7 files changed, 281 insertions(+), 259 deletions(-)
 delete mode 100644 target/hexagon/conv_emu.h
 delete mode 100644 target/hexagon/conv_emu.c

diff --git a/target/hexagon/conv_emu.h b/target/hexagon/conv_emu.h
deleted file mode 100644
index cade9de91f..0000000000
--- a/target/hexagon/conv_emu.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HEXAGON_CONV_EMU_H
-#define HEXAGON_CONV_EMU_H
-
-uint64_t conv_sf_to_8u(float32 in, float_status *fp_status);
-uint32_t conv_sf_to_4u(float32 in, float_status *fp_status);
-int64_t conv_sf_to_8s(float32 in, float_status *fp_status);
-int32_t conv_sf_to_4s(float32 in, float_status *fp_status);
-
-uint64_t conv_df_to_8u(float64 in, float_status *fp_status);
-uint32_t conv_df_to_4u(float64 in, float_status *fp_status);
-int64_t conv_df_to_8s(float64 in, float_status *fp_status);
-int32_t conv_df_to_4s(float64 in, float_status *fp_status);
-
-#endif
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index a5f340ce67..715c24662f 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -38,21 +38,21 @@ DEF_HELPER_2(conv_ud2sf, f32, env, s64)
 DEF_HELPER_2(conv_ud2df, f64, env, s64)
 DEF_HELPER_2(conv_d2sf, f32, env, s64)
 DEF_HELPER_2(conv_d2df, f64, env, s64)
-DEF_HELPER_2(conv_sf2uw, s32, env, f32)
+DEF_HELPER_2(conv_sf2uw, i32, env, f32)
 DEF_HELPER_2(conv_sf2w, s32, env, f32)
-DEF_HELPER_2(conv_sf2ud, s64, env, f32)
+DEF_HELPER_2(conv_sf2ud, i64, env, f32)
 DEF_HELPER_2(conv_sf2d, s64, env, f32)
-DEF_HELPER_2(conv_df2uw, s32, env, f64)
+DEF_HELPER_2(conv_df2uw, i32, env, f64)
 DEF_HELPER_2(conv_df2w, s32, env, f64)
-DEF_HELPER_2(conv_df2ud, s64, env, f64)
+DEF_HELPER_2(conv_df2ud, i64, env, f64)
 DEF_HELPER_2(conv_df2d, s64, env, f64)
-DEF_HELPER_2(conv_sf2uw_chop, s32, env, f32)
+DEF_HELPER_2(conv_sf2uw_chop, i32, env, f32)
 DEF_HELPER_2(conv_sf2w_chop, s32, env, f32)
-DEF_HELPER_2(conv_sf2ud_chop, s64, env, f32)
+DEF_HELPER_2(conv_sf2ud_chop, i64, env, f32)
 DEF_HELPER_2(conv_sf2d_chop, s64, env, f32)
-DEF_HELPER_2(conv_df2uw_chop, s32, env, f64)
+DEF_HELPER_2(conv_df2uw_chop, i32, env, f64)
 DEF_HELPER_2(conv_df2w_chop, s32, env, f64)
-DEF_HELPER_2(conv_df2ud_chop, s64, env, f64)
+DEF_HELPER_2(conv_df2ud_chop, i64, env, f64)
 DEF_HELPER_2(conv_df2d_chop, s64, env, f64)
 DEF_HELPER_3(sfadd, f32, env, f32, f32)
 DEF_HELPER_3(sfsub, f32, env, f32, f32)
diff --git a/target/hexagon/conv_emu.c b/target/hexagon/conv_emu.c
deleted file mode 100644
index 3985b1032a..0000000000
--- a/target/hexagon/conv_emu.c
+++ /dev/null
@@ -1,177 +0,0 @@
-/*
- *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/host-utils.h"
-#include "fpu/softfloat.h"
-#include "macros.h"
-#include "conv_emu.h"
-
-#define LL_MAX_POS 0x7fffffffffffffffULL
-#define MAX_POS 0x7fffffffU
-
-static uint64_t conv_f64_to_8u_n(float64 in, int will_negate,
-                                 float_status *fp_status)
-{
-    uint8_t sign = float64_is_neg(in);
-    if (float64_is_infinity(in)) {
-        float_raise(float_flag_invalid, fp_status);
-        if (float64_is_neg(in)) {
-            return 0ULL;
-        } else {
-            return ~0ULL;
-        }
-    }
-    if (float64_is_any_nan(in)) {
-        float_raise(float_flag_invalid, fp_status);
-        return ~0ULL;
-    }
-    if (float64_is_zero(in)) {
-        return 0;
-    }
-    if (sign) {
-        float_raise(float_flag_invalid, fp_status);
-        return 0;
-    }
-    if (float64_lt(in, float64_half, fp_status)) {
-        /* Near zero, captures large fracshifts, denorms, etc */
-        float_raise(float_flag_inexact, fp_status);
-        switch (get_float_rounding_mode(fp_status)) {
-        case float_round_down:
-            if (will_negate) {
-                return 1;
-            } else {
-                return 0;
-            }
-        case float_round_up:
-            if (!will_negate) {
-                return 1;
-            } else {
-                return 0;
-            }
-        default:
-            return 0;    /* nearest or towards zero */
-        }
-    }
-    return float64_to_uint64(in, fp_status);
-}
-
-static void clr_float_exception_flags(uint8_t flag, float_status *fp_status)
-{
-    uint8_t flags = fp_status->float_exception_flags;
-    flags &= ~flag;
-    set_float_exception_flags(flags, fp_status);
-}
-
-static uint32_t conv_df_to_4u_n(float64 fp64, int will_negate,
-                                float_status *fp_status)
-{
-    uint64_t tmp;
-    tmp = conv_f64_to_8u_n(fp64, will_negate, fp_status);
-    if (tmp > 0x00000000ffffffffULL) {
-        clr_float_exception_flags(float_flag_inexact, fp_status);
-        float_raise(float_flag_invalid, fp_status);
-        return ~0U;
-    }
-    return (uint32_t)tmp;
-}
-
-uint64_t conv_df_to_8u(float64 in, float_status *fp_status)
-{
-    return conv_f64_to_8u_n(in, 0, fp_status);
-}
-
-uint32_t conv_df_to_4u(float64 in, float_status *fp_status)
-{
-    return conv_df_to_4u_n(in, 0, fp_status);
-}
-
-int64_t conv_df_to_8s(float64 in, float_status *fp_status)
-{
-    uint8_t sign = float64_is_neg(in);
-    uint64_t tmp;
-    if (float64_is_any_nan(in)) {
-        float_raise(float_flag_invalid, fp_status);
-        return -1;
-    }
-    if (sign) {
-        float64 minus_fp64 = float64_abs(in);
-        tmp = conv_f64_to_8u_n(minus_fp64, 1, fp_status);
-    } else {
-        tmp = conv_f64_to_8u_n(in, 0, fp_status);
-    }
-    if (tmp > (LL_MAX_POS + sign)) {
-        clr_float_exception_flags(float_flag_inexact, fp_status);
-        float_raise(float_flag_invalid, fp_status);
-        tmp = (LL_MAX_POS + sign);
-    }
-    if (sign) {
-        return -tmp;
-    } else {
-        return tmp;
-    }
-}
-
-int32_t conv_df_to_4s(float64 in, float_status *fp_status)
-{
-    uint8_t sign = float64_is_neg(in);
-    uint64_t tmp;
-    if (float64_is_any_nan(in)) {
-        float_raise(float_flag_invalid, fp_status);
-        return -1;
-    }
-    if (sign) {
-        float64 minus_fp64 = float64_abs(in);
-        tmp = conv_f64_to_8u_n(minus_fp64, 1, fp_status);
-    } else {
-        tmp = conv_f64_to_8u_n(in, 0, fp_status);
-    }
-    if (tmp > (MAX_POS + sign)) {
-        clr_float_exception_flags(float_flag_inexact, fp_status);
-        float_raise(float_flag_invalid, fp_status);
-        tmp = (MAX_POS + sign);
-    }
-    if (sign) {
-        return -tmp;
-    } else {
-        return tmp;
-    }
-}
-
-uint64_t conv_sf_to_8u(float32 in, float_status *fp_status)
-{
-    float64 fp64 = float32_to_float64(in, fp_status);
-    return conv_df_to_8u(fp64, fp_status);
-}
-
-uint32_t conv_sf_to_4u(float32 in, float_status *fp_status)
-{
-    float64 fp64 = float32_to_float64(in, fp_status);
-    return conv_df_to_4u(fp64, fp_status);
-}
-
-int64_t conv_sf_to_8s(float32 in, float_status *fp_status)
-{
-    float64 fp64 = float32_to_float64(in, fp_status);
-    return conv_df_to_8s(fp64, fp_status);
-}
-
-int32_t conv_sf_to_4s(float32 in, float_status *fp_status)
-{
-    float64 fp64 = float32_to_float64(in, fp_status);
-    return conv_df_to_4s(fp64, fp_status);
-}
diff --git a/target/hexagon/fma_emu.c b/target/hexagon/fma_emu.c
index f324b83e3c..d3b45d494f 100644
--- a/target/hexagon/fma_emu.c
+++ b/target/hexagon/fma_emu.c
@@ -19,7 +19,6 @@
 #include "qemu/int128.h"
 #include "fpu/softfloat.h"
 #include "macros.h"
-#include "conv_emu.h"
 #include "fma_emu.h"
 
 #define DF_INF_EXP     0x7ff
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 478421d147..b70c5d607a 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -25,7 +25,6 @@
 #include "arch.h"
 #include "hex_arch_types.h"
 #include "fma_emu.h"
-#include "conv_emu.h"
 
 #define SF_BIAS        127
 #define SF_MANTBITS    23
@@ -438,11 +437,17 @@ float64 HELPER(conv_d2df)(CPUHexagonState *env, int64_t RssV)
     return RddV;
 }
 
-int32_t HELPER(conv_sf2uw)(CPUHexagonState *env, float32 RsV)
+uint32_t HELPER(conv_sf2uw)(CPUHexagonState *env, float32 RsV)
 {
-    int32_t RdV;
+    uint32_t RdV;
     arch_fpop_start(env);
-    RdV = conv_sf_to_4u(RsV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float32_is_neg(RsV) && !float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = 0;
+    } else {
+        RdV = float32_to_uint32(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
@@ -451,16 +456,28 @@ int32_t HELPER(conv_sf2w)(CPUHexagonState *env, float32 RsV)
 {
     int32_t RdV;
     arch_fpop_start(env);
-    RdV = conv_sf_to_4s(RsV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = -1;
+    } else {
+        RdV = float32_to_int32(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
 
-int64_t HELPER(conv_sf2ud)(CPUHexagonState *env, float32 RsV)
+uint64_t HELPER(conv_sf2ud)(CPUHexagonState *env, float32 RsV)
 {
-    int64_t RddV;
+    uint64_t RddV;
     arch_fpop_start(env);
-    RddV = conv_sf_to_8u(RsV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float32_is_neg(RsV) && !float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = 0;
+    } else {
+        RddV = float32_to_uint64(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
@@ -469,16 +486,28 @@ int64_t HELPER(conv_sf2d)(CPUHexagonState *env, float32 RsV)
 {
     int64_t RddV;
     arch_fpop_start(env);
-    RddV = conv_sf_to_8s(RsV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = -1;
+    } else {
+        RddV = float32_to_int64(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
 
-int32_t HELPER(conv_df2uw)(CPUHexagonState *env, float64 RssV)
+uint32_t HELPER(conv_df2uw)(CPUHexagonState *env, float64 RssV)
 {
-    int32_t RdV;
+    uint32_t RdV;
     arch_fpop_start(env);
-    RdV = conv_df_to_4u(RssV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float64_is_neg(RssV) && !float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = 0;
+    } else {
+        RdV = float64_to_uint32(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
@@ -487,16 +516,28 @@ int32_t HELPER(conv_df2w)(CPUHexagonState *env, float64 RssV)
 {
     int32_t RdV;
     arch_fpop_start(env);
-    RdV = conv_df_to_4s(RssV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = -1;
+    } else {
+        RdV = float64_to_int32(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
 
-int64_t HELPER(conv_df2ud)(CPUHexagonState *env, float64 RssV)
+uint64_t HELPER(conv_df2ud)(CPUHexagonState *env, float64 RssV)
 {
-    int64_t RddV;
+    uint64_t RddV;
     arch_fpop_start(env);
-    RddV = conv_df_to_8u(RssV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float64_is_neg(RssV) && !float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = 0;
+    } else {
+        RddV = float64_to_uint64(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
@@ -505,17 +546,28 @@ int64_t HELPER(conv_df2d)(CPUHexagonState *env, float64 RssV)
 {
     int64_t RddV;
     arch_fpop_start(env);
-    RddV = conv_df_to_8s(RssV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = -1;
+    } else {
+        RddV = float64_to_int64(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
 
-int32_t HELPER(conv_sf2uw_chop)(CPUHexagonState *env, float32 RsV)
+uint32_t HELPER(conv_sf2uw_chop)(CPUHexagonState *env, float32 RsV)
 {
-    int32_t RdV;
+    uint32_t RdV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RdV = conv_sf_to_4u(RsV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float32_is_neg(RsV) && !float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = 0;
+    } else {
+        RdV = float32_to_uint32_round_to_zero(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
@@ -524,18 +576,28 @@ int32_t HELPER(conv_sf2w_chop)(CPUHexagonState *env, float32 RsV)
 {
     int32_t RdV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RdV = conv_sf_to_4s(RsV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = -1;
+    } else {
+        RdV = float32_to_int32_round_to_zero(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
 
-int64_t HELPER(conv_sf2ud_chop)(CPUHexagonState *env, float32 RsV)
+uint64_t HELPER(conv_sf2ud_chop)(CPUHexagonState *env, float32 RsV)
 {
-    int64_t RddV;
+    uint64_t RddV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RddV = conv_sf_to_8u(RsV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float32_is_neg(RsV) && !float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = 0;
+    } else {
+        RddV = float32_to_uint64_round_to_zero(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
@@ -544,18 +606,28 @@ int64_t HELPER(conv_sf2d_chop)(CPUHexagonState *env, float32 RsV)
 {
     int64_t RddV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RddV = conv_sf_to_8s(RsV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float32_is_any_nan(RsV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = -1;
+    } else {
+        RddV = float32_to_int64_round_to_zero(RsV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
 
-int32_t HELPER(conv_df2uw_chop)(CPUHexagonState *env, float64 RssV)
+uint32_t HELPER(conv_df2uw_chop)(CPUHexagonState *env, float64 RssV)
 {
-    int32_t RdV;
+    uint32_t RdV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RdV = conv_df_to_4u(RssV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float64_is_neg(RssV) && !float32_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = 0;
+    } else {
+        RdV = float64_to_uint32_round_to_zero(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
@@ -564,18 +636,28 @@ int32_t HELPER(conv_df2w_chop)(CPUHexagonState *env, float64 RssV)
 {
     int32_t RdV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RdV = conv_df_to_4s(RssV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RdV = -1;
+    } else {
+        RdV = float64_to_int32_round_to_zero(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RdV;
 }
 
-int64_t HELPER(conv_df2ud_chop)(CPUHexagonState *env, float64 RssV)
+uint64_t HELPER(conv_df2ud_chop)(CPUHexagonState *env, float64 RssV)
 {
-    int64_t RddV;
+    uint64_t RddV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RddV = conv_df_to_8u(RssV, &env->fp_status);
+    /* Hexagon checks the sign before rounding */
+    if (float64_is_neg(RssV) && !float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = 0;
+    } else {
+        RddV = float64_to_uint64_round_to_zero(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
@@ -584,8 +666,13 @@ int64_t HELPER(conv_df2d_chop)(CPUHexagonState *env, float64 RssV)
 {
     int64_t RddV;
     arch_fpop_start(env);
-    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
-    RddV = conv_df_to_8s(RssV, &env->fp_status);
+    /* Hexagon returns -1 for NaN */
+    if (float64_is_any_nan(RssV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+        RddV = -1;
+    } else {
+        RddV = float64_to_int64_round_to_zero(RssV, &env->fp_status);
+    }
     arch_fpop_end(env);
     return RddV;
 }
diff --git a/tests/tcg/hexagon/fpstuff.c b/tests/tcg/hexagon/fpstuff.c
index e4f1a0eeb4..6b60f92d18 100644
--- a/tests/tcg/hexagon/fpstuff.c
+++ b/tests/tcg/hexagon/fpstuff.c
@@ -37,10 +37,12 @@ const int SF_NaN =                        0x7fc00000;
 const int SF_NaN_special =                0x7f800001;
 const int SF_ANY =                        0x3f800000;
 const int SF_HEX_NAN =                    0xffffffff;
+const int SF_small_neg =                  0xab98fba8;
 
 const long long DF_NaN =                  0x7ff8000000000000ULL;
 const long long DF_ANY =                  0x3f80000000000000ULL;
 const long long DF_HEX_NAN =              0xffffffffffffffffULL;
+const long long DF_small_neg =            0xbd731f7500000000ULL;
 
 int err;
 
@@ -358,12 +360,155 @@ static void check_canonical_NaN(void)
     check_fpstatus(usr, 0);
 }
 
+static void check_float2int_convs()
+{
+    int res32;
+    long long res64;
+    int usr;
+
+    /*
+     * Check that the various forms of float-to-unsigned
+     *  check sign before rounding
+     */
+        asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2uw(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(SF_small_neg)
+        : "r2", "usr");
+    check32(res32, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2uw(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(SF_small_neg)
+        : "r2", "usr");
+    check32(res32, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2ud(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(SF_small_neg)
+        : "r2", "usr");
+    check64(res64, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2ud(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(SF_small_neg)
+        : "r2", "usr");
+    check64(res64, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2uw(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(DF_small_neg)
+        : "r2", "usr");
+    check32(res32, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2uw(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(DF_small_neg)
+        : "r2", "usr");
+    check32(res32, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2ud(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(DF_small_neg)
+        : "r2", "usr");
+    check64(res64, 0);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2ud(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(DF_small_neg)
+        : "r2", "usr");
+    check64(res64, 0);
+    check_fpstatus(usr, FPINVF);
+
+    /*
+     * Check that the various forms of float-to-signed return -1 for NaN
+     */
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2w(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(SF_NaN)
+        : "r2", "usr");
+    check32(res32, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2w(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(SF_NaN)
+        : "r2", "usr");
+    check32(res32, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2d(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(SF_NaN)
+        : "r2", "usr");
+    check64(res64, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_sf2d(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(SF_NaN)
+        : "r2", "usr");
+    check64(res64, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2w(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(DF_NaN)
+        : "r2", "usr");
+    check32(res32, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2w(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res32), "=r"(usr) : "r"(DF_NaN)
+        : "r2", "usr");
+    check32(res32, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2d(%2)\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(DF_NaN)
+        : "r2", "usr");
+    check64(res64, -1);
+    check_fpstatus(usr, FPINVF);
+
+    asm(CLEAR_FPSTATUS
+        "%0 = convert_df2d(%2):chop\n\t"
+        "%1 = usr\n\t"
+        : "=r"(res64), "=r"(usr) : "r"(DF_NaN)
+        : "r2", "usr");
+    check64(res64, -1);
+    check_fpstatus(usr, FPINVF);
+}
+
 int main()
 {
     check_compare_exception();
     check_sfminmax();
     check_dfminmax();
     check_canonical_NaN();
+    check_float2int_convs();
 
     puts(err ? "FAIL" : "PASS");
     return err ? 1 : 0;
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index bb0b4fb621..6fd9360b74 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -173,7 +173,6 @@ hexagon_ss.add(files(
     'printinsn.c',
     'arch.c',
     'fma_emu.c',
-    'conv_emu.c',
 ))
 
 target_arch += {'hexagon': hexagon_ss}
-- 
2.25.1


