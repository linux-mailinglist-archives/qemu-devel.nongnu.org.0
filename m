Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978F2B4B0C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:29:11 +0100 (CET)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehNO-0002rI-GI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3f-00005r-KR
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:47 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3d-0007rd-3F
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:47 -0500
Received: by mail-wm1-x344.google.com with SMTP id a65so24119449wme.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oWhq3GtfKWqTzUPWOIICtNkc0+RZpcNcf71L6lZS9uI=;
 b=COfaHfnl8XMb6UY2VD03kaxrx5qfkq/h2AWwUX99JE9s5kVzMKHVYMpg8Zg7w3rFKk
 7iNmiHlMw+eXvj8P5WxwpG9hxyp9XTIkuH2PPF//rHI24W3J0CtJyhQ9GWEUlkiHQJSt
 WdLrTRcu5oTJyRTlT76fMPy6XUzWpX4A73OdIrOI7vVkpy/oY6DlIdh7xpdt62Gi0hWj
 +km/hbxsF3wbtci8A/q1AQ+CV7cx6dWzgg/ziUl32XDpOXDzcz4li3PrjkuIK3FpmhC1
 rt5U3mDSpwrjIb6WLSkcBnGRpKgldk8O2wFvqenlTdJjt8+u5fdnwgPCmZFPSmew/Hf9
 yb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWhq3GtfKWqTzUPWOIICtNkc0+RZpcNcf71L6lZS9uI=;
 b=N+rTrWU7MAt9x9hPXMUVR4J5h98dBAEpelhzg63SDUN9NOsAHqND79FGq1YFywrWvU
 0LQ5BwNBG2CWFiqZx3LvDrxvBZGu0TY6dLRmeENpEo5xZIGdNWJXok7d8ZLYaqYE88pD
 U5eB9TkfEKHJxHlp9Ojq7CmIVTmcK1UynNzIp+C2B6xu3gylyJZE0tulVDmCw1sBEcLc
 uKhdryVFuRpYh47UBaQrBkQvGywbC8gSFiYU4TEVPbHNir7bYKcdZYG03WYvfZtpxOlf
 mNKsujpvtqHwDrcBGF+/wlYY9JOLjAgTIABqousTb4AVsjgbZdxU1g9Jpt0vZ9KJSXXL
 UslQ==
X-Gm-Message-State: AOAM530W8gcL9h+hBTavwElfMWvLJdB25rUn63xiObFM7dytdjI2J8IY
 aqiQ0mEdxU6XrDCS8RnDvHf9Gxel2FEo9w==
X-Google-Smtp-Source: ABdhPJy3Kqdy3cptyN7Blf3xKo80MPwk/GR3l2X8t/CCPg/J0IiCyvj6XS4Q31+33VxKOJu1M7VO6A==
X-Received: by 2002:a1c:23cf:: with SMTP id j198mr16010519wmj.6.1605542923617; 
 Mon, 16 Nov 2020 08:08:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/15] target/arm: Move general-use constant expanders up in
 translate.c
Date: Mon, 16 Nov 2020 16:08:24 +0000
Message-Id: <20201116160831.31000-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

The constant-expander functions like negate, plus_2, etc, are
generally useful; move them up in translate.c so we can use them in
the VFP/Neon decoders as well as in the A32/T32/T16 decoders.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ac8c118427f..3e5bcab0a62 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,6 +109,30 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
@@ -5174,29 +5198,9 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
 
 
 /*
- * Constant expanders for the decoders.
+ * Constant expanders used by T16/T32 decode
  */
 
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Return only the rotation part of T32ExpandImm.  */
 static int t32_expandimm_rot(DisasContext *s, int x)
 {
-- 
2.20.1


