Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBA39F501
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:32:14 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZxu-00067l-0a
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpN-0006sd-At
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpJ-00084N-Rw
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id m18so21173928wrv.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seFU97Ec+z34tB6wgE87ei/l5SBOcKQS3T1ahUNKdmE=;
 b=g/iaW/YGHSNM1KZWKE3VckcPICWBFr4sqMp4yoDZsWD96j1vgtJnCXJ8SOb+pLkUYM
 3gQOHFUMowhaSu9pDovf7E3V7FqgGdcsvBd3wrhqyk+2Ikn+uE1JfxFoFD5JDHDnuJbI
 Mq7P+UZdBhHg1WYTAHGqNi2kHW/xDxIzy7OWr8OoZTGxYkqoJXqowuwPK+3/tJX4+XTg
 6fxFfpsTfGBVUeu02OmjuDYOCQir8d0ghteJPUnDsJr4gMNGGsGU7pHmvmxI25c34X8e
 1tHZZyrALpjmL7uBhXvrdmBt3mpvSvhRV1kBJYL/DA/493d+DIaTWH3JF+S9brpKx+BF
 xSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=seFU97Ec+z34tB6wgE87ei/l5SBOcKQS3T1ahUNKdmE=;
 b=QcBXzLtxDZb4abfQ4uOBArzJkDQz4rYrLYgZ/5cGJ6icNROapxCmS3a/wUC00zQVOV
 1+P0vQnyBQ9MViTJivbXEe3se02aPlB2Myw9P1YOLbsnMUbB7BP/BJAoLbAlGDTAX8fr
 cy4IzRMW9v/YkFK8fBpBDOxjYsAtPDMYoetL7rDrSnDl9t0yOKq6CV+x7A1ykYmSaBoq
 Wdd58NBfYYTnyXJ79QGByaw1BgnhjHIVo+tXW2IgLb0ov0BlLME7G9BWhys5j0V+Unmr
 1tSPz+XWJ2B02R34viFXCc7dwVLwJMX6IQfyjar8mSeZSX0gLTJKNQmG+ASLTGouWKbJ
 HOeQ==
X-Gm-Message-State: AOAM531Bl5JZbFsUiva0GiOzrs4B9sHW/KupICZcpfIGWxZqzm80OO0f
 KQMPw2AhiZH4AFXBdwn4vxZ2zuyvqnFSFA==
X-Google-Smtp-Source: ABdhPJw/TJxqmA0wv++P7GLg8o2y1HJNzlREBwqFY2eSaHMb465BihsvOB1VR6Qg9kg+0xLAj6uVIQ==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr22022945wrf.315.1623151400187; 
 Tue, 08 Jun 2021 04:23:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] configure: convert compiler tests to meson, part 1
Date: Tue,  8 Jun 2021 13:22:54 +0200
Message-Id: <20210608112301.402434-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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
 configure          | 348 ---------------------------------------------
 meson.build        |  35 ++++-
 ui/vnc-auth-sasl.c |   2 +-
 util/meson.build   |   4 +-
 4 files changed, 38 insertions(+), 351 deletions(-)

diff --git a/configure b/configure
index e11174f810..b16c84ca74 100755
--- a/configure
+++ b/configure
@@ -3588,297 +3588,6 @@ EOF
   fi
 fi
 
