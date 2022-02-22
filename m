Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8A4C0287
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:57:01 +0100 (CET)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbHR-0007gQ-21
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb2E-0000eN-VE
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb2C-00087z-4R
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTfNeWPydV5g86yz9X2u2/n0vX4tO6eXuYRLrtLmj+M=;
 b=TWiaePvZX/icFbIzQP6FC+hFKWqpyu700ybJF+ASDw/ncQpfopeJkj3We2hJwwSVMnyU/n
 VN/wlVTC9RqEjIw+BcL5qjqYX6xuw8VMh72RRZQivrGrSVw65oVlO9DXeClvzA5fjrRvKh
 Ab+I4Jc4prJxj+++KvEKm+ms4NA3Tsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-4VJ3ex0-PoqBGK9Hm-jDNA-1; Tue, 22 Feb 2022 14:41:08 -0500
X-MC-Unique: 4VJ3ex0-PoqBGK9Hm-jDNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41586501E0;
 Tue, 22 Feb 2022 19:41:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B26F045D71;
 Tue, 22 Feb 2022 19:41:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
Date: Tue, 22 Feb 2022 23:40:06 +0400
Message-Id: <20220222194008.610377-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only needed by char-pty.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h |   2 -
 chardev/char-pty.c    | 104 +++++++++++++++++++++++++++++++
 util/qemu-openpty.c   | 139 ------------------------------------------
 chardev/meson.build   |   4 +-
 util/meson.build      |   1 -
 5 files changed, 106 insertions(+), 144 deletions(-)
 delete mode 100644 util/qemu-openpty.c

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 68b2e3bc1091..0248a324cdcd 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -33,8 +33,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
-/* like openpty() but also makes it raw; return master fd */
-int qemu_openpty_raw(int *aslave, char *pty_name);
 #endif
 
 #ifdef _WIN32
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c985bc..f28779bcc9d2 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -197,6 +197,110 @@ static void char_pty_finalize(Object *obj)
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
 }
 
