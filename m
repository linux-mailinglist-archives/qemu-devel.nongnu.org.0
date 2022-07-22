Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3757E72C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:17:45 +0200 (CEST)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy9g-0003BT-Px
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxy-00073z-49
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:39 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxw-0005Ic-22
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:37 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MnaY1-1nplcs3Q1N-00jXkP; Fri, 22 Jul 2022 21:05:00 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 14/14] tests/qtest: netdev: test stream and dgram backends
Date: Fri, 22 Jul 2022 21:04:42 +0200
Message-Id: <20220722190442.301310-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ELY4IKiVQiAkd7e4bRFEdVTjMz1ixhJ2mA4Y0dgHHXFBrfDK49z
 QHKzBcyxbp4JqUwY5hjJwXWPpURVVGjqHGOg8mc6HvxmhEp+xYU860usP9eetfsADOoMdy/
 ltyZZANuGmd3gFBVCUwkgLXH2RuDRw18e7KEmScXy83sddQKuZbuJQt8KrIarfCbr+JWsVK
 Sx/UHJOpvd+m9wuLb/Lqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rdE+B56JoU0=:Id8P2qntOdeHfX8FOo3X1Z
 ruOTtAO2yDGueRBpugwYyM+56fMkGsJ8B8rmYqCBxLJkimCfU/Jq/uN9rCHaMZf91oW6D5lin
 CUep1M/4kbJFRtMUvdJEtdVhMZSepLtx6pfCYsnoj9k0USytSA6uEM0pJP2Ck4GLspiKbfz6I
 AoSVC0FWPFjKICqRKahcsfg2RRUnOaSaq7B5AceAnvMyuBoxaTybbyDz4vDxCRwfllWfhXx2b
 yiB7n1M9hBdFj0LptFE7hPi8jC3XRYVR/6cyIdrnnKXgd+wta4teM9e4O3KkLWhC8QGXyZ+qr
 PyFWjEzRX1MEgKcfuKI4UgSuh4wcpE++AZgPoM9QaxgA+3xE+NTJfAHdfPjWoQuD+I5m7DOfC
 xY6o3VAN6JCAUL7Fl6UEJv78R1MaYmzCyIjuXtSAizhT5REQP5mM6hxTs6HRHwweNQ60UPPJ5
 VvZ38yaR/B5PS8pQxAme3ESuEy1jwN1/KSuM56XQK3zmYYbhYd8DNZtxELMwKUE/FmeSI6/9L
 Pm/DiAJanqb+O8yAfaIYTNwDOmiAOuKZX8iclkK2wEieOzEx88HAK6Iv6wtcjlzo4Tx9exn+q
 OJji2BZVGE5YqGX7VA/Ok7igKuDq+tvRgorDwnvJCowbFJX5178JbbkMIhLa5X4ATOpE+khaO
 ipLkT2bmGePgUZbwp99Rfjs6RksHEKU1zNo7xe8YhQQ4ESOCdMEQ11N4QK/PLNRFKaCpdV2x8
 TJyxQ4G6PpjOdrS1O13dJkXVUpDgRJiX1CkXNg==
