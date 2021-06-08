Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3439F4FF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:30:54 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZwb-0003w0-SR
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpJ-0006iK-5e
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:21 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpE-00081W-0W
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a11so19287157wrt.13
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsOgg96A2kjSZMB4eKkTFEeBkFP/7luQOiHJgIFc3q0=;
 b=QNBgmj+TyLWsG7wQ2Mn9vV/Ls2+o2kAD4X1l7l0putMUquEDHC+oWBmG9R+6mP3fGl
 vMX9vEGTIqmf0yZ+etvQhrfOjHCxqd9gdZtfjgN78uAi6qiNWDOTgK3FqAc9FY1zJ2KZ
 YNvZ+LNxF/iuNNWbyYKMtV/rfrMCvKuoGCa7PYcho3X3WVYEwuDJQcltQm+uh+OOcVQB
 D+VA12hpXwa+9zgEaVtI/udq4MNrPw6gri/miLY5yShYGIZlVbWZcnz2wOhT9JI3Yuo1
 RqxLTrD9Qne1B9aa5bKPcGY/slMjgy2+OmaK6fIHIQuaBGIrfIL1zWO22ws8s7gBFATG
 U95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fsOgg96A2kjSZMB4eKkTFEeBkFP/7luQOiHJgIFc3q0=;
 b=X9+Lbk7MLwwtxsfFyiRDL1u/QCPiAYtw2i7oIX4Xk6LMJcKA7ZBSpy0w3qphhrD37D
 v/BSjNRLAXnpvorHR7/PFoziYA3QgK0ckuzj9Crx8ptWrNdUT1RVUOOUc9Wx+M+XDbJ2
 je+uTLQyDSO3LvVuzRqeMJeODXVYFGSUr2+1uJX3ZtuBxQLEDOzXdMkbfq1QKpKvoUOj
 hCa9KYaJdNtCdx2aqoIzYrI6CD+O+AceftY1XJ8f105CToD+kzzipSGxfeLRejf/UMxW
 biJId15FtwLMZANfLFXGbDb3ar7/EelwbzG1+0FwMXCQjVS9ebjD7oWHlB9Jr/2ARncZ
 OKcQ==
X-Gm-Message-State: AOAM531U1vTMGqcEXwtxb4B2BJC2wmtDmRJdWNK0a0HLkFdOsvE5mAxE
 6AFpEFAR33VvE2y2dsURJmosTORt+wmrzw==
X-Google-Smtp-Source: ABdhPJz62+tr0gBEjvjtvpREDDfz9qvAzOorNmEFbcCk525lATOTsGWah6wsyZyjOkyk5rblspIchg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr21521370wro.375.1623151394740; 
 Tue, 08 Jun 2021 04:23:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] configure, meson: convert liburing detection to meson
Date: Tue,  8 Jun 2021 13:22:48 +0200
Message-Id: <20210608112301.402434-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
 configure         | 28 ++++------------------------
 meson.build       |  9 +++++----
 meson_options.txt |  2 ++
 3 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index 8389a6f73f..ed62531416 100755
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
@@ -5419,11 +5404,6 @@ fi
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
@@ -6070,7 +6050,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem \
+        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index 8563443865..560b1739ec 100644
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
@@ -2799,7 +2800,7 @@ summary_info += {'brlapi support':    brlapi.found()}
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



