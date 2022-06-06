Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C253F286
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:28:20 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM8w-0005Xt-2d
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwB-0001Zm-Ho
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:07 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw8-0003wP-Rq
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:07 -0400
Received: by mail-pl1-x632.google.com with SMTP id t2so13340005pld.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mBxPwvS5Zc+06sjlXQ0jLlWP4oSfxWSqbaSHItPYsNM=;
 b=oznHcoSOg1HlnMfbGoWMdId2M3eb1vxyl7tTB4fY04trPuHaU2mxkqMm1wsnK1XVfh
 /5ua4nvAj/gE6oUAAdGSWx3XjpSg5IkcbazTkoddNzRNdZb+o9m1eNqiX2E7MjNYQk+T
 3rcZec1GNK6gQtqrdcUPxGyKqq2ATAmyd+UbSElSCGuVzLmD9i5B4hnIEa9p9VxC8qFd
 IX1f6Fy9qIkIEJAmugaUMPG1OZdT/Z62OMx/3Ej9I37ltNAoPWvzpfv2Ju0aUPO7V6LO
 Xz0VWlL2mjcv68Dp5yvSWkOJGCe3purwzo+mzbmbsQ07Xuagw0zBoqkEhZ/pxtCK62IX
 WhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mBxPwvS5Zc+06sjlXQ0jLlWP4oSfxWSqbaSHItPYsNM=;
 b=LOKDYQz4Tn0SbReNUhUkRz7Uog+ho6FyKvOOOdi6oL6jl/3BLc1oxXU6eCzGvRkjKk
 IqcSa4Bg+EP//zPh1UYAeJtyaAI74R1MBKZ9STtHFShIwNgWNCSEsVfTaOOg4OPq2Mfg
 aQBswGjo/73BvazJL5uLudKPvZl+PLTjNQ2vg+X+tgdQj+Bl5w6kRnhDLvMwBq3SIRCD
 E7fqFRo27/Q9KT2YMV54+7F0aK+pbwNaPMzKxLeNrLgbyZHpuyLSWcHYEkzI57EGWucA
 X7klVVAH854+sYwFrj/clZn/YEo2Hs3A640JX8WlPkmOu/Ou0lj+GhbyAzTTrgtKKlE/
 rCGQ==
X-Gm-Message-State: AOAM531qcroUwAbVHspIFRH6B9qBHxSGGRhJUonQt9bQ4xLfQSajOXFR
 CtWr8/Y/1ztk2YHeHx6vh2pSdQ33SpsHFw==
X-Google-Smtp-Source: ABdhPJwfm6qqZNn9hsL6PTGZBcxuIW/aR6JMRbpXyzTWgCj5TJVTfbzG9Dzys54hOgTyLSGJsxCmCw==
X-Received: by 2002:a17:90b:304:b0:1e3:4285:ce1e with SMTP id
 ay4-20020a17090b030400b001e34285ce1emr29655273pjb.71.1654557303553; 
 Mon, 06 Jun 2022 16:15:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 12/43] target/loongarch: Add floating point conversion
 instruction translation
Date: Mon,  6 Jun 2022 16:14:19 -0700
Message-Id: <20220606231450.448443-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

From: Song Gao <gaosong@loongson.cn>

This includes:
- FCVT.S.D, FCVT.D.S
- FFINT.{S/D}.{W/L}, FTINT.{W/L}.{S/D}
- FTINT{RM/RP/RZ/RNE}.{W/L}.{S/D}
- FRINT.{S/D}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-13-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                    |  29 ++
 target/loongarch/insns.decode                |  32 ++
 target/loongarch/fpu_helper.c                | 393 +++++++++++++++++++
 target/loongarch/translate.c                 |   1 +
 target/loongarch/insn_trans/trans_fcnv.c.inc |  33 ++
 5 files changed, 488 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 25a891bf8b..1e8749433a 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -61,3 +61,32 @@ DEF_HELPER_4(fcmp_s_s, i64, env, i64, i64, i32)
 DEF_HELPER_4(fcmp_c_d, i64, env, i64, i64, i32)
 /* fcmp.sXXX.d */
 DEF_HELPER_4(fcmp_s_d, i64, env, i64, i64, i32)
