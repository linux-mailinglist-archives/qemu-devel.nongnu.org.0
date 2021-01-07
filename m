Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321192ED37E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:27:24 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXC7-0005Tr-9C
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxX09-00007i-Um
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxX06-0006Si-SY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmKsrftZroiMSmfGPATbUxz/xzWLmTw994Mrg2P/ZNA=;
 b=Bi7ST8fw/5iBfUwu6eo1c8kd3fYBIEak/KcK+7NpE1HL3SQfWPA2oFaEzvcPTx2+ax/f5l
 LT9bzpB7ko8An0MJtjwIqStIbXa5fAaIaXyOmDAUj9Io8GLJTVcvXSkoEDuwlNS+/RnMO0
 9vjqUsOoH+SHbWALwP7zh95RLHhlPNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-XrAJ0MZmOfaQLdBb97hc3A-1; Thu, 07 Jan 2021 10:14:56 -0500
X-MC-Unique: XrAJ0MZmOfaQLdBb97hc3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 882F68030A0
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:14:55 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D97F05D9DC;
 Thu,  7 Jan 2021 15:14:53 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] qtest/hyperv: Introduce a simple hyper-v test
Date: Thu,  7 Jan 2021 16:14:52 +0100
Message-Id: <20210107151452.541112-1-vkuznets@redhat.com>
In-Reply-To: <20210107150640.539239-1-vkuznets@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the beginning, just test 'hv-default', 'hv-passthrough' and a couple
of custom Hyper-V enlightenments configurations through QMP. Later, it
would be great to complement this by checking CPUID values from within the
guest.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 MAINTAINERS               |   1 +
 tests/qtest/hyperv-test.c | 238 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build   |   3 +-
 3 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/hyperv-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 171e7047aaaa..bb44007d795d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1495,6 +1495,7 @@ F: hw/isa/apm.c
 F: include/hw/isa/apm.h
 F: tests/test-x86-cpuid.c
 F: tests/qtest/test-x86-cpuid-compat.c
