Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BD44714
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 18:57:20 +0200 (CEST)
Received: from localhost ([::1]:41868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbT2N-0002ZN-Cg
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60015)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hbRkv-0000bj-6K
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hbRks-0003Ws-Sw
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:35:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hbRkl-0003J4-AT; Thu, 13 Jun 2019 11:35:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE3588F927;
 Thu, 13 Jun 2019 15:34:54 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-246.ams2.redhat.com
 [10.36.116.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5964C60FFE;
 Thu, 13 Jun 2019 15:34:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:33:59 +0200
Message-Id: <20190613153405.24769-10-kwolf@redhat.com>
In-Reply-To: <20190613153405.24769-1-kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 13 Jun 2019 15:35:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 09/15] monitor: Create monitor-internal.h
 with common definitions
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we can split monitor/misc.c, we need to create a header file that
contains the common definitions that will be used by multiple source
files.

For a start, add the type definitions for Monitor, MonitorHMP and
MonitorQMP and their dependencies. We'll add functions as needed when
splitting monitor/misc.c.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/monitor-internal.h | 148 +++++++++++++++++++++++++++++++++++++
 monitor/misc.c             | 110 +--------------------------
 MAINTAINERS                |   2 +
 3 files changed, 151 insertions(+), 109 deletions(-)
 create mode 100644 monitor/monitor-internal.h

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
new file mode 100644
index 0000000000..17a632b0ad
--- /dev/null
+++ b/monitor/monitor-internal.h
@@ -0,0 +1,148 @@
+/*
+ * QEMU monitor
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#ifndef MONITOR_INT_H
+#define MONITOR_INT_H
+
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/json-parser.h"
+#include "qapi/qmp/dispatch.h"
+#include "qapi/qapi-types-misc.h"
+
+#include "qemu/readline.h"
+#include "chardev/char-fe.h"
+#include "sysemu/iothread.h"
+
+/*
+ * Supported types:
+ *
+ * 'F'          filename
+ * 'B'          block device name
+ * 's'          string (accept optional quote)
+ * 'S'          it just appends the rest of the string (accept optional =
quote)
+ * 'O'          option string of the form NAME=3DVALUE,...
+ *              parsed according to QemuOptsList given by its name
+ *              Example: 'device:O' uses qemu_device_opts.
+ *              Restriction: only lists with empty desc are supported
+ *              TODO lift the restriction
+ * 'i'          32 bit integer
+ * 'l'          target long (32 or 64 bit)
+ * 'M'          Non-negative target long (32 or 64 bit), in user mode th=
e
+ *              value is multiplied by 2^20 (think Mebibyte)
+ * 'o'          octets (aka bytes)
+ *              user mode accepts an optional E, e, P, p, T, t, G, g, M,=
 m,
+ *              K, k suffix, which multiplies the value by 2^60 for suff=
ixes E
+ *              and e, 2^50 for suffixes P and p, 2^40 for suffixes T an=
d t,
+ *              2^30 for suffixes G and g, 2^20 for M and m, 2^10 for K =
and k
+ * 'T'          double
+ *              user mode accepts an optional ms, us, ns suffix,
+ *              which divides the value by 1e3, 1e6, 1e9, respectively
+ * '/'          optional gdb-like print format (like "/10x")
+ *
+ * '?'          optional type (for all types, except '/')
+ * '.'          other form of optional type (for 'i' and 'l')
+ * 'b'          boolean
+ *              user mode accepts "on" or "off"
+ * '-'          optional parameter (eg. '-f')
+ *
+ */
+
+typedef struct HMPCommand {
+    const char *name;
+    const char *args_type;
+    const char *params;
+    const char *help;
+    const char *flags; /* p=3Dpreconfig */
+    void (*cmd)(Monitor *mon, const QDict *qdict);
+    /*
+     * @sub_table is a list of 2nd level of commands. If it does not exi=
st,
+     * cmd should be used. If it exists, sub_table[?].cmd should be
+     * used, and cmd of 1st level plays the role of help function.
+     */
+    struct HMPCommand *sub_table;
+    void (*command_completion)(ReadLineState *rs, int nb_args, const cha=
r *str);
+} HMPCommand;
+
+struct Monitor {
+    CharBackend chr;
+    int reset_seen;
+    int flags;
+    int suspend_cnt;            /* Needs to be accessed atomically */
+    bool skip_flush;
+    bool use_io_thread;
+
+    gchar *mon_cpu_path;
+    QTAILQ_ENTRY(Monitor) entry;
+
+    /*
+     * The per-monitor lock. We can't access guest memory when holding
+     * the lock.
+     */
+    QemuMutex mon_lock;
+
+    /*
+     * Members that are protected by the per-monitor lock
+     */
+    QLIST_HEAD(, mon_fd_t) fds;
+    QString *outbuf;
+    guint out_watch;
+    /* Read under either BQL or mon_lock, written with BQL+mon_lock.  */
+    int mux_out;
+};
+
+struct MonitorHMP {
+    Monitor common;
+    /*
+     * State used only in the thread "owning" the monitor.
+     * If @use_io_thread, this is @mon_iothread. (This does not actually=
 happen
+     * in the current state of the code.)
+     * Else, it's the main thread.
+     * These members can be safely accessed without locks.
+     */
+    ReadLineState *rs;
+};
+
+typedef struct {
+    Monitor common;
+    JSONMessageParser parser;
+    /*
+     * When a client connects, we're in capabilities negotiation mode.
+     * @commands is &qmp_cap_negotiation_commands then.  When command
+     * qmp_capabilities succeeds, we go into command mode, and
+     * @command becomes &qmp_commands.
+     */
+    QmpCommandList *commands;
+    bool capab_offered[QMP_CAPABILITY__MAX]; /* capabilities offered */
+    bool capab[QMP_CAPABILITY__MAX];         /* offered and accepted */
+    /*
+     * Protects qmp request/response queue.
+     * Take monitor_lock first when you need both.
+     */
+    QemuMutex qmp_queue_lock;
+    /* Input queue that holds all the parsed QMP requests */
+    GQueue *qmp_requests;
+} MonitorQMP;
+
+#endif
diff --git a/monitor/misc.c b/monitor/misc.c
index e5db04265d..6aa4a21676 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "monitor-internal.h"
 #include "qemu/units.h"
 #include <dirent.h>
 #include "cpu.h"
