Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF3536742
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:57:41 +0200 (CEST)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf9Y-0002F2-Kl
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYa-0006qx-DG
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYU-0003ZK-L9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:28 -0400
Received: by mail-pl1-x635.google.com with SMTP id d22so4790049plr.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxUP5s2X8KUuJjnNhiSle2qZf/aBbvU7yZ2XRv2i2BU=;
 b=PcWde18FB3U2nq+M7NmUX4xnULKxe3BKZrBrllaxVg4UVYMf5qXw0y5sPJmcrRJuM1
 jyQCc/AU29i4tP8Trrtz3xhgxAwI0K0fGoorDLcaFUYMwUmsFpDOBQZAQfT8Q3BlxvGN
 eIdw2InM9yN9GLA2umgqAZmN1CsUL9i3TSHiVhQqM6YwDI6MxFBqbDhD/ooLmjt7uW3a
 z2PrHUqsGsUJY4DJ2K9yZ7gvposIh9RuyUNQ/voZA8TECRI27z+DCEEiuJKfw9CRQCo0
 uMMORXntblb8QnZ7dpBQDwTpvvAjfjyZQIS2uNIetFCasHMHgC5UYQtTusDfgwEDBuA1
 b9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxUP5s2X8KUuJjnNhiSle2qZf/aBbvU7yZ2XRv2i2BU=;
 b=IUsAupwqN77N3d5Lqkk3trwtcE2sngmopD+811EayoaKKT8DAETf0jBlYeDkzYlWRU
 InuQ9g+yxdI7OYa48kbcVquf/ad03KKtvsUL1oWtFz47eaAoDPxoHnRugl/PsFHkrzCB
 xEV2OkdTHVziuO8sir9RR7qElpW7lQRSPbQPqtCHPiBi6wgt1ozeXI7KSn08lGaY397o
 Vn7UdcFmcHNH3PMJIrTz0goZoGFZ/wJ41eZyr/wvwI1ACMdVDIEx5j2DzvWrvH5pSNr+
 JWJskPyU+X7PFxdyoflx0zI+Cyq1dxuUDa3611jpSNhFOn+NERi+l0Osfq8uUeh94+2H
 B3SA==
X-Gm-Message-State: AOAM533FLjJBylMCmP0SfmwFHoKK7hTYUPUpYDZ0Rdfq+iqqJmbS8fwP
 DPsHGelERyyg1pA3qWQcs8HyrYFVpiLjRw==
X-Google-Smtp-Source: ABdhPJytaQTnWlCNuHUmcgvUG8PGNGZ9c/KlZej26olLFy0Vu8BZ5ketKQXzadO/5jYUCuaV/i8Ksg==
X-Received: by 2002:a17:902:f605:b0:14d:bd53:e2cd with SMTP id
 n5-20020a170902f60500b0014dbd53e2cdmr43496604plg.164.1653675561280; 
 Fri, 27 May 2022 11:19:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 013/114] target/arm: Rename do_zzxz_ool to
 gen_gvec_ool_arg_zzxz
Date: Fri, 27 May 2022 11:17:26 -0700
Message-Id: <20220527181907.189259-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Rename the function to match gen_gvec_ool_arg_zzzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f7367a4f62..b42df76c69 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -199,6 +199,12 @@ static bool gen_gvec_ool_arg_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
+static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rrxr_esz *a)
+{
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3820,15 +3826,9 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                        gen_helper_gvec_4 *fn)
-{
-    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
-}
-
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_ool(s, a, FUNC); }
+    { return gen_gvec_ool_arg_zzxz(s, FUNC, a); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3840,7 +3840,7 @@ static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_sudot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_sudot_idx_b, a);
 }
 
 static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
@@ -3848,7 +3848,7 @@ static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_usdot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_usdot_idx_b, a);
 }
 
 #undef DO_RRXR
-- 
2.34.1


