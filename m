Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D68536763
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:16:15 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufRW-00021v-DU
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYr-0007qq-Ht
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYn-0003Vf-PH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h186so4571841pgc.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vuTZBHK/OwCNVvVH2qQoYB8dgogxI10hqOhiJ3AnPA=;
 b=i05DWLwK7UGIXZbtPwVeAnU3Xmz3l932pfHsbS2xt2oZqyGGNYj3Lw5Rrr72VRYEwC
 4/VW/Dkxjh0zC2Aue7ZjHoc5C1h8xFmiT59nYQWiOowktCjpHPffJAaDzbV45hbre70V
 ceOS5mR7aRdC43a/JLvEpcucurninj9Mww2vxIGoyRNmFo+bO2GHCgz4/uP0eBaDxSub
 xYO7PU5K/IzRip1vrPi8qKpP6IpV1aE4NxCjkhYVwqHYWV6YaxNq127kGjFMqI9PDIme
 uXciI4ynKhuQLovAdBfMXD0zaFkOkG/r+lOStdzEyrXJyLjj4li7+9MseZAr11jsnqCl
 OkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vuTZBHK/OwCNVvVH2qQoYB8dgogxI10hqOhiJ3AnPA=;
 b=AksW0YRehR9vX73zay9hzHfvHBMZfitYu7RGrWjiAILrPoTig7vAktVZBoFItlgnI+
 SjsEP4eH2d8H3OEq+9fQJthWZTo/E4ILK1y9g0Mxdfq8UeAcDAdIOCtED6y4JXcBheUP
 a18G/xLZKE7479CsP2Xf1L3L1cpq2nzZmU3WgBMqGpcpdnS8JKCtBIlZNycGwcd6++bR
 y9ADBhPYRYSB+YyrortAUG5yPq+/0ECyvIvJeU/EriXSRBDixWMz+O0xYlJzgN9PY+ju
 o3BXjzKiZuUvH6ZEd+AH8HwS+Wf0hQOYg8xKd8/2wv17KAOqacVv00BRGjlxAaPx7p4N
 kdig==
X-Gm-Message-State: AOAM531nXXdGacdBLoOMUcTY5ha3RW8qR92a5OOyRzImPVi9Tf9BG2JG
 ohNMrGhsYkHnu53VChfeLR/1kOqH+Gr1bw==
X-Google-Smtp-Source: ABdhPJwxrAZSOpp7RbCBSaYrwN2hFkS+C93kzdt8FwHYOr/KKZtikGTOaB+Ir90ZDoggQAcijpjsnw==
X-Received: by 2002:a05:6a00:889:b0:510:91e6:6463 with SMTP id
 q9-20020a056a00088900b0051091e66463mr45295467pfj.58.1653675580976; 
 Fri, 27 May 2022 11:19:40 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 034/114] target/arm: Use TRANS_FEAT for do_sve2_fn_zzz
Date: Fri, 27 May 2022 11:17:47 -0700
Message-Id: <20220527181907.189259-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Convert SVE translation functions using do_sve2_fn_zzz
to use TRANS_FEAT and gen_gvec_fn_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ddb34cad8e..e92fef2304 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6897,23 +6897,8 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
 
-static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzz(s, fn, a);
-}
-
-static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
-}
-
-static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
-}
+TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
+TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
 
 static bool do_sve2_narrow_extract(DisasContext *s, arg_rri_esz *a,
                                    const GVecGen2 ops[3])
-- 
2.34.1


