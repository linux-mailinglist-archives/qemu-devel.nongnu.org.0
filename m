Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B95386C1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:26:18 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj9l-0001UE-7M
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwU-0003xV-Hg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0007QN-In
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id e25so4655035wra.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yOfBGJsQ6kG2clBgPZOWH9zA3Hm2JWOzez0eyAwJGf8=;
 b=IL1Qp3TLKwuiClquIE4GIraSqF7RykopY7alnQF9JfkkWfWlyDm8QYi4wz9demdM7W
 uxpwDtnFGBoTdoVHuhuBJMi1aNrj/NO9x2U7dRg5ax6lKPH+UI1hr6x4ilP3NalDEC1c
 C1N4VmMoh52XRGcfSRmoUPocqfhPpkqpJdIThvBAMRHzB5yZLBauf66R+WmMYzXzstwD
 wsWP1B2IoNi+6R+BHN3HFrFNSKfc2nHvdzr2Vo7EP/2YoZlmJ+EDiUje6gbDwD8Dcr4/
 lUt6ewaI+VLAPUCXnlxwFEvqfTZdzLATuUy70uuU4gJMj82zoxvnxlVHrVGrUhRh48D+
 Qb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOfBGJsQ6kG2clBgPZOWH9zA3Hm2JWOzez0eyAwJGf8=;
 b=D3YJM8Hn6hFO3ZE1VaVUcbxz+DPcPfNSyxcnula5lO9tFcTEe35kbDjjyqgLURqGqU
 cUFiP1p/wjeJuwnnpfWqZzTmWvnxWZTd6xEvJ12Bu6dAuSGkOip/kmu/pweA3ougWH2r
 Oy5GEnnZDaoM3lG/RSzxJ+RGtEzQ6mOMIQuqfe9RKPQLlcV1HTHXXdkkf0H3C06zvj26
 nJmRpGGSKKNpbCb2mfbg5V3A6bCBzmnd8aIQvrEQydd3LrcyQiv/yR0EjfeGrZa4l4on
 bJ//KCIRQInWr8UAq8xgSQu0l/PiwtYFZE5/6TlQI2VvF6AqShu+9txtp3fS7jCu7rkq
 lYgQ==
X-Gm-Message-State: AOAM531WDUfOd4HM+56J7Mm2cC0f/U3sFbEQ+pEbyQjxtH/xSu4467U/
 UPp2n9lxt/vvZ6Z9jIjnEKlWHWeOZWEYFQ==
X-Google-Smtp-Source: ABdhPJwc7fOCnUfyWCO+3tMHTOmtzYpcQyeIofO9AF/Us83SdhQJhDmatrdST1+jdLtgPzap5LQ6OQ==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr43526239wrc.632.1653926902538; 
 Mon, 30 May 2022 09:08:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 078/117] target/arm: Use TRANS_FEAT for do_zzi_sat
Date: Mon, 30 May 2022 17:06:29 +0100
Message-Id: <20220530160708.726466-79-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-76-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6b2f235e4a7..e6434589f46 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3313,25 +3313,10 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
     return true;
 }
 
-static bool trans_SQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, false);
-}
-
-static bool trans_UQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, false);
-}
-
-static bool trans_SQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, true);
-}
-
-static bool trans_UQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, true);
-}
+TRANS_FEAT(SQADD_zzi, aa64_sve, do_zzi_sat, a, false, false)
+TRANS_FEAT(UQADD_zzi, aa64_sve, do_zzi_sat, a, true, false)
+TRANS_FEAT(SQSUB_zzi, aa64_sve, do_zzi_sat, a, false, true)
+TRANS_FEAT(UQSUB_zzi, aa64_sve, do_zzi_sat, a, true, true)
 
 static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
-- 
2.25.1


