Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD5538697
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:09:24 +0200 (CEST)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvitP-0005K2-Ig
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw0-0003gy-6p
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvy-0007Aj-PQ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e2so15314489wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mBCQ8VOuTu67ySWwL88mPqlQI5eIol5JrywRePlpthY=;
 b=qBzKBe+M/FEh+HXOP0asp9+3C3Q/unv2BV4qNh9k3FgWOLOkHfD4OuCPM5TgJtbKoi
 NAVMK9l5F0LI7VMO9x0mVRk8XoJn3pCIaLTRlzmmjoXjcRi/Z5h/jqKXYWnVcdFNUG0v
 y0j4BO2T8rAG//S5G0CofTMhG7M12bUSfBFSnA4IfZMe6nxdzIPST4hLoin6aeDNXxbe
 pLx58mKC1Gz4iMtV1kXQVIVCdQMIC1BpyVUbrqu4B6nNVx0ZuzeFBM/PHWvEc0ZOK7bl
 lbwbT6oeiCUnT/DgW3p0ExYoz/0peFu+XqBmG+JnHCOZN1l5ZFCPaynXdLCh50UrLoRD
 oQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mBCQ8VOuTu67ySWwL88mPqlQI5eIol5JrywRePlpthY=;
 b=KTHDWNunRvxkk7zDdI8jV44EtHa0pxm+k4sodcJNsfH6zLYrWt2h1wBkvfn6lQhWOm
 7eiHX2Hp1l05/ukfEnucBI7MRBQi3sjndqZsbeN5DDAlpaV9iT+4Cn9ylPeMx5DdqBfM
 c7Ic1/GIC9Ye+5EVwjv074TBz9q1cMMbt4/tkhc4C8dG4k+vZZckjTOiBc/d1guC0QKc
 Kd3sB6h40Ubf++qA20IjlHqJBBF04eSHlR0Ul+/VWx3BFJ6/DpJ1NAjkIEj2cH0lBGvQ
 3mtisMWtDGPksgnKttW+X17ExhmHcXa278qbPEkNcX7C4bGBacbJq5JBa52Ng73t2D/K
 D7uA==
X-Gm-Message-State: AOAM533YUw2wuFAN7sJyXrJYp0APbc0t435OfnMgJxXhwQLA5fCzhC55
 KhAfafskgrn8IfZdiBOhgN2vLKBK7ZfjLQ==
X-Google-Smtp-Source: ABdhPJztiUAN3pGFHVWf6tIv+OUBD84yRsuy/M53Qq5GfczQok3wPAttySKU0gruVoElQG3BoAcceQ==
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr18897414wrq.471.1653926877850; 
 Mon, 30 May 2022 09:07:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 056/117] target/arm: Use TRANS_FEAT for do_pfirst_pnext
Date: Mon, 30 May 2022 17:06:07 +0100
Message-Id: <20220530160708.726466-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-id: 20220527181907.189259-54-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6fd9a42ef90..abb5433ee56 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1668,15 +1668,8 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
     return true;
 }
 
-static bool trans_PFIRST(DisasContext *s, arg_rr_esz *a)
-{
-    return do_pfirst_pnext(s, a, gen_helper_sve_pfirst);
-}
-
-static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a)
-{
-    return do_pfirst_pnext(s, a, gen_helper_sve_pnext);
-}
+TRANS_FEAT(PFIRST, aa64_sve, do_pfirst_pnext, a, gen_helper_sve_pfirst)
+TRANS_FEAT(PNEXT, aa64_sve, do_pfirst_pnext, a, gen_helper_sve_pnext)
 
 /*
  *** SVE Element Count Group
-- 
2.25.1


