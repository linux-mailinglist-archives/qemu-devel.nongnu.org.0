Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DAD3BC168
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:10:48 +0200 (CEST)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RBH-0007gc-6h
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1I-0001F7-AO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1G-0003ba-DC
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so22671830wri.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaaZWJiitdvOZB1EKQidwztAXzBPA1xDA7Q+V1EEpW4=;
 b=VtbJyV3iLB/zIxfZSIKPhIIq2I7NCGVe63TfJ7Y7VM6mc+1uqsksKvLoUpsdrJC5V0
 FtTePkgdXvceYoUgHENHhQrPbChPDH4GQ9R3/c8ER1FVxeM63VEOq796+7iTv3li8dLw
 ygZXuiMWj+5KchwsQhlKiQSkHz3C2f34TmJnaCnW+MvuAIsZcsZl8EsbCnQS91L75n7t
 Dog8qhDlbD2bR2IlpCyAKLU2tSuShylfBeCJAwhh8v/oEPFj6P/ci5p5uMNogPOBU2Hj
 08iO+tZ2rbsVSHL5kBoQM1CziWvPEqpOEeYzLt/S9K72CvCES1uKls4rIGnFse6X+KDI
 0Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kaaZWJiitdvOZB1EKQidwztAXzBPA1xDA7Q+V1EEpW4=;
 b=tYJNdeCracK7pQCc6IBDua7EQH7CxUSs2dz9cuM9Av+Sd52xxas87nep+AfMYFbH6l
 KRsCZlxpJa45BLVoEXoJumFJvTjEGK8OB85RVHazHM6oyE969ScyiegQkUDePV7gkTHv
 px+Lz0P/pNEs1FGkmaYRlHjGUByciX3MzrZ3mcMcS3OgmTqvLzp8RSMCiQhnJqya0jhZ
 2BZB7cjrjFhE00kHCBifjg869hvehUxIMFO0V6+/BEOeDf84QhRHa8JV3TyCdoEuFM0t
 l19DA4WB4oYycXaFTMksmD1jRcvwznsZJblVVZdB6XhjzfQ5Wuqu6sM/lg+bZNghJ75V
 S9Pw==
X-Gm-Message-State: AOAM532ZKiQI48tp00znLbanRrGmZCXmM194m2VOheFy82PXtfbHHhwM
 JQFRK2435vj/8PDQVkjSnMLsAG+/PtA=
X-Google-Smtp-Source: ABdhPJwG1Q+uiWeUMJPcToWqVHLZ1xiWNwz5Pg7OsULWECJANOPquD4ZXHz1wl2ml/wqwkY2Zta9MA==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr17099664wri.286.1625500824595; 
 Mon, 05 Jul 2021 09:00:24 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] configure, meson: convert liburing detection to meson
Date: Mon,  5 Jul 2021 18:00:07 +0200
Message-Id: <20210705160018.241397-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
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
 configure         | 28 ++++------------------------
 meson.build       |  9 +++++----
 meson_options.txt |  2 ++
 3 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index 51b8c3290a..4e016f671c 100755
--- a/configure
+++ b/configure
@@ -315,7 +315,7 @@ xen="$default_feature"
 xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
 linux_aio="$default_feature"
-linux_io_uring="$default_feature"
+linux_io_uring="auto"
 cap_ng="auto"
 attr="auto"
 xfs="$default_feature"
@@ -1205,9 +1205,9 @@ for opt do
   ;;
   --enable-linux-aio) linux_aio="yes"
   ;;
-  --disable-linux-io-uring) linux_io_uring="no"
+  --disable-linux-io-uring) linux_io_uring="disabled"
   ;;
-  --enable-linux-io-uring) linux_io_uring="yes"
+  --enable-linux-io-uring) linux_io_uring="enabled"
   ;;
   --disable-attr) attr="disabled"
   ;;
@@ -3334,21 +3334,6 @@ EOF
     linux_aio=no
   fi
 fi
-##########################################
-# linux-io-uring probe
-
-if test "$linux_io_uring" != "no" ; then
-  if $pkg_config liburing; then
-    linux_io_uring_cflags=$($pkg_config --cflags liburing)
-    linux_io_uring_libs=$($pkg_config --libs liburing)
-    linux_io_uring=yes
-  else
-    if test "$linux_io_uring" = "yes" ; then
-      feature_not_found "linux io_uring" "Install liburing devel"
-    fi
-    linux_io_uring=no
-  fi
-fi
 
 ##########################################
 # TPM emulation is only on POSIX
@@ -5421,11 +5406,6 @@ fi
 if test "$linux_aio" = "yes" ; then
   echo "CONFIG_LINUX_AIO=y" >> $config_host_mak
 fi
-if test "$linux_io_uring" = "yes" ; then
-  echo "CONFIG_LINUX_IO_URING=y" >> $config_host_mak
-  echo "LINUX_IO_URING_CFLAGS=$linux_io_uring_cflags" >> $config_host_mak
-  echo "LINUX_IO_URING_LIBS=$linux_io_uring_libs" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -6071,7 +6051,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem \
+        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index e301eda3a5..5304744f2e 100644
--- a/meson.build
+++ b/meson.build
@@ -327,10 +327,11 @@ if have_system or have_tools
 endif
 libaio = cc.find_library('aio', required: false)
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
+
 linux_io_uring = not_found
-if 'CONFIG_LINUX_IO_URING' in config_host
-  linux_io_uring = declare_dependency(compile_args: config_host['LINUX_IO_URING_CFLAGS'].split(),
-                                      link_args: config_host['LINUX_IO_URING_LIBS'].split())
+if not get_option('linux_io_uring').auto() or have_block
+  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
+                              method: 'pkg-config', kwargs: static_kwargs)
 endif
 libxml2 = not_found
 if 'CONFIG_LIBXML2' in config_host
@@ -2785,7 +2786,7 @@ summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
-summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
+summary_info += {'Linux io_uring support': linux_io_uring.found()}
 summary_info += {'ATTR/XATTR support': libattr.found()}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
diff --git a/meson_options.txt b/meson_options.txt
index b23174d0a1..6610c4dc64 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -92,6 +92,8 @@ option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
        description: 'libusb support for USB passthrough')
+option('linux_io_uring', type : 'feature', value : 'auto',
+       description: 'Linux io_uring support')
 option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
-- 
2.31.1



