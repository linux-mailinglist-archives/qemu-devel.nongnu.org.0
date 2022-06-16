Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A554E190
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:13:23 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pJK-0005XR-VZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooT-0001Kq-M5
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1ooK-0005Yp-6h
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4voxXrKbyhL/lOz9FRDmaZJ++LuTFoliK+/VyoayUo=;
 b=TK3+8MqopHrh8z27Kcmg4LuXJwim5N/4aHN2+4+sMCMaNSkdB+Xzu79/Tz7KawieuA2dJV
 +909asxmflm5i1GMC9DpFynXvFUwDDZ3ZibueEOXojK1rdC5Eonck9Dl+bRRolgW2ApRIj
 fbZf09QJc7YxWukecY822FYLk237xX0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-Xn-lT_swMpOT305bRNzjOw-1; Thu, 16 Jun 2022 08:41:11 -0400
X-MC-Unique: Xn-lT_swMpOT305bRNzjOw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1F1D833976;
 Thu, 16 Jun 2022 12:41:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2235D492CA5;
 Thu, 16 Jun 2022 12:41:07 +0000 (UTC)
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
Subject: [PATCH 6/9] error-report: add a callback to overwrite error_vprintf
Date: Thu, 16 Jun 2022 16:40:31 +0400
Message-Id: <20220616124034.3381391-7-marcandre.lureau@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

error_vprintf() is implemented in monitor.c, which overrides the
default implementation from stubs/, while avoiding a direct dependency
to the monitor from error-report.c.

