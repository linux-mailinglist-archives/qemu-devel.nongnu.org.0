Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A267016C340
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:05:01 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6apY-0005tZ-Hb
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2s-00089x-79
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2p-00028N-Lm
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:42 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:57192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6a2f-00021h-06; Tue, 25 Feb 2020 08:14:29 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 13E6296F51;
 Tue, 25 Feb 2020 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582636467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3afkcqpk5HVinDUFgVpVnyFKv0qytJdkPrEwInfBvLc=;
 b=2t7zScVpSDA7HwK7y5cfTWA5BczdnY1clpm1K9R/AvxJCWOdrr8CWyB9YpeY2AsnytYVKB
 kXHpjCg+tmiLyvjx5LBEkl0KYH5OesNAKQJRL/tOkExcJDYkRctFPTEHHYFgrrsHhMI/wb
 OUxXxhIGy8cRLFPJ69Bw8tveMKqIYdU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/9] qdev: add clock input&output support to devices.
Date: Tue, 25 Feb 2020 14:14:16 +0100
Message-Id: <20200225131422.53368-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200225131422.53368-1-damien.hedde@greensocs.com>
References: <20200225131422.53368-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582636467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3afkcqpk5HVinDUFgVpVnyFKv0qytJdkPrEwInfBvLc=;
 b=xj+iZsIDaQUmex/8hcnnankuORTxMOzYh4thApsHqRmOjFaE7ZQEL8cwx8ZLzzo+3evvhw
 1MQtF1T8MIqs22oPjfIZv6SJl7EW/vdcliJODe0D1+Z/yP3IYVMzmcTE+5JxokVKjQXA3n
 3+Lrezgv4JkReufXVOq6By0TaMqWKLg=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582636467; a=rsa-sha256; cv=none;
 b=XN2ulqBy4EL68HGIgcRnhP3MtocdRvijQefWjGb2UweN6EJEVJd5W7rE4aeEpUZxeSdY79
 L8L1wHbqNz3YsevxgpVXhNXSey/3Se2c1juNm4RO3Ikh83Lp5d4uXeDKpFVeADcsmsywp9
 6AJnIe+M2sf4oGJwCAEK5t1+AvDLmLo=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add functions to easily handle clocks with devices.
Clock inputs and outputs should be used to handle clock propagation
between devices.
The API is very similar the GPIO API.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v8:
+ remove another useless assert (Alistair)
+ typos, comments (Alistair)

v7:
+ update ClockIn/Out types
+ qdev_connect_clock_out function removed / qdev_connect_clock_in added
  instead
+ qdev_pass_clock renamed to qdev_alias_clock
+ various small fixes (typos, comment, asserts) (Peter)
+ move device's instance_finalize code related to clock in qdev-clock.c
---
 include/hw/qdev-clock.h | 104 +++++++++++++++++++++++++
 include/hw/qdev-core.h  |  12 +++
 hw/core/qdev-clock.c    | 168 ++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c          |  12 +++
 hw/core/Makefile.objs   |   2 +-
 tests/Makefile.include  |   1 +
 6 files changed, 298 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/qdev-clock.c

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
new file mode 100644
index 0000000000..b3b3a3e021
--- /dev/null
+++ b/include/hw/qdev-clock.h
@@ -0,0 +1,104 @@
+/*
+ * Device's clock input and output
+ *
+ * Copyright GreenSocs 2016-2020
+ *
+ * Authors:
+ *  Frederic Konrad
+ *  Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QDEV_CLOCK_H
+#define QDEV_CLOCK_H
+
+#include "hw/clock.h"
+
+/**
+ * qdev_init_clock_in:
+ * @dev: the device to add an input clock to
+ * @name: the name of the clock (can't be NULL).
+ * @callback: optional callback to be called on update or NULL.
+ * @opaque: argument for the callback
+ * @returns: a pointer to the newly added clock
+ *
+ * Add an input clock to device @dev as a clock named @name.
+ * This adds a child<> property.
+ * The callback will be called with @opaque as opaque parameter.
+ */
+Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
+                          ClockCallback *callback, void *opaque);
+
+/**
+ * qdev_init_clock_out:
+ * @dev: the device to add an output clock to
+ * @name: the name of the clock (can't be NULL).
+ * @returns: a pointer to the newly added clock
+ *
+ * Add an output clock to device @dev as a clock named @name.
+ * This adds a child<> property.
+ */
+Clock *qdev_init_clock_out(DeviceState *dev, const char *name);
+
+/**
+ * qdev_get_clock_in:
+ * @dev: the device which has the clock
+ * @name: the name of the clock (can't be NULL).
+ * @returns: a pointer to the clock
+ *
+ * Get the input clock @name from @dev or NULL if does not exist.
+ */
+Clock *qdev_get_clock_in(DeviceState *dev, const char *name);
+
+/**
+ * qdev_get_clock_out:
+ * @dev: the device which has the clock
+ * @name: the name of the clock (can't be NULL).
+ * @returns: a pointer to the clock
+ *
+ * Get the output clock @name from @dev or NULL if does not exist.
+ */
+Clock *qdev_get_clock_out(DeviceState *dev, const char *name);
+
+/**
+ * qdev_connect_clock_in:
+ * @dev: a device
+ * @name: the name of an input clock in @dev
+ * @source: the source clock (an output clock of another device for exam=
ple)
+ *
+ * Set the source clock of input clock @name of device @dev to @source.
+ * @source period update will be propagated to @name clock.
+ */
+static inline void qdev_connect_clock_in(DeviceState *dev, const char *n=
ame,
+                                         Clock *source)
+{
+    clock_set_source(qdev_get_clock_in(dev, name), source);
+}
+
+/**
+ * qdev_alias_clock:
+ * @dev: the device which has the clock
+ * @name: the name of the clock in @dev (can't be NULL)
+ * @alias_dev: the device to add the clock
+ * @alias_name: the name of the clock in @container
+ * @returns: a pointer to the clock
+ *
+ * Add a clock @alias_name in @alias_dev which is an alias of the clock =
@name
+ * in @dev. The direction _in_ or _out_ will the same as the original.
+ * An alias clock must not be modified or used by @alias_dev and should
+ * typically be only only for device composition purpose.
+ */
+Clock *qdev_alias_clock(DeviceState *dev, const char *name,
+                        DeviceState *alias_dev, const char *alias_name);
+
+/**
+ * qdev_finalize_clocklist:
+ * @dev: the device being finalized
+ *
+ * Clear the clocklist from @dev. Only used internally in qdev.
+ */
+void qdev_finalize_clocklist(DeviceState *dev);
+
+#endif /* QDEV_CLOCK_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1405b8a990..d87d989e72 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -149,6 +149,17 @@ struct NamedGPIOList {
     QLIST_ENTRY(NamedGPIOList) node;
 };
