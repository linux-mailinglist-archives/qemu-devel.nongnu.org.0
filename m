Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43368457265
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:08:30 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6RA-0000JK-Lj
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OA-0004qx-Vn
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:23 -0500
Received: from [2a00:1450:4864:20::42e] (port=45965
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O6-00046m-GY
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w29so18927155wra.12
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6+kbNIKcCXK0907P7ugOR11mTD7P22rtbPbpDrzrWQA=;
 b=oA4RRY7Pw/L6IOWd/1jDHcgayjN8IT6UW1MRHH2eGrRNnbjwmKjzlzmlarC0VGRimS
 vsUaVZ+FIHbvK0T36Js8HO1cLg2vDaAkpCa2XlqYT/VahWyynuCeSgwk3MGbmDn29xd6
 THhmWnEcWv1jIy9jAHLhBHOdT9W9UU6626rHTzo3h/vQGahPntrBAZqZkIuhP89VoQXG
 aa1oWY5478hmeZClOtSQuOTXroi4ieCkWgmaF+SFfmoiOu7qk1JbQY9kaLNH0K5DsnAI
 PM0GBSTq0iWxJjh4lmuBhrUTNqON5qbAG5jPFlhkgsECvsayY9K6Qxetnn1emn44+cVB
 wb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6+kbNIKcCXK0907P7ugOR11mTD7P22rtbPbpDrzrWQA=;
 b=DlANyDqr+zXhj244QHZehLplD6Z3MOhw+jAGKrX43G2ugcDCZN9VKRyfeTZFNSmK3i
 x6MY5kBiXdtGfILWVkD6GQ95VjTj48jTYX1wAR706p/BDiJVpq4qvEJnnQkv9KsqE16i
 TyiqN4eJSM5WWH5DJNlDP3IZ+OQ6RETBSCSHK1DK4DrSQmwoHZScg1yV51JFpcsJTKlJ
 DITIODQl00GrpUotEijsTALQVYO3nbKQY4GHsd6TL7a71/Rt4e2Oxg4Jn+zW14EiU0xe
 eTIIUcKgBzmL304UsMf0Wl/kcToDj9soj7tfVjzun/ARkdxVOUEr3Twv9ybkRFNMnhYd
 Bp3Q==
X-Gm-Message-State: AOAM530L19Ix9cXGRxa37es6FPquVVge3ZiL7VL72JLeBPuvFn2s1oTa
 ghs3nq0eAStJXruNyI+kcH+sozpOmZGyi1tsmB4=
X-Google-Smtp-Source: ABdhPJzt+NrSLqHJEKwiiHfbZVWUAkkgfK1cZ4iAUbB9d6gGUYYp7NzV7aN/E2eo8Yhvpv4/CF6Wcg==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr8400938wrr.370.1637337908849; 
 Fri, 19 Nov 2021 08:05:08 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/35] softfloat: Extend float_exception_flags to 16 bits
Date: Fri, 19 Nov 2021 17:04:28 +0100
Message-Id: <20211119160502.17432-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than 8 bits of exceptions.
Repack the existing flags into low bits and reformat to hex.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 16 ++++++++--------
 include/fpu/softfloat.h       |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 5bcbd041f7..65a43aff59 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -145,13 +145,13 @@ typedef enum __attribute__((__packed__)) {
  */
 
 enum {
-    float_flag_invalid   =  1,
-    float_flag_divbyzero =  4,
-    float_flag_overflow  =  8,
-    float_flag_underflow = 16,
-    float_flag_inexact   = 32,
-    float_flag_input_denormal = 64,
-    float_flag_output_denormal = 128
+    float_flag_invalid         = 0x0001,
+    float_flag_divbyzero       = 0x0002,
+    float_flag_overflow        = 0x0004,
+    float_flag_underflow       = 0x0008,
+    float_flag_inexact         = 0x0010,
+    float_flag_input_denormal  = 0x0020,
+    float_flag_output_denormal = 0x0040,
 };
 
 /*
@@ -171,8 +171,8 @@ typedef enum __attribute__((__packed__)) {
  */
 
 typedef struct float_status {
+    uint16_t float_exception_flags;
     FloatRoundMode float_rounding_mode;
-    uint8_t     float_exception_flags;
     FloatX80RoundPrec floatx80_rounding_precision;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index a249991e61..0d3b407807 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -100,7 +100,7 @@ typedef enum {
 | Routine to raise any or all of the software IEC/IEEE floating-point
 | exception flags.
 *----------------------------------------------------------------------------*/
-static inline void float_raise(uint8_t flags, float_status *status)
+static inline void float_raise(uint16_t flags, float_status *status)
 {
     status->float_exception_flags |= flags;
 }
-- 
2.25.1