+
+DEF_HELPER_2(fcvt_d_s, i64, env, i64)
+DEF_HELPER_2(fcvt_s_d, i64, env, i64)
+DEF_HELPER_2(ffint_d_w, i64, env, i64)
+DEF_HELPER_2(ffint_d_l, i64, env, i64)
+DEF_HELPER_2(ffint_s_w, i64, env, i64)
+DEF_HELPER_2(ffint_s_l, i64, env, i64)
+DEF_HELPER_2(ftintrm_l_s, i64, env, i64)
+DEF_HELPER_2(ftintrm_l_d, i64, env, i64)
+DEF_HELPER_2(ftintrm_w_s, i64, env, i64)
+DEF_HELPER_2(ftintrm_w_d, i64, env, i64)
+DEF_HELPER_2(ftintrp_l_s, i64, env, i64)
+DEF_HELPER_2(ftintrp_l_d, i64, env, i64)
+DEF_HELPER_2(ftintrp_w_s, i64, env, i64)
+DEF_HELPER_2(ftintrp_w_d, i64, env, i64)
+DEF_HELPER_2(ftintrz_l_s, i64, env, i64)
+DEF_HELPER_2(ftintrz_l_d, i64, env, i64)
+DEF_HELPER_2(ftintrz_w_s, i64, env, i64)
+DEF_HELPER_2(ftintrz_w_d, i64, env, i64)
+DEF_HELPER_2(ftintrne_l_s, i64, env, i64)
+DEF_HELPER_2(ftintrne_l_d, i64, env, i64)
+DEF_HELPER_2(ftintrne_w_s, i64, env, i64)
+DEF_HELPER_2(ftintrne_w_d, i64, env, i64)
+DEF_HELPER_2(ftint_l_s, i64, env, i64)
+DEF_HELPER_2(ftint_l_d, i64, env, i64)
+DEF_HELPER_2(ftint_w_s, i64, env, i64)
+DEF_HELPER_2(ftint_w_d, i64, env, i64)
+DEF_HELPER_2(frint_s, i64, env, i64)
+DEF_HELPER_2(frint_d, i64, env, i64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index d7ed80b0b9..b9f135d36f 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -316,3 +316,35 @@ fclass_d        0000 00010001 01000 01110 ..... .....    @ff
 #
 fcmp_cond_s     0000 11000001 ..... ..... ..... 00 ...   @cff_fcond
 fcmp_cond_d     0000 11000010 ..... ..... ..... 00 ...   @cff_fcond
+
+#
+# Floating point conversion instruction
+#
+fcvt_s_d        0000 00010001 10010 00110 ..... .....    @ff
+fcvt_d_s        0000 00010001 10010 01001 ..... .....    @ff
+ftintrm_w_s     0000 00010001 10100 00001 ..... .....    @ff
+ftintrm_w_d     0000 00010001 10100 00010 ..... .....    @ff
+ftintrm_l_s     0000 00010001 10100 01001 ..... .....    @ff
+ftintrm_l_d     0000 00010001 10100 01010 ..... .....    @ff
+ftintrp_w_s     0000 00010001 10100 10001 ..... .....    @ff
+ftintrp_w_d     0000 00010001 10100 10010 ..... .....    @ff
+ftintrp_l_s     0000 00010001 10100 11001 ..... .....    @ff
+ftintrp_l_d     0000 00010001 10100 11010 ..... .....    @ff
+ftintrz_w_s     0000 00010001 10101 00001 ..... .....    @ff
+ftintrz_w_d     0000 00010001 10101 00010 ..... .....    @ff
+ftintrz_l_s     0000 00010001 10101 01001 ..... .....    @ff
+ftintrz_l_d     0000 00010001 10101 01010 ..... .....    @ff
+ftintrne_w_s    0000 00010001 10101 10001 ..... .....    @ff
+ftintrne_w_d    0000 00010001 10101 10010 ..... .....    @ff
+ftintrne_l_s    0000 00010001 10101 11001 ..... .....    @ff
+ftintrne_l_d    0000 00010001 10101 11010 ..... .....    @ff
+ftint_w_s       0000 00010001 10110 00001 ..... .....    @ff
+ftint_w_d       0000 00010001 10110 00010 ..... .....    @ff
+ftint_l_s       0000 00010001 10110 01001 ..... .....    @ff
+ftint_l_d       0000 00010001 10110 01010 ..... .....    @ff
+ffint_s_w       0000 00010001 11010 00100 ..... .....    @ff
+ffint_s_l       0000 00010001 11010 00110 ..... .....    @ff
+ffint_d_w       0000 00010001 11010 01000 ..... .....    @ff
+ffint_d_l       0000 00010001 11010 01010 ..... .....    @ff
+frint_s         0000 00010001 11100 10001 ..... .....    @ff
+frint_d         0000 00010001 11100 10010 ..... .....    @ff
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 1e514cce74..81466678eb 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -461,3 +461,396 @@ uint64_t helper_fcmp_s_d(CPULoongArchState *env, uint64_t fj,
     FloatRelation cmp = float64_compare(fj, fk, &env->fp_status);
     return fcmp_common(env, cmp, flags);
 }
+
+/* floating point conversion */
+uint64_t helper_fcvt_s_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(float64_to_float32(fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_fcvt_d_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float32_to_float64((uint32_t)fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ffint_s_w(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(int32_to_float32((int32_t)fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ffint_s_l(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = nanbox_s(int64_to_float32(fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ffint_d_w(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = int32_to_float64((int32_t)fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ffint_d_l(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = int64_to_float64(fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frint_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = (uint64_t)(float32_round_to_int((uint32_t)fj, &env->fp_status));
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_frint_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_round_to_int(fj, &env->fp_status);
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrm_l_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_down, &env->fp_status);
+    fd = float64_to_int64(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrm_l_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_down, &env->fp_status);
+    fd = float32_to_int64((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrm_w_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_down, &env->fp_status);
+    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrm_w_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_down, &env->fp_status);
+    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrp_l_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_up, &env->fp_status);
+    fd = float64_to_int64(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrp_l_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_up, &env->fp_status);
+    fd = float32_to_int64((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrp_w_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_up, &env->fp_status);
+    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrp_w_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_up, &env->fp_status);
+    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrz_l_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    fd = float64_to_int64_round_to_zero(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrz_l_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    fd = float32_to_int64_round_to_zero((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrz_w_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    fd = (uint64_t)float64_to_int32_round_to_zero(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrz_w_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint32_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    fd = float32_to_int32_round_to_zero((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return (uint64_t)fd;
+}
+
+uint64_t helper_ftintrne_l_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    fd = float64_to_int64(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrne_l_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    fd = float32_to_int64((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrne_w_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftintrne_w_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint32_t fd;
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
+
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    fd = float32_to_int32((uint32_t)fj, &env->fp_status);
+    set_float_rounding_mode(old_mode, &env->fp_status);
+
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return (uint64_t)fd;
+}
+
+uint64_t helper_ftint_l_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float64_to_int64(fj, &env->fp_status);
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftint_l_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = float32_to_int64((uint32_t)fj, &env->fp_status);
+    if (get_float_exception_flags(&env->fp_status) &
+        (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT64_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftint_w_s(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    if (get_float_exception_flags(&env->fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
+
+uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
+{
+    uint64_t fd;
+
+    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    if (get_float_exception_flags(&env->fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        fd = FLOAT_TO_INT32_OVERFLOW;
+    }
+    update_fcsr0(env, GETPC());
+    return fd;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index a338db50b7..26ef1e366c 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -168,6 +168,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_extra.c.inc"
 #include "insn_trans/trans_farith.c.inc"
 #include "insn_trans/trans_fcmp.c.inc"
+#include "insn_trans/trans_fcnv.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
diff --git a/target/loongarch/insn_trans/trans_fcnv.c.inc b/target/loongarch/insn_trans/trans_fcnv.c.inc
new file mode 100644
index 0000000000..c1c6918ad1
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_fcnv.c.inc
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+TRANS(fcvt_s_d, gen_ff, gen_helper_fcvt_s_d)
+TRANS(fcvt_d_s, gen_ff, gen_helper_fcvt_d_s)
+TRANS(ftintrm_w_s, gen_ff, gen_helper_ftintrm_w_s)
+TRANS(ftintrm_w_d, gen_ff, gen_helper_ftintrm_w_d)
+TRANS(ftintrm_l_s, gen_ff, gen_helper_ftintrm_l_s)
+TRANS(ftintrm_l_d, gen_ff, gen_helper_ftintrm_l_d)
+TRANS(ftintrp_w_s, gen_ff, gen_helper_ftintrp_w_s)
+TRANS(ftintrp_w_d, gen_ff, gen_helper_ftintrp_w_d)
+TRANS(ftintrp_l_s, gen_ff, gen_helper_ftintrp_l_s)
+TRANS(ftintrp_l_d, gen_ff, gen_helper_ftintrp_l_d)
+TRANS(ftintrz_w_s, gen_ff, gen_helper_ftintrz_w_s)
+TRANS(ftintrz_w_d, gen_ff, gen_helper_ftintrz_w_d)
+TRANS(ftintrz_l_s, gen_ff, gen_helper_ftintrz_l_s)
+TRANS(ftintrz_l_d, gen_ff, gen_helper_ftintrz_l_d)
+TRANS(ftintrne_w_s, gen_ff, gen_helper_ftintrne_w_s)
+TRANS(ftintrne_w_d, gen_ff, gen_helper_ftintrne_w_d)
+TRANS(ftintrne_l_s, gen_ff, gen_helper_ftintrne_l_s)
+TRANS(ftintrne_l_d, gen_ff, gen_helper_ftintrne_l_d)
+TRANS(ftint_w_s, gen_ff, gen_helper_ftint_w_s)
+TRANS(ftint_w_d, gen_ff, gen_helper_ftint_w_d)
+TRANS(ftint_l_s, gen_ff, gen_helper_ftint_l_s)
+TRANS(ftint_l_d, gen_ff, gen_helper_ftint_l_d)
+TRANS(ffint_s_w, gen_ff, gen_helper_ffint_s_w)
+TRANS(ffint_s_l, gen_ff, gen_helper_ffint_s_l)
+TRANS(ffint_d_w, gen_ff, gen_helper_ffint_d_w)
+TRANS(ffint_d_l, gen_ff, gen_helper_ffint_d_l)
+TRANS(frint_s, gen_ff, gen_helper_frint_s)
+TRANS(frint_d, gen_ff, gen_helper_frint_d)
-- 
2.34.1


