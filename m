Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D81D9AE5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:13:19 +0200 (CEST)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3vi-0002R8-Nn
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fA-0001Yx-5H
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20557
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f2-0003WU-3e
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baz+wijb/5/Ov6sUxxfXHuI6tIYKPNLIcHpW7/PUksY=;
 b=ROer8r+yG7XaYK/dSJNil4HS4Eswz1IgqMyGEEmkJWLnjgzltRQjIkvJaQcKbpTKl1Knk0
 4OvdbaEbOQphEV3w2N8Rcdna8YWjEEEjOu9wlC7SrEYdjB8Px1WtshqUFHC9mjsoh8wDiH
 xJry6EKOjDHaN9OW4sFJsereg3kSqoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-PFYrWBKNMjeDlT3mU7SkPQ-1; Tue, 19 May 2020 10:56:01 -0400
X-MC-Unique: PFYrWBKNMjeDlT3mU7SkPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3E71009613;
 Tue, 19 May 2020 14:55:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2945D9CD;
 Tue, 19 May 2020 14:55:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B988C11358BF; Tue, 19 May 2020 16:55:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/55] qdev: New qdev_new(), qdev_realize(), etc.
Date: Tue, 19 May 2020 16:54:59 +0200
Message-Id: <20200519145551.22836-4-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 09:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We commonly plug devices into their bus right when we create them,
like this:

    dev = qdev_create(bus, type_name);

Note that @dev is a weak reference.  The reference from @bus to @dev
is the only strong one.

We realize at some later time, either with

    object_property_set_bool(OBJECT(dev), true, "realized", errp);

or its convenience wrapper

    qdev_init_nofail(dev);

If @dev still has no QOM parent then, realizing makes the
/machine/unattached/ orphanage its QOM parent.

Note that the device returned by qdev_create() is plugged into a bus,
but doesn't have a QOM parent, yet.  Until it acquires one,
unrealizing the bus will hang in bus_unparent():

    while ((kid = QTAILQ_FIRST(&bus->children)) != NULL) {
        DeviceState *dev = kid->child;
        object_unparent(OBJECT(dev));
    }

object_unparent() does nothing when its argument has no QOM parent,
and the loop spins forever.

Device state "no QOM parent, but plugged into bus" is dangerous.

Paolo suggested to delay plugging into the bus until realize.  We need
to plug into the parent bus before we call the device's realize
method, in case it uses the parent bus.  So the dangerous state still
exists, but only within realization, where we can manage it safely.

This commit creates infrastructure to do this:

    dev = qdev_new(type_name);
    ...
    qdev_realize_and_unref(dev, bus, errp)

Note that @dev becomes a strong reference here.
qdev_realize_and_unref() drops it.  There is also plain
qdev_realize(), which doesn't drop it.

The remainder of this series will convert all users to this new
interface.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/qdev-core.h | 11 ++++-
 hw/core/bus.c          | 14 +++++++
 hw/core/qdev.c         | 94 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index b870b27966..fba29308f7 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -57,7 +57,7 @@ typedef void (*BusUnrealize)(BusState *bus);
  * After successful realization, setting static properties will fail.
  *
  * As an interim step, the #DeviceState:realized property can also be
- * set with qdev_init_nofail().
+ * set with qdev_realize() or qdev_init_nofail().
  * In the future, devices will propagate this state change to their children
  * and along busses they expose.
  * The point in time will be deferred to machine creation, so that values
