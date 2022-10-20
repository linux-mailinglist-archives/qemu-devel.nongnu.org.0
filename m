Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81070606653
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:55:16 +0200 (CEST)
Received: from localhost ([::1]:58260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYoz-0003hA-JM
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYm0-0008WA-Vk
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNb-0004wk-Ve
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:51 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-000779-1m
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:47 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYcy3-1oYVYO23Up-00Vkno; Thu, 20 Oct 2022 18:26:27 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 16/17] tests/qtest: netdev: test stream and dgram backends
Date: Thu, 20 Oct 2022 18:25:57 +0200
Message-Id: <20221020162558.123284-17-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2TkO8HwXWf9ftf8jPKztPVZUAxh6b+tjdZhYjI04Ji1m3onfpEK
 vVNmaEsLn6rTxZAauthInJVkXDokkdhe1Zph5BJoBpsjhkbRRNhszS0PXfUhP4wouQDgHxm
 XzjWk4w+4s65huCf+K0KDnS2b8D2PxBJhGrk4jnVWGzbemNNbxUFJ9hyROxNYqZM6XAwEl5
 uHuMgfth6JvMY6hnBUchA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nru0hOzSwek=:H1RlbFiE/qc1dAzkf+vCMe
 t9u46DIydMVcCAtG7WfTH6kXjm58hAxhot7qQhYpcBS5Ij0hVW+Z1xoszt/uEYWK2oqvpSMrE
 20+vMHvoXOJVF+M96g01Mw9dzP70BC+8l0sa2ACeRwS4nI4hxziAU9aJkLnbRlBHleZ67pG2V
 esBk7TX4Rfm11aVo6CuLMsCUfps0GFlAxbGg+7u7c7qfR7EYpnRBaBlsaWwSe8BocaR9mHBaE
 qLVsCwPr6Xm03MWX4TDoYGWOh5mvftphHAGRhqZGloijp0wn1bqSKk0pgm/HVu1gSc7knMR+I
 Ay/1KRUKnD5MaB45tGc6PgVQRBm86M7vZ74C4bU4FQcQL1bwAG/GITQKo/SvmG12FnxUGS2vH
 7Bm3coOOYnKBZgW5XSETjnSTO/j4g4EgpWfhT0kiEI++vEB5tV+EN27axCtxlhRuc4bHvpmM3
 +QkyY6Nc8141GMpQJCS8QVJqvfUfJ5Un3ABM+a9u8U3eSMUwq3jQaDBZe3LLdJg/+w/3QI2DP
 aTp56Wi+pLdE+6P5efJNymBf3DPEwPkD2/YTc5a2BEjZO9oLdxecocWrTgM3EZ/QTNg5uHbjX
 2f/ERsRgEYcdg1WPBBoUX2wKacDYDTTwbvcW5esKaw/nmjchfrkEBT41OGW1i4tybzuDtHjJY
 /gA/95hFNscCKvMUTX6aeqPGOlcBdvE2M5G+UoVKyK4oAHplx/nO6eBiN84rgx2raE+pNKiuT
 01W97lKHHN3XxM2rPh6cBpoaXzz0TwCRKXWW6l8hhxir/GgamJMkkYCXY3hrTtXRG0SQNckzF
 kuN3QFA
Received-SPF: permerror client-ip=212.227.126.134;
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
 tests/qtest/netdev-socket.c | 420 ++++++++++++++++++++++++++++++++++++
 2 files changed, 421 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f43..6953797e4e3e 100644
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
index 000000000000..b24c0819b9ac
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,420 @@
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
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
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
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
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
+                       "-netdev stream,id=st0,server=true,"
+                       "addr.type=unix,addr.path=%s,",
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
+                       "-netdev stream,id=st0,server=true,"
+                       "addr.type=unix,addr.path=%s,"
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
+                       "-netdev stream,id=st0,server=true,"
+                       "addr.type=fd,addr.str=%d",
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
+                       "-netdev stream,id=st0,server=false,addr.type=fd,addr.str=%d",
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


