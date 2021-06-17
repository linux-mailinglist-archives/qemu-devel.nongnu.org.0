Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915EF3AB3E5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:44:09 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrNQ-0005W8-LS
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxB-0001pm-Bc
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx1-00077T-5K
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id e22so2945787wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nYhXujxppzpBGuf1CJhMM4AlGMDWYfAv/bvkmoVRZmE=;
 b=yCOSkUtbWW6ypTb5VzLf+3cCHJYqWgJHZg3i8QSxJX/EMQxp02nDHVQoHYx//cydTX
 NJuDvGKXqU8RRmuoFhSKuHtD5KV3SMGb5+rDfnE/6Gbf3rWSulxNCMschA+bNAUbYo+B
 sDs/oKIyUyFqTr/NLdLTaBIjIwwsFsnvjvTQssdrmbsFvKcZVk6ygwdOw3YIaMxdUpoX
 /x6zEC8tU2QPfz3ivWt2UkTZVyMCukimmmg8jW59293DqgTiC1eKyZiNbWS5OaWxPag6
 zHMH2vVtUBaa7TTI47/glR2uWmwsvwZ82F0+A4BUN2cuWpUlmtZQ2qx3RGEUefgfg10T
 zrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nYhXujxppzpBGuf1CJhMM4AlGMDWYfAv/bvkmoVRZmE=;
 b=tuabLFBmsFM1WvCpb5RR/liIaMCSW67hW3b/3U+Z6mo6BdPQ/6zILLAHDe7pbpPp7I
 DqyMvGbeTcXLcxY82xHPjUWuMV8vsuz8aWpfcJcy/XUmBYNytAPhaXyPm6AO1zr5ODdP
 0i5vGlpgAcqJznh98WElcI2bxS1wymtrxc2xMexJWWG0LO4tyUWSxbfCKqXQMr8f6JuD
 +J2f4zUNHQMENuTpOJ7IVFBT0FKkrlwhoAJeX1oPUXKuS1zaUi87n3hC13LZuVIcG7N+
 XrKkcxyIXcQgBsWYiX8SCiye1lyJKwM/LOFxi+mFAY70XKTSDvQDL0F7Wn3kUc1augms
 Kbvg==
X-Gm-Message-State: AOAM533YG80dCyc6tHJ8PykvtR7y8pyoSedptsICQtyBXoNJWZj5AxJb
 rIFVETDFyYwVlsAxHQX9roRm9Vqw8IkTfQ==
X-Google-Smtp-Source: ABdhPJycXskTTcOPVe3bP+To/LkkmrU6IZFES2WIYC66eB/pYXMZUtX7OXYGaYUN/+0uuGlkvcnNoQ==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr5301855wrr.358.1623932209861; 
 Thu, 17 Jun 2021 05:16:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 25/44] target/arm: Implement MVE VBRSR
Date: Thu, 17 Jun 2021 13:16:09 +0100
Message-Id: <20210617121628.20116-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Implement the MVE VBRSR insn, which reverses a specified
number of bits in each element, setting the rest to zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  1 +
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 52086d769f4..1b807e1cf5f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -173,6 +173,10 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5c332b04a7c..a3dbdb72a5c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -167,3 +167,4 @@ VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0ea1605182b..775c667561e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -538,6 +538,49 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit8(n);
+    if (m < 8) {
+        n >>= 8 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrh(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit16(n);
+    if (m < 16) {
+        n >>= 16 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrw(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit32(n);
+    if (m < 32) {
+        n >>= 32 - m;
+    }
+    return n;
+}
+
+DO_2OP_SCALAR(vbrsrb, 1, uint8_t, do_vbrsrb)
+DO_2OP_SCALAR(vbrsrh, 2, uint16_t, do_vbrsrh)
+DO_2OP_SCALAR(vbrsrw, 4, uint32_t, do_vbrsrw)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4b379bfe6e4..6320064a08d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -433,6 +433,7 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


