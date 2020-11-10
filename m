Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514472AD434
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:58:13 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRLo-0007JT-9N
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJB-0005E4-AO; Tue, 10 Nov 2020 05:55:29 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJ9-00076v-KB; Tue, 10 Nov 2020 05:55:29 -0500
Received: by mail-wm1-x343.google.com with SMTP id d142so2538949wmd.4;
 Tue, 10 Nov 2020 02:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4K3U1NewmUjwvna+a3l1Z82sMILfAkInSo7TJ3mQ3Sw=;
 b=mguOGh1SWxZqFHxC6z+CQSImAPJEqfAbpzxMgZhNw8p4epQ32yyongPmbTYrwA3sRM
 EV+bd0lfAsl1tm/Y9D+CnQcWoUo7nnz3DhA+Yxl5EjDgdUWeE1cZ6AVMYGcZALn4aqTH
 eREZIlCNhhQQ+sxRzANYdkPvhITQxWHKWNxlSf1xRc2dF0Sl9o+GIlySphdnmZLq7VzW
 YUX2BWUZBBtOhUDo/Wk05NoJ4wxwAQp8qFxrRxsI+kSnu2qNlsBgqoFqbGbxqdQwu2li
 +GH0Fs5RsEPyJQ7ByjKsSS9HW1NKG9E5v80NjYm2txyR5UNoJ72zy42Yz9nN6toOe/Fr
 Ic4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4K3U1NewmUjwvna+a3l1Z82sMILfAkInSo7TJ3mQ3Sw=;
 b=DxavgXYIoj0ukjf/Pmao5VhEmB6F3mB8ly6foPIs6+Gm3mi6qyuqjR5Twpjt3GqwHZ
 4wNOoRIFUL29n0Qqw/rbtJH9wam+hP5tb9k7J9r8gw7RmJGdHhozmkzRyKKCY9dnnKCx
 ag5jRHPFKjDDd+TbF5rpi0u5qseaszKEKYyCcKtDbWct5UfJgKadWAF3awDBpOugP2Bm
 DjGYTp8wA+k77e4VcC1zxfatJagmZwSjayv9w45u6oGIb3wYUq/66FhSNiW9taOQ/sTB
 XKMzMF+BVdBNuJkxtCPmtMrz6nlYs8ArjB4f1mrG1IJJr4pWk0b3376GaWpc+oOfNjA0
 69yw==
X-Gm-Message-State: AOAM5329AVa5IYnW/K3b30ZFZKJKs56YQZhYg50Lo+f07XQRn3swRTPl
 s/tVor+Gmc4/PLzGtsGpeoBuivo+7MABXw==
X-Google-Smtp-Source: ABdhPJw8hG6ApJNMCk1njgOp5SLqEMq2D5qpFyW2e95wHWx7fV9gwXt33kFQDTtEXxp4z0erfhoRCw==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr587252wmk.63.1605005725661;
 Tue, 10 Nov 2020 02:55:25 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id x6sm2567891wmc.48.2020.11.10.02.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:55:24 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] ppc/translate: Fix unordered f64/f128 comparisons
Date: Tue, 10 Nov 2020 11:53:18 +0100
Message-Id: <20201110105321.25889-2-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110105321.25889-1-thatlemon@gmail.com>
References: <20201110105321.25889-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the PowerISA v3.1 reference, Table 68 "Actions for xscmpudp
- Part 1: Compare Unordered", whenever one of the two operands is a NaN
the SO bit is set while the other three bits are cleared.

Apply the same change to xscmpuqp.

The respective ordered counterparts are unaffected.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9b8c8b70b6..b07ff66375 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2479,13 +2479,11 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
     if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
         float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
         vxsnan_flag = true;                                              \
-        cc = CRF_SO;                                                     \
         if (fpscr_ve == 0 && ordered) {                                  \
             vxvc_flag = true;                                            \
         }                                                                \
     } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
                float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        cc = CRF_SO;                                                     \
         if (ordered) {                                                   \
             vxvc_flag = true;                                            \
         }                                                                \
@@ -2497,12 +2495,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
         float_invalid_op_vxvc(env, 0, GETPC());                          \
     }                                                                    \
                                                                          \
-    if (float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {         \
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
+    case float_relation_less:                                            \
         cc |= CRF_LT;                                                    \
-    } else if (!float64_le(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) { \
-        cc |= CRF_GT;                                                    \
-    } else {                                                             \
+        break;                                                           \
+    case float_relation_equal:                                           \
         cc |= CRF_EQ;                                                    \
+        break;                                                           \
+    case float_relation_greater:                                         \
+        cc |= CRF_GT;                                                    \
+        break;                                                           \
+    case float_relation_unordered:                                       \
+        cc |= CRF_SO;                                                    \
+        break;                                                           \
     }                                                                    \
                                                                          \
     env->fpscr &= ~FP_FPCC;                                              \
@@ -2545,12 +2550,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
         float_invalid_op_vxvc(env, 0, GETPC());                         \
     }                                                                   \
                                                                         \
-    if (float128_lt(xa->f128, xb->f128, &env->fp_status)) {             \
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
+    case float_relation_less:                                           \
         cc |= CRF_LT;                                                   \
-    } else if (!float128_le(xa->f128, xb->f128, &env->fp_status)) {     \
-        cc |= CRF_GT;                                                   \
-    } else {                                                            \
+        break;                                                          \
+    case float_relation_equal:                                          \
         cc |= CRF_EQ;                                                   \
+        break;                                                          \
+    case float_relation_greater:                                        \
+        cc |= CRF_GT;                                                   \
+        break;                                                          \
+    case float_relation_unordered:                                      \
+        cc |= CRF_SO;                                                   \
+        break;                                                          \
     }                                                                   \
                                                                         \
     env->fpscr &= ~FP_FPCC;                                             \
-- 
2.27.0


