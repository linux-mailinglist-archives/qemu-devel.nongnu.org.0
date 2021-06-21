Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251433AEFEC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:41:29 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMzH-00043y-0U
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnE-0007Ce-Jn
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn7-0007Zl-C1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id n7so20383899wri.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LY6PIKTPhDUd/P/fkt4tVIZMXUY8Ydr9J8Iah/0S6x4=;
 b=okPLTq/2sTGep6KKTb4NNk+EGasxdKw+Nkzw2ciNsLA1jDIKvq9C4Rq5jB28v5PO99
 /umCGhm3udXGRtmuWgDVRXSq9ke4zMZ66XgJQ2lIOMkboj3Zm6PkMWtxXgaO26OSt9Ba
 9gWtHQ+pM3sNlk6aUOtROf9O8YjjInF6ooiUXL7yfJiL3fQQq5oG5/zIQMn7zLKYhigQ
 YKTyEWzwDwcLTp3H8WeOU078ATP1Es5DYHt4ItFFTJhYx9IOfJ50xqKJgEJc9xPjQve3
 gWZjyUU4vti0dKHWOWaGz6v7bJtvtKFqcsrq5MsH/1lCTr1lU7GJfoF5XraAOaz7ON0t
 +7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LY6PIKTPhDUd/P/fkt4tVIZMXUY8Ydr9J8Iah/0S6x4=;
 b=mxWsGUa66QsIou/GMtvClYer1/xjCrkMEkOgemP46EVhAtzeIsPRz9VGLTMeSVnVvY
 20d+zapXbLfYjF4wCsZESa53656J0A0UeCXsSv6uN+YBcGKQDvIopomrSR9vZe7neT1m
 Y8eG+C1P88dcrFHofVPZDfvw4FUedQGErGCxcFkPdGpbuELas6ibU6obxxYgneiYFOP5
 TJKCboDscJAKoPvUys6+7AsFdJZC3VdSlj3eYePi1VyerLhPeK3xhqUEsRgEVzMds5cA
 5PQJJr2LkJ1pGkKhSlk8o+IUjFbwtorYpVyZIkKnjM2pTgXPw30UkGmIjZ7czUFCxMrw
 zYfQ==
X-Gm-Message-State: AOAM5309/1WMpuPcx16pejrih77wIHfridEHnNEvR3OtvTrjmrTt8WR7
 YUeuSivzUiqp0I6p9iDExfXAslLTNM0ig7sM
X-Google-Smtp-Source: ABdhPJx9oMWjXpbqJkr1XiDvVTP0z5SmsG7qiS9V7wtllOPZYqSLhddTWmGHBI6AyXFUlAeDDhtL5g==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr20563672wru.88.1624292929941; 
 Mon, 21 Jun 2021 09:28:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/57] target/arm: Implement MVE VNEG
Date: Mon, 21 Jun 2021 17:27:55 +0100
Message-Id: <20210621162833.32535-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the MVE VNEG insn (both integer and floating point forms).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-9-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 12 ++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 76508d5dd71..733a54d2e3c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -55,3 +55,9 @@ DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 66963dc1847..82cc0abcb82 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -80,3 +80,5 @@ VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
 
 VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
+VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
+VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2cf28f054bf..7b662f9e03a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -294,3 +294,15 @@ DO_1OP(vabsw, 4, int32_t, DO_ABS)
 /* We can do these 64 bits at a time */
 DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
 DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
+
+#define DO_NEG(N)    (-(N))
+#define DO_FNEGH(N) ((N) ^ dup_const(MO_16, 0x8000))
+#define DO_FNEGS(N) ((N) ^ dup_const(MO_32, 0x80000000))
+
+DO_1OP(vnegb, 1, int8_t, DO_NEG)
+DO_1OP(vnegh, 2, int16_t, DO_NEG)
+DO_1OP(vnegw, 4, int32_t, DO_NEG)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
+DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 90996813a85..ad2e4af2844 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -200,6 +200,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
+DO_1OP(VNEG, vneg)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -252,3 +253,17 @@ static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfnegh,
+        gen_helper_mve_vfnegs,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


