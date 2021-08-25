Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBF3F73D3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:57:04 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqaY-0003Ft-4f
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGI-00040y-NX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGG-0005Vt-KU
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f10so14671535wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NJusvALsxx1wfuPxnrHFhdTt2/bgniw0YypUZm+dSAo=;
 b=Pw1AJWwYGUNji5T9gB9E8YQyfZyTvckcd4SVR4xw7E5xwGiUDh4IaosrpeP+htU2TQ
 V5bFemN1NJ73jsL45Qk4HSEPw6SPY70VGpyF+VpJnllC/24QBcywjNqJcO9//HjLz7Jm
 K4/BbNdXFAwZ4ZfwzKi3JWW/2jJQtAu5/+CaySC1fJq2f9gsLvX57D+08igyPQfJUl0W
 YAc0zEiR+H5EXY58miKQdngFN8ntiMc2ZOs6iXT4vAqFBga0fzshwtRq4jUNsVt2gz/b
 YTousboD29g8lEGaxtOZBIcSoLRtHw8wua/KjUctwEG80fQgt6aUCwMmGrWJE7OnLoxY
 2SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJusvALsxx1wfuPxnrHFhdTt2/bgniw0YypUZm+dSAo=;
 b=kN3VnVOiQb8SFZwJD+Pb9ZXgFCz2OOZTqECBu2x4rBpSqRU7TgAH2aq5KpOQbR1p62
 ET1y9O3TsupPeVg9PoM0glZwgPhonm9ADvBQLq3m9C4aBC6FH5AtrIRoH5jngW1AW9km
 zHhm+b2auDTSEuDfXgvHptURcH4eeIlXgloEg48xVtqjgBwvGtPI/GpOik75W7dMOtdx
 pvf2vbams7SMeG5tY1acfSkT5HzRtj2A4sH9c3SsMUcqIgI19wH0bsRHprOIbz/lV0jC
 6dNfaA0nOWM+7RzXO6yvcToIcjJ02aaI6g0kjhjjEfVEn+yVKAQkzB4p8Aagje5Oy6zL
 mJ6g==
X-Gm-Message-State: AOAM533gK8id50I5yZa8OS123FBIi6q/iSAcNP7hmbez9m4JB5fmqGjJ
 U1j2ubbGO5jM8sZk6P+SqbfzZxzSk2arSw==
X-Google-Smtp-Source: ABdhPJwKpRKTXgngdhNVx9N+UYMzsme4/OAkhAMS/FR5/UsfiWmgYoMYeF0QdqOvvC7evsUvKObjLA==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr8369424wmj.26.1629887759392;
 Wed, 25 Aug 2021 03:35:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/44] target/arm: Implement MVE VMLA
Date: Wed, 25 Aug 2021 11:35:16 +0100
Message-Id: <20210825103534.6936-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMLA insn, which multiplies a vector by a scalar
and accumulates into another vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 11 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34d644a519c..328e31e2665 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -367,6 +367,10 @@ DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i3
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vmlab, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlah, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlaw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlasb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlash, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlasw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cec5a51b0ee..cd9c806a11c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -413,6 +413,7 @@ VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
 # The U bit (28) is don't-care because it does not affect the result
+VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
 VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 
 # Vector add across vector
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ea206c932bc..8004b9bb728 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1008,6 +1008,11 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/* Vector by scalar plus vector */
+#define DO_VMLA(D, N, M) ((N) * (M) + (D))
+
+DO_2OP_ACC_SCALAR_U(vmla, DO_VMLA)
+
 /* Vector by vector plus scalar */
 #define DO_VMLAS(D, N, M) ((N) * (D) + (M))
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 92ed1be83e7..f8899af352d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -620,6 +620,7 @@ DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
+DO_2OP_SCALAR(VMLA, vmla)
 DO_2OP_SCALAR(VMLAS, vmlas)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
-- 
2.20.1


