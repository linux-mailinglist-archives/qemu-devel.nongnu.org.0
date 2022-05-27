Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E95536790
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:39:51 +0200 (CEST)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufoM-0004MH-WD
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b3-9h
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec1-0004OH-V7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id bo5so4999334pfb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brJQuJmrGGBT+hkdJadGpcchmka2NH6tl732FFVU67c=;
 b=Ixh+5TQhL0x2GGi/MxMwg2XL+3F2Fav8Pf0an17qMKaPtaUoFpACV6bAAlHRXolN0G
 MPS3laNcr+sbCc9gROKgtfVrg+2rhmqYtKVoavKesyc4vzYLcKLddrMEuPMpc1DEoQzV
 LNQY/of1QGgSA5D2TBIwAvy5mM6PimP4oOGEjK8ZogQzcL2+ZmTrjdx68PNyeVZrUn/+
 67svWCoH002E/eS5XDFdt0C7nKk0beH7J4dWlqWfJpe1+SXMu/XCpajbMVnWg13W84x4
 h9n7kr4oPfNt75wUFbUsnIGU4a1s1yaC8vAG6PdnbMPuEzmURKlZIkchQAZx+RQuObzJ
 +gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brJQuJmrGGBT+hkdJadGpcchmka2NH6tl732FFVU67c=;
 b=u5OyIRoJhm8QXSC0ii48RtoJJO2xGhowl6LAUws4o4uva90wr+vj791R9SzrH/fCkm
 tQXpLJX4/iL4lzPTX5QUgp+qDDycBGHBf7BNS0Rq37tLHkX5fQGp0moWN3UYuQWBDwLW
 keTMB0p1UkZrs9xX2XCvCXc5mveMK5XibeR2KTacut8LTLNoHjPkMy7+dCvPHGcbHm7c
 SVwUEdFLQ9y0HfUOm1TR+Jn8gYrznvXJt5rFms5sDSTPP+pDOX2Prq+0N8gCX9/9QXSZ
 7LVh1IkbUpfufaKlQgZTC/wRj+/9YpgX4OJLRdS2bJV9p+o811hbVfP21sZbvRKD5c5B
 0A4g==
X-Gm-Message-State: AOAM5338zddKrjTCqMQN4ANqRXpiznoVbnTEgOVYIWUhXf1x/3bshBOk
 Pk2pGp9LNZ6esluJ5eYxlJeg8va0aevM0Q==
X-Google-Smtp-Source: ABdhPJyex2DRxsin23YOXycz/dU3ZrbdYKcQHsaWFw1JYwr+k626nE0L0VM8UAZdWp/THxdWC5+0iQ==
X-Received: by 2002:a63:2152:0:b0:3f5:f7c1:61e with SMTP id
 s18-20020a632152000000b003f5f7c1061emr39158607pgm.152.1653675779602; 
 Fri, 27 May 2022 11:22:59 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 055/114] target/arm: Use TRANS_FEAT for do_perm_pred3
Date: Fri, 27 May 2022 11:18:08 -0700
Message-Id: <20220527181907.189259-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/translate-sve.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7139e6c0b0..413e89b19c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2272,35 +2272,12 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     return true;
 }
 
-static bool trans_ZIP1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_zip_p);
-}
-
-static bool trans_ZIP2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_zip_p);
-}
-
-static bool trans_UZP1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_uzp_p);
-}
-
-static bool trans_UZP2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_uzp_p);
-}
-
-static bool trans_TRN1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_trn_p);
-}
-
-static bool trans_TRN2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_trn_p);
-}
+TRANS_FEAT(ZIP1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_zip_p)
+TRANS_FEAT(ZIP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_zip_p)
+TRANS_FEAT(UZP1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_uzp_p)
+TRANS_FEAT(UZP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_uzp_p)
+TRANS_FEAT(TRN1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_trn_p)
+TRANS_FEAT(TRN2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_trn_p)
 
 static bool trans_REV_p(DisasContext *s, arg_rr_esz *a)
 {
-- 
2.34.1


