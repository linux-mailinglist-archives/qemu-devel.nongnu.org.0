Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BF4DAE5C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:40:33 +0100 (CET)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUR4y-0001VG-Ap
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:40:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKi-0008WT-OT
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKg-0007iC-Oy
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xLLK+HAfMTIKPQNQF8sSanhfo+X16yzyjw8OkjEnCUk=;
 b=W99d8YiYV2q2tZwdwuH5cpf7KFYre12cx5I7LFQMddtbWBkzcNtyNlwIlMecQ6liuXRSOV
 EdULkjgweaFQdnrw7iyIu2vmIS8vgMBUH9V2mZCTvzEzNuvKkVMUGbn7RWnyKuJuxShWis
 B7vjfriwr9rvxcd00ld2oiDoaKUaWtk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-Njq_YsLSNnytxMVDd0ZuGA-1; Wed, 16 Mar 2022 05:52:40 -0400
X-MC-Unique: Njq_YsLSNnytxMVDd0ZuGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E8A3811F22
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:52:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54F65112C087;
 Wed, 16 Mar 2022 09:52:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 05/27] char: move qemu_openpty_raw from util/ to char/
Date: Wed, 16 Mar 2022 13:52:36 +0400
Message-Id: <20220316095236.2613573-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only needed by char-pty.

Fix the code style while at it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h |   2 -
 chardev/char-pty.c    | 111 +++++++++++++++++++++++++++++++++
 util/qemu-openpty.c   | 139 ------------------------------------------
 chardev/meson.build   |   4 +-
 util/meson.build      |   1 -
 5 files changed, 113 insertions(+), 144 deletions(-)
 delete mode 100644 util/qemu-openpty.c

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 8c0d9ab0f771..c9f7dd7e193a 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -31,8 +31,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
-/* like openpty() but also makes it raw; return master fd */
-int qemu_openpty_raw(int *aslave, char *pty_name);
 #endif
 
 #ifdef _WIN32
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c985bc..d73d8b23903d 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -197,6 +197,117 @@ static void char_pty_finalize(Object *obj)
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
+    const char *slave;
+    int mfd = -1, sfd = -1;
+
+    *amaster = *aslave = -1;
+
+    mfd = open("/dev/ptmx", O_RDWR | O_NOCTTY);
+    if (mfd < 0) {
+        goto err;
+    }
+
+    if (grantpt(mfd) == -1 || unlockpt(mfd) == -1) {
+        goto err;
+    }
+
+    if ((slave = ptsname(mfd)) == NULL) {
+        goto err;
+    }
+
+    if ((sfd = open(slave, O_RDONLY | O_NOCTTY)) == -1) {
+        goto err;
+    }
+
+    if (ioctl(sfd, I_PUSH, "ptem") == -1 ||
+        (termp != NULL && tcgetattr(sfd, termp) < 0)) {
+        goto err;
+    }
+
+    *amaster = mfd;
+    *aslave = sfd;
+
+    if (winp) {
+        ioctl(sfd, TIOCSWINSZ, winp);
+    }
+
+    return 0;
+
+err:
+    if (sfd != -1) {
+        close(sfd);
+    }
+    close(mfd);
+    return -1;
+}
+#endif
+
+static void cfmakeraw (struct termios *termios_p)
+{
+    termios_p->c_iflag &=
+        ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON);
+    termios_p->c_oflag &= ~OPOST;
+    termios_p->c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
+    termios_p->c_cflag &= ~(CSIZE | PARENB);
+    termios_p->c_cflag |= CS8;
+
+    termios_p->c_cc[VMIN] = 0;
+    termios_p->c_cc[VTIME] = 0;
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
index bb0b010662d7..f8f0643318c3 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -16,7 +16,6 @@ if targetos == 'freebsd'
   freebsd_dep = util
 endif
 util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep])
-util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'), util])
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('aio-win32.c'))
-- 
2.35.1.273.ge6ebfd0e8cbb


