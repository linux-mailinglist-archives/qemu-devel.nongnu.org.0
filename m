Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CE5366F2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:32:53 +0200 (CEST)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuelY-0002Q3-5F
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYl-0007VG-Fh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYg-0003Yi-6i
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id j21so4541387pga.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qx6j1TqwLvAsHdT326qUHGP3vqi/7bmDjsPTEHKL3P4=;
 b=TiUB7NjtZkV3QmIEQ6uDM51EUnS1WA7xCDTLMK26l1lx95ct2DDvJ6vvlHkZ8CaZqm
 TMGcZ2xD9DCeenVVMtxR40n9LRikZ7eTrmpCxuGiYGTHGU2qaxBWbbGgFDrlb7rYteFo
 0yl4ouickYJQ4l5QzE82/fVGin/sPKp6Nlhg9mhDpOPJuQYk0ZAoHUv3MObpeHQW4QrO
 ahBbQ6Tz4vPGDpZG99fBzIu4UPZcuKnMhI+pCDs0e7uPv26yXf4A6B95tqYGZ9TcQ2mk
 msaNUzN7+Ad79Ip7Vaof0LzUGLPZsIEmbvii8XZpiQqbjfh0fkv/MIIBZn7Q2xrN77/1
 vGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qx6j1TqwLvAsHdT326qUHGP3vqi/7bmDjsPTEHKL3P4=;
 b=U9Y7EhKXf5SvY1nfny+ETxSIgFabQH1RoDzyy/miDWzyw/c8IZJai+zPngxdqsFRnI
 tyiQrGicbwZHSn0goEHzGFLJJLeCqO2qc6VMXAEaYnTbEAAEYoJcAkO2ykSdLwRekNhY
 xhQDTJNxGELf8r4j6objDdv2toRDNcCBIVo/tt6v5n3khhbGBD3gA5IK1AOcfG+Zsilx
 6cRSgxjkg6L+pymF3VGYWVfhXMY7P+h+7wxil0iejlT0bznztTna8cqFoIC94NhS7s+C
 4Mkwa47W7dAKnoc9Itaq4+Kmy69onIvGsjB0moFQtKz4Vs31NM1uqFZbQAPfDBikObIH
 Q39w==
X-Gm-Message-State: AOAM5300ejr0jttl+Omn4neRIdm1XyQVrPHQZTFSFyqO4CTdQvLpR7Md
 V5nFXFkWdQwSxJPljUfRtzqdhbHRw6LXGw==
X-Google-Smtp-Source: ABdhPJw8wiJV2avXvCAuWlJki2Xoc8L/84fMBDWoN3av9VMaG88V91VNaNGmtnLmcrhoTkQJWRbPzQ==
X-Received: by 2002:a63:90c9:0:b0:3f9:dd57:7cf3 with SMTP id
 a192-20020a6390c9000000b003f9dd577cf3mr28643847pge.382.1653675573459; 
 Fri, 27 May 2022 11:19:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 026/114] target/arm: Introduce gen_gvec_ool_arg_zpzz
Date: Fri, 27 May 2022 11:17:39 -0700
Message-Id: <20220527181907.189259-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Use gen_gvec_ool_arg_zpzz instead of gen_gvec_ool_zzzp
when the arguments come from arg_rprr_esz.
Replaces do_zpzz_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fea7164d72..d63099c5b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -252,6 +252,12 @@ static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rprr_esz *a, int data)
+{
+    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
+}
+
 /* Invoke a vector expander on two Zregs.  */
 static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
                            int esz, int rd, int rn)
@@ -737,11 +743,6 @@ static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
  *** SVE Integer Arithmetic - Binary Predicated Group
  */
 
-static bool do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
-{
-    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
-}
-
 /* Select active elememnts from Zn and inactive elements from Zm,
  * storing the result in Zd.
  */
@@ -761,7 +762,7 @@ static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a)         \
         gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
         gen_helper_sve_##name##_zpzz_s, gen_helper_sve_##name##_zpzz_d,   \
     };                                                                    \
-    return do_zpzz_ool(s, a, fns[a->esz]);                                \
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
 }
 
 DO_ZPZZ(AND, and)
@@ -792,7 +793,7 @@ static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
     };
-    return do_zpzz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
@@ -800,7 +801,7 @@ static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
     };
-    return do_zpzz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
@@ -1076,7 +1077,7 @@ static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a)         \
     if (a->esz < 0 || a->esz >= 3) {                                      \
         return false;                                                     \
     }                                                                     \
-    return do_zpzz_ool(s, a, fns[a->esz]);                                \
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
 }
 
 DO_ZPZW(ASR, asr)
@@ -6489,7 +6490,7 @@ static bool do_sve2_zpzz_ool(DisasContext *s, arg_rprr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzz_ool(s, a, fn);
+    return gen_gvec_ool_arg_zpzz(s, fn, a, 0);
 }
 
 static bool trans_SADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
-- 
2.34.1


