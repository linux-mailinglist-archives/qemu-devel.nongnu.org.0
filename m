Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1322DCED2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:51:01 +0100 (CET)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppw4-000617-A9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmT-0004ta-B7
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:05 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmN-0007lD-Ec
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:05 -0500
Received: by mail-ed1-x529.google.com with SMTP id p22so27891438edu.11
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZF+riI0bftey6nWzva3b4atB2nE4nkBmnvVQo3cJOM=;
 b=pT6/QpU1Hb+04i26hYjRmgz4/ZntGEcG07ZX5aJHstRRbwFED7QNuAi06VjzR244OW
 p4njWkxCOza7NlHlA9Rfv7BVbnQWn6oMMbJWA64hCaip3iOgIDwZkuX/8zK0Kg5h4YLa
 1BiFSX/v/ydx23UYIbR2lnxFqLbjMWJ5r+3vVl3ouR/7bNNuOJ2Al3zkg1Dq8y1XxHbg
 6j9XD5lua1Ws1k0tSG2fb79yWKzikDcPVU1gh8FHNIQBWaFm0pfQcIAgJ85LfEOBRjfY
 oKiBFo3uuxc4ATskBMrZ6It18hxI9Y/Z6/Fd3vNcs42fA1X/AO3no22PqwaN0/ZftElX
 mKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eZF+riI0bftey6nWzva3b4atB2nE4nkBmnvVQo3cJOM=;
 b=X3if2ZDtSRqJb4s0JffGqDvmEgehKm7lscJKo+06fKbpOChnmxxf2NawMbPWAlN1iV
 Siu0M2uOBxpgxC67/SFjbYg8hGFvYZKXOZgyd+OJ/yOAd67b301OVPyyc+SNTf8c/ZeX
 ttKoznkvRURZevM2hBmypE9jJJGnd/cLI6PJxRW55FdjuIGnz8jByoSBtTbdYASeq2Za
 GFDj2pbxvB229tr9kxacHY7Lm3d9Bdo7r1LYI26Dl7A7ffdQ/q6wSZJYTjBXessHzAx1
 OQ5Bsc7dQv7CWTF0fE6+5p+tyNVLCqxfWkViFc5mN/CJpaEeTA8kWRD+UYSPKXLx435Y
 DY2Q==
X-Gm-Message-State: AOAM531z4w1ZDUqHLQA0TBZaPTVaavz5vRMEVYmdnmZsuWJUcYFjDCJF
 tYdi+xvIjtYT6LSZ2py7OJ1is3HnmUU=
X-Google-Smtp-Source: ABdhPJxpXwozskKdhUghI2TFBr8r57GO0FvfnkqyWpwPPBaJe6oqH88dZfMo2zynSdeX721roONNjA==
X-Received: by 2002:aa7:cf85:: with SMTP id z5mr23326532edx.274.1608198058232; 
 Thu, 17 Dec 2020 01:40:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] zstd: convert to meson
Date: Thu, 17 Dec 2020 10:40:39 +0100
Message-Id: <20201217094044.46462-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index ea5650acca..649da881a2 100755
--- a/configure
+++ b/configure
@@ -398,7 +398,7 @@ lzo="auto"
 snappy="auto"
 bzip2="auto"
 lzfse="auto"
-zstd="$default_feature"
+zstd="auto"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
@@ -1328,9 +1328,9 @@ for opt do
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
@@ -2458,23 +2458,6 @@ EOF
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
 
@@ -6070,12 +6053,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6629,6 +6606,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Dzstd=$zstd \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index c02d9c3e1a..93a95d7a7f 100644
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
+  zstd = dependency('zstd', version: '>=1.4.0',
+                    required: get_option('zstd'),
+                    method: 'pkg-config', static: enable_static)
 endif
 gbm = not_found
 if 'CONFIG_GBM' in config_host
@@ -1003,6 +1004,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
+config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
@@ -2377,7 +2379,7 @@ summary_info += {'lzo support':       lzo.found()}
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



