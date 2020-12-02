Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4672CB7D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:55:46 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNvN-0007Yo-KN
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDF-0003e4-LU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCU-0003nZ-Ry
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK9iVoiS8WjyOuMipiRTfDJkbHjhjcDAO3gSbk3KjGE=;
 b=OjgUHNag1Ni7jYG+mLD5EjHZLoHcBliiXcQ5iOOjESTnkSqUYipvO+MjiSctHip890/ccb
 fGxOKfb1+6S1SqdOsTmhXwProqVJRsjGqeMvrJ5lT/invJ2Ws3VsOUmRIaKkvUNyXGvmSL
 oQFrTZ3O19B3uyf+L9IGQtOiGFl+KII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-1rKOpgdjMTOKYzgTGmStwA-1; Wed, 02 Dec 2020 03:09:20 -0500
X-MC-Unique: 1rKOpgdjMTOKYzgTGmStwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC63185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE33A5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 078/113] vl: extract softmmu/rtc.c
Date: Wed,  2 Dec 2020 03:08:14 -0500
Message-Id: <20201202080849.4125477-79-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/sysemu.h |   2 +
 softmmu/meson.build     |   1 +
 softmmu/rtc.c           | 190 ++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c            | 156 ---------------------------------
 4 files changed, 193 insertions(+), 156 deletions(-)
 create mode 100644 softmmu/rtc.c

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 1b62deaf2b..18cf586cd0 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -22,6 +22,8 @@ void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
+void configure_rtc(QemuOpts *opts);
+
 extern int autostart;
 
 typedef enum {
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 7b52339e7a..d098d89653 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -6,6 +6,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'datadir.c',
   'physmem.c',
   'ioport.c',
+  'rtc.c',
   'memory.c',
   'memory_mapping.c',
   'qtest.c',
diff --git a/softmmu/rtc.c b/softmmu/rtc.c
new file mode 100644
index 0000000000..e1e15ef613
--- /dev/null
+++ b/softmmu/rtc.c
@@ -0,0 +1,190 @@
+/*
+ * RTC configuration and clock read
+ *
+ * Copyright (c) 2003-2020 QEMU contributors
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qemu/timer.h"
+#include "qom/object.h"
+#include "sysemu/replay.h"
+#include "sysemu/sysemu.h"
+
+static enum {
+    RTC_BASE_UTC,
+    RTC_BASE_LOCALTIME,
+    RTC_BASE_DATETIME,
+} rtc_base_type = RTC_BASE_UTC;
+static time_t rtc_ref_start_datetime;
+static int rtc_realtime_clock_offset; /* used only with QEMU_CLOCK_REALTIME */
+static int rtc_host_datetime_offset = -1; /* valid & used only with
+                                             RTC_BASE_DATETIME */
+QEMUClockType rtc_clock;
+/***********************************************************/
+/* RTC reference time/date access */
+static time_t qemu_ref_timedate(QEMUClockType clock)
+{
+    time_t value = qemu_clock_get_ms(clock) / 1000;
+    switch (clock) {
+    case QEMU_CLOCK_REALTIME:
+        value -= rtc_realtime_clock_offset;
+        /* fall through */
+    case QEMU_CLOCK_VIRTUAL:
+        value += rtc_ref_start_datetime;
+        break;
+    case QEMU_CLOCK_HOST:
+        if (rtc_base_type == RTC_BASE_DATETIME) {
+            value -= rtc_host_datetime_offset;
+        }
+        break;
+    default:
+        assert(0);
+    }
+    return value;
+}
+
+void qemu_get_timedate(struct tm *tm, int offset)
+{
+    time_t ti = qemu_ref_timedate(rtc_clock);
+
+    ti += offset;
+
+    switch (rtc_base_type) {
+    case RTC_BASE_DATETIME:
+    case RTC_BASE_UTC:
+        gmtime_r(&ti, tm);
+        break;
+    case RTC_BASE_LOCALTIME:
+        localtime_r(&ti, tm);
+        break;
+    }
+}
+
+int qemu_timedate_diff(struct tm *tm)
+{
+    time_t seconds;
+
+    switch (rtc_base_type) {
+    case RTC_BASE_DATETIME:
+    case RTC_BASE_UTC:
+        seconds = mktimegm(tm);
+        break;
+    case RTC_BASE_LOCALTIME:
+    {
+        struct tm tmp = *tm;
+        tmp.tm_isdst = -1; /* use timezone to figure it out */
+        seconds = mktime(&tmp);
+        break;
+    }
+    default:
+        abort();
+    }
+
+    return seconds - qemu_ref_timedate(QEMU_CLOCK_HOST);
+}
+
+static void configure_rtc_base_datetime(const char *startdate)
+{
+    time_t rtc_start_datetime;
+    struct tm tm;
+
+    if (sscanf(startdate, "%d-%d-%dT%d:%d:%d", &tm.tm_year, &tm.tm_mon,
+               &tm.tm_mday, &tm.tm_hour, &tm.tm_min, &tm.tm_sec) == 6) {
+        /* OK */
+    } else if (sscanf(startdate, "%d-%d-%d",
+                      &tm.tm_year, &tm.tm_mon, &tm.tm_mday) == 3) {
+        tm.tm_hour = 0;
+        tm.tm_min = 0;
+        tm.tm_sec = 0;
+    } else {
+        goto date_fail;
+    }
+    tm.tm_year -= 1900;
+    tm.tm_mon--;
+    rtc_start_datetime = mktimegm(&tm);
+    if (rtc_start_datetime == -1) {
+    date_fail:
+        error_report("invalid datetime format");
+        error_printf("valid formats: "
+                     "'2006-06-17T16:01:21' or '2006-06-17'\n");
+        exit(1);
+    }
+    rtc_host_datetime_offset = rtc_ref_start_datetime - rtc_start_datetime;
+    rtc_ref_start_datetime = rtc_start_datetime;
+}
+
+void configure_rtc(QemuOpts *opts)
+{
+    const char *value;
+
+    /* Set defaults */
+    rtc_clock = QEMU_CLOCK_HOST;
+    rtc_ref_start_datetime = qemu_clock_get_ms(QEMU_CLOCK_HOST) / 1000;
+    rtc_realtime_clock_offset = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
+
+    value = qemu_opt_get(opts, "base");
+    if (value) {
+        if (!strcmp(value, "utc")) {
+            rtc_base_type = RTC_BASE_UTC;
+        } else if (!strcmp(value, "localtime")) {
+            Error *blocker = NULL;
+            rtc_base_type = RTC_BASE_LOCALTIME;
+            error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
+                      "-rtc base=localtime");
+            replay_add_blocker(blocker);
+        } else {
+            rtc_base_type = RTC_BASE_DATETIME;
+            configure_rtc_base_datetime(value);
+        }
+    }
+    value = qemu_opt_get(opts, "clock");
+    if (value) {
+        if (!strcmp(value, "host")) {
+            rtc_clock = QEMU_CLOCK_HOST;
+        } else if (!strcmp(value, "rt")) {
+            rtc_clock = QEMU_CLOCK_REALTIME;
+        } else if (!strcmp(value, "vm")) {
+            rtc_clock = QEMU_CLOCK_VIRTUAL;
+        } else {
+            error_report("invalid option value '%s'", value);
+            exit(1);
+        }
+    }
+    value = qemu_opt_get(opts, "driftfix");
+    if (value) {
+        if (!strcmp(value, "slew")) {
+            object_register_sugar_prop("mc146818rtc",
+                                       "lost_tick_policy",
+                                       "slew");
+        } else if (!strcmp(value, "none")) {
+            /* discard is default */
+        } else {
+            error_report("invalid option value '%s'", value);
+            exit(1);
+        }
+    }
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 852ecf08e1..4c95537af3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -152,16 +152,6 @@ bool enable_cpu_pm = false;
 int nb_nics;
 NICInfo nd_table[MAX_NICS];
 int autostart = 1;
-static enum {
-    RTC_BASE_UTC,
-    RTC_BASE_LOCALTIME,
-    RTC_BASE_DATETIME,
-} rtc_base_type = RTC_BASE_UTC;
-static time_t rtc_ref_start_datetime;
-static int rtc_realtime_clock_offset; /* used only with QEMU_CLOCK_REALTIME */
-static int rtc_host_datetime_offset = -1; /* valid & used only with
-                                             RTC_BASE_DATETIME */
-QEMUClockType rtc_clock;
 int vga_interface_type = VGA_NONE;
 static const char *vga_model = NULL;
 static DisplayOptions dpy;
@@ -772,152 +762,6 @@ void qemu_system_vmstop_request(RunState state)
     qemu_mutex_unlock(&vmstop_lock);
     qemu_notify_event();
 }
