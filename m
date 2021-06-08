Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46C39F50D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:34:12 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZzm-0003PR-1r
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpQ-00071X-Bk
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpO-00088C-K5
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id l9so1610373wms.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6KgIoYBMJpHpXaS8pJvWzbEpMSL2UNGph/MLhTPZFs=;
 b=GWNBDPGEnz+SjiYVglAjIIn1bu1l19zBCHeOy9WXzSyw1kxvTyPJWkPdhOg/H/Fl/a
 b94wQPq8RIR5I9rQN2iCefEkA3YA3rL8a49sF9d40QqLJFYFsKjWxfiO3MMtRBtYC2L4
 zJr5nstsGIg+ZBmU26eNUa5L1Pke8LaQ0PSZldMvkxYvH+IxzluXjT6C/yhmuwYnD74S
 eHV/ULi3dvpnsBtFNcNyI7fNFCqIllMzfXiKmWaMBL5W5kinKPMT92/2Gy3m27EZgjq+
 hT8nOEJiR1W3BlmkLhXX4hJGrxY5u4j9IDNtz081S5C1aOBpLBiG0xqf2XfWR+GfyzD6
 kqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+6KgIoYBMJpHpXaS8pJvWzbEpMSL2UNGph/MLhTPZFs=;
 b=f0XkPfvDrdsA4rfamuQM2r8lTbwudds4m3P1SikqBPGh67ME2bmVWJ8Xsrjyq0wwAD
 NaiiFavX2Ucr5nj1Jvw2d54WT+Zlz4+eMhfbca0gAKn6k4TtD67XHBeHPTBKVlbR62P1
 xP6Ef0Aj236PDj2z7Ql+luRkhV5Tu4N33jxRG/ua6glNAAUdnF0qGH72a8pAxsEJNTN0
 x3P6BdWWC5+8Z3c4vhyGDSV/npLVuw4N32aV1+Km1pxTUsNuTK1cnS+7cXNjl/KZEI1T
 we6VSU+3+UV0HwEBBvG9cNv685us2/2gwyPtK2mOn5Db2IhCmzRmwhKZow5a87198dHW
 2+5g==
X-Gm-Message-State: AOAM533kzMqAzQGQbM986eTOnEF611fPJHsvGczYu2lnG3d7FcuZD8Da
 1kZbAs/yGLrj+lJ63cuvUkM32OzcA+ua0A==
X-Google-Smtp-Source: ABdhPJylPtGi99LUrdBjHo2SgoBjgolwxVLosFDQZEvhNbaD4O01PFC7AvSQj1vjaRnz18URYBWZNA==
X-Received: by 2002:a05:600c:1c28:: with SMTP id
 j40mr3723235wms.102.1623151405376; 
 Tue, 08 Jun 2021 04:23:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] configure: convert compiler tests to meson, part 5
Date: Tue,  8 Jun 2021 13:23:00 +0200
Message-Id: <20210608112301.402434-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 101 ----------------------------------------------------
 meson.build |  26 ++++++++++++++
 2 files changed, 26 insertions(+), 101 deletions(-)

diff --git a/configure b/configure
index 87143ca00d..527a308470 100755
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
index e168e166ad..78fa30adbb 100644
--- a/meson.build
+++ b/meson.build
@@ -1271,6 +1271,7 @@ config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 
+config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
 config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
@@ -1304,6 +1305,10 @@ config_host_data.set('CONFIG_FIEMAP',
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
@@ -1341,6 +1346,15 @@ config_host_data.set('CONFIG_MADVISE', cc.compiles('''
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
@@ -1350,6 +1364,18 @@ config_host_data.set('CONFIG_SIGNALFD', cc.compiles('''
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
 config_host_data.set('CONFIG_STATIC_ASSERT', cc.compiles('''
   _Static_assert(1, "success");
   int main(void) {
-- 
2.31.1



