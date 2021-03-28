Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7C34BE67
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:56:35 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaaQ-00064v-Ig
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaRK-0003Py-Nz
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaRG-0001Wx-AQ
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616957222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pckDNNN5vJXs1qB1WPSj1cWohtFLfGRTEovAVaeE5rk=;
 b=cOaDBrHukRWXT0Mj4uF+BIPVHjLzkeCBg917LZ1EYiv4H4ynFgp1rBLZWi5HJFbOM5aVE3
 ai34Qs5MYPjrHDEA7msZ6fGhPEXEJDbTE09a4EOYC6G7/eAP+aO5oewAQaBPC3irI4JTAk
 4Kvkuy1gVXbGo2ySrJd3TCM5chMZfzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-vzCBvVbJOTOFg8w8OiVhBw-1; Sun, 28 Mar 2021 14:46:59 -0400
X-MC-Unique: vzCBvVbJOTOFg8w8OiVhBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27CF3802B5B;
 Sun, 28 Mar 2021 18:46:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 512A960853;
 Sun, 28 Mar 2021 18:46:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] tests: Add tests for yank with the chardev-change case
Date: Sun, 28 Mar 2021 22:45:33 +0400
Message-Id: <20210328184533.752840-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210328184533.752840-1-marcandre.lureau@redhat.com>
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Add tests for yank with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
Message-Id: <7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d.1616794852.git.lukasstraub2@web.de>
---
 tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 3 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-yank.c

diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
new file mode 100644
index 0000000000..1596a3b98e
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,200 @@
+/*
+ * Tests for QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "qemu/config-file.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-char.h"
+#include "qapi/qapi-types-char.h"
+#include "qapi/qapi-commands-yank.h"
+#include "qapi/qapi-types-yank.h"
+#include "io/channel-socket.h"
+#include "socket-helpers.h"
+
+typedef struct {
+    SocketAddress *addr;
+    bool old_yank;
+    bool new_yank;
+    bool fail;
+} CharChangeTestConfig;
+
+static int chardev_change(void *opaque)
+{
+    return 0;
+}
+
+static bool is_yank_instance_registered(void)
+{
+    YankInstanceList *list;
+    bool ret;
+
+    list = qmp_query_yank(&error_abort);
+
+    ret = !!list;
+
+    qapi_free_YankInstanceList(list);
+
+    return ret;
+}
+
+static void char_change_test(gconstpointer opaque)
+{
+    CharChangeTestConfig *conf = (gpointer) opaque;
+    SocketAddress *addr;
+    Chardev *chr;
+    CharBackend be;
+    ChardevReturn *ret;
+    QIOChannelSocket *ioc;
+
+    /*
+     * Setup a listener socket and determine its address
+     * so we know the TCP port for the client later
+     */
+    ioc = qio_channel_socket_new();
+    g_assert_nonnull(ioc);
+    qio_channel_socket_listen_sync(ioc, conf->addr, 1, &error_abort);
+    addr = qio_channel_socket_get_local_address(ioc, &error_abort);
+    g_assert_nonnull(addr);
+
+    ChardevBackend backend[2] = {
+        /* doesn't support yank */
+        { .type = CHARDEV_BACKEND_KIND_NULL },
+        /* supports yank */
+        {
+            .type = CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data = &(ChardevSocket) {
+                .addr = &(SocketAddressLegacy) {
+                    .type = SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data = &addr->u.inet
+                },
+                .has_server = true,
+                .server = false
+            }
+        } };
+
+    ChardevBackend fail_backend[2] = {
+        /* doesn't support yank */
+        {
+            .type = CHARDEV_BACKEND_KIND_UDP,
+            .u.udp.data = &(ChardevUdp) {
+                .remote = &(SocketAddressLegacy) {
+                    .type = SOCKET_ADDRESS_LEGACY_KIND_UNIX,
+                    .u.q_unix.data = &(UnixSocketAddress) {
+                        .path = (char *)""
+                    }
+                }
+            }
+        },
+        /* supports yank */
+        {
+            .type = CHARDEV_BACKEND_KIND_SOCKET,
+            .u.socket.data = &(ChardevSocket) {
+                .addr = &(SocketAddressLegacy) {
+                    .type = SOCKET_ADDRESS_LEGACY_KIND_INET,
+                    .u.inet.data = &(InetSocketAddress) {
+                        .host = (char *)"127.0.0.1",
+                        .port = (char *)"0"
+                    }
+                },
+                .has_server = true,
+                .server = false
+            }
+        } };
+
+    g_assert(!is_yank_instance_registered());
+
+    ret = qmp_chardev_add("chardev", &backend[conf->old_yank], &error_abort);
+    qapi_free_ChardevReturn(ret);
+    chr = qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(is_yank_instance_registered() == conf->old_yank);
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    qemu_chr_fe_init(&be, chr, &error_abort);
+    /* allow chardev-change */
+    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+                             NULL, chardev_change, NULL, NULL, true);
+
+    if (conf->fail) {
+        g_setenv("QTEST_SILENT_ERRORS", "1", 1);
+        ret = qmp_chardev_change("chardev", &fail_backend[conf->new_yank],
+                                 NULL);
+        g_assert_null(ret);
+        g_assert(be.chr == chr);
+        g_assert(is_yank_instance_registered() == conf->old_yank);
+        g_unsetenv("QTEST_SILENT_ERRORS");
+    } else {
+        ret = qmp_chardev_change("chardev", &backend[conf->new_yank],
+                                 &error_abort);
+        g_assert_nonnull(ret);
+        g_assert(be.chr != chr);
+        g_assert(is_yank_instance_registered() == conf->new_yank);
+    }
+
+    object_unparent(OBJECT(be.chr));
+    object_unref(OBJECT(ioc));
+    qapi_free_ChardevReturn(ret);
+    qapi_free_SocketAddress(addr);
+}
+
+static SocketAddress tcpaddr = {
+    .type = SOCKET_ADDRESS_TYPE_INET,
+    .u.inet.host = (char *)"127.0.0.1",
+    .u.inet.port = (char *)"0",
+};
+
+int main(int argc, char **argv)
+{
+    bool has_ipv4, has_ipv6;
+
+    qemu_init_main_loop(&error_abort);
+    socket_init();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
+        g_printerr("socket_check_protocol_support() failed\n");
+        goto end;
+    }
+
+    if (!has_ipv4) {
+        goto end;
+    }
+
+    module_call_init(MODULE_INIT_QOM);
+    qemu_add_opts(&qemu_chardev_opts);
+
+#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)                           \
+        g_test_add_data_func("/yank/char_change/success/" # name,              \
+                             &(CharChangeTestConfig) { .addr = &tcpaddr,       \
+                                                       .old_yank = (_old_yank),\
+                                                       .new_yank = (_new_yank),\
+                                                       .fail = false },        \
+                             char_change_test);                                \
+        g_test_add_data_func("/yank/char_change/fail/" # name,                 \
+                             &(CharChangeTestConfig) { .addr = &tcpaddr,       \
+                                                       .old_yank = (_old_yank),\
+                                                       .new_yank = (_new_yank),\
+                                                       .fail = true },         \
+                             char_change_test);
+
+    CHAR_CHANGE_TEST(to_yank, false, true);
+    CHAR_CHANGE_TEST(yank_to_yank, true, true);
+    CHAR_CHANGE_TEST(from_yank, true, false);
+
+end:
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index dcab656e62..aa894767dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2823,6 +2823,7 @@ M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
 F: migration/yank_functions*
+F: tests/unit/test-yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json
 
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4bfe4627ba..b3bc2109da 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -123,7 +123,8 @@ if have_system
     'test-util-sockets': ['socket-helpers.c'],
     'test-base64': [],
     'test-bufferiszero': [],
-    'test-vmstate': [migration, io]
+    'test-vmstate': [migration, io],
+    'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
   if 'CONFIG_INOTIFY1' in config_host
     tests += {'test-util-filemonitor': []}
-- 
2.29.0


