Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E221639FD38
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:07:18 +0200 (CEST)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfC9-0005xo-Ei
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqfB7-0005CU-KT
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:06:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqfB5-0008QX-E2
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:06:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so2512816wms.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXpBgPiJXiqQnwntzx/UB7vSpgvvjvSqLVtGkZWEw6U=;
 b=TOXIe1UqlnWptrz1kx88FnWnZQRPdur+pegMQa3f8Jn6B1LHAkmOP+Q11OoZTurmIH
 tciE2JA0PF7w7fIDex+fE3mGFmqjttVsHF755s3v5J82iCqKbXnFs6pSNwWixSEi0Msy
 UO9pO5M0+x4TZcCTSCQextDx+4eAtpDiUK1Z80TbJTQEw8kRhR1sllSDSrQ9WaEf6CiD
 suTqCz5OUlm8fYWDD1m5hXISYNDM6RZRcbmumVBqIAFxGX64by6IPKB/r9sCztfBEUup
 EA6gr3KFrnDu7VrJb1IcHeJbDs8OPDDOQbqUgXYfViEL7gQB7u4Csip3q9iqw+KJJLtf
 Mjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXpBgPiJXiqQnwntzx/UB7vSpgvvjvSqLVtGkZWEw6U=;
 b=r3YsAhot3qvHl7szvWBqQbAA6byKcn5Ad1nGHTHF78vAg2IibVE/xTTEjasa3r0/el
 zdigHabjvRTnnk7cAj1BK9mx4Y8cba5bWlZqaK6I4X6JN5Z5m3LML9NWbRzlQYC9AYc9
 2Av5k2xtgoL8BWpa+qn2vFakc0SxN1PjepVkXo/7GKmehP1l4rU1/anwoCGCVva2CcpK
 yPqk82/e2f78j/lRHazg/TPVvUbDJQ1AGgL8QzZqodhgbwU1Epd+O4mrUzeSxjv+omR8
 NCaxa/7aT49Zwow6BDyBnywRpUTmQ1besAE+BfQm5Sf0ATX9ooNhApqCVEyBgTq5EugN
 Nl8w==
X-Gm-Message-State: AOAM5334JUdwqWf8IMEZK87JpBcJkF0cW+OaFXMmwGFU+8sON0+Xh798
 yJEzo9J9hlqBDWBSGhNk1XaWYtHullKrZ7Nj
X-Google-Smtp-Source: ABdhPJxn6uJXbzVHoqRGqO21amHcczwz1Cq7JVHWr1YS1Z6lkSeH4/H+rOicP/LdXUKRpp2cn/PNAQ==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr23396928wme.147.1623171969676; 
 Tue, 08 Jun 2021 10:06:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x10sm9905783wrt.26.2021.06.08.10.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:06:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/unit/test-char.c: Fix error handling issues
Date: Tue,  8 Jun 2021 18:06:06 +0100
Message-Id: <20210608170607.21902-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity spots some minor error-handling issues in this test code.
These are mostly due to the test code assuming that the glib test
macros g_assert_cmpint() and friends will always abort on failure.
This is not the case: if the test case chooses to call
g_test_set_nonfatal_assertions() then they will mark the test case as
a failure and continue.  (This is different to g_assert(),
g_assert_not_reached(), and assert(), which really do all always kill
the process.) The idea is that you use g_assert() for things
which are really assertions, as you would in normal QEMU code,
and g_assert_cmpint() and friends for "this check is the thing
this test case is testing" checks.

In fact this test case does not currently set assertions to be
nonfatal, but we should ideally be aiming to get to a point where we
can set that more generally, because the test harness gives much
better error reporting (including minor details like "what was the
name of the test case that actually failed") than a raw assert/abort
does.  So we mostly fix the Coverity nits by making the error-exit
path return early if necessary, rather than by converting the
g_assert_cmpint()s to g_assert()s.

Fixes: Coverity CID 1432505, 1432514, 1432600, 1451384
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We had some previous not-very-conclusive discussion about
g_assert_foo vs g_assert in this thread:
https://lore.kernel.org/qemu-devel/CAFEAcA9juOChqrh5orybJQwpQsyEZ5z3Dvmy7fjX0DW4Nbgmrg@mail.gmail.com/
This patch is in some sense me asserting my opinion about the
right thing to do. You might disagree...

I think that improving the quality of the failure reporting
in 'make check' is useful, and that we should probably turn
on g_test_set_nonfatal_assertions() everywhere. (The worst that
can happen is that instead of crashing on the assert we proceed
and crash a bit later, I think.) Awkwardly we don't have a single
place where we could put that call, so I guess it's a coccinelle
script to add it to every test's main() function.

 tests/unit/test-char.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 5b3b48ebacd..43630ab57f8 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -214,6 +214,10 @@ static void char_mux_test(void)
     qemu_chr_fe_take_focus(&chr_be2);
 
     base = qemu_chr_find("mux-label-base");
+    g_assert_nonnull(base);
+    if (base == 0) {
+        goto fail;
+    }
     g_assert_cmpint(qemu_chr_be_can_write(base), !=, 0);
 
     qemu_chr_be_write(base, (void *)"hello", 6);
@@ -333,6 +337,7 @@ static void char_mux_test(void)
     g_assert_cmpint(strlen(data), !=, 0);
     g_free(data);
 
+fail:
     qemu_chr_fe_deinit(&chr_be1, false);
     qemu_chr_fe_deinit(&chr_be2, true);
 }
