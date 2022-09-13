Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C85B6863
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:10:20 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY03n-0003As-01
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg0-0000g4-MA
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfm-0004A3-Gi
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:38 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2jO8-1pJSt537C0-0139ec; Tue, 13 Sep 2022 08:40:20 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v8 14/14] tests/qtest: netdev: test stream and dgram backends
Date: Tue, 13 Sep 2022 08:40:00 +0200
Message-Id: <20220913064000.79353-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lJEDZu2hMkuRNTDiX9w+LSlFaWJ3XVh54cVHBPOH8P14C8Fmymr
 vPmnc0azsjgv8CCTRK6t4ZwYJH41sAPrhelIxvjYUppkbldbtfLyWZiJvBzcQJjfGOxDij+
 W8PZfwLL7OEAMTalO6gkDtPCDOqTO2uE/sBZY/sLVo+tMImOJqaI1LgQ41S59qqwwn+DtFb
 x2XHKzXM7qZp3EH2qzZjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RBktr469wLQ=:1hqmapBJTlvk3iKQMKrAVa
 93BYSpx4f48UaU49BobaYLFgpmdUivwoVBQb7cSTh9Gmda1gV1y2xN6VpHBSWQnETN4wPBmzn
 JSJofHM/otrGy8QReMo082w3DcfkM96XDMx8PD910/hs5dr1UXKcC5ck+dsmAcByp9KxI4opT
 2A18iQbFS2ELGzcVDWUD6+pxOfTK7OR5vvVjrdDJ3ykBtxB4WBx1n4jlCvmcb3Q+OGhaO5rTH
 ySNVWMH58/5zWacaV40Gczb4mNOY4ug/vup17qZ5cQfNpcA2YrtpvpovG3jHMS/Y6sDG3u0As
 ryh2BHxJNLd9bTIWVDpmgKh9egnle7NpxBX8EZTfH3KhH2CTkcZARQpuSRxb+Z7fvD+mCsVZA
 7saQt217yOKBVXolL9xwLjbV+lRk9NYA1mv2v9wpxpPvi8Qv6+v2mBmnZp8xYpdXydbhlldUq
 wzAxChAk55/+97mtTyhxcXKipA0bg+1tvKnspwDGmjKt4sa7g+ooY+0wh4M2ltIVU1ClKv7XV
 tDT42PBW3BnPI3v4GQ8pjzvQsWR8ihBDnz/iql5W9dbLB2e/JuNqMkv8EobuxpQeXw7n/8C6Q
 nRqUd6FuHC8YPtsSYBOlahxSGuVTkDQYeQO48npjlMN2ibUCeWtRAyjUIgU17hTn0rIHrMdA+
 x7YdCzQPyDNKuKIgEt2hkxsOvfpr165VHJ58wQNtr9w/VN7c24c7Lo/M47jiY0r6ZcozGky5F
 3hy6znz76uG7vfuGpZr5t1pbemsliOTapeCNtP0MleSaRpSIAuDSmPl/Go3eeGLNPi+YIDTIF
 lWN2yFE
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001,
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
 tests/qtest/netdev-socket.c | 391 ++++++++++++++++++++++++++++++++++++
 2 files changed, 392 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e910cb32ca15..38ee8b7a2d56 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -27,6 +27,7 @@ qtests_generic = [
   'test-hmp',
   'qos-test',
   'readconfig-test',
+  'netdev-socket',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
new file mode 100644
index 000000000000..55e0c07f18ec
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,391 @@
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
+static void test_stream_inet_ipv4(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int port;
+
+    port = inet_get_free_port();
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=localhost,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
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
+static void test_stream_inet_ipv6(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int port;
+
+    port = inet_get_free_port();
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=inet,"
+                       "addr.ipv4=off,addr.ipv6=on,"
+                       "addr.host=localhost,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.ipv4=off,addr.ipv6=on,"
+                       "addr.host=localhost,addr.port=%d", port);
+
+    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
+                             port);
+    EXPECT_STATE(qts1, expect, 0);
+    g_free(expect);
+
+    /* the port is unknown, check only the address */
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
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
+                       "-netdev stream,id=st0,addr.type=unix,addr.path=%s,",
+                       path);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=false,"
+                       "addr.type=unix,addr.path=%s",
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
+static void test_stream_unix_abstract(void)
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
+                       "-netdev stream,id=st0,addr.type=unix,addr.path=%s,"
+                       "addr.abstract=on",
+                       path);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=false,"
+                       "addr.type=unix,addr.path=%s,addr.abstract=on",
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
+    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
+    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
+    qtest_add_func("/netdev/stream/unix", test_stream_unix);
+    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
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
2.37.3


