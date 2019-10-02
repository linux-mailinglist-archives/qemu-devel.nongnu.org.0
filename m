Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21872C8765
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 13:34:25 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFctj-0002jj-Bj
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 07:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iFcqx-000109-SV
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iFcqw-0008P6-F5
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:31:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iFcqw-0008O4-7Z
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 07:31:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B8133084242;
 Wed,  2 Oct 2019 11:31:29 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A8C608C0;
 Wed,  2 Oct 2019 11:31:26 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] hw/virtio: Factorize virtio-mmio headers
Date: Wed,  2 Oct 2019 13:30:54 +0200
Message-Id: <20191002113103.45023-2-slp@redhat.com>
In-Reply-To: <20191002113103.45023-1-slp@redhat.com>
References: <20191002113103.45023-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 02 Oct 2019 11:31:29 +0000 (UTC)
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put QOM and main struct definition in a separate header file, so it
can be accessed from other components.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/virtio/virtio-mmio.c         | 48 +---------------------
 include/hw/virtio/virtio-mmio.h | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 47 deletions(-)
 create mode 100644 include/hw/virtio/virtio-mmio.h

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 3d5ca0f667..94d934c44b 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -29,57 +29,11 @@
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
-#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-mmio.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "trace.h"
=20
-/* QOM macros */
-/* virtio-mmio-bus */
-#define TYPE_VIRTIO_MMIO_BUS "virtio-mmio-bus"
-#define VIRTIO_MMIO_BUS(obj) \
-        OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_MMIO_BUS)
-#define VIRTIO_MMIO_BUS_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(VirtioBusClass, (obj), TYPE_VIRTIO_MMIO_BUS)
-#define VIRTIO_MMIO_BUS_CLASS(klass) \
-        OBJECT_CLASS_CHECK(VirtioBusClass, (klass), TYPE_VIRTIO_MMIO_BUS=
)
-
-/* virtio-mmio */
-#define TYPE_VIRTIO_MMIO "virtio-mmio"
-#define VIRTIO_MMIO(obj) \
-        OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
-
-#define VIRT_MAGIC 0x74726976 /* 'virt' */
-#define VIRT_VERSION 2
-#define VIRT_VERSION_LEGACY 1
-#define VIRT_VENDOR 0x554D4551 /* 'QEMU' */
-
-typedef struct VirtIOMMIOQueue {
-    uint16_t num;
-    bool enabled;
-    uint32_t desc[2];
-    uint32_t avail[2];
-    uint32_t used[2];
-} VirtIOMMIOQueue;
-
-typedef struct {
-    /* Generic */
-    SysBusDevice parent_obj;
-    MemoryRegion iomem;
-    qemu_irq irq;
-    bool legacy;
-    /* Guest accessible state needing migration and reset */
-    uint32_t host_features_sel;
-    uint32_t guest_features_sel;
-    uint32_t guest_page_shift;
-    /* virtio-bus */
-    VirtioBusState bus;
-    bool format_transport_address;
-    /* Fields only used for non-legacy (v2) devices */
-    uint32_t guest_features[2];
-    VirtIOMMIOQueue vqs[VIRTIO_QUEUE_MAX];
-} VirtIOMMIOProxy;
-
 static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
 {
     return kvm_eventfds_enabled();
diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-m=
mio.h
new file mode 100644
index 0000000000..c8a6ef20de
--- /dev/null
+++ b/include/hw/virtio/virtio-mmio.h
@@ -0,0 +1,73 @@
+/*
+ * Virtio MMIO bindings
+ *
+ * Copyright (c) 2011 Linaro Limited
+ *
+ * Author:
+ *  Peter Maydell <peter.maydell@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License; either version =
2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_VIRTIO_MMIO_H
+#define QEMU_VIRTIO_MMIO_H
+
+#include "hw/virtio/virtio-bus.h"
+
+/* QOM macros */
+/* virtio-mmio-bus */
+#define TYPE_VIRTIO_MMIO_BUS "virtio-mmio-bus"
+#define VIRTIO_MMIO_BUS(obj) \
+        OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_MMIO_BUS)
+#define VIRTIO_MMIO_BUS_GET_CLASS(obj) \
+        OBJECT_GET_CLASS(VirtioBusClass, (obj), TYPE_VIRTIO_MMIO_BUS)
+#define VIRTIO_MMIO_BUS_CLASS(klass) \
+        OBJECT_CLASS_CHECK(VirtioBusClass, (klass), TYPE_VIRTIO_MMIO_BUS=
)
+
+/* virtio-mmio */
+#define TYPE_VIRTIO_MMIO "virtio-mmio"
+#define VIRTIO_MMIO(obj) \
+        OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
+
+#define VIRT_MAGIC 0x74726976 /* 'virt' */
+#define VIRT_VERSION 2
+#define VIRT_VERSION_LEGACY 1
+#define VIRT_VENDOR 0x554D4551 /* 'QEMU' */
+
+typedef struct VirtIOMMIOQueue {
+    uint16_t num;
+    bool enabled;
+    uint32_t desc[2];
+    uint32_t avail[2];
+    uint32_t used[2];
+} VirtIOMMIOQueue;
+
+typedef struct {
+    /* Generic */
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq;
+    bool legacy;
+    /* Guest accessible state needing migration and reset */
+    uint32_t host_features_sel;
+    uint32_t guest_features_sel;
+    uint32_t guest_page_shift;
+    /* virtio-bus */
+    VirtioBusState bus;
+    bool format_transport_address;
+    /* Fields only used for non-legacy (v2) devices */
+    uint32_t guest_features[2];
+    VirtIOMMIOQueue vqs[VIRTIO_QUEUE_MAX];
+} VirtIOMMIOProxy;
+
+#endif
--=20
2.21.0


