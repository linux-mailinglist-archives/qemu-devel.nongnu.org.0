Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AE1314C4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:26:01 +0100 (CET)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUGV-0002rS-5R
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTf9-0003XZ-KJ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTf4-00037o-46
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22423
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioTf4-00037Z-03
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578322037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnggqyY7jXoYcxTAVAI6egAZmyRwKbX+QeATdxe7/Nc=;
 b=KWr1quaKTt4+KjNYWaaJsn23OOwkXQLxF9Iyps8Nl11H59I15WiKlhYTlDuxkVIX4fPZ/Z
 rbh2jY+6OWerXIeW8sw5DeqLIQIsy3TZ+le64KuAynnjE/bo5rAhdLnMTlKiYBmISKUDjH
 5Asc+n4VATYax2pVvK2h13OtJ1DgNzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-3_MHpCf7OI6U3ub0qjYc9w-1; Mon, 06 Jan 2020 09:47:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CCE805850;
 Mon,  6 Jan 2020 14:47:13 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4FD101F942;
 Mon,  6 Jan 2020 14:47:08 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 4/9] util: add dbus helper unit
Date: Mon,  6 Jan 2020 18:46:17 +0400
Message-Id: <20200106144622.1520994-5-marcandre.lureau@redhat.com>
In-Reply-To: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
References: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 3_MHpCf7OI6U3ub0qjYc9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 include/qemu/dbus.h | 19 +++++++++++++++
 util/dbus.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS         |  2 ++
 util/Makefile.objs  |  3 +++
 4 files changed, 81 insertions(+)
 create mode 100644 include/qemu/dbus.h
 create mode 100644 util/dbus.c

diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
new file mode 100644
index 0000000000..9d591f9ee4
--- /dev/null
+++ b/include/qemu/dbus.h
@@ -0,0 +1,19 @@
+/*
+ * Helpers for using D-Bus
+ *
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef DBUS_H
+#define DBUS_H
+
+#include <gio/gio.h>
+
+GStrv qemu_dbus_get_queued_owners(GDBusConnection *connection,
+                                  const char *name,
+                                  Error **errp);
+
+#endif /* DBUS_H */
diff --git a/util/dbus.c b/util/dbus.c
new file mode 100644
index 0000000000..9099dc5b4b
--- /dev/null
+++ b/util/dbus.c
@@ -0,0 +1,57 @@
+/*
+ * Helpers for using D-Bus
+ *
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/dbus.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+/*
+ * qemu_dbus_get_queued_owners() - return the list of queued unique names
+ * @connection: A GDBusConnection
+ * @name: a service name
+ *
+ * Return: a GStrv of unique names, or NULL on failure.
+ */
+GStrv
+qemu_dbus_get_queued_owners(GDBusConnection *connection, const char *name,
+                            Error **errp)
+{
+    g_autoptr(GDBusProxy) proxy =3D NULL;
+    g_autoptr(GVariant) result =3D NULL;
+    g_autoptr(GVariant) child =3D NULL;
+    g_autoptr(GError) err =3D NULL;
+
+    proxy =3D g_dbus_proxy_new_sync(connection, G_DBUS_PROXY_FLAGS_NONE, N=
ULL,
+                                  "org.freedesktop.DBus",
+                                  "/org/freedesktop/DBus",
+                                  "org.freedesktop.DBus",
+                                  NULL, &err);
+    if (!proxy) {
+        error_setg(errp, "Failed to create DBus proxy: %s", err->message);
+        return NULL;
+    }
+
+    result =3D g_dbus_proxy_call_sync(proxy, "ListQueuedOwners",
+                                    g_variant_new("(s)", name),
+                                    G_DBUS_CALL_FLAGS_NO_AUTO_START,
+                                    -1, NULL, &err);
+    if (!result) {
+        if (g_error_matches(err,
+                            G_DBUS_ERROR,
+                            G_DBUS_ERROR_NAME_HAS_NO_OWNER)) {
+            return g_new0(char *, 1);
+        }
+        error_setg(errp, "Failed to call ListQueuedOwners: %s", err->messa=
ge);
+        return NULL;
+    }
+
+    child =3D g_variant_get_child_value(result, 0);
+    return g_variant_dup_strv(child, NULL);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 72b253a5bd..e2e879e733 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2209,6 +2209,8 @@ F: qapi/migration.json
 D-Bus
 M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
 S: Maintained
+F: util/dbus.c
+F: include/qemu/dbus.h
 F: docs/interop/dbus.rst
=20
 Seccomp
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 63599d62aa..11262aafaf 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -56,3 +56,6 @@ util-obj-$(call lnot,$(CONFIG_INOTIFY1)) +=3D filemonitor=
-stub.o
 util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
 util-obj-$(CONFIG_POSIX) +=3D drm.o
 util-obj-y +=3D guest-random.o
+util-obj-$(CONFIG_GIO) +=3D dbus.o
+dbus.o-cflags =3D $(GIO_CFLAGS)
+dbus.o-libs =3D $(GIO_LIBS)
--=20
2.25.0.rc1.1.gb0343b22ed


