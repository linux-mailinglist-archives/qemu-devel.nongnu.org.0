Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9F2DCEEB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:55:52 +0100 (CET)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq0l-0002r9-Ok
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmb-000526-Jp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmR-0007mA-1a
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:13 -0500
Received: by mail-ed1-x533.google.com with SMTP id j16so5507179edr.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfiov3tZ0m7QpUN64F+t6W9nkhHG9RCaQOMRa8dZVP4=;
 b=jOCCOpEg+DBK55dWBXjXfOtnb+1C4LJ4nJJiPBLCfsvikhvQ5On9rQc1tFYlN7VTPP
 OZNI+J9a/fDe0REYH/hnCiUy50KsPoXxjDkMhSH+B4fY9pRi+C+PLMUX/qHrZb6PRiuA
 HNYUAbcU1cZb0TrBUTyKCOiuY3lta6uaYp39jmV8ZjVpzq1vVqF98SxAC3leyxVbOZa/
 1GNLVWxu+/Dazs6KYdd9cMQmUewGfQ2If45S+MaduPwTGjxXfMxngl2QJJVFJsLxr60n
 Aho18DcXrTSBjMWvF5XFaGE9vKcisQ6b7llt39hnnP3/xdl9dt9+Tg0SYnr+np11KUBI
 tjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kfiov3tZ0m7QpUN64F+t6W9nkhHG9RCaQOMRa8dZVP4=;
 b=FN5JXa0l8u4cahGQYvQRau29JA2IrA8oMRZfsNLOOIfQ4kIN/i6pr/6e1OLwE2g5k/
 Khdn2Z3cL1aOgoiqdlHEot30autywAAoav+CXVRqzbY3ola3hqKLVG4aADwOnixTcqD5
 h5XHr39b3EUB7qiXtBn8EdTd/fHqxAK5P3vqEvfUgqKMW8PVfINJsrDQaj1mK13eG3ro
 +bfRc5mA4wlrc4KkAURZePl9+4mDr3y4ZImhzCWByxMly++MLvppAVGxdOv7n9Xu7RDI
 44pNLbZ+Ix6V8a6sT3tDXOKlq7CYMGDKxukNga5GYHdLQLrWMlXEQ8kY9OfR21g+kF06
 JkNw==
X-Gm-Message-State: AOAM532ShSheia/o5kik7I6T2zHO7/x7vmos2l8e4L/NtAYwSCPBhD8c
 kjOI+0f4cEnyCcqex1YhqiFhvmIEFSU=
X-Google-Smtp-Source: ABdhPJxyi/skR7jqwqJQKbXvxKw18Gt435EsCW2DFqAaQjUU/eVVUEx3hqty5kVCmqiB/rkatyuN2A==
X-Received: by 2002:a50:cd57:: with SMTP id d23mr37387349edj.95.1608198060760; 
 Thu, 17 Dec 2020 01:41:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:41:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] cap_ng: convert to meson
Date: Thu, 17 Dec 2020 10:40:42 +0100
Message-Id: <20201217094044.46462-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 34 ++++------------------------------
 meson.build       | 24 ++++++++++++++++++++----
 meson_options.txt |  2 ++
 tools/meson.build |  4 ++--
 4 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index 11d6f40f92..faee71612f 100755
--- a/configure
+++ b/configure
@@ -331,7 +331,7 @@ xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
 linux_aio="$default_feature"
 linux_io_uring="$default_feature"
-cap_ng="$default_feature"
+cap_ng="auto"
 attr="$default_feature"
 libattr="$default_feature"
 xfs="$default_feature"
@@ -1123,9 +1123,9 @@ for opt do
   ;;
   --enable-tcg-interpreter) tcg_interpreter="yes"
   ;;
-  --disable-cap-ng)  cap_ng="no"
+  --disable-cap-ng)  cap_ng="disabled"
   ;;
-  --enable-cap-ng) cap_ng="yes"
+  --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
   ;;
@@ -3193,28 +3193,6 @@ EOF
   fi
 fi
 