-
-/***********************************************************/
-/* RTC reference time/date access */
-static time_t qemu_ref_timedate(QEMUClockType clock)
-{
-    time_t value = qemu_clock_get_ms(clock) / 1000;
-    switch (clock) {
-    case QEMU_CLOCK_REALTIME:
-        value -= rtc_realtime_clock_offset;
-        /* fall through */
-    case QEMU_CLOCK_VIRTUAL:
-        value += rtc_ref_start_datetime;
-        break;
-    case QEMU_CLOCK_HOST:
-        if (rtc_base_type == RTC_BASE_DATETIME) {
-            value -= rtc_host_datetime_offset;
-        }
-        break;
-    default:
-        assert(0);
-    }
-    return value;
-}
-
-void qemu_get_timedate(struct tm *tm, int offset)
-{
-    time_t ti = qemu_ref_timedate(rtc_clock);
-
-    ti += offset;
-
-    switch (rtc_base_type) {
-    case RTC_BASE_DATETIME:
-    case RTC_BASE_UTC:
-        gmtime_r(&ti, tm);
-        break;
-    case RTC_BASE_LOCALTIME:
-        localtime_r(&ti, tm);
-        break;
-    }
-}
-
-int qemu_timedate_diff(struct tm *tm)
-{
-    time_t seconds;
-
-    switch (rtc_base_type) {
-    case RTC_BASE_DATETIME:
-    case RTC_BASE_UTC:
-        seconds = mktimegm(tm);
-        break;
-    case RTC_BASE_LOCALTIME:
-    {
-        struct tm tmp = *tm;
-        tmp.tm_isdst = -1; /* use timezone to figure it out */
-        seconds = mktime(&tmp);
-        break;
-    }
-    default:
-        abort();
-    }
-
-    return seconds - qemu_ref_timedate(QEMU_CLOCK_HOST);
-}
-
-static void configure_rtc_base_datetime(const char *startdate)
-{
-    time_t rtc_start_datetime;
-    struct tm tm;
-
-    if (sscanf(startdate, "%d-%d-%dT%d:%d:%d", &tm.tm_year, &tm.tm_mon,
-               &tm.tm_mday, &tm.tm_hour, &tm.tm_min, &tm.tm_sec) == 6) {
-        /* OK */
-    } else if (sscanf(startdate, "%d-%d-%d",
-                      &tm.tm_year, &tm.tm_mon, &tm.tm_mday) == 3) {
-        tm.tm_hour = 0;
-        tm.tm_min = 0;
-        tm.tm_sec = 0;
-    } else {
-        goto date_fail;
-    }
-    tm.tm_year -= 1900;
-    tm.tm_mon--;
-    rtc_start_datetime = mktimegm(&tm);
-    if (rtc_start_datetime == -1) {
-    date_fail:
-        error_report("invalid datetime format");
-        error_printf("valid formats: "
-                     "'2006-06-17T16:01:21' or '2006-06-17'\n");
-        exit(1);
-    }
-    rtc_host_datetime_offset = rtc_ref_start_datetime - rtc_start_datetime;
-    rtc_ref_start_datetime = rtc_start_datetime;
-}
-
-static void configure_rtc(QemuOpts *opts)
-{
-    const char *value;
-
-    /* Set defaults */
-    rtc_clock = QEMU_CLOCK_HOST;
-    rtc_ref_start_datetime = qemu_clock_get_ms(QEMU_CLOCK_HOST) / 1000;
-    rtc_realtime_clock_offset = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-
-    value = qemu_opt_get(opts, "base");
-    if (value) {
-        if (!strcmp(value, "utc")) {
-            rtc_base_type = RTC_BASE_UTC;
-        } else if (!strcmp(value, "localtime")) {
-            Error *blocker = NULL;
-            rtc_base_type = RTC_BASE_LOCALTIME;
-            error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
-                      "-rtc base=localtime");
-            replay_add_blocker(blocker);
-        } else {
-            rtc_base_type = RTC_BASE_DATETIME;
-            configure_rtc_base_datetime(value);
-        }
-    }
-    value = qemu_opt_get(opts, "clock");
-    if (value) {
-        if (!strcmp(value, "host")) {
-            rtc_clock = QEMU_CLOCK_HOST;
-        } else if (!strcmp(value, "rt")) {
-            rtc_clock = QEMU_CLOCK_REALTIME;
-        } else if (!strcmp(value, "vm")) {
-            rtc_clock = QEMU_CLOCK_VIRTUAL;
-        } else {
-            error_report("invalid option value '%s'", value);
-            exit(1);
-        }
-    }
-    value = qemu_opt_get(opts, "driftfix");
-    if (value) {
-        if (!strcmp(value, "slew")) {
-            object_register_sugar_prop("mc146818rtc",
-                                       "lost_tick_policy",
-                                       "slew");
-        } else if (!strcmp(value, "none")) {
-            /* discard is default */
-        } else {
-            error_report("invalid option value '%s'", value);
-            exit(1);
-        }
-    }
-}
-
 static int parse_name(void *opaque, QemuOpts *opts, Error **errp)
 {
     const char *proc_name;
-- 
2.26.2



