Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99A9805C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 18:40:14 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Tef-0004BI-2L
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 12:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i0TZb-0006pH-H9
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i0TZY-0005a0-KO
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:34:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i0TZY-0005Xo-BM
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:34:56 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 0950C96F50;
 Wed, 21 Aug 2019 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1566405295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzGv99HuMKd0JutBn8eGlSOlX0+Kjm8cGkvMfkb8hpo=;
 b=LSpB6TLUyAKTyj3HdSdQVllFr4CGpuFLWVXmmPeCDsQ26NK4GKEIH4zJ6EWQ+1Ysb9PORy
 VUCBszJi7EcdKDAbSk9Jkb/eTMlU3ti2MhCM1Ju3TtIeeAeEMf2oXz077ABdfsptk+5+v4
 XgEcaJi19CUgJoiGrncNPMqPE/6kQc4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 18:33:33 +0200
Message-Id: <20190821163341.16309-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821163341.16309-1-damien.hedde@greensocs.com>
References: <20190821163341.16309-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1566405295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzGv99HuMKd0JutBn8eGlSOlX0+Kjm8cGkvMfkb8hpo=;
 b=eOC2wF9EHLh1FD9piBzHj2rkyyJPsHy5h2Nq6XtHuHmKOJ+LWqPaI//u5jVweqpeilxc83
 ekOeaHj3mS6sB181wKRZ0t9dbfVa2qqab2P+LdLkKMD8Q7cK/j5x3m3gyKiRvE2DdQV4mw
 efvah1BzMFKNgyVyjBobxzdOXxKZNtU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1566405295; a=rsa-sha256; cv=none;
 b=D7DDt+vB3ymPrDR9O81jnUzSpf7V4TEF2WFdKKulF6nj3c5+0yDrO3XDZZYGx+e8dqxbyL
 i7MFQjNmK6idLCqTEYQaS2KWJYXauPT2ndUFHrepxFRDbJVwYOdGisEie18ErFfGBNNx7W
 hD/174dqMoPjoksSkH0A7YUhFw+gz58=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v4 02/10] hw/core: create Resettable QOM
 interface
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
 edgar.iglesias@xilinx.com, berrange@redhat.com, ehabkost@redhat.com,
 mark.burton@greensocs.com, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit defines an interface allowing multi-phase reset. This aims
to solve a problem of the actual single-phase reset (built in
DeviceClass and BusClass): reset behavior is dependent on the order
in which reset handlers are called. In particular doing external
side-effect (like setting an qemu_irq) is problematic because receiving
object may not be reset yet.

The Resettable interface divides the reset in 3 well defined phases.
To reset an object tree, all 1st phases are executed then all 2nd then
all 3rd. See the comments in include/hw/resettable.h for a more complete
description. There is 3 phases to allow a device to be held in reset
state; the ability to control this state will be added in a following
commits.

The qdev/qbus reset in DeviceClass and BusClass will be modified in
following commits to use this interface.
No change of behavior is expected because the init phase execution order
follows the children-then-parent order inside a tree. Since this is the
actual order of qdev/qbus reset, we will be able to map current reset
handlers on init phase for example.

In this patch only cold reset is introduced, which is pretty much the
actual semantics of the current reset handlers. The interface can be
extended to support more reset types.

Documentation will be added in a following commit.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

I kept the non-recursive count approach (a given object counts reset
initiated on it as well as reset initiated on its parents in reset
hierarchy). I implemented the other approach, it is possible but is more
complex (an object has to know its direct parent(s) and we need to scan
the reset hierarchy to know if we are in reset) so I prefer not
to introduce it here.
Moreover I think it has drawbacks if we want to handle complex reset
use cases with more reset type.
Anyway, as long as we don't migrate the reset-related state, there is
no problem to switch between approaches.
---
 Makefile.objs           |   1 +
 hw/core/Makefile.objs   |   1 +
 hw/core/resettable.c    | 186 ++++++++++++++++++++++++++++++++++++++++
 hw/core/trace-events    |  36 ++++++++
 include/hw/resettable.h | 159 ++++++++++++++++++++++++++++++++++
 5 files changed, 383 insertions(+)
 create mode 100644 hw/core/resettable.c
 create mode 100644 hw/core/trace-events
 create mode 100644 include/hw/resettable.h

diff --git a/Makefile.objs b/Makefile.objs
index 6a143dcd57..a723a47e14 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
 trace-events-subdirs +=3D net
 trace-events-subdirs +=3D ui
 endif
+trace-events-subdirs +=3D hw/core
 trace-events-subdirs +=3D hw/display
 trace-events-subdirs +=3D qapi
 trace-events-subdirs +=3D qom
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index b49f880a0c..69b408ad1c 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,6 +1,7 @@
 # core qdev-related obj files, also used by *-user:
 common-obj-y +=3D qdev.o qdev-properties.o
 common-obj-y +=3D bus.o reset.o
