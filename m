Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9616C245
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:28:02 +0100 (CET)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aFl-00031f-6r
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2q-00084g-B3
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6a2n-00026X-Ij
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:14:40 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:57156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6a2d-00021E-Pj; Tue, 25 Feb 2020 08:14:29 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6DC0696EF2;
 Tue, 25 Feb 2020 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582636465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFmM4+kOGNsVKEPr8GUSv7xFy0fodus3YFsskyISQYY=;
 b=wVA9lHuPDOqM/BocphBuO+QpLEY8zsUT8YcSUjxOb3r9GpISlMJunSIequAACoZ808WQeO
 qANxXUNyNQSEc8FBtS61KGxSFb58qLxa+jr/qAsdcTTJjPMSuKaen2gI5xUAi4rr7HvBSc
 pe77Gj095SJwkkuA3N7/nCXsMHJorWA=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/9] hw/core/clock: introduce clock object
Date: Tue, 25 Feb 2020 14:14:14 +0100
Message-Id: <20200225131422.53368-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200225131422.53368-1-damien.hedde@greensocs.com>
References: <20200225131422.53368-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582636465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFmM4+kOGNsVKEPr8GUSv7xFy0fodus3YFsskyISQYY=;
 b=7ByB7XWVjPgq83q9r1wQZ6qe3io4orZaHvkNWfiitlYzO+gQhuuM4Uh59/7HqyHQc+sQQH
 95Mo+NgBNSb6fQzw2NiXsMLIQCzwjg/myrkwK4ULYECJQonjF0EyRNdyKRgUU5b7X8WOhg
 8XRMzyR68s3jFLjESVUyh8uH1HSD9Ug=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582636466; a=rsa-sha256; cv=none;
 b=yvAfUWNtXyjNAcF9ksRgzZyIu5F6HpUC9Kt5M2RUGcU1G0NjZxb3B/eaKH1npB4jqIrBhg
 SVBZbZykpi6EHy6oUkxQbjyx6qjrcbJuy3k6tYaO8gjyz8bO6AuMp0HfLXtD1htQxvP8Ib
 O3b6V4uf2OXoy4xPZINv4Iqj4aVCcpg=
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

This object may be used to represent a clock inside a clock tree.

A clock may be connected to another clock so that it receives update,
through a callback, whenever the source/parent clock is updated.

Although only the root clock of a clock tree controls the values
(represented as periods) of all clocks in tree, each clock holds
a local state containing the current value so that it can be fetched
independently. It will allows us to fullfill migration requirements
by migrating each clock independently of others.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
--

v8:
+ fix hw/core/Makefiles.objs entry (Alistair)
+ no more field zeroing in finalizefn (Alistair)
+ typos (Alistair)

v7:
+ merge ClockIn & ClockOut into a single type Clock
+ switch clock state to a period with 2^-32ns unit
+ add some Hz and ns helpers
+ propagate clock period when setting the source so that
  clocks with fixed period are easy to handle.
---
 include/hw/clock.h    | 216 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/clock.c       | 130 +++++++++++++++++++++++++
 hw/core/Makefile.objs |   1 +
 hw/core/trace-events  |   7 ++
 4 files changed, 354 insertions(+)
 create mode 100644 include/hw/clock.h
 create mode 100644 hw/core/clock.c

diff --git a/include/hw/clock.h b/include/hw/clock.h
new file mode 100644
index 0000000000..82a7f3c698
--- /dev/null
+++ b/include/hw/clock.h
@@ -0,0 +1,216 @@
+/*
+ * Hardware Clocks
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
+#ifndef QEMU_HW_CLOCK_H
+#define QEMU_HW_CLOCK_H
+
+#include "qom/object.h"
+#include "qemu/queue.h"
+
+#define TYPE_CLOCK "clock"
+#define CLOCK(obj) OBJECT_CHECK(Clock, (obj), TYPE_CLOCK)
+
+typedef void ClockCallback(void *opaque);
+
+/*
+ * clock store a value representing the clock's period in 2^-32ns unit.
+ * It can represent:
+ *  + periods from 2^-32ns up to 4seconds
+ *  + frequency from ~0.25Hz 2e10Ghz
+ * Resolution of frequency representation decreases with frequency:
+ * + at 100MHz, resolution is ~2mHz
+ * + at 1Ghz,   resolution is ~0.2Hz
+ * + at 10Ghz,  resolution is ~20Hz
+ */
+#define CLOCK_SECOND (1000000000llu << 32)
+
+/*
+ * macro helpers to convert to hertz / nanosecond
+ */
+#define CLOCK_PERIOD_FROM_NS(ns) ((ns) * (CLOCK_SECOND / 1000000000llu))
+#define CLOCK_PERIOD_TO_NS(per) ((per) / (CLOCK_SECOND / 1000000000llu))
+#define CLOCK_PERIOD_FROM_HZ(hz) (((hz) !=3D 0) ? CLOCK_SECOND / (hz) : =
0u)
+#define CLOCK_PERIOD_TO_HZ(per) (((per) !=3D 0) ? CLOCK_SECOND / (per) :=
 0u)
