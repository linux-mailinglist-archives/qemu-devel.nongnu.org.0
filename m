Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582A20388C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 15:58:58 +0200 (CEST)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnMyP-0008Ik-Bs
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 09:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvl-0005JR-Ms
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41839
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnMvj-0007iP-SR
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 09:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592834171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=qPB343KyU7kxiThl8E/iCJi0KCxYplSXSK26Hiy/p00=;
 b=SkhwQ7PCHZ33a15/aJkCrPuusoPj91Q/bozSlmmUk1xMAeswplbtV/9cWOKBSULTKkI9p0
 5z2RZzQCWu0zpY+9yty6c0ACMzMduUSY0pUdqLvJqDko42n8fTnkoua2vE1WgsLas2+orE
 htpneVP06NTjW5WbuIofST95ra+2CFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-MDB3GZqrOZqSm5_343yTLA-1; Mon, 22 Jun 2020 09:56:09 -0400
X-MC-Unique: MDB3GZqrOZqSm5_343yTLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D0BC18A072C
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 13:56:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56F207C1FE;
 Mon, 22 Jun 2020 13:56:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 311101750C; Mon, 22 Jun 2020 15:56:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] qdev: add support for device module loading
Date: Mon, 22 Jun 2020 15:55:55 +0200
Message-Id: <20200622135601.12433-2-kraxel@redhat.com>
In-Reply-To: <20200622135601.12433-1-kraxel@redhat.com>
References: <20200622135601.12433-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling devices as modules we'll need some infrastrtucture to
actually load those modules if needed.  This patch adds it.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/qdev-core.h |  3 +++
 include/qemu/module.h  |  1 +
 hw/core/qdev.c         | 55 ++++++++++++++++++++++++++++++++++++++++++
 qdev-monitor.c         |  5 ++++
 qom/qom-qmp-cmds.c     |  5 ++++
 softmmu/vl.c           |  4 +++
 stubs/hw-module.c      | 10 ++++++++
 stubs/Makefile.objs    |  1 +
 8 files changed, 84 insertions(+)
 create mode 100644 stubs/hw-module.c

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 7dc10be46f8c..0a33939f4855 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -557,4 +557,7 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
+void qdev_module_load_type(const char *type);
+void qdev_module_load_all(void);
+
 #endif
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 011ae1ae7605..077a6b09bca7 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -64,6 +64,7 @@ typedef enum {
 #define block_module_load_one(lib) module_load_one("block-", lib)
 #define ui_module_load_one(lib) module_load_one("ui-", lib)
 #define audio_module_load_one(lib) module_load_one("audio-", lib)
+#define hw_module_load_one(lib) module_load_one("hw-", lib)
 
 void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 2131c7f951dd..6119e25e0eeb 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -137,6 +137,9 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
  */
 DeviceState *qdev_new(const char *name)
 {
+    if (!object_class_by_name(name)) {
+        qdev_module_load_type(name);
+    }
     return DEVICE(object_new(name));
 }
 
@@ -147,6 +150,9 @@ DeviceState *qdev_new(const char *name)
  */
 DeviceState *qdev_try_new(const char *name)
 {
+    if (!object_class_by_name(name)) {
+        qdev_module_load_type(name);
+    }
     if (!object_class_by_name(name)) {
         return NULL;
     }
@@ -154,6 +160,55 @@ DeviceState *qdev_try_new(const char *name)
     return DEVICE(object_new(name));
 }
 
+/*
+ * Building devices modular is mostly useful in case they have
+ * dependencies to external shared libraries, so we can cut down the
+ * core qemu library dependencies.  Which is the case for only a very
+ * few devices.  So with the expectation that this will be rather the
+ * exception than to rule go with a simple hardcoded list for now
+ * (instead of generating it automatically somehow).
+ */
+static struct {
+    const char *type;
+    const char *mod;
+} const hwmodules[] = {
+};
+
+static bool qdev_module_loaded_all;
+
+void qdev_module_load_type(const char *type)
+{
+    int i;
+
+    if (qdev_module_loaded_all) {
+        return;
+    }
+    for (i = 0; i < ARRAY_SIZE(hwmodules); i++) {
+        if (strcmp(hwmodules[i].type, type) == 0) {
+            hw_module_load_one(hwmodules[i].mod);
+            return;
+        }
+    }
+}
+
+void qdev_module_load_all(void)
+{
+    int i;
+
+    if (qdev_module_loaded_all) {
+        return;
+    }
+    for (i = 0; i < ARRAY_SIZE(hwmodules); i++) {
+        if (i > 0 && strcmp(hwmodules[i - 1].mod,
+                            hwmodules[i].mod) == 0) {
+            /* one module implementing multiple devices -> load only once */
+            continue;
+        }
+        hw_module_load_one(hwmodules[i].mod);
+    }
+    qdev_module_loaded_all = true;
+}
+
 static QTAILQ_HEAD(, DeviceListener) device_listeners
     = QTAILQ_HEAD_INITIALIZER(device_listeners);
 
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 22da107484c5..86f29daa7469 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -147,6 +147,7 @@ static void qdev_print_devinfos(bool show_no_user)
     int i;
     bool cat_printed;
 
+    qdev_module_load_all();
     list = object_class_get_list_sorted(TYPE_DEVICE, false);
 
     for (i = 0; i <= DEVICE_CATEGORY_MAX; i++) {
@@ -224,6 +225,10 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
             oc = object_class_by_name(*driver);
         }
     }
+    if (!oc) {
+        qdev_module_load_type(*driver);
+        oc = object_class_by_name(*driver);
+    }
 
     if (!object_class_dynamic_cast(oc, TYPE_DEVICE)) {
         if (*driver != original_name) {
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index c5249e44d020..4e0d7e53cd16 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -116,6 +116,7 @@ ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
 {
     ObjectTypeInfoList *ret = NULL;
 
+    qdev_module_load_all();
     object_class_foreach(qom_list_types_tramp, implements, abstract, &ret);
 
     return ret;
@@ -131,6 +132,10 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
     ObjectPropertyInfoList *prop_list = NULL;
 
     klass = object_class_by_name(typename);
+    if (klass == NULL) {
+        qdev_module_load_type(typename);
+        klass = object_class_by_name(typename);
+    }
     if (klass == NULL) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                   "Device '%s' not found", typename);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede4a..8d753ead5983 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1770,6 +1770,10 @@ static bool vga_interface_available(VGAInterfaceType t)
 {
     const VGAInterfaceInfo *ti = &vga_interfaces[t];
 
+    if (ti->class_names[0] && !object_class_by_name(ti->class_names[0])) {
+        qdev_module_load_type(ti->class_names[0]);
+    }
+
     assert(t < VGA_TYPE_MAX);
     return !ti->class_names[0] ||
            object_class_by_name(ti->class_names[0]) ||
diff --git a/stubs/hw-module.c b/stubs/hw-module.c
new file mode 100644
index 000000000000..58b2160b97fe
--- /dev/null
+++ b/stubs/hw-module.c
@@ -0,0 +1,10 @@
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+
+void qdev_module_load_all(void)
+{
+}
+
+void qdev_module_load_type(const char *type)
+{
+}
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 28e48171d1f3..7a9f38f60b78 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -5,6 +5,7 @@ stub-obj-y += dump.o
 stub-obj-y += error-printf.o
 stub-obj-y += fdset.o
 stub-obj-y += gdbstub.o
+stub-obj-y += hw-module.o
 stub-obj-y += iothread-lock.o
 stub-obj-y += is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
-- 
2.18.4


