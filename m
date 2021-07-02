Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C13BA0DC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:03:15 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIp8-00026s-L3
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm3-0007Wl-AK
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm1-0007eW-5X
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6319955wmj.4
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uB3ZSiJBz4/YhD01KuEAw57MaeC3S8VOxIhVBGbMdpM=;
 b=rZ4Lbure39h15L+QPna+zyOh39fmHBfrtLv7h5mm/5Y7idD8mh6Ty367zNmJ+41zK+
 6IQAP/tXQKdrirrPkz+EZ++U0Vvui9j8epFsXaq8SM01+EbjFCHWj1J6nTdGe+XvQqsc
 qYHbhaiIfKEXg0QRFFlEbSsdFB4Yj240eBkzcP3U0afCicKB2cigpSA/b/+jZdTvcPTA
 +jPRb8W5IxbSPFl/sBi3+MDJP5bu/oCG5x7b+vd9xvMhBJa0cdkQhn5bHruP+M7+Ucjk
 0ZkEy8kgDJMnz2ApEKv2VL6FUgKy3puqKNgIhfRc24uURM0etd8kaVFqAp3DL2vlZFYQ
 qbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uB3ZSiJBz4/YhD01KuEAw57MaeC3S8VOxIhVBGbMdpM=;
 b=NE1CC811PTs+dx/bGHt+bdZo6liz7WlZqyrgccEgXRPf7WsKs81acNDf8zMYqt5YaX
 RnXTMxGxKJsyH1ycI91QL78VWJebhuM2hZCvyVdM8irhOnBWCTd7stLCIDZJLnT44SAo
 OoPewsuMjUSy+yQ9zP25lmeBdJzBMMyx24ClmDGSaN0IJTeYrJxmopCh3VFmwcZOYClt
 Cg4XBkPnJIA8gF8eN09y1cZKuboAsh3aImM6pSl5bV4xiuugDRmj058O1J52beZDj4mL
 JWexapsJ6Ed0hCyh1rg2jEpUoRM0czqgd3ccoZ4/mC1MXWQ1IiqjX2flQCviHj1ViXto
 qPzQ==
X-Gm-Message-State: AOAM533XxHi/j6v3AT6q/7vK/LcCHfbT19pBkVryg+IQIJ/Vk35FfO87
 MS+TJe8rQCSE5bStCDPaXqePOXLQwI/w4hi7
X-Google-Smtp-Source: ABdhPJx/lGFXJOfGzmR78P5KrXnirg9x51e2VpSulWthVyPZmgNHOaNJ6m7/4FbDsMWNzxTMTOpWZA==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr5477636wmj.159.1625230799917; 
 Fri, 02 Jul 2021 05:59:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] target/arm: Check NaN mode before silencing NaN
Date: Fri,  2 Jul 2021 13:59:35 +0100
Message-Id: <20210702125954.13247-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <joe.komlodi@xilinx.com>

If the CPU is running in default NaN mode (FPCR.DN == 1) and we execute
FRSQRTE, FRECPE, or FRECPX with a signaling NaN, parts_silence_nan_frac() will
assert due to fpst->default_nan_mode being set.

To avoid this, we check to see what NaN mode we're running in before we call
floatxx_silence_nan().

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.c | 12 +++++++++---
 target/arm/vfp_helper.c | 24 ++++++++++++++++++------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 9cc3b066e28..ac5c4452d53 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -365,7 +365,9 @@ uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
         float16 nan = a;
         if (float16_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float16_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float16_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float16_default_nan(fpst);
@@ -396,7 +398,9 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
         float32 nan = a;
         if (float32_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float32_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float32_default_nan(fpst);
@@ -427,7 +431,9 @@ float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
         float64 nan = a;
         if (float64_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float64_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float64_default_nan(fpst);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 8a716600592..24e3d820a5b 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -671,7 +671,9 @@ uint32_t HELPER(recpe_f16)(uint32_t input, void *fpstp)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float16_silence_nan(f16, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float16_silence_nan(f16, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float16_default_nan(fpst);
@@ -719,7 +721,9 @@ float32 HELPER(recpe_f32)(float32 input, void *fpstp)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_silence_nan(f32, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float32_silence_nan(f32, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float32_default_nan(fpst);
@@ -767,7 +771,9 @@ float64 HELPER(recpe_f64)(float64 input, void *fpstp)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_silence_nan(f64, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float64_silence_nan(f64, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float64_default_nan(fpst);
@@ -866,7 +872,9 @@ uint32_t HELPER(rsqrte_f16)(uint32_t input, void *fpstp)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float16_silence_nan(f16, s);
+            if (!s->default_nan_mode) {
+                nan = float16_silence_nan(f16, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float16_default_nan(s);
@@ -910,7 +918,9 @@ float32 HELPER(rsqrte_f32)(float32 input, void *fpstp)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float32_silence_nan(f32, s);
+            if (!s->default_nan_mode) {
+                nan = float32_silence_nan(f32, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float32_default_nan(s);
@@ -953,7 +963,9 @@ float64 HELPER(rsqrte_f64)(float64 input, void *fpstp)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float64_silence_nan(f64, s);
+            if (!s->default_nan_mode) {
+                nan = float64_silence_nan(f64, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float64_default_nan(s);
-- 
2.20.1


