Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC7673CE8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNl-0006Jw-GW; Thu, 19 Jan 2023 09:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNh-0006Ia-Ew
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:09 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNe-0003Z2-Sm
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:09 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so2113489wrb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MjqM2w9hw3LWgeDOmCQX9tZeJS1teSf33PVNVZfRuA=;
 b=oGv1leY41kTrRW2rwI6qM6gjAqfHsvkfBcPUqeJBS6mrskxptcHLv+f+XSyX1U73r3
 zuKKd/4RatU6xOXRNlXg3Ds9U4Uh3ZeWGue5MhL3hOAVohOi+reoHg9aqvhJXh56gdT2
 5o69d9eqinktB2+RXaMwt3zFreg6sniGMTK6zB1IeHHtdro/WITVKhhwkqp3gpWY4+3d
 eyUaQ8qdEas5T8iZmYaadB2PiB/re+O51ATNalxDAvMkvCBz/0iUrct6HNDMT4ECewDh
 36yDEiPl/R2h8jpu1rxaHaDvNX+3tJCE8en0rQW508pjijs/qq4+glkuJFPAQc6aV4+N
 j1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MjqM2w9hw3LWgeDOmCQX9tZeJS1teSf33PVNVZfRuA=;
 b=QTgy3HjWSo71tFGheoMF1y7C5mePbf5f8lu2ahpa/6HVfgkjDRPlXO0gVCVBFHdWsW
 Trd8ZxeU9g7rndh6F6IP1jeGMl0kU3ICNUs49SFjmGYSBl1EoNfqC0SbldDf2/iyAd94
 iasgh59MHk6AoFYwdF6WmCcRfVYvPoQb4xM/ZBZ5cKJoUlJ8uB+7tHAxfS4aDZVD8mhz
 d2C8C7PT/wZj1p9UZHtDV/vCcjbEQ6zLWR8odvEa2KbV0Ubf01/Ae7mDIwywGoo8PEDR
 41/zsEgZKeHWe2ouEPhilpVKMNuGd9APz51g7zLj1pSRSkCYUz5/bVaGGWBqsCLWXS/O
 tClw==
X-Gm-Message-State: AFqh2kqoSH+sU882ERvtgsZ4qooP4Exg1+VuodUg1Cl6V+qFkWWLUigL
 ZNbqUrzzDD6Qpi9N8Nq65ir8CQE2CarEUVsF
X-Google-Smtp-Source: AMrXdXtkjsGtqCz76dLN0roxEb+lrHPTzC4gt4fDoPcNwPKUoa9A6X/YRZFZ/idMzG2ul6WgqoKopQ==
X-Received: by 2002:a5d:6581:0:b0:2bb:dad4:9525 with SMTP id
 q1-20020a5d6581000000b002bbdad49525mr9162698wru.10.1674140345186; 
 Thu, 19 Jan 2023 06:59:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4cc8000000b002bdeb0cf706sm14689742wrt.65.2023.01.19.06.59.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/11] tests/qtest/migration-test: Inverse #ifdef'ry ladders
Date: Thu, 19 Jan 2023 15:58:32 +0100
Message-Id: <20230119145838.41835-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This slighly simplify the logic, and eases the following conversion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dbde726adf..8beeda4686 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -647,15 +647,15 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
-#ifndef _WIN32
-        ignore_stderr = "2>/dev/null";
-#else
+#ifdef _WIN32
         /*
          * On Windows the QEMU executable is created via CreateProcess() and
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
         ignore_stderr = "";
+#else
+        ignore_stderr = "2>/dev/null";
 #endif
     } else {
         ignore_stderr = "";
-- 
2.38.1


