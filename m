Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F36DCEB1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:07:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2SR-0004bb-Ia; Mon, 10 Apr 2023 21:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2S7-0004ac-1u
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2S3-0000V5-S2
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:42 -0400
Received: by mail-pl1-x632.google.com with SMTP id q2so11145078pll.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=Hq5CkkXZoAFqSpu8ZmaQ/Ye0y9GcB6NxkHRzmzCmNH1WILBy7J+5Ap9vBZEHw7ZQp7
 apNQoOP7v+nCNGp8x9fGgezK4VTgbYleJ2U8ukz7Q2otNI2MLXk41d9PwtDR7G3MJlFN
 lM8v+Tw54jDWJTQIqsPOf6kiPAcb/O7dpF4BZGuDSZMEhAetdEgkvjgKbElimW6bmbuW
 4mEY8EgiN/yK9a0KthM3uv9rgU5juW7G2ASa8JsbZP6EZpjWMzjqc/HaJ+zGYI+JGUM+
 1EHR25VJxR4T3dtFskOKSPeUgv1JQKA5StTKIxJ07lbQkPrX74UDTQqmBmFZ2Dpa1aY8
 J+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=rgGkWNONeHz/jyIunYSES9IHTRFQNmm60pgnkiwBta6EyfE5luuhIQfRmob0ebJCpt
 ArjOBrouWdNtzASFAP99AShmGXxPfj7zIu9HjqltTRdcRDebE9T4nhL4p9+7Sls6veIu
 laK2oTn9vLtnCo/nhLLEDRQe1923b6v34QVkueRy9n/9iVbyMOsJ/lFL5LPl57HmbwxZ
 U25sj9PecUafZZuty+kJjYig50NT6a26Yo4WLVC63LPSELc1HKVAKRmIncUI9MIhazmW
 9yvn1Ndkt9oVbEKr2uRjxSmCacbKTgNDedZJsV5uQgHtc8k3aMPzglFHwWoDpjRPJ9vT
 Z56Q==
X-Gm-Message-State: AAQBX9eKDbly70yGTAWhBa7H40Np1C4eVske6elZw8KR15pw+LGt024x
 Rxiap+uqhClfg6ngEnXLgFxQUQct7VJ3kFeALsLyHQ==
X-Google-Smtp-Source: AKy350a5gAJLkpoCZwh6XnYiwCUfGpmK/z1muJglHMQp7yyYosQ2THzrDml02fAIm7DjmoeuddWEQg==
X-Received: by 2002:a05:6a20:8c16:b0:cd:f17:5292 with SMTP id
 j22-20020a056a208c1600b000cd0f175292mr11210826pzh.44.1681175138924; 
 Mon, 10 Apr 2023 18:05:38 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 10/54] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 10 Apr 2023 18:04:28 -0700
Message-Id: <20230411010512.5375-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 989632e08a..b2146988be 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -458,7 +458,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
-- 
2.34.1


