Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D879C416EC7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:21:00 +0200 (CEST)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThO7-0001HD-Up
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAA-0004wh-GJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThA6-0003cF-Fn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlrxbgmS+/TVHjcAS9fhHQjT4bHTQkD3WH455XSSX5Y=;
 b=F2eXj8e98TVdEMKVgiJeD3PDaMjbCTqhqzMsh+/hH//B69Uyb4tHLKyq2Wmnq3oK13xYuf
 etJ5AlcdiRf8nG9Vx5ZyadNB9vFGjd1jePtswOXVZftd7D4bsY1Clpzm4gIsrfHOKvWhX6
 tMZnEUkl55NBMra/aclexpL7no7TQZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-BYw1Pq2bPvaseP_lo7RaqA-1; Fri, 24 Sep 2021 05:06:27 -0400
X-MC-Unique: BYw1Pq2bPvaseP_lo7RaqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9524802C8F;
 Fri, 24 Sep 2021 09:06:26 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBED75D9DC;
 Fri, 24 Sep 2021 09:06:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] qdev: Base object creation on QDict rather than QemuOpts
Date: Fri, 24 Sep 2021 11:04:24 +0200
Message-Id: <20210924090427.9218-9-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QDicts are both what QMP natively uses and what the keyval parser
produces. Going through QemuOpts isn't useful for either one, so switch
the main device creation function to QDicts. By sharing more code with
the -object/object-add code path, we can even reduce the code size a
bit.

This commit doesn't remove the detour through QemuOpts from any code
path yet, but it allows the following commits to do so.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/qdev-core.h |  8 ++---
 hw/core/qdev.c         |  5 ++--
 hw/net/virtio-net.c    |  4 +--
 hw/vfio/pci.c          |  4 +--
 softmmu/qdev-monitor.c | 67 +++++++++++++++++++-----------------------
 5 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1857d9698e..5b3d4704a5 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -180,7 +180,7 @@ struct DeviceState {
     char *canonical_path;
     bool realized;
     bool pending_deleted_event;
-    QemuOpts *opts;
+    QDict *opts;
     int hotplugged;
     bool allow_unplug_during_migration;
     BusState *parent_bus;
@@ -202,7 +202,7 @@ struct DeviceListener {
      * hide a failover device depending for example on the device
      * opts.
      */
-    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*hide_device)(DeviceListener *listener, const QDict *device_opts);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
@@ -831,13 +831,13 @@ void device_listener_unregister(DeviceListener *listener);
 
 /**
  * @qdev_should_hide_device:
- * @opts: QemuOpts as passed on cmdline.
+ * @opts: options QDict
  *
  * Check if a device should be added.
  * When a device is added via qdev_device_add() this will be called,
  * and return if the device should be added now or not.
  */
-bool qdev_should_hide_device(QemuOpts *opts);
+bool qdev_should_hide_device(const QDict *opts);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d918b50a1d..5b889866c5 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -28,6 +28,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-qdev.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
@@ -211,7 +212,7 @@ void device_listener_unregister(DeviceListener *listener)
     QTAILQ_REMOVE(&device_listeners, listener, link);
 }
 
-bool qdev_should_hide_device(QemuOpts *opts)
+bool qdev_should_hide_device(const QDict *opts)
 {
     DeviceListener *listener;
 
@@ -955,7 +956,7 @@ static void device_finalize(Object *obj)
         dev->canonical_path = NULL;
     }
 
-    qemu_opts_del(dev->opts);
+    qobject_unref(dev->opts);
     g_free(dev->id);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf..5684c2b2b7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3304,7 +3304,7 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static bool failover_hide_primary_device(DeviceListener *listener,
-                                         QemuOpts *device_opts)
+                                         const QDict *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     const char *standby_id;
@@ -3312,7 +3312,7 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     if (!device_opts) {
         return false;
     }
