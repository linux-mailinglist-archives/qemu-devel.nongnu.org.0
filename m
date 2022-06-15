Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A865554C690
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:56:50 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qhd-00066R-7A
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdQ-0003BR-Pf
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdM-0001yD-7l
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rw02dKiEcdwmKxBhwRuwk1oX8MAqRXqcUQ/XBHdkB0w=;
 b=eO0iO4OJX+Jl1Ov3IZYINSyMgQGNlSXHyoSjXFUfxnnGfvBLrVVeg924bY8MoONFO1vE1j
 cgloJNGpVIzhc5Q7Q0zv+cyTzgiZS3VBtwEwHyGNknVKfz5FPIZ8aqRx9uozXzWbuQtVl2
 bE0Mq2MWomHAwpuETZvSoJx0J/9y/SM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-D3qcS68aNqeDmHpHDMHUBw-1; Wed, 15 Jun 2022 06:52:20 -0400
X-MC-Unique: D3qcS68aNqeDmHpHDMHUBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03899811E75;
 Wed, 15 Jun 2022 10:52:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE1E111F5;
 Wed, 15 Jun 2022 10:52:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 1/4] softmmu: rewrite handling of qemu_find_file
Date: Wed, 15 Jun 2022 11:52:09 +0100
Message-Id: <20220615105212.780256-2-berrange@redhat.com>
In-Reply-To: <20220615105212.780256-1-berrange@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_find_file method has a couple of flaws in its current
implementation:

 * The configure time 'qemu-firmware' search path is mistakenly
   also used to find keymaps

 * The configure time 'qemu-firmware' search path is mistakenly
   relocated even when running from build dir resulting in
   non-sensical paths that won't resolve

 * When searching for files it has the assumption that the
   in-build-tree layout will match the installed root layout

The latter problem has forced us to keep the keymap files under a
sub-dir of the pc-bios/ instead of ui/.

This all stems from the way qemu_find_file tries to use a single
list of data directory locations, appending a type specific
subdir.

This can be addressed by refactoring the logic as follows

For each type of file to be found identify

  * Optional: any user specified dir (non-relocated)
  * Path relative to build dir
  * Path relative to install dir
  * Optional: extra configure time install dirs (bios only, relocated)
  * The default install directory (relocated)

We can then search through:

 * User specified dir
 * If running from build dir
     - Path relative to build dir
   else
     - Extra configure time dirs
     - Path relative to default install dir

This is now flexible enough to extend to find any type of file,
by plugging in different input values, regardless of what layout
might be used in build dir vs install dir.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/qemu/datadir.h  |   5 +-
 softmmu/datadir.c       | 145 +++++++++++++++++++++++-----------------
 softmmu/trace-events    |   5 +-
 softmmu/vl.c            |   2 +-
 tests/qtest/fuzz/fuzz.c |   2 +-
 5 files changed, 92 insertions(+), 67 deletions(-)

diff --git a/include/qemu/datadir.h b/include/qemu/datadir.h
index 21f9097f58..a333cd9b0d 100644
--- a/include/qemu/datadir.h
+++ b/include/qemu/datadir.h
@@ -15,6 +15,9 @@
  * configured at build time (DATADIR) or registered with the -L command
  * line option.
  *
+ * @name may be NULL to indicate the caller just wants the
+ * first search directory that is found.
+ *
  * The caller must use g_free() to free the returned data when it is
  * no longer required.
  *
@@ -22,7 +25,7 @@
  */
 char *qemu_find_file(int type, const char *name);
 void qemu_add_default_firmwarepath(void);
-void qemu_add_data_dir(char *path);
+void qemu_set_user_data_dir(const char *path);
 void qemu_list_data_dirs(void);
 
 #endif
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a..7457717542 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -27,102 +27,121 @@
 #include "qemu/cutils.h"
 #include "trace.h"
 
