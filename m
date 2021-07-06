Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172833BC9F1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:30:27 +0200 (CEST)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iLS-0004h1-0I
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu3-0001Kx-0z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htz-0002Pt-Ry
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id n33so5669838wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWfQhBashspj92n3O9gjSje6wEHhYNIVjiIMVmNraZU=;
 b=F5Y+G9lPO3zabhOXsjY2BTJLZoWQpS5FfRjuU2zPsIOFRX0M4/FTTlrwc0J/2Nf67/
 OjWhy9bi19rzYmk2xpS40e2J3cEaNzrPVZQVjxdvpI/vGk5KC6AOE+9PbHyifcScQqbS
 ZSZr0f/7bNr/4cPw4ot0RdXSJCWXULNZ0NonPobd+QkYhaSWePtEuNJrPgymjxUwkd6/
 SHffYqkDOqM2rAaXipdcpaY8aS6p/YkHQJnFriFMRlqSfdAQ6p3bOCp2DirO25I6az8j
 HRqYTE92e/VRv5MBLs4INTIQG+6JpeS2ZfUU91Gl/Ggr57Z+NddPEGJzDcjBMGxB8QXn
 JSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dWfQhBashspj92n3O9gjSje6wEHhYNIVjiIMVmNraZU=;
 b=rO2jmyMT+blYhdeB7zJqht9VXLvDHdly0ENUcLeFrUKiMDh32fluJ04Qv5EI7zp/a9
 cStyxSq6+QOrm8weVcEaP/kZe7QYmPOO1adQQcC/jTHj5/0F3HIkhn0FadmPKX8Q5dQD
 RIqhx94koHXeZigCJy5nb+kQllhy9L1KT5wPwnSiscmcNZDfvcNX7sJyKLgrIa4j1Kla
 m/holUg0UvGrog0+f0woD2+Q9tLYkWP0LDYsGUdZwDGF1wMzs2dcgVLTKqSoiFNZDWjs
 ug9TcCSFY1/JCYlxGDBg63XFFTXMoLdTKhWBQfzLPDGU6wHZjtR0RpcE3ALaQ3R80fLn
 EmTw==
X-Gm-Message-State: AOAM533m548MDhFLXRdsp80xL9h85TSRyioZOsHUXAp6J/4H3uY+xEMF
 MOj3FL3jwkKhHT0l+qDaMFIDI/eT1Mc=
X-Google-Smtp-Source: ABdhPJzKx+6BHRGgNHY4IS1ZCzzAZ+v0gzjV5YsKMybxrwt4LcuwaODgdpFXIZfrY9RVuSXh8JwXwA==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr3813246wml.93.1625565722356; 
 Tue, 06 Jul 2021 03:02:02 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/40] configure: convert compiler tests to meson, part 4
Date: Tue,  6 Jul 2021 12:01:31 +0200
Message-Id: <20210706100141.303960-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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

And remove them from the summary, since now their outcome is verbosely
included in the meson output.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 137 ----------------------------------------------------
 meson.build |  39 +++++++++++++--
 2 files changed, 34 insertions(+), 142 deletions(-)

diff --git a/configure b/configure
index cf7f71fe40..83168ceb52 100755
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
@@ -4922,27 +4803,9 @@ fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
-if test "$signalfd" = "yes" ; then
-  echo "CONFIG_SIGNALFD=y" >> $config_host_mak
-fi
-if test "$optreset" = "yes" ; then
-  echo "HAVE_OPTRESET=y" >> $config_host_mak
-fi
 if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
   echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
 fi
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
index 5fec46bb65..cb50a2e473 100644
--- a/meson.build
+++ b/meson.build
@@ -1272,6 +1272,7 @@ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
+config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
@@ -1311,6 +1312,8 @@ config_host_data.set('CONFIG_RTNETLINK',
                      cc.has_header_symbol('linux/rtnetlink.h', 'IFLA_PROTO_DOWN'))
 config_host_data.set('CONFIG_SYSMACROS',
                      cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
+config_host_data.set('HAVE_OPTRESET',
+                     cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_UTMPX',
                      cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 
@@ -1322,6 +1325,36 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
 
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
+
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
@@ -1398,7 +1431,7 @@ if link_language == 'cpp'
   }
 endif
 
-have_ivshmem = config_host.has_key('CONFIG_EVENTFD')
+have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
@@ -2711,10 +2744,6 @@ summary_info += {'PIE':               get_option('b_pie')}
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



