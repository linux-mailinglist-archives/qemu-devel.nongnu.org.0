Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4B3AB40A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:51:13 +0200 (CEST)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrUG-0004mx-G0
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxO-0002bE-WF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxC-0007I4-DF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id y7so6505873wrh.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RYIo5K368DSlxpyx3pNvK6Qv+epOoH2/vrkH96H++E=;
 b=kOZ06FnfcGaYIcZ5h3AQ/vsEfwf3Wn+7nmNs1BWfYc7GIbI69+ioNGE+uEa5OqwENT
 ImfCmGtBIZLU56WNTTBuyVl75AFLkYX3ol0ZFmhM9cYoH8TDsAtPUBQFG7ntf5xNxqAs
 xEpH3rS9iVcLEJjp3ZkdM4ERta86ybFATKnvdXq9+xu8Q2kkC6QJzQQ1MCE93cGaRvp4
 oAN1ps1VV1pMiJhu7bYRXsEwWKJxqZbgdDdmebPcL8EGYC7UClr1SXEeuqumBar7mcJx
 T801z4OjkjIY/2TzoFK7ZZVELlLeac0SjZPnqIrTVfEQPARqu477+yGyBGFI2J3J3klJ
 sUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RYIo5K368DSlxpyx3pNvK6Qv+epOoH2/vrkH96H++E=;
 b=t6inbxYcVjq3XJIP0P+YglwfQaLHCq7U+1Bq7Ldr+Uu9k0L9MaDed0m5tuMXupk0el
 4eOLO3hwRxMmwHLjKzBTLyvRuuDorbIjQTb4QVWtZvtvWNQFr3ut2+HUh01Blk/869wG
 N8Y2Udk4BOP3+P/BjOy7YMLHzronuHjxp0lqTQy9atyLrdo3dCsD+FhINK6Pn7PeDtFG
 2WDqvTr5DdydGA2cpm4Bp+/7mxskmsZxclxU69JFY92Z23qGXSskZ4DyQVhLDQR3LhrL
 mZSnx7FpZblIB2kig0yKXCVryjrq1OIRETuliN5iuyFoma3UMuquM4kHfLCzjhamwpsv
 kS9g==
X-Gm-Message-State: AOAM5317wvhrkYHIhrq2FjYMzgoyM3rOxO5O9qmYhp2K5j2Ki3bAzJCg
 o3INVdw90C7OniidNOD9VNxJZQ==
X-Google-Smtp-Source: ABdhPJwWX6jV/Uxf//15n+7ak5LoY1tFQinoIj02GnKqDIOX6kxs8o+2tnjJiobvGLdR/Ru8ruc+mA==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr5306051wrd.405.1623932221159; 
 Thu, 17 Jun 2021 05:17:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:17:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 39/44] target/arm: Implement MVE VRHADD
Date: Thu, 17 Jun 2021 13:16:23 +0100
Message-Id: <20210617121628.20116-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34a46ed38ee..2f0cf99359a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -238,6 +238,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2a7e75a3a..6b969902df0 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -157,6 +157,9 @@ VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 
+VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 11eb99894bc..66002f4ca4a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -546,6 +546,12 @@ DO_2OP_U(vshlu, DO_VSHLU)
 DO_2OP_S(vrshls, DO_VRSHLS)
 DO_2OP_U(vrshlu, DO_VRSHLU)
 
+#define DO_RHADD_S(N, M) (((int64_t)(N) + (M) + 1) >> 1)
+#define DO_RHADD_U(N, M) (((uint64_t)(N) + (M) + 1) >> 1)
+
+DO_2OP_S(vrhadds, DO_RHADD_S)
+DO_2OP_U(vrhaddu, DO_RHADD_U)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 05789a19812..febf644079c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -418,6 +418,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