+F: tests/qtest/hyperv-test.c
 
 PC Chipset
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/tests/qtest/hyperv-test.c b/tests/qtest/hyperv-test.c
new file mode 100644
index 000000000000..029d1f8cb46e
--- /dev/null
+++ b/tests/qtest/hyperv-test.c
@@ -0,0 +1,238 @@
+/*
+ * Hyper-V emulation CPU feature test cases
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ * Authors:
+ *  Vitaly Kuznetsov <vkuznets@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include <linux/kvm.h>
+#include <sys/ioctl.h>
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+
+#define MACHINE_KVM "-machine pc-q35-5.2 -accel kvm "
+#define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
+                    "  'arguments': { 'type': 'full', "
+#define QUERY_TAIL  "}}"
+
+static bool kvm_enabled(QTestState *qts)
+{
+    QDict *resp, *qdict;
+    bool enabled;
+
+    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qdict = qdict_get_qdict(resp, "return");
+    g_assert(qdict_haskey(qdict, "enabled"));
+    enabled = qdict_get_bool(qdict, "enabled");
+    qobject_unref(resp);
+
+    return enabled;
+}
+
+static bool kvm_has_sys_hyperv_cpuid(void)
+{
+    int fd = open("/dev/kvm", O_RDWR);
+    int ret;
+
+    g_assert(fd > 0);
+
+    ret = ioctl(fd, KVM_CHECK_EXTENSION, KVM_CAP_SYS_HYPERV_CPUID);
+
+    close(fd);
+
+    return ret > 0;
+}
+
+static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
+{
+    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
+                          QUERY_TAIL, cpu_type);
+}
+
+static bool resp_has_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+
+    if (!qdict_haskey(resp, "return")) {
+        return false;
+    }
+    qdict = qdict_get_qdict(resp, "return");
+
+    if (!qdict_haskey(qdict, "model")) {
+        return false;
+    }
+    qdict = qdict_get_qdict(qdict, "model");
+
+    return qdict_haskey(qdict, "props");
+}
+
+static QDict *resp_get_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    g_assert(resp_has_props(resp));
+
+    qdict = qdict_get_qdict(resp, "return");
+    qdict = qdict_get_qdict(qdict, "model");
+    qdict = qdict_get_qdict(qdict, "props");
+
+    return qdict;
+}
+
+static bool resp_get_feature(QDict *resp, const char *feature)
+{
+    QDict *props;
+
+    g_assert(resp);
+    g_assert(resp_has_props(resp));
+    props = resp_get_props(resp);
+    g_assert(qdict_get(props, feature));
+    return qdict_get_bool(props, feature);
+}
+
+#define assert_has_feature(qts, cpu_type, feature)                     \
+({                                                                     \
+    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    g_assert(qdict_get(resp_get_props(_resp), feature));               \
+    qobject_unref(_resp);                                              \
+})
+
+#define resp_assert_feature(resp, feature, expected_value)             \
+({                                                                     \
+    QDict *_props;                                                     \
+                                                                       \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props = resp_get_props(_resp);                                    \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
+})
+
+#define assert_feature(qts, cpu_type, feature, expected_value)         \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    resp_assert_feature(_resp, feature, expected_value);               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_feature_enabled(qts, cpu_type, feature)             \
+    assert_feature(qts, cpu_type, feature, true)
+
+#define assert_has_feature_disabled(qts, cpu_type, feature)            \
+    assert_feature(qts, cpu_type, feature, false)
+
+static void test_assert_hyperv_all(QTestState *qts)
+{
+    QDict *resp;
+
+    assert_has_feature_enabled(qts, "host", "hv-relaxed");
+    assert_has_feature_enabled(qts, "host", "hv-vapic");
+    assert_has_feature_enabled(qts, "host", "hv-vpindex");
+    assert_has_feature_enabled(qts, "host", "hv-runtime");
+    assert_has_feature_enabled(qts, "host", "hv-crash");
+    assert_has_feature_enabled(qts, "host", "hv-time");
+    assert_has_feature_enabled(qts, "host", "hv-synic");
+    assert_has_feature_enabled(qts, "host", "hv-stimer");
+    assert_has_feature_enabled(qts, "host", "hv-tlbflush");
+    assert_has_feature_enabled(qts, "host", "hv-ipi");
+    assert_has_feature_enabled(qts, "host", "hv-reset");
+    assert_has_feature_enabled(qts, "host", "hv-frequencies");
+    assert_has_feature_enabled(qts, "host", "hv-reenlightenment");
+    assert_has_feature_enabled(qts, "host", "hv-stimer-direct");
+
+    resp = do_query_no_props(qts, "host");
+    if (resp_get_feature(resp, "vmx")) {
+        assert_has_feature_enabled(qts, "host", "hv-evmcs");
+    } else {
+        assert_has_feature_disabled(qts, "host", "hv-evmcs");
+    }
+
+}
+
+static void test_query_cpu_hv_default(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-default");
+
+    test_assert_hyperv_all(qts);
+
+    qtest_quit(qts);
+}
+
+static void test_query_cpu_hv_default_minus(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-default,hv_ipi=off");
+
+    assert_has_feature_enabled(qts, "host", "hv-tlbflush");
+    assert_has_feature_disabled(qts, "host", "hv-ipi");
+
+    qtest_quit(qts);
+}
+
+static void test_query_cpu_hv_custom(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-vpindex");
+
+    assert_has_feature_enabled(qts, "host", "hv-vpindex");
+    assert_has_feature_disabled(qts, "host", "hv-synic");
+
+    qtest_quit(qts);
+}
+
+static void test_query_cpu_hv_passthrough(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-passthrough");
+    if (!kvm_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
+
+    test_assert_hyperv_all(qts);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
+        qtest_add_data_func("/hyperv/hv-default",
+                            NULL, test_query_cpu_hv_default);
+        qtest_add_data_func("/hyperv/hv-default-minus",
+                            NULL, test_query_cpu_hv_default_minus);
+        qtest_add_data_func("/hyperv/hv-custom",
+                            NULL, test_query_cpu_hv_custom);
+        if (kvm_has_sys_hyperv_cpuid()) {
+            qtest_add_data_func("/hyperv/hv-passthrough",
+                                NULL, test_query_cpu_hv_passthrough);
+        }
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c538be12..fcbe425626f4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -64,7 +64,8 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test']
+   'numa-test',
+   'hyperv-test']
 
 dbus_daemon = find_program('dbus-daemon', required: false)
 if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
-- 
2.29.2


