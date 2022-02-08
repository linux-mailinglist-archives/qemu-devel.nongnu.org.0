Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FD4AD48B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:17:15 +0100 (CET)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMcb-0001HU-Id
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkh-0000Ov-WF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:33 -0500
Received: from [2607:f8b0:4864:20::42c] (port=40785
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkg-00018U-0w
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id e6so17357236pfc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jgtTnfo81kkT6c5wNQ4JQkcFM5VRPLfNjOe5kccFu/k=;
 b=FNheBTqHJ8zzzq+Lg/svYEqqr3NvAoKpD1HFGU9DQDNkwZf408wCEWrSHhhjSxmT1u
 b/222yxlPxvDFwbwMfCTRe98AqnIPyMc0i8xUYpBRLJa6ZHfMDjSKfG8GTbUyva1onvQ
 JT4ihTlG4At6l09HVnT+NmzpO/eSmnkV5lPVk2Q2YDtR4yqixfUD021K6xBLVxozvKnn
 /sUj15Rm3nTGrXFiR8/YoIexAkHyTkW3zfPsK7b9+lhZRnm8/NcgTaUZe6YXGBUZGDnf
 tiJZ/EpraQPzSi1yAft8mRZe5aiGy6XCxmh9YkgAHyeMjg2JbdmMLYgSwrfAKoQEJY7W
 6zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgtTnfo81kkT6c5wNQ4JQkcFM5VRPLfNjOe5kccFu/k=;
 b=T8DaL+wa5ub7JL7BnsNrhBVoS17/CYkjzXxd5FixCJyJPMkNHGx4henTba1gE94v8K
 6CC9cpoVGFBPI/elk+E89ds6qHm+PvRdWyyWceWyZEigH87/I25bWCsiOcASjZ1S5DKW
 VVM04OIFl337e2hXvEJiAj3ftSjKETs3Az3LjHBVH09kYJ7wWGwGhls+lao4iPrnrnIl
 UxB+Y1mzPQFF+n7oVrG8QgVe5/d0ncluH+xZTfeMu7N8sBgOJE5Luj68Bl6OCmaPbYIc
 8hdAiPv6oXAUUG9hitlYruGpYoAUD06ieS1bhNGLMFK5vMxzB2tbDCt6gryvcOeUwfRW
 hHEA==
X-Gm-Message-State: AOAM530XJwTKyUCmuRW6uO0VR3lx30YqQCgwGbGXg/muwf2sxOm5uKOv
 5YnTjX0TOeI+QDawBdlxKNQG6RXgPsFlJA==
X-Google-Smtp-Source: ABdhPJyecpKFfOS+dSMC0KgJm9IppgIqoVzAFjIXt+S/LnoBwLWHSTHeN8YmNTokqFyHPpPYEDz20Q==
X-Received: by 2002:a63:2f82:: with SMTP id v124mr2454768pgv.139.1644304644718; 
 Mon, 07 Feb 2022 23:17:24 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/8] tcg/sparc: Improve code gen for shifted 32-bit
 constants
Date: Tue,  8 Feb 2022 18:17:06 +1100
Message-Id: <20220208071710.320122-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had code for checking for 13 and 21-bit shifted constants,
but we can do better and allow 32-bit shifted constants.
This is still 2 insns shorter than the full 64-bit sequence.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 7b970d58e3..088c680f37 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -462,17 +462,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
-    /* A 21-bit constant, shifted.  */
+    /* A 32-bit constant, shifted.  */
     lsb = ctz64(arg);
     test = (tcg_target_long)arg >> lsb;
-    if (check_fit_tl(test, 13)) {
-        tcg_out_movi_imm13(s, ret, test);
-        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
-        return;
-    } else if (lsb > 10 && test == extract64(test, 0, 21)) {
+    if (lsb > 10 && test == extract64(test, 0, 21)) {
         tcg_out_sethi(s, ret, test << 10);
         tcg_out_arithi(s, ret, ret, lsb - 10, SHIFT_SLLX);
         return;
+    } else if (test == (uint32_t)test || test == (int32_t)test) {
+        tcg_out_movi_int(s, TCG_TYPE_I64, ret, test, in_prologue, scratch);
+        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
+        return;
     }
 
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
-- 
2.25.1


