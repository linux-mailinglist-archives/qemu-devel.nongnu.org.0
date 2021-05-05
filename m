Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F1373CC4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:56:59 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI1K-00010I-3Q
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leHzm-0007vq-Kl
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:55:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leHzk-0003ah-Sc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:55:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l2so1937635wrm.9
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtYc437Hrc+F/cT+QMDIG4OwrJNHfRhNlqkrK9EuWuQ=;
 b=MfP+vF/SdzhAJrEWx+atZ3xblmN9sPRcaNQ9VnasZ2j0MWdb4kIWkF19rTJ8JPbPw+
 OiGTcPnebC7SKhpN+OwwBN9wxJm64je/GmzVedluFjfzs+Vm/lt5yGbW6ad6r22i9gMc
 694cJx3V2/vF30MogVOKNVqlcp02AnkYTamQ98+kGWRw6oS+3e12Oi+waXvPyfPYZeeI
 tDkkQXWGC+vGGHyQ+dOCfRovrVt3BUzd6ODPHDoRo9nE9lgsrjMFco+Il87n1Fo8WHSL
 /ueHjpAxtKfE4iSaAZbQq8aTRnFagtLPYVRUl+lnZQt6nHCM1hudyAQtdjQM0L8coaYd
 aMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtYc437Hrc+F/cT+QMDIG4OwrJNHfRhNlqkrK9EuWuQ=;
 b=TT5mzRfls4lCqxu9yBHy536334c85GrLo6XA4TiGQR687ED8YbPaw4Rm+FvLex5BhV
 LEXV+a+YSiW/zcU308qVDi8h1UOkzz1ByaPj/joXVPvvi5V09aRsRgBj0jS0qzWfu7AO
 5SKx0njZUddEe7rjXamxoDRkTgh70YFx9hHG8Owt4Gm0K6VdAQFnHcnBgVOmofMEkvJj
 EkwpMBdSEvYGPVNN+rZKfS0E5kGn2F9HxGVUjvsqaTO0tDCAO/6ugIEKOS+1Mhys89we
 XCVrTSDPzA28XB53TJfH9b3Y1uqZA8vybAR4R8aXBqvf+nAyH5BqUySDQrQhBURUwZTq
 2FLA==
X-Gm-Message-State: AOAM530+Ew4GW0RlE/BgPql796yk4yHuRFXUMqBLkX8mwaZRk6W0ri/D
 jCyNKTWf+lfkoFtROatuA2WoNQ==
X-Google-Smtp-Source: ABdhPJxf4xOrpCvpyPhnrBs5GK+GkeYIrKH5fqFPzy5Ow0BK2jHOtp5YRAAR0pnyTVcx3+9SPetI4Q==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr11949800wrm.379.1620222919498; 
 Wed, 05 May 2021 06:55:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z6sm5878680wmf.9.2021.05.05.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 06:55:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
Date: Wed,  5 May 2021 14:55:16 +0100
Message-Id: <20210505135516.21097-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Thomas Huth <thuth@redhat.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the glib API, the distinction between g_assert() and
g_assert_true() is that the former is for "bug, terminate the
application" and the latter is for "test check, on failure either
terminate or just mark the testcase as failed".  For QEMU, g_assert()
is always fatal, so code can assume that if the assertion fails
execution does not proceed, but this is not true of g_assert_true().

In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
include some assertions that are just guarding against possible bugs
in the test code that might lead us to out-of-bounds array accesses.
These should use g_assert() because they aren't part of what the test
is testing and the code does not correctly handle the case where the
condition was false.

This fixes some Coverity issues where Coverity knows that
g_assert_true() can continue when the condition is false and
complains about the possible array overrun at various callsites.

Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_pwm-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index bd15a1c294b..a54fd70d273 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -201,7 +201,7 @@ static int pwm_module_index(const PWMModule *module)
 {
     ptrdiff_t diff = module - pwm_module_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
 
     return diff;
 }
@@ -211,7 +211,7 @@ static int pwm_index(const PWM *pwm)
 {
     ptrdiff_t diff = pwm - pwm_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
 
     return diff;
 }
-- 
2.20.1