+
+/**
+ * Clock:
+ * @parent_obj: parent class
+ * @period: unsigned integer representing the period of the clock
+ * @canonical_path: clock path string cache (used for trace purpose)
+ * @callback: called when clock changes
+ * @callback_opaque: argument for @callback
+ * @source: source (or parent in clock tree) of the clock
+ * @children: list of clocks connected to this one (it is their source)
+ * @sibling: structure used to form a clock list
+ */
+
+typedef struct Clock Clock;
+
+struct Clock {
+    /*< private >*/
+    Object parent_obj;
+
+    /* all fields are private and should not be modified directly */
+
+    /* fields */
+    uint64_t period;
+    char *canonical_path;
+    ClockCallback *callback;
+    void *callback_opaque;
+
+    /* Clocks are organized in a clock tree */
+    Clock *source;
+    QLIST_HEAD(, Clock) children;
+    QLIST_ENTRY(Clock) sibling;
+};
+
+/**
+ * clock_setup_canonical_path:
+ * @clk: clock
+ *
+ * compute the canonical path of the clock (used by log messages)
+ */
+void clock_setup_canonical_path(Clock *clk);
+
+/**
+ * clock_set_callback:
+ * @clk: the clock to register the callback into
+ * @cb: the callback function
+ * @opaque: the argument to the callback
+ *
+ * Register a callback called on every clock update.
+ */
+void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque);
+
+/**
+ * clock_clear_callback:
+ * @clk: the clock to delete the callback from
+ *
+ * Unregister the callback registered with clock_set_callback.
+ */
+void clock_clear_callback(Clock *clk);
+
+/**
+ * clock_set_source:
+ * @clk: the clock.
+ * @src: the source clock
+ *
+ * Setup @src as the clock source of @clk. The current @src period
+ * value is also copied to @clk and its subtree but no callback is
+ * called.
+ * Further @src update will be propagated to @clk and its subtree.
+ */
+void clock_set_source(Clock *clk, Clock *src);
+
+/**
+ * clock_set:
+ * @clk: the clock to initialize.
+ * @value: the clock's value, 0 means unclocked
+ *
+ * Set the local cached period value of @clk to @value.
+ */
+void clock_set(Clock *clk, uint64_t value);
+
+static inline void clock_set_hz(Clock *clk, unsigned hz)
+{
+    clock_set(clk, CLOCK_PERIOD_FROM_HZ(hz));
+}
+
+static inline void clock_set_ns(Clock *clk, unsigned ns)
+{
+    clock_set(clk, CLOCK_PERIOD_FROM_NS(ns));
+}
+
+/**
+ * clock_propagate:
+ * @clk: the clock
+ *
+ * Propagate the clock period that has been previously configured using
+ * @clock_set(). This will update recursively all connected clocks.
+ * It is an error to call this function on a clock which has a source.
+ * Note: this function must not be called during device inititialization
+ * or migration.
+ */
+void clock_propagate(Clock *clk);
+
+/**
+ * clock_update:
+ * @clk: the clock to update.
+ * @value: the new clock's value, 0 means unclocked
+ *
+ * Update the @clk to the new @value. All connected clocks will be infor=
med
+ * of this update. This is equivalent to call @clock_set() then
+ * @clock_propagate().
+ */
+static inline void clock_update(Clock *clk, uint64_t value)
+{
+    clock_set(clk, value);
+    clock_propagate(clk);
+}
+
+static inline void clock_update_hz(Clock *clk, unsigned hz)
+{
+    clock_update(clk, CLOCK_PERIOD_FROM_HZ(hz));
+}
+
+static inline void clock_update_ns(Clock *clk, unsigned ns)
+{
+    clock_update(clk, CLOCK_PERIOD_FROM_NS(ns));
+}
+
+/**
+ * clock_get:
+ * @clk: the clk to fetch the clock
+ *
+ * @return: the current period.
+ */
+static inline uint64_t clock_get(const Clock *clk)
+{
+    return clk->period;
+}
+
+static inline unsigned clock_get_hz(Clock *clk)
+{
+    return CLOCK_PERIOD_TO_HZ(clock_get(clk));
+}
+
+static inline unsigned clock_get_ns(Clock *clk)
+{
+    return CLOCK_PERIOD_TO_NS(clock_get(clk));
+}
+
+/**
+ * clock_is_enabled:
+ * @clk: a clock
+ *
+ * @return: true if the clock is running.
+ */
+static inline bool clock_is_enabled(const Clock *clk)
+{
+    return clock_get(clk) !=3D 0;
+}
+
+static inline void clock_init(Clock *clk, uint64_t value)
+{
+    clock_set(clk, value);
+}
+static inline void clock_init_hz(Clock *clk, uint64_t value)
+{
+    clock_set_hz(clk, value);
+}
+static inline void clock_init_ns(Clock *clk, uint64_t value)
+{
+    clock_set_ns(clk, value);
+}
+
+#endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/core/clock.c b/hw/core/clock.c
new file mode 100644
index 0000000000..3c0daf7d4c
--- /dev/null
+++ b/hw/core/clock.c
@@ -0,0 +1,130 @@
+/*
+ * Hardware Clocks
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
+#include "hw/clock.h"
+#include "trace.h"
+
+#define CLOCK_PATH(_clk) (_clk->canonical_path)
+
+void clock_setup_canonical_path(Clock *clk)
+{
+    g_free(clk->canonical_path);
+    clk->canonical_path =3D object_get_canonical_path(OBJECT(clk));
+}
+
+void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque)
+{
+    clk->callback =3D cb;
+    clk->callback_opaque =3D opaque;
+}
+
+void clock_clear_callback(Clock *clk)
+{
+    clock_set_callback(clk, NULL, NULL);
+}
+
+void clock_set(Clock *clk, uint64_t period)
+{
+    trace_clock_set(CLOCK_PATH(clk), CLOCK_PERIOD_TO_NS(clk->period),
+                    CLOCK_PERIOD_TO_NS(period));
+    clk->period =3D period;
+}
+
+static void clock_propagate_period(Clock *clk, bool call_callbacks)
+{
+    Clock *child;
+
+    QLIST_FOREACH(child, &clk->children, sibling) {
+        if (child->period !=3D clk->period) {
+            child->period =3D clk->period;
+            trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
+                               CLOCK_PERIOD_TO_NS(clk->period),
+                               call_callbacks);
+            if (call_callbacks && child->callback) {
+                child->callback(child->callback_opaque);
+            }
+            clock_propagate_period(child, call_callbacks);
+        }
+    }
+}
+
+void clock_propagate(Clock *clk)
+{
+    assert(clk->source =3D=3D NULL);
+    trace_clock_propagate(CLOCK_PATH(clk));
+    clock_propagate_period(clk, true);
+}
+
+void clock_set_source(Clock *clk, Clock *src)
+{
+    /* changing clock source is not supported */
+    assert(!clk->source);
+
+    trace_clock_set_source(CLOCK_PATH(clk), CLOCK_PATH(src));
+
+    clk->period =3D src->period;
+    QLIST_INSERT_HEAD(&src->children, clk, sibling);
+    clk->source =3D src;
+    clock_propagate_period(clk, false);
+}
+
+static void clock_disconnect(Clock *clk)
+{
+    if (clk->source =3D=3D NULL) {
+        return;
+    }
+
+    trace_clock_disconnect(CLOCK_PATH(clk));
+
+    clk->source =3D NULL;
+    QLIST_REMOVE(clk, sibling);
+}
+
+static void clock_initfn(Object *obj)
+{
+    Clock *clk =3D CLOCK(obj);
+
+    QLIST_INIT(&clk->children);
+}
+
+static void clock_finalizefn(Object *obj)
+{
+    Clock *clk =3D CLOCK(obj);
+    Clock *child, *next;
+
+    /* clear our list of children */
+    QLIST_FOREACH_SAFE(child, &clk->children, sibling, next) {
+        clock_disconnect(child);
+    }
+
+    /* remove us from source's children list */
+    clock_disconnect(clk);
+
+    g_free(clk->canonical_path);
+}
+
+static const TypeInfo clock_info =3D {
+    .name              =3D TYPE_CLOCK,
+    .parent            =3D TYPE_OBJECT,
+    .instance_size     =3D sizeof(Clock),
+    .instance_init     =3D clock_initfn,
+    .instance_finalize =3D clock_finalizefn,
+};
+
+static void clock_register_types(void)
+{
+    type_register_static(&clock_info);
+}
+
+type_init(clock_register_types)
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 6215e7c208..1d9b0aa205 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -7,6 +7,7 @@ common-obj-y +=3D hotplug.o
 common-obj-y +=3D vmstate-if.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
+common-obj-y +=3D clock.o
=20
 common-obj-$(CONFIG_SOFTMMU) +=3D reset.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
diff --git a/hw/core/trace-events b/hw/core/trace-events
index aecd8e160e..39301621ce 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -27,3 +27,10 @@ resettable_phase_exit_begin(void *obj, const char *obj=
type, unsigned count, int
 resettable_phase_exit_exec(void *obj, const char *objtype, int has_metho=
d) "obj=3D%p(%s) method=3D%d"
 resettable_phase_exit_end(void *obj, const char *objtype, unsigned count=
) "obj=3D%p(%s) count=3D%d"
 resettable_transitional_function(void *obj, const char *objtype) "obj=3D=
%p(%s)"
+
+# clock.c
+clock_set_source(const char *clk, const char *src) "'%s', src=3D'%s'"
+clock_disconnect(const char *clk) "'%s'"
+clock_set(const char *clk, unsigned long long old, unsigned long long ne=
w) "'%s', ns=3D%llu->%llu"
+clock_propagate(const char *clk) "'%s'"
+clock_update(const char *clk, const char *src, unsigned long long val, i=
nt cb) "'%s', src=3D'%s', ns=3D%llu, cb=3D%d"
--=20
2.25.1


