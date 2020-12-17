Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C92DCEA2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:45:25 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppqe-0000Ye-Nn
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmT-0004tY-9D
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:05 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmM-0007l3-OF
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:04 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b2so27969254edm.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNFT69bkW3xmjtHMNViAC1UFouy8o01pGCWful8WbCI=;
 b=IrWwVIKiRDrqY5Mv6y+GJPl1LNOsU2zCFo08D5NUy2XZRPvHATI66AO553OWoS6xLc
 3lMjXDRm0FfLbQkpXguNLBTrz2Idhd4zIOfkfbSZXkI/5hTnNqgwehZkKeXKvuEKGqda
 hEY57m2x5JyfvM/WUbXNy8ig8CBR/g8YaMu/X76Gj94OfOHSFNkbk5hPE6QePeZD6ZJ4
 xmUS7K1DsJzXVeJcOjPxdqExQKm62JX9mZ+Jfekpi+2pXpccmCHcdUc5po2JufasZ2og
 E1GXk+G0wMf6cN2XdJKRUht/ZxgSzKivv6bxa0eLNawmBegXjAZ9Rl0mSZsH81l38HL6
 7ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MNFT69bkW3xmjtHMNViAC1UFouy8o01pGCWful8WbCI=;
 b=Z9AATRZg9LVkXsLq75VjT2YacobTRmxphCcD+hnwjSTSnmAxA7SGAAmUiAqsBPb1DW
 yJba/3qVob5XZj8prLG8+4zZWR/Ke9xxaAPCJTSmIPOhHcoTsU9Th44N8a8NaISpQidL
 EzfdOH+1n8zDdy/L5MJ35bCdEmr8wb0LWPhgIARTR7BUnx8ABQAItZnDxr2f0TET+eJW
 jN9OLbaZlth6SO5iwCmJrVaQn3lZvzGQ5c2YM//J+gze78dVjYeYoJsVteixl2965MqK
 7I1oVMiZjzXAUwE4qOX1P5hq42CDpRgeNVJq1ZT77LcXnmkuvS5UrMXEYSxXPJ7tM4KX
 QOEA==
X-Gm-Message-State: AOAM5337owowZOyMhpweKvNEDf9ra5jyVlJwyBDbxE9A7OYrqT+55iiJ
 FrP8SJOtYYHkiDyC3tvQBPPXstoYvSI=
X-Google-Smtp-Source: ABdhPJwkExypWW2s/OEw6vyUvcNV0Eu8llDU2HQjteEaq/anp0Ed55lL6AWO3xrJfwM8UcdtJn3+kg==
X-Received: by 2002:a05:6402:307c:: with SMTP id
 bs28mr38123921edb.186.1608198057403; 
 Thu, 17 Dec 2020 01:40:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/18] lzfse: convert to meson
Date: Thu, 17 Dec 2020 10:40:38 +0100
Message-Id: <20201217094044.46462-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
 configure         | 31 ++++---------------------------
 meson.build       | 19 +++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index aee27d9cdd..ea5650acca 100755
--- a/configure
+++ b/configure
@@ -397,7 +397,7 @@ capstone="auto"
 lzo="auto"
 snappy="auto"
 bzip2="auto"
-lzfse="$default_feature"
+lzfse="auto"
 zstd="$default_feature"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
@@ -1324,9 +1324,9 @@ for opt do
   ;;
   --enable-bzip2) bzip2="enabled"
   ;;
-  --enable-lzfse) lzfse="yes"
+  --enable-lzfse) lzfse="enabled"
   ;;
-  --disable-lzfse) lzfse="no"
+  --disable-lzfse) lzfse="disabled"
   ;;
   --disable-zstd) zstd="no"
   ;;
@@ -2458,24 +2458,6 @@ EOF
   fi
 fi
 
-##########################################
-# lzfse check
-
-if test "$lzfse" != "no" ; then
-    cat > $TMPC << EOF
-#include <lzfse.h>
-int main(void) { lzfse_decode_scratch_size(); return 0; }
-EOF
-    if compile_prog "" "-llzfse" ; then
-        lzfse="yes"
-    else
-        if test "$lzfse" = "yes"; then
-            feature_not_found "lzfse" "Install lzfse devel"
-        fi
-        lzfse="no"
-    fi
-fi
-
 ##########################################
 # zstd check
 
@@ -6088,11 +6070,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$lzfse" = "yes" ; then
-  echo "CONFIG_LZFSE=y" >> $config_host_mak
-  echo "LZFSE_LIBS=-llzfse" >> $config_host_mak
-fi
-
 if test "$zstd" = "yes" ; then
   echo "CONFIG_ZSTD=y" >> $config_host_mak
   echo "ZSTD_CFLAGS=$zstd_cflags" >> $config_host_mak
@@ -6651,7 +6628,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 9f6ea65626..c02d9c3e1a 100644
--- a/meson.build
+++ b/meson.build
@@ -695,10 +695,21 @@ if not get_option('bzip2').auto() or have_block
     endif
   endif
 endif
-liblzfse = not_found
-if 'CONFIG_LZFSE' in config_host
-  liblzfse = declare_dependency(link_args: config_host['LZFSE_LIBS'].split())
+
+liblzfse = cc.find_library('lzfse', has_headers: ['lzfse.h'],
+                      required: get_option('lzfse'),
+                      static: enable_static)
+if liblzfse.found() and not cc.links('''
+   #include <lzfse.h>
+   int main(void) { lzfse_decode_scratch_size(); return 0; }''', dependencies: liblzfse)
+  liblzfse = not_found
+  if get_option('lzfse').enabled()
+    error('could not link liblzfse')
+  else
+    warning('could not link liblzfse, disabling')
+  endif
 endif
+
 oss = not_found
 if 'CONFIG_AUDIO_OSS' in config_host
   oss = declare_dependency(link_args: config_host['OSS_LIBS'].split())
@@ -2365,7 +2376,7 @@ summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
-summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
+summary_info += {'lzfse support':     liblzfse.found()}
 summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
diff --git a/meson_options.txt b/meson_options.txt
index e2b7e23887..f74a3d78c4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('lzfse', type : 'feature', value : 'auto',
+       description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
-- 
2.29.2



