Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9EE426BEF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:49:23 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYqFW-0002y4-CA
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4v-0005E7-20
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:38:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4r-00073E-8Z
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kl0F/qu/yfcKfVhGRunhOIBct+Fl2dIvaPt2uCwj9pY=;
 b=DU1TxDmsATDDFSl+JfQrmMo4Fvx1E3cMCaE1CsIgfhCtYXKJa4UQPQ6TbBTrQ0cOZJZOHT
 JdStGd63YIvNih7yXdPycGFo87q6TZTDsJA9cLprimwxpGE0/LodnvN5K8i1yO4ZJD5n2H
 Polf+wIqgPTTyKjaxDlx6pohy4bIIfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-j6YuVbKfOSijuJf8S-L2Cw-1; Fri, 08 Oct 2021 09:38:19 -0400
X-MC-Unique: j6YuVbKfOSijuJf8S-L2Cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CCDF5B38C;
 Fri,  8 Oct 2021 13:37:07 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83D3526E74;
 Fri,  8 Oct 2021 13:37:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
Date: Fri,  8 Oct 2021 15:34:41 +0200
Message-Id: <20211008133442.141332-15-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
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
 include/hw/qdev-core.h         | 11 +++---
 include/hw/virtio/virtio-net.h |  3 +-
 include/monitor/qdev.h         |  2 +
 hw/core/qdev.c                 |  7 ++--
 hw/net/virtio-net.c            | 23 +++++++-----
 hw/vfio/pci.c                  |  4 +-
 softmmu/qdev-monitor.c         | 69 +++++++++++++++-------------------
 7 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 74d8b614a7..910042c650 100644
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
@@ -205,8 +205,8 @@ struct DeviceListener {
      * On errors, it returns false and errp is set. Device creation
      * should fail in this case.
      */
-    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts,
-                        Error **errp);
+    bool (*hide_device)(DeviceListener *listener, const QDict *device_opts,
+                        bool from_json, Error **errp);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
@@ -835,13 +835,14 @@ void device_listener_unregister(DeviceListener *listener);
 
 /**
  * @qdev_should_hide_device:
- * @opts: QemuOpts as passed on cmdline.
+ * @opts: options QDict
+ * @from_json: true if @opts entries are typed, false for all strings
  *
  * Check if a device should be added.
  * When a device is added via qdev_device_add() this will be called,
  * and return if the device should be added now or not.
  */
-bool qdev_should_hide_device(QemuOpts *opts, Error **errp);
+bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index d118c95f69..74a10ebe85 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -209,7 +209,8 @@ struct VirtIONet {
     bool failover_primary_hidden;
     bool failover;
     DeviceListener primary_listener;
-    QemuOpts *primary_opts;
+    QDict *primary_opts;
+    bool primary_opts_from_json;
     Notifier migration_state;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 74e6c55a2b..1d57bf6577 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -9,6 +9,8 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
+DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+                                        bool from_json, Error **errp);
 
 /**
  * qdev_set_id: parent the device and set its id if provided.
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index c3a021c444..7f06403752 100644
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
@@ -211,14 +212,14 @@ void device_listener_unregister(DeviceListener *listener)
     QTAILQ_REMOVE(&device_listeners, listener, link);
 }
 
-bool qdev_should_hide_device(QemuOpts *opts, Error **errp)
+bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp)
 {
     ERRP_GUARD();
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
         if (listener->hide_device) {
-            if (listener->hide_device(listener, opts, errp)) {
+            if (listener->hide_device(listener, opts, from_json, errp)) {
                 return true;
             } else if (*errp) {
                 return false;
@@ -958,7 +959,7 @@ static void device_finalize(Object *obj)
         dev->canonical_path = NULL;
     }
 
-    qemu_opts_del(dev->opts);
+    qobject_unref(dev->opts);
     g_free(dev->id);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f503f28c00..09e173a558 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -858,9 +858,11 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         return;
     }
 
-    dev = qdev_device_add(n->primary_opts, &err);
+    dev = qdev_device_add_from_qdict(n->primary_opts,
+                                     n->primary_opts_from_json,
+                                     &err);
     if (err) {
-        qemu_opts_del(n->primary_opts);
+        qobject_unref(n->primary_opts);
         n->primary_opts = NULL;
     } else {
         object_unref(OBJECT(dev));
@@ -3287,7 +3289,9 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static bool failover_hide_primary_device(DeviceListener *listener,
-                                         QemuOpts *device_opts, Error **errp)
+                                         const QDict *device_opts,
+                                         bool from_json,
+                                         Error **errp)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     const char *standby_id;
@@ -3295,7 +3299,7 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     if (!device_opts) {
         return false;
     }
-    standby_id = qemu_opt_get(device_opts, "failover_pair_id");
+    standby_id = qdict_get_try_str(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) != 0) {
         return false;
     }
@@ -3306,12 +3310,8 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
 
-    /*
-     * Having a weak reference here should be okay because a device can't be
-     * deleted while it's hidden. This will be replaced soon with a QDict that
-     * has a clearer ownership model.
-     */
-    n->primary_opts = device_opts;
+    n->primary_opts = qdict_clone_shallow(device_opts);
+    n->primary_opts_from_json = from_json;
 
     /* failover_primary_hidden is set during feature negotiation */
     return qatomic_read(&n->failover_primary_hidden);
@@ -3502,8 +3502,11 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     g_free(n->vlans);
 
     if (n->failover) {
+        qobject_unref(n->primary_opts);
         device_listener_unregister(&n->primary_listener);
         remove_migration_state_change_notifier(&n->migration_state);
+    } else {
+        assert(n->primary_opts == NULL);
     }
 
     max_queues = n->multiqueue ? n->max_queues : 1;
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
index ccc3c11563..90882f1571 100644
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
@@ -623,15 +595,17 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     return prop->name;
 }
 
-DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
+DeviceState *qdev_device_add_from_qdict(const QDict *opts,
+                                        bool from_json, Error **errp)
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
@@ -644,7 +618,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
 
     /* find bus */
-    path = qemu_opt_get(opts, "bus");
+    path = qdict_get_try_str(opts, "bus");
     if (path != NULL) {
         bus = qbus_find(path, errp);
         if (!bus) {
@@ -664,12 +638,12 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (qemu_opt_get(opts, "failover_pair_id")) {
-        if (!opts->id) {
+    if (qdict_haskey(opts, "failover_pair_id")) {
+        if (!qdict_haskey(opts, "id")) {
             error_setg(errp, "Device with failover_pair_id don't have id");
             return NULL;
         }
-        if (qdev_should_hide_device(opts, errp)) {
+        if (qdev_should_hide_device(opts, from_json, errp)) {
             if (bus && !qbus_is_hotpluggable(bus)) {
                 error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
             }
@@ -710,18 +684,24 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
      * set dev's parent and register its id.
      * If it fails it means the id is already taken.
      */
-    if (!qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp)) {
+    id = g_strdup(qdict_get_try_str(opts, "id"));
+    if (!qdev_set_id(dev, id, errp)) {
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
@@ -734,6 +714,19 @@ err_del_dev:
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


