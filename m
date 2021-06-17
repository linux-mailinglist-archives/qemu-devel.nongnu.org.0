Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B33AB391
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:29:22 +0200 (CEST)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltr97-0006xg-QV
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwt-0001Ei-Ut
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwn-0006we-F9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so4140604wmf.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cxfool06uV8l9XFKBMd1zAXvGdcTQUvXmsOQAOBYwSk=;
 b=QWA4ez29Hyu2OpXX0oBKSDLnnCSEXmglUisD/9fwgani8lc4dGEH20H0D3WQNiPvr2
 7DSVFKeMecRMcKV9s4j3HM1c/T0FxFuTb9nWJh96rUmvirb1H7lN4B+dhBqhz47ZGdF+
 Zi2BUA+U4dW27fDrf5xPa89gM8UMxtrQoDQpLcN+EG9P2Zy20srs4YBCZ5yPu15wSTQZ
 zQWyYUaZgYi+ofF17RoEw6fKiO/e3PKyrQTMBxRa9ncv/fvmiFrl4UhzFQYTSkx5NTXE
 VINCTkJdARcRnOiJx5KmwV6eljfLN2NQwmR/yh/zpJ9b2EyR47GXkTVaCtXBRdYsn4Gz
 K1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cxfool06uV8l9XFKBMd1zAXvGdcTQUvXmsOQAOBYwSk=;
 b=MEq29xIx4mIhvGBqQBl1/7nJzy4bm6lSSq2S/kj6iwbkmQavRfKv9WO1QHGZn5W+fD
 bSCWk7naukbX4/oCOJAG85Zey2YSTO20R19Y/LWvo7klkOfI4fxSU7PWsYmi8MGvzJVQ
 qfyNNZL82hT3PS2ZHMuacVmeUUaxjG+ESboWAbeirmVqnTlJgp9GwPnsYTOJDntE99b6
 fJdnPZ1zZs5OtNb7likxnMi7wBXrk9jqpyvj1FKkwtX8lDtzmqbru5SgpVmbK7KFWZUC
 Gp6q5BT/ZQIN+zyFalPUAOZfspO5h62dln1khojEBxnBT5yaY8s2uhlL6rpR47nee+X9
 sz8Q==
X-Gm-Message-State: AOAM532r58BEZXO88FVB7GRt0H/WHFNG4rUJrYYY/HqcClgg4rudtonh
 T2ijxdL0ME5+C904ixrAFExLDw==
X-Google-Smtp-Source: ABdhPJwZuzvT7AVnHYxIHmcoDx++u1SMQXKXsgWyKBk3yrKXDg6RR3WWoKh631/L/aDMEqAWXYiMEA==
X-Received: by 2002:a05:600c:3b10:: with SMTP id
 m16mr4653643wms.55.1623932196078; 
 Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 07/44] target/arm: Implement MVE VABS
Date: Thu, 17 Jun 2021 13:15:51 +0100
Message-Id: <20210617121628.20116-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VABS functions (both integer and floating point).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 13 +++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f1dc52f7a50..76508d5dd71 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -49,3 +49,9 @@ DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vabsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ff8afb682fb..66963dc1847 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -77,3 +77,6 @@ VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
 
 VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
+
+VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
+VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 97da43fa3d6..eaf750ead0b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 static uint16_t mve_element_mask(CPUARMState *env)
 {
@@ -296,3 +297,15 @@ DO_1OP(vrev64w, 8, uint64_t, wswap64)
 #define DO_NOT(N) (~(N))
 
 DO_1OP(vmvn, 8, uint64_t, DO_NOT)
+
+#define DO_ABS(N) ((N) < 0 ? -(N) : (N))
+#define DO_FABSH(N)  ((N) & dup_const(MO_16, 0x7fff))
+#define DO_FABSS(N)  ((N) & dup_const(MO_32, 0x7fffffff))
+
+DO_1OP(vabsb, 1, int8_t, DO_ABS)
+DO_1OP(vabsh, 2, int16_t, DO_ABS)
+DO_1OP(vabsw, 4, int32_t, DO_ABS)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
+DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bd908abcff7..90996813a85 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,6 +199,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+DO_1OP(VABS, vabs)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -237,3 +238,17 @@ static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
     return do_1op(s, a, gen_helper_mve_vmvn);
 }
+
+static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfabsh,
+        gen_helper_mve_vfabss,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


