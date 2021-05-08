Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0CB376E49
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:57:49 +0200 (CEST)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCE0-0001p1-Ig
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4n-0004Ax-M1
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:21 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4k-0003ae-5e
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:17 -0400
Received: by mail-pg1-x536.google.com with SMTP id i5so3883015pgm.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XFPaqmhZZujk8i6xDVlzhC8z+OKd1ONOKE68PwhM5k=;
 b=pHgCeEDUGQ6Mq8uCqlSnqh15GPZooAPbosj5Lz8PHc7EH7BAHWag7WXLJtL3AUcvR9
 qmdx5OZ561cqrUDdnHV/FO9uS/hW8/gMm1NBwDkMq0DndEUZVU2NnwfPGTxgUPWPnTEn
 U1+gYqx1agVUiuRhH+L9cmGnatQ/Xd/r2ulGyaG5eDYopYGwa1+B8tp3LGwnJbzDiM+c
 NCnmqxsq4N89QuTkSDYQ8eEI8DRurfBAOfg45LWeY7GOd3KJrbYp9Aap9XBRCvYqP/Fe
 sxpohvIj0pZWmMxABWjBLI3bGnmkGbup1m3OhM0G0dBTc0f4znwCYzLFJcVuMVFf98In
 7tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XFPaqmhZZujk8i6xDVlzhC8z+OKd1ONOKE68PwhM5k=;
 b=NKnfMLtGHKyaekvows1hF1io2pVIhUIl/NZNL64Mvke0xxKwxds+4igGJcR16XHMFa
 AToOCtNp4PlfPJLGgKEmRC6FUgg/fOrYuPf2FNITd+gL0/r/yhsT+jRCRLS65nggvOZV
 XvHrKK4jKcjUkOzWrTHgFByuE6l4HMnfR3zQ84muLkzZuOYiD9TMIHnKKwE+YG1oEObZ
 gKBJ72HRNxPCnxt62DJi/xAKsWNfOe7K2WHNC1EolQTWdARbN5Tf8ey2buMHzjsZOsMn
 VqqbstCiHcI6UtcQaSiyEzkYt6Tu8gt/K6MNMK9qxtqa3yNnXCO0a73Z+gctr93oS737
 o2pA==
X-Gm-Message-State: AOAM533T4WiPoRuAkPZMhrvKjhby058wTenv+UuXV/RYzbijkX98u1IG
 74UhHk6IEBsJJvlj4gEjN+rM8jG2j2Fo4Q==
X-Google-Smtp-Source: ABdhPJw9LG/RkL427QOY3JzEhz3Ejc4S2JB4yHhUcp7V4Qf7RJ6hsuAb7TiQkTr3UC7K179Q/CwWHg==
X-Received: by 2002:aa7:8113:0:b029:278:dfa6:8ac with SMTP id
 b19-20020aa781130000b0290278dfa608acmr13327701pfi.57.1620438492745; 
 Fri, 07 May 2021 18:48:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/72] softfloat: Do not produce a default_nan from
 parts_silence_nan
Date: Fri,  7 May 2021 18:47:04 -0700
Message-Id: <20210508014802.892561-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Require default_nan_mode to be set instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 487b29155c..5988830c16 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -180,16 +180,15 @@ static FloatParts parts_default_nan(float_status *status)
 static FloatParts parts_silence_nan(FloatParts a, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-#if defined(TARGET_HPPA)
-    a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
-    a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
-#else
+    g_assert(!status->default_nan_mode);
+
+    /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-        return parts_default_nan(status);
+        a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
+        a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
     } else {
         a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 1);
     }
-#endif
     a.cls = float_class_qnan;
     return a;
 }
-- 
2.25.1


