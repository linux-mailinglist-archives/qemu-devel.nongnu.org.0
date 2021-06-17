Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593003AB3A9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:35:37 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrFA-0008O4-E5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx6-0001iz-NV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwx-00072z-GC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id j18so3124465wms.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOZ/9nj2wS/3eRz7s49z+WNHBaG7u0SKFoi1CNqN3ks=;
 b=qXsE9FJrov1pTU4iVzhxg+TMjnXo5C7w43h/bQxYeQtwtEZUE9E5dtX1A8CAoCkWmj
 6/X6iAbqu9J+F8oBJjfjzmB6PA7vnjvZe8r6ntqAPXk+uc5DlK0EIQjUJePvoqWRNIGJ
 7p4Swb42kkmNSj0DPAHwIQ7N8vjkOT77Y4Bt40ReZnyn7p20veLPKHlBTcznJGiJD9+a
 9/ozZ0XwgCpJO/F1DGU03Eph8OvMdZNU10xXsa6B9V5SPvCbdA7J84zFtsF8S5nTzW1U
 UMit1K2GNfhcvTo8cWMrWjH66OLYZ5nP20gNMMAQP0TC6G+Z+c2XoUM+xMU9Vmithvuo
 OCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOZ/9nj2wS/3eRz7s49z+WNHBaG7u0SKFoi1CNqN3ks=;
 b=Z8Vua/BXUaOQFxELZzSVl5glXO37lsHzJ/OzTrc8kNFuYzbVdfGAAq/34G2b8ltMRG
 rkFmew9rM0dRZpBcAF5rY+TvGdx99nLH9YFgC78JojvNyOK5k2J+urAnIAsHix9pxf4D
 BuKC9S2Bk0lKtBK1HDBXFJX5rMisDRGFf40CrDmRbifipVKor9ylayuORaEISE5irpzH
 722VkRSs2X5gbS7rHGLj9Vu5j3TX3qxH0tcvgp8T2JtgOJae1u3ApXAeRt8xuIRpssQX
 KDu8T2tdYpFnLoU3TzZcICB9c33vQPTt/pXLWpxHW/w4kFrQiKWMMVYh6Z9/pEj13U6N
 IIFA==
X-Gm-Message-State: AOAM533YLSbeBg6Cc2Hf1Nj27X5Y7FcYcisSUrFpdSFWgbahBFFGnGcf
 V72G7he6gwRfM+pdJS6KADl/2g==
X-Google-Smtp-Source: ABdhPJy/WDOrsPmLUNUS4bbMJKFp9pPeEfS9YeuHb5MtJZ3yPASxsVB6ROGA5yMn7etUdUZ3jYxTKg==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr451728wme.117.1623932206046; 
 Thu, 17 Jun 2021 05:16:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 20/44] target/arm: Implement MVE VMLSLDAV
Date: Thu, 17 Jun 2021 13:16:04 +0100
Message-Id: <20210617121628.20116-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Implement the MVE insn VMLSLDAV, which multiplies source elements,
alternately adding and subtracting them, and accumulates into a
64-bit result in a pair of general purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    |  5 +++++
 target/arm/translate-mve.c | 11 +++++++++++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0138e28278a..7356385d60c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -152,3 +152,8 @@ DEF_HELPER_FLAGS_4(mve_vmlaldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vmlaldavuh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bde54d05bb9..1be2d6b270f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -145,3 +145,5 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+
+VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0c8bf9232d6..618f0e66d1d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -537,3 +537,8 @@ DO_LDAV(vmlaldavxsw, 4, int32_t, true, +=, +=)
 
 DO_LDAV(vmlaldavuh, 2, uint16_t, false, +=, +=)
 DO_LDAV(vmlaldavuw, 4, uint32_t, false, +=, +=)
+
+DO_LDAV(vmlsldavsh, 2, int16_t, false, +=, -=)
+DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
+DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
+DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f8ceeac5a4f..77b461c2186 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -461,3 +461,14 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
+        { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1


