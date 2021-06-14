Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4AC3A6A02
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:24:36 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoS3-0003H8-Oy
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEf-0001O4-EL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoET-0000Oo-BD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a20so14980940wrc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDQdMwYf4x+FShWaH5v3XZqRaKKU8isZrmIii0GjC2A=;
 b=V53Niykbm6LUXddYufkXRJ9U5iL94rVlwuNfI3421nUolM40kQPB+NKNfVs0M6d59z
 oyYwKEWeYFFH75m3KpTdWN6PzXAYNve3MNoPi9yD60ow+Zm+FbNz9epFGcqtn7HLee1+
 6EGpoJQmcHIAQHj0DnQsMwboPblC+9WTAZloZogOWB0bZXbeBVgnp0fTWtNhGVsc9ey2
 Bcsx0YQp6j8joASIm1v6A5Nj/xSGC0sttDJbmhhbDf6eVgOdqAlsanHW2AsFauxYhW9f
 wax7K5Dz2RgoHl88AxalseTMnnwLxwAqbrLSzYvLEYbbU7Mzop2zIpAfPbYV2TWQf1u4
 DEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDQdMwYf4x+FShWaH5v3XZqRaKKU8isZrmIii0GjC2A=;
 b=Pk1IyptZcE+PSO9kSjGTkDBjueicD+LhF91w90PU7DnoE+cu1vG2doyBa85SjlJdTo
 n2Fnx95uyE244DHVcX53bAB3nQObkPAe1yqTDGbXjZ/anmy508HWkcp5ik78ek4IQyMy
 Pt0afqDUiBSKl2tziNrkKX5tGgBhiLg8kZqVtjPELhhsUHKjTQqE+huxXGm5W4Y21DBe
 2p4N+8n2Z4R+jTw2QAeQ4TNBk77KUCjM4NhbuhZLyFKt95bEe0BwFee5WYDUGiX3AtVX
 111kTAEf0XSXHuRI2kmzWFTbx56JJG0/544XaZmG7b24mY4X/eSraCOIDcsDhyuptToZ
 GUYw==
X-Gm-Message-State: AOAM5320PvzF+9Wb1xjCv1KhQxGZxZQkMZqATx3sk8zy7EPz7n99BY2p
 BPedakEK3VtVeg8ANW3+Vwem6Q==
X-Google-Smtp-Source: ABdhPJyOhBcJ37DrknQzZ/sX8DHpvevicCVUvQIbUodIFagEV5YNW1d/Wo57riPY3yrGZAf53C1z1g==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19309382wrt.418.1623683431810; 
 Mon, 14 Jun 2021 08:10:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 26/57] target/arm: Implement MVE VRMULH
Date: Mon, 14 Jun 2021 16:09:36 +0100
Message-Id: <20210614151007.4545-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
index 687a5cd85c7..9ff39f0fa18 100644
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
index 1c7ef8e1110..b6ca03a0f60 100644
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


