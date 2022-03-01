Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D14C88E6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:04:33 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzMu-00084Z-RW
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:04:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzF1-00080O-81
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:23 -0500
Received: from [2a00:1450:4864:20::633] (port=33572
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzEz-0001y0-Od
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:22 -0500
Received: by mail-ej1-x633.google.com with SMTP id kt27so1247410ejb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2Z0r2dk3nkd5RgGjI14HIVrBPtONff7YVlY3kctiMs=;
 b=WPnrJmwgEP84fCzrTeorjz+ynrjgdEquH379tGHlHYGpvryb1acxWJUdhsEE3AY0ka
 9UBgb4Abcd8QeTWQO5eBGSNaM5Ghg2Fgf0a9/L+AjhusZ+bAFVupyJ9EM3bApvOHOyUu
 WJtWQn9wt0nvwX2JrMJh3odqOtLaM5VI6w98EdwQrNQ/HrGfZNJaJhG3X/Aqh+1Zt1XK
 dvVB6L/yN1aU4oN//etdB7I1/RK5Mi+W2gpQuXCHXYODCSkX/L4brdvFsq9bW4hacOhA
 y4y0X8VESy5efiOyYht3b8F3M5SjyWfNpC3ltAnLa9sneJ0SVHwQ3UvOcvJSfO1Doi64
 e9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2Z0r2dk3nkd5RgGjI14HIVrBPtONff7YVlY3kctiMs=;
 b=LLj7Z1q3MvqrCTm9PbgjJ10eosgpqUhkS1Xiq0Jwf2GDlAfSV0KdpKNQ4fwVMjvpq1
 mqtCboppb7DDwUVQgbVVkfkSo38QpqdTwhMydyU+FWYnYKChStscj1x9OvZARCs+MCMh
 WaIqb3HW2YPUVCYweXRXqk4IqwDmtEufjpWY4QxAf2oYXBsGm0QK7JGF0c2AkiuvzdZY
 MN80BLKLCrie4x4jUfXK4x2ijVa0ZltKMhX1qtkBna/2UTkZ6398ZHNyEDDYBUanoaeS
 RQgqKsTofN9e32Hr/WsztCM5glrTmEiOutGW1NeG1kloiWe6Ab/potzfGTzuUNBhZB7H
 o6og==
X-Gm-Message-State: AOAM533hM9kAb3qpASX6rmMxcjY1YbMZDebAxKtE5WhgpWLlFYnuVISb
 ggCy5ROCcz3vsNYo7N515m1IaQ==
X-Google-Smtp-Source: ABdhPJyyWN4UB+c4Y9mhELX6ZDgHzcniW6XcziX4nncbU+od/dbdpqWkPDbaHL2aq4PvHRKFH8TzKw==
X-Received: by 2002:a17:906:6848:b0:6cf:6273:9c47 with SMTP id
 a8-20020a170906684800b006cf62739c47mr19020774ejs.1.1646128580467; 
 Tue, 01 Mar 2022 01:56:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50e08f000000b004134a121ed2sm7153506edl.82.2022.03.01.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:56:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5389D1FFC3;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/18] tests/tcg: build sha1-vector with O3 and compare
Date: Tue,  1 Mar 2022 09:47:08 +0000
Message-Id: <20220301094715.550871-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-12-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..df3f8e9438 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,16 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index f509d823d4..2dc94931c3 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -70,6 +70,15 @@ endif
 
 ARM_TESTS += commpage
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+ARM_TESTS += sha1-vector
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.30.2


