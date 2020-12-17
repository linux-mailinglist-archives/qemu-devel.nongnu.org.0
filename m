Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D92DCEB6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:46:43 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppru-0002aI-8i
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmR-0004rp-HQ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:04 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmL-0007kr-Tu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:03 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jx16so36893653ejb.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWW3yyZ9XoYXeO9VbTn/wnx0HTEWAUTSGBeXZtoTkcs=;
 b=iGNWJy42fGFyj+iyd1b8FADemgMSE1AOcYE21zmKIzwFZoFmTWv2tn9HVYLTf2GIy7
 77NuGHmVXSrRowVxJzAdyDchwCHfyrRwPvt378fT8/+LsCpujuaDJWLm/CHGr6BMFqii
 t1c58Ov5Tw7zL83c8Bq7GtLI0azV9Xsmd95mmkm3lKNav1FZ9rJ0I8MLkXnTwlJ6vN9y
 IT7cvLURvEvPesHrKJDElM3nULZ1FDsZeSuqf1h4wIV/7uPwMJSgkCDxxg99N7iezhU+
 2S34I0zxtERyc3OZH5HRuN2/RXPbhIBWvdyH/+Jt1lJQkygsr7D9mfIW3nkz+Yl+wXyi
 MWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PWW3yyZ9XoYXeO9VbTn/wnx0HTEWAUTSGBeXZtoTkcs=;
 b=HqQxOgqmtnKJ7006iVYEaIPsYAK9H195g/9MkYSh+tnMjlN5TDbiwwFZ3CQJENswgQ
 QvvUK/9HhREHYOd6JMaJh0hBaadMcKRR9xoHAxe3pLvNVJPjJ8xzsfokXc9RqrIsVO16
 lVyJerBg3hQw4ktSz8/7ZYLNIBT1Em+xWePSZd8pBIajcpaEkMl+Olhig7Y/X4zAFwmy
 8Glyqzz3cRi7BeW/GBGORmgTZN9vceQoCUwIJ4dWIugEPvxoCK0OKu08PhUvJRTKnxfx
 8PC7C0Ux/1KbIpIg1V/Tlrz/pBdFytqRrSY1HGeT/QXx5hHCkO1QSKW/QRCCWxhqy6IH
 /VAw==
X-Gm-Message-State: AOAM532pjTD/djmIzWyXHjS+DlPHce2do9nAIO5J2/qiII7p+j7haP+4
 YRKIIyJ2La4xHE6kHgtVX2tD7Qxav1U=
X-Google-Smtp-Source: ABdhPJym822Up/pvRliNMRsw4QdPBrIToVwdtDwDoz5Xhi/yOSQjOVs6hfTwCsGbA+pEfN0b5IBmTg==
X-Received: by 2002:a17:906:af83:: with SMTP id
 mj3mr14087169ejb.243.1608198056614; 
 Thu, 17 Dec 2020 01:40:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] snappy: convert to meson
Date: Thu, 17 Dec 2020 10:40:37 +0100
Message-Id: <20201217094044.46462-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
 configure         | 32 ++++----------------------------
 meson.build       | 19 +++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index f52f04d0e3..aee27d9cdd 100755
--- a/configure
+++ b/configure
@@ -395,7 +395,7 @@ cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
 lzo="auto"
-snappy="$default_feature"
+snappy="auto"
 bzip2="auto"
 lzfse="$default_feature"
 zstd="$default_feature"
@@ -1316,9 +1316,9 @@ for opt do
   ;;
   --enable-lzo) lzo="enabled"
   ;;
-  --disable-snappy) snappy="no"
+  --disable-snappy) snappy="disabled"
   ;;
-  --enable-snappy) snappy="yes"
+  --enable-snappy) snappy="enabled"
   ;;
   --disable-bzip2) bzip2="disabled"
   ;;
@@ -2458,25 +2458,6 @@ EOF
   fi
 fi
 
-##########################################
-# snappy check
-
-if test "$snappy" != "no" ; then
-    cat > $TMPC << EOF
-#include <snappy-c.h>
-int main(void) { snappy_max_compressed_length(4096); return 0; }
-EOF
-    if compile_prog "" "-lsnappy" ; then
-        snappy_libs='-lsnappy'
-        snappy="yes"
-    else
-        if test "$snappy" = "yes"; then
-            feature_not_found "libsnappy" "Install libsnappy devel"
-        fi
-        snappy="no"
-    fi
-fi
-
 ##########################################
 # lzfse check
 
@@ -6107,11 +6088,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$snappy" = "yes" ; then
-  echo "CONFIG_SNAPPY=y" >> $config_host_mak
-  echo "SNAPPY_LIBS=$snappy_libs" >> $config_host_mak
-fi
-
 if test "$lzfse" = "yes" ; then
   echo "CONFIG_LZFSE=y" >> $config_host_mak
   echo "LZFSE_LIBS=-llzfse" >> $config_host_mak
@@ -6675,7 +6651,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 0310d6d89a..9f6ea65626 100644
--- a/meson.build
+++ b/meson.build
@@ -749,9 +749,19 @@ if get_option('vnc').enabled()
                               compile_args: '-DSTRUCT_IOVEC_DEFINED')
   endif
 endif
-snappy = not_found
-if 'CONFIG_SNAPPY' in config_host
-  snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
+
+snappy = cc.find_library('snappy', has_headers: ['snappy-c.h'],
+                      required: get_option('snappy'),
+                      static: enable_static)
+if snappy.found() and not cc.links('''
+   #include <snappy-c.h>
+   int main(void) { snappy_max_compressed_length(4096); return 0; }''', dependencies: snappy)
+  snappy = not_found
+  if get_option('snappy').enabled()
+    error('could not link libsnappy')
+  else
+    warning('could not link libsnappy, disabling')
+  endif
 endif
 
 lzo = cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
@@ -971,6 +981,7 @@ config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -2352,7 +2363,7 @@ summary_info += {'libssh support':    libssh.found()}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
-summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
+summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
 summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
diff --git a/meson_options.txt b/meson_options.txt
index 00a5ec55bd..e2b7e23887 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -72,6 +72,8 @@ option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
        description: 'SDL Image support for icons')
+option('snappy', type : 'feature', value : 'auto',
+       description: 'snappy compression support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('vnc', type : 'feature', value : 'enabled',
-- 
2.29.2



