Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC2538623
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:31:04 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviIJ-00029T-Jr
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0002vh-7l
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0007Aa-FC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15256837wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3GsKWbkWl7P0FpvZQ2r5heVDC7ND9InpXtLxndHj4lw=;
 b=zdZN0xgpERuAmXqXnchxrozXtAOmPNU8crPK5BR8r0veqvKr3oR77j5XSPpIpP+H/X
 FsZ5ocyoVHgDalbWcWgkIM15m3ZeaxkIrzpyx0VyQEH1tTtv723NiC/CxdSNRaiq8A7+
 JpC1qNtWxN4SV2yS9pqDsAvGFT6KOhAy7sTGWnIbarkGecBHTgxRrFomNc05cPFeZq9z
 vk2yqXXa1/zFOIXguHNzXdn5CjyHtvLThsYnBc+2ectOskpwRwlzkmTklnt7nv+5bbPE
 W5Jso4hQcSL0M8Qc2qJXYbYUz5mgeSG/wilMSVxqqF5PUVm3B2kS7jN9SsKE1m7nFiiy
 QSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GsKWbkWl7P0FpvZQ2r5heVDC7ND9InpXtLxndHj4lw=;
 b=G/rtz3V/ARdFwBwR/ahyESOi33ksOLISNJLtuyo5DogmegbodxtvVnDmF6Tqmod2QI
 DvE1rhgpR/6TNc+SWdcqcihYRMJYnz54HPfls8Kfi2YbJ2A5VWlKoXYNOz1FzBl8lDw6
 A35VfhEFBVfLWxEU+2qjB7vm0kipCc5+hNG4Sc5+nlXA5HUzk0O0QWZXlxE+Bm6EwcKv
 pWAi0W4p/fI+2vM5XycTz6vd+BZyk9WOnQjQfy5OPxdkzy1o/mYeaFoJfDselffxr/2f
 7ZIH181RJiusfPfIK9DHnfw9rsa3gqclZkWsPXbsvDsZUAYP2omQWTzKiHkFYvLLmbAC
 H2ww==
X-Gm-Message-State: AOAM530gZFxMMXP6on17m8y/u+732VI2qKYn7lLcFsh2DhCuNbuM7NUb
 Pf0w8RF2vLql6Z/pZjHuOh653Yh0KlwNnA==
X-Google-Smtp-Source: ABdhPJwiPJIdLcu5vc9w54Wc7ghxqmKkTmri6IzSDBYrAElAcLhX3KKhjycBHNuFrJ2saiLk2VWN8g==
X-Received: by 2002:a5d:47a3:0:b0:20e:5c89:9da2 with SMTP id
 3-20020a5d47a3000000b0020e5c899da2mr47913089wrb.277.1653926847292; 
 Mon, 30 May 2022 09:07:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 021/117] target/arm: Use TRANS_FEAT for USDOT_zzzz
Date: Mon, 30 May 2022 17:05:32 +0100
Message-Id: <20220530160708.726466-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This is the last direct user of tcg_gen_gvec_4_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-19-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2347b60d8ef..b4307f062c3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8044,21 +8044,8 @@ static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
 TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
-{
-    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
-    }
-    return true;
-}
+TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
 TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
            gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
-- 
2.25.1


