Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59653427DA2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:26:18 +0200 (CEST)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJrF-0002QZ-3X
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJec-0003cW-2N
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJeZ-0000Jp-Uf
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAKbSP70D6rRbhiCls4DUPYKmMXjZKuanCbhdFUQZiw=;
 b=ScYV8iHbLcxvyfITus8GdN1kdDlcpfBsfk8RwQMnMbH70zabasD0B2k/DH+H1+TryEaiAu
 DXDfOH4CoO6gswK3TixCPsgQcCvvBo6Z2/KgWXe+7fDG+5jnDAN6fz5amj53LQIZYfoCYv
 y0qK/1EIGxUKQZno9BLoT1LWGygdgRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Kax4HaI2NF2Sv1xkKKTzeA-1; Sat, 09 Oct 2021 17:13:09 -0400
X-MC-Unique: Kax4HaI2NF2Sv1xkKKTzeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41732A0CAD
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:13:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3105179B3;
 Sat,  9 Oct 2021 21:13:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/37] ui: move qemu_spice_fill_device_address to ui/util.c
Date: Sun, 10 Oct 2021 01:08:19 +0400
Message-Id: <20211009210838.2219430-19-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Other backends can use it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h       |  6 +++
 include/ui/spice-display.h |  4 --
 hw/display/qxl.c           |  7 +++-
 ui/spice-core.c            | 50 -------------------------
 ui/spice-display.c         |  5 ++-
 ui/util.c                  | 75 ++++++++++++++++++++++++++++++++++++++
 ui/meson.build             |  1 +
 7 files changed, 92 insertions(+), 56 deletions(-)
 create mode 100644 ui/util.c

diff --git a/include/ui/console.h b/include/ui/console.h
index 7a35c4fc6a..b23ae283be 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -490,4 +490,10 @@ int index_from_key(const char *key, size_t key_length);
 int udmabuf_fd(void);
 #endif
 
+/* util.c */
+bool qemu_console_fill_device_address(QemuConsole *con,
+                                      char *device_address,
+                                      size_t size,
+                                      Error **errp);
+
 #endif
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index a2fbf62c52..e271e011da 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -184,8 +184,4 @@ void qemu_spice_display_start(void);
 void qemu_spice_display_stop(void);
 int qemu_spice_display_is_running(SimpleSpiceDisplay *ssd);
 
-bool qemu_spice_fill_device_address(QemuConsole *con,
-                                    char *device_address,
-                                    size_t size);
-
 #endif
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 29c80b4289..e2d6e317da 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2171,12 +2171,17 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
     }
 
 #if SPICE_SERVER_VERSION >= 0x000e02 /* release 0.14.2 */
+    Error *err = NULL;
     char device_address[256] = "";
-    if (qemu_spice_fill_device_address(qxl->vga.con, device_address, 256)) {
+    if (qemu_console_fill_device_address(qxl->vga.con,
+                                         device_address, sizeof(device_address),
+                                         &err)) {
         spice_qxl_set_device_info(&qxl->ssd.qxl,
                                   device_address,
                                   0,
                                   qxl->max_outputs);
+    } else {
+        error_report_err(err);
     }
 #endif
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 31974b8d6c..c3ac20ad43 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -884,56 +884,6 @@ bool qemu_spice_have_display_interface(QemuConsole *con)
     return false;
 }
 
