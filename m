Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82665E818
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:44:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMhK-0007dI-1w; Thu, 05 Jan 2023 04:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDMhH-0007Xx-6s
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:38:03 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDMhE-0004vr-Mp
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:38:02 -0500
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N1xdf-1opOqu2so5-012EFo; Thu, 05 Jan 2023 10:37:54 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Date: Thu,  5 Jan 2023 10:37:51 +0100
Message-Id: <20230105093751.416666-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+hutPXdeJ4Y9Z7VJTGzogoTYOES6mg16Y+rvzCHyhH4Xw6G0ev0
 E1a7Yh2iQsbFNQJY/yawujP8141PP0yXC3Jv/L8VjRChFAFJ6Wv7UZosH73jCdZAKOmCkmN
 VFsp73ChXdkh22rJueAsBVp3Q+N1vYWeW4cUsN2PBmzYrDaI5f3C/37ZrQNEfKoVmTzt4UD
 NXhRUzwqXA496t7gWDr1g==
UI-OutboundReport: notjunk:1;M01:P0:CLrAISoLxOU=;zSKpROVtnlplsIl/dqlfhrrdfUx
 SX7Uq8ZPDjj64Q3BjKaEdjIHWk/G96AR8PnCLlyNKuyRuSxv6Q5jZp4gmoQu6T2/vFA6O9V1R
 U/EdiLv5dKewpMihHy4Yljr/OR5/brCXW0Sm+yt9FojLp+1ZsHMaz1e+49dDz1vTL+nfP2QD1
 lJShcnyiUwsssLJpGIeM/BaKkpyW4a9UwaDOu5HN6Py69B9zoyQLTlzklz4TIY0Eh1kXlMGph
 xZ7Su1wd7LRM7GeQ9A5Tlt17bFdPyNmooItGn/DXKLbSVC2uXeSLQOOTxvTAviU0B5C57KwPp
 Q33eo5eJNEzyCNTQ1wK7bhrY5XxLxyMW2Yx9PKv/357CvPBUY82vlz6YIOdbtT2fz7tHKBNJL
 3AzFwSzAbDU2aPNEARc/fcndBGhezPn7vuomD//EBDJNhIozZrIj04JmtJ24wZ6GPAnDp3jQk
 pREFMZtjbfBnTxd8/hNFBZ2zCKasKH/QquRQtyvirX83ytdRF765xY8leMNtuQJiI/rykWPDg
 d2Q6Ia3qiTHHNYd445O7jp/xmKZrrkPYPs5149co7Un6lH+3tM+1AZ4vK4wf3AQ7j2XpvFEZo
 BbEe0gjcsocq2G3fg2Jfrnkm1qkAl5/hBsOO1cpVn56gUGnBmryn3KiAdEPC+G/pwKHWsPrDU
 tXcwUEVUyYWYqvaa2eFh4lPjC3hWAlZmSUHdMX9pfQ==
