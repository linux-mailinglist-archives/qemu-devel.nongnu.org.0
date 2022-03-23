Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A54E5648
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:23:56 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3m7-0002x7-2T
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:23:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Oo-0004ck-7Y
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Om-00054k-Ii
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyPooZ2OVJ6shN2EWvL9KJ20JuZP6eFdch7NTKThbso=;
 b=CIF7QykAgTsXxP8T26YRzRGwc8UhFS1ePiIqiPS06WG2NU9y0foEEvlJ+sIGmBKgHDIX3R
 su1Xj6cbpce8qwdR+mhg3nGZ+UNmG8+Ox2GFd/YsXg8ei57yBcQxHTq0Oc7wCP0OniBjCg
 2PaWSmyOEQ5DoYFhbGE4Smm8FGYNAhw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-krW7EJ5pMsOjcSG7Gpl-og-1; Wed, 23 Mar 2022 11:59:45 -0400
X-MC-Unique: krW7EJ5pMsOjcSG7Gpl-og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61DD33C01B97
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:59:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 585CDC26E80;
 Wed, 23 Mar 2022 15:59:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/32] error-report: replace deprecated g_get_current_time()
 with glib >= 2.62
Date: Wed, 23 Mar 2022 19:57:24 +0400
Message-Id: <20220323155743.1585078-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

According to GLib API:
g_get_current_time has been deprecated since version 2.62 and should not
be used in newly-written code. GTimeVal is not year-2038-safe. Use
g_get_real_time() instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/glib-compat.h | 10 ++++++++++
 util/qemu-error.c     | 17 ++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 3113a7d2af84..dc14d3ec0d1e 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -145,6 +145,16 @@ qemu_g_test_slow(void)
 #define g_test_thorough() qemu_g_test_slow()
 #define g_test_quick() (!qemu_g_test_slow())
 
+#if GLIB_CHECK_VERSION(2,62,0)
+static inline gchar *
+g_date_time_format_iso8601_compat(GDateTime *datetime)
+{
+    return g_date_time_format_iso8601(datetime);
+}
+
+#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
+#endif
+
 #pragma GCC diagnostic pop
 
 #endif
diff --git a/util/qemu-error.c b/util/qemu-error.c
index 7769aee8e791..4ea380dd4169 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -180,6 +180,19 @@ static void print_loc(void)
     }
 }
 
+static char *
+real_time_iso8601(void)
+{
+#if GLIB_CHECK_VERSION(2,62,0)
+    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    return g_date_time_format_iso8601(dt);
+#else
+    GTimeVal tv;
+    g_get_current_time(&tv);
+    return g_time_val_to_iso8601(&tv);
+#endif
+}
+
 /*
  * Print a message to current monitor if we have one, else to stderr.
  * @report_type is the type of message: error, warning or informational.
@@ -189,12 +202,10 @@ static void print_loc(void)
  */
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
-    GTimeVal tv;
     gchar *timestr;
 
     if (message_with_timestamp && !monitor_cur()) {
-        g_get_current_time(&tv);
-        timestr = g_time_val_to_iso8601(&tv);
+        timestr = real_time_iso8601();
         error_printf("%s ", timestr);
         g_free(timestr);
     }
-- 
2.35.1.273.ge6ebfd0e8cbb


