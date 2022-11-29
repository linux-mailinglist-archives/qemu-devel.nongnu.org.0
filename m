Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EF63C682
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 18:38:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p04YF-0004E3-FF; Tue, 29 Nov 2022 12:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p04YD-0004DG-D3
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:37:45 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p04YA-0007ai-Ir
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:37:45 -0500
Received: from [192.168.16.240] (helo=roughy.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.drobyshev@virtuozzo.com>) id 1p04Xt-001KbY-1G;
 Tue, 29 Nov 2022 18:37:25 +0100
To: qemu-devel@nongnu.org
Cc: andrey.drobyshev@virtuozzo.com, den@virtuozzo.com, yur@openvz.org,
 marcandre.lureau@gmail.com, mike.maslenkin@gmail.com
Subject: [PATCH v2 1/2] qga-win: add logging to Windows event log
Date: Tue, 29 Nov 2022 19:38:08 +0200
Message-Id: <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
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

This commit allows QGA to write to Windows event log using Win32 API's
ReportEvent() [1], much like syslog() under *nix guests.

In order to generate log message definitions we use a very basic message
text file [2], so that every QGA's message gets ID 1.  The tools
"windmc" and "windres" respectively are used to generate ".rc" file and
COFF object file, and then the COFF file is linked into qemu-ga.exe.

[1] https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
[2] https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files

Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
---
 configure                 |  3 +++
 qga/installer/qemu-ga.wxs |  5 +++++
 qga/main.c                | 16 +++++++++++++---
 qga/meson.build           | 19 ++++++++++++++++++-
 qga/messages-win32.mc     |  9 +++++++++
 5 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 qga/messages-win32.mc

diff --git a/configure b/configure
index 26c7bc5154..789a4f6cc9 100755
--- a/configure
+++ b/configure
@@ -372,6 +372,7 @@ smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
 widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
+windmc="${WINDMC-${cross_prefix}windmc}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
 query_pkg_config() {
     "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
@@ -2561,6 +2562,7 @@ if test "$skip_meson" = no; then
   echo "strip = [$(meson_quote $strip)]" >> $cross
   echo "widl = [$(meson_quote $widl)]" >> $cross
   echo "windres = [$(meson_quote $windres)]" >> $cross
+  echo "windmc = [$(meson_quote $windmc)]" >> $cross
   if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
@@ -2667,6 +2669,7 @@ preserve_env SMBD
 preserve_env STRIP
 preserve_env WIDL
 preserve_env WINDRES
+preserve_env WINDMC
 
 printf "exec" >>config.status
 for i in "$0" "$@"; do
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 73ce2c4965..d9567836f3 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -110,6 +110,11 @@
               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
               <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
             </RegistryKey>
+            <RegistryKey Root="HKLM"
+                         Key="System\CurrentControlSet\Services\EventLog\Application\qemu-ga">
+              <RegistryValue Type="integer" Name="TypesSupported" Value="7" />
+              <RegistryValue Type="string" Name="EventMessageFile" Value="[qemu_ga_directory]qemu-ga.exe" />
+            </RegistryKey>
           </Component>
         </Directory>
       </Directory>
diff --git a/qga/main.c b/qga/main.c
index b3580508fa..e9f4f44cbb 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -83,6 +83,7 @@ struct GAState {
 #ifdef _WIN32
     GAService service;
     HANDLE wakeup_event;
+    HANDLE event_log;
 #endif
     bool delimit_response;
     bool frozen;
@@ -324,13 +325,14 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
     }
 
     level &= G_LOG_LEVEL_MASK;
-#ifndef _WIN32
     if (g_strcmp0(domain, "syslog") == 0) {
+#ifndef _WIN32
         syslog(LOG_INFO, "%s: %s", level_str, msg);
-    } else if (level & s->log_level) {
 #else
-    if (level & s->log_level) {
+        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
+                    0, 1, NULL, 1, 0, &msg, NULL);
 #endif
+    } else if (level & s->log_level) {
         g_autoptr(GDateTime) now = g_date_time_new_now_utc();
         g_autofree char *nowstr = g_date_time_format(now, "%s.%f");
         fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
@@ -1286,6 +1288,13 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
     g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
 
 #ifdef _WIN32
+    s->event_log = RegisterEventSource(NULL, "qemu-ga");
+    if (!s->event_log) {
+        g_autofree gchar *errmsg = g_win32_error_message(GetLastError());
+        g_critical("unable to register event source: %s", errmsg);
+        return NULL;
+    }
+
     /* On win32 the state directory is application specific (be it the default
      * or a user override). We got past the command line parsing; let's create
      * the directory (with any intermediate directories). If we run into an
@@ -1377,6 +1386,7 @@ static void cleanup_agent(GAState *s)
 {
 #ifdef _WIN32
     CloseHandle(s->wakeup_event);
+    CloseHandle(s->event_log);
 #endif
     if (s->command_state) {
         ga_command_state_cleanup_all(s->command_state);
diff --git a/qga/meson.build b/qga/meson.build
index 3cfb9166e5..1ff159edc1 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -98,7 +98,24 @@ if targetos == 'windows'
   endif
 endif
 
-qga = executable('qemu-ga', qga_ss.sources(),
+qga_objs = []
+if targetos == 'windows'
+  windmc = find_program('windmc', required: true)
+  windres = find_program('windres', required: true)
+
+  msgrc = custom_target('messages-win32.rc',
+                        input: 'messages-win32.mc',
+                        output: ['messages-win32.rc', 'MSG00409.bin', 'messages-win32.h'],
+                        command: [windmc, '-h', '@OUTDIR@', '-r', '@OUTDIR@', '@INPUT@'])
+  msgobj = custom_target('messages-win32.o',
+                         input: msgrc[0],
+                         output: 'messages-win32.o',
+                         command: [windres, '-I', '@OUTDIR@', '-o', '@OUTPUT@', '@INPUT@'])
+
+  qga_objs = [msgobj]
+endif
+
+qga = executable('qemu-ga', qga_ss.sources() + qga_objs,
                  link_args: qga_libs,
                  dependencies: [qemuutil, libudev],
                  install: true)
diff --git a/qga/messages-win32.mc b/qga/messages-win32.mc
new file mode 100644
index 0000000000..e21019cebe
--- /dev/null
+++ b/qga/messages-win32.mc
@@ -0,0 +1,9 @@
+LanguageNames=(
+    English=0x409:MSG00409
+)
+
+MessageId=1
+SymbolicName=QEMU_GA_EVENTLOG_GENERAL
+Language=English
+%1
+.
-- 
2.38.1


