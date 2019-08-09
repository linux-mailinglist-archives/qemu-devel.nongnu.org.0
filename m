Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC287282
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 08:56:30 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvypB-0000RQ-Tv
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 02:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48287)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hvyg8-0000sK-An
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hvyg3-0001kV-5u
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:47:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53684)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hvyfz-0001hi-2Z
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:47:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE392300C768
 for <qemu-devel@nongnu.org>; Fri,  9 Aug 2019 06:46:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F3D608C2;
 Fri,  9 Aug 2019 06:46:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 882BA11384DA; Fri,  9 Aug 2019 08:46:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 Aug 2019 08:46:23 +0200
Message-Id: <20190809064645.22656-8-armbru@redhat.com>
In-Reply-To: <20190809064645.22656-1-armbru@redhat.com>
References: <20190809064645.22656-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 09 Aug 2019 06:46:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 07/29] trace: Do not include qom/cpu.h into
 generated trace.h
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

docs/devel/tracing.txt explains "since many source files include
trace.h, [the generated trace.h use] a minimum of types and other
header files included to keep the namespace clean and compile times
and dependencies down."

Commit 4815185902 "trace: Add per-vCPU tracing states for events with
the 'vcpu' property" made them all include qom/cpu.h via
control-internal.h.  qom/cpu.h in turn includes about thirty headers.
Ouch.

Per-vCPU tracing is currently not supported in sub-directories'
trace-events.  In other words, qom/cpu.h can only be used in
trace-root.h, not in any trace.h.

Split trace/control-vcpu.h off trace/control.h and
trace/control-internal.h.  Have the generated trace.h include
trace/control.h (which no longer includes qom/cpu.h), and trace-root.h
include trace/control-vcpu.h (which includes it).

The resulting improvement is a bit disappointing: in my "build
everything" tree, some 1100 out of 6600 objects (not counting tests
and objects that don't depend on qemu/osdep.h) depend on a trace.h,
and about 600 of them no longer depend on qom/cpu.h.  But more than
1300 others depend on trace-root.h.  More work is clearly needed.
Left for another day.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block/block-backend.c         |  1 +
 qom/object.c                  |  1 +
 scripts/tracetool/format/c.py |  1 +
 scripts/tracetool/format/h.py |  7 +++-
 trace/control-internal.h      | 25 --------------
 trace/control-vcpu.h          | 63 +++++++++++++++++++++++++++++++++++
 trace/control.h               | 24 -------------
 trace/qmp.c                   |  2 +-
 ui/vnc.c                      |  1 +
 9 files changed, 74 insertions(+), 51 deletions(-)
 create mode 100644 trace/control-vcpu.h

diff --git a/block/block-backend.c b/block/block-backend.c
index 0056b526b8..6aed80bf0b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -15,6 +15,7 @@
 #include "block/block_int.h"
 #include "block/blockjob.h"
 #include "block/throttle-groups.h"
+#include "hw/qdev-core.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
diff --git a/qom/object.c b/qom/object.c
index 1555547727..6fa9c619fa 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -11,6 +11,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/qdev-core.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.p=
y
index 833c05a022..31207961b0 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -28,6 +28,7 @@ def generate(events, backend, group):
     out('/* This file is autogenerated by tracetool, do not edit. */',
         '',
         '#include "qemu/osdep.h"',
+        '#include "qemu/module.h"',
         '#include "%s"' % header,
         '')
=20
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.p=
y
index 338a2365ee..5596b304e6 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -17,12 +17,17 @@ from tracetool import out
=20
=20
 def generate(events, backend, group):
+    if group =3D=3D "root":
+        header =3D "trace/control-vcpu.h"
+    else:
+        header =3D "trace/control.h"
+
     out('/* This file is autogenerated by tracetool, do not edit. */',
         '',
         '#ifndef TRACE_%s_GENERATED_TRACERS_H' % group.upper(),
         '#define TRACE_%s_GENERATED_TRACERS_H' % group.upper(),
         '',
-        '#include "trace/control.h"',
+        '#include "%s"' % header,
         '')
=20
     for e in events:
diff --git a/trace/control-internal.h b/trace/control-internal.h
index c7fbe2d3bf..8b2b50a7cf 100644
--- a/trace/control-internal.h
+++ b/trace/control-internal.h
@@ -10,9 +10,6 @@
 #ifndef TRACE__CONTROL_INTERNAL_H
 #define TRACE__CONTROL_INTERNAL_H
=20
-#include "qom/cpu.h"
-
-
 extern int trace_events_enabled_count;
=20
=20
@@ -59,28 +56,6 @@ static inline bool trace_event_get_state_dynamic(Trace=
Event *ev)
     return unlikely(trace_events_enabled_count) && *ev->dstate;
 }
