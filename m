Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A205C50A21A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:23:15 +0200 (CEST)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXiE-00078E-Of
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEf-00073I-Ks
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEd-0006SS-Ou
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frEuKCz7vFQixLAFoJkgnLoLchzJ4B4ZLPUS8uN7rfY=;
 b=Y0K9vTgG/skRqwtj+FJXbi21s9xf+NfPWU9TxapItvdTa41YR5e5cA2TSHQery7ljJFwPp
 CWuWnrS0UYV7SE7XdO55HFLjLjyFWQKOIqZwSrzB9C4ogSHodJY2+xB/c3aZo7Z7xE3cXX
 9s9JKQJC1FebM9IBb+4gR0KMvxgarQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-g1rjxgtoOOW4UuM1Xwwefg-1; Thu, 21 Apr 2022 09:52:36 -0400
X-MC-Unique: g1rjxgtoOOW4UuM1Xwwefg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77EFC1014A66;
 Thu, 21 Apr 2022 13:52:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489DE2024CB6;
 Thu, 21 Apr 2022 13:52:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] util: replace qemu_get_local_state_pathname()
Date: Thu, 21 Apr 2022 17:49:37 +0400
Message-Id: <20220421134940.2887768-28-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 "open list:Block SCSI subsystem" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, richard.henderson@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Simplify the function to only return the directory path. Callers are
adjusted to use the GLib function to build paths, g_build_filename().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-39-marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h          | 9 +++------
 qga/main.c                    | 8 ++++----
 scsi/qemu-pr-helper.c         | 6 ++++--
 tools/virtiofsd/fuse_virtio.c | 4 +++-
 util/oslib-posix.c            | 7 ++-----
 util/oslib-win32.c            | 5 ++---
 6 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 4bf2883a60b3..baaa23c1568d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -556,16 +556,13 @@ void qemu_set_cloexec(int fd);
 void fips_set_state(bool requested);
 bool fips_get_state(void);
 
-/* Return a dynamically allocated pathname denoting a file or directory that is
- * appropriate for storing local state.
- *
- * @relative_pathname need not start with a directory separator; one will be
- * added automatically.
+/* Return a dynamically allocated directory path that is appropriate for storing
+ * local state.
  *
  * The caller is responsible for releasing the value returned with g_free()
  * after use.
  */
-char *qemu_get_local_state_pathname(const char *relative_pathname);
+char *qemu_get_local_state_dir(void);
 
 /* Find program directory, and save it for later usage with
  * qemu_get_exec_dir().
diff --git a/qga/main.c b/qga/main.c
index aa00ad8fabdf..3c20bf1fbfe0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -129,12 +129,12 @@ static void stop_agent(GAState *s, bool requested);
 static void
 init_dfl_pathnames(void)
 {
+    g_autofree char *state = qemu_get_local_state_dir();
+
     g_assert(dfl_pathnames.state_dir == NULL);
     g_assert(dfl_pathnames.pidfile == NULL);
-    dfl_pathnames.state_dir = qemu_get_local_state_pathname(
-      QGA_STATE_RELATIVE_DIR);
-    dfl_pathnames.pidfile   = qemu_get_local_state_pathname(
-      QGA_STATE_RELATIVE_DIR G_DIR_SEPARATOR_S "qemu-ga.pid");
+    dfl_pathnames.state_dir = g_build_filename(state, QGA_STATE_RELATIVE_DIR, NULL);
+    dfl_pathnames.pidfile = g_build_filename(state, QGA_STATE_RELATIVE_DIR, "qemu-ga.pid", NULL);
 }
 
 static void quit_handler(int sig)
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index df493e2a503e..196b78c00df5 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -77,8 +77,10 @@ static int gid = -1;
 
 static void compute_default_paths(void)
 {
-    socket_path = qemu_get_local_state_pathname("run/qemu-pr-helper.sock");
-    pidfile = qemu_get_local_state_pathname("run/qemu-pr-helper.pid");
+    g_autofree char *state = qemu_get_local_state_dir();
+
+    socket_path = g_build_filename(state, "run", "qemu-pr-helper.sock", NULL);
+    pidfile = g_build_filename(state, "run", "qemu-pr-helper.pid", NULL);
 }
 
 static void usage(const char *name)
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 60b96470c51a..a52eacf82e1e 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -901,10 +901,12 @@ static bool fv_socket_lock(struct fuse_session *se)
 {
     g_autofree gchar *sk_name = NULL;
     g_autofree gchar *pidfile = NULL;
+    g_autofree gchar *state = NULL;
     g_autofree gchar *dir = NULL;
     Error *local_err = NULL;
 
-    dir = qemu_get_local_state_pathname("run/virtiofsd");
+    state = qemu_get_local_state_dir();
+    dir = g_build_filename(state, "run", "virtiofsd", NULL);
 
     if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
         fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s\n",
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index bcb35c3c8246..b8bf7d4070ce 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -297,12 +297,9 @@ int qemu_pipe(int pipefd[2])
 }
 
 char *
-qemu_get_local_state_pathname(const char *relative_pathname)
+qemu_get_local_state_dir(void)
 {
-    g_autofree char *dir = g_strdup_printf("%s/%s",
-                                           CONFIG_QEMU_LOCALSTATEDIR,
-                                           relative_pathname);
-    return get_relocated_path(dir);
+    return get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR);
 }
 
 void qemu_set_tty_echo(int fd, bool echo)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index b897d759365f..9c1e8121fd6d 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -235,7 +235,7 @@ int qemu_get_thread_id(void)
 }
 
 char *
-qemu_get_local_state_pathname(const char *relative_pathname)
+qemu_get_local_state_dir(void)
 {
     HRESULT result;
     char base_path[MAX_PATH+1] = "";
@@ -247,8 +247,7 @@ qemu_get_local_state_pathname(const char *relative_pathname)
         g_critical("CSIDL_COMMON_APPDATA unavailable: %ld", (long)result);
         abort();
     }
-    return g_strdup_printf("%s" G_DIR_SEPARATOR_S "%s", base_path,
-                           relative_pathname);
+    return g_strdup(base_path);
 }
 
 void qemu_set_tty_echo(int fd, bool echo)
-- 
2.36.0


