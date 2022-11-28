Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC063B3C1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozlD2-0000bb-5I; Mon, 28 Nov 2022 15:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozjG3-0003fO-DW
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:53:35 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozjG1-0003Tp-Oo
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:53:35 -0500
Received: from [192.168.16.189] (helo=roughy.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.drobyshev@virtuozzo.com>) id 1ozjFo-00D7Sg-1T;
 Mon, 28 Nov 2022 19:53:20 +0100
To: qemu-devel@nongnu.org
Cc: andrey.drobyshev@virtuozzo.com,
	den@virtuozzo.com,
	yur@openvz.org
Subject: [PATCH 2/2] qga: map GLib log levels to system levels
Date: Mon, 28 Nov 2022 20:54:03 +0200
Message-Id: <20221128185403.447817-3-andrey.drobyshev@virtuozzo.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
References: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.drobyshev@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Nov 2022 15:58:31 -0500
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
Reply-to:  Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
From:  Andrey Drobyshev via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch translates GLib-specific log levels to system ones, so that
they may be used by both *nix syslog() (as a "priority" argument) and
Windows ReportEvent() (as a "wType" argument).

Currently the only codepath to write to "syslog" domain is slog()
function.  However, this patch allows the interface to be extended.

Note that since slog() is using G_LOG_LEVEL_INFO level, its behaviour
doesn't change.

Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
---
 qga/main.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 10314dfe5d..0467d5daf8 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -314,6 +314,38 @@ void ga_enable_logging(GAState *s)
     s->logging_enabled = true;
 }
 
+static int glib_log_level_to_system(int level)
+{
+    switch (level) {
+#ifndef _WIN32
+        case G_LOG_LEVEL_ERROR:
+            return LOG_ERR;
+        case G_LOG_LEVEL_CRITICAL:
+            return LOG_CRIT;
+        case G_LOG_LEVEL_WARNING:
+            return LOG_WARNING;
+        case G_LOG_LEVEL_MESSAGE:
+            return LOG_NOTICE;
+        case G_LOG_LEVEL_DEBUG:
+            return LOG_DEBUG;
+        case G_LOG_LEVEL_INFO:
+        default:
+            return LOG_INFO;
+#else
+        case G_LOG_LEVEL_ERROR:
+        case G_LOG_LEVEL_CRITICAL:
+            return EVENTLOG_ERROR_TYPE;
+        case G_LOG_LEVEL_WARNING:
+            return EVENTLOG_WARNING_TYPE;
+        case G_LOG_LEVEL_MESSAGE:
+        case G_LOG_LEVEL_INFO:
+        case G_LOG_LEVEL_DEBUG:
+        default:
+            return EVENTLOG_INFORMATION_TYPE;
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
2.38.1


