Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C3376EC4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:29:46 +0200 (CEST)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCiv-0007bU-Ky
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC88-0003Gz-6J
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC84-0005Vp-Uf
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso6554012pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JS8tZ6x51imi92atbxTjzW0YkjZEJbOn/9U4cbpj3JE=;
 b=Jzx+hLB96tOM3ip4mAYtlxwCUdA5jv8aSxM/7533rNlGuuudI25kMLvmb00hmFgwMp
 uFrFu2Ywl6M3ZIt9y3ZqQwiFlroQyQ0HB/+5Fp/jkqIN9E5yc7ePAkhfqDohDMs4ABLn
 DIvjrjQEUl3XMQewrH6qOxRMo07C1vJIDKZnLcYQxe4Hc/C4Y7IAsvLUvbQZ8/oaq1op
 14XbLOB4NeZYJONrL1XwCKgpgAAWIU+ixDbvBi5daBXdwLiXwnX+6X/+XOdi5fO43xd5
 y9qT2rI6soW1WhuewUOtgLwpLaHzW24W6xGOSQjkU4U6uefeWimfSVB0rRyMN0hom0JK
 ylbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JS8tZ6x51imi92atbxTjzW0YkjZEJbOn/9U4cbpj3JE=;
 b=a9QvkLfjwJbgxac3KYwf/LeGQgF+sjcNNIZ+MPeN8wpeiju5BSHWP1tariZzw07PEI
 QT3MtfgE+9/cHlfHLP9qGm9T71huP0Wg28IEU4BSXakUKuJTetFvxxv2v9zNOPfnAa4r
 EJ/vGGqG1zd0sHlLx2XrDDlmfKz/McaRtgDjH6XLytMARDzwx8VxhTQPGoy7ccH173fb
 +zvcqZKqQYOH/a9q+MgQPhlC/psM7rUNxYtHTWufRxjViXFHg37R6/+07MmfBx3AtlQT
 EtzOQCK7Vx8exBylunL66eb93/iDnZ9FURlu7s8fi0pqmi7tqrtkOnV/dOzDMIdPbZq+
 1c3Q==
X-Gm-Message-State: AOAM531Ww4PeVtO7cr56HVsYOwVC7eZGECtQVmsHAVsOHSBgEmiITHKe
 pDWeUGnaMEPN7LHzauWrTs1fFG0JtmQlWA==
X-Google-Smtp-Source: ABdhPJwjlrkEwIWUYgNP79GHIUVkF2GLkOLClTQOMEYTNiqODnMSnYSkC289dxcWQUvMUvl6DaRhSg==
X-Received: by 2002:a17:90a:4588:: with SMTP id
 v8mr26156047pjg.195.1620438699612; 
 Fri, 07 May 2021 18:51:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 55/72] softfloat: Reduce FloatFmt
Date: Fri,  7 May 2021 18:47:45 -0700
Message-Id: <20210508014802.892561-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
index 4df69029ec..6a77e35663 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -562,9 +562,7 @@ typedef struct {
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
@@ -574,24 +572,21 @@ typedef struct {
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
index 65462bf6cb..3ee6552d5a 100644
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