=20
+typedef struct Clock Clock;
+typedef struct NamedClockList NamedClockList;
+
+struct NamedClockList {
+    char *name;
+    Clock *clock;
+    bool output;
+    bool alias;
+    QLIST_ENTRY(NamedClockList) node;
+};
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -171,6 +182,7 @@ struct DeviceState {
     bool allow_unplug_during_migration;
     BusState *parent_bus;
     QLIST_HEAD(, NamedGPIOList) gpios;
+    QLIST_HEAD(, NamedClockList) clocks;
     QLIST_HEAD(, BusState) child_bus;
     int num_child_bus;
     int instance_id_alias;
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
new file mode 100644
index 0000000000..62035aef83
--- /dev/null
+++ b/hw/core/qdev-clock.c
@@ -0,0 +1,168 @@
+/*
+ * Device's clock input and output
+ *
+ * Copyright GreenSocs 2016-2020
+ *
+ * Authors:
+ *  Frederic Konrad
+ *  Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-core.h"
+#include "qapi/error.h"
+
+/*
+ * qdev_init_clocklist:
+ * Add a new clock in a device
+ */
+static NamedClockList *qdev_init_clocklist(DeviceState *dev, const char =
*name,
+                                           bool output, Clock *clk)
+{
+    NamedClockList *ncl;
+
+    /*
+     * Clock must be added before realize() so that we can compute the
+     * clock's canonical path during device_realize().
+     */
+    assert(!dev->realized);
+
+    /*
+     * The ncl structure is freed by qdev_finalize_clocklist() which wil=
l
+     * be called during @dev's device_finalize().
+     */
+    ncl =3D g_new0(NamedClockList, 1);
+    ncl->name =3D g_strdup(name);
+    ncl->output =3D output;
+    ncl->alias =3D (clk !=3D NULL);
+
+    /*
+     * Trying to create a clock whose name clashes with some other
+     * clock or property is a bug in the caller and we will abort().
+     */
+    if (clk =3D=3D NULL) {
+        clk =3D CLOCK(object_new(TYPE_CLOCK));
+        object_property_add_child(OBJECT(dev), name, OBJECT(clk), &error=
_abort);
+        if (output) {
+            /*
+             * Remove object_new()'s initial reference.
+             * Note that for inputs, the reference created by object_new=
()
+             * will be deleted in qdev_finalize_clocklist().
+             */
+            object_unref(OBJECT(clk));
+        }
+    } else {
+        object_property_add_link(OBJECT(dev), name,
+                                 object_get_typename(OBJECT(clk)),
+                                 (Object **) &ncl->clock,
+                                 NULL, OBJ_PROP_LINK_STRONG, &error_abor=
t);
+    }
+
+    ncl->clock =3D clk;
+
+    QLIST_INSERT_HEAD(&dev->clocks, ncl, node);
+    return ncl;
+}
+
+void qdev_finalize_clocklist(DeviceState *dev)
+{
+    /* called by @dev's device_finalize() */
+    NamedClockList *ncl, *ncl_next;
+
+    QLIST_FOREACH_SAFE(ncl, &dev->clocks, node, ncl_next) {
+        QLIST_REMOVE(ncl, node);
+        if (!ncl->output && !ncl->alias) {
+            /*
+             * We kept a reference on the input clock to ensure it lives=
 up to
+             * this point so we can safely remove the callback.
+             * It avoids having a callback to a deleted object if ncl->c=
lock
+             * is still referenced somewhere else (eg: by a clock output=
).
+             */
+            clock_clear_callback(ncl->clock);
+            object_unref(OBJECT(ncl->clock));
+        }
+        g_free(ncl->name);
+        g_free(ncl);
+    }
+}
+
+Clock *qdev_init_clock_out(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    assert(name);
+
+    ncl =3D qdev_init_clocklist(dev, name, true, NULL);
+
+    return ncl->clock;
+}
+
+Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
+                            ClockCallback *callback, void *opaque)
+{
+    NamedClockList *ncl;
+
+    assert(name);
+
+    ncl =3D qdev_init_clocklist(dev, name, false, NULL);
+
+    if (callback) {
+        clock_set_callback(ncl->clock, callback, opaque);
+    }
+    return ncl->clock;
+}
+
+static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *=
name)
+{
+    NamedClockList *ncl;
+
+    QLIST_FOREACH(ncl, &dev->clocks, node) {
+        if (strcmp(name, ncl->name) =3D=3D 0) {
+            return ncl;
+        }
+    }
+
+    return NULL;
+}
+
+Clock *qdev_get_clock_in(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    assert(name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+    assert(!ncl->output);
+
+    return ncl->clock;
+}
+
+Clock *qdev_get_clock_out(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    assert(name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+    assert(ncl->output);
+
+    return ncl->clock;
+}
+
+Clock *qdev_alias_clock(DeviceState *dev, const char *name,
+                        DeviceState *alias_dev, const char *alias_name)
+{
+    NamedClockList *ncl;
+
+    assert(name && alias_name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+
+    qdev_init_clocklist(alias_dev, alias_name, ncl->output, ncl->clock);
+
+    return ncl->clock;
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 3937d1eb1a..f390697348 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -37,6 +37,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
 #include "trace.h"
=20
@@ -855,6 +856,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
     DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
     HotplugHandler *hotplug_ctrl;
     BusState *bus;
+    NamedClockList *ncl;
     Error *local_err =3D NULL;
     bool unattached_parent =3D false;
     static int unattached_count;
@@ -902,6 +904,13 @@ static void device_set_realized(Object *obj, bool va=
lue, Error **errp)
          */
         g_free(dev->canonical_path);
         dev->canonical_path =3D object_get_canonical_path(OBJECT(dev));
+        QLIST_FOREACH(ncl, &dev->clocks, node) {
+            if (ncl->alias) {
+                continue;
+            } else {
+                clock_setup_canonical_path(ncl->clock);
+            }
+        }
=20
         if (qdev_get_vmsd(dev)) {
             if (vmstate_register_with_alias_id(VMSTATE_IF(dev),
@@ -1025,6 +1034,7 @@ static void device_initfn(Object *obj)
     dev->allow_unplug_during_migration =3D false;
=20
     QLIST_INIT(&dev->gpios);
+    QLIST_INIT(&dev->clocks);
 }
=20
 static void device_post_init(Object *obj)
@@ -1054,6 +1064,8 @@ static void device_finalize(Object *obj)
          */
     }
=20
+    qdev_finalize_clocklist(dev);
+
     /* Only send event if the device had been completely realized */
     if (dev->pending_deleted_event) {
         g_assert(dev->canonical_path);
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 115df55087..1d540ed6e7 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -7,7 +7,7 @@ common-obj-y +=3D hotplug.o
 common-obj-y +=3D vmstate-if.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
-common-obj-y +=3D clock.o
+common-obj-y +=3D clock.o qdev-clock.o
=20
 common-obj-$(CONFIG_SOFTMMU) +=3D reset.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
diff --git a/tests/Makefile.include b/tests/Makefile.include
index edcbd475aa..5a4511a86f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -436,6 +436,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qde=
v-global-props.o \
 	hw/core/fw-path-provider.o \
 	hw/core/reset.o \
 	hw/core/vmstate-if.o \
+	hw/core/clock.o hw/core/qdev-clock.o \
 	$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
 	migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
--=20
2.25.1


