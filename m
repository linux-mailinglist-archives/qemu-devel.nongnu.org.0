Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61133AEE7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:35:18 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjd7-00066c-5y
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKN-0000ML-DQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjKH-0008EA-CH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=t1OUm1oD5Ay0Sxc++QAFRQuHsc8HWxPRWVar+Ykg7K8=;
 b=hDUsBNsjthcZ0JNpicl9IynxiJtX4AnBsOH8hZ+Hp9TA0yhN+vT6Uxo+DWDjkh5YufDuJ2
 MNXbl6JTv1vhp7MycP2WDxp4mapL+oE0mi2IEJ7VHQIQyWF8n/H5HzKbzguLhGs7VxWZ8I
 MT5p8jqphcbYS7pbBFXWxgYqQ7ejsMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-nPrigXOJNGWXTVGXoMQrBw-1; Mon, 15 Mar 2021 05:15:44 -0400
X-MC-Unique: nPrigXOJNGWXTVGXoMQrBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1877C100C662;
 Mon, 15 Mar 2021 09:15:43 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60AFF100164C;
 Mon, 15 Mar 2021 09:15:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 17/20] tests: Add tests for query-netdev command
Date: Mon, 15 Mar 2021 17:14:30 +0800
Message-Id: <1615799673-31549-18-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kirillov <lekiravi@yandex-team.ru>

A simply qtest that checks for correct number of netdevs in the response
of the query-netdev.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 tests/qtest/meson.build         |   3 +
 tests/qtest/test-query-netdev.c | 120 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 tests/qtest/test-query-netdev.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2688e1b..66ee9fb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -30,6 +30,9 @@ qtests_generic = [
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
+if slirp.found()
+  qtests_generic += [ 'test-query-netdev' ]
+endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
diff --git a/tests/qtest/test-query-netdev.c b/tests/qtest/test-query-netdev.c
new file mode 100644
index 0000000..1118537
--- /dev/null
+++ b/tests/qtest/test-query-netdev.c
@@ -0,0 +1,120 @@
+/*
+ * QTest testcase for the query-netdev
+ *
+ * Copyright Yandex N.V., 2019
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
+
+/*
+ * Events can get in the way of responses we are actually waiting for.
+ */
+GCC_FMT_ATTR(2, 3)
+static QObject *wait_command(QTestState *who, const char *command, ...)
+{
+    va_list ap;
+    QDict *response;
+    QObject *result;
+
+    va_start(ap, command);
+    qtest_qmp_vsend(who, command, ap);
+    va_end(ap);
+
+    response = qtest_qmp_receive(who);
+
+    result = qdict_get(response, "return");
+    g_assert(result);
+    qobject_ref(result);
+    qobject_unref(response);
+
+    return result;
+}
+
+static void qmp_query_netdev_no_error(QTestState *qts, size_t netdevs_count)
+{
+    QObject *resp;
+    QList *netdevs;
+
+    resp = wait_command(qts, "{'execute': 'query-netdev'}");
+
+    netdevs = qobject_to(QList, resp);
+    g_assert(netdevs);
+    g_assert(qlist_size(netdevs) == netdevs_count);
+
+    qobject_unref(resp);
+}
+
+static void test_query_netdev(void)
+{
+    const char *arch = qtest_get_arch();
+    QObject *resp;
+    QTestState *state;
+
+    /* Choosing machine for platforms without default one */
+    if (g_str_equal(arch, "arm") ||
+        g_str_equal(arch, "aarch64")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M virt "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "tricore")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M tricore_testboard "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "avr")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M mega2560 "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "rx")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M gdbsim-r5f562n8 "
+            "-netdev user,id=slirp0");
+    } else {
+        state = qtest_init(
+            "-nodefaults "
+            "-netdev user,id=slirp0");
+    }
+    g_assert(state);
+
+    qmp_query_netdev_no_error(state, 1);
+
+    resp = wait_command(state,
+        "{'execute': 'netdev_add', 'arguments': {"
+        " 'id': 'slirp1',"
+        " 'type': 'user'}}");
+    qobject_unref(resp);
+
+    qmp_query_netdev_no_error(state, 2);
+
+    resp = wait_command(state,
+        "{'execute': 'netdev_del', 'arguments': {"
+        " 'id': 'slirp1'}}");
+    qobject_unref(resp);
+
+    qmp_query_netdev_no_error(state, 1);
+
+    qtest_quit(state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret = 0;
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/net/qapi/query_netdev", test_query_netdev);
+
+    ret = g_test_run();
+
+    return ret;
+}
-- 
2.7.4