+common-obj-y +=3D resettable.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
new file mode 100644
index 0000000000..b534c2c7a4
--- /dev/null
+++ b/hw/core/resettable.c
@@ -0,0 +1,186 @@
+/*
+ * Resettable interface.
+ *
+ * Copyright (c) 2019 GreenSocs SAS
+ *
+ * Authors:
+ *   Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "hw/resettable.h"
+#include "trace.h"
+
+#define RESETTABLE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESETTABLE_INTERFACE)
+
+static void resettable_foreach_child(ResettableClass *rc,
+                                     Object *obj,
+                                     void (*func)(Object *, ResetType ty=
pe),
+                                     ResetType type)
+{
+    if (rc->foreach_child) {
+        rc->foreach_child(obj, func, type);
+    }
+}
+
+static void resettable_init_reset(Object *obj, ResetType type)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+    ResetState *s =3D rc->get_state(obj);
+    bool action_needed =3D false;
+
+    /* Only take action if we really enter reset for the 1st time. */
+    /*
+     * TODO: if adding more ResetType support, some additional checks
+     * are probably needed here.
+     */
+    if (s->count =3D=3D 0) {
+        action_needed =3D true;
+    }
+    s->count +=3D 1;
+    /*
+     * We limit the count to an arbitrary "big" value. The value is big
+     * enough not to be triggered nominally.
+     * The assert will stop an infinite loop if there is a cycle in the
+     * reset tree. The loop goes through resettable_foreach_child below
+     * which at some point will call us again.
+     */
+    assert(s->count <=3D 50);
+    trace_resettable_phase_init(obj, object_get_typename(obj), type,
+                                s->count, action_needed);
+
+    /*
+     * handle the children even if action_needed is at false so that
+     * children counts are incremented too
+     */
+    resettable_foreach_child(rc, obj, resettable_init_reset, type);
+
+    /* exec init phase */
+    if (action_needed) {
+        s->hold_phase_needed =3D true;
+        if (rc->phases.init) {
+            rc->phases.init(obj, type);
+        }
+    }
+    trace_resettable_phase_init_end(obj);
+}
+
+static void resettable_hold_reset_child(Object *obj, ResetType type)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+    ResetState *s =3D rc->get_state(obj);
+
+    trace_resettable_phase_hold(obj, object_get_typename(obj));
+
+    /* handle children first */
+    resettable_foreach_child(rc, obj, resettable_hold_reset_child, 0);
+
+    /* exec hold phase */
+    if (s->hold_phase_needed) {
+        s->hold_phase_needed =3D false;
+        if (rc->phases.hold) {
+            rc->phases.hold(obj);
+        }
+    }
+    trace_resettable_phase_hold_end(obj, s->hold_phase_needed);
+}
+
+static void resettable_hold_reset(Object *obj)
+{
+    /* we don't care of 2nd argument here */
+    resettable_hold_reset_child(obj, 0);
+}
+
+static void resettable_exit_reset_child(Object *obj, ResetType type)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+    ResetState *s =3D rc->get_state(obj);
+
+    trace_resettable_phase_exit(obj, object_get_typename(obj));
+
+    resettable_foreach_child(rc, obj, resettable_exit_reset_child, 0);
+
+    /*
+     * we could assert that count > 0 but there are some corner cases
+     * where we prefer to let it go as it is probably harmless.
+     * For example: if there is reset support addition between
+     * hosts when doing a migration. We may do such things as
+     * deassert a non-existing reset.
+     */
+    if (s->count > 0) {
+        s->count -=3D 1;
+    } else {
+        trace_resettable_count_underflow(obj);
+    }
+    if (s->count =3D=3D 0) {
+        if (rc->phases.exit) {
+            rc->phases.exit(obj);
+        }
+    }
+    trace_resettable_phase_exit_end(obj, s->count);
+}
+
+static void resettable_exit_reset(Object *obj)
+{
+    /* we don't care of 2nd argument here */
+    resettable_exit_reset_child(obj, 0);
+}
+
+void resettable_reset(Object *obj, ResetType type)
+{
+    /* TODO: change that when adding support for other reset types */
+    assert(type =3D=3D RESET_TYPE_COLD);
+    trace_resettable_reset(obj, type);
+    resettable_init_reset(obj, type);
+    resettable_hold_reset(obj);
+    resettable_exit_reset(obj);
+}
+
+void resettable_cold_reset_fn(void *opaque)
+{
+    resettable_reset((Object *) opaque, RESET_TYPE_COLD);
+}
+
+bool resettable_is_resetting(Object *obj)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+    ResetState *s =3D rc->get_state(obj);
+
+    return (s->count > 0);
+}
+
+void resettable_class_set_parent_phases(ResettableClass *rc,
+                                        ResettableInitPhase init,
+                                        ResettableHoldPhase hold,
+                                        ResettableExitPhase exit,
+                                        ResettablePhases *parent_phases)
+{
+    *parent_phases =3D rc->phases;
+    if (init) {
+        rc->phases.init =3D init;
+    }
+    if (hold) {
+        rc->phases.hold =3D hold;
+    }
+    if (exit) {
+        rc->phases.exit =3D exit;
+    }
+}
+
+static const TypeInfo resettable_interface_info =3D {
+    .name       =3D TYPE_RESETTABLE_INTERFACE,
+    .parent     =3D TYPE_INTERFACE,
+    .class_size =3D sizeof(ResettableClass),
+};
+
+static void reset_register_types(void)
+{
+    type_register_static(&resettable_interface_info);
+}
+
+type_init(reset_register_types)
diff --git a/hw/core/trace-events b/hw/core/trace-events
new file mode 100644
index 0000000000..ecf966c314
--- /dev/null
+++ b/hw/core/trace-events
@@ -0,0 +1,36 @@
+# See docs/devel/tracing.txt for syntax documentation.
+#
+# This file is processed by the tracetool script during the build.
+#
+# To add a new trace event:
+#
+# 1. Choose a name for the trace event.  Declare its arguments and forma=
t
+#    string.
+#
+# 2. Call the trace event from code using trace_##name, e.g. multiwrite_=
cb() ->
+#    trace_multiwrite_cb().  The source file must #include "trace.h".
+#
+# Format of a trace event:
+#
+# [disable] <name>(<type1> <arg1>[, <type2> <arg2>] ...) "<format-string=
>"
+#
+# Example: g_malloc(size_t size) "size %zu"
+#
+# The "disable" keyword will build without the trace event.
+#
+# The <name> must be a valid as a C function name.
+#
+# Types should be standard C types.  Use void * for pointers because the=
 trace
