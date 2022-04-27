Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF2511046
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:46:43 +0200 (CEST)
Received: from localhost ([::1]:35352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZZa-0003E7-8z
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSy-0001Jd-C2
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSw-0007Sc-PN
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so599453pfa.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1o9si1s5HiM2x4iDuDzWhxWXoWFSwko9HR+xkw5Bkro=;
 b=RqU2SZ3MnBRRWZG0WzVeLaiPs8q8KL7AWEqyvpVJDxs3XUvO78jAP4+cQsuqaeXQi6
 OHODAs9jjkfCc62gko5Mdt0eVN0Z4pxqGOHddZXEUTw4sg5ms5+NRa8jyld9i8JRQA5x
 5Dlb+upSCfIk2k6XiW0aUGcUYXHJZ/5gz5cQRHodZjmgHBvQeW41n/YVCahP1Wz9Zw41
 3DU89XIqh2TP0qiXbbStF6V/lIQZWyyMyLy+TSwVUWXgqHiiuLIp4mLW8Hxh9UykdsHV
 hjt099KZV//S0GFGvBGxcLuIW0SWg1tIkehJlagTgbda83lmwIqBDn7URyV2zrh7gjze
 PHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1o9si1s5HiM2x4iDuDzWhxWXoWFSwko9HR+xkw5Bkro=;
 b=KCwhXos6Nunoz23OaW7lSifI1HbgfhHUeKb3mWZM7FhaDIYD+Xp3C2eiTCGnAe3cKc
 +mipSgbj3dYGKvN/RewVTQBwOp5FJK6Xf0YYbrSPCkRQT0VKJb3Kyj1scP0ORV5K04pa
 Rnwx3R4eg9PpPLEPbBj68u5TaOWS29iOkKyaF4VFWJOPpmPqQtsxQBzV/BPm6dhwIhQb
 0BqFANmlMj4OKb82L77gFx5qcx3THgGUeYe1nlwVo8FBu3XB14l4hneFI7Xzof8FaSBN
 L2W9YyN3av+L5apIIz6OCRTt0kIHqFTTjAiL1Eyrq06O+BSieG1Uda2itcPhh5ARTPPk
 OV9A==
X-Gm-Message-State: AOAM530nGFg4NLNjCu0yOdbfo14Tc6HKw1Pslm6gQYndAr6By/s0i5eY
 3A4oOQJ6Wyo6jIVLRqRRRH1unDxFxOuzqg==
X-Google-Smtp-Source: ABdhPJyD8m0rsAsf+DBzbfPSWnchZt6X2C4u/Y9ZnKcZSC12Ck0XqsZ4Z288MOGcsTQEh5er9kpTYA==
X-Received: by 2002:a05:6a00:1a8f:b0:50a:8c2d:2edf with SMTP id
 e15-20020a056a001a8f00b0050a8c2d2edfmr27666752pfv.82.1651034388360; 
 Tue, 26 Apr 2022 21:39:48 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] softfloat: Use FloatRelation within partsN_compare
Date: Tue, 26 Apr 2022 21:39:41 -0700
Message-Id: <20220427043942.294654-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
References: <20220427043942.294654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the return type is FloatRelation, it's clearer to
use the type for 'cmp' within the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220401132240.79730-3-richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index db3e1f393d..bbeadaa189 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1327,16 +1327,19 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
                                      float_status *s, bool is_quiet)
 {
     int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
-    int cmp;
 
     if (likely(ab_mask == float_cmask_normal)) {
+        FloatRelation cmp;
+
         if (a->sign != b->sign) {
             goto a_sign;
         }
-        if (a->exp != b->exp) {
-            cmp = a->exp < b->exp ? -1 : 1;
-        } else {
+        if (a->exp == b->exp) {
             cmp = frac_cmp(a, b);
+        } else if (a->exp < b->exp) {
+            cmp = float_relation_less;
+        } else {
+            cmp = float_relation_greater;
         }
         if (a->sign) {
             cmp = -cmp;
-- 
2.34.1


