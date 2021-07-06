Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD313BCA01
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:33:29 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iOO-0001ag-IN
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu4-0001Od-B7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu2-0002S7-6P
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t6so15432202wrm.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0skwyYzRx8lw1Lptcw6cX8ImdqPgrLgTWanS4XnbGr4=;
 b=HAL3t1uDlb+lF7GKRHQuzGc0UAe2VQVES0d71qLyp9MNcOxkwtRkA3tVAy3FXBmRo8
 91fvxlA4L3KAXSqJpOXTSfs0yIAl/Sp8b0HSS69ac2Xq/gT7TBCiBGsvrmxv4KP/eNuk
 tQu3nCOURPQpnMmlv9VMbyZMFMVH1QJ8PcRJiy7TUrPZTRXCNIeeXGqjAqdqaHBA8yy2
 nVcRgEs/zy/MCX9kz+0N6yhlIuAnSDIcLVyxnAr7hV8BGRwqRF6emVM2FoDXhip1vy7B
 /ONc8VsLwnbUxSc/6WaxFqdBFyVEEwPF7HMK1iM3c0ny7EZpuUMrbi9wQ1pKLjjm2SiG
 /RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0skwyYzRx8lw1Lptcw6cX8ImdqPgrLgTWanS4XnbGr4=;
 b=X4uPvowyZPG1LvKArl2qD8jJ0dF58KkGokUnipZgXKFGcPVCtChl10YqK+IxWRo7VT
 eo2zkxz+PYzmIS/agUDKALnWRUz1Q5OURe5MMj1oQPqIFDH2Adfesopt6Q4E1U/GojEr
 uWTXcI7IJurp/mnzcJhuxKeRT8nrfgKe8o7WnVend8Epw3V6fRTswTKN3ftZUBb2WUrG
 DMARnfhwXx5NjVRz4FT5ALmGvbvJKIdbauTaHDMOHhQUpwvCeCKZ8w+BFUGLSFFCSXkD
 veQWYB0/C19mQSdMwlsFKFRqHHwIBHMzhRf5kMHYBoWdRY37hxEfziX7bDWbpoS+TF7d
 So5w==
X-Gm-Message-State: AOAM530op+//e37oWu0tiysXnyTdcauBj/FN6L2bnYkawfh7ihug0pr8
 rK/1hiAr1wqxq6Ihm84MM56UBqbZuRQ=
X-Google-Smtp-Source: ABdhPJz1MNzIhxz5shObM4gQIrm95v4R5hbYoKEci4/4no5q9BUDI5Dne1TDjzSZeyWAyTRtc1VSyQ==
X-Received: by 2002:a05:6000:81:: with SMTP id
 m1mr20650450wrx.322.1625565724489; 
 Tue, 06 Jul 2021 03:02:04 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/40] configure: convert compiler tests to meson, part 5
Date: Tue,  6 Jul 2021 12:01:32 +0200
Message-Id: <20210706100141.303960-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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



