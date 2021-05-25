Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75638F7F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:11:42 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMXk-0004Qf-TL
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYZ-0001D8-Em
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXv-00049d-JO
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so12277398pjt.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxVaQvqVt0mxh8hFVoab4E5awx6N3yMBWMsb4PbVN5Y=;
 b=vwAz0CY+LPOxSmcK1NwAdG3VEm4QQZ+j0rrTlw0KGmaLimFQd51hHHciOJy0QOCs89
 xroLLmrcNtM2cWvEg/baWwIdtyEc8Xp2L9L4DQDxIwvYqHYuTWTtBqnSqtApX3fzHyXr
 XinS7ZHpBQLqLDChkVMx7jgNJSi/HhLivLTL0AoJDF1oGTIobhidqnjVCaP8MembnfeO
 QfiBceVGkWhmVGSFChxVEz5wzUQq8L2z+bhUTd/CWiGgLOW51bCq8UvE0QvvHCWxh1if
 t9bIPnTrlzn15lL/L7cVblUwVBQrQyEeFboo/kyv7OFef3BaKq7SQfYbGNnmvzzpFjHr
 OYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxVaQvqVt0mxh8hFVoab4E5awx6N3yMBWMsb4PbVN5Y=;
 b=TnMSjfVShuHIGxEDhm+63SburQ/F9xpNhR7xi3eQIZcMGP1FkMB90yn5G68RMhxTm8
 n0JjKMT9XupqUkr/F1HEE3cZrrvNV8cVcAhyOVId4+CZtfj3g4Je1Yu+S+Wvsj/XS3At
 H2CO16b/D9r6nKipoE4/foaZ7ChikFKfBITbUwvCu+RBSejLFX9Z/8MAegOuES/ClO7Y
 BHGZl/0EUTVGHjXVgTnn/fDlyf2vC7YjlZix8NZFSWzJS6iMfOBuX4kbkDRSnWinPFZj
 qVL591CT78f1hpIlDxNvq6E/YEbzzfz9EDYutC/k2r2qqRyzoJtHfQuzGf9qETbEQies
 uteA==
X-Gm-Message-State: AOAM5309inxetcH51TgA59iyY5SXY8/fkieAloZoiFz/NDTpu6kR7d2h
 AHhJFVvze+k8ef4+vxh7QgPpUq3qoeZExg==
X-Google-Smtp-Source: ABdhPJxu+s2+n1iXeaPp64vqGp4XWutUJGWHCkXDtAgg7ltm4I2l61mtI5GNGCgx5RBCZUxuHP4icA==
X-Received: by 2002:a17:90a:a2b:: with SMTP id
 o40mr2026091pjo.214.1621904865622; 
 Mon, 24 May 2021 18:07:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 75/92] target/arm: Implement SVE2 FLOGB
Date: Mon, 24 May 2021 18:03:41 -0700
Message-Id: <20210525010358.152808-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200430191405.21641-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fixed esz index and c++ comments
v3: Fixed denormal arithmetic and raise invalid.
v7: Rewrite; handle denormal exceptions and flush to zero.
---
 target/arm/helper-sve.h    |  4 ++
 target/arm/sve.decode      |  3 ++
 target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 24 +++++++++++
 4 files changed, 119 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index be4b17f1c2..342bb83721 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2754,3 +2754,7 @@ DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(flogb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5dcc79759e..5a1cceccb6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1588,3 +1588,6 @@ FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
+
+### SVE2 floating-point convert to integer
+FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8882393515..a051854984 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4729,6 +4729,94 @@ DO_ZPZ_FP(sve_ucvt_dh, uint64_t,     , uint64_to_float16)
 DO_ZPZ_FP(sve_ucvt_ds, uint64_t,     , uint64_to_float32)
 DO_ZPZ_FP(sve_ucvt_dd, uint64_t,     , uint64_to_float64)
 
+static int16_t do_float16_logb_as_int(float16 a, float_status *s)
+{
+    /* Extract frac to the top of the uint32_t. */
+    uint32_t frac = (uint32_t)a << (16 + 6);
+    int16_t exp = extract32(a, 10, 5);
+
+    if (unlikely(exp == 0)) {
+        if (frac != 0) {
+            if (!get_flush_inputs_to_zero(s)) {
+                /* denormal: bias - fractional_zeros */
+                return -15 - clz32(frac);
+            }
+            /* flush to zero */
+            float_raise(float_flag_input_denormal, s);
+        }
+    } else if (unlikely(exp == 0x1f)) {
+        if (frac == 0) {
+            return INT16_MAX; /* infinity */
+        }
+    } else {
+        /* normal: exp - bias */
+        return exp - 15;
+    }
+    /* nan or zero */
+    float_raise(float_flag_invalid, s);
+    return INT16_MIN;
+}
+
+static int32_t do_float32_logb_as_int(float32 a, float_status *s)
+{
+    /* Extract frac to the top of the uint32_t. */
+    uint32_t frac = a << 9;
+    int32_t exp = extract32(a, 23, 8);
+
+    if (unlikely(exp == 0)) {
+        if (frac != 0) {
+            if (!get_flush_inputs_to_zero(s)) {
+                /* denormal: bias - fractional_zeros */
+                return -127 - clz32(frac);
+            }
+            /* flush to zero */
+            float_raise(float_flag_input_denormal, s);
+        }
+    } else if (unlikely(exp == 0xff)) {
+        if (frac == 0) {
+            return INT32_MAX; /* infinity */
+        }
+    } else {
+        /* normal: exp - bias */
+        return exp - 127;
+    }
+    /* nan or zero */
+    float_raise(float_flag_invalid, s);
+    return INT32_MIN;
+}
+
+static int64_t do_float64_logb_as_int(float64 a, float_status *s)
+{
+    /* Extract frac to the top of the uint64_t. */
+    uint64_t frac = a << 12;
+    int64_t exp = extract64(a, 52, 11);
+
+    if (unlikely(exp == 0)) {
+        if (frac != 0) {
+            if (!get_flush_inputs_to_zero(s)) {
+                /* denormal: bias - fractional_zeros */
+                return -1023 - clz64(frac);
+            }
+            /* flush to zero */
+            float_raise(float_flag_input_denormal, s);
+        }
+    } else if (unlikely(exp == 0x7ff)) {
+        if (frac == 0) {
+            return INT64_MAX; /* infinity */
+        }
+    } else {
+        /* normal: exp - bias */
+        return exp - 1023;
+    }
+    /* nan or zero */
+    float_raise(float_flag_invalid, s);
+    return INT64_MIN;
+}
+
+DO_ZPZ_FP(flogb_h, float16, H1_2, do_float16_logb_as_int)
+DO_ZPZ_FP(flogb_s, float32, H1_4, do_float32_logb_as_int)
+DO_ZPZ_FP(flogb_d, float64,     , do_float64_logb_as_int)
+
 #undef DO_ZPZ_FP
 
 static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0a2718c481..3ea51a73d3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8307,3 +8307,27 @@ static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
     }
     return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
 }
+
+static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        NULL,               gen_helper_flogb_h,
+        gen_helper_flogb_s, gen_helper_flogb_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s) || fns[a->esz] == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_ptr status =
+            fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+        unsigned vsz = vec_full_reg_size(s);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fns[a->esz]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
-- 
2.25.1


