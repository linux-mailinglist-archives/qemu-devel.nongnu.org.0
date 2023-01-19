Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39A6737DF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITfv-0008Ku-Rt; Thu, 19 Jan 2023 07:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfk-0008DY-5Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:43 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfi-00027i-8z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id g10so1352142wmo.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHlxuZmL/pDB+QqUj4R91yU/bF31Oor0VBQxhzHCLfk=;
 b=NUcy43Et3Nvfq1q76O31HneYOBHEtVrmctGGekTOyipVfH6a42F8AMTX1mddLAqFfu
 JTjbdCvyYAF5QEx2RDP1g6JsK9PMeTLzULUd2J5JBuTLaUojdQERIO+IeL2LLU4wySR0
 tlaFLEb+/JKPpLrXiU5qc73rZx8CEdbHQQDpGInorqe3uhUesd2je99zThm+jyf+vAmR
 tmlj+6YRL4Ggq/atpaOD5AuhSnll6UWDlJnVnfdAb36bnlwMLft75AY5faWTGC8FYdmq
 9RuGwFIGHECtqKRSutuF9U+AZUVJr5zuwWj6l/XDBUn7V96PjxqNS84IUidZD2bfO9Tc
 6KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHlxuZmL/pDB+QqUj4R91yU/bF31Oor0VBQxhzHCLfk=;
 b=qcfrJBTwI4UQaYULkthjK4FP4lzn26u11ev4MX4OcZ88NikGu8Bnm6j0YZiig8aucv
 c+xBkQHDnMgCowrx3CVBYxrJhBIRkMs6wcsQ8eSs06iVC/ktXJucv8VDKKKLhywSY827
 XgBlyVfjSXGof8hl+pjieLWi3XX9lSW97mjjSKKO1E6sp19d/9AN2jaA5kK8bGXvpB8I
 Bt9j5XEeTqw4z7lajj7eAzhtUroFTPsSiyOWWc7HAOezvWvXDhY0Et3X8AASdeCbd7SB
 KTKpuKmL0L9QLRtow8l7WPR6KbKV1O9MKC1c2BoDh1cTL2ZPuwKQqvnL+yOVQ4KlkEWA
 SrVw==
X-Gm-Message-State: AFqh2kqgH87okUu6JHkfJCBVOeKdzQFxsKLfNiHhpZSlXlpHYLtLqY2T
 tumLB02301OPDQ+sJAM5qEVJFbbJJNh4jKA/
X-Google-Smtp-Source: AMrXdXu1D/RxMb2rQ7zZmIdk7AmeVCJsyIFcTjDvC6o27vEF6+5feceB9eKju6v//TOG5xmH60lJMQ==
X-Received: by 2002:a05:600c:4f12:b0:3d0:7415:c5a9 with SMTP id
 l18-20020a05600c4f1200b003d07415c5a9mr6141447wmq.21.1674129931613; 
 Thu, 19 Jan 2023 04:05:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003daf89e01d3sm5489544wms.11.2023.01.19.04.05.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 04:05:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 3/3] tests/qtest/vnc-display-test: Disable on Darwin
Date: Thu, 19 Jan 2023 13:05:14 +0100
Message-Id: <20230119120514.28778-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119120514.28778-1-philmd@linaro.org>
References: <20230119120514.28778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This test is failing in gtk-vnc on Darwin:

  $ make check-qtest-aarch64
  ...
  19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
  ERROR **: 10:42:35.488: vnc-error: Unsupported auth type 17973672

While QEMU picks the sigaltstack coroutine backend, gtk-vnc uses
the ucontext coroutine backend, which might be broken on Darwin.

Disable this test (current problem being investigated in this thread:
https://lore.kernel.org/qemu-devel/Y8kw6X6keB5l53nl@redhat.com/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/vnc-display-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index df468c7b22..e52a4326ec 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -19,7 +19,7 @@ typedef struct Test {
     GMainLoop *loop;
 } Test;
 
-#if !defined(WIN32)
+#if !defined(WIN32) && !defined(CONFIG_DARWIN)
 
 static void on_vnc_error(VncConnection* self,
                          const char* msg)
@@ -41,6 +41,9 @@ test_setup(Test *test)
 #ifdef WIN32
     g_test_skip("Not supported on Windows yet");
     return false;
+#elif defined(CONFIG_DARWIN)
+    g_test_skip("Broken on Darwin");
+    return false;
 #else
     int pair[2];
 
-- 
2.38.1


