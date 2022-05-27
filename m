Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698D53676E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:22:54 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufXx-000613-8p
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec2-0003Il-8d
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebx-0004Lx-Vn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5035415pjq.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/89+mpU4GVs0pAHMXaIe+xUvrTlp6qO+k1ForQR6iFY=;
 b=T/KzQvzeeiv5S+St32XWG440N5ZbSvA/fulvgdAu4n6VE019khhYrh4TOdl/Dmr1lM
 +7grzdEeZhk3btWcc9PNgekVBTK/DQWDXYXLLE6EdcZwKRDmvj7RyEe/4FpB9+XZ9v+D
 hgnKZlDsO/rlQdz/1q6V71HThphiGbAFxa7GEvOg3bTPiFh1Twn48BdvpEKpoxBSRaZ6
 EvRF6nkVHU799dCMeL21q3wQNesStJZuMcX2rnqLBV3uayTfNj+FlRWNZKnfa1xfkg23
 mrzfZrFoDw173n5g0P49iGr4XNjCl/l1KxTaFtAWvoS9nADEXrf4FUWTVJ6lvFu5gYgR
 8CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/89+mpU4GVs0pAHMXaIe+xUvrTlp6qO+k1ForQR6iFY=;
 b=wvVBh2XWrty+I1WdDU9VpFuhx4grS7u60Mz1cn58BDoTlqGdRvZ5rWHPfIytmQYrtZ
 IqJ25iRi/55mFXAV+OJM4ZZvwCPxsBFwKmi2V9EcHEooEEv4LTTpkUFFefycE6ajRSmm
 OOApoWQhEx5onnM9BZB0QVgbeX9FMOUjYLIuP3G7yLoOxzv/Eu2OAM+KNr9tQjyq1HL9
 bCFsEyxZm7IC5bS189uRCOLTiDmPWnhaBbHLVBvKpdhUZs1AWHMjLPUR6UAsMB1K2CLh
 HHKFJH7THuLLKZClwzAHxxbL4/Vb4BkRSbN69W0bUSMIhppJPTlzzj6h54mEm4EWg3b6
 YfZg==
X-Gm-Message-State: AOAM532gz4Sgm3I1FxZO3e4hARpUt73NadjJZ0SkZAgQWo2ZsiQToh8K
 lfnykgQbvjEpBVzWlAazLfSEYUPLKcW+tg==
X-Google-Smtp-Source: ABdhPJw4rbJRNdCs3V/YFaQDesBt7dBdwUCBWTFiqO77SSYU8RdC9wf7irry8w49jeSj/XEuaqmBSQ==
X-Received: by 2002:a17:90b:4ac1:b0:1df:c71d:510c with SMTP id
 mh1-20020a17090b4ac100b001dfc71d510cmr9505777pjb.118.1653675775994; 
 Fri, 27 May 2022 11:22:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 051/114] target/arm: Use TRANS_FEAT for do_predset
Date: Fri, 27 May 2022 11:18:04 -0700
Message-Id: <20220527181907.189259-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
 target/arm/translate-sve.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c8eb2c684b..ce6e000f6f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1616,22 +1616,13 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
     return true;
 }
 
-static bool trans_PTRUE(DisasContext *s, arg_PTRUE *a)
-{
-    return do_predset(s, a->esz, a->rd, a->pat, a->s);
-}
+TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
-static bool trans_SETFFR(DisasContext *s, arg_SETFFR *a)
-{
-    /* Note pat == 31 is #all, to set all elements.  */
-    return do_predset(s, 0, FFR_PRED_NUM, 31, false);
-}
+/* Note pat == 31 is #all, to set all elements.  */
+TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
 
-static bool trans_PFALSE(DisasContext *s, arg_PFALSE *a)
-{
-    /* Note pat == 32 is #unimp, to set no elements.  */
-    return do_predset(s, 0, a->rd, 32, false);
-}
+/* Note pat == 32 is #unimp, to set no elements.  */
+TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
 
 static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
 {
-- 
2.34.1


