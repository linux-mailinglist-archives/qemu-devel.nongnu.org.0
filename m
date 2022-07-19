Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D057A607
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:04:26 +0200 (CEST)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDra5-0004Bc-6U
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWU-0006VP-V5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:43 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWT-00069O-De
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:42 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10d6cdf829aso5309595fac.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFKoLgh7kEAYg5YiD043isVRo3PiGpWwp0kGPl/3N6g=;
 b=NbLOLsjYGvjfMgWjLlKqRit1GgjSAUSEXL4A/BLIF7ahdcphx1JsKKbC6SE5OJ8e7R
 +Rc64ITyaiWDRSKJZUjSzRIC2AmqB5ii0oKzHS0Wsdt4fRv1EzypAaW/3BOAQN8xUD06
 Yqm0gVHM7dx6okZJaH9xWxwJxcy0kNo0xAC2KukD3ZPtE5EsMAFT0+QQi4f3wunAjoBf
 1FtP0C0CCcwc9QqZkST2WiOszGhxBnpr+ymLj9aOlvcfJMypZ2DGClWvNnHvQ4EaEypU
 a7rNC316quPZtuGhcq4UyFGp5z5p5Ns9Uzv5O6i6WFfUUIPHIFhpdQ71CwqdJKZRJyiV
 dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFKoLgh7kEAYg5YiD043isVRo3PiGpWwp0kGPl/3N6g=;
 b=ZlvWSph58A1tiHdmmCM3n8v9ED9FCt0Bnm5tc3XY+oEO54GRMaBOqeEquoEWdwWB7C
 /OJ7IWE5plbGsdQR4NGHziQTXQWeoytvx2z2DKqM0I2+alKsbF909iuvKeDkHIb4Ka8Q
 f08gIZmIBO9rfPnzdQgTk7EA9aChKokVH4yJXQJztrqpuaLWevNDxCdI+GbfDWra5VwW
 4vihTOL9HseMIjzZlvgrduLT72gk3f56jMZowp9KUQfkBHUqF4RKfWJd1RIBgRRJ+/vE
 o2XauwhE5L7J87kP/sYAsr4xbDd0s5h1I+aWKSAGMB79EQy4eZGPZ/W7GIP+LwwcEMfu
 lhnA==
X-Gm-Message-State: AJIora+43dKoPUAWFqbZaJ0splQfeX0mnVR/tJkyBJ+nGWUJhEmo5u23
 hZDUTQIyJkcFPSJuRg0WaKsrGRJUUo7PDF8S
X-Google-Smtp-Source: AGRyM1vrBNl4tbtvussFdYoJ57O2gsHfFtJ6BlVHQ3MidFB67Zem770Z5BbMfDdts12ULE6gU+QQEA==
X-Received: by 2002:a05:6870:70a8:b0:10c:190d:b32f with SMTP id
 v40-20020a05687070a800b0010c190db32fmr388006oae.14.1658253640690; 
 Tue, 19 Jul 2022 11:00:40 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 08/21] fpu/softfloat: Add LoongArch specializations for pickNaN*
Date: Tue, 19 Jul 2022 23:29:47 +0530
Message-Id: <20220719180000.378186-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

The muladd (inf,zero,nan) case sets InvalidOp and returns the
input value 'c', and prefer sNaN over qNaN, in c,a,b order.
Binary operations prefer sNaN over qNaN and a,b order.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-3-gaosong@loongson.cn>
[rth: Add specialization for pickNaN]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 943e3301d2..9096fb302b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -390,7 +390,8 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
                    bool aIsLargerSignificand, float_status *status)
 {
-#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA)
+#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) \
+    || defined(TARGET_LOONGARCH64)
     /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
      * the first of:
      *  1. A if it is signaling
@@ -574,6 +575,29 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
             return 1;
         }
     }
+#elif defined(TARGET_LOONGARCH64)
+    /*
+     * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'
+     */
+    if (infzero) {
+        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
+        return 2;
+    }
+    /* Prefer sNaN over qNaN, in the c, a, b order. */
+    if (is_snan(c_cls)) {
+        return 2;
+    } else if (is_snan(a_cls)) {
+        return 0;
+    } else if (is_snan(b_cls)) {
+        return 1;
+    } else if (is_qnan(c_cls)) {
+        return 2;
+    } else if (is_qnan(a_cls)) {
+        return 0;
+    } else {
+        return 1;
+    }
 #elif defined(TARGET_PPC)
     /* For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
      * to return an input NaN if we have one (ie c) rather than generating
-- 
2.34.1