Received-SPF: permerror client-ip=212.227.126.135;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/meson.build     |   1 +
 tests/qtest/netdev-socket.c | 322 ++++++++++++++++++++++++++++++++++++
 2 files changed, 323 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3a474010e49f..b0790873ecbf 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -26,6 +26,7 @@ qtests_generic = [
   'qom-test',
   'test-hmp',
   'qos-test',
+  'netdev-socket',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
new file mode 100644
index 000000000000..bceb30718812
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,322 @@
+/*
+ * QTest testcase for netdev stream and dgram
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <glib.h>
+#include "libqtest.h"
+
+#define CONNECTION_TIMEOUT    5
+
+#define EXPECT_STATE(q, e, t)                             \
+do {                                                      \
+    char *resp = qtest_hmp(q, "info network");            \
+    if (t) {                                              \
+        strrchr(resp, t)[0] = 0;                          \
+    }                                                     \
+    g_test_timer_start();                                 \
+    while (g_test_timer_elapsed() < CONNECTION_TIMEOUT) { \
+        if (strcmp(resp, e) == 0) {                       \
+            break;                                        \
+        }                                                 \
+        g_free(resp);                                     \
+        resp = qtest_hmp(q, "info network");              \
+        if (t) {                                          \
+            strrchr(resp, t)[0] = 0;                      \
+        }                                                 \
+    }                                                     \
+    g_assert_cmpstr(resp, ==, e);                         \
+    g_free(resp);                                         \
+} while (0)
+
+static int inet_get_free_port(void)
+{
+    int sock;
+    struct sockaddr_in addr;
+    socklen_t len;
+    int port;
+
+    sock = socket(AF_INET, SOCK_STREAM, 0);
+    if (sock < 0) {
+        return -1;
+    }
+
+    memset(&addr, 0, sizeof(addr));
+    addr.sin_family = AF_INET;
+    addr.sin_addr.s_addr = INADDR_ANY;
+    addr.sin_port = 0;
+    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
+        return -1;
+    }
+
+    len = sizeof(addr);
+    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
+        return -1;
+    }
+
+    port = ntohs(addr.sin_port);
+
+    close(sock);
+
+    return port;
+}
+
+static void test_stream_inet(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int port;
+
+    port = inet_get_free_port();
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=inet,"
+                       "addr.host=localhost,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.host=localhost,addr.port=%d", port);
+
+    expect = g_strdup_printf("st0: index=0,type=stream,tcp:127.0.0.1:%d\r\n",
+                             port);
+    EXPECT_STATE(qts1, expect, 0);
+    g_free(expect);
+
+    /* the port is unknown, check only the address */
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:127.0.0.1", ':');
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+static void test_stream_unix(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    gchar *path;
+    int ret;
+
+    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=unix,addr.path=%s",
+                       path);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=false,addr.type=unix,addr.path=%s",
+                       path);
+
+    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
+    EXPECT_STATE(qts1, expect, 0);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+    g_free(path);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+static void test_stream_fd(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int ret, sock0, sock1;
+    struct sockaddr_un addr;
+    gchar *path;
+
+    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+    addr.sun_family = AF_UNIX;
+    strcpy(addr.sun_path, path);
+
+    unlink(addr.sun_path);
+    sock0 = socket(AF_LOCAL, SOCK_STREAM, 0);
+    g_assert_cmpint(sock0, !=, -1);
+
+    ret = bind(sock0, (struct sockaddr *)&addr, sizeof(addr));
+    g_assert_cmpint(ret, !=, -1);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=fd,addr.str=%d",
+                       sock0);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    sock1 = socket(AF_LOCAL, SOCK_STREAM, 0);
+    g_assert_cmpint(sock1, !=, -1);
+
+    ret = connect(sock1, (struct sockaddr *)&addr, sizeof(addr));
+    g_assert_cmpint(ret, !=, -1);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=off,addr.type=fd,addr.str=%d",
+                       sock1);
+
+
+    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
+    EXPECT_STATE(qts1, expect, 0);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+
+    closesocket(sock0);
+    closesocket(sock1);
+
+    g_free(path);
+}
+
+static void test_dgram_inet(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int port0, port1;
+
+    port0 = inet_get_free_port();
+    port1 = inet_get_free_port();
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=localhost,local.port=%d,"
+                       "remote.type=inet,remote.host=localhost,remote.port=%d",
+                        port0, port1);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,"
+                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n", port0, port1);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=localhost,local.port=%d,"
+                       "remote.type=inet,remote.host=localhost,remote.port=%d",
+                        port1, port0);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,"
+                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n", port1, port0);
+    EXPECT_STATE(qts1, expect, 0);
+    g_free(expect);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+static void test_dgram_mcast(void)
+{
+    QTestState *qts;
+
+    qts = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,"
+                       "remote.type=inet,remote.host=230.0.0.1,remote.port=1234");
+
+    EXPECT_STATE(qts, "st0: index=0,type=dgram,mcast=230.0.0.1:1234\r\n", 0);
+
+    qtest_quit(qts);
+}
+
+static void test_dgram_unix(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    gchar *path0, *path1;
+    int ret;
+
+    ret = g_file_open_tmp("netdev-XXXXXX", &path0, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+
+    ret = g_file_open_tmp("netdev-XXXXXX", &path1, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
+                       "remote.type=unix,remote.path=%s",
+                       path0, path1);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
+                             path0, path1);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
+                       "remote.type=unix,remote.path=%s",
+                       path1, path0);
+
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
+                             path1, path0);
+    EXPECT_STATE(qts1, expect, 0);
+    g_free(expect);
+
+    g_free(path0);
+    g_free(path1);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+static void test_dgram_fd(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int ret;
+    int sv[2];
+
+    ret = socketpair(PF_UNIX, SOCK_DGRAM, 0, sv);
+    g_assert_cmpint(ret, !=, -1);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
+                       sv[0]);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[0]);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
+                       sv[1]);
+
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[1]);
+    EXPECT_STATE(qts1, expect, 0);
+    g_free(expect);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+
+    close(sv[0]);
+    close(sv[1]);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/netdev/stream/inet", test_stream_inet);
+    qtest_add_func("/netdev/stream/unix", test_stream_unix);
+    qtest_add_func("/netdev/stream/fd", test_stream_fd);
+    qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
+    qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
+    qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
+    qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
+
+    ret = g_test_run();
+
+    return ret;
+}
-- 
2.37.1