Received-SPF: permerror client-ip=217.72.192.74;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes:
    v5:
      - disable test_stream_fd and  test_dgram_fd on windows as socketpair()
        is not defined.
      - enable test_stream_unix_abstract only on linux as "abstract"
        unix socket parameter is only defined on linux.
    
    v4:
      - rework EXPECT_STATE()
      - use g_dir_make_tmp()
    
    v3:
    - Add "-M none" to avoid error:
      "No machine specified, and there is no default"
    
    v2:
    - Fix ipv6 free port allocation
    - Check for IPv4, IPv6, AF_UNIX
    - Use g_mkdtemp() rather than g_file_open_tmp()
    - Use socketpair() in test_stream_fd()
    
    v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
    - use IP addresses 127.0.0.1 and ::1 rather than localhost

 tests/qtest/meson.build     |   2 +
 tests/qtest/netdev-socket.c | 444 ++++++++++++++++++++++++++++++++++++
 2 files changed, 446 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f0ebb5fac603..d752304711e2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -21,6 +21,7 @@ qtests_generic = [
   'test-hmp',
   'qos-test',
   'readconfig-test',
+  'netdev-socket',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
@@ -298,6 +299,7 @@ qtests = {
   'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
+  'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
 }
 
 gvnc = dependency('gvnc-1.0', required: false)
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
new file mode 100644
index 000000000000..a9db9fa06e79
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,444 @@
+/*
+ * QTest testcase for netdev stream and dgram
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "../unit/socket-helpers.h"
+#include "libqtest.h"
+
+#define CONNECTION_TIMEOUT    5
+
+#define EXPECT_STATE(q, e, t)                             \
+do {                                                      \
+    char *resp = NULL;                                    \
+    g_test_timer_start();                                 \
+    do {                                                  \
+        g_free(resp);                                     \
+        resp = qtest_hmp(q, "info network");              \
+        if (t) {                                          \
+            strrchr(resp, t)[0] = 0;                      \
+        }                                                 \
+        if (g_str_equal(resp, e)) {                       \
+            break;                                        \
+        }                                                 \
+    } while (g_test_timer_elapsed() < CONNECTION_TIMEOUT); \
+    g_assert_cmpstr(resp, ==, e);                         \
+    g_free(resp);                                         \
+} while (0)
+
+static gchar *tmpdir;
+
+static int inet_get_free_port_socket_ipv4(int sock)
+{
+    struct sockaddr_in addr;
+    socklen_t len;
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
+    return ntohs(addr.sin_port);
+}
+
+static int inet_get_free_port_socket_ipv6(int sock)
+{
+    struct sockaddr_in6 addr;
+    socklen_t len;
+
+    memset(&addr, 0, sizeof(addr));
+    addr.sin6_family = AF_INET6;
+    addr.sin6_addr = in6addr_any;
+    addr.sin6_port = 0;
+    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
+        return -1;
+    }
+
+    len = sizeof(addr);
+    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
+        return -1;
+    }
+
+    return ntohs(addr.sin6_port);
+}
+
+static int inet_get_free_port_multiple(int nb, int *port, bool ipv6)
+{
+    int sock[nb];
+    int i;
+
+    for (i = 0; i < nb; i++) {
+        sock[i] = socket(ipv6 ? AF_INET6 : AF_INET, SOCK_STREAM, 0);
+        if (sock[i] < 0) {
+            break;
+        }
+        port[i] = ipv6 ? inet_get_free_port_socket_ipv6(sock[i]) :
+                         inet_get_free_port_socket_ipv4(sock[i]);
+        if (port[i] == -1) {
+            break;
+        }
+    }
+
+    nb = i;
+    for (i = 0; i < nb; i++) {
+        closesocket(sock[i]);
+    }
+
+    return nb;
+}
+
+static int inet_get_free_port(bool ipv6)
+{
+    int nb, port;
+
+    nb = inet_get_free_port_multiple(1, &port, ipv6);
+    g_assert_cmpint(nb, ==, 1);
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
+    port = inet_get_free_port(false);
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
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
+    port = inet_get_free_port(true);
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=off,addr.ipv6=on,"
+                       "addr.host=::1,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.ipv4=off,addr.ipv6=on,"
+                       "addr.host=::1,addr.port=%d", port);
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
+
+    path = g_strconcat(tmpdir, "/stream_unix", NULL);
+
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,"
+                       "addr.type=unix,addr.path=%s,",
+                       path);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
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
+#ifdef CONFIG_LINUX
+static void test_stream_unix_abstract(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    gchar *path;
+
+    path = g_strconcat(tmpdir, "/stream_unix_abstract", NULL);
+
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,"
+                       "addr.type=unix,addr.path=%s,"
+                       "addr.abstract=on",
+                       path);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
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
+#endif
+
+#ifndef _WIN32
+static void test_stream_fd(void)
+{
+    QTestState *qts0, *qts1;
+    int sock[2];
+    int ret;
+
+    ret = socketpair(AF_LOCAL, SOCK_STREAM, 0, sock);
+    g_assert_true(ret == 0);
+
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,addr.type=fd,addr.str=%d",
+                       sock[0]);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,unix:\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,addr.type=fd,addr.str=%d",
+                       sock[1]);
+
+    EXPECT_STATE(qts1, "st0: index=0,type=stream,unix:\r\n", 0);
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,unix:\r\n", 0);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+
+    closesocket(sock[0]);
+    closesocket(sock[1]);
+}
+#endif
+
+static void test_dgram_inet(void)
+{
+    QTestState *qts0, *qts1;
+    char *expect;
+    int port[2];
+    int nb;
+
+    nb = inet_get_free_port_multiple(2, port, false);
+    g_assert_cmpint(nb, ==, 2);
+
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=127.0.0.1,local.port=%d,"
+                       "remote.type=inet,remote.host=127.0.0.1,remote.port=%d",
+                        port[0], port[1]);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,"
+                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
+                             port[0], port[1]);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults -M none "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=127.0.0.1,local.port=%d,"
+                       "remote.type=inet,remote.host=127.0.0.1,remote.port=%d",
+                        port[1], port[0]);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,"
+                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
+                             port[1], port[0]);
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
+    qts = qtest_initf("-nodefaults -M none "
+                      "-netdev dgram,id=st0,"
+                      "remote.type=inet,remote.host=230.0.0.1,remote.port=1234");
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
+
+    path0 = g_strconcat(tmpdir, "/dgram_unix0", NULL);
+    path1 = g_strconcat(tmpdir, "/dgram_unix1", NULL);
+
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
+                       "remote.type=unix,remote.path=%s",
+                       path0, path1);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
+                             path0, path1);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults -M none "
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
+    unlink(path0);
+    g_free(path0);
+    unlink(path1);
+    g_free(path1);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+#ifndef _WIN32
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
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
+                       sv[0]);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[0]);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults -M none "
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
+    closesocket(sv[0]);
+    closesocket(sv[1]);
+}
+#endif
+
+int main(int argc, char **argv)
+{
+    int ret;
+    bool has_ipv4, has_ipv6, has_afunix;
+    g_autoptr(GError) err = NULL;
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
+        g_printerr("socket_check_protocol_support() failed\n");
+        goto end;
+    }
+
+    tmpdir = g_dir_make_tmp("netdev-socket.XXXXXX", &err);
+    if (tmpdir == NULL) {
+        g_error("Can't create temporary directory in %s: %s",
+                g_get_tmp_dir(), err->message);
+    }
+
+    if (has_ipv4) {
+        qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
+        qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
+        qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
+    }
+    if (has_ipv6) {
+        qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
+    }
+
+    socket_check_afunix_support(&has_afunix);
+    if (has_afunix) {
+        qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
+        qtest_add_func("/netdev/stream/unix", test_stream_unix);
+#ifdef CONFIG_LINUX
+        qtest_add_func("/netdev/stream/unix/abstract",
+                       test_stream_unix_abstract);
+#endif
+#ifndef _WIN32
+        qtest_add_func("/netdev/stream/fd", test_stream_fd);
+        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
+#endif
+    }
+
+end:
+    ret = g_test_run();
+
+    g_rmdir(tmpdir);
+    g_free(tmpdir);
+
+    return ret;
+}
-- 
2.39.0


