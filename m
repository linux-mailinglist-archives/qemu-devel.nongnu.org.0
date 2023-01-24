Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE6797FB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIJp-00041e-Sd; Tue, 24 Jan 2023 07:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHW-00021G-B9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHM-0006RL-33
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IrD0JNMa6EgZRJfoLAnNinrZH+R/R11fkdtoGYsJmY=;
 b=URDC3ovIuuBzy2s+02pzLlAAr/WpUy2Pf//CT8K5vrWlu7AzsvUXTJbb+wk+AitmBhE0D8
 5ZioCnmbiRYUSCI4yB8SLJC0hmcrJb2lHBfg7TyQ1gveaTsJ/jUUp1BWxrslCaU6/frsQP
 cz9NQzOWL+awk/bR562tqEn2g8ecPyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-EVQ9P68yOSG-B5WpFJi8jg-1; Tue, 24 Jan 2023 07:19:51 -0500
X-MC-Unique: EVQ9P68yOSG-B5WpFJi8jg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1A0080D182;
 Tue, 24 Jan 2023 12:19:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1250492C18;
 Tue, 24 Jan 2023 12:19:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D285321E6936; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 27/32] monitor: Move monitor_putc() next to monitor_puts &
 external linkage
Date: Tue, 24 Jan 2023 13:19:41 +0100
Message-Id: <20230124121946.1139465-28-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


