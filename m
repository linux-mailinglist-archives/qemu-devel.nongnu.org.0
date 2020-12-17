Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AB2DCECE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:49:49 +0100 (CET)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpput-00058t-KE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmJ-0004hC-A2
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:56 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmH-0007jL-8G
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id r5so27902748eda.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuJnGzlfTynxqBYyyMuDb97zZtJ4PvFu/Kx1k6aX2e4=;
 b=r09c4Z18dGQeRpsexkBC2u9q/L0s5EaI28b+A+2N0/O0sc11FGFgRbYevds8brwbTN
 2lqafe+cbJaDJmRcccMefZhI27ADU+NAq6UEvqRbvjvIwenM84tU142cnGp2vS23a/k1
 RZQx8fRPafGWbzTyrpMPvJflF1P2OJkPP0s8ydUicPdhbDnmGQjKPdodd/U3IIPNQFTN
 CrtivhTa3XmShIfIK0ugSmFo7ByyPYRqq0DTaMheSzulBcNz5l1zRd4h74un1PJB/C/7
 KqgOackBqRdryhZ17lYVrJjrutf5pLrl0JsJPKzNs5aQ/vfxSjWCRMviJ4eDEHmd5P2W
 uCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wuJnGzlfTynxqBYyyMuDb97zZtJ4PvFu/Kx1k6aX2e4=;
 b=fCEcKT+mrkGlJFmdBSYTZxUdMtQvVBF+XN5NYBKLmTLRhdogzKMR7Vb66cioU9LkGd
 KQPWD/zdVKcHopAOd51e37SAM5+nvHcEADfep4BhPBfpR+so7E12TxVXP/4ZSrK2aeHE
 /ZrB6f77k9BBLiqaY9BqVG+xnVtPSAslowyqtTMb01s9jW8xkwQIFJKANJ98Btq46nWn
 RcC1YD4u2Bptn4k8U8k2EvVdr09CWLNFcjnTNXsbZHwr/IqSeL3qKcA/K2WhCeT7iytH
 mGrolpmTroeqGY1kr0dhw8/Xc+P8B5hZ5ColpSWFJYxctQS/YthikAkE/YhNrSqcGEOf
 JPjQ==
X-Gm-Message-State: AOAM53383O6sRynr38EiCphNX6rIjtG4e4LwB8pyQ2aESoqJxX5ZxIXh
 LJFwCZ78By/lh/KSrpYa2X/0o7SESag=
X-Google-Smtp-Source: ABdhPJwEEvOyBeqpZce4Cz9ORbhdjwOq/S2Gxd1/Mpb6uwPEVKq7MwIwP4uYutbvLV7tM0DD2PlaWA==
X-Received: by 2002:a05:6402:1696:: with SMTP id
 a22mr38116889edv.385.1608198051601; 
 Thu, 17 Dec 2020 01:40:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/18] bzip2: convert to meson
Date: Thu, 17 Dec 2020 10:40:31 +0100
Message-Id: <20201217094044.46462-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
 meson.build       | 18 +++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/configure b/configure
index 5529ac4b32..082ac3bf35 100755
--- a/configure
+++ b/configure
@@ -396,7 +396,7 @@ avx2_opt="$default_feature"
 capstone="auto"
 lzo="$default_feature"
 snappy="$default_feature"
-bzip2="$default_feature"
+bzip2="auto"
 lzfse="$default_feature"
 zstd="$default_feature"
 guest_agent="$default_feature"
@@ -1320,9 +1320,9 @@ for opt do
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
@@ -2496,24 +2496,6 @@ EOF
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
 
@@ -6238,11 +6220,6 @@ if test "$snappy" = "yes" ; then
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
@@ -6825,7 +6802,7 @@ NINJA=$ninja $meson setup \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs \
+        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index 409b958a7f..9ba8eecf37 100644
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
@@ -2298,7 +2310,7 @@ summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG
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