@@ -322,7 +322,13 @@ compat_props_add(GPtrArray *arr,
 
 DeviceState *qdev_create(BusState *bus, const char *name);
 DeviceState *qdev_try_create(BusState *bus, const char *name);
+DeviceState *qdev_new(const char *name);
+DeviceState *qdev_try_new(const char *name);
 void qdev_init_nofail(DeviceState *dev);
+bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
+bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
+void qdev_unrealize(DeviceState *dev);
+
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
@@ -411,6 +417,9 @@ typedef int (qdev_walkerfn)(DeviceState *dev, void *opaque);
 void qbus_create_inplace(void *bus, size_t size, const char *typename,
                          DeviceState *parent, const char *name);
 BusState *qbus_create(const char *typename, DeviceState *parent, const char *name);
+bool qbus_realize(BusState *bus, Error **errp);
+void qbus_unrealize(BusState *bus);
+
 /* Returns > 0 if either devfn or busfn skip walk somewhere in cursion,
  *         < 0 if either devfn or busfn terminate walk somewhere in cursion,
  *           0 otherwise. */
diff --git a/hw/core/bus.c b/hw/core/bus.c
index 08c5eab24a..bf622604a3 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -169,6 +169,20 @@ BusState *qbus_create(const char *typename, DeviceState *parent, const char *nam
     return bus;
 }
 
+bool qbus_realize(BusState *bus, Error **errp)
+{
+    Error *err = NULL;
+
+    object_property_set_bool(OBJECT(bus), true, "realized", &err);
+    error_propagate(errp, err);
+    return !err;
+}
+
+void qbus_unrealize(BusState *bus)
+{
+    object_property_set_bool(OBJECT(bus), true, "realized", &error_abort);
+}
+
 static bool bus_get_realized(Object *obj, Error **errp)
 {
     BusState *bus = BUS(obj);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index a68ba674db..82deeb7841 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -176,6 +176,32 @@ DeviceState *qdev_try_create(BusState *bus, const char *type)
     return dev;
 }
 
+/*
+ * Create a device on the heap.
+ * A type @name must exist.
+ * This only initializes the device state structure and allows
+ * properties to be set.  The device still needs to be realized.  See
+ * qdev-core.h.
+ */
+DeviceState *qdev_new(const char *name)
+{
+    return DEVICE(object_new(name));
+}
+
+/*
+ * Try to create a device on the heap.
+ * This is like qdev_new(), except it returns %NULL when type @name
+ * does not exist.
+ */
+DeviceState *qdev_try_new(const char *name)
+{
+    if (!object_class_by_name(name)) {
+        return NULL;
+    }
+
+    return DEVICE(object_new(name));
+}
+
 static QTAILQ_HEAD(, DeviceListener) device_listeners
     = QTAILQ_HEAD_INITIALIZER(device_listeners);
 
@@ -427,6 +453,70 @@ void qdev_init_nofail(DeviceState *dev)
     object_unref(OBJECT(dev));
 }
 
+/*
+ * Realize @dev.
+ * @dev must not be plugged into a bus.
+ * Plug @dev into @bus if non-null, else into the main system bus.
+ * This takes a reference to @dev.
+ * If @dev has no QOM parent, make one up, taking another reference.
+ * On success, return true.
+ * On failure, store an error through @errp and return false.
+ */
+bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
+{
+    Error *err = NULL;
+
+    assert(!dev->realized && !dev->parent_bus);
+
+    if (!bus) {
+        /*
+         * Assert that the device really is a SysBusDevice before we
+         * put it onto the sysbus.  Non-sysbus devices which aren't
+         * being put onto a bus should be realized with
+         * object_property_set_bool(OBJECT(dev), true, "realized",
+         * errp);
+         */
+        g_assert(object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE));
+        bus = sysbus_get_default();
+    }
+
+    qdev_set_parent_bus(dev, bus);
+
+    object_ref(OBJECT(dev));
+    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    if (err) {
+        error_propagate_prepend(errp, err,
+                                "Initialization of device %s failed: ",
+                                object_get_typename(OBJECT(dev)));
+    }
+    object_unref(OBJECT(dev));
+    return !err;
+}
+
+/*
+ * Realize @dev and drop a reference.
+ * This is like qdev_realize(), except it steals a reference rather
+ * than take one to plug @dev into @bus.  On failure, it drops that
+ * reference instead.  Intended use:
+ *     dev = qdev_new();
+ *     [...]
+ *     qdev_realize_and_unref(dev, bus, errp);
+ * Now @dev can go away without further ado.
+ */
+bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp)
+{
+    bool ret;
+
+    ret = qdev_realize(dev, bus, errp);
+    object_unref(OBJECT(dev));
+    return ret;
+}
+
+void qdev_unrealize(DeviceState *dev)
+{
+    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+}
+
 static int qdev_assert_realized_properly(Object *obj, void *opaque)
 {
     DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
@@ -1002,6 +1092,10 @@ post_realize_fail:
 fail:
     error_propagate(errp, local_err);
     if (unattached_parent) {
+        /*
+         * Beware, this doesn't just revert
+         * object_property_add_child(), it also runs bus_remove()!
+         */
         object_unparent(OBJECT(dev));
         unattached_count--;
     }
-- 
2.21.1


