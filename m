Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F3508A6A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:13 +0200 (CEST)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhB4y-0006bj-TL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPO-0002Nb-6l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPM-0005Ch-7t
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jC54k3/vFF7vX/k4Ya5XOHve64qa+PsrdtngMeKJiU=;
 b=gxLoWPwAPAFGyfxXsWdJkUd3hnpydsrEDJPtEziAQlcqT11LF/s8bnIQnIJKAR/AaVrw7S
 SsoPZEvtKonOLtFMy0LbWv/W4HIQFk8PeQ7j2S8tpR6FZ2eVKZk/T0YvVPEuAQx1HTSmmX
 9xiLOn3BdmDpRCEJXyqJTgB0j4r20JU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-C6cQSGPsMumBVG5rZpFS2g-1; Wed, 20 Apr 2022 09:30:10 -0400
X-MC-Unique: C6cQSGPsMumBVG5rZpFS2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273DA1801394
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:30:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A13C7774;
 Wed, 20 Apr 2022 13:29:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 30/41] Move error_printf_unless_qmp() with monitor unit
Date: Wed, 20 Apr 2022 17:26:13 +0400
Message-Id: <20220420132624.2439741-31-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since it depends on monitor code, and error_vprintf_unless_qmp() is
already there.

This will help to move error-report in a common subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/monitor/monitor.h   |  3 +++
 include/qemu/error-report.h |  2 --
 monitor/monitor.c           | 10 ++++++++++
 stubs/error-printf.c        |  1 +
 ui/vnc.c                    |  1 +
 util/error-report.c         | 11 -----------
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index cc4cc6c6adcf..a4b40e8391db 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -56,4 +56,7 @@ void monitor_register_hmp(const char *name, bool info,
 void monitor_register_hmp_info_hrt(const char *name,
                                    HumanReadableText *(*handler)(Error **errp));
 
+int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
+
 #endif /* MONITOR_H */
diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index b6f45e69d79a..3ae2357fda54 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -32,8 +32,6 @@ void loc_set_file(const char *fname, int lno);
 
 int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
-int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
-int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 void error_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 void warn_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 21c7a68758f5..86949024f643 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -286,6 +286,16 @@ int error_vprintf_unless_qmp(const char *fmt, va_list ap)
     return -1;
 }
 
+int error_printf_unless_qmp(const char *fmt, ...)
+{
+    va_list ap;
+    int ret;
+
+    va_start(ap, fmt);
+    ret = error_vprintf_unless_qmp(fmt, ap);
+    va_end(ap);
+    return ret;
+}
 
 static MonitorQAPIEventConf monitor_qapi_event_conf[QAPI_EVENT__MAX] = {
     /* Limit guest-triggerable events to 1 per second */
diff --git a/stubs/error-printf.c b/stubs/error-printf.c
index a2f61521a16f..0e326d801059 100644
--- a/stubs/error-printf.c
+++ b/stubs/error-printf.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "monitor/monitor.h"
 
 int error_vprintf(const char *fmt, va_list ap)
 {
diff --git a/ui/vnc.c b/ui/vnc.c
index 6261d922953b..badf1d7664fe 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -54,6 +54,7 @@
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
 #include "io/dns-resolver.h"
+#include "monitor/monitor.h"
 
 #define VNC_REFRESH_INTERVAL_BASE GUI_REFRESH_INTERVAL_DEFAULT
 #define VNC_REFRESH_INTERVAL_INC  50
diff --git a/util/error-report.c b/util/error-report.c
index 4ec7b30bcbcc..dbadaf206d27 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -40,17 +40,6 @@ int error_printf(const char *fmt, ...)
     return ret;
 }
 
-int error_printf_unless_qmp(const char *fmt, ...)
-{
-    va_list ap;
-    int ret;
-
-    va_start(ap, fmt);
-    ret = error_vprintf_unless_qmp(fmt, ap);
-    va_end(ap);
-    return ret;
-}
-
 static Location std_loc = {
     .kind = LOC_NONE
 };
-- 
2.35.1.693.g805e0a68082a


