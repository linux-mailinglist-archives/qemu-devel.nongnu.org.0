Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0F370D79
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:53:23 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDTG-0002z8-BF
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKl-0001Vh-Tx
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:35 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKi-0005ER-4w
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:35 -0400
Received: by mail-pf1-x432.google.com with SMTP id p4so2410657pfo.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+4RlndkABy70UiZ/oy2xt6QweGU3hHu478DrMWi7zZE=;
 b=IL+W3Ukba6MCOiJgL6DvnDsLmwBRHAS5KCiqU/jJFSVWQ/x5zKcKzQhEbI4bb+EFS6
 CMoRC/v9qzV4Qsvf+JI8GmNh9VGBNcqt7FBx6151DKuFRo7NqG1HXDQCNMsTEmrwqvoo
 ZvJkedAQuWzy3xl6gFKab9+psiw4XD8JHh/jEPPGnG/D9NgMTBqjaHYlYRlbAXDdqxAw
 Ee8r9qEc+loPTH84xa2ycMoBNtud6/rg19iNc0DGBf+zh4KOe5pAi3xD6iUyD++fRbHH
 gQgGCUDQUbV0mZhcBdUwm7pTBiSzfiShis1Y3B0zWJPunP8oGkEqqFiPEIF60cJ6UkEc
 kvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4RlndkABy70UiZ/oy2xt6QweGU3hHu478DrMWi7zZE=;
 b=R7LTkv6QXEa6jfwwXrjkNX6GFaA1/8GlUtE/AkQPYYkwVQwxqroY7CDcE7cL6ovcqT
 Dd+apwytbveXQ9Rajt9lY1NHDstS7FCg6ekfhPWqIt2HFcvftwFvN70/HJHouddSPJgs
 gSzCUHtNmD11Yz9mAorDUzhe9h9Ort68g84fpAbLjFNFOT/VmaX/49+3/rRv+ptB6gze
 X620Fw2wpqGSySvv4elrkvcGL8ALkXXYVBgWIR2iyn4CXpcgc3DF+wD2rFZowkv7ETZv
 d0bWi5QzSFScSHJtyoEia1+VJocCYJxgYEkBxKZtqSMG2sJGX25zYG/NIgEJd5uhx9l5
 G5pA==
X-Gm-Message-State: AOAM530gNTimEoATFTll5b+6jBPKpc7U7I1EfBapXTrE6jGcBPaacytu
 6ZN0K05PTC5GV/WG5etJBhawKD3hOK5ekw==
X-Google-Smtp-Source: ABdhPJyH2ZWAWcZK70M/PSHgM+e9jZkD2gqCSW6bbcGNlV8P1G70vDxr96hGcDiCsCkPd1mRY8uyVQ==
X-Received: by 2002:a63:6383:: with SMTP id x125mr688991pgb.161.1619966670910; 
 Sun, 02 May 2021 07:44:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/31] Hexagon (target/hexagon) replace float32_mul_pow2
 with float32_scalbn
Date: Sun,  2 May 2021 07:44:04 -0700
Message-Id: <20210502144419.1659844-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


