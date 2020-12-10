Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90E2D59F0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:04:09 +0100 (CET)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKg4-0007I8-27
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR4-0001Y4-Eb
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:38 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQo-000776-Di
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:37 -0500
Received: by mail-wm1-x342.google.com with SMTP id g25so2621786wmh.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=px5eFJInHNHQIA7EojQH4T/N5fGZcvKN8m1p9kIe4Dk=;
 b=cheLZWft7idakZLRS0l1HryfOeIFL/Hkd5TsRH2WAodjHs+5TEUFZIB5qGXqjlNtnC
 rQepkS0TheBXuEWGnqkVH0RArfurHzoZNnz2LpQIIrTCfSREx9N1nfiMpiq8LVi6uTdt
 xPyLFXnP19kJ02D7conlaXxPgvJnqdbcI8njuoZzBm40lLUPHaLxpRPkjjNxUxSGwqn1
 dwb6cMfVyXkuVRiBZ2n11RKq+S9yROV3B4bXRgaYtn4Xl3Eew4EU0TFJ9heFR9sayKUd
 ceeXhTlYmM9SY0gyuqv5/1jWflf33Y1pgMooPQUc9UamzMu5NmGjTXe/5IMbGLFNsdKs
 M/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=px5eFJInHNHQIA7EojQH4T/N5fGZcvKN8m1p9kIe4Dk=;
 b=t+rTOyua20jiktrGz46Zuytb4WXyiy+SA+A8E+aJFDoxXVa8YQPuR7fesVQLsQSqaX
 lBK6w8RubhhSYtJQt//Qw1WIBUrDBDfockhwQqrK1icAI3bChBTBLCjuo2cCyXWz1hLq
 1bYu1HEBy5DWiNxqcnVPjHHbd14tJxXyNBq+XDh/xbjLeTqEdZCZbL6U5CX7nP+8KJiG
 xgZ7v51G0NDWK8iAQGnWaxwKZ71tEBRR8rASn/wx1LlHHEuPHurF1nol6xkuu3j+ijFx
 I7OulVR8jbtzX6DoAAYxOHlLdrg6toKiEFEgqVv5y9JGz+MHnRD7olQKSBw2pB/WUsfs
 ZEMg==
X-Gm-Message-State: AOAM531omQgDlIehVzYvRx47WHjTyfdpee4TY5REr6vHtXAB80+kdDAL
 sPynWTrChG29XzRXbdrVZG+XrULOCgVxkg==
X-Google-Smtp-Source: ABdhPJwXflTk6i0CCdf60YdkiYNERouCILn7UkfCbEgYqWls4Zy6w324EjsRmDuLkOGdZf+Cvacalw==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr7767589wmi.179.1607600900774; 
 Thu, 10 Dec 2020 03:48:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] target/arm: Move general-use constant expanders up in
 translate.c
Date: Thu, 10 Dec 2020 11:47:39 +0000
Message-Id: <20201210114756.16501-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-9-peter.maydell@linaro.org
---
 target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 47a1a5739c8..f5acd32e76a 100644
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
@@ -5177,29 +5201,9 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
 
 
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


