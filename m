Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2264EC60
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BBB-0008MY-1O; Fri, 16 Dec 2022 08:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAv-0008FA-Gv
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAt-0007mX-FN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I32EHhD5mYmcyXDJxUrKlzrMts/s6L00VLuANUyfKzM=;
 b=HO416846TX4+YltBkJ/JdmihkOWA+8NSwB29jJLSQrMi613vlaP1fqojTOVhm8EjEzCuZu
 luuGXVc3bYsGFQ9ChCMzTcoFyTA9DHKyzNCr8sd/EdqB2+a4iyh+DAEJ3OtZp8zazS8sgE
 kAusApxkn6xRCIAqvmAW4tQdpDVP8Uc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-o_aJ2kZ_MoGMTNIxza7lTQ-1; Fri, 16 Dec 2022 08:54:53 -0500
X-MC-Unique: o_aJ2kZ_MoGMTNIxza7lTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6BB71C0897D;
 Fri, 16 Dec 2022 13:54:52 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D9C40C2064;
 Fri, 16 Dec 2022 13:54:51 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 7/8] qga-win: add logging to Windows event log
Date: Fri, 16 Dec 2022 15:54:38 +0200
Message-Id: <20221216135439.465033-8-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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
index 447effdfe1..51340f7ecc 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -116,6 +116,11 @@
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
index 0865c992f0..1463a1c170 100644
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
index d3b0f8bbd0..ad17dc7dca 100644
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
2.25.1


