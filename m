Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0E39C132
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:20:37 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGJ2-0007j9-T4
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB5-0005rK-Ng
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB0-0005LT-MW
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:23 -0400
Received: by mail-pl1-x629.google.com with SMTP id e7so5222221plj.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CxYpmIwPsuqyedl4XSakQYdgXzRY6daTbDUsC28Mn8E=;
 b=WHBuM6Y3pHT9kL5PVWkcFXqXpLgQaz8zHM0EHE1rNoMT/oiH2YDuQM8eeNjPlP1Jhd
 2KN3RLIiNinC+Y4qj/nxi8A2n8xYHRmswy4dqJB2gfw3UfNqh5KngmFN5cWNjncFyw/S
 FCQOmZB2B+TUqILs+Y962hpFdWsAZpaj51zXI//BT7ArFjBaDt+pYE8ZH6IgVvd2zDlt
 jdPgKICL5J7LE/ksmN9CKx+jLGf6iDUiYIPHdeAY7Zd9tjccq7L4D6Po63BZYX1QY4AM
 isGWecP/RNPSyhUwqguHSvLziVGBkkWSbNkrDCp/ipv6Hz2l/uhVxS34lEPYfP2g1YML
 bQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxYpmIwPsuqyedl4XSakQYdgXzRY6daTbDUsC28Mn8E=;
 b=j1qypnEnMSGTtW3nAk6kYTB+Z9Rrt7tmRS+11QVOb/+52Q2QCmEebom+DD+0RWQGMi
 BmCUQyuLdslpUQE+JNrkk/DXwX7jfkSczfKHPmzqNDrPxOIvYbiNn/lZxF28pa0uF/WL
 7VNgalTJfr/7p+c4tjuZp+DGBKOL8ZKvI4bES3kjA6fSkqeHl0pVJkT6/JDcUS2EgldO
 eWLaDeajFsFwoHrGBMbPUk0xH2NcT5GJCbIQne5loGvTwTq7LqVv088NaSl5fKVD4Azf
 FnmmC5ZyQjODw3fY5juP67XDjwIogtqmA4yfxQ5l82+Cml1Lap9hO1V/AaDiNkQAsuh7
 E+2g==
X-Gm-Message-State: AOAM533eGQbTtTXiXMLKrs2YQR+xQVnCTNYVe+TFZo5pHmwkc/GdQNU0
 9sGToOXcPDC2jwojGk4lXLG+AGhHrxZWFQ==
X-Google-Smtp-Source: ABdhPJzhgZSmZSzDD4SzamC9OmA87tnbI/vudKIvEuQFy2n/Emde0kLLaZseRlvhIurBnqFWX4rm1Q==
X-Received: by 2002:a17:90a:549:: with SMTP id
 h9mr19440686pjf.158.1622837537496; 
 Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
Date: Fri,  4 Jun 2021 13:12:06 -0700
Message-Id: <20210604201210.920136-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is minimum and maximum, signed and unsigned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 71621f28e9..4815a34e75 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -168,7 +168,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
-#define TCG_TARGET_HAS_minmax_vec       0
+#define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f0cfed7700..8193d768d6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -188,6 +188,10 @@ typedef enum {
     INSN_VQADD_U   = 0xf3000010,
     INSN_VQSUB     = 0xf2000210,
     INSN_VQSUB_U   = 0xf3000210,
+    INSN_VMAX      = 0xf2000600,
+    INSN_VMAX_U    = 0xf3000600,
+    INSN_VMIN      = 0xf2000610,
+    INSN_VMIN_U    = 0xf3000610,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2400,9 +2404,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
@@ -2768,6 +2776,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mul_vec:
         tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_smax_vec:
+        tcg_out_vreg3(s, INSN_VMAX, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_smin_vec:
+        tcg_out_vreg3(s, INSN_VMIN, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2777,6 +2791,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sssub_vec:
         tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_umax_vec:
+        tcg_out_vreg3(s, INSN_VMAX_U, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_umin_vec:
+        tcg_out_vreg3(s, INSN_VMIN_U, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_usadd_vec:
         tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
         return;
@@ -2902,6 +2922,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_cmp_vec:
     case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return vece < MO_64;
     default:
         return 0;
-- 
2.25.1


