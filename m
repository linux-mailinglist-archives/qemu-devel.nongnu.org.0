Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65642EBFE9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:58:39 +0100 (CET)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAGk-0000W1-Ux
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADL-0005QY-LG
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADJ-0003iJ-Fy
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id d13so2637794wrc.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNBRp8oMqIeaYflF+E+oYu7XtoGMv+QswU6VUEezUX8=;
 b=ce0WNTsKyZPmtjlwmtyoX3Yff/j7KUq1wySrfCaXcFCPPU0t3Q0xoxDCb+TcZ0hmHD
 8pMYZMKljFouSqSLUw85MIfF8DxvutOOxFsp/2DjtNWt225Oe+1zxdpURG7dQ8zJC+he
 W9Cw98Yf2y/tUauqomwluL/xFV6Tn5OCP6lo2L3zgq7fAQzi9WuvcvnKwE8/C6g4r8RP
 hTsLRH+j9aIIA6VzUfa3NYQQYHyfrrS0TtBv8Ze3Mkasf5cH5OUGy8xuPElc+woqons5
 +LUgpTAAIANnZqobGmy9lyHSLwYvlWpLM8yC80HQnXK/RRmmqgrbhi/y71Sywa5tpak7
 vCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BNBRp8oMqIeaYflF+E+oYu7XtoGMv+QswU6VUEezUX8=;
 b=DV1pTTkZA/WbiqFnSQ8zKrwKIPh8bgJZyjHw2BXr1nRZIPN8hjwRB3mutDDHUthjoO
 TsYjZHiqjNg45A7TeWrPSd3+XZXYk0WWb5TkHKKlCImHbnZBcXgFVgr5mJH+Aue019iV
 Yc77MfJhTXh9B706LPb319IXttfKCCITsxgBB/rE/SHz8j5xv4RWIc+u7i+2kuZTv+as
 3RslJue2qfK2n1QUGhLXweQAT3pxBu0KzmMCGJJRLjec51cWisPUp7909GV5lYC2Cn86
 1KFnrmm3GuSuIqn29N141nM53RiClAT6F7Y4SHHDKqyoFwdj2aXI8vwyO3533F3So0+r
 tFKA==
X-Gm-Message-State: AOAM531ILQWUlaj2WhQxwikKXlfjYkH8xD6wIU1QYJA1gdQa6Z4j3MmM
 6HH964ifF65a8xiNw0jlC9FnmQIltzvo4Q==
X-Google-Smtp-Source: ABdhPJxX1ew53ES6nxmAMIdLblqKq6OioxNQ/2ipumK0FaXWKYfF4E3sEgtTn8vA+PTO/Y8CXwPVqA==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr4525399wru.327.1609944904303; 
 Wed, 06 Jan 2021 06:55:04 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id s205sm3267770wmf.46.2021.01.06.06.55.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 06:55:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/52] snappy: convert to meson
Date: Wed,  6 Jan 2021 15:54:58 +0100
Message-Id: <20210106145459.413716-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106145459.413716-1-pbonzini@redhat.com>
References: <20210106145459.413716-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 32 ++++----------------------------
 meson.build       | 20 +++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 934cb098aa..63aba41f17 100755
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
@@ -2457,25 +2457,6 @@ EOF
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
 
@@ -6138,11 +6119,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6717,7 +6693,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo \
+        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 34683d5030..8861434721 100644
--- a/meson.build
+++ b/meson.build
@@ -745,9 +745,22 @@ if get_option('vnc').enabled()
                               compile_args: '-DSTRUCT_IOVEC_DEFINED')
   endif
 endif
+
 snappy = not_found
-if 'CONFIG_SNAPPY' in config_host
-  snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
+if not get_option('snappy').auto() or have_system
+  snappy = cc.find_library('snappy', has_headers: ['snappy-c.h'],
+                           required: get_option('snappy'),
+                           static: enable_static)
+endif
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
 
 lzo = not_found
@@ -970,6 +983,7 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -2352,7 +2366,7 @@ summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
-summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
+summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
 summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
diff --git a/meson_options.txt b/meson_options.txt
index 08f0bffeaf..62f2e94f14 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -70,6 +70,8 @@ option('sdl', type : 'feature', value : 'auto',
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



