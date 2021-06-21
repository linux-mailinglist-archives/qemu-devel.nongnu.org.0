Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64573AF0DF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:52:05 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN9Y-00007W-T0
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnN-0007I0-8w
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnD-0007bH-7c
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id h11so2898501wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gbaG6SEFUAzY3cduAWuhNwLzLPiq8qpXMz+aVugVNec=;
 b=cuJN+PNWPWNNpI/Jvz1voejgwpPsng4mcT0zhf05/BJK6NjGHc3PZrw0wXTirxyz4v
 sEygyzYu1RcxFnxTr6GqvcUFdD6mIUK/wMqEx6Zn4Y5/4w0jiwzMAHP6o5Ov1EwcGlbH
 lPm1o+cNkWvq4QT9HHPF2z5QA11I6a1m0Ne4ehOEXZYQ/1X8nFwFlHMzvpV+PAB7uF6o
 tn2tmztWze3zrfZzkez+E5FGSooD1QrjXQDZvgFYux/ALFBKZI8sfY93yKgcSnaUUxg/
 hSbqZSU0yFBGQgsR7KX4pr/j102QDbcH0cDoBlb3swZlcnNjlpp00UuCBNUOcZzKWhqm
 0tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbaG6SEFUAzY3cduAWuhNwLzLPiq8qpXMz+aVugVNec=;
 b=LFiDgGM5ZPXjEI5rNuo8n+sk+b697LKsRv3JfQxGCohrkGBxSbsEglv0WGxteqT6fG
 D9WGuRpAhod2S4qatgZTNgJiopc6S8Lk3W64VrVavvCk9OSgfO2Re62dI6kNMxrFmYDD
 aV9Br8uDJykEW1+4wDpnBAPB65qFBmgrUW/97hG7XeGmMUab3tqDU3sDM1/GLGifjLp3
 FYBhEThI4SnIE/QtPpKEH3zlGKl6cvd4zR1s8OmLvj8nZ0p0goG8DxvF4rK7xgxgI33+
 04mjdYmro7l0W2sF4R6hU4bSbOlJh2SOHwRB+8+Dw1QNhhc7YIz35dodiLm6nsMyvbsr
 m5hA==
X-Gm-Message-State: AOAM5304jmsff0fHPXfIl/Xu80AI8JW7pCgyU+msorx4NKfLpYiVrrWY
 2xfgkswoUp6J+ui4ZCy579lUKwB6Y9Z3rK4i
X-Google-Smtp-Source: ABdhPJw6us/ljLZk7rV5SOFDKpVUKRyQgrq1Q0tYcygZoRcku3+hNP4BrUx7P51xjK89s87oiP5fAA==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr5864610wrv.58.1624292937710; 
 Mon, 21 Jun 2021 09:28:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/57] target/arm: Implement MVE VMULH
Date: Mon, 21 Jun 2021 17:28:00 +0100
Message-Id: <20210621162833.32535-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Implement the MVE VMULH insn, which performs a vector
multiply and returns the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-14-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 707b9cbd546..5c80b185ccc 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -81,3 +81,10 @@ DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulhsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index f7d1d303f17..ca4c27209da 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -82,6 +82,9 @@ VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 
+VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 23da96402eb..f1dd688f78f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -362,3 +362,29 @@ DO_2OP(veor, 8, uint64_t, DO_EOR)
 DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
+
+/*
+ * Because the computation type is at least twice as large as required,
+ * these work for both signed and unsigned source types.
+ */
+static inline uint8_t do_mulh_b(int32_t n, int32_t m)
+{
+    return (n * m) >> 8;
+}
+
+static inline uint16_t do_mulh_h(int32_t n, int32_t m)
+{
+    return (n * m) >> 16;
+}
+
+static inline uint32_t do_mulh_w(int64_t n, int64_t m)
+{
+    return (n * m) >> 32;
+}
+
+DO_2OP(vmulhsb, 1, int8_t, do_mulh_b)
+DO_2OP(vmulhsh, 2, int16_t, do_mulh_h)
+DO_2OP(vmulhsw, 4, int32_t, do_mulh_w)
+DO_2OP(vmulhub, 1, uint8_t, do_mulh_b)
+DO_2OP(vmulhuh, 2, uint16_t, do_mulh_h)
+DO_2OP(vmulhuw, 4, uint32_t, do_mulh_w)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5d3dee46995..de7d8b6c753 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -347,3 +347,5 @@ DO_LOGIC(VEOR, gen_helper_mve_veor)
 DO_2OP(VADD, vadd)
 DO_2OP(VSUB, vsub)
 DO_2OP(VMUL, vmul)
+DO_2OP(VMULH_S, vmulhs)
+DO_2OP(VMULH_U, vmulhu)
-- 
2.20.1


