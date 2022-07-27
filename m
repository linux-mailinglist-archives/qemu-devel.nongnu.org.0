Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424655827D3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:37:39 +0200 (CEST)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhEI-00035K-CW
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5I-0003fO-S7
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5G-00024W-P0
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id o3so714490ple.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bcdb9+/+AcWEckEkuoxNuUyFBTQkLyiHLCzbjRH2NRw=;
 b=UrjMEzyw4IahPN4j6DS8m4fFtbLAbVzWjLMsLoNh35o+2XO2QFNdemlkh2HN5DiNoe
 708hB2agzh+8X9BihzqbPZq5GYxDe57oIHOePYfw9MEpYV9Btpc1TwG5s0ttFW7TNn07
 Z5x8pQ/7R/oWSmXARFxvjc4nvzI6dvtsYbae+XCu7uZ9+JCEhVULD1pwPSpHGLsRXt+Y
 MgiNw1woP80uL+SOMmuM31iXI7wutdc7VOCdBJ49oVmpbzLEvnF9LLVEbWQK6VlU74EN
 lK2N+JIf4nFmP7k4rpecW3F2mOBRoEA2jD15keZwRmOV9fiEspPzhVgTe/yq1sc+1Gno
 stOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bcdb9+/+AcWEckEkuoxNuUyFBTQkLyiHLCzbjRH2NRw=;
 b=E1z2fA51DrQlB/pdf+brYUm+dFXu7bwGMpfCMD7Esc4fQMGsrNO48UqJimrizzmVVY
 zI4WBIl1zgpG6mJoHGodtYHMM7cRvdBsRbMFHrKSOL5qX+kjD++gZlMWXLAjJVDRRUm0
 WozIT9PJQKA/Y8BPrSluO6+/swdBGsqbGSumlwiuVFAeINcAPFLYQjf8v0HO2Ir2BZny
 07o2Srbl0a5o4yvFmz5/LrG5LKMe2LJzgEE4gK1qhOUjd/A8O2kWoYrndpN2/bH/SCE0
 0LqlxwRv9uTVE1ljCFfINXf7VkrqMKWkeE+AjLk7lB9BfKtkc9cOVMGB+lPDhnMdUDFz
 /Hug==
X-Gm-Message-State: AJIora8N1OGgJQi/qAMVTXsJvQxJPvjzIdtOKaQ+cAvEmX1JA74zuamX
 1JX1Uk5eKV9N5TuvDQ6pRjWht4CBerQ=
X-Google-Smtp-Source: AGRyM1vFDOUzHGag5jDxhkfLr6NsOjFRv6IMXPnRpRkoXEFx9+kdt6pvEcgS9QRJXm/4JC++sks+Xg==
X-Received: by 2002:a17:90a:d3d8:b0:1f2:2cd:a1ca with SMTP id
 d24-20020a17090ad3d800b001f202cda1camr4628543pjw.135.1658928497184; 
 Wed, 27 Jul 2022 06:28:17 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 4/6] util/qemu-sockets: Enable unix socket support on
 Windows
Date: Wed, 27 Jul 2022 21:28:00 +0800
Message-Id: <20220727132802.812580-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Support for the unix socket has existed both in BSD and Linux for the
longest time, but not on Windows. Since Windows 10 build 17063 [1],
the native support for the unix socket has came to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

Introduce a new build time config option CONFIG_AF_UNIX when the build
host has such a capability, and a run-time check afunix_available() for
Windows host in the QEMU sockets util codes.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32

 meson.build               |  6 ++++++
 include/sysemu/os-win32.h |  4 ++++
 util/qemu-sockets.c       | 45 +++++++++++++++++++++++++++++++++------
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 75aaca8462..73e5de5957 100644
--- a/meson.build
+++ b/meson.build
@@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
   '''), error_message: 'AF_ALG requested but could not be detected').allowed()
 config_host_data.set('CONFIG_AF_ALG', have_afalg)
 
+if targetos != 'windows'
+  config_host_data.set('CONFIG_AF_UNIX', true)
+else
+  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
+endif
+
 config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
   'linux/vm_sockets.h', 'AF_VSOCK',
   prefix: '#include <sys/socket.h>',
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 1e324026a4..62aac7c930 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -30,6 +30,10 @@
 #include <windows.h>
 #include <ws2tcpip.h>
 
+#ifdef CONFIG_AF_UNIX
+# include <afunix.h>
+#endif
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 0e2298278f..c5c1c3bbaf 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -880,7 +880,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
 }
 #endif /* CONFIG_AF_VSOCK */
 
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
 
 static bool saddr_is_abstract(UnixSocketAddress *saddr)
 {
@@ -900,6 +900,23 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
 #endif
 }
 
+#ifdef CONFIG_WIN32
+/*
+ * AF_UNIX support is available since Windows 10 build 17063
+ * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
+ */
+#define WIN_BUILD_AF_UNIX 17063
+
+static bool afunix_available(void)
+{
+    OSVERSIONINFOEXW os_version = { 0 };
+
+    os_get_win_version(&os_version);
+
+    return os_version.dwBuildNumber >= WIN_BUILD_AF_UNIX;
+}
+#endif
+
 static int unix_listen_saddr(UnixSocketAddress *saddr,
                              int num,
                              Error **errp)
@@ -912,6 +929,13 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     size_t pathlen;
     size_t addrlen;
 
+#ifdef CONFIG_WIN32
+    if (!afunix_available()) {
+        error_setg(errp, "AF_UNIX is not available on your Windows");
+        return -1;
+    }
+#endif
+
     sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
         error_setg_errno(errp, errno, "Failed to create Unix socket");
@@ -1004,6 +1028,13 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
         return -1;
     }
 
+#ifdef CONFIG_WIN32
+    if (!afunix_available()) {
+        error_setg(errp, "AF_UNIX is not available on your Windows");
+        return -1;
+    }
+#endif
+
     sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
         error_setg_errno(errp, errno, "Failed to create socket");
@@ -1060,14 +1091,14 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
                              int num,
                              Error **errp)
 {
-    error_setg(errp, "unix sockets are not available on windows");
+    error_setg(errp, "unix sockets are not available on your host");
     errno = ENOTSUP;
     return -1;
 }
 
 static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
 {
-    error_setg(errp, "unix sockets are not available on windows");
+    error_setg(errp, "unix sockets are not available on your host");
     errno = ENOTSUP;
     return -1;
 }
@@ -1335,7 +1366,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_storage *sa,
 }
 
 
-#ifndef WIN32
+#ifdef CONFIG_AF_UNIX
 static SocketAddress *
 socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
                                 socklen_t salen,
@@ -1362,7 +1393,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
-#endif /* WIN32 */
+#endif /* CONFIG_AF_UNIX */
 
 #ifdef CONFIG_AF_VSOCK
 static SocketAddress *
@@ -1394,10 +1425,10 @@ socket_sockaddr_to_address(struct sockaddr_storage *sa,
     case AF_INET6:
         return socket_sockaddr_to_address_inet(sa, salen, errp);
 
-#ifndef WIN32
+#ifdef CONFIG_AF_UNIX
     case AF_UNIX:
         return socket_sockaddr_to_address_unix(sa, salen, errp);
-#endif /* WIN32 */
+#endif
 
 #ifdef CONFIG_AF_VSOCK
     case AF_VSOCK:
-- 
2.34.1


