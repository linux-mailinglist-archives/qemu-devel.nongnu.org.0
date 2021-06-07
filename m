Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D739E509
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:14:01 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIp6-0005zb-B2
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaY-0007Vp-3b
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaE-0007ww-6G
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id z8so18395247wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Rsk/f9XH2z8c09SGzGh+1Fe4wrjJ7bWOiZfaWKb1t0=;
 b=Lnw5acNAA77FaJwe5vk//7apexfmOLXlGLi7qnQCczuNAqzR/HIjVtldo9oNJ3UZEM
 USDx/2FCkPZp2all0U4IGLLVlu4NaOpemLTINk9tjR14OyRzauVNgJbSgIveSGFbRBEl
 ZAxnvdqm+ugV97Kx+Um65h4Bc7Psu3bVVyw18Me+Fzet4i8AaPiken6+7yb+kynx2rvP
 Zbgb1Z5728xVMIPsrML/UFQgC2iSlmtJ8qNGUTxPdDD7pbb7Utw0wSHRMF6vzxVsTp8v
 p9+X/WmwPu/J40CgpvIMAhamlKOua7BXCyK6SSKpYVWoJgi5IGzw5i2CFFL2zhMsmZqC
 vUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Rsk/f9XH2z8c09SGzGh+1Fe4wrjJ7bWOiZfaWKb1t0=;
 b=RWj9SoJ3q6eStdy+VY3HOvzrc0P/AfGnuV1C2s+Z6EtVLvHItK/5ntrwsig/d/uOG0
 BL9sTG/nptFeCEHQyhyjfK/xp0iB4B+F3nqYv6ONidYD4oSgY6qdBIyH2j0Ya6gHE/fp
 NzjmeE5GN10g1ltVenIRAK6CZmR/D3FQK5NHVa1W5+RV0weIAG0e3fJuYaLzQ8DYmCpD
 wZQwqL1IJq5bo2Rqozzznvy5exBfbGn+U98V4ciGUp4Qvm5U4FZfLJCbM466wFTixPCi
 zml6VJFo1epmq8P7msFdO78pu33o9DRSxsIwHP5/AXbxOE3iJ4yoJBe4Ai8J8Wn/gu0/
 MI3w==
X-Gm-Message-State: AOAM530ZCjN5n23GHzDmTEPF+vsrn8YhXa7gmS1pish3KfMY3qnmuXn+
 7W5iULkJb4LGnahbFh3fVV4+6Q==
X-Google-Smtp-Source: ABdhPJwkUBeFcBkdzZKbeq2ZLN5lGEHyiFhDNQCuWd4fq0iaPhUZxnnLfXAk92a61eCDn9ayes9cmw==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr11450912wrs.34.1623085116923; 
 Mon, 07 Jun 2021 09:58:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/55] target/arm: Implement MVE VREV16, VREV32, VREV64
Date: Mon,  7 Jun 2021 17:57:42 +0100
Message-Id: <20210607165821.9892-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    | 13 +++++++++++++
 target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

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
index 071c9070593..055606b905f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -223,6 +223,12 @@ static uint32_t mask_to_bytemask4(uint16_t mask)
     return masks[mask & 0xf];
 }
 
+static uint64_t mask_to_bytemask8(uint16_t mask)
+{
+    return mask_to_bytemask4(mask) |
+        ((uint64_t)mask_to_bytemask4(mask >> 4) << 32);
+}
+
 #define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
@@ -251,3 +257,10 @@ DO_1OP(vclsw, 4, int32_t, H4, clrsb32)
 DO_1OP(vclzb, 1, uint8_t, H1, DO_CLZ_B)
 DO_1OP(vclzh, 2, uint16_t, H2, DO_CLZ_H)
 DO_1OP(vclzw, 4, uint32_t, H4, clz32)
+
+DO_1OP(vrev16b, 2, uint16_t, H2, bswap16)
+DO_1OP(vrev32b, 4, uint32_t, H4, bswap32)
+DO_1OP(vrev32h, 4, uint32_t, H4, hswap32)
+DO_1OP(vrev64b, 8, uint64_t, , bswap64)
+DO_1OP(vrev64h, 8, uint64_t, , hswap64)
+DO_1OP(vrev64w, 8, uint64_t, , wswap64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 3c6897548a2..6f3d4796072 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -211,3 +211,36 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+
+static bool trans_VREV16(DisasContext *s, arg_1op *a)
+{
+    MVEGenOneOpFn *fns[] = {
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
+    MVEGenOneOpFn *fns[] = {
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
+    MVEGenOneOpFn *fns[] = {
+        gen_helper_mve_vrev64b,
+        gen_helper_mve_vrev64h,
+        gen_helper_mve_vrev64w,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


