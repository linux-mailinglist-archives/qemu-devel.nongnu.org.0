Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABD39F514
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:35:46 +0200 (CEST)
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa1I-0006is-U0
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpJ-0006ig-7j
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpF-000832-5F
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id y7so16515623wrh.7
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3WUvE/j1VN+cbtn/hnsAUaevrPtRYFe5XER8HgZZZOI=;
 b=cpXdbEZPj0X+IPX+kTUcEqUTHZoKRwsdSG6Q18ANqHgOXiqMbfNu5oinjPABQl9TVV
 vC8eUX9mPkIeAf8fNDJc/DTkUzZSL9FoOVwBTfUKjf7YGvwMHQ6YaFbkGIe94DcnDXxU
 O3gqAJ6FQHw6cRh5dsmmzGqIqyp8xV76oMxMggSMXE/e5S5vhLD0o/xLk1M4Ikrj50GY
 ab9YKqcYKvPGtpza5uVcyAobHs2XiKgRNVdAwH+40atLGSQwizZ8hbikoImmVjJWx8Bp
 0QVA1CGAHMTrGk5Rb8NqQDVc/D8uZxKFndVh5K4lpZMQKw/aUBqDDgPfs93dm9OmWRQl
 HsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3WUvE/j1VN+cbtn/hnsAUaevrPtRYFe5XER8HgZZZOI=;
 b=jisTQXTSzMlivSujqq1bHmWhu6pm8RW9Q2i4LB8oeaSd6zkpn4WxfUFYNS/R96lWwf
 Zpx7JqKvteLX5eY2aIxbB+YCg+ZaMtf47P2QgUasbCKEJX75s/ByhzYvszKCyHRmkOHb
 0tciaPlRgYdghWZVTUeYCUV5SrmNQZobxEuTrvP8mMOfs6upnv0JXXaWEkzkw3Vd+VWp
 5QSqZXuCfMd3Dd4uybxMydSNG55rfJFiavfDJulxL063JPiKtQ4+8YyZLpo2rjuv/6/2
 4LjJwzEm9AIU+OH4Kgy9O3M0g0lIUTdDM89aDYLwE63DhAsh3NeDKwqTCsuJk0lak/B5
 JwCg==
X-Gm-Message-State: AOAM530S6u+/fX02H7Irq3Eq9ZuEUYwZd63eAYj1LX2wI3ufM4b0ekuN
 9M4AKCVEM0I09Ee/LgYmaOUYNMS09tW1sw==
X-Google-Smtp-Source: ABdhPJz61BTOvxMEJicorhgQROk6pBED/0OFc4H9gp2IOw2W/fR9S4umwoAGH9V4oQbfLsrgWLJqUg==
X-Received: by 2002:a5d:4dc4:: with SMTP id f4mr22084829wru.181.1623151395597; 
 Tue, 08 Jun 2021 04:23:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] configure, meson: convert libxml2 detection to meson
Date: Tue,  8 Jun 2021 13:22:49 +0200
Message-Id: <20210608112301.402434-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
 configure         | 29 ++++-------------------------
 meson.build       |  8 ++++----
 meson_options.txt |  2 ++
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index ed62531416..2c0f16488e 100755
--- a/configure
+++ b/configure
@@ -425,7 +425,7 @@ vdi=${default_feature:-yes}
 vvfat=${default_feature:-yes}
 qed=${default_feature:-yes}
 parallels=${default_feature:-yes}
-libxml2="$default_feature"
+libxml2="auto"
 debug_mutex="no"
 libpmem="auto"
 default_devices="true"
@@ -1419,9 +1419,9 @@ for opt do
   ;;
   --enable-numa) numa="yes"
   ;;
-  --disable-libxml2) libxml2="no"
+  --disable-libxml2) libxml2="disabled"
   ;;
-  --enable-libxml2) libxml2="yes"
+  --enable-libxml2) libxml2="enabled"
   ;;
   --disable-tcmalloc) tcmalloc="no"
   ;;
@@ -3409,21 +3409,6 @@ EOF
   fi
 fi
 
-##########################################
-# libxml2 probe
-if test "$libxml2" != "no" ; then
-    if $pkg_config --exists libxml-2.0; then
-        libxml2="yes"
-        libxml2_cflags=$($pkg_config --cflags libxml-2.0)
-        libxml2_libs=$($pkg_config --libs libxml-2.0)
-    else
-        if test "$libxml2" = "yes"; then
-            feature_not_found "libxml2" "Install libxml2 devel"
-        fi
-        libxml2="no"
-    fi
-fi
-
 # Check for inotify functions when we are building linux-user
 # emulator.  This is done because older glibc versions don't
 # have syscall stubs for these implemented.  In that case we
@@ -5631,12 +5616,6 @@ if test "$have_rtnetlink" = "yes" ; then
   echo "CONFIG_RTNETLINK=y" >> $config_host_mak
 fi
 
-if test "$libxml2" = "yes" ; then
-  echo "CONFIG_LIBXML2=y" >> $config_host_mak
-  echo "LIBXML2_CFLAGS=$libxml2_cflags" >> $config_host_mak
-  echo "LIBXML2_LIBS=$libxml2_libs" >> $config_host_mak
-fi
-
 if test "$replication" = "yes" ; then
   echo "CONFIG_REPLICATION=y" >> $config_host_mak
 fi
@@ -6049,7 +6028,7 @@ if test "$skip_meson" = no; then
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse -Dlibxml2=$libxml2 \
         -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
diff --git a/meson.build b/meson.build
index 560b1739ec..28825dec18 100644
--- a/meson.build
+++ b/meson.build
@@ -334,9 +334,9 @@ if not get_option('linux_io_uring').auto() or have_block
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
 libxml2 = not_found
-if 'CONFIG_LIBXML2' in config_host
-  libxml2 = declare_dependency(compile_args: config_host['LIBXML2_CFLAGS'].split(),
-                               link_args: config_host['LIBXML2_LIBS'].split())
+if not get_option('libxml2').auto() or have_block
+  libxml2 = dependency('libxml-2.0', required: get_option('libxml2'),
+                       method: 'pkg-config', kwargs: static_kwargs)
 endif
 libnfs = not_found
 if not get_option('libnfs').auto() or have_block
@@ -2835,7 +2835,7 @@ summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     liblzfse.found()}
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
+summary_info += {'libxml2':           libxml2.found()}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   libpmem.found()}
 summary_info += {'libdaxctl support': libdaxctl.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 6610c4dc64..a9a9b8f4c6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -92,6 +92,8 @@ option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
        description: 'libusb support for USB passthrough')
+option('libxml2', type : 'feature', value : 'auto',
+       description: 'libxml2 support for Parallels image format')
 option('linux_io_uring', type : 'feature', value : 'auto',
        description: 'Linux io_uring support')
 option('lzfse', type : 'feature', value : 'auto',
-- 
2.31.1



