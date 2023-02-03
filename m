Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D368929D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri3-0008RL-2y; Fri, 03 Feb 2023 03:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhn-0008Ih-Oo
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhk-0007Tg-QX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+btp5O6CYihvKBCgLNR1/22/e7uDZAPl4gDrCX5PPM=;
 b=BBB4FL/9wmfQRtUdXZmKhldTsY4+R3AQ4O2UzNfRad781zF2O/fGs8I9pwszz3UNuffpR4
 y8fzwIHlwFtel0t/MUC9czUwq8vGqRyLqOJiZMjDGSKlWwL4qbHBvu+MfsrY4Lkdnz6ztZ
 kcpelcfy3xKGHOHcBfLb4jjRN0euSvY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-7OlS4ne-MxuOCQqySUHv2w-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: 7OlS4ne-MxuOCQqySUHv2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C77FE811E9C;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A45C6C15BA0;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0235121E6883; Fri,  3 Feb 2023 09:45:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 30/35] monitor: Move monitor_putc() next to monitor_puts &
 external linkage
Date: Fri,  3 Feb 2023 09:45:44 +0100
Message-Id: <20230203084549.2622302-31-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

monitor_putc() will soon be used from more than one .c file.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-28-armbru@redhat.com>
---
 include/monitor/monitor.h |  1 +
 monitor/misc.c            | 27 ---------------------------
 monitor/monitor.c         | 27 +++++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1e6f4c9bd7..033390f699 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -35,6 +35,7 @@ int monitor_puts(Monitor *mon, const char *str);
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
     G_GNUC_PRINTF(2, 0);
 int monitor_printf(Monitor *mon, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+void monitor_printc(Monitor *mon, int ch);
 void monitor_flush(Monitor *mon);
 int monitor_set_cpu(Monitor *mon, int cpu_index);
 int monitor_get_cpu_index(Monitor *mon);
diff --git a/monitor/misc.c b/monitor/misc.c
index c531d95b5b..7a0ba35923 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -304,33 +304,6 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void monitor_printc(Monitor *mon, int c)
-{
-    monitor_printf(mon, "'");
-    switch(c) {
-    case '\'':
-        monitor_printf(mon, "\\'");
-        break;
-    case '\\':
-        monitor_printf(mon, "\\\\");
-        break;
-    case '\n':
-        monitor_printf(mon, "\\n");
-        break;
-    case '\r':
-        monitor_printf(mon, "\\r");
-        break;
-    default:
-        if (c >= 32 && c <= 126) {
-            monitor_printf(mon, "%c", c);
-        } else {
-            monitor_printf(mon, "\\x%02x", c);
-        }
-        break;
-    }
-    monitor_printf(mon, "'");
-}
-
 static void memory_dump(Monitor *mon, int count, int format, int wsize,
                         hwaddr addr, int is_physical)
 {
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 605fe41748..0a990633d8 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -259,6 +259,33 @@ int monitor_printf(Monitor *mon, const char *fmt, ...)
     return ret;
 }
 
+void monitor_printc(Monitor *mon, int c)
+{
+    monitor_printf(mon, "'");
+    switch(c) {
+    case '\'':
+        monitor_printf(mon, "\\'");
+        break;
+    case '\\':
+        monitor_printf(mon, "\\\\");
+        break;
+    case '\n':
+        monitor_printf(mon, "\\n");
+        break;
+    case '\r':
+        monitor_printf(mon, "\\r");
+        break;
+    default:
+        if (c >= 32 && c <= 126) {
+            monitor_printf(mon, "%c", c);
+        } else {
+            monitor_printf(mon, "\\x%02x", c);
+        }
+        break;
+    }
+    monitor_printf(mon, "'");
+}
+
 /*
  * Print to current monitor if we have one, else to stderr.
  */
-- 
2.39.0


