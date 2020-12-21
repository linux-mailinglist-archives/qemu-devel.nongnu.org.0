Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A232DFDA4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:39:16 +0100 (CET)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNHH-0004Bv-Ic
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRN-00056H-IS
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRI-0007vW-5A
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so11299396wrr.10
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhISAu6W0agb45aTi8DrVXmQ/KuOq7b6r+QgBkrN5o8=;
 b=pD8juEh4IOcgvGx136DUSh0VtDzpzr2hI0qSd3anCpq1mmNSGVcWAhOMJcwqBWeXm+
 QMLU89Bp+vUkGeamGEKq1e+R3g5PS7GKhKi7r0zjanq61RgAq+rLh5Pry86jR5brldeI
 z9yVNGAt7UVo09fS3caYcUOH2haXfz/aRy2GQ8Ld4+WpEkw367HIRRz6OwAxwRG47byv
 5gg5XmPAwprrXK8UVQ+5zVnCdRwHoEA5g9ZX/sxAFfyiQ1DmUz+TPbtyabq5oSuW0yjb
 ms0VtUXgkxick26DKnglgWczkaslyZlrdp9srGk/o1ZC9lTZw2xS6I5bO/Srum4VGHrv
 AInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qhISAu6W0agb45aTi8DrVXmQ/KuOq7b6r+QgBkrN5o8=;
 b=DlHWY3jTZu9Xf9+p07IHXjSDUJGKpawAVmnfJABsfAie0DhRSuiIzJqZnfT1/l+K4C
 qAnxxqnQ1H9UOTUx6b6cqLzGCwJzOdWRvtH2/hRcJWTxbfHjpHEufj6hCF97aHhOskTC
 9SthA500HIRFbW5LayH+B7cFlomRotqIGbMgHFMFHemogPaqoN9Ng+A5fqrxGjKYasfN
 FupJu17Q0BPlPXt4HKsRb5RuKiw95dR7BfRmFsoLK6kCt+fkNtVYfYa5bgRIIW7mB0Nj
 wwAwppdwrIJlf/scyQsWmJHyC/epgaodcaXDpbLzLHFu4AEJwqK8f7fmwpmU33a2bI0r
 sPyA==
X-Gm-Message-State: AOAM533PH1v3ka/ghXjQ2sRF9Gu1NmAkhiR3fRzeZ7kMvA8/kQgsCaoL
 Sqlpsr54aPFwBqGMOh5h6IZDTPTSsiY=
X-Google-Smtp-Source: ABdhPJwZf0qgCJ1LcR1i53ajrSd7MsHyLvlTW508D+VgB7SOg/qyhDmH3PECZ9VRdb7ZevyAb38wYQ==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr19643737wrw.62.1608561930729; 
 Mon, 21 Dec 2020 06:45:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/55] lzfse: convert to meson
Date: Mon, 21 Dec 2020 15:44:39 +0100
Message-Id: <20201221144447.26161-48-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
 meson.build       | 19 +++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 9166347739..6224279e44 100755
--- a/configure
+++ b/configure
@@ -396,7 +396,7 @@ capstone="auto"
 lzo="auto"
 snappy="auto"
 bzip2="auto"
-lzfse="$default_feature"
+lzfse="auto"
 zstd="$default_feature"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
@@ -1323,9 +1323,9 @@ for opt do
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
@@ -2456,24 +2456,6 @@ EOF
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
 
@@ -6086,11 +6068,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6649,7 +6626,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 02a9f914be..550df12432 100644
--- a/meson.build
+++ b/meson.build
@@ -699,10 +699,21 @@ if not get_option('bzip2').auto() or have_block
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
@@ -2372,7 +2383,7 @@ summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_
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



