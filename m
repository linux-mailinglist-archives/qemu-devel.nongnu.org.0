Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA6390642
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:12:14 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZfB-0004QS-Ag
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeR-0001fF-C6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeK-0006g6-3F
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so13344498pjv.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+y2XL8VpmUirN1zSziSG8ebnfy7nnAzZqTrnTQJTMM=;
 b=ApVgzULSBQZRvZLCXwLwEz5nCLWO9rqyRm17cxKYJLkDT9hAzlZ/bnozPOpvLN1H0p
 +zAm0kXBjKe1DKbbAlcdQqOFaLUp6Y/xIYM8ewKOhglf0qNoRn2lDRsja/i0lMuXUxo9
 4TZMtjPVHd0K7SMI3+x2hHUwkUEEugGB4R5J7udjVuUs0mOTr1RpKaXaJ6kJ5Rm9L0+V
 htFS9jyJecVssCXQgi4k2YpwFjyjzhmpQjloeMFuCWlnznK44WbL81422Bq628kpS9w3
 W0CS1C3NhEfGoHABfrqGHNnzg/0DJxoBDQmrmjCUNaKJafQuY45qvMfD7JjoztsQaJmf
 9kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+y2XL8VpmUirN1zSziSG8ebnfy7nnAzZqTrnTQJTMM=;
 b=kseec/MCzw0kwWSShTd2PvIFFmizTgYPlfFvU30+s0HlpIBifzaTf0lntPLtDjH4Ne
 RKqPLJoqgvmozFlqLmvrUFIj62zivuSjBbKb+bxGBTCS+wzZn/v6NMhkdFnxruHh9iIc
 KeNoCluSGXC9Ihs0aOmlJ8iIV6K65xnPFR7qN43bebT0zDPbU30mmQv0JI7VKxMdjQse
 d0EelyHvsRO2xJVMXBIZXyDAfYWfhgB5p7WXvY5zOZv65kg8TX60dQRcNJAB7lit3hjJ
 noGki55o4WDqjVEVJxFIPSpCkJ4ivWVttV2SC8NmNdVCv+bRLhLc4zKhIHF1Z8LTKp8u
 DJsA==
X-Gm-Message-State: AOAM5315JtZceJ9AllhNhuCy4+SEh3bhnTcPcbD9Cga2QvfQYzYkmp3W
 6eQHh8HfWovB7FDD2h3A2Pw84EoIh6NHdA==
X-Google-Smtp-Source: ABdhPJyjpcWscHcJpY4mellAXnn1TEIg3wMpaqBFX/BiRx7gd1yYQrd/D1KxPsPmv8tNaPL1GeY0Ew==
X-Received: by 2002:a17:90a:6ace:: with SMTP id
 b14mr5321259pjm.142.1621955233362; 
 Tue, 25 May 2021 08:07:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/28] softfloat: Reduce FloatFmt
Date: Tue, 25 May 2021 08:06:47 -0700
Message-Id: <20210525150706.294968-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove frac_lsb, frac_lsbm1, roundeven_mask.  Compute
these from round_mask in parts$N_uncanon_normal.

With floatx80, round_mask will not be tied to frac_shift.
Everything else is easily computable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 29 ++++++++++++-----------------
 fpu/softfloat-parts.c.inc |  6 +++---
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2f2bea84da..f6adc2c5ec 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -563,9 +563,7 @@ typedef struct {
  *   frac_size: the size of the fraction field
  *   frac_shift: shift to normalise the fraction with DECOMPOSED_BINARY_POINT
  * The following are computed based the size of fraction
- *   frac_lsb: least significant bit of fraction
- *   frac_lsbm1: the bit below the least significant bit (for rounding)
- *   round_mask/roundeven_mask: masks used for rounding
+ *   round_mask: bits below lsb which must be rounded
  * The following optional modifiers are available:
  *   arm_althp: handle ARM Alternative Half Precision
  */
@@ -575,24 +573,21 @@ typedef struct {
     int exp_max;
     int frac_size;
     int frac_shift;
-    uint64_t frac_lsb;
-    uint64_t frac_lsbm1;
-    uint64_t round_mask;
-    uint64_t roundeven_mask;
     bool arm_althp;
+    uint64_t round_mask;
 } FloatFmt;
 
 /* Expand fields based on the size of exponent and fraction */
-#define FLOAT_PARAMS(E, F)                                           \
-    .exp_size       = E,                                             \
-    .exp_bias       = ((1 << E) - 1) >> 1,                           \
-    .exp_max        = (1 << E) - 1,                                  \
-    .frac_size      = F,                                             \
-    .frac_shift     = (-F - 1) & 63,                                 \
-    .frac_lsb       = 1ull << ((-F - 1) & 63),                       \
-    .frac_lsbm1     = 1ull << ((-F - 2) & 63),                       \
-    .round_mask     = (1ull << ((-F - 1) & 63)) - 1,                 \
-    .roundeven_mask = (2ull << ((-F - 1) & 63)) - 1
+#define FLOAT_PARAMS_(E, F)                             \
+    .exp_size       = E,                                \
+    .exp_bias       = ((1 << E) - 1) >> 1,              \
+    .exp_max        = (1 << E) - 1,                     \
+    .frac_size      = F
+
+#define FLOAT_PARAMS(E, F)                              \
+    FLOAT_PARAMS_(E, F),                                \
+    .frac_shift     = (-F - 1) & 63,                    \
+    .round_mask     = (1ull << ((-F - 1) & 63)) - 1
 
 static const FloatFmt float16_params = {
     FLOAT_PARAMS(5, 10)
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index d72fe3ab08..b456c1c30c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -145,10 +145,10 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
 {
     const int exp_max = fmt->exp_max;
     const int frac_shift = fmt->frac_shift;
-    const uint64_t frac_lsb = fmt->frac_lsb;
-    const uint64_t frac_lsbm1 = fmt->frac_lsbm1;
     const uint64_t round_mask = fmt->round_mask;
-    const uint64_t roundeven_mask = fmt->roundeven_mask;
+    const uint64_t frac_lsb = round_mask + 1;
+    const uint64_t frac_lsbm1 = round_mask ^ (round_mask >> 1);
+    const uint64_t roundeven_mask = round_mask | frac_lsb;
     uint64_t inc;
     bool overflow_norm;
     int exp, flags = 0;
-- 
2.25.1


