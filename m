Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C22DFD49
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:12:59 +0100 (CET)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMrq-0003bT-Ft
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRN-00055v-CS
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRH-0007us-DY
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so11313917wrj.7
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYM1BHiEYpg2iIhSeVE6JX5SY9trbxbH8tEoru3a6xQ=;
 b=fvG7CHL3DN+TN62X/EJYknuDPqCfv765eWZIYs9u8MJhTqEjHw59eZjnoLrzWtJn1l
 M3+8BoLVcCFfWzY19QX3MXWej9BpNMLA8XI20bcxgaSBG99gXDGhujZ7zroCIfjVO0Q1
 7NnvNpJ7iNK1JTAgjOf8Nrx9xcYBHAWA8kfPyQWA3xATZk3LLvmR6RVtiSESLC3iZDgL
 Mb7p38gKuhBK3mkjk+XoISlTUFVAPGAYV69d9jC0GnlPyI4VdPRyR1MHvL2eY7S5JEJF
 TCoc4yt54PcQQb7yQ1O2h8CZM92OR2uauGaNxY0IcpQ/OmvV/6Ag1NY3xxtRHLV1qMto
 T+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uYM1BHiEYpg2iIhSeVE6JX5SY9trbxbH8tEoru3a6xQ=;
 b=OT8wUEvczmDg53aANXCggvVJ+O7nIKpoInr1B6sB7uJuOQfYgXx9LwlX9WPw3QAICK
 08K0KU58qvvkDbKMvZ9QbhoND3B5AHVYyC+O7pQNufLGxXOk8zr7toNAGWp+yjLRSYa4
 XHCqrSXBrx2XRUk/TOLKv9+NYkMnyp+02sM8mCQXgcTDRX5U4WldzEP7xh33F26rlSM4
 BnGT1WUDCNmc79n2dXOEspItGmkMFRkeYSLxRZHIFQLB9lL5dyQ1uyjE9n8Kc3n50cpJ
 CS8IqNojx72iV2d9vE706j0m/Egxkwm4orAHUA+SCWGNxZvXk3EZCA+cvuPx4hrUM/SQ
 cQVg==
X-Gm-Message-State: AOAM533v4U32Y9Xqyaubb8UODlwy42rMNVt7XLy8d3iuyjMYxbCorYQ6
 N+cML4cFWv7/wNT4c8cye5Wta8gjpsY=
X-Google-Smtp-Source: ABdhPJw/bjCEhICr25bxBxgvBoUZz72o22/b/DkNCJRYL0QV2iL6ISTZFH5tcnJmEGGjXV+0Krfonw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr18781461wrq.75.1608561929926; 
 Mon, 21 Dec 2020 06:45:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/55] snappy: convert to meson
Date: Mon, 21 Dec 2020 15:44:38 +0100
Message-Id: <20201221144447.26161-47-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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
 configure         | 32 ++++----------------------------
 meson.build       | 19 +++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index 1574ea8456..9166347739 100755
--- a/configure
+++ b/configure
@@ -394,7 +394,7 @@ cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
 lzo="auto"
-snappy="$default_feature"
+snappy="auto"
 bzip2="auto"
 lzfse="$default_feature"
 zstd="$default_feature"
@@ -1315,9 +1315,9 @@ for opt do
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
@@ -2456,25 +2456,6 @@ EOF
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
 
@@ -6105,11 +6086,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6673,7 +6649,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 2a2f7d0039..02a9f914be 100644
--- a/meson.build
+++ b/meson.build
@@ -753,9 +753,19 @@ if get_option('vnc').enabled()
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
@@ -977,6 +987,7 @@ config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -2359,7 +2370,7 @@ summary_info += {'libssh support':    libssh.found()}
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



