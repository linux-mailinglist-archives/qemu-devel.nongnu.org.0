Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE82DFD7C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:26:21 +0100 (CET)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN4m-0007zv-9Y
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRI-0004uu-PQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:32 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007r7-HE
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:32 -0500
Received: by mail-wm1-x334.google.com with SMTP id r4so11156634wmh.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MqJQF5mR+4cetOd5KHLJPsleSno/7cp2ZMdnZoPO5/4=;
 b=J/ZoQpZsZ/TifmfGKA+VR3HkyMTDr5q6wV24lFxOhF6U08Lwz8DMW7Ex/Ukr8ktKqq
 i4DZUX3mLaYv7sMUkNT5f3j0ZBLXOBKJIXE7xrBilcD9ye/+RTzoHgIOxOUOLbQ0I3ZZ
 I4fIjXVS24Fxf0svepN1V6aNJYc5vc/A5MW31EUpZWMMKtJRiRMNss3D9JEEobqXP0vb
 TLbPX5iT9co20/YUD3ZHOg1d+cGAXbRxkOtjpWc/tG/8R0pALrLfKcgFazaeFUsqYa+b
 WWFNsu/5h0AwWuLsD8aYbtPWPdQ1xz5QT/aCWB9clnlP6tZUGB3DNtcXXKfSrnoestWX
 eUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MqJQF5mR+4cetOd5KHLJPsleSno/7cp2ZMdnZoPO5/4=;
 b=SHDrzQObSWD60BtOrxGZ5cZYor9RPuAXCB9VXBAd3cwxEV8Z5P/8JDUdrdkbpWIxxj
 BNah2YVganWvTqEXaxtB7cAJic/M8enpbZ1+00e8uiqw0ZdZFzoI0cElNa7M1YJgNcQW
 5l/9keNOGP4rZdSjzrQVPlnIbJ+xptjTxLOpB5RrUOosxa7M7pR9Lh1pr/RURXyqBe+1
 CgIQm7rdJGgdoKlsiVrB5tbY/5pS4mHyt7a2tyrV7dY1OI4A1ugVXdjBrOiAMnm2J6SG
 Y11FBgIAg26z8JgmuU9CM28rCSkGceFjuAoFsQmMYxFBnuUMBSjfwDOwhWGgsyhazKnl
 gtlw==
X-Gm-Message-State: AOAM532xHXVE+9/8fnziE922Vxog+5pYatipcL5NGiDAppa683ix7Q1Y
 OyIWdeeHJSi+moPWPNdojuRWv031egk=
X-Google-Smtp-Source: ABdhPJxkKK64+K4IhQOGDkbDN5OmejGvXZ34nv5ZG+lxDFqjrF4l7MX27AFeY8PlXujnQcmyYmPakg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr10806460wmj.148.1608561924954; 
 Mon, 21 Dec 2020 06:45:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/55] bzip2: convert to meson
Date: Mon, 21 Dec 2020 15:44:32 +0100
Message-Id: <20201221144447.26161-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
 configure         | 31 ++++---------------------------
 meson.build       | 18 +++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/configure b/configure
index b7644cfbd9..3d65c1e196 100755
--- a/configure
+++ b/configure
@@ -395,7 +395,7 @@ avx2_opt="$default_feature"
 capstone="auto"
 lzo="$default_feature"
 snappy="$default_feature"
-bzip2="$default_feature"
+bzip2="auto"
 lzfse="$default_feature"
 zstd="$default_feature"
 guest_agent="$default_feature"
@@ -1319,9 +1319,9 @@ for opt do
   ;;
   --enable-snappy) snappy="yes"
   ;;
-  --disable-bzip2) bzip2="no"
+  --disable-bzip2) bzip2="disabled"
   ;;
-  --enable-bzip2) bzip2="yes"
+  --enable-bzip2) bzip2="enabled"
   ;;
   --enable-lzfse) lzfse="yes"
   ;;
@@ -2494,24 +2494,6 @@ EOF
     fi
 fi
 
-##########################################
-# bzip2 check
-
-if test "$bzip2" != "no" ; then
-    cat > $TMPC << EOF
-#include <bzlib.h>
-int main(void) { BZ2_bzlibVersion(); return 0; }
-EOF
-    if compile_prog "" "-lbz2" ; then
-        bzip2="yes"
-    else
-        if test "$bzip2" = "yes"; then
-            feature_not_found "libbzip2" "Install libbzip2 devel"
-        fi
-        bzip2="no"
-    fi
-fi
-
 ##########################################
 # lzfse check
 
@@ -6236,11 +6218,6 @@ if test "$snappy" = "yes" ; then
   echo "SNAPPY_LIBS=$snappy_libs" >> $config_host_mak
 fi
 
-if test "$bzip2" = "yes" ; then
-  echo "CONFIG_BZIP2=y" >> $config_host_mak
-  echo "BZIP2_LIBS=-lbz2" >> $config_host_mak
-fi
-
 if test "$lzfse" = "yes" ; then
   echo "CONFIG_LZFSE=y" >> $config_host_mak
   echo "LZFSE_LIBS=-llzfse" >> $config_host_mak
@@ -6823,7 +6800,7 @@ NINJA=$ninja $meson setup \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs \
+        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index db52ac6bdf..66e35598ce 100644
--- a/meson.build
+++ b/meson.build
@@ -654,8 +654,20 @@ if 'CONFIG_LIBSSH' in config_host
                               link_args: config_host['LIBSSH_LIBS'].split())
 endif
 libbzip2 = not_found
-if 'CONFIG_BZIP2' in config_host
-  libbzip2 = declare_dependency(link_args: config_host['BZIP2_LIBS'].split())
+if not get_option('bzip2').auto() or have_block
+  libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
+                             required: get_option('bzip2'),
+                             static: enable_static)
+  if libbzip2.found() and not cc.links('''
+     #include <bzlib.h>
+     int main(void) { BZ2_bzlibVersion(); return 0; }''', dependencies: libbzip2)
+    libbzip2 = not_found
+    if get_option('bzip2').enabled()
+      error('could not link libbzip2')
+    else
+      warning('could not link libbzip2, disabling')
+    endif
+  endif
 endif
 liblzfse = not_found
 if 'CONFIG_LZFSE' in config_host
@@ -2301,7 +2313,7 @@ summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
 summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
-summary_info += {'bzip2 support':     config_host.has_key('CONFIG_BZIP2')}
+summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
 summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
diff --git a/meson_options.txt b/meson_options.txt
index b5d84bb88b..fd16f3b399 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,6 +42,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
 
 option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
+option('bzip2', type : 'feature', value : 'auto',
+       description: 'bzip2 support for DMG images')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
-- 
2.29.2



