Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDB11AC6E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 14:52:03 +0100 (CET)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if2PJ-0006GJ-W7
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 08:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1if2KG-0001kU-FA
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1if2KD-0004Ez-I0
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34719
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1if2KD-0004EE-Cf
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576072004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd8EfMlMhKRFTjntzK1q5GpgDHCrBS8U15qfEM6g9CY=;
 b=W3ghueBdIoNEIqpSxP7A7gYMYqAldqu+/F66ppd5thtfPuIphazy7dmznBefBcm8gh+UJQ
 rLdLAfYKzQwvngx3sVULMRrm9ibWR3xKwbBGkq1V7fxAPHX6Pn2L7watbxOguujSlioe7n
 pU7tMg6UChhO3O85lP5za1Pxtvhu4XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-wRTaUMTQMYa2AlyhresZLw-1; Wed, 11 Dec 2019 08:46:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38665801E70
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 13:46:42 +0000 (UTC)
Received: from localhost (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1915C5C1B5;
 Wed, 11 Dec 2019 13:46:38 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/8] tests: add dbus-vmstate-test
Date: Wed, 11 Dec 2019 17:45:06 +0400
Message-Id: <20191211134506.1803403-9-marcandre.lureau@redhat.com>
In-Reply-To: <20191211134506.1803403-1-marcandre.lureau@redhat.com>
References: <20191211134506.1803403-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: wRTaUMTQMYa2AlyhresZLw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: berrange@redhat.com, quintela@redhat.com, mprivozn@redhat.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 MAINTAINERS                  |   1 +
 tests/Makefile.include       |  22 +-
 tests/dbus-vmstate-daemon.sh |  95 +++++++++
 tests/dbus-vmstate-test.c    | 399 +++++++++++++++++++++++++++++++++++
 tests/dbus-vmstate1.xml      |  12 ++
 5 files changed, 528 insertions(+), 1 deletion(-)
 create mode 100755 tests/dbus-vmstate-daemon.sh
 create mode 100644 tests/dbus-vmstate-test.c
 create mode 100644 tests/dbus-vmstate1.xml

diff --git a/MAINTAINERS b/MAINTAINERS
index 7af80d0c1d..cc34e027f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2203,6 +2203,7 @@ D-Bus
 M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
 S: Maintained
 F: backends/dbus-vmstate.c
+F: tests/dbus-vmstate*
 F: util/dbus.c
 F: include/qemu/dbus.h
 F: docs/interop/dbus.rst
diff --git a/tests/Makefile.include b/tests/Makefile.include
index e2ab8ba334..000021d752 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -160,12 +160,17 @@ check-qtest-generic-$(CONFIG_MODULES) +=3D tests/modu=
les-test$(EXESUF)
=20
 check-qtest-generic-y +=3D tests/device-introspect-test$(EXESUF)
 check-qtest-generic-y +=3D tests/cdrom-test$(EXESUF)
+DBUS_DAEMON :=3D $(shell which dbus-daemon 2>/dev/null)
+ifneq ($(GDBUS_CODEGEN),)
+ifneq ($(DBUS_DAEMON),)
+check-qtest-pci-$(CONFIG_GIO) +=3D tests/dbus-vmstate-test$(EXESUF)
+endif
+endif
=20
 check-qtest-pci-$(CONFIG_RTL8139_PCI) +=3D tests/rtl8139-test$(EXESUF)
 check-qtest-pci-$(CONFIG_VGA) +=3D tests/display-vga-test$(EXESUF)
 check-qtest-pci-$(CONFIG_HDA) +=3D tests/intel-hda-test$(EXESUF)
 check-qtest-pci-$(CONFIG_IVSHMEM_DEVICE) +=3D tests/ivshmem-test$(EXESUF)
-
 check-qtest-i386-$(CONFIG_ISA_TESTDEV) =3D tests/endianness-test$(EXESUF)
 check-qtest-i386-y +=3D tests/fdc-test$(EXESUF)
 check-qtest-i386-y +=3D tests/ide-test$(EXESUF)
@@ -636,6 +641,19 @@ tests/qapi-schema/doc-good.test.texi: $(SRC_PATH)/test=
s/qapi-schema/doc-good.jso
 =09@mv tests/qapi-schema/doc-good-qapi-doc.texi $@
 =09@rm -f tests/qapi-schema/doc-good-qapi-*.[ch] tests/qapi-schema/doc-goo=
