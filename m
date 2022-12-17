Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEED64F865
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 10:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6TAl-0005ts-7E; Sat, 17 Dec 2022 04:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAh-0005sC-RM
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAg-0006d9-D3
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671268073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+jI9Ae1kOlyAm872IZ+HvpAvtNVj7WGf3+Zm313HZ4=;
 b=fr64IUmGvln6HOeUx3ZsZGHfZwUxXvUdFQBiBI+CynZaTRY/Ix6PXMxx7jbOe32Y5Q2gsv
 1owoK8MBYTnywz/ov7jVq7b0YwzhhqNAZxpXudZxUod7GYMfqNdnNHNSrMlFNUfHg4IxoH
 mRnrnXUMlR0jsezhQ3TnT4nqGBFqsLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-krBcsFUXOz2RAspbvwD8Mw-1; Sat, 17 Dec 2022 04:07:52 -0500
X-MC-Unique: krBcsFUXOz2RAspbvwD8Mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1A46811E6E;
 Sat, 17 Dec 2022 09:07:51 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-192-10.brq.redhat.com [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5BE140C6EC4;
 Sat, 17 Dec 2022 09:07:50 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 5/6] qga: map GLib log levels to system levels
Date: Sat, 17 Dec 2022 11:07:39 +0200
Message-Id: <20221217090740.522093-6-kkostiuk@redhat.com>
In-Reply-To: <20221217090740.522093-1-kkostiuk@redhat.com>
References: <20221217090740.522093-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

From: Andrey Drobyshev via <qemu-devel@nongnu.org>

This patch translates GLib-specific log levels to system ones, so that
they may be used by both *nix syslog() (as a "priority" argument) and
Windows ReportEvent() (as a "wType" argument).

Currently the only codepath to write to "syslog" domain is slog()
function.  However, this patch allows the interface to be extended.

Note that since slog() is using G_LOG_LEVEL_INFO level, its behaviour
doesn't change.

Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/main.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 1463a1c170..85b7d6ced5 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -314,6 +314,38 @@ void ga_enable_logging(GAState *s)
     s->logging_enabled = true;
 }
 
+static int glib_log_level_to_system(int level)
+{
+    switch (level) {
+#ifndef _WIN32
+    case G_LOG_LEVEL_ERROR:
+        return LOG_ERR;
+    case G_LOG_LEVEL_CRITICAL:
+        return LOG_CRIT;
+    case G_LOG_LEVEL_WARNING:
+        return LOG_WARNING;
+    case G_LOG_LEVEL_MESSAGE:
+        return LOG_NOTICE;
+    case G_LOG_LEVEL_DEBUG:
+        return LOG_DEBUG;
+    case G_LOG_LEVEL_INFO:
+    default:
+        return LOG_INFO;
+#else
+    case G_LOG_LEVEL_ERROR:
+    case G_LOG_LEVEL_CRITICAL:
+        return EVENTLOG_ERROR_TYPE;
+    case G_LOG_LEVEL_WARNING:
+        return EVENTLOG_WARNING_TYPE;
+    case G_LOG_LEVEL_MESSAGE:
+    case G_LOG_LEVEL_INFO:
+    case G_LOG_LEVEL_DEBUG:
+    default:
+        return EVENTLOG_INFORMATION_TYPE;
+#endif
+    }
+}
+
 static void ga_log(const gchar *domain, GLogLevelFlags level,
                    const gchar *msg, gpointer opaque)
 {
@@ -327,9 +359,9 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
     level &= G_LOG_LEVEL_MASK;
     if (g_strcmp0(domain, "syslog") == 0) {
 #ifndef _WIN32
-        syslog(LOG_INFO, "%s: %s", level_str, msg);
+        syslog(glib_log_level_to_system(level), "%s: %s", level_str, msg);
 #else
-        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
+        ReportEvent(s->event_log, glib_log_level_to_system(level),
                     0, 1, NULL, 1, 0, &msg, NULL);
 #endif
     } else if (level & s->log_level) {
-- 
2.25.1