-##########################################
-# libcap-ng library probe
-if test "$cap_ng" != "no" ; then
-  cap_libs="-lcap-ng"
-  cat > $TMPC << EOF
-#include <cap-ng.h>
-int main(void)
-{
-    capng_capability_to_name(CAPNG_EFFECTIVE);
-    return 0;
-}
-EOF
-  if compile_prog "" "$cap_libs" ; then
-    cap_ng=yes
-  else
-    if test "$cap_ng" = "yes" ; then
-      feature_not_found "cap_ng" "Install libcap-ng devel"
-    fi
-    cap_ng=no
-  fi
-fi
-
 ##########################################
 # Sound support libraries probe
 
@@ -5671,10 +5649,6 @@ fi
 if test "$gprof" = "yes" ; then
   echo "CONFIG_GPROF=y" >> $config_host_mak
 fi
-if test "$cap_ng" = "yes" ; then
-  echo "CONFIG_LIBCAP_NG=y" >> $config_host_mak
-  echo "LIBCAP_NG_LIBS=$cap_libs" >> $config_host_mak
-fi
 echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
 for drv in $audio_drv_list; do
     def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
@@ -6561,7 +6535,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs \
+        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 08d3586df5..56ab291d87 100644
--- a/meson.build
+++ b/meson.build
@@ -334,10 +334,25 @@ if not get_option('libiscsi').auto() or have_system or have_tools
                        required: get_option('seccomp'),
                        method: 'pkg-config', static: enable_static)
 endif
-libcap_ng = not_found
-if 'CONFIG_LIBCAP_NG' in config_host
-  libcap_ng = declare_dependency(link_args: config_host['LIBCAP_NG_LIBS'].split())
+
+libcap_ng = cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
+                      required: get_option('cap_ng'),
+                      static: enable_static)
+if libcap_ng.found() and not cc.links('''
+   #include <cap-ng.h>
+   int main(void)
+   {
+     capng_capability_to_name(CAPNG_EFFECTIVE);
+     return 0;
+   }''', dependencies: libcap_ng)
+  libcap_ng = not_found
+  if get_option('cap_ng').enabled()
+    error('could not link libcap-ng')
+  else
+    warning('could not link libcap-ng, disabling')
+  endif
 endif
+
 if get_option('xkbcommon').auto() and not have_system and not have_tools
   xkbcommon = not_found
 else
@@ -1006,6 +1021,7 @@ config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE', glusterfs.version().version_c
 config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL', glusterfs.version().version_compare('>=6'))
 config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
 config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
+config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
@@ -2348,7 +2364,7 @@ summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
 summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
 summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
-summary_info += {'libcap-ng support': config_host.has_key('CONFIG_LIBCAP_NG')}
+summary_info += {'libcap-ng support': libcap_ng.found()}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
diff --git a/meson_options.txt b/meson_options.txt
index 59a8a50e5b..12a1872f20 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
 option('bzip2', type : 'feature', value : 'auto',
        description: 'bzip2 support for DMG images')
+option('cap_ng', type : 'feature', value : 'auto',
+       description: 'cap_ng support')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
diff --git a/tools/meson.build b/tools/meson.build
index 5c52d79fe4..fdce66857d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,14 +1,14 @@
 have_virtiofsd = (targetos == 'linux' and
     have_tools and
     seccomp.found() and
-    'CONFIG_LIBCAP_NG' in config_host and
+    libcap_ng.found() and
     'CONFIG_VHOST_USER' in config_host)
 
 if get_option('virtiofsd').enabled()
   if not have_virtiofsd
     if targetos != 'linux'
       error('virtiofsd requires Linux')
-    elif not seccomp.found() or 'CONFIG_LIBCAP_NG' not in config_host
+    elif not seccomp.found() or not libcap_ng.found()
       error('virtiofsd requires libcap-ng-devel and seccomp-devel')
     elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
       error('virtiofsd needs tools and vhost-user support')
-- 
2.29.2



