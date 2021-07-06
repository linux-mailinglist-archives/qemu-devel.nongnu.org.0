Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F253BC96C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:20:41 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iC0-0008UJ-DU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htx-00012y-6m
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htu-0002LX-KD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so1823181wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEd6aN+rbZ1x2CIJyx9n+fGMegRkSbQEApN0YpiBx2I=;
 b=iq8D/3QfklCVNlshj39KqH5yS1LUFUNIK8k8YCYKsZ41OsucoCA+odFs+uAun3K8me
 ptdS2Ifk+wowVfWZ+6c7gri66YPE3UkGBJ4+GYB6JfKpMaXs9wAt7TEWJn0W7NPVzr66
 OY0wuinm5LMrgL7ZzhqhKxdTdeGyy7jyhpjJUiskwqRDcC25EpVwlp0eJ+hMJAQUktom
 puOIjNJeNVXJRK+fqOgA0qI+Irh/SRu4PftyalreuD5JjwzLUuGLUbB/CFtfdGouFaeC
 TTYFRdLXSqC3IgEeqM+v5nDSsFRJ5TrrR+eRHqe6BGWcs3RzKOfMXTaqehukgt+lBmVI
 BqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hEd6aN+rbZ1x2CIJyx9n+fGMegRkSbQEApN0YpiBx2I=;
 b=PBmqwfNgap7iNDjw9lk1QR8O7isWmdIhLUpQfNfJfsEhMxOQzyKOyZ5ZUJXLx+xUif
 +rh7+Fy5Oq1fK/rtXkF4Nsmh94FhZSC66TIo1HMjwIMkRuvofO2yhJCHhKfJxzRP+lrf
 4gWnhT2QC/gm8PY1qwAdsCcoNRH9fXAu8wG0hD5SUzP0vn4QUTjYdjTyOaelTmV9UTYZ
 BRO+7dlRMS4pU5ObiC/kihSmfMvpOv421Jwez8QoiZRyC7sITonHmFAfoF1Ptk66uItC
 tQ2o8Rs4+e6UwKyh0umFfJjzu2wh+3sZO+94Mh1zIAFpyv519LKriKnJMN9fm+HG8kLU
 chJA==
X-Gm-Message-State: AOAM531dv8vK/q/wgtwQXORK2ZVYHQMXnlFbt0fQ+LOVk5Y7cHCmbmpV
 sf+b+CHGHlQDdRQiOw8yXHzg8k6DqdI=
X-Google-Smtp-Source: ABdhPJwilc6073AJnhsrv5wJ5Krmmf8UhBZuX3WMIzgm3Up+uUeh/sw0iW2NliKdrCrkKoIkDT+6vg==
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr1378283wme.188.1625565717149; 
 Tue, 06 Jul 2021 03:01:57 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/40] configure, meson: convert libxml2 detection to meson
Date: Tue,  6 Jul 2021 12:01:23 +0200
Message-Id: <20210706100141.303960-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
 configure         | 29 ++++-------------------------
 meson.build       |  8 ++++----
 meson_options.txt |  2 ++
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index 4e016f671c..341b74dd5e 100755
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
@@ -5636,12 +5621,6 @@ if test "$have_rtnetlink" = "yes" ; then
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
@@ -6050,7 +6029,7 @@ if test "$skip_meson" = no; then
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse -Dlibxml2=$libxml2 \
         -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
diff --git a/meson.build b/meson.build
index 5304744f2e..1216ac8f72 100644
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
@@ -2821,7 +2821,7 @@ summary_info += {'bzip2 support':     libbzip2.found()}
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



