Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F450644A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:15:54 +0200 (CEST)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngh9V-00051S-A5
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglo-00017q-6T
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglk-0004O9-Ow
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso775027wme.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWxbtXPu+1/+uxFsKOOb95XBhCbVBGurTpR36AxoHwQ=;
 b=EUjvGJjc6oDrSAl2wpYQV2tjO4Y2R/0ilPj4cNrVY0+erusofALsAABxgT0IG/Tk6p
 JnaRdeoaXlL0JfotXxOd/JjQ+OpD0zPuIzhvP6HjGoChdOaNMe+7dSxHBaSVkUxFqAVD
 ofZk9wsx0QgCiLE9FvkDXohpmwUHsgd0gpnTdZK4XRghintncLIa44dZpXuNou8GGYPu
 bXkOB9jLjtzWJ+TAmt+6w4Gi9jOKBZaoEz6uWx3c5kux1bwjgA+plFb7N4BaMQAM38By
 rglSykU6l+o6fbnOw12IVEdOgR01cHZqglXH8m5jmXKOs3H14d49NtqY0Zve1VxNbeiS
 ZK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TWxbtXPu+1/+uxFsKOOb95XBhCbVBGurTpR36AxoHwQ=;
 b=Vjb/3Fv8pRqz4IeBqGplaj5cT4fmdIcG1/bPy9YMZRbz24IDKWrP7NLljv2KqUDEX5
 xkbJLsH7psdtFnwcx+O3Y2+FCH3gmG/4X84zX0OdICCWKq9NumY8oF9zQmxMoMUebsmy
 4KaztFJ/wM0ELffwvKynvZZoVUw3wqw2CLUGNztddcFoy30naT2oGkFAUzcg41l09unL
 tvURQGYuwRI+es/9j0X2urVODhgZhQiqSTz/I3ogDUuAfJYbgEUqfY7vvxDF8UeqN7LW
 J+XRbhOR45WO1xYamM6BFgbX40gtJT8tnM7aDPZ8xGdHWYazkWhZtuyb2zUWVxksAt5o
 PKaQ==
X-Gm-Message-State: AOAM532IQJ8NTjIt1Za3VIUCWs09oqkBKuL0NvI1hqsZdHpBh//nFjWi
 zVSE9SeGazrCaBjeNtGtPf5fn9bX261vEA==
X-Google-Smtp-Source: ABdhPJyML9EqzF9tCUzd5JlxUZWvuVu8O4qaVyGdHc0jP8cDzlV2sh7XoUGElc3QeP2KDync5QKtKA==
X-Received: by 2002:a1c:4e03:0:b0:38e:d730:11eb with SMTP id
 g3-20020a1c4e03000000b0038ed73011ebmr14660826wmh.191.1650347479007; 
 Mon, 18 Apr 2022 22:51:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/53] char: move qemu_openpty_raw from util/ to char/
Date: Tue, 19 Apr 2022 07:50:26 +0200
Message-Id: <20220419055109.142788-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only needed by char-pty.

Fix the code style while at it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-6-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-pty.c    | 111 +++++++++++++++++++++++++++++++++
 chardev/meson.build   |   4 +-
 include/qemu-common.h |   2 -
 util/meson.build      |   1 -
 util/qemu-openpty.c   | 139 ------------------------------------------
 5 files changed, 113 insertions(+), 144 deletions(-)
 delete mode 100644 util/qemu-openpty.c

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c985..d73d8b2390 100644
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
diff --git a/chardev/meson.build b/chardev/meson.build
index 325ba2bdb9..664f77b887 100644
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
diff --git a/include/qemu-common.h b/include/qemu-common.h
index f0fe07cd74..f9b3f85b81 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -31,8 +31,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
-/* like openpty() but also makes it raw; return master fd */
-int qemu_openpty_raw(int *aslave, char *pty_name);
 #endif
 
 void cpu_exec_init_all(void);
diff --git a/util/meson.build b/util/meson.build
index bb0b010662..f8f0643318 100644
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
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
deleted file mode 100644
index 427f43a769..0000000000
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
-- 
2.35.1



