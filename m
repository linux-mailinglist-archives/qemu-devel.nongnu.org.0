Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF8376EDF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:37:53 +0200 (CEST)
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCqm-0003DF-Pb
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC89-0003KS-2u
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC86-0005Wf-Rj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h11so9339716pfn.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KUP9zZZiYCu3ns+jhQ4RQON8DkfJ2QZjQiuE1cSrWY=;
 b=Ss4xeaF+/BGl3rm5UvEvcjgRmwCJyZNvOEJeVazMVFKlny2Z36qgv9DClMvt34Qnkc
 panLzq7/upMJGTNNaBn4F9B2WwR6NfW8jIIDX9215HdHDxHO+p1zH+zLHQGbg070CP5F
 MZguCGlZ6lpN2OJsGdNtO6jkCrsyI1/DRT1zh8Q3ldyfDStmcqHPX1AI9VT15kx33NkV
 VLMzd9MkLcolCxYWzYuvxVPsDAzDHAe+gcGn6HkN6eVHweuhqekXjdBTZAXbq1liJcEg
 Uc6OvYpgaIoTbwYDl3JuM1E8VvSbCMCGUKVHYpbkzJLBapIHMWcw9ukt/na0K2o8iYUw
 Wv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KUP9zZZiYCu3ns+jhQ4RQON8DkfJ2QZjQiuE1cSrWY=;
 b=rk38BzWwPTlLS/+d4xA9XwVLz/KSd55pXoJ90vxwkmbS90sJbTx9wNVWYUtUyXVNB0
 xfUK6CW6mcZRAay+rF0S5ytMlnIIK4Duwot1T2WZKeZ5sCvIu7dLWuOpg5RTQ4yyElLd
 JNuDoDWX6OkeZOncoErJWCHrLD73akZkkmv0SlZXsECPrCLuAI/YYRfFd+C4QcFqw2sB
 /VXHf9jdCi73ief3v1X5LphcxqT1cFvRpxDsA4uEirFReVNm/+PW7qrFWfbgjMwUD39m
 HpF+i1Oc35fCAdOhd9w/LKHYPo7DXgD0G/CvOiwkTk/1v38BZQ4PSCjb6SeesTYP01vA
 Z6vQ==
X-Gm-Message-State: AOAM533k8xaRa8TAFkNmoXCuY95E6IkldMsxG9IAOeU3IpfEQfOLH8e7
 ATk695jGR26H0KgtoMjtTcZSko23AsCBIw==
X-Google-Smtp-Source: ABdhPJxtGx0Rq7cE6X0cCI4aFjEScciRLtA55y89gWxWOF4lYONia98tMMoy80GiUn/1my+R0Iy3Ow==
X-Received: by 2002:a63:bf0d:: with SMTP id v13mr5160532pgf.303.1620438701644; 
 Fri, 07 May 2021 18:51:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 58/72] tests/fp/fp-test: Reverse order of floatx80 precision
 tests
Date: Fri,  7 May 2021 18:47:48 -0700
Message-Id: <20210508014802.892561-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Many qemu softfloat will check floatx80_rounding_precision
even when berkeley testfloat will not.  So begin with
floatx80_precision_x, so that's the one we use
when !FUNC_EFF_ROUNDINGPRECISION.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 1be3a9788a..352dd71c44 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -963,16 +963,16 @@ static void QEMU_NORETURN run_test(void)
             verCases_usesExact = !!(attrs & FUNC_ARG_EXACT);
 
             for (k = 0; k < 3; k++) {
-                FloatX80RoundPrec qsf_prec80 = floatx80_precision_s;
-                int prec80 = 32;
+                FloatX80RoundPrec qsf_prec80 = floatx80_precision_x;
+                int prec80 = 80;
                 int l;
 
                 if (k == 1) {
                     prec80 = 64;
                     qsf_prec80 = floatx80_precision_d;
                 } else if (k == 2) {
-                    prec80 = 80;
-                    qsf_prec80 = floatx80_precision_x;
+                    prec80 = 32;
+                    qsf_prec80 = floatx80_precision_s;
                 }
 
                 verCases_roundingPrecision = 0;
-- 
2.25.1


