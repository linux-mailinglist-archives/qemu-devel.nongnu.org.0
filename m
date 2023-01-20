Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1CA674F62
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImh7-0004k3-Q2; Fri, 20 Jan 2023 03:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgw-0004hp-2F
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgu-0004YJ-K9
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id h16so4105328wrz.12
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cm+umm3mYxK9+2vcvx9AjhkEUHA7aStmnl97320UCkM=;
 b=ZpunFXMVSA4HnDYLCxUAriPXIak+DVQgFJdJ2EuMNuyS4tj/uWIf8PWhBitRFop6yM
 pZg2ZYBwWNXuqkCEu3FrSdWX/fiVN3a0Nu4s22Ptreha+vqxjn0w7hofupOEswa0ASiW
 B7Ws4CDr5rYpBswrj92vVOGSHQETB0E9euM+Dn32W5ySyheZcrpixWE9OApSqHEysK9u
 d+fPWpWjF+oqtke4aQ+78zL/2eSEh8erc5RaNGAfa7DQBmbpsOK2WSr1Px+TCK25DB5U
 m4p4dDUX2+oT9lJZbOxUTMp+1J2A4EtTcLiSTA7f7uJ1uTlkak7w3StJ0ibhty+THl3r
 OgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cm+umm3mYxK9+2vcvx9AjhkEUHA7aStmnl97320UCkM=;
 b=WmedSSO7QeSl+OcC0oYN4RQ4WOi5mSZQ7z4NUsbO3Rq81anLWBGLYF43c7VuQQi8G1
 k+IMUDl0Cu12Vk554wh+X9O47UvlWP9R8ZaX9YDztITXfmXUQ5B/+75Q9PgQg1i5SFzZ
 OD6qeEqm0h6+tJ5S6zz7nbGmDELE9sUy4lePqYOeJT9Qm0+Qikx/jeOd0SAxeBcg3hDk
 usAmcwMKxjKyOewJz1lfk+OBpI3oblrXZe3QTGpta2VciqxRId4M1yyPDbeNY1HVUDd8
 BV0L88xTGIAsw/mRv2Jtj1bMXytSuAvt9AWyQwNyXFMfM9TTIrO0jTWAkgRoZ69ZCsdq
 1V2A==
X-Gm-Message-State: AFqh2krdtXWPLkTNTXJcvJy4soXLFBkDekjERRr/BXG8WGRCbGIjcFkS
 LgQdy6t/sdWKXpYGVwdp+LcwaAPCDPQ3CILX
X-Google-Smtp-Source: AMrXdXsfmBZ5MjQCb5Dqpr1yZdVvUB+CsAu0vjBhxBYqpeRVQKmTgKibwgePyL+e8zL9t8eT/6BmUg==
X-Received: by 2002:a5d:4dcb:0:b0:2bd:c1de:a33f with SMTP id
 f11-20020a5d4dcb000000b002bdc1dea33fmr7516960wru.19.1674203043574; 
 Fri, 20 Jan 2023 00:24:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm36048130wrj.94.2023.01.20.00.24.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 04/11] tests/qtest/boot-serial-test: Only use available
 accelerators
Date: Fri, 20 Jan 2023 09:23:34 +0100
Message-Id: <20230120082341.59913-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/boot-serial-test.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 92890b409d..f375b16dae 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -17,6 +17,9 @@
 #include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
+static bool has_tcg;
+static bool has_kvm;
+
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
     0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
@@ -257,8 +260,12 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    g_string_append(cmd, "-accel tcg ");
-    g_string_append(cmd, "-accel kvm ");
+    if (has_tcg) {
+        g_string_append(cmd, "-accel tcg ");
+    }
+    if (has_kvm) {
+        g_string_append(cmd, "-accel kvm ");
+    }
     g_string_append(cmd, test->extra);
 
     qts = qtest_init(cmd->str);
@@ -285,6 +292,9 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int i;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
-- 
2.38.1


