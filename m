Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72F332C93
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:53:17 +0100 (CET)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfbg-0008VI-Uh
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6N-0006xU-NK
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:56 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6K-0002PV-Ak
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:54 -0500
Received: by mail-ot1-x333.google.com with SMTP id r24so6268975otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JrM/gCMwPo4dSZSFmIGMUubRJmYQic6TLHlnfTln/s=;
 b=vmIIWa5QRdpnNdriVDsaP7WiGyINJeBalh+QCf55Js2ovzW/43RBjwC1mTxlcXLgk8
 2cflmMI6XxWciZMDd/MtGkJLy9nHytYp2d0L/oivywWNsyeTnKy70inOtoNmw9AJAQgG
 fUrzGSOZika+1mY1TU2XNSW+eht9FJstGTKZKWM2dy7TiP3XFq+RCGHgr9ENh4VuJkQ2
 eYhaxh0XfBak1e+xO4Qg8GsJmCJ9WDKjZSwpe6RQx7ZJquv+dlCa/G4IQRedYVQT6WzK
 YcrWFq2IwuVsrRiYcVUwOneYlubwaq+lVBLYQn7YW/qzUSQLB3xcgKgHGJMlIj+sOq4q
 ej6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JrM/gCMwPo4dSZSFmIGMUubRJmYQic6TLHlnfTln/s=;
 b=lqTzdiBuCbbPokZZ0wCudhG9EU0pv+zzysFCCWYaoKL/Dk844dbrbb7cWkk0SdOhXi
 PPyXMn8MhS2eN/oICOAV8XWL6qADmfH3U2fizwvHfcL+vNFMR30ztHP+xJk05kiTGJML
 NkkSF2l6pR+WMNfd0wSm5CISBkRHe1VILvfHdIfs4dHUYFHu1UOi4b++uPHVlYaZOIH5
 B0dCghUg4mUJzWWHVo7JZJuGgeyZjp1LwbcLg8Wm233s+KsnEaSSNBBKaM4EPeBX15hd
 rPYTbuX1XootPOLdMwtCah+DEbnUJUyyRx9/KOIBtwQCnm8wWs+bsof48wGdlgTvqMBs
 mcvw==
X-Gm-Message-State: AOAM533PnmN4ALoOcaH4LiGOp33qVxWtxAVyA3j5Fsx4tLFYfzT3VVdm
 id18OkzRv67JB2AYow1yQ/W144LUOSzFgWrM
X-Google-Smtp-Source: ABdhPJxPYVV4ImyWSXBVfA2FkLov414KI14beJUrkEjKba46X0Y1yY/cVHnpZx7P9VmFjdBlF/6WTA==
X-Received: by 2002:a9d:4e14:: with SMTP id p20mr16850572otf.94.1615306847959; 
 Tue, 09 Mar 2021 08:20:47 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/78] target/arm: Implement SVE2 integer unary operations
 (predicated)
Date: Tue,  9 Mar 2021 08:19:27 -0800
Message-Id: <20210309162041.23124-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sqabs, sqneg (laurent desnogues)
---
 target/arm/helper-sve.h    | 13 +++++++++++
 target/arm/sve.decode      |  7 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++++++++----
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b2a274b40b..9992e93e2b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -502,6 +502,19 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqabs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqneg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0524c01fcf..5ba542969b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1105,3 +1105,10 @@ PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
 UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
+
+### SVE2 integer unary operations (predicated)
+
+URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
+URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
+SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
+SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 00bb82da91..5dcdd26db0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
-DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
 DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
 
 static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
@@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
-DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
 #undef DO_ZPZZ
@@ -728,6 +728,27 @@ DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
 DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
 
+#define DO_SQABS(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ >= 0 ? x_ : x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqabs_b, int8_t, H1, DO_SQABS)
+DO_ZPZ(sve2_sqabs_h, int16_t, H1_2, DO_SQABS)
+DO_ZPZ(sve2_sqabs_s, int32_t, H1_4, DO_SQABS)
+DO_ZPZ_D(sve2_sqabs_d, int64_t, DO_SQABS)
+
+#define DO_SQNEG(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqneg_b, uint8_t, H1, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_h, uint16_t, H1_2, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_s, uint32_t, H1_4, DO_SQNEG)
+DO_ZPZ_D(sve2_sqneg_d, uint64_t, DO_SQNEG)
+
+DO_ZPZ(sve2_urecpe_s, uint32_t, H1_4, helper_recpe_u32)
+DO_ZPZ(sve2_ursqrte_s, uint32_t, H1_4, helper_rsqrte_u32)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 603e673696..2d8b9d2e70 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5885,3 +5885,50 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
     }
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
 }
+
+/*
+ * SVE2 integer unary operations (predicated)
+ */
+
+static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ool(s, a, fn);
+}
+
+static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
+}
+
+static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
+}
+
+static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
-- 
2.25.1


