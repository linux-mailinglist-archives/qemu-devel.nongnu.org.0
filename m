Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288066B6C8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 06:09:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHHid-0008SL-F8; Mon, 16 Jan 2023 00:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1pHHhT-0008AW-LS
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 00:06:28 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1pHHhR-0003fz-3j
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 00:06:27 -0500
HMM_SOURCE_IP: 172.18.0.188:33770.699130998
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.112.59.73 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 68A152800BA;
 Mon, 16 Jan 2023 12:55:58 +0800 (CST)
X-189-SAVE-TO-SEND: tugy@chinatelecom.cn
Received: from  ([118.112.59.73])
 by app0023 with ESMTP id ca97a587985c4f7aa81acc83264901a8 for
 stefanb@linux.vnet.ibm.com; Mon, 16 Jan 2023 12:56:19 CST
X-Transaction-ID: ca97a587985c4f7aa81acc83264901a8
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 118.112.59.73
X-MEDUSA-Status: 0
Message-ID: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
Date: Mon, 16 Jan 2023 12:56:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
From: Guoyi Tu <tugy@chinatelecom.cn>
Subject: Call qemu_socketpair() instead of socketpair() when possible
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.219; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

As qemu_socketpair() was introduced in commit 3c63b4e9
("oslib-posix: Introduce qemu_socketpair()"), it's time
to replace the other existing socketpair() calls with
qemu_socketpair() if possible

Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
  backends/tpm/tpm_emulator.c         | 2 +-
  tests/qtest/dbus-display-test.c     | 5 +++--
  tests/qtest/migration-test.c        | 2 +-
  tests/unit/test-crypto-tlssession.c | 4 ++--
  tests/unit/test-io-channel-tls.c    | 2 +-
  5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 49cc3d749d..67e7b212e3 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -553,7 +553,7 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator 
*tpm_emu)
      Error *err = NULL;
      int fds[2] = { -1, -1 };

-    if (socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
+    if (qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
          error_report("tpm-emulator: Failed to create socketpair");
          return -1;
      }
diff --git a/tests/qtest/dbus-display-test.c 
b/tests/qtest/dbus-display-test.c
index cb1b62d1d1..fef025ac6f 100644
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
index dbde726adf..1dd32c9506 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1661,7 +1661,7 @@ static void *test_migrate_fd_start_hook(QTestState 
*from,
      int pair[2];

      /* Create two connected sockets for migration */
-    ret = socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
+    ret = qemu_socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
      g_assert_cmpint(ret, ==, 0);

      /* Send the 1st socket to the target */
diff --git a/tests/unit/test-crypto-tlssession.c 
b/tests/unit/test-crypto-tlssession.c
index 615a1344b4..b12e7b6879 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -82,7 +82,7 @@ static void test_crypto_tls_session_psk(void)
      int ret;

      /* We'll use this for our fake client-server connection */
-    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
+    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
      g_assert(ret == 0);

      /*
@@ -236,7 +236,7 @@ static void test_crypto_tls_session_x509(const void 
*opaque)
      int ret;

      /* We'll use this for our fake client-server connection */
-    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
+    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
      g_assert(ret == 0);

      /*
diff --git a/tests/unit/test-io-channel-tls.c 
b/tests/unit/test-io-channel-tls.c
index cc39247556..e036ac5df4 100644
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
2.25.1



