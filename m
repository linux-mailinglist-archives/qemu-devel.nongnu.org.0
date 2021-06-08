Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAC39F545
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:41:56 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa7H-00089f-W5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpP-0006zs-H4
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpN-00087X-KO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id g204so1584730wmf.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGBVnS8TDAzYS3n1mdtHDWtzzPZPFr5YshutzoCZnF0=;
 b=HHBN0ecdvVaX0WJ4vLgsHaZO+hIWaa9MfuORC0zSgoYhrDqFuf/lMEFu/lFMygMwBR
 E9KBVly7c6p6i2WIwWlMZHLdQh2fiTSt68OFUwMOZyKH7LRkqo8js7bYdrHwg2NB4DN5
 lQyzlEhe+I8F74hftpBelw5JNvPDLUEayAIalN6yOX5+8Lvb+JbFjipINch0EEQ54BtD
 HOcqbDnxv4QCcJZheT8CnbcN/xvtCiQCX+QELPJeImOMQ17EM6g3/BBAQwVwzOaN8RZT
 M1ipaOJfsf/BpeWpcqZTYMq3LVtHYz6CXqg0yOgqm/ahVbIHJqJ29ujZDek7qUHk/bUj
 s6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EGBVnS8TDAzYS3n1mdtHDWtzzPZPFr5YshutzoCZnF0=;
 b=FeakJgRrPBudabOya08VVpnEBxJX8u7JcdWfuCyCUiLE0Ws0KzE7Jz30gPNWmixeIb
 s2UcVk1M0LnHODUeLAamwAvqyMkhdaStIdcbCJqGVvBMGBsB2C0VABoKp/Zg2KO4Er1p
 A+6w+4OxMKGMoj0VA6ho+KVB88QnUrjM/vS01nuGq3rDzVqmv0t6F3NoiLfR15vplLaS
 W4I50/5VQajDSknomgJcVxFxUMjD8rM1IrFw5BjxTr4Y/SKJMN6hGXTokDsMsi6lUj9w
 1RtlYgSfqniZJKSw2VJmqew8EoMQNqHcpUZP5EV8k13NupbUwboH4FUvQY1mVUk/aoyD
 fgFg==
X-Gm-Message-State: AOAM531poWv5i/+RJYopGtC6aDMB6HALEYXMRBE9qY6ke5Z8ntD+7LpG
 IDf1uw1yzgqtlIq46Se0XEYojyljLZUrGA==
X-Google-Smtp-Source: ABdhPJwLvW3lcg+128M0/Zap8ftdnwEIgr/lcWIYAuNMyb6SwZd6kHiuTb7jiL1M5yZAhNd6hpOzRQ==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr16953955wmj.33.1623151404457; 
 Tue, 08 Jun 2021 04:23:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] configure: convert compiler tests to meson, part 4
Date: Tue,  8 Jun 2021 13:22:59 +0200
Message-Id: <20210608112301.402434-25-pbonzini@redhat.com>
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

And remove them from the summary, since now their outcome is verbosely
included in the meson output.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 137 ----------------------------------------------------
 meson.build |  38 +++++++++++++--
 2 files changed, 33 insertions(+), 142 deletions(-)

diff --git a/configure b/configure
index dd6098e306..87143ca00d 100755
--- a/configure
+++ b/configure
@@ -3511,59 +3511,6 @@ elif test "$jemalloc" = "yes" ; then
     malloc=jemalloc
 fi
 
-##########################################
-# signalfd probe
-signalfd="no"
-cat > $TMPC << EOF
-#include <unistd.h>
-#include <sys/syscall.h>
-#include <signal.h>
-int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }
-EOF
-
-if compile_prog "" "" ; then
-  signalfd=yes
-fi
-
-# check if optreset global is declared by <getopt.h>
-optreset="no"
-cat > $TMPC << EOF
-#include <getopt.h>
-int main(void) { return optreset; }
-EOF
-
-if compile_prog "" "" ; then
-  optreset=yes
-fi
-
-# check if eventfd is supported
-eventfd=no
-cat > $TMPC << EOF
-#include <sys/eventfd.h>
-
-int main(void)
-{
-    return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
-}
-EOF
-if compile_prog "" "" ; then
-  eventfd=yes
-fi
-
-# check if memfd is supported
-memfd=no
-cat > $TMPC << EOF
-#include <sys/mman.h>
-
-int main(void)
-{
-    return memfd_create("foo", MFD_ALLOW_SEALING);
-}
-EOF
-if compile_prog "" "" ; then
-  memfd=yes
-fi
-
 # check for usbfs
 have_usbfs=no
 if test "$linux_user" = "yes"; then
@@ -3711,66 +3658,6 @@ case "$capstone" in
     ;;
 esac
 
