Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E067158D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fl-00021U-0d; Wed, 18 Jan 2023 02:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fd-0001wz-5Z; Wed, 18 Jan 2023 02:52:53 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fb-000265-CJ; Wed, 18 Jan 2023 02:52:52 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MAwTn-1pSkV221sX-00BKjO; Wed, 18
 Jan 2023 08:52:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Guoyi Tu <tugy@chinatelecom.cn>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/15] Call qemu_socketpair() instead of socketpair() when
 possible
Date: Wed, 18 Jan 2023 08:52:20 +0100
Message-Id: <20230118075234.2322131-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gQP3ayBzPx9nHkCIa0cm7mnb4dTQyeyhSUSk/nOePNpd2zLxyy1
 B0/Yp2OGAim5TK0Kiuv4/96eYnXayFSVb4cLJlkmsZLSF4GP1vbzT+QkXOF486aMgRBenWP
 Jzoiexkr7hOZjD/qTNxeyArh4CpaJQkr5naNr/RhGXb7nEemHnvmJh40vvbcT9Mz00Nv7nQ
 8g/Srqt9YT2hK5EE2Y2bw==
UI-OutboundReport: notjunk:1;M01:P0:YS1YaluTzGs=;a8tIbdAm4iVA+p5ZXeNI7A8PZ6Y
 U2TmNCO7p8YG8e9WRwLNE+4BsW+PNLlfAMiUgMDusqGwxouSCDUo1PZZeeRFfbtD+r28oWX+Y
 mwHm9PJf5EqrykibG4GBEmE4pbZ5XvHBRqSsCBrYb9LoEu1XZUAqGsmd3fxcKw2dW0DNGy+iV
 75wtScKmmwR/JIQIepNay3ACPBr4SZvq+K18zgEAuhGrPI0FKpdmsr9FTgvzPgKDFLfkg0TlC
 mJ0fpQazU+eeVi3FgCVOLmTMr757QVp/ltp8z9NDd/jO7jkbUhOF7Unh55J/UvA+w4uJtVcxl
 I3vAIcuDnInInnSaV/0i9Sp7qvdaPd2yJsosN9cTJLkSBPq/dagH6MUTwJ5+l5VMANuZZrg+H
 DWZvBGUDogTc9vzjuAVWIYvMVcBrdXDGOkeeBFOf6yo1uNA+63oF+4ug9bDccyEO/oeXx9jUJ
 av4DTPBPTyX652Q8sJYjBNSUOjqE5ceD1GnZrXnVVf/C1pXaj4L4s0zGL5EP0uYCEpdiUQSoi
 8z/yFe+N/ygMO37g23i1UiAvh4yJg/p7t/enAFVet+PwYOpG2erNOwebVAITaQvA085boI0nP
 5pfL+wUftUn1JoZuvOg928wJges5ZGrlSgtMZtXnHzJWGlznWQStXcfoWO/bAKsTvxipBPBkv
 MzWgDnp8RJfFWrmMvxEpeSh/eF+CUzS6HK9e49h0mw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Guoyi Tu <tugy@chinatelecom.cn>

As qemu_socketpair() was introduced in commit 3c63b4e9
("oslib-posix: Introduce qemu_socketpair()"), it's time
to replace the other existing socketpair() calls with
qemu_socketpair() if possible

Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 backends/tpm/tpm_emulator.c         | 2 +-
 tests/qtest/dbus-display-test.c     | 5 +++--
 tests/qtest/migration-test.c        | 2 +-
 tests/unit/test-crypto-tlssession.c | 4 ++--
 tests/unit/test-io-channel-tls.c    | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 49cc3d749dc4..67e7b212e3eb 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -553,7 +553,7 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
     Error *err = NULL;
     int fds[2] = { -1, -1 };
 
-    if (socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
+    if (qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
         error_report("tpm-emulator: Failed to create socketpair");
         return -1;
     }
diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
index cb1b62d1d11a..fef025ac6f83 100644
--- a/tests/qtest/dbus-display-test.c
+++ b/tests/qtest/dbus-display-test.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/dbus.h"
+#include "qemu/sockets.h"
 #include <gio/gio.h>
 #include <gio/gunixfdlist.h>
 #include "libqtest.h"
@@ -36,7 +37,7 @@ test_setup(QTestState **qts, GDBusConnection **conn)
 
     *qts = qtest_init("-display dbus,p2p=yes -name dbus-test");
 
-    g_assert_cmpint(socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
+    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
 
     qtest_qmp_add_client(*qts, "@dbus-display", pair[1]);
 
@@ -152,7 +153,7 @@ test_dbus_display_console(void)
 
     test_setup(&qts, &conn);
 
-    g_assert_cmpint(socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
+    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
     fd_list = g_unix_fd_list_new();
     idx = g_unix_fd_list_append(fd_list, pair[1], NULL);
 
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dbde726adf8c..1dd32c9506bf 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1661,7 +1661,7 @@ static void *test_migrate_fd_start_hook(QTestState *from,
     int pair[2];
 
     /* Create two connected sockets for migration */
-    ret = socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
+    ret = qemu_socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
     g_assert_cmpint(ret, ==, 0);
 
     /* Send the 1st socket to the target */
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 615a1344b4aa..b12e7b687927 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -82,7 +82,7 @@ static void test_crypto_tls_session_psk(void)
     int ret;
 
     /* We'll use this for our fake client-server connection */
-    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
+    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
     g_assert(ret == 0);
 
     /*
@@ -236,7 +236,7 @@ static void test_crypto_tls_session_x509(const void *opaque)
     int ret;
 
     /* We'll use this for our fake client-server connection */
-    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
+    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
     g_assert(ret == 0);
 
     /*
diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
index cc39247556f3..e036ac5df4c2 100644
--- a/tests/unit/test-io-channel-tls.c
+++ b/tests/unit/test-io-channel-tls.c
@@ -121,7 +121,7 @@ static void test_io_channel_tls(const void *opaque)
     GMainContext *mainloop;
 
     /* We'll use this for our fake client-server connection */
-    g_assert(socketpair(AF_UNIX, SOCK_STREAM, 0, channel) == 0);
+    g_assert(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel) == 0);
 
 #define CLIENT_CERT_DIR "tests/test-io-channel-tls-client/"
 #define SERVER_CERT_DIR "tests/test-io-channel-tls-server/"
-- 
2.38.1


