Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E34D572
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 19:51:06 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he1DE-0001IB-Qc
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 13:51:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34981)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1he19O-0007LJ-Pa
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:47:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1he10F-0004oL-8O
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1he10E-0004nK-P9
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:37:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2090F86679;
 Thu, 20 Jun 2019 17:37:38 +0000 (UTC)
Received: from localhost (ovpn-116-108.ams2.redhat.com [10.36.116.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D785604A3;
 Thu, 20 Jun 2019 17:37:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 18:37:08 +0100
Message-Id: <20190620173709.14753-3-stefanha@redhat.com>
In-Reply-To: <20190620173709.14753-1-stefanha@redhat.com>
References: <20190620173709.14753-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 20 Jun 2019 17:37:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 2/3] qdev: add
 qdev_add_vm_change_state_handler()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Children sometimes depend on their parent's vm change state handler
having completed.  Add a vm change state handler API for devices that
guarantees tree depth ordering.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/core/Makefile.objs             |  1 +
 include/hw/qdev-core.h            |  5 +++
 hw/core/vm-change-state-handler.c | 61 +++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 hw/core/vm-change-state-handler.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a799c83815..dc0895ee9a 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -7,6 +7,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
 common-obj-y +=3D irq.o
 common-obj-y +=3D hotplug.o
 common-obj-$(CONFIG_SOFTMMU) +=3D nmi.o
+common-obj-$(CONFIG_SOFTMMU) +=3D vm-change-state-handler.o
=20
 common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) +=3D stream.o
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index fa55dc10ae..e157fc4acd 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -6,6 +6,7 @@
 #include "qom/object.h"
 #include "hw/irq.h"
 #include "hw/hotplug.h"
+#include "sysemu/sysemu.h"
=20
 enum {
     DEV_NVECTORS_UNSPECIFIED =3D -1,
@@ -450,4 +451,8 @@ static inline bool qbus_is_hotpluggable(BusState *bus=
)
 void device_listener_register(DeviceListener *listener);
 void device_listener_unregister(DeviceListener *listener);
=20
+VMChangeStateEntry *qdev_add_vm_change_state_handler(DeviceState *dev,
+                                                     VMChangeStateHandle=
r *cb,
+                                                     void *opaque);
+
 #endif
diff --git a/hw/core/vm-change-state-handler.c b/hw/core/vm-change-state-=
handler.c
new file mode 100644
index 0000000000..f814813bdd
--- /dev/null
+++ b/hw/core/vm-change-state-handler.c
@@ -0,0 +1,61 @@
+/*
+ *  qdev vm change state handlers
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License,
+ *  or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev.h"
+
+static int qdev_get_dev_tree_depth(DeviceState *dev)
+{
+    int depth;
+
+    for (depth =3D 0; dev; depth++) {
+        BusState *bus =3D dev->parent_bus;
+
+        if (!bus) {
+            break;
+        }
+
+        dev =3D bus->parent;
+    }
+
+    return depth;
+}
+
+/**
+ * qdev_add_vm_change_state_handler:
+ * @dev: the device that owns this handler
+ * @cb: the callback function to be invoked
+ * @opaque: user data passed to the callback function
+ *
+ * This function works like qemu_add_vm_change_state_handler() except ca=
llbacks
+ * are invoked in qdev tree depth order.  Ordering is desirable when cal=
lbacks
+ * of children depend on their parent's callback having completed first.
+ *
+ * For example, when qdev_add_vm_change_state_handler() is used, a host
+ * controller's callback is invoked before the children on its bus when =
the VM
+ * starts running.  The order is reversed when the VM stops running.
+ *
+ * Returns: an entry to be freed with qemu_del_vm_change_state_handler()
+ */
+VMChangeStateEntry *qdev_add_vm_change_state_handler(DeviceState *dev,
+                                                     VMChangeStateHandle=
r *cb,
+                                                     void *opaque)
+{
+    int depth =3D qdev_get_dev_tree_depth(dev);
+
+    return qemu_add_vm_change_state_handler_prio(cb, opaque, depth);
+}
--=20
2.21.0


