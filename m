Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02139A049
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:53:43 +0200 (CEST)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loluw-00088X-Rp
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqX-0005yU-Rs
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqS-0002Cv-NQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDmgG4X1saqa0QllHPrWBjVSN1wTsSb3zS1ZF7Gn6fg=;
 b=PIXBTdzmE90kqoTfegftug4+9vu070YaXr8PRUH6Q3BLDh3xqETDAKM7A+KXFiaalaUhrM
 /MhlcTptiKRk5fqqrMGM+Vc0Z+H6gVu0MRyDBe7/zmTSwY4J57xsoxLTg4ALKBC/L2pOws
 RPDc4L/0cEYI0fTf6qf0F08MqxVcsaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-rHXeZCXaOYWixOKwYbOCLQ-1; Thu, 03 Jun 2021 07:49:00 -0400
X-MC-Unique: rHXeZCXaOYWixOKwYbOCLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790026D249
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:59 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0BEE1A868;
 Thu,  3 Jun 2021 11:48:57 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 9/9] qtest/hyperv: Introduce a simple hyper-v test
Date: Thu,  3 Jun 2021 13:48:35 +0200
Message-Id: <20210603114835.847451-10-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the beginning, just test 'hv-passthrough' and a couple of custom
Hyper-V  enlightenments configurations through QMP. Later, it would
be great to complement this by checking CPUID values from within the
guest.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 MAINTAINERS               |   1 +
 tests/qtest/hyperv-test.c | 225 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build   |   3 +-
 3 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/hyperv-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2fae..862720016b3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1537,6 +1537,7 @@ F: hw/isa/apm.c
 F: include/hw/isa/apm.h
 F: tests/unit/test-x86-cpuid.c
 F: tests/qtest/test-x86-cpuid-compat.c
+F: tests/qtest/hyperv-test.c
 
 PC Chipset
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/tests/qtest/hyperv-test.c b/tests/qtest/hyperv-test.c
new file mode 100644
index 000000000000..0be689548e18
--- /dev/null
+++ b/tests/qtest/hyperv-test.c
@@ -0,0 +1,225 @@
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
+static void test_assert_hyperv_all_but_evmcs(QTestState *qts)
+{
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
+}
+
+static void test_query_cpu_hv_all_but_evmcs(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-relaxed,hv-vapic,hv-vpindex,"
+                     "hv-runtime,hv-crash,hv-time,hv-synic,hv-stimer,"
+                     "hv-tlbflush,hv-ipi,hv-reset,hv-frequencies,"
+                     "hv-reenlightenment,hv-stimer-direct");
+
+    test_assert_hyperv_all_but_evmcs(qts);
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
+    QDict *resp;
+
+    qts = qtest_init(MACHINE_KVM "-cpu host,hv-passthrough");
+    if (!kvm_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
+
+    test_assert_hyperv_all_but_evmcs(qts);
+
+    resp = do_query_no_props(qts, "host");
+    if (resp_get_feature(resp, "vmx")) {
+        assert_has_feature_enabled(qts, "host", "hv-evmcs");
+    } else {
+        assert_has_feature_disabled(qts, "host", "hv-evmcs");
+    }
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
+        qtest_add_data_func("/hyperv/hv-all-but-evmcs",
+                            NULL, test_query_cpu_hv_all_but_evmcs);
+        qtest_add_data_func("/hyperv/hv-custom",
+                            NULL, test_query_cpu_hv_custom);
+        if (kvm_has_sys_hyperv_cpuid()) {
+            qtest_add_data_func("/hyperv/hv-passthrough",
+                                NULL, test_query_cpu_hv_passthrough);
+       }
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c3a223a83d6a..958a88d0c8b4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -83,7 +83,8 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test']
+   'numa-test',
+   'hyperv-test']
 
 dbus_daemon = find_program('dbus-daemon', required: false)
 if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
-- 
2.31.1


