Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03555B944
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:49:37 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mJE-0003g9-SC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltS-0002RS-DG
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltQ-0004rL-9K
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n1so12308150wrg.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BN4IBa0O3M5EDgTe2ogiAerPKFhYoZaI913konjwrVU=;
 b=naTHypjVdSZN63rf5N8e3gyS1Vsx+C7AazPCcjvV0eKE6FmHhtEsUNzrEuHkOFYnOD
 RT5uoh9H9Mz9FfXeY9/qvDxaP4lcmNr0b1eiCjb4OHiUjOh3t93N8XPyxo7nyUP+k1Y1
 zos1WvH1thryiMDc2cwE7XJvwKb1M9rEIxYDBbPU/1pzG7drt2TtFwqRhJFhjxJl76TU
 ZFU3rgKjLVfY5xRtO3kyI0mdMq0cS/uHQpaCjoki+ehUKSEY4ADbTeJY1ioz/f7IDHo2
 pfRuW50jQ/N6yXqDo8WXwvaM5pwIYQsz1VLfulfGE+XDgeuC0nh2GvuES5SUnMlm4KPz
 j7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BN4IBa0O3M5EDgTe2ogiAerPKFhYoZaI913konjwrVU=;
 b=EyRF5Iq9J+pVGAFJmk3fn9tdWS4yxr7Om9tRGpbW1n2kMfS30ZBgjm2Qvgmg4DZa9/
 tJuQFAiuJUE4l4A9e3OZWCQ5N7Us34BNx+/8dyKRNtxBHhnuMsUeS3fQtBqexXWa2cxy
 bqg+ZL6IfwZ/znJKHIkGcfaV1VUNsleXgtG7wbg5s/rwFZFUer2RoryrKQDtYeJE6j2M
 3qVZ6xr5JlnGobYJA4eSbjTmHT1QhgWYYmR/7Ho0uPCS7wA/upALcVdQtQf4ylQfqLSX
 ko/QnHUfGqRNA4UqZU9p3fX70c1H2fywpJYGh0wnhegDGMG+hwbJPNwdPfDUN2nrsFOq
 xA0Q==
X-Gm-Message-State: AJIora9nGHNioxKFiJYZ1RXa674JPJKPH0Mm8EqiEhPtO63da2f6P0RG
 1lzd3wIIkqOiIXNR4q0kTVQJl3dF259ISg==
X-Google-Smtp-Source: AGRyM1sLQAoA20FXtbW5E6MyvZdL+lH89HUdSW3dcLebQ6QYwAYWiAUBtcW6P8PLDrXX0vn9css60w==
X-Received: by 2002:a5d:698a:0:b0:21a:3972:7a60 with SMTP id
 g10-20020a5d698a000000b0021a39727a60mr11210864wru.549.1656325375523; 
 Mon, 27 Jun 2022 03:22:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/25] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
Date: Mon, 27 Jun 2022 11:22:34 +0100
Message-Id: <20220627102236.3097629-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We will need these functions in translate-sme.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dbc917ee65b..f0970c6b8cf 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -107,6 +107,44 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/*
+ * Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.
+ */
+static inline int pred_full_reg_offset(DisasContext *s, int regno)
+{
+    return offsetof(CPUARMState, vfp.pregs[regno]);
+}
+
+/* Return the byte size of the whole predicate register, VL / 64.  */
+static inline int pred_full_reg_size(DisasContext *s)
+{
+    return s->vl >> 3;
+}
+
+/*
+ * Round up the size of a register to a size allowed by
+ * the tcg vector infrastructure.  Any operation which uses this
+ * size may assume that the bits above pred_full_reg_size are zero,
+ * and must leave them the same way.
+ *
+ * Note that this is not needed for the vector registers as they
+ * are always properly sized for tcg vectors.
+ */
+static inline int size_for_gvec(int size)
+{
+    if (size <= 8) {
+        return 8;
+    } else {
+        return QEMU_ALIGN_UP(size, 16);
+    }
+}
+
+static inline int pred_gvec_reg_size(DisasContext *s)
+{
+    return size_for_gvec(pred_full_reg_size(s));
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67761bf2cc5..62b5f3040c7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -100,42 +100,6 @@ static inline int msz_dtype(DisasContext *s, int msz)
  * Implement all of the translator functions referenced by the decoder.
  */
 
-/* Return the offset info CPUARMState of the predicate vector register Pn.
- * Note for this purpose, FFR is P16.
- */
-static inline int pred_full_reg_offset(DisasContext *s, int regno)
-{
-    return offsetof(CPUARMState, vfp.pregs[regno]);
-}
-
-/* Return the byte size of the whole predicate register, VL / 64.  */
-static inline int pred_full_reg_size(DisasContext *s)
-{
-    return s->vl >> 3;
-}
-
-/* Round up the size of a register to a size allowed by
- * the tcg vector infrastructure.  Any operation which uses this
- * size may assume that the bits above pred_full_reg_size are zero,
- * and must leave them the same way.
- *
- * Note that this is not needed for the vector registers as they
- * are always properly sized for tcg vectors.
- */
-static int size_for_gvec(int size)
-{
-    if (size <= 8) {
-        return 8;
-    } else {
-        return QEMU_ALIGN_UP(size, 16);
-    }
-}
-
-static int pred_gvec_reg_size(DisasContext *s)
-{
-    return size_for_gvec(pred_full_reg_size(s));
-}
-
 /* Invoke an out-of-line helper on 2 Zregs. */
 static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
-- 
2.25.1


