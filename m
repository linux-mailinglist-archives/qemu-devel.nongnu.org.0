Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABED4ED35
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 18:39:41 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heMZg-0004Zw-MU
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 12:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1heMVJ-0001ZY-JW
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1heMVF-0001GB-LN
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38632)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1heMV3-0000MY-M4; Fri, 21 Jun 2019 12:34:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDB9030C318F;
 Fri, 21 Jun 2019 16:34:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3C8F1001DE0;
 Fri, 21 Jun 2019 16:34:40 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 21 Jun 2019 18:34:12 +0200
Message-Id: <20190621163422.6127-5-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 21 Jun 2019 16:34:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 04/14] tests: arm: Introduce cpu feature
 tests
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, armbru@redhat.com,
 eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that Arm CPUs have advertised features lets add tests to ensure
we maintain their expected availability with and without KVM.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/Makefile.include   |   5 +-
 tests/arm-cpu-features.c | 221 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 tests/arm-cpu-features.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index db750dd6d09b..d5f43fe03067 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -255,13 +255,15 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) =3D tests=
/endianness-test$(EXESUF)
 check-qtest-sparc64-y +=3D tests/prom-env-test$(EXESUF)
 check-qtest-sparc64-y +=3D tests/boot-serial-test$(EXESUF)
=20
+check-qtest-arm-y +=3D tests/arm-cpu-features$(EXESUF)
 check-qtest-arm-y +=3D tests/microbit-test$(EXESUF)
 check-qtest-arm-y +=3D tests/m25p80-test$(EXESUF)
 check-qtest-arm-y +=3D tests/test-arm-mptimer$(EXESUF)
 check-qtest-arm-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y +=3D tests/hexloader-test$(EXESUF)
=20
-check-qtest-aarch64-y =3D tests/numa-test$(EXESUF)
+check-qtest-aarch64-y +=3D tests/arm-cpu-features$(EXESUF)
+check-qtest-aarch64-y +=3D tests/numa-test$(EXESUF)
 check-qtest-aarch64-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y +=3D tests/migration-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test uncondit=
ional
@@ -822,6 +824,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o=
 $(test-util-obj-y)
 tests/numa-test$(EXESUF): tests/numa-test.o
 tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o te=
sts/acpi-utils.o
 tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libq=
