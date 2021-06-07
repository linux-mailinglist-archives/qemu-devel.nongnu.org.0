Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8439E515
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:16:27 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIrS-0003MU-Ex
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaa-0007Xv-66
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaG-0007yI-Aj
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l2so18465510wrw.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6Jj1IYb7LDFf56c8r659bwDvpRJPFejbh93NlcP4KI=;
 b=BzjO+Nl1u8/aYhF7ocCCNCv9EErz76xrAkSZVUp16jk/3V0P39u+h21u04+DQQdQvb
 3UQgraKKt4e0nDbRpcgjS9DvICpBS2pAHGMlI3qTQ2XPUy6rp15Qb5g0Bly9JujtyIbu
 RkQuE+FQprNRWjE0wFPKE+d8JuzlN7VZ/jNYuVPSaj1G6SK0pwqJ2a8wpI/xUIXfsmEw
 6L4AIMLboAGWXdQWT3NDOCV7LGPCvTZNjZR/XNRpfVn54/oEgyQIrHdTT5wkJTmqt1Xb
 dBj9fcUkAgyBzQyouC2oMphg4Sjkklots4jWpWcKnDfjfSgOb54ZmXLl4cPAS2iY0KRz
 nubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6Jj1IYb7LDFf56c8r659bwDvpRJPFejbh93NlcP4KI=;
 b=AmOFrzzzAhT7xDOKfLtGZo3NWg/8o7bG75aYiItXNpHUR0QEnoLdaZ1GSoFTWivGNg
 shgcTvjkNLBffjMvvlddYgqVcIn5glG6YjehGi4uWNkm5Du0aruGNnBenLGe+6Oxlcjx
 erzvNqxcGLJww88pTnznuK51L3hX/218gGmdMWUImwNoIUxJyUDGeNWhyqoIUrK5EmeD
 xMQcnzCb2FdghE/Oae3NgiueP6XZEubQEI6uEaKEgk/IG4nftBn/zAQjQ5sdRuGZjT1P
 Fb36xZbprCFwp4hTjpL7d2Nu2PPa6MJ83vFfUUqi6Nefjxo4dlL/rdprU9ZsYA9f2CMK
 KSNA==
X-Gm-Message-State: AOAM532EXGQVYjlrqnxEP/TtpYVyy2Zh84+IYOJSa/AkgcT9aHo9RqJh
 4sMeJC5vfpag8Ol9xhX1Ewf+BfMyGjM1MIdk
X-Google-Smtp-Source: ABdhPJyOtewLGNqzNNDk6i6DbTmQdHygn02zkVx3a6H9yLQLoNo7aJdIMaQuefFy7CUdgS7x8+9Qqw==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr9833901wry.327.1623085118426; 
 Mon, 07 Jun 2021 09:58:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/55] target/arm: Implement MVE VABS
Date: Mon,  7 Jun 2021 17:57:44 +0100
Message-Id: <20210607165821.9892-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Implement the MVE VABS functions (both integer and floating point).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 10 ++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f1dc52f7a50..76508d5dd71 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -49,3 +49,9 @@ DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vabsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ff8afb682fb..66963dc1847 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -77,3 +77,6 @@ VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
 
 VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
+
+VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
+VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2aacc733166..2ab05e66dfc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -268,3 +268,13 @@ DO_1OP(vrev64w, 8, uint64_t, , wswap64)
 #define DO_NOT(N) (~(N))
 
 DO_1OP(vmvn, 1, uint8_t, H1, DO_NOT)
+
+#define DO_ABS(N) ((N) < 0 ? -(N) : (N))
+#define DO_FABS(N)    (N & ((__typeof(N))-1 >> 1))
+
+DO_1OP(vabsb, 1, int8_t, H1, DO_ABS)
+DO_1OP(vabsh, 2, int16_t, H2, DO_ABS)
+DO_1OP(vabsw, 4, int32_t, H4, DO_ABS)
+
+DO_1OP(vfabsh, 2, uint16_t, H2, DO_FABS)
+DO_1OP(vfabss, 4, uint32_t, H4, DO_FABS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6e5c3df7179..badd4da2cbf 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -211,6 +211,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+DO_1OP(VABS, vabs)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -249,3 +250,17 @@ static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
     return do_1op(s, a, gen_helper_mve_vmvn);
 }
+
+static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
+{
+    MVEGenOneOpFn *fns[] = {
+        NULL,
+        gen_helper_mve_vfabsh,
+        gen_helper_mve_vfabss,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


