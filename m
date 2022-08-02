Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4D58793D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:43:08 +0200 (CEST)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInUZ-0006sp-8W
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhS-0006zc-R3
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:23 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhH-0007bC-QJ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:20 -0400
Received: by mail-pf1-x430.google.com with SMTP id 130so5021042pfv.13
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HRVFtqjOEbn7bP+6aECBAKJ4Nuu9yVF32ANVebo29JQ=;
 b=Ej1MDnz1W4pF89gz5RRRZZnhGdyAfQanfCWPRa75ugs1669QPfMRPDb23lCuxXaKzD
 uRq8mzJ7TU3t8sOqGrtp3dGpcvQfAjWlvLGLynopQ8jFxtR779eRYiIpwjmL6VCQj5HJ
 V9ugRe05FIz3j8v6+iI1Rv2/1iTa29rvzAmlkb2g3FQTvY1Pvho8Ok3ivxIlqRPmSb7e
 QNgSeFBtwbn0jIZtfZptgzQWTev1jfMk0cG0HGzu8kTPm6cFpkE7VDKIk+g28bJbrFz5
 2+IvGfZQb1cExhFJ3Nu0iE95LGiTkeXoGP1X4T311JC1sCrHEZElparViGL+7564Mto8
 fgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRVFtqjOEbn7bP+6aECBAKJ4Nuu9yVF32ANVebo29JQ=;
 b=OD0WW8/11kkRRi3nTZIuTr5nacrYeIPsKhkQbl/cECT3s9VYiXodWegRJcecRwmngC
 C8HZmbcySGW/OOJfNp/RnJBcEvcU4ZbTZ4wKXIv1ZYVz1O2bm8SoxWvYHMnNKBHKIMOT
 MlGMNbNojelGL15NVEJS/HfcStE4UcQM85dfHdUxmDYfth89ZeqOtRJUTHn4LtyHHxhr
 MvvxxcVT/A2wjcIKfAKgRSUjBXU54ZUaf+YzSs0x9RCQ9kjSeEKtsSe263UBS4e6lAyz
 L+b4fVu2LRQZBjG3B32CtsKfVj6WIoXvRx19ugpKLTVjuwWUeJfY5kxbj3wSGALUJSoZ
 n5Sw==
X-Gm-Message-State: ACgBeo3cwMJPNf/ym9xVoWiPRejW9bbqinYhMooMWHAyyv9Z/E5ApbH8
 qGL6g1v5yvAyR2DEqqaH12Z6ylZQ2Dc=
X-Google-Smtp-Source: AA6agR4JQD+SMQffUbWvntLMnN86eD93AQDFnnJa/kJbsOxYW+kRvKWwF1EWtdzsWx+hTwYydGgVgA==
X-Received: by 2002:a63:8849:0:b0:41c:4216:d03c with SMTP id
 l70-20020a638849000000b0041c4216d03cmr4078591pgd.563.1659426730046; 
 Tue, 02 Aug 2022 00:52:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79613000000b0052d92ccaad9sm3226098pfg.131.2022.08.02.00.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:52:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v4 2/4] util/qemu-sockets: Enable unix socket support on
 Windows
Date: Tue,  2 Aug 2022 15:51:58 +0800
Message-Id: <20220802075200.907360-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802075200.907360-1-bmeng.cn@gmail.com>
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
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
the native support for the unix socket has come to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header
  in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts

Changes in v3:
- drop the run-time check afunix_available()

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32

 meson.build               |  3 +++
 include/sysemu/os-win32.h | 17 +++++++++++++++++
 util/qemu-sockets.c       | 25 -------------------------
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index 294e9a8f32..6749223f1a 100644
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
2.34.1


