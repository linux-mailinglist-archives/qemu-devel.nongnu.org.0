Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6F4CD3ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:02:50 +0100 (CET)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6e1-0001Rc-R8
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6ZO-0006xN-U0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6ZM-0006RN-UL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646395080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQrAvBXB7rXvUaR8lWoeWYrV6XVdHj/elruQAyZxCYc=;
 b=GpTzdaw/L1qkRdROju8NIKTIhdlBLx5fpJWybMalyAkB4hmsYxu0WZbtrfaCTQVo9Sy916
 vcPlSMfhubyGTSav5GxvMgDjX06HqHLZnszJjBHsRDAoq0ir6Kr4Q1BDdXbSp9mvIlebVA
 9p1bUR3K+WGbg7FCoOaZB4MrKxoAsGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-48Kl_-8CN9mm4KByxU7J7g-1; Fri, 04 Mar 2022 06:57:59 -0500
X-MC-Unique: 48Kl_-8CN9mm4KByxU7J7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71A531800D50;
 Fri,  4 Mar 2022 11:57:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE71F2B450;
 Fri,  4 Mar 2022 11:57:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] softmmu: move parsing of -runas,
 -chroot and -daemonize code
Date: Fri,  4 Mar 2022 11:56:57 +0000
Message-Id: <20220304115657.3177925-5-berrange@redhat.com>
In-Reply-To: <20220304115657.3177925-1-berrange@redhat.com>
References: <20220304115657.3177925-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the future intent to try to move to a fully QAPI driven
configuration system, we want to have any current command
parsing well isolated from logic that applies the resulting
configuration.

We also don't want os-posix.c to contain code that is specific
to the system emulators, as this file is linked to other binaries
too.

To satisfy these goals, we move parsing of the -runas, -chroot and
-daemonize code out of the os-posix.c helper code, and pass the
parsed data into APIs in os-posix.c.

As a side benefit the 'os_daemonize()' function now lives upto to
its name and will always daemonize, instead of using global state
to decide to be a no-op sometimes.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/sysemu/os-posix.h |   4 +-
 include/sysemu/os-win32.h |   1 -
 os-posix.c                | 148 +++++++++++---------------------------
 os-win32.c                |   9 ---
 softmmu/vl.c              |  76 ++++++++++++++++++--
 5 files changed, 113 insertions(+), 125 deletions(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 2edf33658a..390f3f8396 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -46,7 +46,9 @@ void os_set_line_buffering(void);
 void os_set_proc_name(const char *s);
 void os_setup_signal_handling(void);
 void os_daemonize(void);
-void os_setup_post(void);
+void os_setup_post(const char *chroot_dir,
+                   uid_t uid, gid_t gid,
+                   const char *username);
 int os_mlock(void);
 
 #define closesocket(s) close(s)
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 43f569b5c2..4879f8731d 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -61,7 +61,6 @@ struct tm *localtime_r(const time_t *timep, struct tm *result);
 
 static inline void os_setup_signal_handling(void) {}
 static inline void os_daemonize(void) {}
-static inline void os_setup_post(void) {}
 void os_set_line_buffering(void);
 static inline void os_set_proc_name(const char *dummy) {}
 
diff --git a/os-posix.c b/os-posix.c
index 30da1a1491..f598a52a4f 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -42,11 +42,6 @@
 #include <sys/prctl.h>
 #endif
 
-static char *user_name;
-static uid_t user_uid = (uid_t)-1;
-static gid_t user_gid = (gid_t)-1;
-
-static const char *chroot_dir;
 static int daemonize;
 static int daemon_pipe;
 
@@ -96,69 +91,6 @@ void os_set_proc_name(const char *s)
 }
 
 