@@ -486,6 +491,9 @@ static void char_pipe_test(void)
     chr = qemu_chr_new("pipe", tmp, NULL);
     g_assert_nonnull(chr);
     g_free(tmp);
+    if (!chr) {
+        goto fail;
+    }
 
     qemu_chr_fe_init(&be, chr, &error_abort);
 
@@ -493,12 +501,20 @@ static void char_pipe_test(void)
     g_assert_cmpint(ret, ==, 9);
 
     fd = open(out, O_RDWR);
+    g_assert_cmpint(fd, >=, 0);
+    if (fd < 0) {
+        goto fail;
+    }
     ret = read(fd, buf, sizeof(buf));
     g_assert_cmpint(ret, ==, 9);
     g_assert_cmpstr(buf, ==, "pipe-out");
     close(fd);
 
     fd = open(in, O_WRONLY);
+    g_assert_cmpint(fd, >=, 0);
+    if (fd < 0) {
+        goto fail;
+    }
     ret = write(fd, "pipe-in", 8);
     g_assert_cmpint(ret, ==, 8);
     close(fd);
@@ -518,6 +534,7 @@ static void char_pipe_test(void)
 
     qemu_chr_fe_deinit(&be, true);
 
+fail:
     g_assert(g_unlink(in) == 0);
     g_assert(g_unlink(out) == 0);
     g_assert(g_rmdir(tmp_path) == 0);
@@ -556,7 +573,10 @@ static int make_udp_socket(int *port)
     socklen_t alen = sizeof(addr);
     int ret, sock = qemu_socket(PF_INET, SOCK_DGRAM, 0);
 
-    g_assert_cmpint(sock, >, 0);
+    g_assert_cmpint(sock, >=, 0);
+    if (sock < 0) {
+        return sock;
+    }
     addr.sin_family = AF_INET ;
     addr.sin_addr.s_addr = htonl(INADDR_ANY);
     addr.sin_port = 0;
@@ -586,6 +606,9 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
     } else {
         int port;
         sock = make_udp_socket(&port);
+        if (sock < 0) {
+            return;
+        }
         tmp = g_strdup_printf("udp:127.0.0.1:%d", port);
         chr = qemu_chr_new("client", tmp, NULL);
         g_assert_nonnull(chr);
@@ -1224,6 +1247,10 @@ static void char_file_fifo_test(void)
     }
 
     fd = open(fifo, O_RDWR);
+    g_assert_cmpint(fd, >=, 0);
+    if (fd < 0) {
+        goto fail;
+    }
     ret = write(fd, "fifo-in", 8);
     g_assert_cmpint(ret, ==, 8);
 
@@ -1253,6 +1280,7 @@ static void char_file_fifo_test(void)
 
     qemu_chr_fe_deinit(&be, true);
 
+fail:
     g_unlink(fifo);
     g_free(fifo);
     g_unlink(out);
@@ -1371,7 +1399,7 @@ static int chardev_change_denied(void *opaque)
 
 static void char_hotswap_test(void)
 {
-    char *chr_args;
+    char *chr_args = NULL;
     Chardev *chr;
     CharBackend be;
 
@@ -1385,6 +1413,9 @@ static void char_hotswap_test(void)
     int port;
     int sock = make_udp_socket(&port);
     g_assert_cmpint(sock, >, 0);
+    if (sock < 0) {
+        goto fail;
+    }
 
     chr_args = g_strdup_printf("udp:127.0.0.1:%d", port);
 
@@ -1422,6 +1453,7 @@ static void char_hotswap_test(void)
     object_unparent(OBJECT(chr));
 
     qapi_free_ChardevReturn(ret);
+fail:
     g_unlink(filename);
     g_free(filename);
     g_rmdir(tmp_path);
-- 
2.20.1


