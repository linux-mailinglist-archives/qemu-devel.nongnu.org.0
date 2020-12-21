Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F9D2DFD3F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:09:18 +0100 (CET)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMoH-0008NX-4N
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRL-00051a-JT
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:35 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRG-0007un-Eq
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id x22so10081356wmc.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YskNFeL4B91Ml00lS/fJmS33X5P96iW79FRphupRrWk=;
 b=e4F89QkCH5JhwsUUpgBMJfGYyi93dPK6F+HtN0EZ2+jdgQtCHJba0b2FLa/Urg8hAL
 NX060dtRtph0s38aSktq8nz9EfxKGaKZrKo3Mz2kRs9ttTFzYckvZRYrufOe+qtXsEyV
 fsHzZmTqCwcVj/J/NExz2kGpbp1iAlfUPoKeFKUPYIUZzx+QcDXLpyxnk1gfXYW7ZKB1
 94D8nXT/2W69LlEK9EkBxlkRoTNb7FsVsU2qRbOyE+UbDoKiyBRN66UQ03dPnOykrvgC
 MtBs0+RbhVTFARY9I7uZiny2lFOADn9R1uunHg+RkE6aJoJz81BrydRQxbsdb2OlKO7L
 DidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YskNFeL4B91Ml00lS/fJmS33X5P96iW79FRphupRrWk=;
 b=pd9irSSc8R1Ahdc0KZ2kfzxol8FYfGaIV/N8YFY+rTwI9JTewbPJb3+jPgBdJP22Py
 tZedGrJ7zTDsRDfUSAajsE/3u6wWVSjax6ek0MeU8TpfOwOUOBLpl3uvfC0VQDyyvugz
 DKpRdNl2phyipjKJt4WSS5VqSFA7bPs53pNRxtPumrQoLqLobelXyoht8dUFjLAa/4gC
 inBlAk80uzguop6TNkEgBSWTA/isPfyvy6Bk3llwkDNVbWmw0kUm5w2gLBxK9Qtm4pAB
 K3gajjMHxeIHxgKy9fsmkK1NaOU61XwuA2DDphgswYRTRrmQiARld87cNHg7qTwHcjvM
 Ducg==
X-Gm-Message-State: AOAM5307ivRAkOB0/TvLbP+sQwcnh4kK+XwuzH57TNS/ru2NvGXBqcGB
 FPCnl6LH1PrkFT7Ce5BvBDVqv1O0BkU=
X-Google-Smtp-Source: ABdhPJz6MgGCl61CnBw4jOKNRiHCkxfrfuFMSwnrj3TTzFmbdPiiDZkCAsuoIdpHDViO7cv8Vyf5gA==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr17076993wme.99.1608561929161; 
 Mon, 21 Dec 2020 06:45:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/55] lzo: convert to meson
Date: Mon, 21 Dec 2020 15:44:37 +0100
Message-Id: <20201221144447.26161-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
 meson.build       | 20 ++++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index a2e4796053..1574ea8456 100755
--- a/configure
+++ b/configure
@@ -393,7 +393,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
-lzo="$default_feature"
+lzo="auto"
 snappy="$default_feature"
 bzip2="auto"
 lzfse="$default_feature"
@@ -1311,9 +1311,9 @@ for opt do
   ;;
   --disable-zlib-test)
   ;;
-  --disable-lzo) lzo="no"
+  --disable-lzo) lzo="disabled"
   ;;
-  --enable-lzo) lzo="yes"
+  --enable-lzo) lzo="enabled"
   ;;
   --disable-snappy) snappy="no"
   ;;
@@ -2456,25 +2456,6 @@ EOF
   fi
 fi
 
-##########################################
-# lzo check
-
-if test "$lzo" != "no" ; then
-    cat > $TMPC << EOF
-#include <lzo/lzo1x.h>
-int main(void) { lzo_version(); return 0; }
-EOF
-    if compile_prog "" "-llzo2" ; then
-        lzo_libs="-llzo2"
-        lzo="yes"
-    else
-        if test "$lzo" = "yes"; then
-            feature_not_found "liblzo2" "Install liblzo2 devel"
-        fi
-        lzo="no"
-    fi
-fi
-
 ##########################################
 # snappy check
 
@@ -6124,11 +6105,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$lzo" = "yes" ; then
-  echo "CONFIG_LZO=y" >> $config_host_mak
-  echo "LZO_LIBS=$lzo_libs" >> $config_host_mak
-fi
-
 if test "$snappy" = "yes" ; then
   echo "CONFIG_SNAPPY=y" >> $config_host_mak
   echo "SNAPPY_LIBS=$snappy_libs" >> $config_host_mak
@@ -6697,7 +6673,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 92fe7007ef..2a2f7d0039 100644
--- a/meson.build
+++ b/meson.build
@@ -757,10 +757,21 @@ snappy = not_found
 if 'CONFIG_SNAPPY' in config_host
   snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
 endif
-lzo = not_found
-if 'CONFIG_LZO' in config_host
-  lzo = declare_dependency(link_args: config_host['LZO_LIBS'].split())
+
+lzo = cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
+                      required: get_option('lzo'),
+                      static: enable_static)
+if lzo.found() and not cc.links('''
+   #include <lzo/lzo1x.h>
+   int main(void) { lzo_version(); return 0; }''', dependencies: lzo)
+  lzo = not_found
+  if get_option('lzo').enabled()
+    error('could not link liblzo2')
+  else
+    warning('could not link liblzo2, disabling')
+  endif
 endif
+
 rdma = not_found
 if 'CONFIG_RDMA' in config_host
   rdma = declare_dependency(link_args: config_host['RDMA_LIBS'].split())
@@ -945,6 +956,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_opti
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
+config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
@@ -2346,7 +2358,7 @@ summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    libssh.found()}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
+summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
diff --git a/meson_options.txt b/meson_options.txt
index 630c9dceb7..00a5ec55bd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('lzo', type : 'feature', value : 'auto',
+       description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('sdl', type : 'feature', value : 'auto',
-- 
2.29.2



