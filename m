Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053465386EC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:52:58 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjZZ-0001p7-45
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwe-00049H-E3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007T9-IY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so6714409wmz.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wHCM3DuHcG7rVU3FS0qi4j15U6ruRI2FEaCIBxFBBAM=;
 b=aJITZzCxGl+VwuKjQJbpWfc86DlV8bORjs45zXuO92ytvZ4qSmZevczGB9oD4S8gM6
 XxvsXfSP5YbEHT/ygnYAQ8xaZrLe/+BZ4rDhdKxi+Dm/YFh1PQMZZCALWcKIH4WWygzw
 idhOgDErnntt1JV5Pmt7pvvrTbJR3gBInu1bkPTqKL8CF5BQEsjaoreC6xr1xCOQECs9
 n1OLI+/ZmvG9Q4xVZoschgl2+5slTmcZrdZEx+RkaF5LgJH3hngP0WpjIzAbWo3PYFdK
 xmpEeptd1FZNTA18s6cxtYsf0tpmeR4JKK7+7GtY+S9/kCiQG/zwmrcTT3Aicm8zHIG1
 +ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHCM3DuHcG7rVU3FS0qi4j15U6ruRI2FEaCIBxFBBAM=;
 b=6tf+DV8ycMlHV20kvDiZ8c2Bin0OkMVtYFnQbDC1xwY4VARI+eLbrHPKfZ2NnHzkvk
 UpYA6G3MB7PLDH00k4BXqxE6sgkSwqBCQZtGJqzXlqMqDa91f2kTEwuEyQsqlyOEL8+b
 0XbW+yVeR5uTKFDLfCRlFPR4DKhtgrTv0mipF9btIKnUiCM+12WV2/bc1a6W0B5/TSvg
 acffeznhArYvsLRi9S6lImvU5Zpy2X1OB8hwZqC61vs6+CwKzTk1/1vIx+BmFcNwV5BW
 +eHC8oUbpDJqNNRayZPffr5eDo5bBYWUwxRjwxGiS8oPLua0RIz+vzbDIOjSO2827TUx
 QkKg==
X-Gm-Message-State: AOAM533v+0CJIUU06Qalo/vtelwXpQo4bhRHiZvaeG5Dw+piLMrKcgeL
 rX8brdqAiZsG0iyNEiBUbrOGsqFlaH+K8w==
X-Google-Smtp-Source: ABdhPJxAslRF+Y3Dh9inR586sUsvGCtX6Fal4iE5AMK6WvcmjhkAMEJSxEGmdjX2atoPCDa6C3fD1A==
X-Received: by 2002:a05:600c:2254:b0:397:581d:34fa with SMTP id
 a20-20020a05600c225400b00397581d34famr19882866wmm.181.1653926915168; 
 Mon, 30 May 2022 09:08:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 095/117] target/arm: Expand frint_fns for MO_8
Date: Mon, 30 May 2022 17:06:46 +0100
Message-Id: <20220530160708.726466-96-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Simplify indexing of this array.  This will allow folding
of the illegal esz == 0 into the normal fn == NULL check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-93-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f7651249ad..99e5d896457 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4167,7 +4167,8 @@ static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
 }
 
-static gen_helper_gvec_3_ptr * const frint_fns[3] = {
+static gen_helper_gvec_3_ptr * const frint_fns[] = {
+    NULL,
     gen_helper_sve_frint_h,
     gen_helper_sve_frint_s,
     gen_helper_sve_frint_d
@@ -4179,7 +4180,7 @@ static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a)
         return false;
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                      frint_fns[a->esz - 1]);
+                      frint_fns[a->esz]);
 }
 
 static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
@@ -4222,7 +4223,7 @@ static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
@@ -4230,7 +4231,7 @@ static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
@@ -4238,7 +4239,7 @@ static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
@@ -4246,7 +4247,7 @@ static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
@@ -4254,7 +4255,7 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
-- 
2.25.1


