Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97521CB8CF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 13:00:05 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGLJb-0004y2-Uf
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 07:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iGKhy-0000Fx-GM
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iGKhx-0002ps-1M
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:21:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iGKhw-0002pX-Pc
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:21:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 143198A1C9F
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 10:21:08 +0000 (UTC)
Received: from localhost (ovpn-112-73.ams2.redhat.com [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6CA1001B2B;
 Fri,  4 Oct 2019 10:21:03 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] vmstate: add qom interface to get id
Date: Fri,  4 Oct 2019 14:20:44 +0400
Message-Id: <20191004102051.19738-2-marcandre.lureau@redhat.com>
In-Reply-To: <20191004102051.19738-1-marcandre.lureau@redhat.com>
References: <20191004102051.19738-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 04 Oct 2019 10:21:08 +0000 (UTC)
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
 dgilbert@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an interface to get the instance id, instead of depending on
Device and qdev_get_dev_path().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 MAINTAINERS                  |  2 ++
 hw/core/Makefile.objs        |  1 +
 hw/core/qdev.c               | 14 +++++++++++++
 hw/core/vmstate-if.c         | 23 +++++++++++++++++++++
 include/hw/vmstate-if.h      | 40 ++++++++++++++++++++++++++++++++++++
 include/migration/register.h |  2 ++
 include/migration/vmstate.h  |  2 ++
 tests/Makefile.include       |  1 +
 8 files changed, 85 insertions(+)
 create mode 100644 hw/core/vmstate-if.c
 create mode 100644 include/hw/vmstate-if.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 21264eae9c..cf63634221 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2147,6 +2147,8 @@ Migration
 M: Juan Quintela <quintela@redhat.com>
 M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 S: Maintained
+F: hw/core/vmstate-if.c
+F: include/hw/vmstate-if.h
 F: include/migration/
 F: migration/
 F: scripts/vmstate-static-checker.py
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index fd0550d1d9..0edd9e635d 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -9,6 +9,7 @@ common-obj-y +=3D hotplug.o
 common-obj-$(CONFIG_SOFTMMU) +=3D nmi.o
 common-obj-$(CONFIG_SOFTMMU) +=3D vm-change-state-handler.o
 common-obj-y +=3D cpu.o
+common-obj-y +=3D vmstate-if.o
=20
 common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) +=3D stream.o
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cbad6c1d55..fe13ccb37f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1064,9 +1064,18 @@ static void device_unparent(Object *obj)
     }
 }
=20
+static char *
+device_vmstate_if_get_id(VMStateIf *obj)
+{
+    DeviceState *dev =3D DEVICE(obj);
+
+    return qdev_get_dev_path(dev);
+}
+
 static void device_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(class);
+    VMStateIfClass *vc =3D VMSTATE_IF_CLASS(class);
=20
     class->unparent =3D device_unparent;
=20
@@ -1078,6 +1087,7 @@ static void device_class_init(ObjectClass *class, v=
oid *data)
      */
     dc->hotpluggable =3D true;
     dc->user_creatable =3D true;
+    vc->get_id =3D device_vmstate_if_get_id;
 }
=20
 void device_class_set_parent_reset(DeviceClass *dc,
@@ -1135,6 +1145,10 @@ static const TypeInfo device_type_info =3D {
     .class_init =3D device_class_init,
     .abstract =3D true,
     .class_size =3D sizeof(DeviceClass),
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_VMSTATE_IF },
+        { }
+    }
 };
=20
 static void qdev_register_types(void)
diff --git a/hw/core/vmstate-if.c b/hw/core/vmstate-if.c
new file mode 100644
index 0000000000..bf453620fe
--- /dev/null
+++ b/hw/core/vmstate-if.c
@@ -0,0 +1,23 @@
+/*
+ * VMState interface
+ *
+ * Copyright (c) 2009-2019 Red Hat Inc
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/vmstate-if.h"
+
+static const TypeInfo vmstate_if_info =3D {
+    .name =3D TYPE_VMSTATE_IF,
+    .parent =3D TYPE_INTERFACE,
+    .class_size =3D sizeof(VMStateIfClass),
+};
+
+static void vmstate_register_types(void)
+{
+    type_register_static(&vmstate_if_info);
+}
+
+type_init(vmstate_register_types);
diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
new file mode 100644
index 0000000000..8ff7f0f292
--- /dev/null
+++ b/include/hw/vmstate-if.h
@@ -0,0 +1,40 @@
+/*
+ * VMState interface
+ *
+ * Copyright (c) 2009-2019 Red Hat Inc
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef VMSTATE_IF_H
+#define VMSTATE_IF_H
+
+#include "qom/object.h"
+
+#define TYPE_VMSTATE_IF "vmstate-if"
+
+#define VMSTATE_IF_CLASS(klass)                                     \
+    OBJECT_CLASS_CHECK(VMStateIfClass, (klass), TYPE_VMSTATE_IF)
+#define VMSTATE_IF_GET_CLASS(obj)                           \
+    OBJECT_GET_CLASS(VMStateIfClass, (obj), TYPE_VMSTATE_IF)
+#define VMSTATE_IF(obj)                             \
+    INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
+
+typedef struct VMStateIf VMStateIf;
+
+typedef struct VMStateIfClass {
+    InterfaceClass parent_class;
+
+    char * (*get_id)(VMStateIf *obj);
+} VMStateIfClass;
+
+static inline char *vmstate_if_get_id(VMStateIf *vmif)
+{
+    if (!vmif) {
+        return NULL;
+    }
+
+    return VMSTATE_IF_GET_CLASS(vmif)->get_id(vmif);
+}
+
+#endif /* VMSTATE_IF_H */
diff --git a/include/migration/register.h b/include/migration/register.h
index a13359a08d..73149c9a01 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -14,6 +14,8 @@
 #ifndef MIGRATION_REGISTER_H
 #define MIGRATION_REGISTER_H
=20
+#include "hw/vmstate-if.h"
+
 typedef struct SaveVMHandlers {
     /* This runs inside the iothread lock.  */
     SaveStateHandler *save_state;
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1fbfd099dd..bdcf8a1652 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -27,6 +27,8 @@
 #ifndef QEMU_VMSTATE_H
 #define QEMU_VMSTATE_H
=20
+#include "hw/vmstate-if.h"
+
 typedef struct VMStateInfo VMStateInfo;
 typedef struct VMStateField VMStateField;
=20
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3543451ed3..81ca5ba494 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -565,6 +565,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qde=
v-global-props.o \
 	hw/core/irq.o \
 	hw/core/fw-path-provider.o \
 	hw/core/reset.o \
+	hw/core/vmstate-if.o \
 	$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
 	migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
--=20
2.23.0


