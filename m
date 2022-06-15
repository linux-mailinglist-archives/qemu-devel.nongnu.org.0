Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDF54CE8F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:23:06 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VnN-0005NO-Hc
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VO6-0008C9-Iy
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VO4-00088h-KJ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:56:58 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d13so10751353plh.13
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqJxgBQjormSo/al6PQl+CqdvjqOY+iZWbpHVrlRF1o=;
 b=lxRlgbnDSqE55JEvgOnrg7SWlHktZGKEY8Gaoew0ZIFq6yNjl7jQSWQamrrfjh82gJ
 aEtmAtrU5FgX9WRvjPoUolqLz5em0im5+9G/0sfQjTttfNlTYuREKS29GehV3qauXu+9
 DrSk3hA1Kp3zWLcm3MKberLr/Ct+ZMXl8I9237Zc4072fJT0k7FXKk90sS0YXuF1qYDb
 +DIT5tcuDyiqmqArItyc/6KMaMBG5xzQWM7MtSjCJesGpugJImpIZ/v8w9gxPnhMjmir
 HjL9lF9YjOcajayhx/UOc4UucxKc9PTwEY+ZdYfr2Adt1+bYHB3ELk7Npp3utizKmE5q
 hjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqJxgBQjormSo/al6PQl+CqdvjqOY+iZWbpHVrlRF1o=;
 b=E8u/syfPdbAvrgW9Jh4TrBYHANrDh0yXjaOStBKMPkhP3vQHQi31FFGXmVjZwv30Zs
 8INtxq9+snlm5LKcOAOwrx7SftFvm+srE+r9mJ7PKCB1CzkZYCGqtrRRftC03pILbCkl
 kIqc35Y2GiliJiWVLE51UdFKSw5VTSvhkSyhXLo6mNfL+fHWT3X4Fjqftqrkaxnp0t7O
 VKSP/tz/TA0/xulxsJNooq/iRpWSVONBhjwa+3YCmlyZxcN4HUa1wD2eglarmBlzt876
 FF/WvvwbkLDuPdHsSzg5E1YN9C+O5s1eeb7cAoeT7M7QrRybBlVygOJr00/G8stNTgA6
 i5fA==
X-Gm-Message-State: AJIora8Be/BYRscVKucVg2dOZo46EkJvTbgeb9dGXZZv5dpIBBeR25zP
 Ar09mrr8GWsyfK3ZaF1JmvXXaT5ogao=
X-Google-Smtp-Source: AGRyM1sNAwn5nP04bSX2AzsFoLOA1Ws1jqDoSDcu4V6yth7of37MAafNNLTGiY9i6H714cEK0Sx1Ng==
X-Received: by 2002:a17:903:2291:b0:167:59ad:52e8 with SMTP id
 b17-20020a170903229100b0016759ad52e8mr232062plh.121.1655308615317; 
 Wed, 15 Jun 2022 08:56:55 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.56.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:56:54 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 3/7] Remove prefixes from path configuration macros
Date: Thu, 16 Jun 2022 00:56:30 +0900
Message-Id: <20220615155634.578-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/qemu/cutils.h |  2 +-
 meson.build           | 21 ++++++++++-----------
 qemu-options.hx       | 11 +++++------
 util/cutils.c         | 34 +++++++---------------------------
 4 files changed, 23 insertions(+), 45 deletions(-)

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
index 0c2e11ff071..01d5e32615e 100644
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


