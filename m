Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDCD620831
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 05:20:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osG5U-0000Ex-2s; Mon, 07 Nov 2022 23:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5Q-0000Dy-Vk
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5O-0004M4-RY
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667881182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4rwTbx0Jx9+U35B/T3F/MuX1VBcp4D+gBRZpEwH85I=;
 b=J2NUTrLkI0oG+p/bhZlfzrYsX2B9x53WqtUIbDK6jn17FxWfqlJvfct0WQQBabKHqkFSDU
 efjKLxutz+T622b4sz7f7Cl0GpCKO87SG2rCfo/Ql+nm/S/BNzrTYf0Axh4ehE4KbLeEfj
 TvqJfKdyuMTnLy34Sp/gUTy94gX4Z90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-2g4WXc6nMc-qy_n1ta6C8Q-1; Mon, 07 Nov 2022 23:19:39 -0500
X-MC-Unique: 2g4WXc6nMc-qy_n1ta6C8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DD2C833A06
 for <qemu-devel@nongnu.org>; Tue,  8 Nov 2022 04:19:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-19.pek2.redhat.com [10.72.14.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17E40112132D;
 Tue,  8 Nov 2022 04:19:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 2/2] tests/qtest: netdev: test stream and dgram backends
Date: Tue,  8 Nov 2022 12:19:29 +0800
Message-Id: <20221108041929.18417-3-jasowang@redhat.com>
In-Reply-To: <20221108041929.18417-1-jasowang@redhat.com>
References: <20221108041929.18417-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Laurent Vivier <lvivier@redhat.com>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 tests/qtest/meson.build     |   2 +
 tests/qtest/netdev-socket.c | 435 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 437 insertions(+)
 create mode 100644 tests/qtest/netdev-socket.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1..43d075b 100644
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
@@ -304,6 +305,7 @@ qtests = {
   'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
+  'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
 }
 
 gvnc = dependency('gvnc-1.0', required: false)
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
new file mode 100644
index 0000000..dd46214
--- /dev/null
+++ b/tests/qtest/netdev-socket.c
@@ -0,0 +1,435 @@
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
+static char *tmpdir;
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
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
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
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=off,addr.ipv6=on,"
+                       "addr.host=::1,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
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
+
+    path = g_strconcat(tmpdir, "/stream_unix_abstract", NULL);
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
+    g_free(path);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
+static void test_stream_fd(void)
+{
+    QTestState *qts0, *qts1;
+    int sock[2];
+    int ret;
+
+    ret = socketpair(AF_LOCAL, SOCK_STREAM, 0, sock);
+    g_assert_true(ret == 0);
+
+    qts0 = qtest_initf("-nodefaults "
+                       "-netdev stream,id=st0,addr.type=fd,addr.str=%d",
+                       sock[0]);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,unix:\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults "
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
+    qts0 = qtest_initf("-nodefaults "
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
+    qts1 = qtest_initf("-nodefaults "
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
+
+    path0 = g_strconcat(tmpdir, "/dgram_unix0", NULL);
+    path1 = g_strconcat(tmpdir, "/dgram_unix1", NULL);
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
+    bool has_ipv4, has_ipv6, has_afunix;
+    gchar dir[] = "/tmp/netdev-socket.XXXXXX";
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
+        g_printerr("socket_check_protocol_support() failed\n");
+        goto end;
+    }
+
+    if (g_mkdtemp(dir) == NULL) {
+        g_error("g_mkdtemp: %s", g_strerror(errno));
+    }
+    tmpdir = dir;
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
+        qtest_add_func("/netdev/stream/unix/abstract",
+                       test_stream_unix_abstract);
+        qtest_add_func("/netdev/stream/fd", test_stream_fd);
+        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
+    }
+
+end:
+    ret = g_test_run();
+
+    g_rmdir(dir);
+
+    return ret;
+}
-- 
2.7.4


