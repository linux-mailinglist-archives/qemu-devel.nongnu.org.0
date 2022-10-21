Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6036070D9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:20:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmKD-0004lR-Jd
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:20:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHE-0003CD-P4
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH5-00039P-3h
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH0-0005d3-P8
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ez6so1689430pjb.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuYObXlFmz1SmrGQdE1r0MOoxWD6WYua5nMC/+UaBVA=;
 b=fNqdUS16CSPmNuUqAF51Na2aaujn8wyzVkoyTlQujG7W6D+887kBWLGgukONLCtCVP
 snNutcu3RSX7S5Ud/lw9ZKfx22XpsLDxeL0hEOPWMJ6Xq+jJsBOoUZhQcKM1V2wvI/PF
 n3l9OUbv0HKPWhlPRdkrFM0ixw+4sTAFGrwb3z0L4Le9dpumnU7Ko5tVGkNcNRFOmnUK
 lEWK9436B38Tpu3ejDBLqJpc/PEGE0n4yLC0v4FDzt2p/huFajx74WVctn5wwgIIUMyb
 j2qy2aq4+ZCKA1149POJOfLJpI1lTLPBoGG3lJm6terfSe0hpnNwFtAhaHQsBQIhnKtm
 QuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuYObXlFmz1SmrGQdE1r0MOoxWD6WYua5nMC/+UaBVA=;
 b=Vq6kRpWWyc/1MkTxV3sYj42Jkya/+KbsxJlTQ0n6fy6+8l/WHObMA1fa8CkC0ic4yu
 QGqHZs6r5e5IcuNgHsAx2nczUu/Nv/5al2/XoDpeUalWASBWhA15GtGMW1sJRIzbeLeL
 /HV71dU4iHNjFGr1/gOmfOFDJrsH/tpNI+9Dugbq+2DJgbxyVuoQJR4qxsGd/+f1R+yK
 gtoxh8WYSqS4DqhtmC2Cu1eCnLmYykZW3sM4spH2a5QwWKoQf2Cfvpjm5RoIfRr8HL9Q
 TYpT4IQPK1fr1iUFCwMI144bOCU5B5A9FoJM9USGY1e+OFeifpjcaTyMJ+fKvNuA6oDO
 /6OQ==
X-Gm-Message-State: ACrzQf22pTqwNiEvxCfnjoLaNYvSqq/uqV8v9xXMNn0b2RQUAepCTcXh
 UxULC4gksobJpq5Eh+L2sAcbvNQWMVGcIC9F
X-Google-Smtp-Source: AMsMyM51FEqgTzjUwcopVQFw3Na1Y5f80VyiVTNwjd7cgJK1fnx0kTKOML9ECaNCoGp2wrzpp35Xbw==
X-Received: by 2002:a17:90b:4a84:b0:20d:8953:5ab0 with SMTP id
 lp4-20020a17090b4a8400b0020d89535ab0mr55825022pjb.48.1666336612792; 
 Fri, 21 Oct 2022 00:16:52 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/36] tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
Date: Fri, 21 Oct 2022 17:15:23 +1000
Message-Id: <20221021071549.2398137-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the error-generating fallback from tcg-op.c, and
replace "_link_error" with modern QEMU_ERROR markup.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h  | 12 ------------
 tcg/tcg-internal.h | 14 ++++++++++++++
 tcg/tcg-op.c       | 10 +---------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5c2254ce9f..d207bc47be 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -737,18 +737,6 @@ static inline TCGv_vec temp_tcgv_vec(TCGTemp *t)
     return (TCGv_vec)temp_tcgv_i32(t);
 }
 
-#if TCG_TARGET_REG_BITS == 32
-static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t));
-}
-
-static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
-}
-#endif
-
 static inline TCGArg tcg_get_insn_param(TCGOp *op, int arg)
 {
     return op->args[arg];
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index cc82088d52..a9ea27f67a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -59,4 +59,18 @@ static inline unsigned tcg_call_flags(TCGOp *op)
     return tcg_call_info(op)->flags;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t));
+}
+static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+}
+#else
+extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+#endif
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00cc..3ed98ffa01 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -28,16 +28,8 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
+#include "tcg-internal.h"
 
-/* Reduce the number of ifdefs below.  This assumes that all uses of
-   TCGV_HIGH and TCGV_LOW are properly protected by a conditional that
-   the compiler can eliminate.  */
-#if TCG_TARGET_REG_BITS == 64
-extern TCGv_i32 TCGV_LOW_link_error(TCGv_i64);
-extern TCGv_i32 TCGV_HIGH_link_error(TCGv_i64);
-#define TCGV_LOW  TCGV_LOW_link_error
-#define TCGV_HIGH TCGV_HIGH_link_error
-#endif
 
 void tcg_gen_op1(TCGOpcode opc, TCGArg a1)
 {
-- 
2.34.1


