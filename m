Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A253869F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:12:09 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviw4-00018J-JC
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwL-0003rO-Di
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0007Be-6H
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15257378wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SUtgIze0+HvN9rl3kbD3qtV3ubzIDRzI+lj/3xuXdno=;
 b=dcpLbIa+IB0mHYrMVxmIqNbJchmwSK5NjxNksvjmgppgAAj1oj4jSMc8N6k+n8lgnZ
 q7V/X7FUUpbnK/g/VMCHTJ8fmfPbs7W4W7lNLcxycssmIJwTGY7rfT/WDRwtXImHsydW
 9w9JCb8mDYiILbgvTw8U7yMmE5RTGTXwSWBf1B6cJ8FJyLgxlfsl8fJElqXYyCD/V6x5
 6pNkqS0xBjpm5B5PPSBNR8F9w+RHrBPwcKXuBwDKDywBOIBAXGdFGQo2b2Zoj0nDsuFj
 RUUZQiBJ8TSb0EKMJOELNl3VSrXGSGUrYoXapu+1511TmKJdTju5+/yB8ZELDMMBlqGW
 xIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUtgIze0+HvN9rl3kbD3qtV3ubzIDRzI+lj/3xuXdno=;
 b=Ew0zfUXWVdGvEgNA+Nk9ouvbX7W9vL47+J/rtWXAyIspwAhq4NSa3ixN9SZmU4gQ7t
 Md1xNa8BFOLKjlHRBai960wJ+Qu7bI5g2MyjmYzdJTI1IfQnDq7ijhRWkxTV5Ho/jLxG
 pOLx/QllpMHcEvoM2e8WhTXiRG5tzVV3A7Y2cEepKcZcmuCo+PEuR72uJW62lB5RuhGZ
 k/XhPP21fezEjgr5OeyICDMzjCRYOsYKbEla6Dgaiq8Nq+cLiCEjuq3F+A8y8ECcNk/M
 0VB2F1D5O2jS8tUxzGROCsGwNRuPerFU0Rc5p1padgFgWu2ZXFooh+NxId+cnoJgsRkj
 aNHQ==
X-Gm-Message-State: AOAM532lqkkXyeQD1+zYrFjwaJ0q/PINVp/e3haM92fYbQaqoZglhgwS
 YdfTa5nEMEqULtVw42kh5bvc9Om7L043KQ==
X-Google-Smtp-Source: ABdhPJzUoaCYo23lZyzfecVjEUN+G09bShKQQMxvzt6QSBf8ayFAVwzJEQzIuD+r98tz+FlSuUr8tw==
X-Received: by 2002:a5d:5847:0:b0:20f:dc2d:d6c8 with SMTP id
 i7-20020a5d5847000000b0020fdc2dd6c8mr32476296wrf.644.1653926897318; 
 Mon, 30 May 2022 09:08:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 071/117] target/arm: Use TRANS_FEAT for do_ppzi_flags
Date: Mon, 30 May 2022 17:06:22 +0100
Message-Id: <20220530160708.726466-72-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-69-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22acd5ead0b..03b2eddd8b4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2786,14 +2786,12 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
 }
 
 #define DO_PPZI(NAME, name) \
-static bool trans_##NAME##_ppzi(DisasContext *s, arg_rpri_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_3 * const fns[4] = {                     \
+    static gen_helper_gvec_flags_3 * const name##_ppzi_fns[4] = {         \
         gen_helper_sve_##name##_ppzi_b, gen_helper_sve_##name##_ppzi_h,   \
         gen_helper_sve_##name##_ppzi_s, gen_helper_sve_##name##_ppzi_d,   \
     };                                                                    \
-    return do_ppzi_flags(s, a, fns[a->esz]);                              \
-}
+    TRANS_FEAT(NAME##_ppzi, aa64_sve, do_ppzi_flags, a,                   \
+               name##_ppzi_fns[a->esz])
 
 DO_PPZI(CMPEQ, cmpeq)
 DO_PPZI(CMPNE, cmpne)
-- 
2.25.1


