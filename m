Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7C3A6A64
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:31:59 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoZC-0006UV-BT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEe-0001KB-MP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoES-0000Ng-Ar
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so14922947wrq.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HUbCaFlBtK1Xe4km8xr7tJiBf/M1y8WD45LRVsZA+U=;
 b=W2PvL3Uw7T0BLks3QfVZmKxDkt6cpfqW4GV8BnQHpwvQxc4McGkoXaFesNwrrp0w2q
 kjEDqRuNml6SU/CBm713LZWr20Cq+CzL4YFzTaTSUWlV85jc/ppJSyV7sQCP0V59u0cJ
 gBRuKV/s0/m8S022SBvPf3BdGPnon+YceyYSg9WLjsFAyveD56kFcMZqyKGQWZgWUEDQ
 9yth8T65Ixrc55Ge0448SMrmCJCGH7NaXsff1M5B830AfCUIHd0W/ZSZL3ZESLECR9V5
 ehQp8lVsW6qDyh6mGU6D3gmf+7h/OFl/5OFQEjgcl2FOnUjUudubyrB57gMhlJiQ5Tg/
 Hslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HUbCaFlBtK1Xe4km8xr7tJiBf/M1y8WD45LRVsZA+U=;
 b=hpFBfJq+XyuXKmv/5lxUSdI2aHQkmAp5nasGQVHftpV6AGNR1WcW+XIE4jxUAfz/QB
 hMTsUiFk5zlNvSNjRNpZERATAjoDarRS+fGY34FgJe8pof9QGKdgWO0vkAXnAZrTO+WM
 LNzuEmINUmYTpVjBMK0hMRsHpzuXgoiUz66krL/7+gs8u/ys50l2xftAAEr0w8uJOaFz
 so78Pj+/uEuWosl1Sjmbmnr6006+C34V3azSzrfAPOnd6EDG2FYvwoa5Ajst9d5hliKo
 LY0DPeHR7wXt29CsaIlMPMZppM2xdBuQCksjJ7EFc6slPA4pZ+PkbpzGS5VkiV0gup0s
 Zb0g==
X-Gm-Message-State: AOAM533+Tb7ujJdxmrttmuMVnqcFVjds3e6jRv7n5/dmoEYfzr5h55lr
 ux8RHe8GmADzA+InaY2+Qp69Ow==
X-Google-Smtp-Source: ABdhPJxsC0brp5bX+mj6VuIPWJXpi5zSpBcRllHpNLbnev3BcOYeXXv19hk1O9F4l5ZpBeamCFC4YA==
X-Received: by 2002:a5d:50ca:: with SMTP id f10mr18936904wrt.411.1623683431018; 
 Mon, 14 Jun 2021 08:10:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 25/57] target/arm: Implement MVE VMULH
Date: Mon, 14 Jun 2021 16:09:35 +0100
Message-Id: <20210614151007.4545-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Implement the MVE VMULH insn, which performs a vector
multiply and returns the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 4dc4aaa5932..687a5cd85c7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -377,3 +377,29 @@ DO_2OP(veor, 8, uint64_t, DO_EOR)
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
index e51650625c5..1c7ef8e1110 100644
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


