Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58D3A69F7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:21:47 +0200 (CEST)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoPK-0005W3-UP
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEX-0000uP-Ck
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000J3-U3
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o3so14938585wri.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ht6bZI6g+YtoroWTcA9j2Ld3b1L7exq5QAimmFaqC7U=;
 b=j2ehC67LLbqLLcBrgpPc7CUq+Abxlm5ZPZTKR40YdkBJEnVI9tdkr0jsEBooc2WeON
 kisOin29EiyU2dU2JD62SxYAiY9mujp49NR3D+OHQeBCJSrY+QZ0ChXmj4nTGCzGu3KB
 rsmiZ6mvFKKMCwQGOU3VK1Pb3MH2WZTqyTXrU3hhpd65WlWJne10GEaFCZaQrKCzQQ/u
 7ckf9aw8GrUMZ3DPAA/dPFEB0ZaxB28WwoRSGRRjrditRqhtQEC06D1aeq0bHFl+jw5U
 I46/Z2SHF4eYl0SwrHZ+0nZ+NXzoFQmHk2uniMzK9F8u4NAvOn4DMWLCvSivgnFKRboK
 o52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ht6bZI6g+YtoroWTcA9j2Ld3b1L7exq5QAimmFaqC7U=;
 b=mIIN1N49LnvM/94ddBdkfwBuUSo7ZbWIJq8bBIrnBY051YSOv0KUIK69e+OVPEi9xX
 5cxcj2vYs1x+vn+/Z48u8/dJBgj28Rz0niWjiKmYwn0+rovK7iAqdkRj7yh2BAgSGhyb
 lrOr2QCKbp1TTeTzZMsWG2rL+K2ByMd3H+aBxP+n77J0dVeCRvbFr+oW/efjg4aITsqL
 99E/6om5o7TIz+a/Uc8udL4jJStdtR+dWtkRXFLAeGOt4H7QN1O+jI+etaoYE23kyYwA
 N+/hUozyGeD/G2zpuXBrsfJdYbLK+9tm+/eL1EbfKrDnkp41T1JAonEJzlubF8rBDjYW
 MfnA==
X-Gm-Message-State: AOAM5308n8FcgIgo94n4KdpNzS1w2zM8mF5IsDaJP6P4e6ckQPUdYJY/
 e2zePIkb4DH0fLWK9jPCaqSqXw==
X-Google-Smtp-Source: ABdhPJwF8Zw5PA0UrlnpN0uEMYwXn0+N0uWP3nWOGSUO2A/kqd9ulP8kyxcRtWaFonDFyacymdeldg==
X-Received: by 2002:adf:e404:: with SMTP id g4mr19270126wrm.414.1623683425265; 
 Mon, 14 Jun 2021 08:10:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/57] target/arm: Implement MVE VREV16, VREV32, VREV64
Date: Mon, 14 Jun 2021 16:09:27 +0100
Message-Id: <20210614151007.4545-18-peter.maydell@linaro.org>
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

Implement the MVE instructions VREV16, VREV32 and VREV64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  7 +++++++
 target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index bdd6675ea14..4c89387587d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -40,3 +40,10 @@ DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vrev16b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index adceef91597..16ee511a5cb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -70,3 +70,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
+
+VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
+VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
+VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1590b3ac83c..50af6aadec6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -285,3 +285,10 @@ DO_1OP(vclsw, 4, int32_t, clrsb32)
 DO_1OP(vclzb, 1, uint8_t, DO_CLZ_B)
 DO_1OP(vclzh, 2, uint16_t, DO_CLZ_H)
 DO_1OP(vclzw, 4, uint32_t, clz32)
+
+DO_1OP(vrev16b, 2, uint16_t, bswap16)
+DO_1OP(vrev32b, 4, uint32_t, bswap32)
+DO_1OP(vrev32h, 4, uint32_t, hswap32)
+DO_1OP(vrev64b, 8, uint64_t, bswap64)
+DO_1OP(vrev64h, 8, uint64_t, hswap64)
+DO_1OP(vrev64w, 8, uint64_t, wswap64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4e5d032242b..32a8324c5e6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,3 +199,36 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+
+static bool trans_VREV16(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev16b,
+        NULL,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV32(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev32b,
+        gen_helper_mve_vrev32h,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV64(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev64b,
+        gen_helper_mve_vrev64h,
+        gen_helper_mve_vrev64w,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


