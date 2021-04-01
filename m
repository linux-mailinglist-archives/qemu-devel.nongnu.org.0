Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F260C3514A4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:59:29 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvyz-0001Ad-0z
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvwM-0005UF-7E
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvwK-0002Xv-13
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhfSmRhns+ivA4uVzbLsfC95kF/YsbwJNKXaDqCxNxk=;
 b=X6gN3tObm0C7Y3y7lDKyPjmdSB6BGZwauS1Qsh1tk4k59O80JaFpM/WxYfQLt9+kLWSEvL
 mqoQhr0a+BCxMTV/QPq7Nc7AAld33tYAjw0Q5rprrlAkR/9pnpN4HDgVWsi1Mgce/f7HJy
 KDcopSWE9n6Du97qymhBMtq6hsTZIlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-VQ06xojbP7iXK00yn6aIAw-1; Thu, 01 Apr 2021 07:56:39 -0400
X-MC-Unique: VQ06xojbP7iXK00yn6aIAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92564801597;
 Thu,  1 Apr 2021 11:56:38 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F33605D72F;
 Thu,  1 Apr 2021 11:56:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 9/9] tests: Add tests for yank with the chardev-change case
Date: Thu,  1 Apr 2021 15:55:32 +0400
Message-Id: <20210401115532.430961-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Message-Id: <697ce111503a8bab011d21519ae0b6b07041ec9a.1617127849.git.lukasstraub2@web.de>
---
 tests/unit/test-yank.c | 249 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   1 +
 tests/unit/meson.build |   3 +-
 3 files changed, 252 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-yank.c

diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
new file mode 100644
index 0000000000..2383d2908c
--- /dev/null
+++ b/tests/unit/test-yank.c
@@ -0,0 +1,249 @@
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
+static gpointer accept_thread(gpointer data)
+{
+    QIOChannelSocket *ioc = data;
+    QIOChannelSocket *cioc;
+
+    cioc = qio_channel_socket_accept(ioc, &error_abort);
+    object_unref(OBJECT(cioc));
+
+    return NULL;
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
+    QemuThread thread;
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
+    if (conf->old_yank) {
+        qemu_thread_create(&thread, "accept", accept_thread,
+                           ioc, QEMU_THREAD_JOINABLE);
+    }
+
+    ret = qmp_chardev_add("chardev", &backend[conf->old_yank], &error_abort);
+    qapi_free_ChardevReturn(ret);
+    chr = qemu_chr_find("chardev");
+    g_assert_nonnull(chr);
+
+    g_assert(is_yank_instance_registered() == conf->old_yank);
+
+    qemu_chr_wait_connected(chr, &error_abort);
+    if (conf->old_yank) {
+        qemu_thread_join(&thread);
+    }
+
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
+        if (conf->new_yank) {
+                qemu_thread_create(&thread, "accept", accept_thread,
+                                   ioc, QEMU_THREAD_JOINABLE);
+        }
+        ret = qmp_chardev_change("chardev", &backend[conf->new_yank],
+                                 &error_abort);
+        if (conf->new_yank) {
+            qemu_thread_join(&thread);
+        }
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
+    g_test_add_data_func("/yank/char_change/success/to_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = false,
+                                                   .new_yank = true,
+                                                   .fail = false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/to_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = false,
+                                                   .new_yank = true,
+                                                   .fail = true },
+                         char_change_test);
+
+    g_test_add_data_func("/yank/char_change/success/yank_to_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = true,
+                                                   .new_yank = true,
+                                                   .fail = false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/yank_to_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = true,
+                                                   .new_yank = true,
+                                                   .fail = true },
+                         char_change_test);
+
+    g_test_add_data_func("/yank/char_change/success/from_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = true,
+                                                   .new_yank = false,
+                                                   .fail = false },
+                         char_change_test);
+    g_test_add_data_func("/yank/char_change/fail/from_yank",
+                         &(CharChangeTestConfig) { .addr = &tcpaddr,
+                                                   .old_yank = true,
+                                                   .new_yank = false,
+                                                   .fail = true },
+                         char_change_test);
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


