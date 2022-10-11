Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02785FBC37
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:38:11 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiM0x-0001r5-3E
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWR-0006TQ-3m
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWN-0003nC-7W
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:38 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N32y5-1p9Nwj3EBZ-013LA1; Tue, 11 Oct 2022 22:06:09 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
Subject: [PATCH v11 16/17] tests/qtest: netdev: test stream and dgram backends
Date: Tue, 11 Oct 2022 22:05:38 +0200
Message-Id: <20221011200539.1486809-17-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RJBHOfXCnWbuHXI+J/jOEkoFW7ShFepPBrX3ec7hwHHPGeG8JdK
 rEuxrIG+kTQqx5QaoYMvDd0qhjLIWLsCQfMQ57s7il9o1ZGgoqRj+x+jeg3DNTSlUc89+at
 qE8xOdRU/SFStmsleJoQf+1HpwmZKnb6o/fxwuiqIkLh3NUFw7JD2lt6Yhsl2e5G56dKUpm
 uKIZfev54bXqoILRtYDGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2i6XrCzfqRs=:QHmxzJyycATjMXlf6gT2i+
 7zFkqo751SH3KulzD0sA9WCg5+l4LqdkKP8irk7pO3mkKLY2g2ieQrbN5IaVW3/oUOV6Qj/6C
 V7C0hmxuoorvWoqHzwVcAexAFoeARYTVZXxhq7+LJRSJ1+StDeuW7W8ZfgFId/sytgvMJw/bI
 BF6Ay+t9lnZ+1dj/kBCBuHwkAHYLQawCueBkAKVvQ+z4VuMf0CVKi5AjzzAOaM5scHR3k+OHw
 zQW6TUqnHWVbX4KTJRBS6ouQ5qeqBRcl4kIb1Dsc9+ORDJISugHplKh22e5XNdXVE+c9t55IW
 fKN1e4StGHYc/XXAlWv+bGUyiN+dn4pwT0HJB9JRyAnFAW8doWteHiQRtCnyaz91zRMUj38+q
 4ac2TRoZUP6KLUmypLOFU4Jv25b7vMLdLgsvEWA/1rCDC7DBQRFs8wNWYaal6lEpj3s2eMiF/
 ANcE8voQHDiqTHHG/pekpuNu8bN0wW01G4uijiMnYpoQ9ulgYrKW+HMSJaqHOoOBOafXNgxTH
 2K5vbZkRDwtNh5kYXatRNk9bysGmbWm9jgdgjTK8Ni0qNdcwODuzdvS8jT2KZ3WBiA3lG0JKH
 SUr+0VFgbFNt0UzhIQov2wVJNmEe+dGIwgDatIFw2U5ouSRAXxwtEZscDOBxVuCxEWAgQnEZu
 je6sst00ugwc1e5eb/VKxvrZ5B3FhTORz5D+ZJUoCJ4claQTtQ2+uSnDs6WvgFl7iSc8Dz///
 b78Eft7a6O3Nh5pfHYA1AK/Ke4TnQo2vJLLJOIEMa4iy14xPmT7Pcye/0pa1wXFsKZ5H1HiAJ
 WjX9puI
Received-SPF: permerror client-ip=212.227.126.131;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/meson.build     |   1 +
 tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++++++++++++++
 2 files changed, 418 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e52..464774e7b630 100644
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
index 000000000000..4ea66b4c6988
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,417 @@
+/*
+ * QTest testcase for netdev stream and dgram
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
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
+static int inet_get_free_port_socket(int sock)
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
+static int inet_get_free_port_multiple(int nb, int *port)
+{
+    int sock[nb];
+    int i;
+
+    for (i = 0; i < nb; i++) {
+        sock[i] = socket(AF_INET, SOCK_STREAM, 0);
+        if (sock[i] < 0) {
+            break;
+        }
+        port[i] = inet_get_free_port_socket(sock[i]);
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
+static int inet_get_free_port(void)
+{
+    int nb, port;
+
+    nb = inet_get_free_port_multiple(1, &port);
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
+    unlink(path);
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
+    unlink(path);
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
+    int port[2];
+    int nb;
+
+    nb = inet_get_free_port_multiple(2, port);
+    g_assert_cmpint(nb, ==, 2);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=localhost,local.port=%d,"
+                       "remote.type=inet,remote.host=localhost,remote.port=%d",
+                        port[0], port[1]);
+
+    expect = g_strdup_printf("st0: index=0,type=dgram,"
+                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
+                             port[0], port[1]);
+    EXPECT_STATE(qts0, expect, 0);
+    g_free(expect);
+
+    qts1 = qtest_initf("-nodefaults "
+                       "-netdev dgram,id=st0,"
+                       "local.type=inet,local.host=localhost,local.port=%d,"
+                       "remote.type=inet,remote.host=localhost,remote.port=%d",
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
+    unlink(path0);
+    g_free(path0);
+    unlink(path1);
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
+    closesocket(sv[0]);
+    closesocket(sv[1]);
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


