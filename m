Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41654D02E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:40:38 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X0O-0002qj-FW
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wu3-0007Rt-Sk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wu1-0006qO-TK
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso2773732pjl.3
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h6MIJ4t4BwlRaze8TB5KKl1+J/3+nprDtRLJ3HVVNbE=;
 b=o4BhCRTH0An1Zh4frOfA/KJknmxwWcaWp4UxyuK1YyLPK5dnOCJjsrJ0/alU2+JkW+
 EwBbHYkNOY2A/mmQZyHZs3fxkbisaJNk+fQ9fi3KgiU52lG34k1//HadQ2s7aiwXntE2
 b3/27DN/xs7CZrbHQbBz/I82jA1ds78jOxF1cX71o9Tdh9XYGBQYDkoFqCC78bfnKZVi
 ot/o476i+AxYZIOJf9Eqy7QiJ4O4F7q1Pyv/fs7+MyiPuqbpZNB4FXqEJGvyOKS8eDrH
 2Aao6ZsUFtlvU+ejWeHnDLWvEOOyfRTA0do/A+W6Iw8cKm1/GeH8R2/AKaHhkQAzfwKs
 c8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h6MIJ4t4BwlRaze8TB5KKl1+J/3+nprDtRLJ3HVVNbE=;
 b=Zr+KZKmD+yH2Yws8NsICFUCsz8tS1LLTtlKJdaV7KyKM2ptK6eKV1TBQw0HKX1ydkH
 qHZH1TnAP3bDR7M4ZFFO2TIAm/Gh45S5jGaOY8nPChgyD0pMC3psWoxU5CyYUH/pjCcJ
 cmSR7mCXGx3dg5IZZL444i0klTEgzmsY3i2gBYfyjo36A5PDgOCp1QlyS2omw3cnQrNc
 QfGeq/lu3ug9IKm3VacFJK9AIn7muN3/sUddSciWZRdCqWzXxmEa4Si7dasi99P36bjb
 ORXRedEDkSu1sQKEknF7vZ/gIaBxm5auI/2bmpuFqP8MetofN8xLkq44lsxxJxggCL31
 Pn8w==
X-Gm-Message-State: AJIora94bSkcVJeXhQr9oJeRsqnm37JMGjPiKwYEIQa/kZOAVWmUGXcF
 KjoRfYhCgRKcgDAN5rfEdq8=
X-Google-Smtp-Source: AGRyM1vr67x6KVJ2agomXVmtAV0HTKLcsMvQ40Cw6/XQB+2iDtkAGeW3eZ1HnsG/c1TBjWI2HOMR6A==
X-Received: by 2002:a17:902:7e84:b0:166:395c:4b68 with SMTP id
 z4-20020a1709027e8400b00166395c4b68mr687660pla.8.1655314440590; 
 Wed, 15 Jun 2022 10:34:00 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.33.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:33:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 2/6] Remove prefixes from path configuration macros
Date: Thu, 16 Jun 2022 02:33:41 +0900
Message-Id: <20220615173345.32456-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The path configuration macros are often supplied to
get_relocated_path(), and the function had some logics to remove the
prefixes.

With this change, the prefixes are removed from those macros and
get_relocated_path() is also simplified.

This also fixes --firmwarepath configuration option. The old
implementation naively added the prefix to the given option although
it is a list of paths. Now an absolute path in --firmwarepath will
be used as-is. A relative path in --firmwarepath will be relocated
with get_relocated_path().

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/qemu/cutils.h |  2 +-
 meson.build           | 23 +++++++++++------------
 qemu-options.hx       | 11 +++++------
 softmmu/datadir.c     |  9 +++++++--
 util/cutils.c         | 34 +++++++---------------------------
 5 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 40e10e19a7e..57de1da5c95 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -207,7 +207,7 @@ const char *qemu_get_exec_dir(void);
  *
  * Returns a path for @dir that uses the directory of the running executable
  * as the prefix.  For example, if `bindir` is `/usr/bin` and @dir is
- * `/usr/share/qemu`, the function will append `../share/qemu` to the
+ * `share/qemu`, the function will append `../share/qemu` to the
  * directory that contains the running executable and return the result.
  * The returned string should be freed by the caller.
  */
diff --git a/meson.build b/meson.build
index 0c2e11ff071..b982bfd5d07 100644
--- a/meson.build
+++ b/meson.build
@@ -1679,18 +1679,17 @@ config_host_data.set_quoted('CONFIG_TLS_PRIORITY', get_option('tls_priority'))
 if iasl.found()
   config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
 endif