-/*
- * Recursively (in reverse order) appends addresses of PCI devices as it moves
- * up in the PCI hierarchy.
- *
- * @returns true on success, false when the buffer wasn't large enough
- */
-static bool append_pci_address(char *buf, size_t buf_size, const PCIDevice *pci)
-{
-    PCIBus *bus = pci_get_bus(pci);
-    /*
-     * equivalent to if (!pci_bus_is_root(bus)), but the function is not built
-     * with PCI_CONFIG=n, avoid using an #ifdef by checking directly
-     */
-    if (bus->parent_dev != NULL) {
-        append_pci_address(buf, buf_size, bus->parent_dev);
-    }
-
-    size_t len = strlen(buf);
-    ssize_t written = snprintf(buf + len, buf_size - len, "/%02x.%x",
-        PCI_SLOT(pci->devfn), PCI_FUNC(pci->devfn));
-
-    return written > 0 && written < buf_size - len;
-}
-
-bool qemu_spice_fill_device_address(QemuConsole *con,
-                                    char *device_address,
-                                    size_t size)
-{
-    DeviceState *dev = DEVICE(object_property_get_link(OBJECT(con),
-                                                       "device",
-                                                       &error_abort));
-    PCIDevice *pci = (PCIDevice *) object_dynamic_cast(OBJECT(dev),
-                                                       TYPE_PCI_DEVICE);
-
-    if (pci == NULL) {
-        warn_report("Setting device address of a display device to SPICE: "
-                    "Not a PCI device.");
-        return false;
-    }
-
-    strncpy(device_address, "pci/0000", size);
-    if (!append_pci_address(device_address, size, pci)) {
-        warn_report("Setting device address of a display device to SPICE: "
-            "Too many PCI devices in the chain.");
-        return false;
-    }
-
-    return true;
-}
-
 int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con)
 {
     if (g_slist_find(spice_consoles, con)) {
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 798e0f6167..1043f47f94 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1148,12 +1148,15 @@ static void qemu_spice_display_init_one(QemuConsole *con)
     qemu_spice_add_display_interface(&ssd->qxl, con);
 
 #if SPICE_SERVER_VERSION >= 0x000e02 /* release 0.14.2 */
+    Error *err = NULL;
     char device_address[256] = "";
-    if (qemu_spice_fill_device_address(con, device_address, 256)) {
+    if (qemu_console_fill_device_address(con, device_address, 256, &err)) {
         spice_qxl_set_device_info(&ssd->qxl,
                                   device_address,
                                   qemu_console_get_head(con),
                                   1);
+    } else {
+        error_report_err(err);
     }
 #endif
 
diff --git a/ui/util.c b/ui/util.c
new file mode 100644
index 0000000000..7e8fc1ea53
--- /dev/null
+++ b/ui/util.c
@@ -0,0 +1,75 @@
+/*
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "qapi/error.h"
+#include "ui/console.h"
+
+/*
+ * Recursively (in reverse order) appends addresses of PCI devices as it moves
+ * up in the PCI hierarchy.
+ *
+ * @returns true on success, false when the buffer wasn't large enough
+ */
+static bool append_pci_address(char *buf, size_t buf_size, const PCIDevice *pci)
+{
+    PCIBus *bus = pci_get_bus(pci);
+    /*
+     * equivalent to if (!pci_bus_is_root(bus)), but the function is not built
+     * with PCI_CONFIG=n, avoid using an #ifdef by checking directly
+     */
+    if (bus->parent_dev != NULL) {
+        append_pci_address(buf, buf_size, bus->parent_dev);
+    }
+
+    size_t len = strlen(buf);
+    ssize_t written = snprintf(buf + len, buf_size - len, "/%02x.%x",
+        PCI_SLOT(pci->devfn), PCI_FUNC(pci->devfn));
+
+    return written > 0 && written < buf_size - len;
+}
+
+bool qemu_console_fill_device_address(QemuConsole *con,
+                                      char *device_address,
+                                      size_t size,
+                                      Error **errp)
+{
+    ERRP_GUARD();
+    DeviceState *dev = DEVICE(object_property_get_link(OBJECT(con),
+                                                       "device",
+                                                       &error_abort));
+    PCIDevice *pci = (PCIDevice *) object_dynamic_cast(OBJECT(dev),
+                                                       TYPE_PCI_DEVICE);
+
+    if (pci == NULL) {
+        error_setg(errp, "Setting device address of a display device: "
+                   "Not a PCI device.");
+        return false;
+    }
+
+    strncpy(device_address, "pci/0000", size);
+    if (!append_pci_address(device_address, size, pci)) {
+        error_setg(errp, "Setting device address of a display device: "
+                   "Too many PCI devices in the chain.");
+        return false;
+    }
+
+    return true;
+}
diff --git a/ui/meson.build b/ui/meson.build
index ee8ef27714..a9df5b911e 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -12,6 +12,7 @@ softmmu_ss.add(files(
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
+  'util.c',
 ))
 softmmu_ss.add([spice_headers, files('spice-module.c')])
 softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
-- 
2.33.0.721.g106298f7f9


