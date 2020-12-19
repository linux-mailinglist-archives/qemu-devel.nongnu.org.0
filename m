Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1362DEE6A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:08:00 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa5f-0003my-U6
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZts-0004rj-Nb
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtk-0007GL-IE
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqszXK3OLbu9tC4hbDtYV25ppD/DArFagYR6z5JaLtg=;
 b=AkXYj153ceIkVT8cEbpTXe4KEHbo7L2bJpkxYgKX6JGW39XJRh3VTMOUpEIjSBUzh1ejhj
 pPkFTKpR3gexrTDJ57Q59DAXOufAGaCzDV1U0TmX/MzRMfSBXa7lOj1My59ai4jreeXxuD
 UOhsWcfcPjgxZ7fofDVnPTtHSDjUEsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-2J0NSGNlPUmxJG2lDJH4bA-1; Sat, 19 Dec 2020 05:55:37 -0500
X-MC-Unique: 2J0NSGNlPUmxJG2lDJH4bA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDCF8800D53;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE83F5D9C2;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C8D81126895; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] monitor: Use GString instead of QString for output buffer
Date: Sat, 19 Dec 2020 11:55:14 +0100
Message-Id: <20201219105532.1734134-16-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GString has a richer set of string operations than QString.  It should
be preferred to QString except where we need a QObject or reference
counting.  We don't here.  Switch to GString, and put its richer
interface to use.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-3-armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/monitor-internal.h |  2 +-
 monitor/misc.c             |  2 +-
 monitor/monitor.c          | 20 ++++++++------------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index a6131554da..40903d6386 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -105,7 +105,7 @@ struct Monitor {
      * Members that are protected by the per-monitor lock
      */
     QLIST_HEAD(, mon_fd_t) fds;
-    QString *outbuf;
+    GString *outbuf;
     guint out_watch;
     /* Read under either BQL or mon_lock, written with BQL+mon_lock.  */
     int mux_out;
diff --git a/monitor/misc.c b/monitor/misc.c
index 33d0dae2e8..10444b4e7a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -136,7 +136,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
     handle_hmp_command(&hmp, command_line);
 
     WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
-        output = g_strdup(qstring_get_str(hmp.common.outbuf));
+        output = g_strdup(hmp.common.outbuf->str);
     }
 
 out:
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 84222cd130..1e4a6b3f20 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -29,7 +29,6 @@
 #include "qapi/qapi-emit-events.h"
 #include "qapi/qapi-visit-control.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qstring.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "sysemu/qtest.h"
@@ -181,22 +180,19 @@ static void monitor_flush_locked(Monitor *mon)
         return;
     }
 
-    buf = qstring_get_str(mon->outbuf);
-    len = qstring_get_length(mon->outbuf);
+    buf = mon->outbuf->str;
+    len = mon->outbuf->len;
 
     if (len && !mon->mux_out) {
         rc = qemu_chr_fe_write(&mon->chr, (const uint8_t *) buf, len);
         if ((rc < 0 && errno != EAGAIN) || (rc == len)) {
             /* all flushed or error */
-            qobject_unref(mon->outbuf);
-            mon->outbuf = qstring_new();
+            g_string_truncate(mon->outbuf, 0);
             return;
         }
         if (rc > 0) {
             /* partial write */
-            QString *tmp = qstring_from_str(buf + rc);
-            qobject_unref(mon->outbuf);
-            mon->outbuf = tmp;
+            g_string_erase(mon->outbuf, 0, rc);
         }
         if (mon->out_watch == 0) {
             mon->out_watch =
@@ -223,9 +219,9 @@ int monitor_puts(Monitor *mon, const char *str)
     for (i = 0; str[i]; i++) {
         c = str[i];
         if (c == '\n') {
-            qstring_append_chr(mon->outbuf, '\r');
+            g_string_append_c(mon->outbuf, '\r');
         }
-        qstring_append_chr(mon->outbuf, c);
+        g_string_append_c(mon->outbuf, c);
         if (c == '\n') {
             monitor_flush_locked(mon);
         }
@@ -602,7 +598,7 @@ void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
     }
     qemu_mutex_init(&mon->mon_lock);
     mon->is_qmp = is_qmp;
-    mon->outbuf = qstring_new();
+    mon->outbuf = g_string_new(NULL);
     mon->skip_flush = skip_flush;
     mon->use_io_thread = use_io_thread;
 }
@@ -616,7 +612,7 @@ void monitor_data_destroy(Monitor *mon)
     } else {
         readline_free(container_of(mon, MonitorHMP, common)->rs);
     }
-    qobject_unref(mon->outbuf);
+    g_string_free(mon->outbuf, true);
     qemu_mutex_destroy(&mon->mon_lock);
 }
 
-- 
2.26.2