-config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
+config_host_data.set_quoted('CONFIG_BINDIR', get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
-config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
-config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
-config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
-config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
-config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
-config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
-config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
-config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
-config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
+config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', qemu_confdir)
+config_host_data.set_quoted('CONFIG_QEMU_DATADIR', qemu_datadir)
+config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('libexecdir'))
+config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', qemu_icondir)
+config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('localedir'))
+config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('localstatedir'))
+config_host_data.set_quoted('CONFIG_QEMU_MODDIR', qemu_moddir)
+config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('sysconfdir'))
 
 if config_host.has_key('CONFIG_MODULES')
   config_host_data.set('CONFIG_STAMP', run_command(
@@ -3622,7 +3621,7 @@ endif
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
-summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
+summary_info += {'firmware path':     get_option('qemu_firmwarepath')}
 summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
 summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
 summary_info += {'module directory':  qemu_moddir}
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd82..f0ae8f44ff2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2661,12 +2661,11 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "         [,poll-us=n]\n"
     "                configure a host TAP network backend with ID 'str'\n"
     "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
-    "                use network scripts 'file' (default=" DEFAULT_NETWORK_SCRIPT ")\n"
-    "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
-    "                to deconfigure it\n"
+    "                use custom network script 'file' to configure it (optional)\n"
+    "                use custom network script 'dfile' to deconfigure it (optional)\n"
     "                use '[down]script=no' to disable script execution\n"
-    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
-    "                configure it\n"
+    "                use custom network helper 'helper' to\n"
+    "                configure it (optional)\n"
     "                use 'fd=h' to connect to an already opened TAP interface\n"
     "                use 'fds=x:y:...:z' to connect to already opened multiqueue capable TAP interfaces\n"
     "                use 'sndbuf=nbytes' to limit the size of the send buffer (the\n"
@@ -2684,7 +2683,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
     "                configure a host TAP network backend with ID 'str' that is\n"
     "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
-    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER ")\n"
+    "                using the custom program 'helper' (optional)\n"
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 160cac999a6..3da42cb8ed7 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -111,9 +111,14 @@ void qemu_add_default_firmwarepath(void)
     /* add configured firmware directories */
     dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
     for (i = 0; dirs[i] != NULL; i++) {
-        qemu_add_data_dir(get_relocated_path(dirs[i]));
+        if (g_path_is_absolute(dirs[i])) {
+            qemu_add_data_dir(dirs[i]);
+        } else {
+            qemu_add_data_dir(get_relocated_path(dirs[i]));
+            g_free(dirs[i]);
+        }
     }
-    g_strfreev(dirs);
+    g_free(dirs);
 
     /* try to find datadir relative to the executable path */
     qemu_add_data_dir(find_datadir());
diff --git a/util/cutils.c b/util/cutils.c
index a58bcfd80e7..983db97b4df 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -917,13 +917,6 @@ int qemu_pstrcmp0(const char **str1, const char **str2)
     return g_strcmp0(*str1, *str2);
 }
 
-static inline bool starts_with_prefix(const char *dir)
-{
-    size_t prefix_len = strlen(CONFIG_PREFIX);
-    return !memcmp(dir, CONFIG_PREFIX, prefix_len) &&
-        (!dir[prefix_len] || G_IS_DIR_SEPARATOR(dir[prefix_len]));
-}
-
 /* Return the next path component in dir, and store its length in *p_len.  */
 static inline const char *next_component(const char *dir, int *p_len)
 {
@@ -967,7 +960,7 @@ void qemu_init_exec_dir(const char *argv0)
     if (access(buf, R_OK) == 0) {
         exec_dir = g_strdup(buf);
     } else {
-        exec_dir = CONFIG_BINDIR;
+        exec_dir = CONFIG_PREFIX G_DIR_SEPARATOR_S CONFIG_BINDIR;
     }
 #else
     char *p = NULL;
@@ -1038,7 +1031,7 @@ void qemu_init_exec_dir(const char *argv0)
     if (p) {
         exec_dir = g_path_get_dirname(p);
     } else {
-        exec_dir = CONFIG_BINDIR;
+        exec_dir = CONFIG_PREFIX G_DIR_SEPARATOR_S CONFIG_BINDIR;
     }
 #endif
 }
@@ -1050,39 +1043,26 @@ const char *qemu_get_exec_dir(void)
 
 char *get_relocated_path(const char *dir)
 {
-    size_t prefix_len = strlen(CONFIG_PREFIX);
     const char *bindir = CONFIG_BINDIR;
     const char *exec_dir = qemu_get_exec_dir();
     GString *result;
-    int len_dir, len_bindir;
+    int len_bindir;
 
     /* Fail if qemu_init_exec_dir was not called.  */
     assert(exec_dir[0]);
-    if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
-        return g_strdup(dir);
-    }
 
     result = g_string_new(exec_dir);
 
-    /* Advance over common components.  */
-    len_dir = len_bindir = prefix_len;
-    do {
-        dir += len_dir;
-        bindir += len_bindir;
-        dir = next_component(dir, &len_dir);
-        bindir = next_component(bindir, &len_bindir);
-    } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
-
     /* Ascend from bindir to the common prefix with dir.  */
+    len_bindir = 0;
     while (len_bindir) {
         bindir += len_bindir;
         g_string_append(result, "/..");
         bindir = next_component(bindir, &len_bindir);
     }
 
-    if (*dir) {
-        assert(G_IS_DIR_SEPARATOR(dir[-1]));
-        g_string_append(result, dir - 1);
-    }
+    g_string_append_c(result, G_DIR_SEPARATOR);
+    g_string_append(result, dir);
+
     return g_string_free(result, false);
 }
-- 
2.32.1 (Apple Git-133)


