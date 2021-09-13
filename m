Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4204088D5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:14:58 +0200 (CEST)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPizJ-000481-3P
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPify-0007b6-Eb
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifr-0001w3-HF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so13737326wrb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0zWOUJgsCXe3Z17gWKDqIbTwVvMvDtAMTrMvlaEcgQ=;
 b=i3raDPP3ROErZO2ZQCAIci5druwMNjWwIYOlvxTVXLZaXk71UVE0TIG9IzB9YuKT0U
 o/x+PuPFAToxqhazA+9KzX0/Crfpy4jzWKLQrpvAIqtrZvDhO6wXYBmg4wFuFauNFPPv
 JuYqhc43dlb+6f76C9wWd3IUA1YJYx84+GN3+JNzNAkK+RYHUzu8OzZrAkE9UYKWB7QJ
 3Z8eMiruLyWqKtXvTDlpinTAdGHc5F5bdfcfIZJFaz38ypsgfUnnKi4y4ib7CF09Cdow
 pVTUR94DKjX71kuWrKhYEG/5RnEiPFQvE4LiGlqn+Q+VVgfyyqUgmE97e/V1EcyZCj5G
 Duug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0zWOUJgsCXe3Z17gWKDqIbTwVvMvDtAMTrMvlaEcgQ=;
 b=iNQDFqCTJyitOq/jKyzCKv3TEKgrzHLOvinDrmOCFHrNcHydg4tFwEkxERhLGcb5bL
 gxEwN2snq9LCSPFEamzS2myKn91LwQjkyAsJ7s2n7xM0xVz0R5L2ZRBxOTTpQ1SZcJDp
 2oJfCy0/xrolZfW2kJVUasVB6sXaPxfEjhhtuZKSuXxw0bW0qYHo51BtY66vqHAVIWWG
 OhLnyhxwcNfon5w5urhDUvvSJMSTI2OGZdrips9BOHwM7AUgSkWcvv9Jjocbw9oCQr7g
 PhGF7MEASk2OhXvO2TnjMnulBEUomul3MGiLpgV5zVy7X7v3a9rXr3udiibO0XZFEeFz
 1bVQ==
X-Gm-Message-State: AOAM530t8IgE6My7SJ2O+GGrjVahflomnh6GR21XG2vPsYZBiC98krvi
 uJiPyfNRWaUQOj/mHCcZTjqlUw==
X-Google-Smtp-Source: ABdhPJwS8BjCAHremkOeqYmEnVr1BZQWdqTM935g8NH5s6525P9icwBdQj4IxTxQlZFfqACbscd7QA==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr11254674wri.99.1631526890123; 
 Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] target/arm: Optimize MVE VSLI and VSRI
Date: Mon, 13 Sep 2021 10:54:39 +0100
Message-Id: <20210913095440.13462-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE shift-and-insert insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5d66f70657e..1fd71c9a1ee 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1668,8 +1668,8 @@ DO_2SHIFT_VEC(VSHRI_U, vshli_u, true, do_gvec_shri_u)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
-DO_2SHIFT(VSRI, vsri, false)
-DO_2SHIFT(VSLI, vsli, false)
+DO_2SHIFT_VEC(VSRI, vsri, false, gen_gvec_sri)
+DO_2SHIFT_VEC(VSLI, vsli, false, gen_gvec_sli)
 
 #define DO_2SHIFT_FP(INSN, FN)                                  \
     static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-- 
2.20.1


