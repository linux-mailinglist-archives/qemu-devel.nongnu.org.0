Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BA84572B3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:19:13 +0100 (CET)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6bY-0004KN-3S
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oi-0005hX-7M
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:56 -0500
Received: from [2a00:1450:4864:20::330] (port=43849
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Og-0004KG-H9
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so7894712wmz.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dI/RRnIY0asid2SKSr8fNdGUfNgvNA1icudnlpjG50=;
 b=a6togByjlV0pO98TkmXjEElUPXfXnpCmVugEHZfZpSixVl6QiraWGW+QO+BV37dtv3
 Y8n1VCcs8jDGdXG5q2eKR5KdQmBDqlCbboWyv4R3vM/2RA4nbf1aYm38poNANQuDjFAP
 LBySmOORjgWhRo+QpmUv6fT6fsst6jEqBvN7xi8rXTRk981L83+FeCsM5LwrXxoU86uy
 5omXCXp1QyHbCn576xpqiC0Pgd7sDC3dF2DYCahNPpve9bm1aEcGa5qWndKmUhUjfu8g
 nFdfb0TEdW6Qiv7h8ny/BorfjyIS9gvJ/qiiMhf6Ssy+2g4/gy2N/cBJyc1Ajsx29PMe
 PZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dI/RRnIY0asid2SKSr8fNdGUfNgvNA1icudnlpjG50=;
 b=PAIX5n/XIwb/xknq68te4IRcfxglm9UOnMkJpllwekr6zJR7+QM2LT5CQHuBhZ8WOn
 ExQk6TPEpiIAEplxy5dgpCzjne1HmGSTVe32Qc0jmGuaMv8JYjyO+EQWTafCx04gB6tJ
 QX7Mws23ZiTF397drQUHPye0jFmGXB6v6ZmDcideep4mQ221wJ40Wh9rn1rLY7hkQJL+
 J8JQuJdHT1lpeCXSyw+v/33z47h86/iVM7HAz8Pf1/KDou3Mm8YiQfvvxWQYv973xAbE
 qryQptCTDN8iAj6Q1g8Qda5GydyG2ksngKLR77o+f+VdDS1fMgk+srDcBLi5N8eFTkDB
 BIZw==
X-Gm-Message-State: AOAM5322jY6wrp7it+RRtRNiN/Z0Ft5ohYfKdWlchB50H+i9flsOt7JH
 YWnJS2HHMWUGCjk8IDdNy8nCKeD2In/xHDG4TGM=
X-Google-Smtp-Source: ABdhPJxIUm8ifVZnxphyIZSEnLmjbWbfgNoOUUEPtWW2FLwplLrMUSrgqUi4vYAB/xA+cUfPCbKfbA==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr887149wma.121.1637337953144; 
 Fri, 19 Nov 2021 08:05:53 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/35] target/ppc: Split out do_fmadd
Date: Fri, 19 Nov 2021 17:04:46 +0100
Message-Id: <20211119160502.17432-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

Create a common function for all of the madd helpers.
Let the compiler tail call or inline as it chooses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index fdf06f6dc5..d2a7bf5e63 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -645,23 +645,26 @@ static void float_invalid_op_madd(CPUPPCState *env, int flags,
     }
 }
 
-#define FPU_FMADD(op, madd_flags)                                       \
-uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                   \
-                     uint64_t arg2, uint64_t arg3)                      \
-{                                                                       \
-    uint32_t flags;                                                     \
-    float64 ret = float64_muladd(arg1, arg2, arg3, madd_flags,          \
-                                 &env->fp_status);                      \
-    flags = get_float_exception_flags(&env->fp_status);                 \
-    if (flags) {                                                        \
-        if (flags & float_flag_invalid) {                               \
-            float_invalid_op_madd(env, flags, 1, GETPC());              \
-        }                                                               \
-        do_float_check_status(env, GETPC());                            \
-    }                                                                   \
-    return ret;                                                         \
+static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
+                         float64 c, int madd_flags, uintptr_t retaddr)
+{
+    float64 ret = float64_muladd(a, b, c, madd_flags, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (flags) {
+        if (flags & float_flag_invalid) {
+            float_invalid_op_madd(env, flags, 1, retaddr);
+        }
+        do_float_check_status(env, retaddr);
+    }
+    return ret;
 }
 
+#define FPU_FMADD(op, madd_flags)                                    \
+    uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,            \
+                         uint64_t arg2, uint64_t arg3)               \
+    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); }
+
 #define MADD_FLGS 0
 #define MSUB_FLGS float_muladd_negate_c
 #define NMADD_FLGS float_muladd_negate_result
-- 
2.25.1


