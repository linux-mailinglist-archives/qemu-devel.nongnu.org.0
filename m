Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423603BC190
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:19:50 +0200 (CEST)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RK1-0000NB-9z
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1S-0001Ou-2l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1Q-0003gP-5S
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id u8so22622598wrq.8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0skwyYzRx8lw1Lptcw6cX8ImdqPgrLgTWanS4XnbGr4=;
 b=tYctCtxnpL+oioJbWglLMDYDztY/fQnoHN/EpaG/dgqn8JiI1hfNSeP60NTGteIlrT
 yDYJiSvlXSMNu1idDUceTztQmXqt7WmdnrdGjZjQkGjiVx1MeqGDfQ6n8wyekkBRVjE3
 KG3RhiUFsOxFHVuaWjtLdtzw56XrEur0jlvWm7zN0A+CgT0Aaw3s1H5Y/1ugcrz5Tiim
 Iw1qd/WwZuzxT/L8JKF/r2i/PS7uqU73xTaLA2H6KP0PyCTQV55oE2KyYR5SZwKlESq8
 56yRzKG68KFVthmp0ufepKTkAAMpqxOJ1xcciLX2c5vLJtg2cY7f0cn8tuO/xRcW9rqe
 aQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0skwyYzRx8lw1Lptcw6cX8ImdqPgrLgTWanS4XnbGr4=;
 b=oNdMpxe4Hur/9OZBYtnRo144QyGmnXmNmv6m8jD2ZNz4DZGyMk1jYjC987su9GsuMl
 bPFkvcqBimBO8O5eothM9tCAivi+3nO4bEQw8F9L5Z4yItsw9jxr0YRiHqNZf4RuIE6o
 tA9m4Z7WMd82PK5jw76ic+QgHMvzppMiIOXYXKJcbV0jSrj0SinRmhpD1pAvaIUMhzSW
 vT/w7If6XTvBrin6rWpBNxh4A1YWSQw3XK/xTN7AyGwTjcxd13OXZNRsu+5euJB2lLOA
 0BWz/q/af40qzKi+gv3/0f93hdQTYbEGbKqtHC7wPUarDAzlJoEml4+aAhTSLbjEGVvB
 cDRA==
X-Gm-Message-State: AOAM530qzD7F1nklKnOx9bupim90gShhSGSWPHzfZCAFAFXDfZGgF1zv
 eH2/e7vABBFY+V6wuAA4zSF/ieN+gXE=
X-Google-Smtp-Source: ABdhPJwWCtni8FtbupdqamfsAIrMwMedT3gkg6tgvMgQFUNxxj3b8INtD5FkDXASjvV9Ndud8RHmMA==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr17037239wru.266.1625500831470; 
 Mon, 05 Jul 2021 09:00:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] configure: convert compiler tests to meson, part 5
Date: Mon,  5 Jul 2021 18:00:17 +0200
Message-Id: <20210705160018.241397-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 101 ----------------------------------------------------
 meson.build |  26 ++++++++++++++
 2 files changed, 26 insertions(+), 101 deletions(-)

diff --git a/configure b/configure
index 83168ceb52..1cac47399d 100755
--- a/configure
+++ b/configure
@@ -3395,92 +3395,6 @@ EOF
   fi
 fi
 
