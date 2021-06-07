Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B139E57F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:31:51 +0200 (CEST)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ6M-0000AD-7g
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaz-0007nl-Bb
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaV-00082f-Ui
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso124840wmg.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NcL5xtEouw+Mk0EZO835y5LYH7TGW2TpYkGpEcSuXE=;
 b=ebQCYNA6C8ZF2Bz7qLnNmKjo0yVCj8xdKpQrRGNQpNQGxfRaZgHwBDpxtofu2BF8p2
 focuWu2DmGiyx8EKut6DJhBKf3XXFuRM6yfakGAB4zqg+3LFVE58XR0TxEPREQrNU8jJ
 hrm2waVKnyPYoX7CqOyPHr1mauX2TkExggnrR/pEQ8uuJXLO5U+ToxW6XORjOtufvj/s
 34dLY/tp/wT1p9IninydSE9oYyNEOn9FEx9RXfo0wsT/ftOXV2UgmBEgbGvGszqEbG+6
 5Ynb8ZsPHp2zag64pM9LK1JKgF7RJyT8UI2YE9Zr0F5YJyT2JprC9uf7hv2o9ZjG/Kul
 U+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NcL5xtEouw+Mk0EZO835y5LYH7TGW2TpYkGpEcSuXE=;
 b=YF5hO65Yo8clQwj7ZnOmt+YECbAbISnmPrENzMPv+jN/QF0YbzXwDmd8UUa3MTT8Q+
 c+BxlZJN9pyPcjPca/eMGqROtvEmOfVCTMIrN9PJEA8lDK0cum7spaYZE7i05bfRtSK9
 s+EpQ04p1kzDqJXMqiIWJWHlfIesnUYfMcXqs/gSBQ4qgPnI1am5WBQYtXFzHrA6fBeo
 f7IVAk92eVLVn0iLVnmyEpbV/h4fU40okGTbLN9hcsMXkcBPfwwM4gK+w8rCMENG+vtl
 3m7S02vljSC/KqQJub0fqOLiZD1r0lJlSJk8VwErvcPyyOJsL2Jku15oKVEW0WQCPdci
 Hypw==
X-Gm-Message-State: AOAM530KbndhfKHvc/o5I2ZGNqv4QKpmHzVmTwoJdKwxFXsG6lMuz+Jk
 e/m2w13oDP7C+nR90RXBnV+4n55PAanlCbLN
X-Google-Smtp-Source: ABdhPJw6O/Wvv/EsqRWWRlP6qTO0VU+QAcufKti2aMISrNyAVqepb9E1NDxid5+UgW00BiaGSB6yTw==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr100705wmi.26.1623085132209;
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/55] target/arm: Implement MVE VBRSR
Date: Mon,  7 Jun 2021 17:58:02 +0100
Message-Id: <20210607165821.9892-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  1 +
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5853bd34687..1f77a661b9b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -175,6 +175,10 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index dbcf4c24949..25426fae992 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -513,6 +513,49 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
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
+DO_2OP_SCALAR(vbrsrb, 1, uint8_t, H1, do_vbrsrb)
+DO_2OP_SCALAR(vbrsrh, 2, uint16_t, H2, do_vbrsrh)
+DO_2OP_SCALAR(vbrsrw, 4, uint32_t, H4, do_vbrsrw)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 8dfc52d8027..b7bf7d0960f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -469,6 +469,7 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


