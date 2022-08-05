Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B758AA6D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:58:53 +0200 (CEST)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvyd-0006g0-Vs
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvvX-00025L-7h
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvvT-0000fC-Ei
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659700534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dhColGCiyqHQk+5bR742hq0Dg/Ajs5C2vlJvKo07qY=;
 b=evcLZX0GF7n/UhYUmqfRpTT2zkqVE2/S3URg96c1Vmsv+0QSrNyOjYsAhcMikG/zRNYLCo
 fwB2dGitHp7mUdbuQnzRuKfwMleQbXsQOdYq8HcKO66lAcFZKj4iLW0CiOM83ZOY4M/LeZ
 RWjxh3sKED8GlwS4AkiH6miOfSxV4uY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-yCDFegZQM8-ZQ-1BI2zFwg-1; Fri, 05 Aug 2022 07:55:33 -0400
X-MC-Unique: yCDFegZQM8-ZQ-1BI2zFwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71FFF811E80
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 11:55:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C002026D4C;
 Fri,  5 Aug 2022 11:55:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/1] tests/qtest: add scenario for -readconfig handling
Date: Fri,  5 Aug 2022 12:55:29 +0100
Message-Id: <20220805115529.124544-2-berrange@redhat.com>
In-Reply-To: <20220805115529.124544-1-berrange@redhat.com>
References: <20220805115529.124544-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This test of -readconfig validates the last three regressions we
have fixed with -readconfig:

 * Interpretation of memory size units as MiB not bytes
 * Allow use of [spice]
 * Allow use of [object]

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/meson.build       |   1 +
 tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 tests/qtest/readconfig-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3a474010e4..be4b30dea2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -26,6 +26,7 @@ qtests_generic = [
   'qom-test',
   'test-hmp',
   'qos-test',
+  'readconfig-test',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
new file mode 100644
index 0000000000..2e604d7c2d
--- /dev/null
+++ b/tests/qtest/readconfig-test.c
@@ -0,0 +1,195 @@
+/*
+ * Validate -readconfig
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-visit-qom.h"
+#include "qapi/qapi-visit-ui.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/units.h"
+
+static QTestState *qtest_init_with_config(const char *cfgdata)
+{
+    GError *error = NULL;
+    g_autofree char *args = NULL;
+    int cfgfd = -1;
+    g_autofree char *cfgpath = NULL;
+    QTestState *qts;
+    ssize_t ret;
+
+    cfgfd = g_file_open_tmp("readconfig-test-XXXXXX", &cfgpath, &error);
+    g_assert_no_error(error);
+    g_assert_cmpint(cfgfd, >=, 0);
+
+    ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
+    if (ret < 0) {
+        unlink(cfgpath);
+    }
+    g_assert_cmpint(ret, ==, strlen(cfgdata));
+
+    close(cfgfd);
+
+    args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
+
+    qts = qtest_init(args);
+
+    unlink(cfgpath);
+
+    return qts;
+}
+
+static void test_x86_memdev_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(MemdevList) memdevs = NULL;
+    Memdev *memdev;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_MemdevList(v, NULL, &memdevs, &error_abort);
+
+    g_assert(memdevs);
+    g_assert(memdevs->value);
+    g_assert(!memdevs->next);
+
+    memdev = memdevs->value;
+    g_assert_cmpstr(memdev->id, ==, "ram");
+    g_assert_cmpint(memdev->size, ==, 200 * MiB);
+
+    visit_free(v);
+}
+
+static void test_x86_memdev(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[memory]\n"
+        "size = \"200\"";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
+    test_x86_memdev_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+
+#ifdef CONFIG_SPICE
+static void test_spice_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(SpiceInfo) spice = NULL;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
+
+    g_assert(spice);
+    g_assert(spice->enabled);
+
+    visit_free(v);
+}
+
+static void test_spice(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[spice]\n"
+        "disable-ticketing = \"on\"\n"
+        "unix = \"on\"\n";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
+    test_spice_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+#endif
+
+static void test_object_rng_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(ObjectPropertyInfoList) objs = NULL;
+    ObjectPropertyInfoList *tmp;
+    ObjectPropertyInfo *obj;
+    bool seen_rng = false;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_ObjectPropertyInfoList(v, NULL, &objs, &error_abort);
+
+    g_assert(objs);
+    tmp = objs;
+    while (tmp) {
+        g_assert(tmp->value);
+
+        obj = tmp->value;
+        if (g_str_equal(obj->name, "rng0") &&
+            g_str_equal(obj->type, "child<rng-builtin>")) {
+            seen_rng = true;
+        }
+
+        tmp = tmp->next;
+    }
+
+    g_assert(seen_rng);
+
+    visit_free(v);
+}
+
+static void test_object_rng(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[object]\n"
+        "qom-type = \"rng-builtin\"\n"
+        "id = \"rng0\"\n";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts,
+                     "{ 'execute': 'qom-list',"
+                     "  'arguments': {'path': '/objects' }}");
+    test_object_rng_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *arch;
+    g_test_init(&argc, &argv, NULL);
+
+    arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "i386") ||
+        g_str_equal(arch, "x86_64")) {
+        qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
+    }
+#ifdef CONFIG_SPICE
+    qtest_add_func("readconfig/spice", test_spice);
+#endif
+
+    qtest_add_func("readconfig/object-rng", test_object_rng);
+
+    return g_test_run();
+}
-- 
2.37.1


