Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89EC0853
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:09:22 +0200 (CEST)
Received: from localhost ([::1]:52170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrs1-000187-48
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDqWh-0006Tw-3Q
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDqWe-0005R2-9v
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iDqWe-0005Qu-0j
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:43:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 439BD3065603
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 13:43:11 +0000 (UTC)
Received: from localhost (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 368B8600C6;
 Fri, 27 Sep 2019 13:43:06 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] Add dbus-vmstate object
Date: Fri, 27 Sep 2019 17:42:22 +0400
Message-Id: <20190927134224.14550-6-marcandre.lureau@redhat.com>
In-Reply-To: <20190927134224.14550-1-marcandre.lureau@redhat.com>
References: <20190927134224.14550-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 27 Sep 2019 13:43:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 dgilbert@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When instantiated, this object will connect to the given D-Bus bus
"addr". During migration, it will take/restore the data from
org.qemu.VMState1 instances. See documentation for details.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 MAINTAINERS                   |   2 +
 backends/Makefile.objs        |   4 +
 backends/dbus-vmstate.c       | 496 ++++++++++++++++++++++++++++++++++
 docs/interop/dbus-vmstate.rst |  74 +++++
 docs/interop/dbus.rst         |   5 +
 docs/interop/index.rst        |   1 +
 6 files changed, 582 insertions(+)
 create mode 100644 backends/dbus-vmstate.c
 create mode 100644 docs/interop/dbus-vmstate.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index dccea79d48..b6325494ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2160,9 +2160,11 @@ F: qapi/migration.json
 D-Bus
 M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
 S: Maintained
+F: backends/dbus-vmstate.c
 F: util/dbus.c
 F: include/qemu/dbus.h
 F: docs/interop/dbus.rst
+F: docs/interop/dbus-vmstate.rst
=20
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
diff --git a/backends/Makefile.objs b/backends/Makefile.objs
index f0691116e8..28a847cd57 100644
--- a/backends/Makefile.objs
+++ b/backends/Makefile.objs
@@ -17,3 +17,7 @@ endif
 common-obj-$(call land,$(CONFIG_VHOST_USER),$(CONFIG_VIRTIO)) +=3D vhost=
-user.o
=20
 common-obj-$(CONFIG_LINUX) +=3D hostmem-memfd.o
+
+common-obj-$(CONFIG_GIO) +=3D dbus-vmstate.o
+dbus-vmstate.o-cflags =3D $(GIO_CFLAGS)
+dbus-vmstate.o-libs =3D $(GIO_LIBS)
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
new file mode 100644
index 0000000000..f799d6ddaf
--- /dev/null
+++ b/backends/dbus-vmstate.c
@@ -0,0 +1,496 @@
+/*
+ * QEMU dbus-vmstate
+ *
+ * Copyright (C) 2019 Red Hat Inc
+ *
+ * Authors:
+ *  Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/dbus.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "qapi/qmp/qerror.h"
+#include "migration/vmstate.h"
+
+typedef struct DBusVMState DBusVMState;
+typedef struct DBusVMStateClass DBusVMStateClass;
+
+#define TYPE_DBUS_VMSTATE "dbus-vmstate"
+#define DBUS_VMSTATE(obj)                                \
+    OBJECT_CHECK(DBusVMState, (obj), TYPE_DBUS_VMSTATE)
+#define DBUS_VMSTATE_GET_CLASS(obj)                              \
+    OBJECT_GET_CLASS(DBusVMStateClass, (obj), TYPE_DBUS_VMSTATE)
+#define DBUS_VMSTATE_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(DBusVMStateClass, (klass), TYPE_DBUS_VMSTATE)
+
+struct DBusVMStateClass {
+    ObjectClass parent_class;
+};
+
+struct DBusVMState {
+    Object parent;
+
+    GDBusConnection *bus;
+    char *dbus_addr;
+    char *id_list;
+
+    uint32_t data_size;
+    uint8_t *data;
+};
+
+static const GDBusPropertyInfo vmstate_property_info[] =3D {
+    { -1, (char *) "Id", (char *) "s",
+      G_DBUS_PROPERTY_INFO_FLAGS_READABLE, NULL },
+};
+
+static const GDBusPropertyInfo * const vmstate_property_info_pointers[] =
=3D {
+    &vmstate_property_info[0],
+    NULL
+};
+
+static const GDBusInterfaceInfo vmstate1_interface_info =3D {
+    -1,
+    (char *) "org.qemu.VMState1",
+    (GDBusMethodInfo **) NULL,
+    (GDBusSignalInfo **) NULL,
+    (GDBusPropertyInfo **) &vmstate_property_info_pointers,
+    NULL,
+};
+
+#define DBUS_VMSTATE_SIZE_LIMIT (1 * MiB)
+
+static GHashTable *
+get_id_list_set(DBusVMState *self)
+{
+    g_auto(GStrv) ids =3D NULL;
+    g_autoptr(GHashTable) set =3D NULL;
+    int i;
+
+    if (!self->id_list) {
+        return NULL;
+    }
+
+    ids =3D g_strsplit(self->id_list, ",", -1);
+    set =3D g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL)=
;
+    for (i =3D 0; ids[i]; i++) {
+        g_hash_table_add(set, ids[i]);
+        ids[i] =3D NULL;
+    }
+
+    return g_steal_pointer(&set);
+}
+
+static GHashTable *
+dbus_get_proxies(DBusVMState *self, GError **err)
+{
+    g_autoptr(GHashTable) proxies =3D NULL;
+    g_autoptr(GHashTable) ids =3D NULL;
+    g_auto(GStrv) names =3D NULL;
+    size_t i;
+
+    ids =3D get_id_list_set(self);
+    proxies =3D g_hash_table_new_full(g_str_hash, g_str_equal,
+                                    g_free, g_object_unref);
+
+    names =3D qemu_dbus_get_queued_owners(self->bus, "org.qemu.VMState1"=
);
+    if (!names) {
+        return NULL;
+    }
+
+    for (i =3D 0; names[i]; i++) {
+        g_autoptr(GDBusProxy) proxy =3D NULL;
+        g_autoptr(GVariant) result =3D NULL;
+        g_autofree char *id =3D NULL;
+        size_t size;
+
+        proxy =3D g_dbus_proxy_new_sync(self->bus, G_DBUS_PROXY_FLAGS_NO=
NE,
+                    (GDBusInterfaceInfo *) &vmstate1_interface_info,
+                    names[i],
+                    "/org/qemu/VMState1",
+                    "org.qemu.VMState1",
+                    NULL, err);
+        if (!proxy) {
+            return NULL;
+        }
+
+        result =3D g_dbus_proxy_get_cached_property(proxy, "Id");
+        if (!result) {
+            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
+                                "VMState Id property is missing.");
+            return NULL;
+        }
+
+        id =3D g_variant_dup_string(result, &size);
+        if (ids && !g_hash_table_remove(ids, id)) {
+            g_clear_pointer(&id, g_free);
+            g_clear_object(&proxy);
+            continue;
+        }
+        if (size =3D=3D 0 || size >=3D 256) {
+            g_set_error(err, G_IO_ERROR, G_IO_ERROR_FAILED,
+                        "VMState Id '%s' is invalid.", id);
+            return NULL;
+        }
+
+        if (!g_hash_table_insert(proxies, id, proxy)) {
+            g_set_error(err, G_IO_ERROR, G_IO_ERROR_FAILED,
+                        "Duplicated VMState Id '%s'", id);
+            return NULL;
+        }
+        id =3D NULL;
+        proxy =3D NULL;
+
+        g_clear_pointer(&result, g_variant_unref);
+    }
+
+    if (ids) {
+        g_autofree char **left =3D NULL;
+
+        left =3D (char **)g_hash_table_get_keys_as_array(ids, NULL);
+        if (*left) {
+            g_autofree char *leftids =3D g_strjoinv(",", left);
+            g_set_error(err, G_IO_ERROR, G_IO_ERROR_FAILED,
+                        "Required VMState Id are missing: %s", leftids);
+            return NULL;
+        }
+    }
+
+    return g_steal_pointer(&proxies);
+}
+
+static int
+dbus_load_state_proxy(GDBusProxy *proxy, const uint8_t *data, size_t siz=
e)
+{
+    g_autoptr(GError) err =3D NULL;
+    g_autoptr(GVariant) result =3D NULL;
+    g_autoptr(GVariant) value =3D NULL;
+
+    value =3D g_variant_new_fixed_array(G_VARIANT_TYPE_BYTE,
+                                      data, size, sizeof(char));
+    result =3D g_dbus_proxy_call_sync(proxy, "Load",
+                                    g_variant_new("(@ay)",
+                                                  g_steal_pointer(&value=
)),
+                                    G_DBUS_CALL_FLAGS_NO_AUTO_START,
+                                    -1, NULL, &err);
+    if (!result) {
+        error_report("Failed to Load: %s", err->message);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int dbus_vmstate_post_load(void *opaque, int version_id)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(opaque);
+    g_autoptr(GInputStream) m =3D NULL;
+    g_autoptr(GDataInputStream) s =3D NULL;
+    g_autoptr(GError) err =3D NULL;
+    g_autoptr(GHashTable) proxies =3D NULL;
+    uint32_t nelem;
+
+    proxies =3D dbus_get_proxies(self, &err);
+    if (!proxies) {
+        error_report("Failed to get proxies: %s", err->message);
+        return -1;
+    }
+
+    m =3D g_memory_input_stream_new_from_data(self->data, self->data_siz=
e, NULL);
+    s =3D g_data_input_stream_new(m);
+    g_data_input_stream_set_byte_order(s, G_DATA_STREAM_BYTE_ORDER_BIG_E=
NDIAN);
+
+    nelem =3D g_data_input_stream_read_uint32(s, NULL, &err);
+    if (err) {
+        goto error;
+    }
+
+    while (nelem > 0) {
+        GDBusProxy *proxy =3D NULL;
+        uint32_t len;
+        gsize bytes_read, avail;
+        char id[256];
+
+        len =3D g_data_input_stream_read_uint32(s, NULL, &err);
+        if (err) {
+            goto error;
+        }
+        if (len >=3D 256) {
+            error_report("Invalid DBus vmstate proxy name %u", len);
+            return -1;
+        }
+        if (!g_input_stream_read_all(G_INPUT_STREAM(s), id, len,
+                                     &bytes_read, NULL, &err)) {
+            goto error;
+        }
+        g_return_val_if_fail(bytes_read =3D=3D len, -1);
+        id[len] =3D 0;
+
+        proxy =3D g_hash_table_lookup(proxies, id);
+        if (!proxy) {
+            error_report("Failed to find proxy Id '%s'", id);
+            return -1;
+        }
+
+        len =3D g_data_input_stream_read_uint32(s, NULL, &err);
+        avail =3D g_buffered_input_stream_get_available(
+            G_BUFFERED_INPUT_STREAM(s));
+
+        if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
+            error_report("Invalid vmstate size: %u", len);
+            return -1;
+        }
+
+        if (dbus_load_state_proxy(proxy,
+                g_buffered_input_stream_peek_buffer(G_BUFFERED_INPUT_STR=
EAM(s),
+                                                    NULL),
+                len) < 0) {
+            error_report("Failed to restore Id '%s'", id);
+            return -1;
+        }
+
+        if (!g_seekable_seek(G_SEEKABLE(s), len, G_SEEK_CUR, NULL, &err)=
) {
+            goto error;
+        }
+
+        nelem -=3D 1;
+    }
+
+    return 0;
+
+error:
+    error_report("Failed to read from stream: %s", err->message);
+    return -1;
+}
+
+static void
+dbus_save_state_proxy(gpointer key,
+                      gpointer value,
+                      gpointer user_data)
+{
+    GDataOutputStream *s =3D user_data;
+    const char *id =3D key;
+    GDBusProxy *proxy =3D value;
+    g_autoptr(GVariant) result =3D NULL;
+    g_autoptr(GVariant) child =3D NULL;
+    g_autoptr(GError) err =3D NULL;
+    const uint8_t *data;
+    gsize size;
+
+    result =3D g_dbus_proxy_call_sync(proxy, "Save",
+                                    NULL, G_DBUS_CALL_FLAGS_NO_AUTO_STAR=
T,
+                                    -1, NULL, &err);
+    if (!result) {
+        error_report("Failed to Save: %s", err->message);
+        return;
+    }
+
+    child =3D g_variant_get_child_value(result, 0);
+    data =3D g_variant_get_fixed_array(child, &size, sizeof(char));
+    if (!data) {
+        error_report("Failed to Save: not a byte array");
+        return;
+    }
+    if (size > DBUS_VMSTATE_SIZE_LIMIT) {
+        error_report("Too large vmstate data to save: %lu", size);
+        return;
+    }
+
+    if (!g_data_output_stream_put_uint32(s, strlen(id), NULL, &err) ||
+        !g_data_output_stream_put_string(s, id, NULL, &err) ||
+        !g_data_output_stream_put_uint32(s, size, NULL, &err) ||
+        !g_output_stream_write_all(G_OUTPUT_STREAM(s),
+                                   data, size, NULL, NULL, &err)) {
+        error_report("Failed to write to stream: %s", err->message);
+    }
+}
+
+static int dbus_vmstate_pre_save(void *opaque)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(opaque);
+    g_autoptr(GOutputStream) m =3D NULL;
+    g_autoptr(GDataOutputStream) s =3D NULL;
+    g_autoptr(GHashTable) proxies =3D NULL;
+    g_autoptr(GError) err =3D NULL;
+
+    proxies =3D dbus_get_proxies(self, &err);
+    if (!proxies) {
+        error_report("Failed to get proxies: %s", err->message);
+        return -1;
+    }
+
+    m =3D g_memory_output_stream_new_resizable();
+    s =3D g_data_output_stream_new(m);
+    g_data_output_stream_set_byte_order(s, G_DATA_STREAM_BYTE_ORDER_BIG_=
ENDIAN);
+
+    if (!g_data_output_stream_put_uint32(s, g_hash_table_size(proxies),
+                                         NULL, &err)) {
+        error_report("Failed to write to stream: %s", err->message);
+        return -1;
+    }
+
+    g_hash_table_foreach(proxies, dbus_save_state_proxy, s);
+
+    if (g_memory_output_stream_get_size(G_MEMORY_OUTPUT_STREAM(m))
+        > UINT32_MAX) {
+        error_report("DBus vmstate buffer is too large");
+        return -1;
+    }
+
+    if (!g_output_stream_close(G_OUTPUT_STREAM(m), NULL, &err)) {
+        error_report("Failed to close stream: %s", err->message);
+        return -1;
+    }
+
+    g_free(self->data);
+    self->data_size =3D
+        g_memory_output_stream_get_size(G_MEMORY_OUTPUT_STREAM(m));
+    self->data =3D
+        g_memory_output_stream_steal_data(G_MEMORY_OUTPUT_STREAM(m));
+
+    return 0;
+}
+
+static const VMStateDescription dbus_vmstate =3D {
+    .name =3D TYPE_DBUS_VMSTATE,
+    .version_id =3D 0,
+    .pre_save =3D dbus_vmstate_pre_save,
+    .post_load =3D dbus_vmstate_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(data_size, DBusVMState),
+        VMSTATE_VBUFFER_ALLOC_UINT32(data, DBusVMState, 0, 0, data_size)=
,
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void
+dbus_vmstate_complete(UserCreatable *uc, Error **errp)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(uc);
+    GError *err =3D NULL;
+    GDBusConnection *bus;
+
+    if (!object_resolve_path_type("", TYPE_DBUS_VMSTATE, NULL)) {
+        error_setg(errp, "There is already an instance of %s",
+                   TYPE_DBUS_VMSTATE);
+        return;
+    }
+
+    if (!self->dbus_addr) {
+        error_setg(errp, QERR_MISSING_PARAMETER, "addr");
+        return;
+    }
+
+    bus =3D g_dbus_connection_new_for_address_sync(self->dbus_addr,
+             G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+             G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+             NULL, NULL, &err);
+    if (err) {
+        error_setg(errp, "failed to connect to DBus: '%s'", err->message=
);
+        g_clear_error(&err);
+    }
+
+    self->bus =3D bus;
+
+    if (vmstate_register(VMSTATE_IF(self), -1, &dbus_vmstate, self) < 0)=
 {
+        error_setg(errp, "Failed to register vmstate");
+    }
+}
+
+static void
+dbus_vmstate_finalize(Object *o)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(o);
+
+    vmstate_unregister(VMSTATE_IF(self), &dbus_vmstate, self);
+
+    g_clear_object(&self->bus);
+    g_free(self->dbus_addr);
+    g_free(self->id_list);
+    g_free(self->data);
+}
+
+static char *
+get_dbus_addr(Object *o, Error **errp)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(o);
+
+    return g_strdup(self->dbus_addr);
+}
+
+static void
+set_dbus_addr(Object *o, const char *str, Error **errp)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(o);
+
+    g_free(self->dbus_addr);
+    self->dbus_addr =3D g_strdup(str);
+}
+
+static char *
+get_id_list(Object *o, Error **errp)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(o);
+
+    return g_strdup(self->id_list);
+}
+
+static void
+set_id_list(Object *o, const char *str, Error **errp)
+{
+    DBusVMState *self =3D DBUS_VMSTATE(o);
+
+    g_free(self->id_list);
+    self->id_list =3D g_strdup(str);
+}
+
+static char *
+dbus_vmstate_get_id(VMStateIf *vmif)
+{
+    return g_strdup(TYPE_DBUS_VMSTATE);
+}
+
+static void
+dbus_vmstate_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);
+    VMStateIfClass *vc =3D VMSTATE_IF_CLASS(oc);
+
+    ucc->complete =3D dbus_vmstate_complete;
+    vc->get_id =3D dbus_vmstate_get_id;
+
+    object_class_property_add_str(oc, "addr",
+                                  get_dbus_addr, set_dbus_addr,
+                                  &error_abort);
+    object_class_property_add_str(oc, "id-list",
+                                  get_id_list, set_id_list,
+                                  &error_abort);
+}
+
+static const TypeInfo dbus_vmstate_info =3D {
+    .name =3D TYPE_DBUS_VMSTATE,
+    .parent =3D TYPE_OBJECT,
+    .instance_size =3D sizeof(DBusVMState),
+    .instance_finalize =3D dbus_vmstate_finalize,
+    .class_size =3D sizeof(DBusVMStateClass),
+    .class_init =3D dbus_vmstate_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { TYPE_VMSTATE_IF },
+        { }
+    }
+};
+
+static void
+register_types(void)
+{
+    type_register_static(&dbus_vmstate_info);
+}
+
+type_init(register_types);
diff --git a/docs/interop/dbus-vmstate.rst b/docs/interop/dbus-vmstate.rs=
t
new file mode 100644
index 0000000000..8693891640
--- /dev/null
+++ b/docs/interop/dbus-vmstate.rst
@@ -0,0 +1,74 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+D-Bus VMState
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The QEMU dbus-vmstate object's aim is to migrate helpers' data running
+on a QEMU D-Bus bus. (refer to the :doc:`dbus` document for
+recommendation on D-Bus usage)
+
+Upon migration, QEMU will go through the queue of
+``org.qemu.VMState1`` D-Bus name owners and query their ``Id``. It
+must be unique among the helpers.
+
+It will then save arbitrary data of each Id to be transferred in the
+migration stream and restored/loaded at the corresponding destination
+helper.
+
+The data amount to be transferred is limited to 1Mb. The state must be
+saved quickly (a few seconds maximum). (D-Bus imposes a time limit on
+reply anyway, and migration would fail if data isn't given quickly
+enough.)
+
+dbus-vmstate object can be configured with the expected list of
+helpers by setting its ``id-list`` property, with a comma-separated
+``Id`` list.
+
+Interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+On object path ``/org/qemu/VMState1``, the following
+``org.qemu.VMState1`` interface should be implemented:
+
+.. code:: xml
+
+  <interface name=3D"org.qemu.VMState1">
+    <property name=3D"Id" type=3D"s" access=3D"read"/>
+    <method name=3D"Load">
+      <arg type=3D"ay" name=3D"data" direction=3D"in"/>
+    </method>
+    <method name=3D"Save">
+      <arg type=3D"ay" name=3D"data" direction=3D"out"/>
+    </method>
+  </interface>
+
+"Id" property
+-------------
+
+A string that identifies the helper uniquely. (maximum 256 bytes
+including terminating NUL byte)
+
+.. note::
+
+   The helper ID namespace is a separate namespace. In particular, it is=
 not
+   related to QEMU "id" used in -object/-device objects.
+
+Load(in u8[] bytes) method
+--------------------------
+
+The method called on destination with the state to restore.
+
+The helper may be initially started in a waiting state (with
+an --incoming argument for example), and it may resume on success.
+
+An error may be returned to the caller.
+
+Save(out u8[] bytes) method
+---------------------------
+
+The method called on the source to get the current state to be
+migrated. The helper should continue to run normally.
+
+An error may be returned to the caller.
diff --git a/docs/interop/dbus.rst b/docs/interop/dbus.rst
index 3d760e4882..d9af608dc9 100644
--- a/docs/interop/dbus.rst
+++ b/docs/interop/dbus.rst
@@ -97,3 +97,8 @@ the "D-Bus API Design Guidelines":
 https://dbus.freedesktop.org/doc/dbus-api-design.html
=20
 The "org.qemu.*" prefix is reserved for the QEMU project.
+
+QEMU Interfaces
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+:doc:`dbus-vmstate`
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index ded134ea75..049387ac6d 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -14,6 +14,7 @@ Contents:
=20
    bitmaps
    dbus
+   dbus-vmstate
    live-block-operations
    pr-helper
    qemu-ga
--=20
2.23.0


