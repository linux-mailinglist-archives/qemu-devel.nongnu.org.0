Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96B5AB16C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:31:01 +0200 (CEST)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6l8-0005xO-Kr
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6V8-00065c-NN
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6V6-0001wD-U9
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662124464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Qhey8UdkAuQpF4oKR1Sd+bmNkNumqxDJpDYRMIJmXQ=;
 b=TNDnLwsnv7RwGtnamZ2DPeC/esFpNu+ILLrg+msoSyfap5VuWd/qhkGD3FMtr1iKOY/hXD
 9QBDoonlyAV8IIH190le4NJ3kuNX84Vk3MDf8TGWTltf8BGogXSsZxoF0YTcCxhcBg6kUg
 HIlctJEPG5255rBd7IPxyrEI+DKoF7o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-t3aTfMbTNjahFNTCdFUL7w-1; Fri, 02 Sep 2022 09:14:21 -0400
X-MC-Unique: t3aTfMbTNjahFNTCdFUL7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF4FF29AB3E2;
 Fri,  2 Sep 2022 13:14:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 159561415125;
 Fri,  2 Sep 2022 13:14:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Subject: [PULL 1/4] util/qemu-sockets: Enable unix socket support on Windows
Date: Fri,  2 Sep 2022 17:14:09 +0400
Message-Id: <20220902131412.3125752-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
the native support for the unix socket has come to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220802075200.907360-3-bmeng.cn@gmail.com>
---
 meson.build               |  3 +++
 include/sysemu/os-win32.h | 17 +++++++++++++++++
 util/qemu-sockets.c       | 25 -------------------------
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index 20fddbd707..169b18a279 100644
--- a/meson.build
+++ b/meson.build
@@ -1890,6 +1890,9 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
+if targetos == 'windows'
+  config_host_data.set('HAVE_AFUNIX_H', cc.has_header('afunix.h'))
+endif
 
 # has_function
 config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index edc3b38a57..5b38c7bd04 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -30,6 +30,23 @@
 #include <windows.h>
 #include <ws2tcpip.h>
 
+#ifdef HAVE_AFUNIX_H
+#include <afunix.h>
+#else
+/*
+ * Fallback definitions of things we need in afunix.h, if not available from
+ * the used Windows SDK or MinGW headers.
+ */
+#define UNIX_PATH_MAX 108
+
+typedef struct sockaddr_un {
+    ADDRESS_FAMILY sun_family;
+    char sun_path[UNIX_PATH_MAX];
+} SOCKADDR_UN, *PSOCKADDR_UN;
+
+#define SIO_AF_UNIX_GETPEERPID _WSAIOR(IOC_VENDOR, 256)
+#endif
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 0e2298278f..83f4bd6fd2 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -880,8 +880,6 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
 }
 #endif /* CONFIG_AF_VSOCK */
 
-#ifndef _WIN32
-
 static bool saddr_is_abstract(UnixSocketAddress *saddr)
 {
 #ifdef CONFIG_LINUX
@@ -1054,25 +1052,6 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return -1;
 }
 
-#else
-
-static int unix_listen_saddr(UnixSocketAddress *saddr,
-                             int num,
-                             Error **errp)
-{
-    error_setg(errp, "unix sockets are not available on windows");
-    errno = ENOTSUP;
-    return -1;
-}
-
-static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
-{
-    error_setg(errp, "unix sockets are not available on windows");
-    errno = ENOTSUP;
-    return -1;
-}
-#endif
-
 /* compatibility wrapper */
 int unix_listen(const char *str, Error **errp)
 {
@@ -1335,7 +1314,6 @@ socket_sockaddr_to_address_inet(struct sockaddr_storage *sa,
 }
 
 
-#ifndef WIN32
 static SocketAddress *
 socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
                                 socklen_t salen,
@@ -1362,7 +1340,6 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
-#endif /* WIN32 */
 
 #ifdef CONFIG_AF_VSOCK
 static SocketAddress *
@@ -1394,10 +1371,8 @@ socket_sockaddr_to_address(struct sockaddr_storage *sa,
     case AF_INET6:
         return socket_sockaddr_to_address_inet(sa, salen, errp);
 
-#ifndef WIN32
     case AF_UNIX:
         return socket_sockaddr_to_address_unix(sa, salen, errp);
-#endif /* WIN32 */
 
 #ifdef CONFIG_AF_VSOCK
     case AF_VSOCK:
-- 
2.37.2