However, the stub solution isn't working when moving error-report.c and
stubs/error-printf.c in a common library. Linking with such library
creates conflicts for the error_vprintf() implementations (and weak
symbols aren't great either). Instead, use the "traditional" approach to
provide overidable callbacks.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/monitor/monitor.h            |  1 +
 include/qemu/error-report.h          |  6 ++++--
 bsd-user/main.c                      |  2 +-
 linux-user/main.c                    |  2 +-
 monitor/monitor.c                    |  2 +-
 qemu-img.c                           |  2 +-
 qemu-io.c                            |  2 +-
 qemu-nbd.c                           |  2 +-
 scsi/qemu-pr-helper.c                |  2 +-
 softmmu/vl.c                         |  2 +-
 storage-daemon/qemu-storage-daemon.c |  2 +-
 stubs/error-printf.c                 | 18 ------------------
 util/error-report.c                  | 27 ++++++++++++++++++++++++---
 stubs/meson.build                    |  1 -
 14 files changed, 38 insertions(+), 33 deletions(-)
 delete mode 100644 stubs/error-printf.c

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 44653e195b45..e94ab2e74889 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -16,6 +16,7 @@ extern QemuOptsList qemu_mon_opts;
 Monitor *monitor_cur(void);
 Monitor *monitor_set_cur(Coroutine *co, Monitor *mon);
 bool monitor_cur_is_qmp(void);
+int monitor_error_vprintf(const char *fmt, va_list ap);
 
 void monitor_init_globals(void);
 void monitor_init_globals_core(void);
diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index e2e630f207f0..a2bc030b4bfe 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -14,6 +14,7 @@
 #define QEMU_ERROR_REPORT_H
 
 typedef bool (*ErrorReportDetailedFunc)(void);
+typedef int (*ErrorReportVPrintfFunc)(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 
 typedef struct Location {
     /* all members are private to qemu-error.c */
@@ -32,7 +33,6 @@ void loc_set_none(void);
 void loc_set_cmdline(char **argv, int idx, int cnt);
 void loc_set_file(const char *fname, int lno);
 
-int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 void error_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
@@ -48,7 +48,9 @@ bool error_report_once_cond(bool *printed, const char *fmt, ...)
 bool warn_report_once_cond(bool *printed, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
-void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn);
+void error_init(const char *argv0,
+                ErrorReportDetailedFunc detailed_fn,
+                ErrorReportVPrintfFunc vprintf_fn);
 
 /*
  * Similar to error_report(), except it prints the message just once.
diff --git a/bsd-user/main.c b/bsd-user/main.c
index d5f8fca863d7..1cc1ba9b2e6e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -292,7 +292,7 @@ int main(int argc, char **argv)
 
     save_proc_pathname(argv[0]);
 
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);
diff --git a/linux-user/main.c b/linux-user/main.c
index 84f380bd366d..75f72099739d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -646,7 +646,7 @@ int main(int argc, char **argv, char **envp)
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index ba4c1716a48a..490e7babd895 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -263,7 +263,7 @@ int monitor_printf(Monitor *mon, const char *fmt, ...)
 /*
  * Print to current monitor if we have one, else to stderr.
  */
-int error_vprintf(const char *fmt, va_list ap)
+int monitor_error_vprintf(const char *fmt, va_list ap)
 {
     Monitor *cur_mon = monitor_cur();
 
diff --git a/qemu-img.c b/qemu-img.c
index 1f27a9fc70f6..00383f48f7bc 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5396,7 +5396,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
 
diff --git a/qemu-io.c b/qemu-io.c
index b5cdc7c922a7..09794cd781be 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -539,7 +539,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 6bc632c93611..112303674cfb 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -587,7 +587,7 @@ int main(int argc, char **argv)
 #endif
 
     socket_init();
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     qcrypto_init(&error_fatal);
 
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 8d80e58d4498..d265d11b6261 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -910,7 +910,7 @@ int main(int argc, char **argv)
 
     signal(SIGPIPE, SIG_IGN);
 
-    error_init(argv[0], NULL);
+    error_init(argv[0], NULL, NULL);
     module_call_init(MODULE_INIT_TRACE);
     module_call_init(MODULE_INIT_QOM);
     qemu_add_opts(&qemu_trace_opts);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3b46fc9c1fc5..ef54af0efd6f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2639,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_action_opts);
     module_call_init(MODULE_INIT_OPTS);
 
-    error_init(argv[0], error_is_detailed);
+    error_init(argv[0], error_is_detailed, monitor_error_vprintf);
     qemu_init_exec_dir(argv[0]);
 
     qemu_init_arch_modules();
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 7e4d5030a045..0e0893695628 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -379,7 +379,7 @@ int main(int argc, char *argv[])
     signal(SIGPIPE, SIG_IGN);
 #endif
 
-    error_init(argv[0], error_is_detailed);
+    error_init(argv[0], error_is_detailed, monitor_error_vprintf);
     qemu_init_exec_dir(argv[0]);
     os_setup_signal_handling();
 
diff --git a/stubs/error-printf.c b/stubs/error-printf.c
deleted file mode 100644
index 1afa0f62ca26..000000000000
--- a/stubs/error-printf.c
+++ /dev/null
@@ -1,18 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "monitor/monitor.h"
-
-int error_vprintf(const char *fmt, va_list ap)
-{
-    int ret;
-
-    if (g_test_initialized() && !g_test_subprocess() &&
-        getenv("QTEST_SILENT_ERRORS")) {
-        char *msg = g_strdup_vprintf(fmt, ap);
-        g_test_message("%s", msg);
-        ret = strlen(msg);
-        g_free(msg);
-        return ret;
-    }
-    return vfprintf(stderr, fmt, ap);
-}
diff --git a/util/error-report.c b/util/error-report.c
index c2181f80a83d..1452047cd2e8 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -23,11 +23,14 @@ typedef enum {
     REPORT_TYPE_INFO,
 } report_type;
 
+static int error_vprintf(const char *fmt, va_list ap);
+
 /* Prepend timestamp to messages */
 bool message_with_timestamp;
 bool error_with_guestname;
 const char *error_guest_name;
 ErrorReportDetailedFunc detailed_fn = NULL;
+ErrorReportVPrintfFunc vprintf_fn = error_vprintf;
 
 int error_printf(const char *fmt, ...)
 {
@@ -35,7 +38,7 @@ int error_printf(const char *fmt, ...)
     int ret;
 
     va_start(ap, fmt);
-    ret = error_vprintf(fmt, ap);
+    ret = vprintf_fn(fmt, ap);
     va_end(ap);
     return ret;
 }
@@ -222,7 +225,7 @@ static void vreport(report_type type, const char *fmt, va_list ap)
         break;
     }
 
-    error_vprintf(fmt, ap);
+    vprintf_fn(fmt, ap);
     error_printf("\n");
 }
 
@@ -387,7 +390,24 @@ static void qemu_log_func(const gchar *log_domain,
     }
 }
 
-void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
+static int error_vprintf(const char *fmt, va_list ap)
+{
+    int ret;
+
+    if (g_test_initialized() && !g_test_subprocess() &&
+        getenv("QTEST_SILENT_ERRORS")) {
+        char *msg = g_strdup_vprintf(fmt, ap);
+        g_test_message("%s", msg);
+        ret = strlen(msg);
+        g_free(msg);
+        return ret;
+    }
+    return vfprintf(stderr, fmt, ap);
+}
+
+void error_init(const char *argv0,
+                ErrorReportDetailedFunc detailed,
+                ErrorReportVPrintfFunc vprintf)
 {
     const char *p = strrchr(argv0, '/');
 
@@ -403,4 +423,5 @@ void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
     qemu_glog_domains = g_strdup(g_getenv("G_MESSAGES_DEBUG"));
 
     detailed_fn = detailed;
+    vprintf_fn = vprintf ?: error_vprintf;
 }
diff --git a/stubs/meson.build b/stubs/meson.build
index d8f3fd5c44f2..498b6ee0466e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -9,7 +9,6 @@ stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('icount.c'))
 stub_ss.add(files('dump.c'))
-stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
-- 
2.37.0.rc0