d-qmp-*.[ch]
=20
+tests/dbus-vmstate1.h tests/dbus-vmstate1.c: tests/dbus-vmstate1-gen-times=
tamp ;
+tests/dbus-vmstate1-gen-timestamp: $(SRC_PATH)/tests/dbus-vmstate1.xml
+=09$(call quiet-command,$(GDBUS_CODEGEN) $< \
+=09=09--interface-prefix org.qemu --generate-c-code tests/dbus-vmstate1, \
+=09=09"GEN","$(@:%-timestamp=3D%)")
+=09@>$@
+
+tests/dbus-vmstate-test.o-cflags :=3D -DSRCDIR=3D"$(SRC_PATH)"
+tests/dbus-vmstate1.o-cflags :=3D $(GIO_CFLAGS)
+tests/dbus-vmstate1.o-libs :=3D $(GIO_LIBS)
+
+tests/dbus-vmstate-test.o: tests/dbus-vmstate1.h
+
 tests/test-string-output-visitor$(EXESUF): tests/test-string-output-visito=
r.o $(test-qapi-obj-y)
 tests/test-string-input-visitor$(EXESUF): tests/test-string-input-visitor.=
o $(test-qapi-obj-y)
 tests/test-qmp-event$(EXESUF): tests/test-qmp-event.o $(test-qapi-obj-y) t=
ests/test-qapi-events.o
@@ -839,6 +857,7 @@ tests/test-filter-mirror$(EXESUF): tests/test-filter-mi=
rror.o $(qtest-obj-y)
 tests/test-filter-redirector$(EXESUF): tests/test-filter-redirector.o $(qt=
est-obj-y)
 tests/test-x86-cpuid-compat$(EXESUF): tests/test-x86-cpuid-compat.o $(qtes=
t-obj-y)
 tests/ivshmem-test$(EXESUF): tests/ivshmem-test.o contrib/ivshmem-server/i=
vshmem-server.o $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
+tests/dbus-vmstate-test$(EXESUF): tests/dbus-vmstate-test.o tests/dbus-vms=
tate1.o $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-ob=
j-y) libvhost-user.a
 tests/test-uuid$(EXESUF): tests/test-uuid.o $(test-util-obj-y)
 tests/test-arm-mptimer$(EXESUF): tests/test-arm-mptimer.o