=20
-static inline bool
-trace_event_get_vcpu_state_dynamic_by_vcpu_id(CPUState *vcpu,
-                                              uint32_t vcpu_id)
-{
-    /* it's on fast path, avoid consistency checks (asserts) */
-    if (unlikely(trace_events_enabled_count)) {
-        return test_bit(vcpu_id, vcpu->trace_dstate);
-    } else {
-        return false;
-    }
-}
-
-static inline bool trace_event_get_vcpu_state_dynamic(CPUState *vcpu,
-                                                      TraceEvent *ev)
-{
-    uint32_t vcpu_id;
-    assert(trace_event_is_vcpu(ev));
-    vcpu_id =3D trace_event_get_vcpu_id(ev);
-    return trace_event_get_vcpu_state_dynamic_by_vcpu_id(vcpu, vcpu_id);
-}
-
-
 void trace_event_register_group(TraceEvent **events);
=20
 #endif /* TRACE__CONTROL_INTERNAL_H */
diff --git a/trace/control-vcpu.h b/trace/control-vcpu.h
new file mode 100644
index 0000000000..a8f1035c2e
--- /dev/null
+++ b/trace/control-vcpu.h
@@ -0,0 +1,63 @@
+/*
+ * Interface for configuring and controlling the state of tracing events=
.
+ *
+ * Copyright (C) 2011-2016 Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TRACE__CONTROL_VCPU_H
+#define TRACE__CONTROL_VCPU_H
+
+#include "control.h"
+#include "event-internal.h"
+#include "qom/cpu.h"
+
+/**
+ * trace_event_get_vcpu_state:
+ * @vcpu: Target vCPU.
+ * @id: Event identifier name.
+ *
+ * Get the tracing state of an event (both static and dynamic) for the g=
iven
+ * vCPU.
+ *
+ * If the event has the disabled property, the check will have no perfor=
mance
+ * impact.
+ */
+#define trace_event_get_vcpu_state(vcpu, id)                            =
\
+    ((id ##_ENABLED) &&                                                 =
\
+     trace_event_get_vcpu_state_dynamic_by_vcpu_id(                     =
\
+         vcpu, _ ## id ## _EVENT.vcpu_id))
+
+/**
+ * trace_event_get_vcpu_state_dynamic:
+ *
+ * Get the dynamic tracing state of an event for the given vCPU.
+ */
+static bool trace_event_get_vcpu_state_dynamic(CPUState *vcpu, TraceEven=
t *ev);
+
+#include "control-internal.h"
+
+static inline bool
+trace_event_get_vcpu_state_dynamic_by_vcpu_id(CPUState *vcpu,
+                                              uint32_t vcpu_id)
+{
+    /* it's on fast path, avoid consistency checks (asserts) */
+    if (unlikely(trace_events_enabled_count)) {
+        return test_bit(vcpu_id, vcpu->trace_dstate);
+    } else {
+        return false;
+    }
+}
+
+static inline bool trace_event_get_vcpu_state_dynamic(CPUState *vcpu,
+                                                      TraceEvent *ev)
+{
+    uint32_t vcpu_id;
+    assert(trace_event_is_vcpu(ev));
+    vcpu_id =3D trace_event_get_vcpu_id(ev);
+    return trace_event_get_vcpu_state_dynamic_by_vcpu_id(vcpu, vcpu_id);
+}
+
+#endif
diff --git a/trace/control.h b/trace/control.h
index 570492d6e8..1f81c491b6 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -119,22 +119,6 @@ static const char * trace_event_get_name(TraceEvent =
*ev);
 #define trace_event_get_state_backends(id)              \
     ((id ##_ENABLED) && id ##_BACKEND_DSTATE())
=20
-/**
- * trace_event_get_vcpu_state:
- * @vcpu: Target vCPU.
- * @id: Event identifier name.
- *
- * Get the tracing state of an event (both static and dynamic) for the g=
iven
- * vCPU.
- *
- * If the event has the disabled property, the check will have no perfor=
mance
- * impact.
- */
-#define trace_event_get_vcpu_state(vcpu, id)                            =
\
-    ((id ##_ENABLED) &&                                                 =
\
-     trace_event_get_vcpu_state_dynamic_by_vcpu_id(                     =
\
-         vcpu, _ ## id ## _EVENT.vcpu_id))
-
 /**
  * trace_event_get_state_static:
  * @id: Event identifier.
@@ -155,14 +139,6 @@ static bool trace_event_get_state_static(TraceEvent =
*ev);
  */
 static bool trace_event_get_state_dynamic(TraceEvent *ev);
=20
-/**
- * trace_event_get_vcpu_state_dynamic:
- *
- * Get the dynamic tracing state of an event for the given vCPU.
- */
-static bool trace_event_get_vcpu_state_dynamic(CPUState *vcpu, TraceEven=
t *ev);
-
-
 /**
  * trace_event_set_state_dynamic:
  *
diff --git a/trace/qmp.c b/trace/qmp.c
index ea99b00956..38246e1aa6 100644
--- a/trace/qmp.c
+++ b/trace/qmp.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-trace.h"
-#include "control.h"
+#include "control-vcpu.h"
=20
=20
 static CPUState *get_cpu(bool has_vcpu, int vcpu, Error **errp)
diff --git a/ui/vnc.c b/ui/vnc.c
index 38f92bfca3..f47f726681 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -28,6 +28,7 @@
 #include "vnc.h"
 #include "vnc-jobs.h"
 #include "trace.h"
+#include "hw/qdev-core.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
--=20
2.21.0


