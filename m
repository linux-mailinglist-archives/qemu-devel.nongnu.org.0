Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8652370301
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:34:45 +0200 (CEST)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcama-0005tT-Sx
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZms-00056B-I1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:00 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007nW-Fg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j7so40766775pgi.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjikBWdGLG8hsmxHGbr3YnxshOOyIRVIIXUXcEjndK4=;
 b=xG6iIK1ECcXW1UYf81DzPjjQMOxnsDVbXpWAYc6rfdozU6oZ0fOaB5CPlr3YtX53FH
 0Pa5z11okzwxjlaaocBqhBWpdjFSMfdawCEWMxityWbRhNTCe1G6l2Ei61L4tbdtSLG1
 teKPfybUAHD3waPEX2fLumAfFe8RaoW3ZnzO1JzWiowqCQW04WyhJxHgx+MCByeBqvHQ
 CGPNj0xJnSLcsEUD20gdm8L8CkExm0A9tQ3JUifb1NOARAKZlUgSLVeVzb9VDBx1uyar
 WJl92pihlm1DU5vq7N8nlh9LBkGBmT1d86Vm+kyLpDrDOkqhq0es3qRirVA3F6FJDG4L
 RstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjikBWdGLG8hsmxHGbr3YnxshOOyIRVIIXUXcEjndK4=;
 b=pdkcpekhmzyrk8lTODNPxwp02ZVbAPaM2Rsokr4KILy7npkdRvhdq7xN7K0bWstAou
 QbM9sCLt3uoJsold4S37nnGfvqa94s1uy8kdsZKpo69O6uYQe4+NAfrwINlZ1jKRcjV9
 iFYaoHJ9AMLhfcSD68R6BZiYUEO6C4OTYGUM9l0/VG4MLuDkoT1VYMszvNvYGxPsxySG
 uK1l3yjLbk6Gc6mCINkl9zdIayrHwKaoJB8Io2vlHEau774kXcEIfZnq9V2YNk1lcARf
 Vb8DTQ9PONtp2kbblJFZXPGwsCQfEc8mA5lV72oKhvj5dK1oKeZu3FxmISboUY2VFaVc
 WxQQ==
X-Gm-Message-State: AOAM533J0hkmNKxCVisW9dv9IAaGKRsvC/2LExjM3DxKWB5HlrCXCWKA
 Q4YiOBFWrIM9RzgdhagoUawgojxkVXOMJg==
X-Google-Smtp-Source: ABdhPJx4J+774mxhNZRxNRAcOetbP85i35ezaug3lhsPMhx1P01MaZy8Hww0Xijxf052M97TyKASLA==
X-Received: by 2002:a62:4d86:0:b029:252:c889:2dd8 with SMTP id
 a128-20020a624d860000b0290252c8892dd8mr6621103pfb.41.1619814593369; 
 Fri, 30 Apr 2021 13:29:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 68/82] target/arm: Implement SVE2 FLOGB
Date: Fri, 30 Apr 2021 13:25:56 -0700
Message-Id: <20210430202610.1136687-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
---
 target/arm/helper-sve.h    |  4 +++
 target/arm/sve.decode      |  3 +++
 target/arm/sve_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 24 ++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 30b6dc49c8..96bd200e73 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2713,3 +2713,7 @@ DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(flogb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 46153d6a84..17adb393ff 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1539,3 +1539,6 @@ FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
+
+### SVE2 floating-point convert to integer
+FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2684f40a62..754301a3a6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4575,6 +4575,58 @@ DO_ZPZ_FP(sve_ucvt_dh, uint64_t,     , uint64_to_float16)
 DO_ZPZ_FP(sve_ucvt_ds, uint64_t,     , uint64_to_float32)
 DO_ZPZ_FP(sve_ucvt_dd, uint64_t,     , uint64_to_float64)
 
+static int16_t do_float16_logb_as_int(float16 a, float_status *s)
+{
+    if (float16_is_normal(a)) {
+        return extract16(a, 10, 5) - 15;
+    } else if (float16_is_infinity(a)) {
+        return INT16_MAX;
+    } else if (float16_is_any_nan(a) || float16_is_zero(a)) {
+        float_raise(float_flag_invalid, s);
+        return INT16_MIN;
+    } else {
+        /*
+         * denormal: bias - fractional_zeros
+         *         = bias + masked_zeros - uint32_zeros
+         */
+        return -15 + 22 - clz32(extract16(a, 0, 10));
+    }
+}
+
+static int32_t do_float32_logb_as_int(float32 a, float_status *s)
+{
+    if (float32_is_normal(a)) {
+        return extract32(a, 23, 8) - 127;
+    } else if (float32_is_infinity(a)) {
+        return INT32_MAX;
+    } else if (float32_is_any_nan(a) || float32_is_zero(a)) {
+        float_raise(float_flag_invalid, s);
+        return INT32_MIN;
+    } else {
+        /* denormal (see above) */
+        return -127 + 9 - clz32(extract32(a, 0, 23));
+    }
+}
+
+static int64_t do_float64_logb_as_int(float64 a, float_status *s)
+{
+    if (float64_is_normal(a)) {
+        return extract64(a, 52, 11) - 1023;
+    } else if (float64_is_infinity(a)) {
+        return INT64_MAX;
+    } else if (float64_is_any_nan(a) || float64_is_zero(a)) {
+        float_raise(float_flag_invalid, s);
+        return INT64_MIN;
+    } else {
+        /* denormal (see above) */
+        return -1023 + 12 - clz64(extract64(a, 0, 52));
+    }
+}
+
+DO_ZPZ_FP(flogb_h, float16, H1_2, do_float16_logb_as_int)
+DO_ZPZ_FP(flogb_s, float32, H1_4, do_float32_logb_as_int)
+DO_ZPZ_FP(flogb_d, float64,     , do_float64_logb_as_int)
+
 #undef DO_ZPZ_FP
 
 static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 87e5c8ac63..a949f53f4a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8231,3 +8231,27 @@ static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
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