-    standby_id = qemu_opt_get(device_opts, "failover_pair_id");
+    standby_id = qdict_get_try_str(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) != 0) {
         return false;
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4feaa1cb68..5cdf1d4298 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -29,10 +29,10 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "qemu/option.h"
 #include "qemu/range.h"
 #include "qemu/units.h"
 #include "sysemu/kvm.h"
@@ -941,7 +941,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
     }
 
     if (vfio_opt_rom_in_denylist(vdev)) {
-        if (dev->opts && qemu_opt_get(dev->opts, "rombar")) {
+        if (dev->opts && qdict_haskey(dev->opts, "rombar")) {
             warn_report("Device at %s is known to cause system instability"
                         " issues during option rom execution",
                         vdev->vbasedev.name);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index c2af906df0..c09b7430eb 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -196,34 +196,6 @@ static void qdev_print_devinfos(bool show_no_user)
     g_slist_free(list);
 }
 
-static int set_property(void *opaque, const char *name, const char *value,
-                        Error **errp)
-{
-    Object *obj = opaque;
-    QString *val;
-    Visitor *v;
-    int ret;
-
-    if (strcmp(name, "driver") == 0)
-        return 0;
-    if (strcmp(name, "bus") == 0)
-        return 0;
-
-    val = qstring_from_str(value);
-    v = qobject_input_visitor_new_keyval(QOBJECT(val));
-
-    if (!object_property_set(obj, name, v, errp)) {
-        ret = -1;
-        goto out;
-    }
-
-    ret = 0;
-out:
-    visit_free(v);
-    qobject_unref(val);
-    return ret;
-}
-
 static const char *find_typename_by_alias(const char *alias)
 {
     int i;
@@ -611,15 +583,17 @@ void qdev_set_id(DeviceState *dev, char *id, Error **errp)
     }
 }
 
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
+static DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+                                               bool from_json, Error **errp)
 {
     ERRP_GUARD();
     DeviceClass *dc;
     const char *driver, *path;
+    char *id;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
 
-    driver = qemu_opt_get(opts, "driver");
+    driver = qdict_get_try_str(opts, "driver");
     if (!driver) {
         error_setg(errp, QERR_MISSING_PARAMETER, "driver");
         return NULL;
@@ -632,7 +606,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
 
     /* find bus */
-    path = qemu_opt_get(opts, "bus");
+    path = qdict_get_try_str(opts, "bus");
     if (path != NULL) {
         bus = qbus_find(path, errp);
         if (!bus) {
@@ -652,8 +626,8 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (qemu_opt_get(opts, "failover_pair_id")) {
-        if (!opts->id) {
+    if (qdict_haskey(opts, "failover_pair_id")) {
+        if (!qdict_haskey(opts, "id")) {
             error_setg(errp, "Device with failover_pair_id don't have id");
             return NULL;
         }
@@ -692,19 +666,25 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp);
+    id = g_strdup(qdict_get_try_str(opts, "id"));
+    qdev_set_id(dev, id, errp);
     if (*errp) {
         goto err_del_dev;
     }
 
     /* set properties */
-    if (qemu_opt_foreach(opts, set_property, dev, errp)) {
+    dev->opts = qdict_clone_shallow(opts);
+    qdict_del(dev->opts, "driver");
+    qdict_del(dev->opts, "bus");
+    qdict_del(dev->opts, "id");
+
+    object_set_properties_from_keyval(&dev->parent_obj, dev->opts, from_json,
+                                      errp);
+    if (*errp) {
         goto err_del_dev;
     }
 
-    dev->opts = opts;
     if (!qdev_realize(DEVICE(dev), bus, errp)) {
-        dev->opts = NULL;
         goto err_del_dev;
     }
     return dev;
@@ -717,6 +697,19 @@ err_del_dev:
     return NULL;
 }
 
+/* Takes ownership of @opts on success */
+DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
+{
+    QDict *qdict = qemu_opts_to_qdict(opts, NULL);
+    DeviceState *ret;
+
+    ret = qdev_device_add_from_qdict(qdict, false, errp);
+    if (ret) {
+        qemu_opts_del(opts);
+    }
+    qobject_unref(qdict);
+    return ret;
+}
 
 #define qdev_printf(fmt, ...) monitor_printf(mon, "%*s" fmt, indent, "", ## __VA_ARGS__)
 static void qbus_print(Monitor *mon, BusState *bus, int indent);
-- 
2.31.1