-# check for fallocate
-fallocate=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-
-int main(void)
-{
-    fallocate(0, 0, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  fallocate=yes
-fi
-
-# check for fallocate hole punching
-fallocate_punch_hole=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-#include <linux/falloc.h>
-
-int main(void)
-{
-    fallocate(0, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  fallocate_punch_hole=yes
-fi
-
-# check that fallocate supports range zeroing inside the file
-fallocate_zero_range=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-#include <linux/falloc.h>
-
-int main(void)
-{
-    fallocate(0, FALLOC_FL_ZERO_RANGE, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  fallocate_zero_range=yes
-fi
-
-# check for posix_fallocate
-posix_fallocate=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-
-int main(void)
-{
-    posix_fallocate(0, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    posix_fallocate=yes
-fi
-
-# check for sync_file_range
-sync_file_range=no
-cat > $TMPC << EOF
-#include <fcntl.h>
-
-int main(void)
-{
-    sync_file_range(0, 0, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  sync_file_range=yes
-fi
-
-# check for linux/fiemap.h and FS_IOC_FIEMAP
-fiemap=no
-cat > $TMPC << EOF
-#include <sys/ioctl.h>
-#include <linux/fs.h>
-#include <linux/fiemap.h>
-
-int main(void)
-{
-    ioctl(0, FS_IOC_FIEMAP, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  fiemap=yes
-fi
-
-# check for dup3
-dup3=no
-cat > $TMPC << EOF
-#include <unistd.h>
-
-int main(void)
-{
-    dup3(0, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  dup3=yes
-fi
-
-# check for ppoll support
-ppoll=no
-cat > $TMPC << EOF
-#include <poll.h>
-
-int main(void)
-{
-    struct pollfd pfd = { .fd = 0, .events = 0, .revents = 0 };
-    ppoll(&pfd, 1, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  ppoll=yes
-fi
-
-# check for prctl(PR_SET_TIMERSLACK , ... ) support
-prctl_pr_set_timerslack=no
-cat > $TMPC << EOF
-#include <sys/prctl.h>
-
-int main(void)
-{
-    prctl(PR_SET_TIMERSLACK, 1, 0, 0, 0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  prctl_pr_set_timerslack=yes
-fi
-
-# check for epoll support
-epoll=no
-cat > $TMPC << EOF
-#include <sys/epoll.h>
-
-int main(void)
-{
-    epoll_create(0);
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-  epoll=yes
-fi
-
-# epoll_create1 is a later addition
-# so we must check separately for its presence
-epoll_create1=no
-cat > $TMPC << EOF
-#include <sys/epoll.h>
-
-int main(void)
-{
-    /* Note that we use epoll_create1 as a value, not as
-     * a function being called. This is necessary so that on
-     * old SPARC glibc versions where the function was present in
-     * the library but not declared in the header file we will
-     * fail the configure check. (Otherwise we will get a compiler
-     * warning but not an error, and will proceed to fail the
-     * qemu compile where we compile with -Werror.)
-     */
-    return (int)(uintptr_t)&epoll_create1;
-}
-EOF
-if compile_prog "" "" ; then
-  epoll_create1=yes
-fi
-
-# check for sendfile support
-sendfile=no
-cat > $TMPC << EOF
-#include <sys/sendfile.h>
-
-int main(void)
-{
-    return sendfile(0, 0, 0, 0);
-}
-EOF
-if compile_prog "" "" ; then
-  sendfile=yes
-fi
-
-# check for timerfd support (glibc 2.8 and newer)
-timerfd=no
-cat > $TMPC << EOF
-#include <sys/timerfd.h>
-
-int main(void)
-{
-    return(timerfd_create(CLOCK_REALTIME, 0));
-}
-EOF
-if compile_prog "" "" ; then
-  timerfd=yes
-fi
-
-# check for setns and unshare support
-setns=no
-cat > $TMPC << EOF
-#include <sched.h>
-
-int main(void)
-{
-    int ret;
-    ret = setns(0, 0);
-    ret = unshare(0);
-    return ret;
-}
-EOF
-if compile_prog "" "" ; then
-  setns=yes
-fi
-
-# clock_adjtime probe
-clock_adjtime=no
-cat > $TMPC <<EOF
-#include <time.h>
-#include <sys/timex.h>
-
-int main(void)
-{
-    return clock_adjtime(0, 0);
-}
-EOF
-clock_adjtime=no
-if compile_prog "" "" ; then
-  clock_adjtime=yes
-fi
-
-# syncfs probe
-syncfs=no
-cat > $TMPC <<EOF
-#include <unistd.h>
-
-int main(void)
-{
-    return syncfs(0);
-}
-EOF
-syncfs=no
-if compile_prog "" "" ; then
-  syncfs=yes
-fi
-
-# Search for bswap_32 function
-byteswap_h=no
-cat > $TMPC << EOF
-#include <byteswap.h>
-int main(void) { return bswap_32(0); }
-EOF
-if compile_prog "" "" ; then
-  byteswap_h=yes
-fi
-
-# Search for bswap32 function
-bswap_h=no
-cat > $TMPC << EOF
-#include <sys/endian.h>
-#include <sys/types.h>
-#include <machine/bswap.h>
-int main(void) { return bswap32(0); }
-EOF
-if compile_prog "" "" ; then
-  bswap_h=yes
-fi
-
-# Check whether we have openpty() in either libc or libutil
-cat > $TMPC << EOF
-extern int openpty(int *am, int *as, char *name, void *termp, void *winp);
-int main(void) { return openpty(0, 0, 0, 0, 0); }
-EOF
-
-have_openpty="no"
-if compile_prog "" "" ; then
-  have_openpty="yes"
-else
-  if compile_prog "" "-lutil" ; then
-    have_openpty="yes"
-  fi
-fi
-
 ##########################################
 # spice probe
 if test "$spice_protocol" != "no" ; then
@@ -5266,54 +4975,6 @@ fi
 if test "$have_usbfs" = "yes" ; then
   echo "CONFIG_USBFS=y" >> $config_host_mak
 fi
-if test "$fallocate" = "yes" ; then
-  echo "CONFIG_FALLOCATE=y" >> $config_host_mak
-fi
-if test "$fallocate_punch_hole" = "yes" ; then
-  echo "CONFIG_FALLOCATE_PUNCH_HOLE=y" >> $config_host_mak
-fi
-if test "$fallocate_zero_range" = "yes" ; then
-  echo "CONFIG_FALLOCATE_ZERO_RANGE=y" >> $config_host_mak
-fi
-if test "$posix_fallocate" = "yes" ; then
-  echo "CONFIG_POSIX_FALLOCATE=y" >> $config_host_mak
-fi
-if test "$sync_file_range" = "yes" ; then
-  echo "CONFIG_SYNC_FILE_RANGE=y" >> $config_host_mak
-fi
-if test "$fiemap" = "yes" ; then
-  echo "CONFIG_FIEMAP=y" >> $config_host_mak
-fi
-if test "$dup3" = "yes" ; then
-  echo "CONFIG_DUP3=y" >> $config_host_mak
-fi
-if test "$ppoll" = "yes" ; then
-  echo "CONFIG_PPOLL=y" >> $config_host_mak
-fi
-if test "$prctl_pr_set_timerslack" = "yes" ; then
-  echo "CONFIG_PRCTL_PR_SET_TIMERSLACK=y" >> $config_host_mak
-fi
-if test "$epoll" = "yes" ; then
-  echo "CONFIG_EPOLL=y" >> $config_host_mak
-fi
-if test "$epoll_create1" = "yes" ; then
-  echo "CONFIG_EPOLL_CREATE1=y" >> $config_host_mak
-fi
-if test "$sendfile" = "yes" ; then
-  echo "CONFIG_SENDFILE=y" >> $config_host_mak
-fi
-if test "$timerfd" = "yes" ; then
-  echo "CONFIG_TIMERFD=y" >> $config_host_mak
-fi
-if test "$setns" = "yes" ; then
-  echo "CONFIG_SETNS=y" >> $config_host_mak
-fi
-if test "$clock_adjtime" = "yes" ; then
-  echo "CONFIG_CLOCK_ADJTIME=y" >> $config_host_mak
-fi
-if test "$syncfs" = "yes" ; then
-  echo "CONFIG_SYNCFS=y" >> $config_host_mak
-fi
 if test "$inotify" = "yes" ; then
   echo "CONFIG_INOTIFY=y" >> $config_host_mak
 fi
@@ -5329,12 +4990,6 @@ fi
 if test "$st_atim" = "yes" ; then
   echo "HAVE_STRUCT_STAT_ST_ATIM=y" >> $config_host_mak
 fi
-if test "$byteswap_h" = "yes" ; then
-  echo "CONFIG_BYTESWAP_H=y" >> $config_host_mak
-fi
-if test "$bswap_h" = "yes" ; then
-  echo "CONFIG_MACHINE_BSWAP_H=y" >> $config_host_mak
-fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
@@ -5344,9 +4999,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$have_openpty" = "yes" ; then
-    echo "HAVE_OPENPTY=y" >> $config_host_mak
-fi
 
 # Work around a system header bug with some kernel/XFS header
 # versions where they both try to define 'struct fsxattr':
diff --git a/meson.build b/meson.build
index 2a19f6c1bd..fe8f64763b 100644
--- a/meson.build
+++ b/meson.build
@@ -1055,10 +1055,12 @@ endif
 
 # Check whether the glibc provides statx()
 
-statx_test = '''
+gnu_source_prefix = '''
   #ifndef _GNU_SOURCE
   #define _GNU_SOURCE
   #endif
+'''
+statx_test = gnu_source_prefix + '''
   #include <sys/stat.h>
   int main(void) {
     struct statx statxbuf;
@@ -1260,6 +1262,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
+config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
@@ -1267,9 +1270,39 @@ config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 
+config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
+config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
+config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
+config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
+config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
+config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
+config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
+config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
+config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
+config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
+config_host_data.set('CONFIG_BYTESWAP_H',
+                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
+config_host_data.set('CONFIG_EPOLL_CREATE1',
+                     cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
+config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
+                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
+                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
+config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
+                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_ZERO_RANGE'))
+config_host_data.set('CONFIG_FIEMAP',
+                     cc.has_header('linux/fiemap.h') and
+                     cc.has_header_symbol('linux/fs.h', 'FS_IOC_FIEMAP'))
+config_host_data.set('CONFIG_MACHINE_BSWAP_H',
+                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
+                                          prefix: '''#include <sys/endian.h>
+                                                     #include <sys/types.h>'''))
+config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
+                     cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
+
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index 47fdae5b21..cf65a0b161 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -33,7 +33,7 @@
  * files that use SASL API need to disable -Wdeprecated-declarations.
  */
 #ifdef CONFIG_DARWIN
-#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+#pragma GCC diagnostic warning "-Wdeprecated-declarations"
 #endif
 
 /* Max amount of data we send/recv for SASL steps to prevent DOS */
diff --git a/util/meson.build b/util/meson.build
index 97fad44105..7fe9da60ab 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -3,7 +3,9 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
-util_ss.add(when: 'CONFIG_EPOLL_CREATE1', if_true: files('fdmon-epoll.c'))
+if config_host_data.get('CONFIG_EPOLL_CREATE1')
+  util_ss.add(files('fdmon-epoll.c'))
+endif
 util_ss.add(when: ['CONFIG_LINUX_IO_URING', linux_io_uring], if_true: files('fdmon-io_uring.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
-- 
2.31.1



