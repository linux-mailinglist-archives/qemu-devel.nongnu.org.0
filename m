Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA611AC66
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 14:49:16 +0100 (CET)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if2Mc-0002q3-EY
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 08:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1if2Jh-0000zP-Ua
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1if2Jg-0003UQ-Ji
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48968
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1if2Jf-0003RG-K8
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576071969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHQuM2hLi9OLkFKNOc+ISLpaunJaxvVelpCdD47DOFg=;
 b=cS36tjCgu+3G7yHDj84mJMoc1W/Ag7CJYlO+xn5CLxK3jE5tcJSalSEzqtYE0512HhkgW5
 BJQ+ndpZz7qAp7wazPCM7UFpVR+tz1XMGXBVwcQ2keUq++nyXK9izhmPohu92Pt4ogBCEq
 QoVpDmEmfbxt/7HMr6UK6bJ5+tP0yx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-4KcbfaO8O2-MT8g51Xp2Wg-1; Wed, 11 Dec 2019 08:46:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B085BDB63
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 13:46:07 +0000 (UTC)
Received: from localhost (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87C7662965;
 Wed, 11 Dec 2019 13:46:02 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/8] util: add dbus helper unit
Date: Wed, 11 Dec 2019 17:45:02 +0400
Message-Id: <20191211134506.1803403-5-marcandre.lureau@redhat.com>
In-Reply-To: <20191211134506.1803403-1-marcandre.lureau@redhat.com>
References: <20191211134506.1803403-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 4KcbfaO8O2-MT8g51Xp2Wg-1
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
 MAINTAINERS         |  2 ++
 include/qemu/dbus.h | 18 +++++++++++++++
 util/Makefile.objs  |  3 +++
 util/dbus.c         | 55 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 include/qemu/dbus.h
 create mode 100644 util/dbus.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 19faa0e868..f08fb4f24e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2202,6 +2202,8 @@ F: qapi/migration.json
 D-Bus
 M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
 S: Maintained
+F: util/dbus.c
+F: include/qemu/dbus.h
 F: docs/interop/dbus.rst
=20
 Seccomp
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
new file mode 100644
index 0000000000..efd74bef96
--- /dev/null
+++ b/include/qemu/dbus.h
@@ -0,0 +1,18 @@
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
+                                  const char *name);
+
+#endif /* DBUS_H */
diff --git a/util/Makefile.objs b/util/Makefile.objs
index df124af1c5..80b76352cd 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -55,5 +55,8 @@ util-obj-$(CONFIG_INOTIFY1) +=3D filemonitor-inotify.o
 util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
 util-obj-$(CONFIG_POSIX) +=3D drm.o
 util-obj-y +=3D guest-random.o
+util-obj-$(CONFIG_GIO) +=3D dbus.o
+dbus.o-cflags =3D $(GIO_CFLAGS)
+dbus.o-libs =3D $(GIO_LIBS)
=20
 stub-obj-y +=3D filemonitor-stub.o
diff --git a/util/dbus.c b/util/dbus.c
new file mode 100644
index 0000000000..bb51870e54
--- /dev/null
+++ b/util/dbus.c
@@ -0,0 +1,55 @@
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
+
+/*
+ * qemu_dbus_get_queued_owners() - return the list of queued unique names
+ * @connection: A GDBusConnection
+ * @name: a service name
+ *
+ * Return: a GStrv of unique names, or NULL on failure.
+ */
+GStrv
+qemu_dbus_get_queued_owners(GDBusConnection *connection, const char *name)
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
+        error_report("Failed to create DBus proxy: %s", err->message);
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
+        error_report("Failed to call ListQueuedOwners: %s", err->message);
+        return NULL;
+    }
+
+    child =3D g_variant_get_child_value(result, 0);
+    return g_variant_dup_strv(child, NULL);
+}
--=20
2.24.0.308.g228f53135a