@@ -1200,6 +1219,7 @@ check-clean:
 =09rm -rf $(check-unit-y) tests/*.o $(QEMU_IOTESTS_HELPERS-y)
 =09rm -rf $(sort $(foreach target,$(SYSEMU_TARGET_LIST), $(check-qtest-$(t=
arget)-y)) $(check-qtest-generic-y))
 =09rm -f tests/test-qapi-gen-timestamp
+=09rm -f tests/dbus-vmstate1-gen-timestamp
 =09rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
=20
 clean: check-clean
diff --git a/tests/dbus-vmstate-daemon.sh b/tests/dbus-vmstate-daemon.sh
new file mode 100755
index 0000000000..c4394ac918
--- /dev/null
+++ b/tests/dbus-vmstate-daemon.sh
@@ -0,0 +1,95 @@
+#!/bin/sh
+
+# dbus-daemon wrapper script for dbus-vmstate testing
+#
+# This script allows to tweak the dbus-daemon policy during the test
+# to test different configurations.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, see <http://www.gnu.org/licenses/>.
+#
+# Copyright (C) 2019 Red Hat, Inc.
+
+write_config()
+{
+    CONF=3D"$1"
+    cat > "$CONF" <<EOF
+<busconfig>
+  <type>session</type>
+  <listen>unix:tmpdir=3D/tmp</listen>
+
+  <policy context=3D"default">
+     <!-- Holes must be punched in service configuration files for
+          name ownership and sending method calls -->
+     <deny own=3D"*"/>
+     <deny send_type=3D"method_call"/>
+
+     <!-- Signals and reply messages (method returns, errors) are allowed
+          by default -->
+     <allow send_type=3D"signal"/>
+     <allow send_requested_reply=3D"true" send_type=3D"method_return"/>
+     <allow send_requested_reply=3D"true" send_type=3D"error"/>
+
+     <!-- All messages may be received by default -->
+     <allow receive_type=3D"method_call"/>
+     <allow receive_type=3D"method_return"/>
+     <allow receive_type=3D"error"/>
+     <allow receive_type=3D"signal"/>
+
+     <!-- Allow anyone to talk to the message bus -->
+     <allow send_destination=3D"org.freedesktop.DBus"
+            send_interface=3D"org.freedesktop.DBus" />
+     <allow send_destination=3D"org.freedesktop.DBus"
+            send_interface=3D"org.freedesktop.DBus.Introspectable"/>
+     <allow send_destination=3D"org.freedesktop.DBus"
+            send_interface=3D"org.freedesktop.DBus.Properties"/>
+     <!-- But disallow some specific bus services -->
+     <deny send_destination=3D"org.freedesktop.DBus"
+           send_interface=3D"org.freedesktop.DBus"
+           send_member=3D"UpdateActivationEnvironment"/>
+     <deny send_destination=3D"org.freedesktop.DBus"
+           send_interface=3D"org.freedesktop.DBus.Debug.Stats"/>
+     <deny send_destination=3D"org.freedesktop.DBus"
+           send_interface=3D"org.freedesktop.systemd1.Activator"/>
+
+     <allow own=3D"org.qemu.VMState1"/>
+     <allow send_destination=3D"org.qemu.VMState1"/>
+     <allow receive_sender=3D"org.qemu.VMState1"/>
+
+  </policy>
+
+  <include if_selinux_enabled=3D"yes"
+   selinux_root_relative=3D"yes">contexts/dbus_contexts</include>
+
+</busconfig>
+EOF
+}
+
+ARGS=3D
+for arg in "$@"
+do
+    case $arg in
+        --config-file=3D*)
+          CONF=3D"${arg#*=3D}"
+          write_config "$CONF"
+          ARGS=3D"$ARGS $1"
+          shift
+        ;;
+        *)
+          ARGS=3D"$ARGS $1"
+          shift
+        ;;
+    esac
+done
+
+exec dbus-daemon $ARGS
diff --git a/tests/dbus-vmstate-test.c b/tests/dbus-vmstate-test.c
new file mode 100644
index 0000000000..34818c1e79
--- /dev/null
+++ b/tests/dbus-vmstate-test.c
@@ -0,0 +1,399 @@
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include <gio/gio.h>
+#include "libqtest.h"
+#include "qemu-common.h"
+#include "dbus-vmstate1.h"
+
+static char *workdir;
+
+typedef struct TestServerId {
+    const char *name;
+    const char *data;
+    size_t size;
+} TestServerId;
+
+static const TestServerId idA =3D {
+    "idA", "I'am\0idA!", sizeof("I'am\0idA!")
+};
+
+static const TestServerId idB =3D {
+    "idB", "I'am\0idB!", sizeof("I'am\0idB!")
+};
+
+typedef struct TestServer {
+    const TestServerId *id;
+    bool save_called;
+    bool load_called;
+} TestServer;
+
+typedef struct Test {
+    const char *id_list;
+    bool migrate_fail;
+    bool without_dst_b;
+    TestServer srcA;
+    TestServer dstA;
+    TestServer srcB;
+    TestServer dstB;
+    GMainLoop *loop;
+    QTestState *src_qemu;
+} Test;
+
+static gboolean
+vmstate_load(VMState1 *object, GDBusMethodInvocation *invocation,
+             const gchar *arg_data, gpointer user_data)
+{
+    TestServer *h =3D user_data;
+    g_autoptr(GVariant) var =3D NULL;
+    GVariant *args;
+    const uint8_t *data;
+    size_t size;
+
+    args =3D g_dbus_method_invocation_get_parameters(invocation);
+    var =3D g_variant_get_child_value(args, 0);
+    data =3D g_variant_get_fixed_array(var, &size, sizeof(char));
+    g_assert_cmpuint(size, =3D=3D, h->id->size);
+    g_assert(!memcmp(data, h->id->data, h->id->size));
+    h->load_called =3D true;
+
+    g_dbus_method_invocation_return_value(invocation, g_variant_new("()"))=
;
+    return TRUE;
+}
+
+static gboolean
+vmstate_save(VMState1 *object, GDBusMethodInvocation *invocation,
+             gpointer user_data)
+{
+    TestServer *h =3D user_data;
+    GVariant *var;
+
+    var =3D g_variant_new_fixed_array(G_VARIANT_TYPE_BYTE,
+                                    h->id->data, h->id->size, sizeof(char)=
);
+    g_dbus_method_invocation_return_value(invocation,
+                                          g_variant_new("(@ay)", var));
+    h->save_called =3D true;
+
+    return TRUE;
+}
+
+static gboolean
+wait_for_migration_complete(gpointer user_data)
+{
+    Test *test =3D user_data;
+    QDict *rsp_return;
+    bool stop =3D false;
+    const char *status;
+
+    qtest_qmp_send(test->src_qemu, "{ 'execute': 'query-migrate' }");
+    rsp_return =3D qtest_qmp_receive_success(test->src_qemu, NULL, NULL);
+    status =3D qdict_get_str(rsp_return, "status");
+    if (g_str_equal(status, "completed") || g_str_equal(status, "failed"))=
 {
+        stop =3D true;
+        g_assert_cmpstr(status, =3D=3D,
+                        test->migrate_fail ? "failed" : "completed");
+    }
+    qobject_unref(rsp_return);
+
+    if (stop) {
+        g_main_loop_quit(test->loop);
+    }
+    return stop ? G_SOURCE_REMOVE : G_SOURCE_CONTINUE;
+}
+
+static void migrate(QTestState *who, const char *uri)
+{
+    QDict *args, *rsp;
+
+    args =3D qdict_new();
+    qdict_put_str(args, "uri", uri);
+
+    rsp =3D qtest_qmp(who, "{ 'execute': 'migrate', 'arguments': %p }", ar=
gs);
+
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+}
+
+typedef struct WaitNamed {
+    GMainLoop *loop;
+    bool named;
+} WaitNamed;
+
+static void
+named_cb(GDBusConnection *connection,
+         const gchar *name,
+         gpointer user_data)
+{
+    WaitNamed *t =3D user_data;
+
+    t->named =3D true;
+    g_main_loop_quit(t->loop);
+}
+
+static GDBusConnection *
+get_connection(Test *test, guint *ownid)
+{
+    g_autofree gchar *addr =3D NULL;
+    WaitNamed *wait;
+    GError *err =3D NULL;
+    GDBusConnection *c;
+
+    wait =3D g_new0(WaitNamed, 1);
+    wait->loop =3D test->loop;
+    addr =3D g_dbus_address_get_for_bus_sync(G_BUS_TYPE_SESSION, NULL, &er=
r);
+    g_assert_no_error(err);
+
+    c =3D g_dbus_connection_new_for_address_sync(
+        addr,
+        G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION |
+        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT,
+        NULL, NULL, &err);
+    g_assert_no_error(err);
+    *ownid =3D g_bus_own_name_on_connection(c, "org.qemu.VMState1",
+                                          G_BUS_NAME_OWNER_FLAGS_NONE,
+                                          named_cb, named_cb, wait, g_free=
);
+    if (!wait->named) {
+        g_main_loop_run(wait->loop);
+    }
+
+    return c;
+}
+
+static GDBusObjectManagerServer *
+get_server(GDBusConnection *conn, TestServer *s, const TestServerId *id)
+{
+    g_autoptr(GDBusObjectSkeleton) sk =3D NULL;
+    g_autoptr(VMState1Skeleton) v =3D NULL;
+    GDBusObjectManagerServer *os;
+
+    s->id =3D id;
+    os =3D g_dbus_object_manager_server_new("/org/qemu");
+    sk =3D g_dbus_object_skeleton_new("/org/qemu/VMState1");
+
+    v =3D VMSTATE1_SKELETON(vmstate1_skeleton_new());
+    g_object_set(v, "id", id->name, NULL);
+
+    g_signal_connect(v, "handle-load", G_CALLBACK(vmstate_load), s);
+    g_signal_connect(v, "handle-save", G_CALLBACK(vmstate_save), s);
+
+    g_dbus_object_skeleton_add_interface(sk, G_DBUS_INTERFACE_SKELETON(v))=
;
+    g_dbus_object_manager_server_export(os, sk);
+    g_dbus_object_manager_server_set_connection(os, conn);
+
+    return os;
+}
+
+static void
+set_id_list(Test *test, QTestState *s)
+{
+    if (!test->id_list) {
+        return;
+    }
+
+    g_assert(!qmp_rsp_is_err(qtest_qmp(s,
+        "{ 'execute': 'qom-set', 'arguments': "
+        "{ 'path': '/objects/dv', 'property': 'id-list', 'value': %s } }",
+        test->id_list)));
+}
+static void
+test_dbus_vmstate(Test *test)
+{
+    g_autofree char *src_qemu_args =3D NULL;
+    g_autofree char *dst_qemu_args =3D NULL;
+    g_autoptr(GTestDBus) srcbus =3D NULL;
+    g_autoptr(GTestDBus) dstbus =3D NULL;
+    g_autoptr(GDBusConnection) srcconnA =3D NULL;
+    g_autoptr(GDBusConnection) srcconnB =3D NULL;
+    g_autoptr(GDBusConnection) dstconnA =3D NULL;
+    g_autoptr(GDBusConnection) dstconnB =3D NULL;
+    g_autoptr(GDBusObjectManagerServer) srcserverA =3D NULL;
+    g_autoptr(GDBusObjectManagerServer) srcserverB =3D NULL;
+    g_autoptr(GDBusObjectManagerServer) dstserverA =3D NULL;
+    g_autoptr(GDBusObjectManagerServer) dstserverB =3D NULL;
+    g_auto(GStrv) srcaddr =3D NULL;
+    g_auto(GStrv) dstaddr =3D NULL;
+    g_autofree char *uri =3D NULL;
+    QTestState *src_qemu =3D NULL, *dst_qemu =3D NULL;
+    guint ownsrcA, ownsrcB, owndstA, owndstB;
+
+    uri =3D g_strdup_printf("unix:%s/migsocket", workdir);
+
+    test->loop =3D g_main_loop_new(NULL, TRUE);
+
+    srcbus =3D g_test_dbus_new(G_TEST_DBUS_NONE);
+    g_test_dbus_up(srcbus);
+    srcconnA =3D get_connection(test, &ownsrcA);
+    srcserverA =3D get_server(srcconnA, &test->srcA, &idA);
+    srcconnB =3D get_connection(test, &ownsrcB);
+    srcserverB =3D get_server(srcconnB, &test->srcB, &idB);
+
+    /* remove ,guid=3Dfoo part */
+    srcaddr =3D g_strsplit(g_test_dbus_get_bus_address(srcbus), ",", 2);
+    src_qemu_args =3D
+        g_strdup_printf("-object dbus-vmstate,id=3Ddv,addr=3D%s", srcaddr[=
0]);
+
+    dstbus =3D g_test_dbus_new(G_TEST_DBUS_NONE);
+    g_test_dbus_up(dstbus);
+    dstconnA =3D get_connection(test, &owndstA);
+    dstserverA =3D get_server(dstconnA, &test->dstA, &idA);
+    if (!test->without_dst_b) {
+        dstconnB =3D get_connection(test, &owndstB);
+        dstserverB =3D get_server(dstconnB, &test->dstB, &idB);
+    }
+
+    dstaddr =3D g_strsplit(g_test_dbus_get_bus_address(dstbus), ",", 2);
+    dst_qemu_args =3D
+        g_strdup_printf("-object dbus-vmstate,id=3Ddv,addr=3D%s -incoming =
%s",
+                        dstaddr[0], uri);
+
+    src_qemu =3D qtest_init(src_qemu_args);
+    dst_qemu =3D qtest_init(dst_qemu_args);
+    set_id_list(test, src_qemu);
+    set_id_list(test, dst_qemu);
+
+    migrate(src_qemu, uri);
+    test->src_qemu =3D src_qemu;
+    g_timeout_add_seconds(1, wait_for_migration_complete, test);
+
+    g_main_loop_run(test->loop);
+    g_main_loop_unref(test->loop);
+
+    if (test->migrate_fail) {
+        qtest_set_expected_status(dst_qemu, 1);
+    }
+    qtest_quit(dst_qemu);
+    qtest_quit(src_qemu);
+    g_bus_unown_name(ownsrcA);
+    g_bus_unown_name(ownsrcB);
+    g_bus_unown_name(owndstA);
+    if (!test->without_dst_b) {
+        g_bus_unown_name(owndstB);
+    }
+}
+
+static void
+check_not_migrated(TestServer *s, TestServer *d)
+{
+    assert(!s->save_called);
+    assert(!s->load_called);
+    assert(!d->save_called);
+    assert(!d->load_called);
+}
+
+static void
+check_migrated(TestServer *s, TestServer *d)
+{
+    assert(s->save_called);
+    assert(!s->load_called);
+    assert(!d->save_called);
+    assert(d->load_called);
+}
+
+static void
+test_dbus_vmstate_without_list(void)
+{
+    Test test =3D { 0, };
+
+    test_dbus_vmstate(&test);
+
+    check_migrated(&test.srcA, &test.dstA);
+    check_migrated(&test.srcB, &test.dstB);
+}
+
+static void
+test_dbus_vmstate_with_list(void)
+{
+    Test test =3D { .id_list =3D "idA,idB" };
+
+    test_dbus_vmstate(&test);
+
+    check_migrated(&test.srcA, &test.dstA);
+    check_migrated(&test.srcB, &test.dstB);
+}
+
+static void
+test_dbus_vmstate_only_a(void)
+{
+    Test test =3D { .id_list =3D "idA" };
+
+    test_dbus_vmstate(&test);
+
+    check_migrated(&test.srcA, &test.dstA);
+    check_not_migrated(&test.srcB, &test.dstB);
+}
+
+static void
+test_dbus_vmstate_missing_src(void)
+{
+    Test test =3D { .id_list =3D "idA,idC", .migrate_fail =3D true };
+
+    /* run in subprocess to silence QEMU error reporting */
+    if (g_test_subprocess()) {
+        test_dbus_vmstate(&test);
+        check_not_migrated(&test.srcA, &test.dstA);
+        check_not_migrated(&test.srcB, &test.dstB);
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+}
+
+static void
+test_dbus_vmstate_missing_dst(void)
+{
+    Test test =3D { .id_list =3D "idA,idB",
+                  .without_dst_b =3D true,
+                  .migrate_fail =3D true };
+
+    /* run in subprocess to silence QEMU error reporting */
+    if (g_test_subprocess()) {
+        test_dbus_vmstate(&test);
+        assert(test.srcA.save_called);
+        assert(test.srcB.save_called);
+        assert(!test.dstB.save_called);
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+}
+
+int
+main(int argc, char **argv)
+{
+    GError *err =3D NULL;
+    g_autofree char *dbus_daemon =3D NULL;
+    int ret;
+
+    dbus_daemon =3D g_build_filename(G_STRINGIFY(SRCDIR),
+                                   "tests",
+                                   "dbus-vmstate-daemon.sh",
+                                   NULL);
+    g_setenv("G_TEST_DBUS_DAEMON", dbus_daemon, true);
+
+    g_test_init(&argc, &argv, NULL);
+
+    workdir =3D g_dir_make_tmp("dbus-vmstate-test-XXXXXX", &err);
+    if (!workdir) {
+        g_error("Unable to create temporary dir: %s\n", err->message);
+        exit(1);
+    }
+
+    qtest_add_func("/dbus-vmstate/without-list",
+                   test_dbus_vmstate_without_list);
+    qtest_add_func("/dbus-vmstate/with-list",
+                   test_dbus_vmstate_with_list);
+    qtest_add_func("/dbus-vmstate/only-a",
+                   test_dbus_vmstate_only_a);
+    qtest_add_func("/dbus-vmstate/missing-src",
+                   test_dbus_vmstate_missing_src);
+    qtest_add_func("/dbus-vmstate/missing-dst",
+                   test_dbus_vmstate_missing_dst);
+
+    ret =3D g_test_run();
+
+    rmdir(workdir);
+    g_free(workdir);
+
+    return ret;
+}
diff --git a/tests/dbus-vmstate1.xml b/tests/dbus-vmstate1.xml
new file mode 100644
index 0000000000..cc8563be4c
--- /dev/null
+++ b/tests/dbus-vmstate1.xml
@@ -0,0 +1,12 @@
+<?xml version=3D"1.0"?>
+<node name=3D"/" xmlns:doc=3D"http://www.freedesktop.org/dbus/1.0/doc.dtd"=
>
+  <interface name=3D"org.qemu.VMState1">
+    <property name=3D"Id" type=3D"s" access=3D"read"/>
+    <method name=3D"Load">
+      <arg type=3D"ay" name=3D"data" direction=3D"in"/>
+    </method>
+    <method name=3D"Save">
+      <arg type=3D"ay" name=3D"data" direction=3D"out"/>
+    </method>
+  </interface>
+</node>
--=20
2.24.0.308.g228f53135a