-static const char *data_dir[16];
-static int data_dir_idx;
+/* User specified data directory */
+static char *user_data_dir;
+
+/* Extra build time defined search locations for firmware (NULL terminated) */
+static char **extra_firmware_dirs;
+
+/* Default built-in directories */
+static char *default_data_dir;
+
+/* Whether we're known to be executing from a build tree */
+static bool in_build_dir;
 
 char *qemu_find_file(int type, const char *name)
 {
-    int i;
-    const char *subdir;
-    char *buf;
-
-    /* Try the name as a straight path first */
-    if (access(name, R_OK) == 0) {
-        trace_load_file(name, name);
-        return g_strdup(name);
-    }
+    const char *user_install_dir = NULL;
+    char **extra_install_dirs = NULL;
+    const char *rel_build_dir;
+    const char *rel_install_dir;
+    const char *default_install_dir;
+    char *maybepath = NULL;
+    size_t i;
+    int ret;
 
     switch (type) {
     case QEMU_FILE_TYPE_BIOS:
-        subdir = "";
+        user_install_dir = user_data_dir;
+        extra_install_dirs = extra_firmware_dirs;
+        rel_install_dir = "";
+        rel_build_dir = "pc-bios";
+        default_install_dir = default_data_dir;
         break;
+
     case QEMU_FILE_TYPE_KEYMAP:
-        subdir = "keymaps/";
+        user_install_dir = user_data_dir;
+        rel_install_dir = "keymaps";
+        rel_build_dir = "pc-bios/keymaps";
+        default_install_dir = default_data_dir;
         break;
+
     default:
         abort();
     }
 
-    for (i = 0; i < data_dir_idx; i++) {
-        buf = g_strdup_printf("%s/%s%s", data_dir[i], subdir, name);
-        if (access(buf, R_OK) == 0) {
-            trace_load_file(name, buf);
-            return buf;
-        }
-        g_free(buf);
-    }
-    return NULL;
-}
-
-void qemu_add_data_dir(char *path)
-{
-    int i;
+#define TRY_LOAD(path)                                                  \
+    do {                                                                \
+        ret = access(path, R_OK);                                       \
+        trace_datadir_load_file(name, path, ret == 0 ? 0 : errno);      \
+        if (ret == 0) {                                                 \
+            return maybepath;                                           \
+        }                                                               \
+        g_clear_pointer(&path, g_free);                                 \
+    } while (0)
 
-    if (path == NULL) {
-        return;
+    if (user_install_dir) {
+        maybepath = g_build_filename(user_install_dir, rel_install_dir,
+                                     name, NULL);
+        TRY_LOAD(maybepath);
     }
-    if (data_dir_idx == ARRAY_SIZE(data_dir)) {
-        return;
-    }
-    for (i = 0; i < data_dir_idx; i++) {
-        if (strcmp(data_dir[i], path) == 0) {
-            g_free(path); /* duplicate */
-            return;
+
+    if (in_build_dir) {
+        maybepath = g_build_filename(qemu_get_exec_dir(), rel_build_dir,
+                                     name, NULL);
+    } else {
+        if (extra_install_dirs) {
+            for (i = 0; extra_install_dirs[i] != NULL; i++) {
+                maybepath = g_build_filename(extra_install_dirs[i],
+                                             name, NULL);
+                TRY_LOAD(maybepath);
+            }
         }
+
+        maybepath = g_build_filename(default_install_dir, rel_install_dir,
+                                     name, NULL);
     }
-    data_dir[data_dir_idx++] = path;
+    TRY_LOAD(maybepath);
+
+    return NULL;
 }
 
-/*
- * Find a likely location for support files using the location of the binary.
- * When running from the build tree this will be "$bindir/pc-bios".
- * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- */
-static char *find_datadir(void)
+void qemu_set_user_data_dir(const char *path)
 {
-    g_autofree char *dir = NULL;
-
-    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
-    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-        return g_steal_pointer(&dir);
-    }
-
-    return get_relocated_path(CONFIG_QEMU_DATADIR);
+    g_free(user_data_dir);
+    user_data_dir = g_strdup(path);
 }
 
 void qemu_add_default_firmwarepath(void)
 {
-    char **dirs;
     size_t i;
+    g_autofree char *builddir = NULL;
+
+    builddir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
+    if (access(builddir, R_OK) == 0) {
+        in_build_dir = true;
+    }
 
     /* add configured firmware directories */
-    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
-    for (i = 0; dirs[i] != NULL; i++) {
-        qemu_add_data_dir(get_relocated_path(dirs[i]));
+    extra_firmware_dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH,
+                                     G_SEARCHPATH_SEPARATOR_S, 0);
+    for (i = 0; extra_firmware_dirs[i] != NULL ; i++) {
+        g_autofree char *path = extra_firmware_dirs[i];
+        extra_firmware_dirs[i] = get_relocated_path(path);
     }
-    g_strfreev(dirs);
 
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
+    /* Add default dirs relative to the executable path */
+    default_data_dir = get_relocated_path(CONFIG_QEMU_DATADIR);
+
+    trace_datadir_init(default_data_dir, in_build_dir);
 }
 
 void qemu_list_data_dirs(void)
 {
     int i;
-    for (i = 0; i < data_dir_idx; i++) {
-        printf("%s\n", data_dir[i]);
+    for (i = 0; extra_firmware_dirs[i] != NULL; i++) {
+        printf("%s\n", extra_firmware_dirs[i]);
     }
+
+    printf("%s\n", default_data_dir);
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..a9ba53f50d 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -4,6 +4,10 @@
 # Since requests are raised via monitor, not many tracepoints are needed.
 balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
 
+# datadir.c
+datadir_load_file(const char *name, const char *path, int err) "name %s location %s errno %d"
+datadir_init(const char *defdatadir, bool inbuilddir) "default data dir %s in build dir %d"
+
 # ioport.c
 cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
 cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
@@ -26,7 +30,6 @@ vm_stop_flush_all(int ret) "ret %d"
 
 # vl.c
 vm_state_notify(int running, int reason, const char *reason_str) "running %d reason %d (%s)"
-load_file(const char *name, const char *path) "name %s location %s"
 runstate_set(int current_state, const char *current_state_str, int new_state, const char *new_state_str) "current_run_state %d (%s) new_state %d (%s)"
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920ada1..0a578255c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2898,7 +2898,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 if (is_help_option(optarg)) {
                     list_data_dirs = true;
                 } else {
-                    qemu_add_data_dir(g_strdup(optarg));
+                    qemu_set_user_data_dir(optarg);
                 }
                 break;
             case QEMU_OPTION_bios:
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 0ad4ba9e94..4438c7f141 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -186,7 +186,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
         bindir = qemu_get_exec_dir();
         datadir = g_build_filename(bindir, "pc-bios", NULL);
         if (g_file_test(datadir, G_FILE_TEST_IS_DIR)) {
-            qemu_add_data_dir(datadir);
+            qemu_set_data_dir(datadir);
         } else {
             g_free(datadir);
 	}
-- 
2.36.1


