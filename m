Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019F3AF12C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:59:35 +0200 (CEST)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNGo-0000BG-8G
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnX-0007nM-SC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnW-0007ku-0K
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id f15so4932397wro.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=biW5mt89fmFnk5G1cs3cLx6nmV4qZ+CGswY89mReOjk=;
 b=YsdihS+vN6pu1LA8h+d4OWE26Ojkd9u5mvnTFk+nz4btM6xZin3olf4xeCjLVJttLM
 hbTMqrg28oDSBXVrMcy2X52q9MxKue8vXytz2W61wYv13125dCi9+eOoQxarbEY9r44y
 ZvMQo49FgTSgaNUi1x0F/Zw/pmXWDopQ1VjPm88fanpVGQ+et5cbIOh24hU5IbrA99Nb
 y/im3AhNK5jTDdAkjYKqSl4FUjkF7JEgyzMIvQWwDaN90+S8uBzkdzCeoTpam3Hv5u6z
 PsbvrbQsp5o7H1Nr0ZSL7A0rsTIHoSxHAli9n1NxixxUTQZIHEOXxYP5s0mDVhQhrIej
 EAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=biW5mt89fmFnk5G1cs3cLx6nmV4qZ+CGswY89mReOjk=;
 b=UAycMFbvpFp0lUzMjOzKSv/sI2Dw5/3CykCqZGA0wA6tPcuvKF5Q8WSYmYKxNtrrAW
 xOlffOicUZc6tiv+4HfboZW9i9unCgLWdMXM12Gin96NCO8eoASjeX6d+BvExIBwrUYO
 NZNmA17G2zo5XGCBHzQXoAEFSlDPlg8kMuDRwvN0RG9aCeEUUT43KhS7U6bZaiGDi34X
 XdhOVRd4L96vwgMzVmVKAtvYgmvt5QKmwW/uP3RSlZbSAPuUYC9OK0jgFRC5fKv5uXF5
 +wb1H1B1JkePqfrP7xRzOXciP39GzSQgrYdzq9Ycl8h6sWbOxw/HGTpn01v/N421x7ZU
 p05Q==
X-Gm-Message-State: AOAM531PZjsbcBGw/+sLEQhK2AOTI93azwzLaqwkQQ+/xeXnWspbPJD9
 8mRrBPyqVACoKlkB18ds3fCqabDwDpjudpex
X-Google-Smtp-Source: ABdhPJxbLRd4RV7QyX2fInoPdUndsxyD3RJP+vImJICkJd1HwQ2gUnfLvxAjqKZg5PCgp148a4EJvg==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr13983997wrx.166.1624292956578; 
 Mon, 21 Jun 2021 09:29:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/57] target/arm: Implement MVE VRSHL
Date: Mon, 21 Jun 2021 17:28:22 +0100
Message-Id: <20210621162833.32535-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VRSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-36-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 56b3e8591ad..b7e2243a19a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ebf156b46b5..c30fb2c1536 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 
+VRSHL_S          111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+VRSHL_U          111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index fa440b13d31..07da231fe64 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -523,9 +523,13 @@ DO_2OP_U(vhsubu, do_vhsub_u)
 
 #define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
 #define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+#define DO_VRSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
+#define DO_VRSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
 
 DO_2OP_S(vshls, DO_VSHLS)
 DO_2OP_U(vshlu, DO_VSHLU)
+DO_2OP_S(vrshls, DO_VRSHLS)
+DO_2OP_U(vrshlu, DO_VRSHLU)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 487ac3185c6..d75cc377fee 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VSHL_S, vshls)
 DO_2OP(VSHL_U, vshlu)
+DO_2OP(VRSHL_S, vrshls)
+DO_2OP(VRSHL_U, vrshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1


