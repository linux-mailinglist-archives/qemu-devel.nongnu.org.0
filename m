Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFC53679E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:43:11 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufra-0001vp-I9
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0003RH-Th
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebz-0004Mm-JA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 202so5026982pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ae1R3S9CZr6dsrirE4eQqaT1nWC8LLDmdYj1ka/aR5s=;
 b=vX0fzv+GEiwIg7dFjflsQXqELVMVBupI7oWbglYhr821+tEuyHkjG/q12phDW6D8Od
 yv0uTw6JCyVrO8Pu4u5kKyB80eIt8YrsCPVAa0ltWf0a8kOXOhVK9E6/fm/JoiySb/OR
 lmftq/9QQ97lUYoYLMgLLjgo2wI4yFOaEabf8WYwlUqkI9mk4tOKZK5L4WVI6WbLdN3O
 ASAVETLR+EkxRUWvWpATUHKnS5jlbyTIMxiaVD7Nc8nPH4YDr+uHG7FetX4t0XYr3v0/
 eYtI3ZqMj3Y/HtPOpn1ReHpfj8eS5QyWD7CxY1NJo35e3i4kgT0TLO2gurP8PCCyPpO/
 2sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ae1R3S9CZr6dsrirE4eQqaT1nWC8LLDmdYj1ka/aR5s=;
 b=Efua/n+KSnIbl1q3JZh/rFqBeKiOgl4gmsYhfxSgRPkyCiGYy/zDR1vK6QkET73wXm
 onktDJdBAiCh8LEgCro7D5pbm2dQoS1UOAYI+pq1cvEY63rm7cI+S7rt4Mdhn7g15Bax
 aw7OQbnAtCKnnmg2Crr3G/hbqiR1Alk9aZfv5Tc0tsWMiXAqcimOGWIFPf6EtIBdBNgH
 HJIbO/NsyS3sqOx9rzhNkxn85NccYVZtaJcjo2KGddL+RC2gtGxyDS5P3MLy1fWr7UYr
 LPDF/a+Bb2mEEPyh0tKyx/1lEaX0UfUu63XHLpJWttdOQGkyblUyC6Y37M/SQGuzKjD4
 qGkg==
X-Gm-Message-State: AOAM531QEWCCXer5jPh97x8fNy8mqz37QtcbS3lrxj2JUeUPH8rR0r+G
 N52cQ6i7eVBVwHvpfQ4ta99aGaAf+kpRHw==
X-Google-Smtp-Source: ABdhPJxIQcT2xZVmPx1Be8N4d+xnYEC9sxcCGBvEBrFFDiXJ7YAjTYpV3lHOMfVjTOAaqQzQJaeYCw==
X-Received: by 2002:a65:43c2:0:b0:3db:7de6:99f8 with SMTP id
 n2-20020a6543c2000000b003db7de699f8mr38372276pgp.347.1653675777803; 
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 053/114] target/arm: Use TRANS_FEAT for do_pfirst_pnext
Date: Fri, 27 May 2022 11:18:06 -0700
Message-Id: <20220527181907.189259-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6fd9a42ef9..abb5433ee5 100644
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
2.34.1