@@ -93,55 +94,6 @@
 #include "hw/s390x/storage-attributes.h"
 #endif
=20
-/*
- * Supported types:
- *
- * 'F'          filename
- * 'B'          block device name
- * 's'          string (accept optional quote)
- * 'S'          it just appends the rest of the string (accept optional =
quote)
- * 'O'          option string of the form NAME=3DVALUE,...
- *              parsed according to QemuOptsList given by its name
- *              Example: 'device:O' uses qemu_device_opts.
- *              Restriction: only lists with empty desc are supported
- *              TODO lift the restriction
- * 'i'          32 bit integer
- * 'l'          target long (32 or 64 bit)
- * 'M'          Non-negative target long (32 or 64 bit), in user mode th=
e
- *              value is multiplied by 2^20 (think Mebibyte)
- * 'o'          octets (aka bytes)
- *              user mode accepts an optional E, e, P, p, T, t, G, g, M,=
 m,
- *              K, k suffix, which multiplies the value by 2^60 for suff=
ixes E
- *              and e, 2^50 for suffixes P and p, 2^40 for suffixes T an=
d t,
- *              2^30 for suffixes G and g, 2^20 for M and m, 2^10 for K =
and k
- * 'T'          double
- *              user mode accepts an optional ms, us, ns suffix,
- *              which divides the value by 1e3, 1e6, 1e9, respectively
- * '/'          optional gdb-like print format (like "/10x")
- *
- * '?'          optional type (for all types, except '/')
- * '.'          other form of optional type (for 'i' and 'l')
- * 'b'          boolean
- *              user mode accepts "on" or "off"
- * '-'          optional parameter (eg. '-f')
- *
- */
-
-typedef struct HMPCommand {
-    const char *name;
-    const char *args_type;
-    const char *params;
-    const char *help;
-    const char *flags; /* p=3Dpreconfig */
-    void (*cmd)(Monitor *mon, const QDict *qdict);
-    /* @sub_table is a list of 2nd level of commands. If it does not exi=
st,
-     * cmd should be used. If it exists, sub_table[?].cmd should be
-     * used, and cmd of 1st level plays the role of help function.
-     */
-    struct HMPCommand *sub_table;
-    void (*command_completion)(ReadLineState *rs, int nb_args, const cha=
r *str);
-} HMPCommand;
-
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
@@ -184,66 +136,6 @@ typedef struct {
     int64_t rate;       /* Minimum time (in ns) between two events */
 } MonitorQAPIEventConf;