os-obj-y)
+tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
=20
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,=
"LINK","$(TARGET_DIR)$@")
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
new file mode 100644
index 000000000000..31b1c15bb979
--- /dev/null
+++ b/tests/arm-cpu-features.c
@@ -0,0 +1,221 @@
+/*
+ * Arm CPU feature test cases
+ *
+ * Copyright (c) 2019 Red Hat Inc.
+ * Authors:
+ *  Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+
+#define MACHINE    "-machine virt,gic-version=3Dmax "
+#define QUERY_HEAD "{ 'execute': 'query-cpu-model-expansion', " \
+                     "'arguments': { 'type': 'full', "
+#define QUERY_TAIL "}}"
+
+static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
+{
+    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
+                          QUERY_TAIL, cpu_type);
+}
+
+static const char *resp_get_error(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    qdict =3D qdict_get_qdict(resp, "error");
+    if (qdict) {
+        return qdict_get_str(qdict, "desc");
+    }
+    return NULL;
+}
+
+static char *get_error(QTestState *qts, const char *cpu_type,
+                       const char *fmt, ...)
+{
+    QDict *resp;
+    char *error;
+
+    if (fmt) {
+        QDict *args;
+        va_list ap;
+
+        va_start(ap, fmt);
+        args =3D qdict_from_vjsonf_nofail(fmt, ap);
+        va_end(ap);
+
+        resp =3D qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s, "
+                                                    "'props': %p }"
+                              QUERY_TAIL, cpu_type, args);
+    } else {
+        resp =3D do_query_no_props(qts, cpu_type);
+    }
+
+    g_assert(resp);
+    error =3D g_strdup(resp_get_error(resp));
+    qobject_unref(resp);
+
+    return error;
+}
+
+#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
+({                                                                     \
+    char *_error =3D get_error(qts, cpu_type, fmt, ##__VA_ARGS__);      =
 \
+    g_assert(_error);                                                  \
+    g_assert(g_str_equal(_error, expected_error));                     \
+    g_free(_error);                                                    \
+})
+
+static QDict *resp_get_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    g_assert(qdict_haskey(resp, "return"));
+    qdict =3D qdict_get_qdict(resp, "return");
+    g_assert(qdict_haskey(qdict, "model"));
+    qdict =3D qdict_get_qdict(qdict, "model");
+    g_assert(qdict_haskey(qdict, "props"));
+    qdict =3D qdict_get_qdict(qdict, "props");
+    return qdict;
+}
+
+#define assert_has_feature(qts, cpu_type, feature)                     \
+({                                                                     \
+    QDict *_resp =3D do_query_no_props(qts, cpu_type);                  =
 \
+    g_assert(_resp);                                                   \
+    g_assert(qdict_get(resp_get_props(_resp), feature));               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_not_feature(qts, cpu_type, feature)                 \
+({                                                                     \
+    QDict *_resp =3D do_query_no_props(qts, cpu_type);                  =
 \
+    g_assert(_resp);                                                   \
+    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
+    qobject_unref(_resp);                                              \
+})
+
+static void assert_type_full(QTestState *qts, const char *cpu_type)
+{
+    const char *error;
+    QDict *resp;
+
+    resp =3D qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'static', "
+                                           "'model': { 'name': %s }}}",
+                     cpu_type);
+    g_assert(resp);
+    error =3D resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "The requested expansion type is not supported.=
"));
+    qobject_unref(resp);
+}
+
+static void assert_bad_props(QTestState *qts, const char *cpu_type)
+{
+    const char *error;
+    QDict *resp;
+
+    resp =3D qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'full', "
+                                           "'model': { 'name': %s, "
+                                                      "'props': false }}=
}",
+                     cpu_type);
+    g_assert(resp);
+    error =3D resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "Invalid parameter type for 'props', expected: =
dict"));
+    qobject_unref(resp);
+}
+
+static void test_query_cpu_model_expansion(const void *data)
+{
+    QTestState *qts;
+
+    qts =3D qtest_init(MACHINE "-cpu max");
+
+    /* Test common query-cpu-model-expansion input validation */
+    assert_type_full(qts, "foo");
+    assert_bad_props(qts, "max");
+    assert_error(qts, "foo", "The CPU definition 'foo' is unknown.", NUL=
L);
+    assert_error(qts, "max", "Parameter 'not-a-prop' is unexpected",
+                 "{ 'not-a-prop': false }");
+    assert_error(qts, "host", "The CPU definition 'host' requires KVM", =
NULL);
+
+    /* Test expected feature presence/absence for some cpu types */
+    assert_has_feature(qts, "max", "pmu");
+    assert_has_feature(qts, "cortex-a15", "pmu");
+    assert_has_not_feature(qts, "cortex-a15", "aarch64");
+
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        assert_has_feature(qts, "max", "aarch64");
+        assert_has_feature(qts, "cortex-a57", "pmu");
+        assert_has_feature(qts, "cortex-a57", "aarch64");
+
+        /* Test that features that depend on KVM generate errors without=
. */
+        assert_error(qts, "max",
+                     "'aarch64' feature cannot be disabled "
+                     "unless KVM is enabled and 32-bit EL1 "
+                     "is supported",
+                     "{ 'aarch64': false }");
+    }
+
+    qtest_quit(qts);
+}
+
+static void test_query_cpu_model_expansion_kvm(const void *data)
+{
+    QTestState *qts;
+
+    qts =3D qtest_init(MACHINE "-accel kvm -cpu host");
+
+    assert_has_feature(qts, "host", "pmu");
+
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        assert_has_feature(qts, "host", "aarch64");
+
+        assert_error(qts, "cortex-a15",
+            "The CPU definition 'cortex-a15' cannot "
+            "be used with KVM on this host", NULL);
+    } else {
+        assert_error(qts, "host",
+                     "'pmu' feature not supported by KVM on this host",
+                     "{ 'pmu': true }");
+    }
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    bool kvm_available =3D false;
+
+    if (!access("/dev/kvm",  R_OK | W_OK)) {
+#if defined(HOST_AARCH64)
+        kvm_available =3D g_str_equal(qtest_get_arch(), "aarch64");
+#elif defined(HOST_ARM)
+        kvm_available =3D g_str_equal(qtest_get_arch(), "arm");
+#endif
+    }
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/arm/query-cpu-model-expansion",
+                        NULL, test_query_cpu_model_expansion);
+
+    if (kvm_available) {
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion_kvm);
+    }
+
+    return g_test_run();
+}
--=20
2.20.1


