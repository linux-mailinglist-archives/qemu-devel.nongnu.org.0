Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70034E3F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:05:45 +0100 (CET)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeCm-0005I8-RH
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:05:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdcJ-0006cR-CW
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdcG-0002nv-PF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xH5TpCCIOsOnE4pehm8hwGRXTZxgayQ3uYh1utjeFVQ=;
 b=KeZylPyGWCa5AlNO/P7ETZgWUkM3v70B2j7WulFpTTd1YVnKenONXCfq8crWpSejHFqzIf
 L7+0JlguQhgrXoRsaY3SDPyl6xPk3Hm7Ni/LEvkQebyjZq0Xpsqgqz0gcd69pKCdzRF/wm
 DHSvTDYNi6s5ckgGhYPgZNQ8t9i5tMQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-DlEeTNDQOCiYQqC1JXaDww-1; Tue, 22 Mar 2022 08:27:57 -0400
X-MC-Unique: DlEeTNDQOCiYQqC1JXaDww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A5F1C04B5F;
 Tue, 22 Mar 2022 12:27:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6CA40D2822;
 Tue, 22 Mar 2022 12:27:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] error: use GLib to remember the program name
Date: Tue, 22 Mar 2022 16:25:58 +0400
Message-Id: <20220322122601.927238-19-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/error-report.h          |  2 --
 qemu-io.c                            | 10 +++++-----
 softmmu/vl.c                         |  2 +-
 storage-daemon/qemu-storage-daemon.c |  2 +-
 trace/control.c                      |  2 +-
 util/qemu-error.c                    | 24 +++++-------------------
 6 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 33e662db44c6..b6f45e69d79a 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -72,8 +72,6 @@ void error_init(const char *argv0);
                               fmt, ##__VA_ARGS__);      \
     })
 
-const char *error_get_progname(void);
-
 extern bool message_with_timestamp;
 extern bool error_with_guestname;
 extern const char *error_guest_name;
diff --git a/qemu-io.c b/qemu-io.c
index e45a15c41aac..eb8afc8b413b 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -323,7 +323,7 @@ static char *get_prompt(void)
     static char prompt[FILENAME_MAX + 2 /*"> "*/ + 1 /*"\0"*/ ];
 
     if (!prompt[0]) {
-        snprintf(prompt, sizeof(prompt), "%s> ", error_get_progname());
+        snprintf(prompt, sizeof(prompt), "%s> ", g_get_prgname());
     }
 
     return prompt;
@@ -598,10 +598,10 @@ int main(int argc, char **argv)
             break;
         case 'V':
             printf("%s version " QEMU_FULL_VERSION "\n"
-                   QEMU_COPYRIGHT "\n", error_get_progname());
+                   QEMU_COPYRIGHT "\n", g_get_prgname());
             exit(0);
         case 'h':
-            usage(error_get_progname());
+            usage(g_get_prgname());
             exit(0);
         case 'U':
             force_share = true;
@@ -613,13 +613,13 @@ int main(int argc, char **argv)
             imageOpts = true;
             break;
         default:
-            usage(error_get_progname());
+            usage(g_get_prgname());
             exit(1);
         }
     }
 
     if ((argc - optind) > 1) {
-        usage(error_get_progname());
+        usage(g_get_prgname());
         exit(1);
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7e4d55bc1dcc..6f646531a0ae 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -836,7 +836,7 @@ static void help(int exitcode)
     version();
     printf("usage: %s [options] [disk_image]\n\n"
            "'disk_image' is a raw hard disk image for IDE hard disk 0\n\n",
-            error_get_progname());
+            g_get_prgname());
 
 #define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)    \
     if ((arch_mask) & arch_type)                               \
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index dd18b2cde8c4..eb724072579a 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -141,7 +141,7 @@ static void help(void)
 "  --pidfile <path>       write process ID to a file after startup\n"
 "\n"
 QEMU_HELP_BOTTOM "\n",
-    error_get_progname());
+    g_get_prgname());
 }
 
 enum {
diff --git a/trace/control.c b/trace/control.c
index d5b68e846eeb..6c77cc631800 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -161,7 +161,7 @@ void trace_list_events(FILE *f)
     fprintf(f, "This list of names of trace points may be incomplete "
                "when using the DTrace/SystemTap backends.\n"
                "Run 'qemu-trace-stap list %s' to print the full list.\n",
-            error_get_progname());
+            g_get_prgname());
 #endif
 }
 
diff --git a/util/qemu-error.c b/util/qemu-error.c
index 52a9e013c490..7769aee8e791 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -146,22 +146,6 @@ void loc_set_file(const char *fname, int lno)
     }
 }
 
-static const char *progname;
-
-/*
- * Set the program name for error_print_loc().
- */
-static void error_set_progname(const char *argv0)
-{
-    const char *p = strrchr(argv0, '/');
-    progname = p ? p + 1 : argv0;
-}
-
-const char *error_get_progname(void)
-{
-    return progname;
-}
-
 /*
  * Print current location to current monitor if we have one, else to stderr.
  */
@@ -171,8 +155,8 @@ static void print_loc(void)
     int i;
     const char *const *argp;
 
-    if (!monitor_cur() && progname) {
-        fprintf(stderr, "%s:", progname);
+    if (!monitor_cur() && g_get_prgname()) {
+        fprintf(stderr, "%s:", g_get_prgname());
         sep = " ";
     }
     switch (cur_loc->kind) {
@@ -400,8 +384,10 @@ static void qemu_log_func(const gchar *log_domain,
 
 void error_init(const char *argv0)
 {
+    const char *p = strrchr(argv0, '/');
+
     /* Set the program name for error_print_loc(). */
-    error_set_progname(argv0);
+    g_set_prgname(p ? p + 1 : argv0);
 
     /*
      * This sets up glib logging so libraries using it also print their logs
-- 
2.35.1.273.ge6ebfd0e8cbb