-static bool os_parse_runas_uid_gid(const char *optarg,
-                                   uid_t *runas_uid, gid_t *runas_gid)
-{
-    unsigned long lv;
-    const char *ep;
-    uid_t got_uid;
-    gid_t got_gid;
-    int rc;
-
-    rc = qemu_strtoul(optarg, &ep, 0, &lv);
-    got_uid = lv; /* overflow here is ID in C99 */
-    if (rc || *ep != ':' || got_uid != lv || got_uid == (uid_t)-1) {
-        return false;
-    }
-
-    rc = qemu_strtoul(ep + 1, 0, 0, &lv);
-    got_gid = lv; /* overflow here is ID in C99 */
-    if (rc || got_gid != lv || got_gid == (gid_t)-1) {
-        return false;
-    }
-
-    *runas_uid = got_uid;
-    *runas_gid = got_gid;
-    return true;
-}
-
-/*
- * Parse OS specific command line options.
- * return 0 if option handled, -1 otherwise
- */
-int os_parse_cmd_args(int index, const char *optarg)
-{
-    struct passwd *user_pwd;
-
-    switch (index) {
-    case QEMU_OPTION_runas:
-        user_pwd = getpwnam(optarg);
-        if (user_pwd) {
-            user_uid = user_pwd->pw_uid;
-            user_gid = user_pwd->pw_gid;
-            user_name = g_strdup(user_pwd->pw_name);
-        } else if (!os_parse_runas_uid_gid(optarg,
-                                           &user_uid,
-                                           &user_gid)) {
-            error_report("User \"%s\" doesn't exist"
-                         " (and is not <uid>:<gid>)",
-                         optarg);
-            exit(1);
-        }
-        break;
-    case QEMU_OPTION_chroot:
-        chroot_dir = optarg;
-        break;
-    case QEMU_OPTION_daemonize:
-        daemonize = 1;
-        break;
-    default:
-        return -1;
-    }
-
-    return 0;
-}
-
 static void change_process_uid(uid_t uid, gid_t gid, const char *name)
 {
     if (setgid(gid) < 0) {
@@ -202,54 +134,56 @@ static void change_root(const char *root)
 
 void os_daemonize(void)
 {
-    if (daemonize) {
-        pid_t pid;
-        int fds[2];
+    pid_t pid;
+    int fds[2];
 
-        if (pipe(fds) == -1) {
-            exit(1);
-        }
+    if (pipe(fds) == -1) {
+        exit(1);
+    }
 
-        pid = fork();
-        if (pid > 0) {
-            uint8_t status;
-            ssize_t len;
+    pid = fork();
+    if (pid > 0) {
+        uint8_t status;
+        ssize_t len;
 
-            close(fds[1]);
+        close(fds[1]);
 
-            do {
-                len = read(fds[0], &status, 1);
-            } while (len < 0 && errno == EINTR);
+        do {
+            len = read(fds[0], &status, 1);
+        } while (len < 0 && errno == EINTR);
 
-            /* only exit successfully if our child actually wrote
-             * a one-byte zero to our pipe, upon successful init */
-            exit(len == 1 && status == 0 ? 0 : 1);
+        /* only exit successfully if our child actually wrote
+         * a one-byte zero to our pipe, upon successful init */
+        exit(len == 1 && status == 0 ? 0 : 1);
 
-        } else if (pid < 0) {
-            exit(1);
-        }
+    } else if (pid < 0) {
+        exit(1);
+    }
 
-        close(fds[0]);
-        daemon_pipe = fds[1];
-        qemu_set_cloexec(daemon_pipe);
+    close(fds[0]);
+    daemon_pipe = fds[1];
+    qemu_set_cloexec(daemon_pipe);
 
-        setsid();
+    setsid();
 
-        pid = fork();
-        if (pid > 0) {
+    pid = fork();
+    if (pid > 0) {
             exit(0);
-        } else if (pid < 0) {
-            exit(1);
-        }
-        umask(027);
-
-        signal(SIGTSTP, SIG_IGN);
-        signal(SIGTTOU, SIG_IGN);
-        signal(SIGTTIN, SIG_IGN);
+    } else if (pid < 0) {
+        exit(1);
     }
+    umask(027);
+
+    signal(SIGTSTP, SIG_IGN);
+    signal(SIGTTOU, SIG_IGN);
+    signal(SIGTTIN, SIG_IGN);
+
+    daemonize = true;
 }
 
-void os_setup_post(void)
+void os_setup_post(const char *root_dir,
+                   uid_t runas_uid, gid_t runas_gid,
+                   const char *runas_name)
 {
     int fd = 0;
 
@@ -264,11 +198,11 @@ void os_setup_post(void)
         }
     }
 
-    if (chroot_dir) {
-        change_root(chroot_dir);
+    if (root_dir != NULL) {
+        change_root(root_dir);
     }
-    if (user_uid != -1 && user_gid != -1) {
-        change_process_uid(user_uid, user_gid, user_name);
+    if (runas_uid != -1 && runas_gid != -1) {
+        change_process_uid(runas_uid, runas_gid, runas_name);
     }
 
     if (daemonize) {
diff --git a/os-win32.c b/os-win32.c
index e31c921983..6f21b57841 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -61,12 +61,3 @@ void os_set_line_buffering(void)
     setbuf(stdout, NULL);
     setbuf(stderr, NULL);
 }
-
-/*
- * Parse OS specific command line options.
- * return 0 if option handled, -1 otherwise
- */
-int os_parse_cmd_args(int index, const char *optarg)
-{
-    return -1;
-}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800f..cdf27b6027 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2602,11 +2602,13 @@ static void qemu_process_help_options(void)
     }
 }
 
-static void qemu_maybe_daemonize(const char *pid_file)
+static void qemu_maybe_daemonize(bool daemonize, const char *pid_file)
 {
     Error *err = NULL;
 
-    os_daemonize();
+    if (daemonize) {
+        os_daemonize();
+    }
     rcu_disable_atfork();
 
     if (pid_file && !qemu_write_pidfile(pid_file, &err)) {
@@ -2768,6 +2770,35 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+#ifndef WIN32
+static bool os_parse_runas_uid_gid(const char *optarg,
+                                   uid_t *runas_uid,
+                                   gid_t *runas_gid)
+{
+    unsigned long lv;
+    const char *ep;
+    uid_t got_uid;
+    gid_t got_gid;
+    int rc;
+
+    rc = qemu_strtoul(optarg, &ep, 0, &lv);
+    got_uid = lv; /* overflow here is ID in C99 */
+    if (rc || *ep != ':' || got_uid != lv || got_uid == (uid_t)-1) {
+        return false;
+    }
+
+    rc = qemu_strtoul(ep + 1, 0, 0, &lv);
+    got_gid = lv; /* overflow here is ID in C99 */
+    if (rc || got_gid != lv || got_gid == (gid_t)-1) {
+        return false;
+    }
+
+    *runas_gid = got_gid;
+    *runas_uid = got_uid;
+    return true;
+}
+#endif /* !WIN32 */
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -2778,6 +2809,14 @@ void qemu_init(int argc, char **argv, char **envp)
     MachineClass *machine_class;
     bool userconfig = true;
     FILE *vmstate_dump_file = NULL;
+    bool daemonize = false;
+#ifndef WIN32
+    struct passwd *pwd;
+    uid_t runas_uid = -1;
+    gid_t runas_gid = -1;
+    g_autofree char *runas_name = NULL;
+    const char *chroot_dir = NULL;
+#endif /* !WIN32 */
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -3659,11 +3698,32 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
-            default:
-                if (os_parse_cmd_args(popt->index, optarg)) {
-                    error_report("Option not supported in this build");
+#ifndef WIN32
+            case QEMU_OPTION_runas:
+                pwd = getpwnam(optarg);
+                if (pwd) {
+                    runas_uid = pwd->pw_uid;
+                    runas_gid = pwd->pw_gid;
+                    runas_name = g_strdup(pwd->pw_name);
+                } else if (!os_parse_runas_uid_gid(optarg,
+                                                   &runas_uid,
+                                                   &runas_gid)) {
+                    error_report("User \"%s\" doesn't exist"
+                                 " (and is not <uid>:<gid>)",
+                                 optarg);
                     exit(1);
                 }
+                break;
+            case QEMU_OPTION_chroot:
+                chroot_dir = optarg;
+                break;
+            case QEMU_OPTION_daemonize:
+                daemonize = 1;
+                break;
+#endif /* !WIN32 */
+            default:
+                error_report("Option not supported in this build");
+                exit(1);
             }
         }
     }
@@ -3683,7 +3743,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_process_early_options();
 
     qemu_process_help_options();
-    qemu_maybe_daemonize(pid_file);
+    qemu_maybe_daemonize(daemonize, pid_file);
 
     /*
      * The trace backend must be initialized after daemonizing.
@@ -3778,6 +3838,8 @@ void qemu_init(int argc, char **argv, char **envp)
     }
     qemu_init_displays();
     accel_setup_post(current_machine);
-    os_setup_post();
+#ifndef WIN32
+    os_setup_post(chroot_dir, runas_uid, runas_gid, runas_name);
+#endif /* !WIN32 */
     resume_mux_open();
 }
-- 
2.34.1


