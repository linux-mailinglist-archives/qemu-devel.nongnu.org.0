Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56539AD37
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:51:20 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovFH-0002Jm-92
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov60-0002I4-Cd
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5y-00016d-H5
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id g24so4421130pji.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v63kiMKs6E/Jl628TTWBVtvYw6v1ob0t2PY/usIP/Gs=;
 b=mnMbrQz2S8ISX8o9F8kxHblhgPWF71lExIx3xQ36W2tjozJqByN8XSCa9QCbhtVgnd
 9k4tj1xmPraCKqNOoN6t2RyU2uO4N+hT+gC1JpA+JP0OyeTTpmDX3r/VhFlMp6KaDKiK
 t5DfOrus3HZ8tHUtzLcbLLWQ9vno+ooz1xDkf/shPvneglxyxgkM2nyEtvwBffJaNtNn
 SSphmmMdazqRcCtnY1RV1+nuCbqniby2wEgPYi9W66acXvHIdvK9qLOF35q/W3ARShit
 QSoMIGwhlwu5tG3mSbfYKKUn4QoVZq63rHXaoDYIV5at0jYmg0b6V8k3j0c/62/5r/OU
 uj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v63kiMKs6E/Jl628TTWBVtvYw6v1ob0t2PY/usIP/Gs=;
 b=QABSbAAcL3Y/wMOD4LeHgSX54TwwGMdCSUuOO0yOLKfMNusyz2El+9tLAo2oznAuS3
 vopQYWuZbXyCAf7ugke0+27J1N5SdfKcchZpvqW7JDtq7OV9e7NSDUnXn7Tn5ac5DqCq
 O0zFk7RifXWQbKlLQL8kBAZaD4D/H0VJPvWsOeLqEr5wUCBpUOfhVCGc9jyl/lrJvW8a
 jA4AE1cwtCM1wbAXB4xaYwTyTDvfqDlaZRRwjnQUZQXpytbuNAdZ+T+zXJdVbpQYMnnr
 hyZTeV0y0Da2b+6TuvG/9LEZjqSTukam5eFqsrYjJHj//6YQVB47xOIjLJgJi7W1LEEy
 u1Ng==
X-Gm-Message-State: AOAM530z3OkGoLkiFtrKmXXLC5fl63hPoYF+u8HqrxacgS1y5nxWSCVR
 KCHdTKLmagRROVSTCD9cW5GgHDqlS7xRCQ==
X-Google-Smtp-Source: ABdhPJwZnZeZ30FFQdGaSi9BNr+jNhQvU0Uo37JSfuxLLBBaDtWoZ6CKQNcqSDN364g4Hgrol+XPhg==
X-Received: by 2002:a17:902:c403:b029:106:7793:3fcc with SMTP id
 k3-20020a170902c403b029010677933fccmr1060530plk.81.1622756501138; 
 Thu, 03 Jun 2021 14:41:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] tests/fp/fp-test: Reverse order of floatx80 precision
 tests
Date: Thu,  3 Jun 2021 14:41:15 -0700
Message-Id: <20210603214131.629841-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many qemu softfloat will check floatx80_rounding_precision
even when berkeley testfloat will not.  So begin with
floatx80_precision_x, so that's the one we use
when !FUNC_EFF_ROUNDINGPRECISION.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


