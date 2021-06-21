Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5593AF104
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:54:05 +0200 (CEST)
Received: from localhost ([::1]:50902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNBU-0005Ns-CX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnP-0007O5-EN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnE-0007by-AL
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id b3so10116925wrm.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3H2wy3z9PQ7vdsoSViUkGpo0SE05tB64Kpv7Ju5GYdg=;
 b=tWPwoZEpwuzLi5ZVSi9Vct9jj6r3yfGl6zqoIUd/quHRt2CDs7ZAbV0//n96VlTTHw
 A03FXD56t3YxGCydanEtCbb8zxgXVmqe6BQW26Q9b9SOPINn5ocAhGbBBS/jzRx/adqW
 uPQCP5Lo8uuyv+SZQuHk5Cjhur+4wlaP6AX/ktNSfqyHr6gLBA0mqPBz0MytEu9d1cl5
 Hx8RKGJQ2okc2HuM4BPkdqTHjJR3mrUvCyayydibBDNqzbq4FxTTg/osuRoKjx93wcOZ
 vCRt7WK0tvaz61XqiVfxg1T1XmMkbfpR+HqrVxlScOWb3SqEjdPLdJhndJAZ4W2J1tDS
 6vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3H2wy3z9PQ7vdsoSViUkGpo0SE05tB64Kpv7Ju5GYdg=;
 b=ms/u2yf7ACMNX7zfLiqfh6jmpP7DwgsIZ7n37cKdPCUwOgfOcgsWwUfwJc3gsW/nfN
 RBdIxo7dm4y6QwUEOMLFWxLyi4Hph3D+qz8mR8bEAhPNAHpptCGbVwnwduZg5BUDTfVZ
 Vv9t8s1oXKrjGVFTUxklNwEKEMhGxNrOfb3uQyazhiki9NlQqxXMHsShSVCILpzWuN3h
 55BTxbbDVy2gUXSC9u9bg7l8FAByYtgtC6LSXvBYvmZWZWFZEgbxeM5YViSOlw1+4XXC
 vkBAYpDSH8e5o5VOaNJ0O4nT3BNge4v4TOKXlZ0Y0nuc0D2ROqKXfyD/7OXm7wlPK/sl
 13Ng==
X-Gm-Message-State: AOAM533ygbcpWSw+foG5kiDiJy7fmoFKuyCNleomfxZicAt26+wIzJiF
 4McQVDqledn2lwGUka2W6EAiHQQlvTS80WeH
X-Google-Smtp-Source: ABdhPJxrFeYvDUI2mYZFEYCseP1NgpOspIFpQLmboF+I9Ez9MHfcMDfQ++OTMHl/gA/FzglPc2+I0A==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr29666968wrx.296.1624292938418; 
 Mon, 21 Jun 2021 09:28:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/57] target/arm: Implement MVE VRMULH
Date: Mon, 21 Jun 2021 17:28:01 +0100
Message-Id: <20210621162833.32535-26-peter.maydell@linaro.org>
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

Implement the MVE VRMULH insn, which performs a rounding multiply
and then returns the high half.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-15-peter.maydell@linaro.org
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
index f1dd688f78f..6cd47d3458c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -382,9 +382,31 @@ static inline uint32_t do_mulh_w(int64_t n, int64_t m)
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


