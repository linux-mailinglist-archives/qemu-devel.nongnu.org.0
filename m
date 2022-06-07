Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA1541A1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:30:57 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygmu-0006Xk-C9
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwb-0006O1-UG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwU-0008DH-5b
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21938892pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=QLDWXpE8up/O5B4CSnNCMsB3GaGriyBjzSU1f6JAX9+dwTlN0N4NRfotk3OZhZYM4I
 WY1dECOkMy0TgaiCagsKQ6aJoF8mqlm+nfe+pfpJV1/yxcRKu1VJEtdA3YgReXesMbzL
 Wd0thSlToEiJWbVJOwboxqiDL4gwvZiCXZ0DIQUKR7YhJ3Ub3NxjVVZ/alf50rgRx2dK
 Y62lc9DZtkxGaHl8x6i5hMfnGwvBGQyjQIyLsHkUHEvhBnAIY+zZTDVtPgJQhvcwRmSd
 8cV/O4tvceXzA2dnc7UDPvJynsBJ3hvunqM1gQwXWA1aI5Mr2R/Q71xM7zaEMiv44RhJ
 PMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=EP+FsVEJ9nNNiTcKGHa0gAPQuIRyv7FjzlJsh9ib7Lm7e+PJ37rPVlOwcFRkEATUFS
 2Uy/b4Rb7UP7sYEuSc+kNcZrvK3AiPPTTLMh4/dZtTPW5ttmSmKj7T5bHYTTgCU581wQ
 rSRU4i6Wjoxv+bBDjUR8CELPUKFrFQxtnudJjJQlRGx/7afZSgIp8H3H5Q+6qLl/CEdH
 xj8FcaOsB++sauZz7t5v+a3FoqNQjPC2AvCeYdkvKOMFZ4c65SeHJq5dJkdOEJ3S0LN/
 GzbP3/DOLzfz800VJYHEp7hapB7w9oNhunfSlCBiMMYmYjydewBezUxcXkKAX9x9ZWSW
 Jaow==
X-Gm-Message-State: AOAM533pey4FILRpv8kv3DLJAmHOvKt+WaiKj+IzVzxo6SbNUZCCXTqA
 kQ0MQJJ90QYtbOkWZN/rHn8DPXOR5H7OiQ==
X-Google-Smtp-Source: ABdhPJyozaHS2c5RVDkClduirJi6YzlQ2vXBcvYqiWdsY8d4Lg2JhOrqJBXHQ1RvgSzvsZFuTVZGyA==
X-Received: by 2002:a17:90b:1d0a:b0:1e8:7f14:8db with SMTP id
 on10-20020a17090b1d0a00b001e87f1408dbmr13665038pjb.218.1654634204738; 
 Tue, 07 Jun 2022 13:36:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
Date: Tue,  7 Jun 2022 13:32:35 -0700
Message-Id: <20220607203306.657998-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

We will need these functions in translate-sme.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dbc917ee65..f0970c6b8c 100644
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
index 67761bf2cc..62b5f3040c 100644
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
2.34.1


