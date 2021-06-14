Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769043A6A99
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:37:59 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsof0-0005sF-IT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEs-0001yf-H7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEc-0000Vv-J9
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso187173wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLzA7XVZjhEUM4ZQnuRm6LKjQQExjGMIe61Trui2+5A=;
 b=JTU8Dt2HZbswHq8hZOpG1LqDEWtO3uqKPvHABncHW8FOsShiuaAerh44+CI0aylnLu
 tNwEMn9RzFXwB1wB+UT1AaNBXHR8st0GqSGq7ecY8A4LwZvfLO1Sqzp7X61/ZhS6WdK+
 +qB/yZjTsVi+QmpoE300k9jdqt/1UF5JzKnVOR8juVlztd9KF7gumZFLouVr7qzdpdXP
 owI4XLDgYlp0W8uolS+w9AH9qLMQORoJASwIwoD1mqT4Odnd4mv6oaELy669du+kYkXi
 k89WmX/fGv8ZZgXgYJtLqzOzenbUM9f2RERRtUdDt6pBXCd8ptRZ9FaJSoB9zYqGJ1Sf
 c9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLzA7XVZjhEUM4ZQnuRm6LKjQQExjGMIe61Trui2+5A=;
 b=odWgKBk+rekRaMiirOvb6i/dhmNLUNpDgQJtsHK3JxAzIrjrG6xAiU12IJ20HDbcD/
 d9I6bE0DVCU9r1ILXhkj5asnfOg2ZQcK3+/0JlFqIQ83VXMobgQ7SKyw4jfLsfySn+Cv
 bZZCrLgL8Q+35GrmXnjsWpWJkGeUTnrycPAD+/b3u2cVTKrzFxZOZiK4qTzs+FtjvozA
 Lvd2nMzKGs0MbEMe6O8CnFscenLceD75Zi6Udj/ps1U2pK8uHJD0Jv+rehzJDcctlhWj
 cEHSH7bd/sgaoc8A00V6ELl23r942ZV8Y3XoGVlFN3OTnPC5KFfzGkUx54qjbEvXxUwG
 S9HA==
X-Gm-Message-State: AOAM533yhj1CP7NPPGMt4kmEpUactY+m0zRefj3vqyzMmGP+oixiIRCz
 nrymwOouba1L7IKyuVbNfhz8JFVuIgAbBg==
X-Google-Smtp-Source: ABdhPJxsQA3SDOgy291rKJAC5U7yG6CZMrKRBMJmD6S59OoY25labRqJdUW1rweSvM6NXZTMS4aGsQ==
X-Received: by 2002:a1c:9807:: with SMTP id a7mr32732126wme.10.1623683441282; 
 Mon, 14 Jun 2021 08:10:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 38/57] target/arm: Implement MVE VBRSR
Date: Mon, 14 Jun 2021 16:09:48 +0100
Message-Id: <20210614151007.4545-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
index 8e33079fd66..6ba1187cec0 100644
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
index 7ff4b452def..95e7c87be7f 100644
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