+# system may not have the necessary headers included.
+#
+# The <format-string> should be a sprintf()-compatible format string.
+
+# resettable.c
+resettable_reset(void *obj, int cold) "obj=3D%p cold=3D%d"
+resettable_phase_init(void *obj, const char *type, int cold, uint32_t co=
unt, int needed) "obj=3D%p(%s) cold=3D%d count=3D%" PRIu32 " needed=3D%d"
+resettable_phase_init_end(void *obj) "obj=3D%p"
+resettable_phase_hold(void *obj, const char *type) "obj=3D%p(%s)"
+resettable_phase_hold_end(void *obj, int needed) "obj=3D%p needed=3D%d"
+resettable_phase_exit(void *obj, const char *type) "obj=3D%p(%s)"
+resettable_phase_exit_end(void *obj, uint32_t count) "obj=3D%p count=3D%=
" PRIu32
+resettable_count_underflow(void *obj) "obj=3D%p"
diff --git a/include/hw/resettable.h b/include/hw/resettable.h
new file mode 100644
index 0000000000..5808c3c187
--- /dev/null
+++ b/include/hw/resettable.h
@@ -0,0 +1,159 @@
+#ifndef HW_RESETTABLE_H
+#define HW_RESETTABLE_H
+
+#include "qom/object.h"
+
+#define TYPE_RESETTABLE_INTERFACE "resettable"
+
+#define RESETTABLE_CLASS(class) \
+    OBJECT_CLASS_CHECK(ResettableClass, (class), TYPE_RESETTABLE_INTERFA=
CE)
+
+typedef struct ResetState ResetState;
+
+/**
+ * ResetType:
+ * Types of reset.
+ *
+ * + Cold: reset resulting from a power cycle of the object.
+ *
+ * TODO: Support has to be added to handle more types. In particular,
+ * ResetState structure needs to be expanded.
+ */
+typedef enum ResetType {
+    RESET_TYPE_COLD,
+} ResetType;
+
+/*
+ * ResettableClass:
+ * Interface for resettable objects.
+ *
+ * See docs/devel/reset.rst for more detailed information about
+ * how QEMU models reset.
+ *
+ * All objects which can be reset must implement this interface;
+ * it is usually provided by a base class such as DeviceClass or BusClas=
s.
+ * Every Resettable object must maintain some state tracking the
+ * progress of a reset operation by providing a ResetState structure.
+ * The functions defined in this module take care of updating the
+ * state of the reset.
+ * The base class implementation of the interface provides this
+ * state and implements the associated method: get_state.
+ *
+ * Concrete object implementations (typically specific devices
+ * such as a UART model) should provide the functions
+ * for the phases.init, phases.hold and phases.exit methods, which
+ * they can set in their class init function, either directly or
+ * by calling resettable_class_set_parent_phases().
+ * The phase methods are guaranteed to only only ever be called once
+ * for any reset event, in the order 'init', 'hold', 'exit'.
+ * An object will always move quickly from 'init' to 'hold'
+ * but might remain in 'hold' for an arbitrary period of time
+ * before eventually reset is deasserted and the 'exit' phase is called.
+ * Object implementations should be prepared for functions handling
+ * inbound connections from other devices (such as qemu_irq handler
+ * functions) to be called at any point during reset after their
+ * 'init' method has been called.
+ *
+ * Users of a resettable object should not call these methods
+ * directly, but instead use the function resettable_reset().
+ *
+ * @phases.init: This phase is called when the object enters reset. It
+ * should reset local state of the object, but it must not do anything t=
hat
+ * has a side-effect on other objects, such as raising or lowering a qem=
u_irq
+ * line or reading or writing guest memory. It takes the reset's type as
+ * argument.
+ *
+ * @phases.hold: This phase is called for entry into reset, once every o=
bject
+ * in the system which is being reset has had its @phases.init method ca=
lled.
+ * At this point devices can do actions that affect other objects.
+ *
+ * @phases.exit: This phase is called when the object leaves the reset s=
tate.
+ * Actions affecting other objects are permitted.
+ *
+ * @get_state: Mandatory method which must return a pointer to a ResetSt=
ate.
+ *
+ * @foreach_child: Executes a given function on every Resettable child. =
Child
+ * in this context means a child in the qbus tree, so the children of a =
qbus
+ * are the devices on it, and the children of a device are all the buses=
 it
+ * owns. This is not the same as the QOM object hierarchy. The function =
takes
+ * an additional ResetType argument which is passed to foreach_child.
+ */
+typedef void (*ResettableInitPhase)(Object *obj, ResetType type);
+typedef void (*ResettableHoldPhase)(Object *obj);
+typedef void (*ResettableExitPhase)(Object *obj);
+typedef ResetState * (*ResettableGetState)(Object *obj);
+typedef void (*ResettableForeachChild)(Object *obj,
+                                       void (*func)(Object *, ResetType =
type),
+                                       ResetType type);
+typedef struct ResettableClass {
+    InterfaceClass parent_class;
+
+    struct ResettablePhases {
+        ResettableInitPhase init;
+        ResettableHoldPhase hold;
+        ResettableExitPhase exit;
+    } phases;
+
+    ResettableGetState get_state;
+    ResettableForeachChild foreach_child;
+} ResettableClass;
+typedef struct ResettablePhases ResettablePhases;
+
+/**
+ * ResetState:
+ * Structure holding reset related state. The fields should not be acces=
sed
+ * directly, the definition is here to allow further inclusion into othe=
r
+ * objects.
+ *
+ * @count: Number of reset level the object is into. It is incremented w=
hen
+ * the reset operation starts and decremented when it finishes.
+ * @hold_phase_needed: flag which indicates that we need to invoke the '=
hold'
+ * phase handler for this object.
+ */
+struct ResetState {
+    uint32_t count;
+    bool hold_phase_needed;
+};
+
+/**
+ * resettable_is_resetting:
+ * Return true if @obj is under reset.
+ *
+ * @obj must implement Resettable interface.
+ */
+bool resettable_is_resetting(Object *obj);
+
+/**
+ * resettable_reset:
+ * Trigger a reset on a object @obj of type @type. @obj must implement
+ * Resettable interface.
+ *
+ * Calling this function is equivalent to calling @resettable_assert_res=
et then
+ * @resettable_deassert_reset.
+ */
+void resettable_reset(Object *obj, ResetType type);
+
+/**
+ * resettable_cold_reset_fn:
+ * Helper to call resettable_reset((Object *) opaque, RESET_TYPE_COLD).
+ *
+ * This function is typically useful to register a reset handler with
+ * qemu_register_reset.
+ */
+void resettable_cold_reset_fn(void *opaque);
+
+/**
+ * resettable_class_set_parent_phases:
+ *
+ * Save @rc current reset phases into @parent_phases and override @rc ph=
ases
+ * by the given new methods (@init, @hold and @exit).
+ * Each phase is overridden only if the new one is not NULL allowing to
+ * override a subset of phases.
+ */
+void resettable_class_set_parent_phases(ResettableClass *rc,
+                                        ResettableInitPhase init,
+                                        ResettableHoldPhase hold,
+                                        ResettableExitPhase exit,
+                                        ResettablePhases *parent_phases)=
;
+
+#endif
--=20
2.22.0


