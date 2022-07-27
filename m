Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC91582178
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:47:26 +0200 (CEST)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGblN-0001FN-04
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaO-00064Z-En
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaL-0002It-FZ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:36:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p8so15412605plq.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7rLye0exZ0yQucdqCIrvg6cLevXh7qsl3mNWHbKQN8=;
 b=B+VEkWlF9lCZFlORz91+qenCrN/JMuBTPyetKcwPcxAikrJqIuFviqjt9s9o99JnS+
 w93/Gr8iA4E1jRCeJo2QEgRfSCY/X0Y6LwZ7rBHDqqF+jiKGKzpCZCMHZ/fKiev11uh1
 RDNZ/Tp5SkzuFE+6B47ho8DXNgChJAs85fPHwSxMf3tRDAMD7sHS4e08YnQd4KNO9Oil
 nKk89jDCGz7svG2MA9NK+fJD2CPnBJ0AwcaGNm45ylNbtu4dQ1HhpmbrxxrDR/W6JWOh
 yH2HvorKq+sMx6JQv4ZE6V8buoSgxxSl3ttvGO1HnIz3FhyAS0RJESR7JI82KAp2UKxC
 +UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7rLye0exZ0yQucdqCIrvg6cLevXh7qsl3mNWHbKQN8=;
 b=pJDTAXnCMPyU4ShETh2R6vMmTqhJ3iCS9FQBV/XxWJpd/eNKIxL8KcgxobUlKVqZ+t
 NxmeROB++QkLVR7wKH5dh8lK8lz9L6Mb3exYd2tRRUxOs6Qi3B6+MYYj2/kY5uz//iL6
 Pwui8qK14a7NfvrpzI+MfjLKYJdlyfVpXBSc3++/V0asSKQo+vIMAWIpAxb6VOjRSz/u
 QWE7rCIOM9Q+oImzuE+kKP9Bx39OHjcMofLUxptJFZ0ncQPhoxim15OeDn1g1FezcYH2
 6gEEWiv87KnDm5l5C3c8Lblpy22FKMPx22Adn/rv1kk5/UQ6e+f4tCn9vgM6OAheSA3b
 rRMw==
X-Gm-Message-State: AJIora/RYGCvbQHiEFJr5AGsKqm58ocMb7w99mgglocwegC4LHUX0CxM
 npRlV5SwSV/0c5dUP50flbGXWJjuBbQ=
X-Google-Smtp-Source: AGRyM1vlNvaMcuehO9PYsVaE130cR9X66A59l1DqAz83uBA817VeL2Vx9GUVWaGGr+Wt16E9n4vU5Q==
X-Received: by 2002:a17:902:c992:b0:16d:710d:8add with SMTP id
 g18-20020a170902c99200b0016d710d8addmr13301362plc.0.1658907360031; 
 Wed, 27 Jul 2022 00:36:00 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:35:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on Windows
Date: Wed, 27 Jul 2022 15:35:41 +0800
Message-Id: <20220727073542.811420-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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

 meson.build         |  6 ++++++
 util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 47 insertions(+), 7 deletions(-)

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
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 0e2298278f..d85f3ea3ee 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -17,6 +17,15 @@
  */
 #include "qemu/osdep.h"
 
+#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
+# include <afunix.h>
+/*
+ * AF_UNIX support is available since Windows 10 build 17063
+ * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
+ */
+# define WIN_BUILD_AF_UNIX 17063
+#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
+
 #ifdef CONFIG_AF_VSOCK
 #include <linux/vm_sockets.h>
 #endif /* CONFIG_AF_VSOCK */
@@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
 }
 #endif /* CONFIG_AF_VSOCK */
 
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
 
 static bool saddr_is_abstract(UnixSocketAddress *saddr)
 {
@@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
 #endif
 }
 
+#ifdef CONFIG_WIN32
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
@@ -912,6 +932,13 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
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
@@ -1004,6 +1031,13 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
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
@@ -1060,14 +1094,14 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
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
@@ -1335,7 +1369,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_storage *sa,
 }
 
 
-#ifndef WIN32
+#ifdef CONFIG_AF_UNIX
 static SocketAddress *
 socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
                                 socklen_t salen,
@@ -1362,7 +1396,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
-#endif /* WIN32 */
+#endif /* CONFIG_AF_UNIX */
 
 #ifdef CONFIG_AF_VSOCK
 static SocketAddress *
@@ -1394,10 +1428,10 @@ socket_sockaddr_to_address(struct sockaddr_storage *sa,
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


