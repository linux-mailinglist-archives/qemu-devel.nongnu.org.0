Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917763F0D05
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:56:40 +0200 (CEST)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSc3-0003TJ-MN
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRw-0000KT-2G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRu-00087B-K9
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 7so3413315pfl.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w3g1x/elRBGk2QbFRakGSd+ap6Y5NHb2+du5x0pPFnY=;
 b=uG1sxHYBY7jJi+V0QtKuLdaRyEtuzMNZrh9ciwNcf6Ypu10Igkrmexm8yPMSI2vvqh
 XLbhkN77Dw/AyvzL9SZrADiTKQwWz/MC7NjGNXz6KgWmSfNV/F9nXEi4B+n7pNB+s2m9
 o0+mCqEHF2RsWizHD0iq47a0KoaCtNNNwfj9qVEBpU78pWGDpMoeRThMT8/NkW4QGavD
 Le0K+gh+lz4fa5y4u3j7MTBhkyIru8iBsXxA1Zjh6VD2KvhPSv41CIr0GJIs1NFcujxM
 ZoaHIRwTjw3bXz+/Ad5o7DDLoLb6zezI+et9ObAMpCPDUyGWeFdiiHSzG58QkiXEwKZQ
 bPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3g1x/elRBGk2QbFRakGSd+ap6Y5NHb2+du5x0pPFnY=;
 b=taqy2lmEBQLeaqPg86cPX5pv2ycxUSRGzxxflthnKtOJ65mgVvwUxiXSz+nnuIVGxj
 FCmoAp01RfLP85fl4lIqveg/cM+yBIfmVZuikV28PcxNgIH6hs7zh2iNcyXLT3wQoeAr
 lh5rdgnX9VJm01Ff07R4QYc3zG/LTtMVYbyM99L+ZHpXB6mod6tSPa06calFAzY4IKG3
 nBktUoinaunqdk3td2fFM46NG3SsMKEHeAoV972OZPaEEUq4LbRXWI/QFpRFiesOkN2p
 ad3WF4dIgvuKP3l/LXL9Zhobd2OrMcpjJZ+9qJOG1jwolmc+CKs2vaZX3+FAwNzsJVQO
 zdrA==
X-Gm-Message-State: AOAM531NYGAkLXHMhlefgp/2Zg4sceLyTZozinNmDz3vhIhyLXd89rSq
 +Yu63wlXPyMQj8VDpMdQRttWK3CEIeITEg==
X-Google-Smtp-Source: ABdhPJzUFL81bIULWshzd9bF80fiIn5A/EZrojotgeN5+fugGU59FQOZAxg6EAHraVLEYdxmv5gJhw==
X-Received: by 2002:a65:44c6:: with SMTP id g6mr10605492pgs.442.1629319569294; 
 Wed, 18 Aug 2021 13:46:09 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] tcg/sparc: Improve code gen for shifted 32-bit
 constants
Date: Wed, 18 Aug 2021 10:45:59 -1000
Message-Id: <20210818204602.394771-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

We had code for checking for 13 and 21-bit shifted constants,
but we can do better and allow 32-bit shifted constants.
This is still 2 insns shorter than the full 64-bit sequence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index f11f054df5..16e2258b9b 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -456,17 +456,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
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


