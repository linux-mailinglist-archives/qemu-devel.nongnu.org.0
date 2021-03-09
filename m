Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2892E332E59
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:35:30 +0100 (CET)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhCb-0006om-3c
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8H-0000iF-Ph
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:56 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7z-0002s3-NE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:53 -0500
Received: by mail-ot1-x334.google.com with SMTP id b8so13350074oti.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLsd+chH4Trrrh1V30MCg7dAKKeY9MhnPocQKywEdeE=;
 b=uZlSvWF0/XoC/Dme45TzdV84Y4WFpvy7diAvjduWO089HvAFvKb0vzWACNqcDnHh5r
 Z8+6Q/a6fHksE5zoV2GWjfwLPJMc1YuPDyNAJMu3aAHAto5We2jaKdF3kveDR2rqI/4F
 fllbb7iRl/2y+h1RpQ3JAS/yO5INUHXcmc6hRl84ioktbTkVbQwswba1NeQsDwr3MSNC
 VxX0oZJcPifiY6j46B1fvsdlKSLV6DORC6LdcZedMzs1W0Uu4uOAQtIJB6ZQCyS1blPI
 G8NsPnogl9TKZhQsXS/PPUUQuPPCQp64GwAeM4UXN051W8PS0/umyTHAHsrgADCQ0aDY
 n6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLsd+chH4Trrrh1V30MCg7dAKKeY9MhnPocQKywEdeE=;
 b=WT6X1VfchJFA5ulTcuQApxiAp4LpKOSVm11lMT5DREU3BPNKKnnedbcHc45s+CdKxH
 7uphj4tMbLNdw2WDgLdnHRmWWquOMt92CaOSR732DabZBeJbUwhDWO4j1xF585ZgX0s8
 pFLfNgUjpShBIn31BEe/CAvb9IqY0UMwnILZN40jXIB5ylmHsEDMrbOwNH0pDQWxYuyp
 81xOJJI+ZrGHXWmkH3apwX63lgJ+w22ic7I0q/HGntop2nfR/PWa/5Wstco5z6MzhFan
 k9c4oxK/YLqlCzRztiev7FeG7UdAvDQN3Rg+fblcxLtfwPt9j9zwL5sSMinqlbi8dhtO
 NOzA==
X-Gm-Message-State: AOAM532GL3FPxA49AAcz2FFMZxUsPxYROqqREKN2Rw6T/I1QIksXK9l6
 IPPkYp6X2Knv6Bkxl6udYmQ5BD6JrmHD6VD2
X-Google-Smtp-Source: ABdhPJzpUARG43gv3ekqQ1y7a6HPMDQOPnjQmW61vyCxJP0/S7VyxqC0iDBtsFPjwyahI4MvxfEpbQ==
X-Received: by 2002:a9d:6390:: with SMTP id w16mr19810705otk.178.1615306954275; 
 Tue, 09 Mar 2021 08:22:34 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 71/78] target/arm: Implement SVE2 FLOGB
Date: Tue,  9 Mar 2021 08:20:34 -0800
Message-Id: <20210309162041.23124-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
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
index 8569d384b9..0a0ee8587b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2744,3 +2744,7 @@ DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(flogb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(flogb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 4fcd1b43f7..9ad017d4d1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1581,3 +1581,6 @@ FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
+
+### SVE2 floating-point convert to integer
+FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3b3f1eca5d..1e7c9c4f66 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4695,6 +4695,58 @@ DO_ZPZ_FP(sve_ucvt_dh, uint64_t,     , uint64_to_float16)
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
index 14a6a53320..d7c3ad047f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8282,3 +8282,27 @@ static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
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


