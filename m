Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490DB131489
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:14:27 +0100 (CET)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioU5K-0003cy-02
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTeZ-0002jg-7F
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:46:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTeX-0002ta-Nq
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:46:47 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20462
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioTeX-0002tN-Jf
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578322005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgxs0dRVcWVmJOVIoWobd4Xdot8pprgwHF0kXq2BsCc=;
 b=hJPMf5q00SUp0kEi9CvjZ5DH/gFgtYpqLuZM/K1L39llkZ6lF2GVV3U63zp2jrcGSOq13B
 8LI+40Ro9At36skXCDCVGxpNwogBlcF5yiogntnyTUOCWlydO3owEuxZpCPFB7uhvGNcSI
 L5mzdEnsnRqZViIP02J1UXGLqtHpqok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-oCevJBJZMY-iSGrFEse3aA-1; Mon, 06 Jan 2020 09:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D199F107AFF9;
 Mon,  6 Jan 2020 14:46:40 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09E535C557;
 Mon,  6 Jan 2020 14:46:36 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 1/9] vmstate: add qom interface to get id
Date: Mon,  6 Jan 2020 18:46:14 +0400
Message-Id: <20200106144622.1520994-2-marcandre.lureau@redhat.com>
In-Reply-To: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
References: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: oCevJBJZMY-iSGrFEse3aA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

Add an interface to get the instance id, instead of depending on
Device and qdev_get_dev_path().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/hw/vmstate-if.h      | 40 ++++++++++++++++++++++++++++++++++++
 include/migration/register.h |  2 ++
 include/migration/vmstate.h  |  2 ++
 hw/core/qdev.c               | 14 +++++++++++++
 hw/core/vmstate-if.c         | 23 +++++++++++++++++++++
 MAINTAINERS                  |  2 ++
 hw/core/Makefile.objs        |  1 +
 tests/Makefile.include       |  1 +
 8 files changed, 85 insertions(+)
 create mode 100644 include/hw/vmstate-if.h
 create mode 100644 hw/core/vmstate-if.c

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
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
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
index ac4f46a67d..f546f61c5e 100644
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
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 82d3ee590a..1a98812be2 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1087,9 +1087,18 @@ static void device_unparent(Object *obj)
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
@@ -1101,6 +1110,7 @@ static void device_class_init(ObjectClass *class, voi=
d *data)
      */
     dc->hotpluggable =3D true;
     dc->user_creatable =3D true;
+    vc->get_id =3D device_vmstate_if_get_id;
 }
=20
 void device_class_set_parent_reset(DeviceClass *dc,
@@ -1158,6 +1168,10 @@ static const TypeInfo device_type_info =3D {
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
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 8571327881..d280186a98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,8 @@ Migration
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
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9146e1bdee..9301b226b7 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -579,6 +579,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qdev-=
global-props.o \
 =09hw/core/irq.o \
 =09hw/core/fw-path-provider.o \
 =09hw/core/reset.o \
+=09hw/core/vmstate-if.o \
 =09$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
 =09migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
--=20
2.25.0.rc1.1.gb0343b22ed


