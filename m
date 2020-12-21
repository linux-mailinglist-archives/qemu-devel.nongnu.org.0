Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27292DFDA6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:41:04 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNJ2-0005ZN-2T
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRN-00056k-QQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRJ-0007wa-1B
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so10104429wmz.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uUmqtYiVmUHg53FxTmD1eTlFpsIC4p/LT2B3iZjHHf4=;
 b=tL4Rl5nAuu4G2OQ7aGUamMjXrmT6Zz0oSAVav2Lgm84c2S4GFB4gpsN3FzHSSpLGbt
 aK1iduqwfnYsFwg/HR3pazxC1VjO3S785h5BS4uOUBr+b0/G/9DhqiWNzQ/Z0QNEIP1V
 TGgLFI1mnI9r+4WYLwKuxncUivXfk/66dI651eflYFkAUP3TxWolQofItFMEAtnc+laA
 48OdsFOuHuXvRRpJEWqYRzzHplpAEk2MN+jXwSPjr5OxZyFLK9VzmjCKH8kpMvRk7uhN
 182qiNKfIb73g7uktNxvUke5Fobk6LRgA0juCOD65izZ9DGghGFWzfUTP2sHArVZ5AuM
 HBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uUmqtYiVmUHg53FxTmD1eTlFpsIC4p/LT2B3iZjHHf4=;
 b=VqQhcLQJFPCeJoSfgzuN84BABijfIEVKPC/RkyWNPLjclsUehqjfyNx7/ul8IBWyjZ
 Oc99OK8gajuZMtXMs4VV+kF0xNmDa5QbW8Z0lOs44a724iMiiO1+QYK4RwRY818p/xk4
 NrMo8Do3zdMnp2b6OSFh1pTVCNFS5V4jV0ZgimUvimASeKjQSV3khVRqeFuk1M5RhfiF
 oloDezJ2OSbql3onyIDZnBXKGk3/N9WJ7Dvy/piBIXp/XzjDfxCM47Uf+MflCChLo4h9
 KAwrHupumoGr6plhXmqX90YHmTModlE8Mvdo7pfUEcHlE7cY2KAfuoMunHJb3w2gAEWm
 /Bcg==
X-Gm-Message-State: AOAM532+vGHJjQjJmdx/u5WTFfrm+Pm4OC+RLqpQs0aAETBJ375WURoA
 K7IwarUSkPnFh5srmQJaETHWw9vfQEE=
X-Google-Smtp-Source: ABdhPJx9PZU+j5yMQCfXB+JemL5OBMEO/0Lfa0H04f0dI6/ZHLUERltuy3PpubMJ4HqUM+64WvwR2g==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr10806927wmj.148.1608561931603; 
 Mon, 21 Dec 2020 06:45:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/55] zstd: convert to meson
Date: Mon, 21 Dec 2020 15:44:40 +0100
Message-Id: <20201221144447.26161-49-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 configure             | 30 ++++--------------------------
 meson.build           | 10 ++++++----
 meson_options.txt     |  2 ++
 migration/meson.build |  2 +-
 4 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 6224279e44..0c0eef7713 100755
--- a/configure
+++ b/configure
@@ -397,7 +397,7 @@ lzo="auto"
 snappy="auto"
 bzip2="auto"
 lzfse="auto"
-zstd="$default_feature"
+zstd="auto"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
@@ -1327,9 +1327,9 @@ for opt do
   ;;
   --disable-lzfse) lzfse="disabled"
   ;;
-  --disable-zstd) zstd="no"
+  --disable-zstd) zstd="disabled"
   ;;
-  --enable-zstd) zstd="yes"
+  --enable-zstd) zstd="enabled"
   ;;
   --enable-guest-agent) guest_agent="yes"
   ;;
@@ -2456,23 +2456,6 @@ EOF
   fi
 fi
 
-##########################################
-# zstd check
-
-if test "$zstd" != "no" ; then
-    libzstd_minver="1.4.0"
-    if $pkg_config --atleast-version=$libzstd_minver libzstd ; then
-        zstd_cflags="$($pkg_config --cflags libzstd)"
-        zstd_libs="$($pkg_config --libs libzstd)"
-        zstd="yes"
-    else
-        if test "$zstd" = "yes" ; then
-            feature_not_found "libzstd" "Install libzstd devel"
-        fi
-        zstd="no"
-    fi
-fi
-
 ##########################################
 # libseccomp check
 
@@ -6068,12 +6051,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$zstd" = "yes" ; then
-  echo "CONFIG_ZSTD=y" >> $config_host_mak
-  echo "ZSTD_CFLAGS=$zstd_cflags" >> $config_host_mak
-  echo "ZSTD_LIBS=$zstd_libs" >> $config_host_mak
-fi
-
 if test "$seccomp" = "yes"; then
   echo "CONFIG_SECCOMP=y" >> $config_host_mak
   echo "SECCOMP_CFLAGS=$seccomp_cflags" >> $config_host_mak
@@ -6627,6 +6604,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Dzstd=$zstd \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 550df12432..b4313951a6 100644
--- a/meson.build
+++ b/meson.build
@@ -380,9 +380,10 @@ if not get_option('libiscsi').auto() or have_block
                          method: 'pkg-config', static: enable_static)
 endif
 zstd = not_found
-if 'CONFIG_ZSTD' in config_host
-  zstd = declare_dependency(compile_args: config_host['ZSTD_CFLAGS'].split(),
-                            link_args: config_host['ZSTD_LIBS'].split())
+if not get_option('zstd').auto() or have_block
+  zstd = dependency('libzstd', version: '>=1.4.0',
+                    required: get_option('zstd'),
+                    method: 'pkg-config', static: enable_static)
 endif
 gbm = not_found
 if 'CONFIG_GBM' in config_host
@@ -1009,6 +1010,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
+config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
@@ -2384,7 +2386,7 @@ summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     liblzfse.found()}
-summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
+summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
 summary_info += {'memory allocator':  get_option('malloc')}
diff --git a/meson_options.txt b/meson_options.txt
index f74a3d78c4..5a1de9b1fe 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -92,6 +92,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
+option('zstd', type : 'feature', value : 'auto',
+       description: 'zstd compression support')
 option('fuse', type: 'feature', value: 'auto',
        description: 'FUSE block device export')
 option('fuse_lseek', type : 'feature', value : 'auto',
diff --git a/migration/meson.build b/migration/meson.build
index 980e37865c..c783f2f2ae 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -29,6 +29,6 @@ softmmu_ss.add(files(
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
-softmmu_ss.add(when: 'CONFIG_ZSTD', if_true: [files('multifd-zstd.c'), zstd])
+softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
-- 
2.29.2



