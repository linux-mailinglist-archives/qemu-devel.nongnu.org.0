Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3F370898
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:57:55 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuoK-0004B9-IP
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuai-0008IL-QD
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaW-00007D-T9
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c17so1332573pfn.6
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+4RlndkABy70UiZ/oy2xt6QweGU3hHu478DrMWi7zZE=;
 b=e51n+J8I+6gUKATw3RxuvBZxsSGh2hDmWSJeLx2tMsnJPvev0JexRaEn8YXLCV+njF
 tCdSdfvOriohl4rS20Ady6QSRq/A9iX9CdVl7yUMX45ZeCiPYHwY/5U4Dv2D3MCszJy/
 r6wOl8OXCk3CTxMz7pcoey1gnJLlx3vybJa7Mdwd2dN7ma2ay8o1djXStCwey1brPwXW
 S599M20kKm4HYgVtD4IVmTLirLVli1hLR8Tdb0AYiMjA6ouAuV6BcNRQ+JQnvvvf0A+M
 fcCIBmODXntZDz4oDOxzG0P2I24AeyYM/eOEJElZhRPgoWKjAy7V/tOhNW0QNNmn2keR
 3Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4RlndkABy70UiZ/oy2xt6QweGU3hHu478DrMWi7zZE=;
 b=qB9sy/UMHV7aLwUTYRbB0y0cZDrtIxXJ6C5DwtZNlPpzN0mJ+05tpkE2MvMOCaQDOE
 2QhRGfDUKaiF4u3ex8yFvad0YKZS49OnCsUDfqt/59GWmfTjile4mp387/Bc4qTxBmKF
 VomFHzsxooewlddcHsagXk7SPTq+hJ9ywbIkdrEk9m0DO6XvF45oTcghMfNP5OaZNqiv
 50nfIT3lX0YS9H4ObU016f1F9tXmsd7BXQfC8AnD0KcibqdJQLnd5EvOARXB3aDbT5iS
 IsI8RsH9eAdEk7Sc8iClOY4/MjelZHODSPh4Qrfx6kniMRd9+HcK1E/0VC5hL44q4R1e
 SCng==
X-Gm-Message-State: AOAM5302bLyBlNnDvjE8uzTySpYIUY+LaZE5Vw8iTHSpYQGiEFuaJgg4
 Q8zpLxom20PS+lgcWW+6jpCSVc/mC7ePWA==
X-Google-Smtp-Source: ABdhPJwf77Jv0lTlep5O6Kf28SL1EJ7MOtpmZq/AKC3R0cgXUkDAdgrWMUOiW365b0pOSWJaEPPMTQ==
X-Received: by 2002:a05:6a00:150d:b029:27a:ce95:bb0e with SMTP id
 q13-20020a056a00150db029027ace95bb0emr10672878pfu.64.1619894615568; 
 Sat, 01 May 2021 11:43:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/31] Hexagon (target/hexagon) replace float32_mul_pow2 with
 float32_scalbn
Date: Sat,  1 May 2021 11:43:09 -0700
Message-Id: <20210501184324.1338186-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-12-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index bb51f19a3d..40b6e3d0c0 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -143,12 +143,6 @@ void arch_fpop_end(CPUHexagonState *env)
     }
 }
 
-static float32 float32_mul_pow2(float32 a, uint32_t p, float_status *fp_status)
-{
-    float32 b = make_float32((SF_BIAS + p) << SF_MANTBITS);
-    return float32_mul(a, b, fp_status);
-}
-
 int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
                          float_status *fp_status)
 {
@@ -217,22 +211,22 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
         if ((n_exp - d_exp + SF_BIAS) <= SF_MANTBITS) {
             /* Near quotient underflow / inexact Q */
             PeV = 0x80;
-            RtV = float32_mul_pow2(RtV, -64, fp_status);
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RtV = float32_scalbn(RtV, -64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
         } else if ((n_exp - d_exp + SF_BIAS) > (SF_MAXEXP - 24)) {
             /* Near quotient overflow */
             PeV = 0x40;
-            RtV = float32_mul_pow2(RtV, 32, fp_status);
-            RsV = float32_mul_pow2(RsV, -32, fp_status);
+            RtV = float32_scalbn(RtV, 32, fp_status);
+            RsV = float32_scalbn(RsV, -32, fp_status);
         } else if (n_exp <= SF_MANTBITS + 2) {
-            RtV = float32_mul_pow2(RtV, 64, fp_status);
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RtV = float32_scalbn(RtV, 64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
         } else if (d_exp <= 1) {
-            RtV = float32_mul_pow2(RtV, 32, fp_status);
-            RsV = float32_mul_pow2(RsV, 32, fp_status);
+            RtV = float32_scalbn(RtV, 32, fp_status);
+            RsV = float32_scalbn(RsV, 32, fp_status);
         } else if (d_exp > 252) {
-            RtV = float32_mul_pow2(RtV, -32, fp_status);
-            RsV = float32_mul_pow2(RsV, -32, fp_status);
+            RtV = float32_scalbn(RtV, -32, fp_status);
+            RsV = float32_scalbn(RsV, -32, fp_status);
         }
         RdV = 0;
         ret = 1;
@@ -274,7 +268,7 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
         /* Basic checks passed */
         r_exp = float32_getexp(RsV);
         if (r_exp <= 24) {
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
             PeV = 0xe0;
         }
         RdV = 0;
-- 
2.25.1


