Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D664B3AB399
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:31:23 +0200 (CEST)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrB4-0001Rf-Sq
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx0-0001ZM-Pi
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqws-0006zz-Td
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id k42so1410581wms.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qr31oFVkAzfpijMm7DI1bC1UYZm891vuJqg7rhGzRNI=;
 b=Dd3JILRMktyEHWSTvjkVP/udQzBobbxVsp6sMJSZ1LeGzUwR4rVlvtJ+6HbUclijtU
 idW3Wr7WG1qtsLIjVdo+0FMi14NCghq4GpWWxJsP/iictJP618YYbOJKfO+z2XynfPrv
 1G+1mTqe7e2c5bpDv9UTeXvZjapbReYFwLU7OZqLfRc4X1ukv3WLIo7Vp2WIlXk2akkU
 74yxnpjYG/LJLsdFSbvd85gzVi46ZAmMfNfwkUF3KtU1AExEq+khNXhHm7QjJ9FmvLiM
 TXZq2fwpBfq4d/m3p6Qu+w2M8SBd0ccmPfvYrHR9Eo5XHxAIZIgfIfkLwpYY4vpQaGOi
 VTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qr31oFVkAzfpijMm7DI1bC1UYZm891vuJqg7rhGzRNI=;
 b=g+wtkD2lG8yP9T0cJjuyXWo/KVfpnwxguSIcuM8SA/A2upF/w4Ly1i1lJ7apC4m/SG
 jTbt8yER+4mFbOqp+9WkXd0nbAvksZ2dEgVjKYM1DpgEwbLhPErH4Kts+gQUOk0noEpQ
 pVVgvMLTBrtma5x0SwIrmQFmSg8MH4rInIcR5iFQEXpS5wWpP5jCUNDZerAkSVdbtGLm
 dEAONeCTdV4e1voNR1HW4imM6JmZ8RdninvOkzDhvY0vaN/PYRAECSvSMpxE4G9F1BEj
 z8d3pWQBO2cSAcbeqTfua4PCdAKYYF797301iNbXQYqDMbbyav+w9lPmHDHoh2Aqjuvy
 rbeA==
X-Gm-Message-State: AOAM533xsFNhS83a6Qfz7fdVNT3iStUofW8b7b0uMOADu7/kS0D9v0lt
 HDefNPyu2M8WV6vYdbjAc7320g==
X-Google-Smtp-Source: ABdhPJxfPuZZpOsK4Ewm0mL2MpbaSoquygqWMNsRUGhbf2mY9JTQGFFuC77nWJZgugCwbJgmnoPIQQ==
X-Received: by 2002:a05:600c:4fca:: with SMTP id
 o10mr4736950wmq.91.1623932201387; 
 Thu, 17 Jun 2021 05:16:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 14/44] target/arm: Implement MVE VRMULH
Date: Thu, 17 Jun 2021 13:15:58 +0100
Message-Id: <20210617121628.20116-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE VRMULH insn, which performs a rounding multiply
and then returns the high half.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 22 ++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5c80b185ccc..0e496971f02 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -88,3 +88,10 @@ DEF_HELPER_FLAGS_4(mve_vmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrmulhsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ca4c27209da..4ab6c9dba90 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -85,6 +85,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 
+VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 48744f38af1..1f606e0ae70 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -397,9 +397,31 @@ static inline uint32_t do_mulh_w(int64_t n, int64_t m)
     return (n * m) >> 32;
 }
 
+static inline uint8_t do_rmulh_b(int32_t n, int32_t m)
+{
+    return (n * m + (1U << 7)) >> 8;
+}
+
+static inline uint16_t do_rmulh_h(int32_t n, int32_t m)
+{
+    return (n * m + (1U << 15)) >> 16;
+}
+
+static inline uint32_t do_rmulh_w(int64_t n, int64_t m)
+{
+    return (n * m + (1U << 31)) >> 32;
+}
+
 DO_2OP(vmulhsb, 1, int8_t, do_mulh_b)
 DO_2OP(vmulhsh, 2, int16_t, do_mulh_h)
 DO_2OP(vmulhsw, 4, int32_t, do_mulh_w)
 DO_2OP(vmulhub, 1, uint8_t, do_mulh_b)
 DO_2OP(vmulhuh, 2, uint16_t, do_mulh_h)
 DO_2OP(vmulhuw, 4, uint32_t, do_mulh_w)
+
+DO_2OP(vrmulhsb, 1, int8_t, do_rmulh_b)
+DO_2OP(vrmulhsh, 2, int16_t, do_rmulh_h)
+DO_2OP(vrmulhsw, 4, int32_t, do_rmulh_w)
+DO_2OP(vrmulhub, 1, uint8_t, do_rmulh_b)
+DO_2OP(vrmulhuh, 2, uint16_t, do_rmulh_h)
+DO_2OP(vrmulhuw, 4, uint32_t, do_rmulh_w)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index de7d8b6c753..bc66058fd38 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -349,3 +349,5 @@ DO_2OP(VSUB, vsub)
 DO_2OP(VMUL, vmul)
 DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
+DO_2OP(VRMULH_S, vrmulhs)
+DO_2OP(VRMULH_U, vrmulhu)
-- 
2.20.1


