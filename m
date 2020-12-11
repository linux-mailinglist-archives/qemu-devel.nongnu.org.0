Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17412D7D80
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:59:45 +0100 (CET)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmhk-0005z8-SY
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0007LP-OS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxW-0003Pd-Rc
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwyMReqGCDNOFBxtHwsRcSfqU+0MsweNoaL7hdFiK+0=;
 b=I3wSIn/yxmj1s0Mlye6cYR9vSJJdxnDF3vSCwOu83Xkk+Ex0xrsAkvd9Q6viZj5ITOlxQN
 lc9SwcuSQyogx8rpEtSaK1/g1ifByaDGH68FpXIK2UKKY1CNCfz+EFbF7vM5HKf/gE5niM
 a0lmPdoHSmPlzwh1K2mMHyYQCJEEcNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-x-il4T9ZNx6Jav5_Z0z4Tg-1; Fri, 11 Dec 2020 12:11:55 -0500
X-MC-Unique: x-il4T9ZNx6Jav5_Z0z4Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8CB1842144;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDDB1972B;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A37661141A60; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/20] monitor: Use GString instead of QString for output
 buffer
Date: Fri, 11 Dec 2020 18:11:34 +0100
Message-Id: <20201211171152.146877-3-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: mdroth@linux.vnet.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GString has a richer set of string operations than QString.  It should
be preferred to QString except where we need a QObject or reference
counting.  We don't here.  Switch to GString, and put its richer
interface to use.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 6c3e8506a9..814d22de11 100644
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


