Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068953677E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:30:50 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuffc-0000nA-Uc
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b1-9N
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004Qm-EE
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:20 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b135so4961547pfb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+jNkIlkI0Mxzpu2Q0Y0wsvArZquJwwiRJK1CMneaAk=;
 b=aw41KLpFlQmebLxvSLA6TNhdIHjwfZCmtEx91PgyR9wui3ARYcclKvI7Qjww82A9WI
 7fsf9jkK3brblVw1TScS+pVeKs1N88XXqu3WqOuoSm5tiDUzMsQQj9rSGCniUHM7MFMU
 fPDR+03biiqGNHS/pSxMRbi6rumkq/G21G+zIMdSK2nJ56Evs0xzQxUelvvIGoLwnSO5
 8nKEnPqztdayyCX49uDPbr4AO0I+hezv1mH6C4wXPmVFKRpnzbi5nZwCAqTXvl2333RW
 sTtK+RceBH3Gap48sU1jydgyS6ikhBykK0ge0rxAX/rIWRUAQVSkqM0xWbtcegZLowza
 DbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+jNkIlkI0Mxzpu2Q0Y0wsvArZquJwwiRJK1CMneaAk=;
 b=IEtIGvn+qDXlwTiS+pLG7Xvu2LhXPR6TnrNPxmNy82JxIs7I5+RqQjC0jLOiCnjqNq
 1rFbKIkxrRi7esdkMtF0bJVpZKX8IAxUb+pz7zyGJs9Z2dEacq6vinW/HF+vTAAYgqpm
 jElqUo+nO1wq0QwwmmOOq0zuUv2+OnwWbKTPMcgYptlfxXk2bt+LJiJ2lZH3zNuLz8eM
 v4Iyzc0sEw10oli4cHKwD3etp68I1hGTZ502tuHj6O1SqiV7grmSYAwBd/HjEQFgsc11
 Rs/7dGcxNps7hJ5e7mXutGQxk2C/ZKvzanY791kCQ5GEilmhkexhyZfqbBosN9sdTRqj
 P+vA==
X-Gm-Message-State: AOAM531LJ2T4fi6qg3QNw7auxwbnjp0qRdKKT9Zm9PoLYAezy2RLstdE
 nUoVuPOpDQOU8ilkFJRT9/uA7RVGtFFybA==
X-Google-Smtp-Source: ABdhPJwNa7A48Ah93sucddSnSj78Z/3+nfZnag4XM7iXvBKgV76Q3vfohdYyAjZbSyJ3a7KetlmSow==
X-Received: by 2002:a05:6a00:9a6:b0:518:fb72:5e2e with SMTP id
 u38-20020a056a0009a600b00518fb725e2emr14379326pfg.55.1653675783846; 
 Fri, 27 May 2022 11:23:03 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 059/114] target/arm: Use TRANS_FEAT for do_zip, do_zip_q
Date: Fri, 27 May 2022 11:18:12 -0700
Message-Id: <20220527181907.189259-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Convert SVE translation functions using do_zip*
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 54 +++++++++-----------------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75c52d8ce1..7c9deb267f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2287,48 +2287,20 @@ TRANS_FEAT(PUNPKHI, aa64_sve, do_perm_pred2, a, 1, gen_helper_sve_punpk_p)
  *** SVE Permute - Interleaving Group
  */
 
-static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_zip_b, gen_helper_sve_zip_h,
-        gen_helper_sve_zip_s, gen_helper_sve_zip_d,
-    };
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? vsz / 2 : 0;
+static gen_helper_gvec_3 * const zip_fns[4] = {
+    gen_helper_sve_zip_b, gen_helper_sve_zip_h,
+    gen_helper_sve_zip_s, gen_helper_sve_zip_d,
+};
+TRANS_FEAT(ZIP1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, 0)
+TRANS_FEAT(ZIP2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, vec_full_reg_size(s) / 2)
 
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, high_ofs);
-}
-
-static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, false);
-}
-
-static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, true);
-}
-
-static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
-
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_zip_q, a, high_ofs);
-}
-
-static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, false);
-}
-
-static bool trans_ZIP2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, true);
-}
+TRANS_FEAT(ZIP1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a, 0)
+TRANS_FEAT(ZIP2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a,
+           QEMU_ALIGN_DOWN(vec_full_reg_size(s), 32) / 2)
 
 static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
-- 
2.34.1


