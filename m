Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4C54E1B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:16:58 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pMn-0002Ay-GC
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooW-0001R0-By
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooM-0005Vw-Hp
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJXySoeq0t7JZM5RA/pyaMohMd2V1GfWM/4dE5+QpiU=;
 b=LmBqBOtXLfTkxsSJevkFoxCVDacIaRYYvLHKoyl/9dPP6q0RxWayY78MaTKdGYpbgLALQc
 0VxfxvoNsrSmZXJ93UFswSVt5J5RpAnc2ucV/zOJ5gOG6K4MDP9EVvvN65fsrTM3cfq48h
 +pZX8YfVZAcgPR2VoHfGfC9rSu/8oUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440--GFDmYZlPrivwdr_DbXIcg-1; Thu, 16 Jun 2022 08:41:04 -0400
X-MC-Unique: -GFDmYZlPrivwdr_DbXIcg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3CCC29DD98A;
 Thu, 16 Jun 2022 12:41:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86B17492CA8;
 Thu, 16 Jun 2022 12:41:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 5/9] error-report: introduce ErrorReportDetailedFunc
Date: Thu, 16 Jun 2022 16:40:30 +0400
Message-Id: <20220616124034.3381391-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Remove monitor dependency from error printing code, by allowing programs
to set a callback for when to use "detailed" reporting or not.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/error-report.h          | 4 +++-
 bsd-user/main.c                      | 2 +-
 linux-user/main.c                    | 2 +-
 qemu-img.c                           | 2 +-
 qemu-io.c                            | 2 +-
 qemu-nbd.c                           | 2 +-
 scsi/qemu-pr-helper.c                | 2 +-
 softmmu/vl.c                         | 7 ++++++-
 storage-daemon/qemu-storage-daemon.c | 7 ++++++-
 util/error-report.c                  | 8 +++++---
 10 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 3ae2357fda54..e2e630f207f0 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_ERROR_REPORT_H
 #define QEMU_ERROR_REPORT_H
 
+typedef bool (*ErrorReportDetailedFunc)(void);
+
 typedef struct Location {
     /* all members are private to qemu-error.c */
     enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;
@@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const char *fmt, ...)
 bool warn_report_once_cond(bool *printed, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
-void error_init(const char *argv0);
+void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn);
 
 /*
  * Similar to error_report(), except it prints the message just once.
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d6541..d5f8fca863d7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -292,7 +292,7 @@ int main(int argc, char **argv)
 
     save_proc_pathname(argv[0]);
 
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);
diff --git a/linux-user/main.c b/linux-user/main.c
index 651e32f5f248..84f380bd366d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -646,7 +646,7 @@ int main(int argc, char **argv, char **envp)
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);
diff --git a/qemu-img.c b/qemu-img.c
index 4cf4d2423df8..1f27a9fc70f6 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5396,7 +5396,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
 
diff --git a/qemu-io.c b/qemu-io.c
index 2bd7bfb65073..b5cdc7c922a7 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -539,7 +539,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0cd5aa6f02bc..6bc632c93611 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -587,7 +587,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     qcrypto_init(&error_fatal);
 
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00df5..8d80e58d4498 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -910,7 +910,7 @@ int main(int argc, char **argv)
 
     signal(SIGPIPE, SIG_IGN);
 
-    error_init(argv[0]);
+    error_init(argv[0], NULL);
     module_call_init(MODULE_INIT_TRACE);
     module_call_init(MODULE_INIT_QOM);
     qemu_add_opts(&qemu_trace_opts);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920ada1a1..3b46fc9c1fc5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+static bool error_is_detailed(void)
+{
+    return !monitor_cur();
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -2634,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_action_opts);
     module_call_init(MODULE_INIT_OPTS);
 
-    error_init(argv[0]);
+    error_init(argv[0], error_is_detailed);
     qemu_init_exec_dir(argv[0]);
 
     qemu_init_arch_modules();
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index c104817cdddc..7e4d5030a045 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -368,13 +368,18 @@ static void pid_file_init(void)
     atexit(pid_file_cleanup);
 }
 
+static bool error_is_detailed(void)
+{
+    return !monitor_cur();
+}
+
 int main(int argc, char *argv[])
 {
 #ifdef CONFIG_POSIX
     signal(SIGPIPE, SIG_IGN);
 #endif
 
-    error_init(argv[0]);
+    error_init(argv[0], error_is_detailed);
     qemu_init_exec_dir(argv[0]);
     os_setup_signal_handling();
 
diff --git a/util/error-report.c b/util/error-report.c
index c43227a975e2..c2181f80a83d 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "monitor/monitor.h"
 #include "qemu/error-report.h"
 
 /*
@@ -28,6 +27,7 @@ typedef enum {
 bool message_with_timestamp;
 bool error_with_guestname;
 const char *error_guest_name;
+ErrorReportDetailedFunc detailed_fn = NULL;
 
 int error_printf(const char *fmt, ...)
 {
@@ -195,7 +195,7 @@ real_time_iso8601(void)
  */
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
-    bool detailed = !monitor_cur();
+    bool detailed = detailed_fn ? detailed_fn() : TRUE;
     gchar *timestr;
 
     if (message_with_timestamp && detailed) {
@@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,
     }
 }
 
-void error_init(const char *argv0)
+void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
 {
     const char *p = strrchr(argv0, '/');
 
@@ -401,4 +401,6 @@ void error_init(const char *argv0)
     g_log_set_default_handler(qemu_log_func, NULL);
     g_warn_if_fail(qemu_glog_domains == NULL);
     qemu_glog_domains = g_strdup(g_getenv("G_MESSAGES_DEBUG"));
+
+    detailed_fn = detailed;
 }
-- 
2.37.0.rc0


