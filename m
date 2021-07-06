Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A729C3BC98C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:22:49 +0200 (CEST)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iE4-0005yT-M0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htw-00012t-WA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htu-0002LK-0R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so3283450wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaaZWJiitdvOZB1EKQidwztAXzBPA1xDA7Q+V1EEpW4=;
 b=Bn0dwgp5UC7lhEJzw9+gsKlzcad+LNDqX40L52Tg1k+FI1/mb4Vk+FmUW6ylVy/F6T
 Rh13oKwEXAXY2yCZG0getXorhey/c+gfKjqqwwFyHSPP/ron0ZJp+gqnM2YFim/q80t+
 jOlj6Nlk43AaR7AaZeW/ZXAAQ5i/KTXFnWgF6llhue0S/xNaVOV2bplnBJA+9DoQL6/h
 i+iu87L25bInULEicWe3p1e+ptCo4vjrr0GjksDylwLd2CXEz2uhVxRUAd8x0SfOmbpe
 UXFukpqz5LhOfUWBak5cBsOUiVyTE9kn0SKJylIOI4Wfa2AMJTFMgbThCOD4y9edx/Ox
 n+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kaaZWJiitdvOZB1EKQidwztAXzBPA1xDA7Q+V1EEpW4=;
 b=S7E92Fj8W/WIOmoia+StcGAxp8eFc4CusObZIAgfv/vrBZ1uWx4p2UBRxF1iNoy6pY
 p+BTXkVyl/gzP8brDUVna7reuDFoNBvHqEiQPNf3cefKDszoZwOl0j6w+Q7aiIVKQuWs
 jKbe5wA7c8S30SrqLcusSeG0CBuCA027YhtB/eDk5r+Dv8/URivEPlpG4/paa8MGgtZX
 EohzxpoWvPrYOywqRRxvzmnKElSqRtYUr41o2QhUKFSuAuT2c1Tc6G7raTHIbzoqszFI
 S+LnV0qe/D3Wy3UtNyYHt6y0UV2hWMRADmewBMKF2yBWqQpO5enXNuw7eELzEB/du8Kb
 VnXQ==
X-Gm-Message-State: AOAM531Toxxk0g2WPv1Qx+33ACPo/DF/qI0C4njKxk4unOkNMoGeug0w
 aKLg3LHIcV7FLznbJpIBORDnpKsqE/E=
X-Google-Smtp-Source: ABdhPJy6STlsfT7EVNXzxpDM1Nc9pxf7dPaFJhPyLa3UHylb+tbpJ/KYhc58H3TquMM/w+kJ77uXHw==
X-Received: by 2002:a05:600c:a04:: with SMTP id
 z4mr19422325wmp.103.1625565716583; 
 Tue, 06 Jul 2021 03:01:56 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/40] configure, meson: convert liburing detection to meson
Date: Tue,  6 Jul 2021 12:01:22 +0200
Message-Id: <20210706100141.303960-22-pbonzini@redhat.com>
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



