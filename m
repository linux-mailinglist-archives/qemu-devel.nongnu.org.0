Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E857478EE4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:04:12 +0100 (CET)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEmJ-0003DM-KW
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERU-0003Bo-26
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERR-0001l0-Tb
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZTKnnbpBds7/JO3O9qeODXIeEG4PnULWLhKLIpNrmw=;
 b=PJ6i1BJ///Bd/W77BPelZdHf1U0QjOGCldI+R8bQ0AceuV59gIINlXptjqiAh0dAljPkXq
 i0Vv4lwrJeCyv2ytMCgBCST8SbB9j6gQLVaV5iPXGNohzq5jKkiXtBtEfiupKnJeZU4SeV
 r1iYodJeUtIP4JudXmIeIa44OEgAE6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-KLiZk9bjMXiNTVVEuCbl1A-1; Fri, 17 Dec 2021 09:42:32 -0500
X-MC-Unique: KLiZk9bjMXiNTVVEuCbl1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8F38042F8;
 Fri, 17 Dec 2021 14:42:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18E335BE2C;
 Fri, 17 Dec 2021 14:42:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] ui: move qemu_spice_fill_device_address to ui/util.c
Date: Fri, 17 Dec 2021 18:37:37 +0400
Message-Id: <20211217143756.1831099-18-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Other backends can use it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
index fe08b4dd040f..eefd7e4dc1f4 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -495,4 +495,10 @@ int index_from_key(const char *key, size_t key_length);
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
index a2fbf62c528e..e271e011da1a 100644
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
index 29c80b4289b7..e2d6e317da5d 100644
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
index 31974b8d6c44..c3ac20ad4306 100644
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
index 798e0f6167e7..1043f47f9456 100644
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
index 000000000000..7e8fc1ea537a
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
index ee8ef27714cd..a9df5b911ec8 100644
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
2.34.1.8.g35151cf07204


