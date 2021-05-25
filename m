Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0C38F792
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:33:40 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLwx-0002xN-DS
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUz-0001xL-DH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUV-0001ol-5X
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ot16so13927520pjb.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXQchyLhKN98Y/+BfztzDunnLVKLZyMFnTQ84i+EsqU=;
 b=QjNMI/n7NoJqLHruEFDaxJvZssMfiXw+TA4rI8WK1/lHaPB/8oJxPsDoJDuEk5QMMx
 u22G2z/66oryHOtIzwgVQEyejezE9vCvfGI3jJ90lFwTsnmmtUvMwT8hzB6GjYqT//KB
 F1qWXqv/Lwc9fmpQufFbpGqpc3ZyTdrO8ZS5V+o3RNjC4UYgsYvwswzQiejT34L9XIUX
 XJRT57qmnHMC+uI2TIPS0RdxjoXXcO1Ln1hIplm2e0dmIK2FSBIIxu+nk3NpIhwymqIg
 aAJsieSniFr7Ojo2ZO8iet37riJC7CQUDqIl1eiSWy6yEfMvJGca6wjwZ6fxt+ARc1C4
 1sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXQchyLhKN98Y/+BfztzDunnLVKLZyMFnTQ84i+EsqU=;
 b=GU77q1VTMIT20Bn1tJyX9r/ux5BrsD6sE+4S7SKjynjdm3eHKZTakgeCUVGiGVEdiO
 qhVy/XdlY7Tdeef+vEdgCZSVNWUO8iQfFU6sf/jvDF05F2SaLot79/OMIaV0fix7n/9K
 LMyRtY5496kYFjr07UIDz6ODjSSwxnfMYbbOoocIUa0BsLcDU8UNbh2McGw1GLBkjzUI
 G+uGRlDj5K1y17QSxaw9AeOSPldBdLcM7wL2jWNB7CObacbWmuNizq5+A6bcDwDq8U4h
 c4WjLwdQaeJrTmNBnuh8wUri65E/KCN+z5W0y2ECC3rnVuNsN1AE4RH+VKu7GD2Va6H2
 z59Q==
X-Gm-Message-State: AOAM532bjMVLj2olR9O8FuqsYWkNlxmuz7hCRpcL7RhgD8RwuO420vUl
 IBGvr9JQrbZ/dCikrGUklQfiQC+EHMDDFw==
X-Google-Smtp-Source: ABdhPJy4wmxQtZvqrougNEA6M6ljeIw/+E4zSyW4UNRQdNJcsZk07ZL9ptval4y6b+fa70XYbaEpSg==
X-Received: by 2002:a17:902:d101:b029:f4:b38a:a10a with SMTP id
 w1-20020a170902d101b02900f4b38aa10amr28065273plw.46.1621904653820; 
 Mon, 24 May 2021 18:04:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/92] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Mon, 24 May 2021 18:02:49 -0700
Message-Id: <20210525010358.152808-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 695a16551e..32b15e4192 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5e42ba350e..202107de98 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6438,3 +6438,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
+
+static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
+}
-- 
2.25.1


