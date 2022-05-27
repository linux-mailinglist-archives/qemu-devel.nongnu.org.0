Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A85367B9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:55:06 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug37-0002aW-To
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefb-0001q5-5T
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefX-0005Mn-Um
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5042139pjq.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+cYk0Y2yjz0a0skyvalYNOV9Wt9osqE9+bFCpo/MGis=;
 b=BDD86CxwJEk+0KrjaUJNNTz6/IHklPBvnzP1JdWsoiDNvhTuJ8SPMLnCEg57dqeU5a
 o4y6W8fvUrXTv7ok3ZNGWXYG9A9koYzASZQ0q0YWe1CH2/xUIcXWnIRsT1KWFwar0jbY
 RQYecqiolgXKtpugZZ8kgO4ifxmcGnEMo9p8yUx9EPxh7vL9TAOvVopaxxlwlqy0xwkh
 Mr/GOWnQyLt6gQCRklsAEF9lJOWNyOHiRTDltJTQHLveRGjYV6Orvw7CjxCTtCOdL2SS
 uQRXO7a+s1zAUCv/b8JhepMbeDjiMCD9NmE/LNaYTaP0Bui7l0f2vTef4UzdbaTfS8M6
 Ia+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+cYk0Y2yjz0a0skyvalYNOV9Wt9osqE9+bFCpo/MGis=;
 b=j7Tyt3VY65hIqo099FQgpXmRD6LWe4r3UAjd+rgXnWv26AtUtt9HdyeIwbG4mCFqMB
 p6JfZsh8Io+MetFrmle9lsTL2tWwKL2c9YqEyQau2c/eAF90FZUnuOe8gwUeQrdNWZUX
 dYRVBrw7hq3N/b6eWlcSeZehQrORFMr9R5Qs0jUgvE9DQ8SsL2c+8b7AjFbV5GUMofk6
 AbDU/KIAQUnVsDz8P89Vnqi6k5xVZO4ASpmhr7GopZ+WLZNe83qJML1uj+/fUlnUfmzz
 K4ReNz2ZEQoHneEkFPThMIAA7esKzmezvkw7B6r461Qf8cK6cOHlYnbLNX61CYNd3/pf
 +sTw==
X-Gm-Message-State: AOAM530sA06qYRqUEZCP56bMxXysxcticiRNLRaQTVknSbrDdUWzn8fn
 asPL1fVnEaDBoC5u66VXE8h5jkc4PO+XpA==
X-Google-Smtp-Source: ABdhPJyhMX4nUrnQtHET10M7vKyLSu62U+RWUJr7hZtlZfs9vYM85QJ+V5zPvObcmeRU6Ti3DP0skg==
X-Received: by 2002:a17:902:7048:b0:15f:34c1:bae0 with SMTP id
 h8-20020a170902704800b0015f34c1bae0mr43773273plt.71.1653675998639; 
 Fri, 27 May 2022 11:26:38 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 096/114] target/arm: Use TRANS_FEAT for FLOGB
Date: Fri, 27 May 2022 11:18:49 -0700
Message-Id: <20220527181907.189259-97-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 552a551fef..2f96f52293 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7280,29 +7280,12 @@ TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
 TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
            float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
 
-static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[] = {
-        NULL,               gen_helper_flogb_h,
-        gen_helper_flogb_s, gen_helper_flogb_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s) || fns[a->esz] == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        TCGv_ptr status =
-            fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fns[a->esz]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const flogb_fns[] = {
+    NULL,               gen_helper_flogb_h,
+    gen_helper_flogb_s, gen_helper_flogb_d
+};
+TRANS_FEAT(FLOGB, aa64_sve2, gen_gvec_fpst_arg_zpz, flogb_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
 {
-- 
2.34.1