-##########################################
-# check if we have fdatasync
-
-fdatasync=no
-cat > $TMPC << EOF
-#include <unistd.h>
-int main(void) {
-#if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
-return fdatasync(0);
-#else
-#error Not supported
-#endif
-}
-EOF
-if compile_prog "" "" ; then
-    fdatasync=yes
-fi
-
-##########################################
-# check if we have madvise
-
-madvise=no
-cat > $TMPC << EOF
-#include <sys/types.h>
-#include <sys/mman.h>
-#include <stddef.h>
-int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }
-EOF
-if compile_prog "" "" ; then
-    madvise=yes
-fi
-
-##########################################
-# check if we have posix_madvise
-
-posix_madvise=no
-cat > $TMPC << EOF
-#include <sys/mman.h>
-#include <stddef.h>
-int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }
-EOF
-if compile_prog "" "" ; then
-    posix_madvise=yes
-fi
-
-##########################################
-# check if we have posix_memalign()
-
-posix_memalign=no
-cat > $TMPC << EOF
-#include <stdlib.h>
-int main(void) {
-    void *p;
-    return posix_memalign(&p, 8, 8);
-}
-EOF
-if compile_prog "" "" ; then
-    posix_memalign=yes
-fi
-
 ##########################################
 # check if we have posix_syslog
 
@@ -4842,12 +4729,6 @@ fi
 if test "$splice" = "yes" ; then
   echo "CONFIG_SPLICE=y" >> $config_host_mak
 fi
-if test "$eventfd" = "yes" ; then
-  echo "CONFIG_EVENTFD=y" >> $config_host_mak
-fi
-if test "$memfd" = "yes" ; then
-  echo "CONFIG_MEMFD=y" >> $config_host_mak
-fi
 if test "$have_usbfs" = "yes" ; then
   echo "CONFIG_USBFS=y" >> $config_host_mak
 fi
@@ -4922,24 +4803,6 @@ fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
-if test "$signalfd" = "yes" ; then
-  echo "CONFIG_SIGNALFD=y" >> $config_host_mak
-fi
-if test "$optreset" = "yes" ; then
-  echo "HAVE_OPTRESET=y" >> $config_host_mak
-fi
-if test "$fdatasync" = "yes" ; then
-  echo "CONFIG_FDATASYNC=y" >> $config_host_mak
-fi
-if test "$madvise" = "yes" ; then
-  echo "CONFIG_MADVISE=y" >> $config_host_mak
-fi
-if test "$posix_madvise" = "yes" ; then
-  echo "CONFIG_POSIX_MADVISE=y" >> $config_host_mak
-fi
-if test "$posix_memalign" = "yes" ; then
-  echo "CONFIG_POSIX_MEMALIGN=y" >> $config_host_mak
-fi
 
 if test "$spice_protocol" = "yes" ; then
   echo "CONFIG_SPICE_PROTOCOL=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 4b9bbca7ff..e168e166ad 100644
--- a/meson.build
+++ b/meson.build
@@ -1275,6 +1275,7 @@ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
+config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
@@ -1313,11 +1314,42 @@ config_host_data.set('CONFIG_RTNETLINK',
                      cc.has_header_symbol('linux/rtnetlink.h', 'IFLA_PROTO_DOWN'))
 config_host_data.set('CONFIG_SYSMACROS',
                      cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
+config_host_data.set('HAVE_OPTRESET',
+                     cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim', prefix: '#include <sys/stat.h>'))
 config_host_data.set('HAVE_UTMPX',
                      cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 
+config_host_data.set('CONFIG_EVENTFD', cc.compiles('''
+  #include <sys/eventfd.h>
+  int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
+config_host_data.set('CONFIG_FDATASYNC', cc.compiles(gnu_source_prefix + '''
+  #include <unistd.h>
+  int main(void) {
+  #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
+  return fdatasync(0);
+  #else
+  #error Not supported
+  #endif
+  }'''))
+config_host_data.set('CONFIG_MADVISE', cc.compiles(gnu_source_prefix + '''
+  #include <sys/types.h>
+  #include <sys/mman.h>
+  #include <stddef.h>
+  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }'''))
+config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + '''
+  #include <sys/mman.h>
+  int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
+config_host_data.set('CONFIG_POSIX_MADVISE', cc.compiles(gnu_source_prefix + '''
+  #include <sys/mman.h>
+  #include <stddef.h>
+  int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
+config_host_data.set('CONFIG_SIGNALFD', cc.compiles(gnu_source_prefix + '''
+  #include <unistd.h>
+  #include <sys/syscall.h>
+  #include <signal.h>
+  int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }'''))
 config_host_data.set('CONFIG_STATIC_ASSERT', cc.compiles('''
   _Static_assert(1, "success");
   int main(void) {
@@ -1400,7 +1432,7 @@ if link_language == 'cpp'
   }
 endif
 
-have_ivshmem = config_host.has_key('CONFIG_EVENTFD')
+have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
@@ -2721,10 +2753,6 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
-summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
-summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
 summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'memory allocator':  get_option('malloc')}
-- 
2.31.1