=20
-struct Monitor {
-    CharBackend chr;
-    int reset_seen;
-    int flags;
-    int suspend_cnt;            /* Needs to be accessed atomically */
-    bool skip_flush;
-    bool use_io_thread;
-
-    gchar *mon_cpu_path;
-    QTAILQ_ENTRY(Monitor) entry;
-
-    /*
-     * The per-monitor lock. We can't access guest memory when holding
-     * the lock.
-     */
-    QemuMutex mon_lock;
-
-    /*
-     * Members that are protected by the per-monitor lock
-     */
-    QLIST_HEAD(, mon_fd_t) fds;
-    QString *outbuf;
-    guint out_watch;
-    /* Read under either BQL or mon_lock, written with BQL+mon_lock.  */
-    int mux_out;
-};
-
-struct MonitorHMP {
-    Monitor common;
-    /*
-     * State used only in the thread "owning" the monitor.
-     * If @use_io_thread, this is @mon_iothread. (This does not actually=
 happen
-     * in the current state of the code.)
-     * Else, it's the main thread.
-     * These members can be safely accessed without locks.
-     */
-    ReadLineState *rs;
-};
-
-typedef struct {
-    Monitor common;
-    JSONMessageParser parser;
-    /*
-     * When a client connects, we're in capabilities negotiation mode.
-     * @commands is &qmp_cap_negotiation_commands then.  When command
-     * qmp_capabilities succeeds, we go into command mode, and
-     * @command becomes &qmp_commands.
-     */
-    QmpCommandList *commands;
-    bool capab_offered[QMP_CAPABILITY__MAX]; /* capabilities offered */
-    bool capab[QMP_CAPABILITY__MAX];         /* offered and accepted */
-    /*
-     * Protects qmp request/response queue.
-     * Take monitor_lock first when you need both.
-     */
-    QemuMutex qmp_queue_lock;
-    /* Input queue that holds all the parsed QMP requests */
-    GQueue *qmp_requests;
-} MonitorQMP;
-
 /* Shared monitor I/O thread */
 IOThread *mon_iothread;
=20
diff --git a/MAINTAINERS b/MAINTAINERS
index 884f4b16bb..ebb839d305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1916,6 +1916,7 @@ F: qapi/run-state.json
 Human Monitor (HMP)
 M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 S: Maintained
+F: monitor/monitor-internal.h
 F: monitor/misc.c
 F: monitor/hmp*
 F: hmp.h
@@ -2038,6 +2039,7 @@ F: tests/check-qom-proplist.c
 QMP
 M: Markus Armbruster <armbru@redhat.com>
 S: Supported
+F: monitor/monitor-internal.h
 F: monitor/qmp*
 F: monitor/misc.c
 F: docs/devel/*qmp-*
--=20
2.20.1


