Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3605367EE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:12:53 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugKK-0006Ez-DO
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefo-00025B-Jz
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:56 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-0005Qw-8J
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r71so4640646pgr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+R3puLL+NqHGoJ9sh3bS9q0Grs9z3HgwXdkb4Y4VuEs=;
 b=zAK3bzRV49QrezNSNKk4zjtYqtpuzhdmQ34fFUJN8uq0dFDHichV9rDeMEuQ6sFdK9
 mrGNMhECtsMw2OzmrKtiq06/Sw/aeYF7RApfpDEkfDkAnmmQlqQy0SwElQCJYo5o/W0n
 L3jvkiu/PYhCpeWmiojr3m4rttc4hDwaKtq0HiRYy3WABYeVKtAyltnT86M/0muq2dBo
 QY1U5tavkz+mey5O63fMDjtFxS7UU7mLYpgF9rJRh2M1L4BwNV4hQ3fYhDB7sZUeKNF3
 i/Qa/v70pMEHAcshSy2iQI14w51LxwOhWs1rWkf5KJ13IANw18El6oqQ3Ggh7iDy/J9Z
 ncig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+R3puLL+NqHGoJ9sh3bS9q0Grs9z3HgwXdkb4Y4VuEs=;
 b=4M2nf7o6DSSCB4VSTNTUZ+CiqgDk6My0UrZT5XxXUdyl+J/AI0q1F7qGoUahi8x1uc
 Q5Z6vX2Vb9MIPXQxyM7e29zKhUvhCnBZ14rTUHC1oh79/BF673TPH0rIcQFtVNAGhxpe
 M8DnB+Jn+RMaW2uz1Rhr/vY42XAbnA0cyOgKepFsY7ZQrfdReQALz3kTV45L0IrmN2iN
 PGHMtethhLiLYtYLIKKwwnHL8v1h1KdLUj8stqRJYLpyx5LnhNGlnNXksdRL3O136gGP
 eaGZeZSLrOVZdbNYkTPPjE8NiA0PEr1Qag9Xcgq33ZU7eRg5qFx9MwEywTBw9tVYk2Pg
 o+EA==
X-Gm-Message-State: AOAM531XS8krKWnhRHOIvfoI1jQWAU+HPsNcCnDVAw2hKYiCvBeDJJtB
 avR4zR3uGcHKwPQU8CI4wy1lIWKOOeAEJg==
X-Google-Smtp-Source: ABdhPJyjAa7F+N+Ol26ZGP/uREpItOhVHS5GCA6hViRgIvdXLum6FEpLwfXtKjwqJAQelJX/XzOFWQ==
X-Received: by 2002:a05:6a00:1a08:b0:510:979e:f5b with SMTP id
 g8-20020a056a001a0800b00510979e0f5bmr45144182pfv.34.1653676009222; 
 Fri, 27 May 2022 11:26:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 107/114] target/arm: Use TRANS_FEAT for FCMLA_zzxz
Date: Fri, 27 May 2022 11:19:00 -0700
Message-Id: <20220527181907.189259-108-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 target/arm/translate-sve.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 436d09b928..70e8d90ae8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4018,19 +4018,12 @@ TRANS_FEAT(FCMLA_zpzzz, aa64_sve, gen_gvec_fpst_zzzzp, fcmla_fns[a->esz],
            a->rd, a->rn, a->rm, a->ra, a->pg, a->rot,
            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
-{
-    static gen_helper_gvec_4_ptr * const fns[4] = {
-        NULL,
-        gen_helper_gvec_fcmlah_idx,
-        gen_helper_gvec_fcmlas_idx,
-        NULL,
-    };
-
-    return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
-                              a->index * 4 + a->rot,
-                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-}
+static gen_helper_gvec_4_ptr * const fcmla_idx_fns[4] = {
+    NULL, gen_helper_gvec_fcmlah_idx, gen_helper_gvec_fcmlas_idx, NULL
+};
+TRANS_FEAT(FCMLA_zzxz, aa64_sve, gen_gvec_fpst_zzzz, fcmla_idx_fns[a->esz],
+           a->rd, a->rn, a->rm, a->ra, a->index * 4 + a->rot,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Unary Operations Predicated Group
-- 
2.34.1


