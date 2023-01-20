Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF8E674F60
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImh9-0004mz-Mx; Fri, 20 Jan 2023 03:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImh3-0004jl-NL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImh0-0004dI-2O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:11 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so3398396wmo.1
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mY7oyQj8bfUQn3aOeG+xwKrGHm6i2eqj02t4Nx+dHyw=;
 b=mI6b9UHz7VwJB3FJYRPDidQ8ghs6YLa7TctpxwlzBiJMTF7IWbrDr65GAtGWb/CvIp
 3CmTgRniDVM8QNqpxP/Al+k/4j8UJs4qqdMA482KJKjXui3GDtQ2QE3IrXRiO5HwYmW6
 dMX0bOpXxKupdjH//dwviLouy1U9kDGrrIq+KeJe6NpLXlkfeCbIP+HzNbA8pQY8Royr
 agKHrebV5a59vBOA0/tyzKmvdAvC2mNKZNJ++kuhR0l2RxYUkIQ/Vx9KCccuVvz2uQmu
 +ivTAr74lXB6f+FzCSJhYVvJUjkBKHSvzpJPSH5crBOLmJakPtIH2wx+1OCV6zwdPrNV
 ZdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mY7oyQj8bfUQn3aOeG+xwKrGHm6i2eqj02t4Nx+dHyw=;
 b=fSH38oUHAggd6vgi2CKlb2PznUlBE5GImWgN3uqgOL/wPVsoXcTIPkiVGwZM2LOT3d
 XjnGnkZ1Q0c9boaxO0Sy4W1etfrNY97mdJHsmAgKXMYPyyj5UQjXtN6o40a6dH/AbwXz
 jQ1ouexpRTrEd0kFjuKTXycuX33E+KP9OZV7gn1lGxywHupDWMYSQG2kkgwZmHTrCgbj
 KeFsQL8BymUTvtFBmW8EdE7ovNmsHCjr9Z4E1BHw+AWmovg2YEVaFjgo6Y4hN+m6yPlB
 MMUNdbRgWKAHRZJGp1IBK4i8xhVPWL/LDAKD06pr93FFfSbhH3G145XviXf7nfbf8Ny9
 qZeg==
X-Gm-Message-State: AFqh2krORmNipOrXXX1PIKlyjVX8KVsqzf4io3GlDJaWFv2QazPpdTYL
 erMQloRVTFTxeZCaJAbxD5ybPRrwYT55suxO
X-Google-Smtp-Source: AMrXdXv0YkdNv99JTOn1W2EMKhicmo/LKD8OCAWPhq3mqjiFoMa6P60E2+DyvsVGvT3TpbyyWUSMRw==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr9568717wmb.6.1674203048594; 
 Fri, 20 Jan 2023 00:24:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003db01178b62sm1674206wmp.40.2023.01.20.00.24.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 05/11] tests/qtest/migration-test: Inverse #ifdef'ry ladders
Date: Fri, 20 Jan 2023 09:23:35 +0100
Message-Id: <20230120082341.59913-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/migration-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1dd32c9506..5271ddb868 100644
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