-# Check for inotify functions when we are building linux-user
-# emulator.  This is done because older glibc versions don't
-# have syscall stubs for these implemented.  In that case we
-# don't provide them even if kernel supports them.
-#
-inotify=no
-cat > $TMPC << EOF
-#include <sys/inotify.h>
-
-int
-main(void)
-{
-	/* try to start inotify */
-	return inotify_init();
-}
-EOF
-if compile_prog "" "" ; then
-  inotify=yes
-fi
-
-inotify1=no
-cat > $TMPC << EOF
-#include <sys/inotify.h>
-
-int
-main(void)
-{
-    /* try to start inotify */
-    return inotify_init1(0);
-}
-EOF
-if compile_prog "" "" ; then
-  inotify1=yes
-fi
-
-# check if pipe2 is there
-pipe2=no
-cat > $TMPC << EOF
-#include <unistd.h>
-#include <fcntl.h>
-
-int main(void)
-{
-    int pipefd[2];
-    return pipe2(pipefd, O_CLOEXEC);
-}
-EOF
-if compile_prog "" "" ; then
-  pipe2=yes
-fi
-
-# check if accept4 is there
-accept4=no
-cat > $TMPC << EOF
-#include <sys/socket.h>
-#include <stddef.h>
-
-int main(void)
-{
-    accept4(0, NULL, NULL, SOCK_CLOEXEC);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  accept4=yes
-fi
-
-# check if tee/splice is there. vmsplice was added same time.
-splice=no
-cat > $TMPC << EOF
-#include <unistd.h>
-#include <fcntl.h>
-#include <limits.h>
-
-int main(void)
-{
-    int len, fd = 0;
-    len = tee(STDIN_FILENO, STDOUT_FILENO, INT_MAX, SPLICE_F_NONBLOCK);
-    splice(STDIN_FILENO, NULL, fd, NULL, len, SPLICE_F_MOVE);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  splice=yes
-fi
-
 ##########################################
 # libnuma probe
 
@@ -4720,24 +4634,9 @@ fi
 if test "$module_upgrades" = "yes"; then
   echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
 fi
-if test "$pipe2" = "yes" ; then
-  echo "CONFIG_PIPE2=y" >> $config_host_mak
-fi
-if test "$accept4" = "yes" ; then
-  echo "CONFIG_ACCEPT4=y" >> $config_host_mak
-fi
-if test "$splice" = "yes" ; then
-  echo "CONFIG_SPLICE=y" >> $config_host_mak
-fi
 if test "$have_usbfs" = "yes" ; then
   echo "CONFIG_USBFS=y" >> $config_host_mak
 fi
-if test "$inotify" = "yes" ; then
-  echo "CONFIG_INOTIFY=y" >> $config_host_mak
-fi
-if test "$inotify1" = "yes" ; then
-  echo "CONFIG_INOTIFY1=y" >> $config_host_mak
-fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
diff --git a/meson.build b/meson.build
index cb50a2e473..12162264db 100644
--- a/meson.build
+++ b/meson.build
@@ -1268,6 +1268,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 
 # has_function
+config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
 config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
@@ -1302,6 +1303,10 @@ config_host_data.set('CONFIG_FIEMAP',
 config_host_data.set('CONFIG_GETRANDOM',
                      cc.has_function('getrandom') and
                      cc.has_header_symbol('sys/random.h', 'GRND_NONBLOCK'))
+config_host_data.set('CONFIG_INOTIFY',
+                     cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
+config_host_data.set('CONFIG_INOTIFY1',
+                     cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
@@ -1345,6 +1350,15 @@ config_host_data.set('CONFIG_MADVISE', cc.compiles(gnu_source_prefix + '''
 config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + '''
   #include <sys/mman.h>
   int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
+config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
+  #include <unistd.h>
+  #include <fcntl.h>
+
+  int main(void)
+  {
+      int pipefd[2];
+      return pipe2(pipefd, O_CLOEXEC);
+  }'''))
 config_host_data.set('CONFIG_POSIX_MADVISE', cc.compiles(gnu_source_prefix + '''
   #include <sys/mman.h>
   #include <stddef.h>
@@ -1354,6 +1368,18 @@ config_host_data.set('CONFIG_SIGNALFD', cc.compiles(gnu_source_prefix + '''
   #include <sys/syscall.h>
   #include <signal.h>
   int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }'''))
+config_host_data.set('CONFIG_SPLICE', cc.compiles(gnu_source_prefix + '''
+  #include <unistd.h>
+  #include <fcntl.h>
+  #include <limits.h>
+
+  int main(void)
+  {
+    int len, fd = 0;
+    len = tee(STDIN_FILENO, STDOUT_FILENO, INT_MAX, SPLICE_F_NONBLOCK);
+    splice(STDIN_FILENO, NULL, fd, NULL, len, SPLICE_F_MOVE);
+    return 0;
+  }'''))
 
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
-- 
2.31.1



