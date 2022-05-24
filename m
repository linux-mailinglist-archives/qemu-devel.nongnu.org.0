Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F82532EE0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:23:26 +0200 (CEST)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXJe-0004sY-31
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWel-00044w-4f
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWeg-0005MN-Ku
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u27so25452414wru.8
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hk1aHrQ9TVl6KrEJ1C7v3kI0UJPqRUC122r5YQRX1T0=;
 b=EN+VhVPrP0M8IVs4+YqePHOeZevPT9qaCGj+B4BvNgSlJhupwjZanpmunUUVUeBatm
 +Q1hVCAWlABbE1CAwnAaA4su1BWSNP1d1TVUHn6X1hGDKeNTlpBE4znAALo1l3Ttnxug
 i+U4EWRzIpVK/UVPjfqw49uUji7mZjBhm0M7lQX8lIamIWJDwSfGQe3JosZlJm6k+DnQ
 Jeg1+kJ0mQ4ouzcbbVf8Wsr4Xj2f8hnZRNaH8onqVkBLzNMZzNPA34Q/XGVmeHVx3wMe
 zUH5bYUlgnThB6KFIRjxWfBnOX6A/SXnWg5IpX7a3IyXQT/CSDyjL0nioQU0UXNOpuk/
 I9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hk1aHrQ9TVl6KrEJ1C7v3kI0UJPqRUC122r5YQRX1T0=;
 b=KTOMCekQI8GlxEIwejLfnN3+66zEcB9suqKNJQ3ZQzyGFdAh2oshpbwYMIrfmP0C+G
 fdhgK05gDN/R6GcroHVSztnX5ZZYmAWR8Q22SU9AafEls3HisrrHIO63eXa8BPhiWzEC
 f7PmCYyG5R0xKJ7J227N4DJUjNGUUQKegl/70Bx0OQaOwEUGqpE1Ws6+LzFSobqRdIgK
 S4HZ6S497olQgauGrHli958wZU6lXolHX7Seq2Fl53JTLAPdH7ZwllBJfXUqWR5ElN97
 0N9Yy0OTs5x5xNShzzfDM/p3Is5UjP0y2N5ASkVf3eNlwJ5qr8mY6cEcv5FP6CKiicLG
 h0Ag==
X-Gm-Message-State: AOAM532owOyask8LhyozsNJSSbkXBmjvH5g8KcCHik1u12ho0KYl9uWL
 iJoDKl4gvCzU5D8HkSjv9jTG0O5fsvcxsg==
X-Google-Smtp-Source: ABdhPJyhUwbWULAUHrT6pNYhyj3kxsluOMR+ry6fQqBFO1u6O8U/wYm4tnrJdkwozVyoZz4vN8vpVA==
X-Received: by 2002:a5d:58f3:0:b0:20d:d14:4801 with SMTP id
 f19-20020a5d58f3000000b0020d0d144801mr23269955wrd.168.1653406865102; 
 Tue, 24 May 2022 08:41:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfbd84000000b0020e5d2a9d0bsm15698734wrh.54.2022.05.24.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 223591FFC0;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 08/15] tests/qtest: add a timeout for
 subprocess_run_one_test
Date: Tue, 24 May 2022 16:40:49 +0100
Message-Id: <20220524154056.2896913-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hangs have been observed in the tests and currently we don't timeout
if a subprocess hangs. Rectify that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/qos-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 7e1c8fc579..46623da731 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0,
+    g_test_trap_subprocess(path, 60 * G_USEC_PER_SEC,
                            G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
-- 
2.30.2