+#if defined HAVE_PTY_H
+# include <pty.h>
+#elif defined CONFIG_BSD
+# include <termios.h>
+# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+#  include <libutil.h>
+# else
+#  include <util.h>
+# endif
+#elif defined CONFIG_SOLARIS
+# include <termios.h>
+# include <stropts.h>
+#else
+# include <termios.h>
+#endif
+
+#ifdef __sun__
+
+#if !defined(HAVE_OPENPTY)
+/* Once illumos has openpty(), this is going to be removed. */
+static int openpty(int *amaster, int *aslave, char *name,
+                   struct termios *termp, struct winsize *winp)
+{
+        const char *slave;
+        int mfd = -1, sfd = -1;
+
+        *amaster = *aslave = -1;
+
+        mfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
+        if (mfd < 0)
+                goto err;
+
+        if (grantpt(mfd) == -1 || unlockpt(mfd) == -1)
+                goto err;
+
+        if ((slave = ptsname(mfd)) == NULL)
+                goto err;
+
+        if ((sfd = open(slave, O_RDONLY | O_NOCTTY)) == -1)
+                goto err;
+
+        if (ioctl(sfd, I_PUSH, "ptem") == -1 ||
+            (termp != NULL && tcgetattr(sfd, termp) < 0))
+                goto err;
+
+        *amaster = mfd;
+        *aslave = sfd;
+
+        if (winp)
+                ioctl(sfd, TIOCSWINSZ, winp);
+
+        return 0;
+
+err:
+        if (sfd != -1)
+                close(sfd);
+        close(mfd);
+        return -1;
+}
+#endif
+
+static void cfmakeraw (struct termios *termios_p)
+{
+        termios_p->c_iflag &=
+                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
+        termios_p->c_oflag &= ~OPOST;
+        termios_p->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
+        termios_p->c_cflag &= ~(CSIZE|PARENB);
+        termios_p->c_cflag |= CS8;
+
+        termios_p->c_cc[VMIN] = 0;
+        termios_p->c_cc[VTIME] = 0;
+}
+#endif
+
+/* like openpty() but also makes it raw; return master fd */
+static int qemu_openpty_raw(int *aslave, char *pty_name)
+{
+    int amaster;
+    struct termios tty;
+#if defined(__OpenBSD__) || defined(__DragonFly__)
+    char pty_buf[PATH_MAX];
+#define q_ptsname(x) pty_buf
+#else
+    char *pty_buf = NULL;
+#define q_ptsname(x) ptsname(x)
+#endif
+
+    if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
+        return -1;
+    }
+
+    /* Set raw attributes on the pty. */
+    tcgetattr(*aslave, &tty);
+    cfmakeraw(&tty);
+    tcsetattr(*aslave, TCSAFLUSH, &tty);
+
+    if (pty_name) {
+        strcpy(pty_name, q_ptsname(amaster));
+    }
+
+    return amaster;
+}
+
 static void char_pty_open(Chardev *chr,
                           ChardevBackend *backend,
                           bool *be_opened,
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
deleted file mode 100644
index 427f43a76973..000000000000
--- a/util/qemu-openpty.c
+++ /dev/null
@@ -1,139 +0,0 @@
-/*
- * qemu-openpty.c
- *
- * Copyright (c) 2003-2008 Fabrice Bellard
- * Copyright (c) 2010 Red Hat, Inc.
- *
- * Wrapper function qemu_openpty() implementation.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-/*
- * This is not part of oslib-posix.c because this function
- * uses openpty() which often in -lutil, and if we add this
- * dependency to oslib-posix.o, every app will have to be
- * linked with -lutil.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-
-#if defined HAVE_PTY_H
-# include <pty.h>
-#elif defined CONFIG_BSD
-# include <termios.h>
-# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
-#  include <libutil.h>
-# else
-#  include <util.h>
-# endif
-#elif defined CONFIG_SOLARIS
-# include <termios.h>
-# include <stropts.h>
-#else
-# include <termios.h>
-#endif
-
-#ifdef __sun__
-
-#if !defined(HAVE_OPENPTY)
-/* Once illumos has openpty(), this is going to be removed. */
-static int openpty(int *amaster, int *aslave, char *name,
-                   struct termios *termp, struct winsize *winp)
-{
-        const char *slave;
-        int mfd = -1, sfd = -1;
-
-        *amaster = *aslave = -1;
-
-        mfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
-        if (mfd < 0)
-                goto err;
-
-        if (grantpt(mfd) == -1 || unlockpt(mfd) == -1)
-                goto err;
-
-        if ((slave = ptsname(mfd)) == NULL)
-                goto err;
-
-        if ((sfd = open(slave, O_RDONLY | O_NOCTTY)) == -1)
-                goto err;
-
-        if (ioctl(sfd, I_PUSH, "ptem") == -1 ||
-            (termp != NULL && tcgetattr(sfd, termp) < 0))
-                goto err;
-
-        *amaster = mfd;
-        *aslave = sfd;
-
-        if (winp)
-                ioctl(sfd, TIOCSWINSZ, winp);
-
-        return 0;
-
-err:
-        if (sfd != -1)
-                close(sfd);
-        close(mfd);
-        return -1;
-}
-#endif
-
-static void cfmakeraw (struct termios *termios_p)
-{
-        termios_p->c_iflag &=
-                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
-        termios_p->c_oflag &= ~OPOST;
-        termios_p->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
-        termios_p->c_cflag &= ~(CSIZE|PARENB);
-        termios_p->c_cflag |= CS8;
-
-        termios_p->c_cc[VMIN] = 0;
-        termios_p->c_cc[VTIME] = 0;
-}
-#endif
-
-int qemu_openpty_raw(int *aslave, char *pty_name)
-{
-    int amaster;
-    struct termios tty;
-#if defined(__OpenBSD__) || defined(__DragonFly__)
-    char pty_buf[PATH_MAX];
-#define q_ptsname(x) pty_buf
-#else
-    char *pty_buf = NULL;
-#define q_ptsname(x) ptsname(x)
-#endif
-
-    if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
-        return -1;
-    }
-
-    /* Set raw attributes on the pty. */
-    tcgetattr(*aslave, &tty);
-    cfmakeraw(&tty);
-    tcsetattr(*aslave, TCSAFLUSH, &tty);
-
-    if (pty_name) {
-        strcpy(pty_name, q_ptsname(amaster));
-    }
-
-    return amaster;
-}
diff --git a/chardev/meson.build b/chardev/meson.build
index 325ba2bdb97d..664f77b8879a 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -12,11 +12,11 @@ chardev_ss.add(files(
   'char-udp.c',
   'char.c',
 ))
-chardev_ss.add(when: 'CONFIG_POSIX', if_true: files(
+chardev_ss.add(when: 'CONFIG_POSIX', if_true: [files(
   'char-fd.c',
   'char-parallel.c',
   'char-pty.c',
-))
+), util])
 chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'char-console.c',
   'char-win-stdio.c',
diff --git a/util/meson.build b/util/meson.build
index 3736988b9f6e..d6263ccc1b82 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -12,7 +12,6 @@ util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
-util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'), util])
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('aio-win32.c'))
-- 
2.35.1.273.ge6ebfd0e8cbb


