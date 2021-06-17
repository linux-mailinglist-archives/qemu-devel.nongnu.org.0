Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D226E3AB388
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:26:48 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltr6d-0002ws-Ru
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwp-00012s-CL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwm-0006w1-0z
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso6232778wmi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MsKcYIWTozxme+e9eFcnhE6g0TcAu7b2IiyOTlBvd0U=;
 b=XB5Z5AeW9jC/NGOVEfA9YH3QzrutqceMFDlfluv3CRugBMaTuZGDFlcVKVdZdJWsgE
 cPEE2dcZw7d1EMJE/q5+E5LjG2a32iKXwnG5M0YRduTvwkmnuso3rN6cMISBQ07UrHe2
 d4M0l38cPrHTfvVA9SdGksYxhdIrhIITCPh/EYk+uPqETJk7jYIFPfb1iJecuQnTIy/r
 1dLOa/RR3GI9CyQ5Hk+cpq5Xe8ZixbYqZWUEaNYSIIYNMtyE7msSYu9UZ218Vk292yHd
 pDW2HabrqHMhgi8U3PjmUSuGh2kdmAgnayABJIxevui5f/WXUmJRogx3fREauyOjjtgG
 aFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MsKcYIWTozxme+e9eFcnhE6g0TcAu7b2IiyOTlBvd0U=;
 b=lHJRiZNclLoPlTXJ9X0bhE1OUPrrZpehO/AKWgnHeXWTxri3FAWroKL+6LE2Qypcb5
 fF2yfguq3YgUj1wKxgLJLkBIJi5kHHhPDTAtcHilN3L9ITPhYXVs5yW/923sQVcnb0yA
 F6QTbHbB9z0OpfdvAARrNPN5bHMA7Ppdp5diMfIufsJkaZT4HlUiI6KFJU5y4xNqIAId
 iRPtW4vt4HuksKx5jbtbw81o/+MkeX1k1Kk/grB4KE2WBpXfyu7LSWOi4xiOl54jL4J2
 HfJzp795lV3pe4b4g8kgVUGtDVnryBHtJsfW8n5xNgOIHnRJ0U+5anIsdnoqasQTV3dO
 ZUmw==
X-Gm-Message-State: AOAM530cj9KUdpBxpbODO9v4GFOzCAIi/DmBqH+VDemF+7haV+mNnzXr
 bnPo2vFu1G92xHyrsZJW97IgnCSgVVmb4g==
X-Google-Smtp-Source: ABdhPJwjRUppUKNWA2JHITCvRBw8h7LXSEXvnbq3SOcpZB4i8XfPK3BbltNB+hBZcjuBDWe7JgqzLA==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr4827065wml.68.1623932194584; 
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 05/44] target/arm: Implement MVE VREV16, VREV32, VREV64
Date: Thu, 17 Jun 2021 13:15:49 +0100
Message-Id: <20210617121628.20116-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Implement the MVE instructions VREV16, VREV32 and VREV64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index e90f5fb5d67..e0bb4755748 100644
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


